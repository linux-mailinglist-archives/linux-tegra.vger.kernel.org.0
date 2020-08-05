Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809AA23C504
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Aug 2020 07:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgHEFZN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Aug 2020 01:25:13 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2557 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgHEFZJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 01:25:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a42520000>; Tue, 04 Aug 2020 22:23:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Aug 2020 22:25:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Aug 2020 22:25:09 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 05:25:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 05:25:09 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a42b00001>; Tue, 04 Aug 2020 22:25:09 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 5/9] ASoC: dt-bindings: audio-graph-card: Support for component chaining
Date:   Wed, 5 Aug 2020 10:54:20 +0530
Message-ID: <1596605064-27748-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596605010; bh=8Js/ZEGlVzwFXdJdQjutevNmm0WStqhHkU8WPEXE2Es=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=jZLb/xbbfXPWs6fAEetzmN16Mm1Vrf0EtDtSDZa+KTxFK3bAe8Bq7CvRtOVpekL8K
         HjMdZn4B0e8tG96Rpl8p5OjuF4vrA8cIftT+k9+mGJDQOM4N6c41geEb8AS7oQxN9W
         I793hOUa2yZK6Py917l0MAF15HxMeaUzMYk4bUGtGUbxGuApNgvF6XPyrudmjSR0O0
         vopTOAw+PD2+1GwrC3+L2tBsYsb+RPieAEjapUmiyzI9z0rSLtpqHXQD9KFCHoTrAk
         G2bujA57y7Niv0XI0YQOeAW7ZMVFL2NAhJUensElPGThv5nBTVkoiRNjGr/Rfbdccf
         chhYAKazaLJxg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

New compatible "audio-graph-cc-card" is exposed for audio-graph card
driver which allows usage of DAI link chaining and thus connects multiple
components together in a system.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-card.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
index d5f6919..8bf2038 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
@@ -27,6 +27,7 @@ Below are same as Simple-Card.
 Required properties:
 
 - compatible				: "audio-graph-card";
+					: "audio-graph-cc-card";
 - dais					: list of CPU DAI port{s}
 
 Optional properties:
-- 
2.7.4

