Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122B514AEDD
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 06:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgA1FP2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 00:15:28 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18943 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgA1FP2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 00:15:28 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e2fc3600000>; Mon, 27 Jan 2020 21:15:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 27 Jan 2020 21:15:27 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 27 Jan 2020 21:15:27 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 05:15:27 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Jan 2020 05:15:27 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e2fc36d0000>; Mon, 27 Jan 2020 21:15:26 -0800
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH] ALSA: hda: Reset stream if DMA RUN bit not cleared
Date:   Tue, 28 Jan 2020 10:45:08 +0530
Message-ID: <20200128051508.26064-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580188513; bh=LnMsVEXJSVOaTH274LZlAyN6+SbN5kZnEjHVHfvY1Qk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=XpCBLQUbB+N/CsLzxbpSRj5bkukcmZxIkpDUYLhIIURCZEAZaFe6/0Q38WjiFwS13
         /coy2d0MllOHPNav7vuZMfQLEc1uPZGvxKzUSh6LWkT1ja1ZSVskliC9HMceFkSxtF
         g4fUujrpM3sTRKS57xrHB5VzmKt6FkRcr9yZHh8Jf83Zrk5I0quCRcUkXTJM+Gxy+s
         ONP5bJAVUnn51CuwrNFayURBzSj8Xzx/PhPltdvgOZHjEEuAAjYe4zUTV2GSJncmEe
         W8QrGYQv7LZWfgfsdCRm3CtXeUeYjqMpNB7pkRafEABQAuelD+ajixkmk355/DuBRg
         lK4AI2pd8xW4Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra HDA has FIFO size which can hold upto 10 audio frames to support
DVFS. When HDA DMA RUN bit is set to 0 to stop the stream, the DMA RUN
bit will be cleared to 0 only after transferring all the remaining audio
frames queued up in the fifo. This is not in sync with spec which states
the controller will stop transmitting(output) in the beginning of the
next frame for the relevant stream.

The above behavior with Tegra HDA was resulting in machine check error
during the system suspend flow with active audio playback with below kernel
error logs.
[ 33.524583] mc-err: [mcerr] (hda) csr_hdar: EMEM address decode error
[ 33.531088] mc-err: [mcerr] status = 0x20000015; addr = 0x00000000
[ 33.537431] mc-err: [mcerr] secure: no, access-type: read, SMMU fault: none

This was due to the fifo has more than one audio frame when the DMA
RUN bit is set to 0 during system suspend flow and the timeout handling in
snd_hdac_stream_sync() was not designed to handle this scenario. So the
DMA will continue running even after timeout hit until all remaining
audio frames in the fifo are transferred, but the suspend flow will try
to reset the controller and turn off the hda clocks without the knowledge
of the DMA is still running and could result in mc-err.

The above issue can be resolved by doing stream reset with the help of
snd_hdac_stream_reset() which would ensure the DMA RUN bit is cleared
if the timeout was hit in snd_hdac_stream_sync().

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/hda/hdac_stream.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 682ed39f79b0..890ff1b7a878 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -629,20 +629,27 @@ void snd_hdac_stream_sync(struct hdac_stream *azx_dev, bool start,
 		nwait = 0;
 		i = 0;
 		list_for_each_entry(s, &bus->stream_list, list) {
-			if (streams & (1 << i)) {
-				if (start) {
-					/* check FIFO gets ready */
-					if (!(snd_hdac_stream_readb(s, SD_STS) &
-					      SD_STS_FIFO_READY))
-						nwait++;
-				} else {
-					/* check RUN bit is cleared */
-					if (snd_hdac_stream_readb(s, SD_CTL) &
-					    SD_CTL_DMA_START)
-						nwait++;
+			if (!(streams & (1 << i++)))
+				continue;
+
+			if (start) {
+				/* check FIFO gets ready */
+				if (!(snd_hdac_stream_readb(s, SD_STS) &
+				      SD_STS_FIFO_READY))
+					nwait++;
+			} else {
+				/* check RUN bit is cleared */
+				if (snd_hdac_stream_readb(s, SD_CTL) &
+				    SD_CTL_DMA_START) {
+					nwait++;
+					/*
+					 * Perform stream reset if DMA RUN
+					 * bit not cleared within given timeout
+					 */
+					if (timeout == 1)
+						snd_hdac_stream_reset(s);
 				}
 			}
-			i++;
 		}
 		if (!nwait)
 			break;
-- 
2.17.1

