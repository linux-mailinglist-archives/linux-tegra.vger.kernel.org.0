Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 077CEE388C
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439886AbfJXQqC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46181 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQqC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id n15so16071138wrw.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yty/EJuHbPo+sV+vw2W6VylZ7J8vhVAzp70Ulfh9+0w=;
        b=XhRXcDJ0B/zJO6GUyxCfZStm1mqzsaFnI3qf5hqPARKj4v55F4UNEGAjVr07eQlZTL
         tDugAZbbwl6PGa3htJmzf3TLaVtra2qQ4c9v7k8rWCo9PaJKp0DXmuidAWxXX2lX9ast
         i0ohrEAkh/HoQ34k6OO824pIXjXXZP4i9y1HmGkpEgD1EMNdTQvgSGWl+w4PnnSJleFN
         6zfA+e2pHLLZH/SUiF3V3iiXVKprW5bVKt8+d5rMmQMc3uL0TYdtMtQdXfLSFKiqqbQC
         7z80ZtPNugV3exg1SPmfmqyiNXmsY8U/+cUKVcegxbZur1hMwIzwG3gY6u7W3hGWH9WF
         FruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yty/EJuHbPo+sV+vw2W6VylZ7J8vhVAzp70Ulfh9+0w=;
        b=Pnj430nxbOZa5EwLGjBQZ0LoiKGRI/s8/WDP+btZ5BpX5XGRG/GR5/Q6yFEhn3I/B+
         5zP1jActdH5Lbht18hXLiC7V10IUV9zv/zMm6thR4+9GshEPeKRuyN8t9u+ffYH5s58J
         wTEdJKFRU7irf0wZKBgFWrrk1z0eBmsUyzzeDKa1yXAM5ZkrpW4g5JP6oOrpsR2MsgnK
         Se9BTdHKtGlVAMXesU+ENH1PASkwIQkXCY/p2ZiUxQ9rNmyJpF0CL/mMr4mucIwYq6ZP
         3l9SOn5svAb96URmQkAHBDoEgz3hdbPEoeIvV83SnBHw3qshTIBjdzZOMptemEIG2BRQ
         wbQA==
X-Gm-Message-State: APjAAAXh6S6ZummxCIOYA90UtaKOK8uomFTX7DzxS/zS51xPgrh9cpbf
        BcSCE6hT8vIzdn/nZhBnifI=
X-Google-Smtp-Source: APXvYqwCFC6iF6CMbRgp6QF+yXHQtCqN51M4/rI8h1YavptNKwRXtJXI6zlQTsvG9F9hgqpdktAg3A==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr4473270wrb.212.1571935559735;
        Thu, 24 Oct 2019 09:45:59 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id p1sm3658391wmg.11.2019.10.24.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:58 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 10/32] drm/tegra: dp: Read eDP version from DPCD
Date:   Thu, 24 Oct 2019 18:45:12 +0200
Message-Id: <20191024164534.132764-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the sink supports eDP, read the eDP revision from it's DPCD.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 18 ++++++++++++++++--
 drivers/gpu/drm/tegra/dp.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 1f48c2190e3b..2be0a47ecbec 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -5,9 +5,12 @@
  */
 
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
 
 #include "dp.h"
 
+static const u8 drm_dp_edp_revisions[] = { 0x11, 0x12, 0x13, 0x14 };
+
 static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
 {
 	caps->enhanced_framing = false;
@@ -37,6 +40,7 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 	link->max_lanes = 0;
 
 	drm_dp_link_caps_reset(&link->caps);
+	link->edp = 0;
 
 	link->rate = 0;
 	link->lanes = 0;
@@ -55,7 +59,7 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
  */
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 {
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	u8 dpcd[DP_RECEIVER_CAP_SIZE], value;
 	int err;
 
 	drm_dp_link_reset(link);
@@ -73,9 +77,19 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
 	link->caps.channel_coding = drm_dp_channel_coding_supported(dpcd);
 
-	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
 		link->caps.alternate_scrambler_reset = true;
 
+		err = drm_dp_dpcd_readb(aux, DP_EDP_DPCD_REV, &value);
+		if (err < 0)
+			return err;
+
+		if (value >= ARRAY_SIZE(drm_dp_edp_revisions))
+			DRM_ERROR("unsupported eDP version: %02x\n", value);
+		else
+			link->edp = drm_dp_edp_revisions[value];
+	}
+
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
 
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 45e8ff18ab6a..681cbd0a0094 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -60,6 +60,7 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
  * @max_rate: maximum clock rate supported on the link
  * @max_lanes: maximum number of lanes supported on the link
  * @caps: capabilities supported on the link (see &drm_dp_link_caps)
+ * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
  */
@@ -69,6 +70,7 @@ struct drm_dp_link {
 	unsigned int max_lanes;
 
 	struct drm_dp_link_caps caps;
+	unsigned char edp;
 
 	unsigned int rate;
 	unsigned int lanes;
-- 
2.23.0

