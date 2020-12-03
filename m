Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7FA2CDE3D
	for <lists+linux-tegra@lfdr.de>; Thu,  3 Dec 2020 20:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgLCTAr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 3 Dec 2020 14:00:47 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18299 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgLCTAq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Dec 2020 14:00:46 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935b60001>; Thu, 03 Dec 2020 11:00:06 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:01 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:00 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 01/13] media: tegra-video: Use zero crop settings if subdev has no get_selection
Date:   Thu, 3 Dec 2020 10:59:50 -0800
Message-ID: <1607022002-26575-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022006; bh=ERCkCneZmXlmcSkkK9fGRHPBppn9DardS4Sr/wZUI/E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=hp+9vWAsmZRaQ5XaJvFVOeiNkH1BS6XZYb3wesU99yy5mVXOWBpTfJUn+34UhqgmC
         34x1ftz3R/jeV56KvA7pIayHb8JHJMoD5jlvuln/zoCDdj2U160TYVI1WWxo0llggr
         f4XPsEH0xeXUwkHLN/tD0N+Grpu4NIyaZ2GUvj/OCePIveScHtKFjzXDTE6aAnIbZX
         zX6TL9okwMm5mXrc0QG9+KcXu9J9c8UdXJNc3+jbrM5xV1ZKfCH+rVWK4WOV97LyuA
         lzRWXO0UcN0eZzAQaYasHBeHAvKR7Afmi8xUk50jMIe7Yh9ZuaW5RBl+ZzDqnRkKrP
         KAXzoPMSmgrDQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently try format implementation doesn't check if subdevice has
get_selection ops implemented and returns -EINVAL on error from
direct v4l2_subdev_call of get_selection.

Selection API's are not mandatory for all V4L2 subdevices.

This patch fixes it by adding v4l2_subdev_has_ops check prior to
calling get_selection ops and continues with try or set format with
zero crop settings for subdevices that don't have get_selection and
returns -EINVAL only for subdevices that has get_selection ops.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 560d8b3..7edd35c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -533,11 +533,18 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
 	if (ret) {
-		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
-		if (ret)
-			return -EINVAL;
-		pad_cfg->try_crop.width = sdsel.r.width;
-		pad_cfg->try_crop.height = sdsel.r.height;
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+			pad_cfg->try_crop.width = 0;
+			pad_cfg->try_crop.height = 0;
+		} else {
+			ret = v4l2_subdev_call(subdev, pad, get_selection,
+					       NULL, &sdsel);
+			if (ret)
+				return -EINVAL;
+
+			pad_cfg->try_crop.width = sdsel.r.width;
+			pad_cfg->try_crop.height = sdsel.r.height;
+		}
 	} else {
 		pad_cfg->try_crop.width = fse.max_width;
 		pad_cfg->try_crop.height = fse.max_height;
-- 
2.7.4

