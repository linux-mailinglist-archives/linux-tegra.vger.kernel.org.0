Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B859E3885
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436852AbfJXQpw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39953 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436833AbfJXQpw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:52 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so2095270wmm.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=abbwhhQgie2zwXLpQrwNZHmhm1e7uRKQChzXAIX90vQ=;
        b=vXoojypPny2wjvKL3hyDhbkqvgKFOT+etdOa+s8a8OplRP+/bn6EpScpzZFwTv6vLL
         OojQ16wXU91uAGGQCRFsWL4utnFkBtGbzQwdIQ2A4Hs/OsgcfR44G1BHZFnalxvUAvfz
         OYe1rrHHoPVeevntjR31NmsQFQBQbuSJg9YzgWFFGXaXWou2amSU7yYfIt0fXbPmewfA
         qzOVUKYKc2Xc7PSmOdF1zfzNSa96H6344poUNVSSu0FBoGGGZO6iOLdSB/5RBdIjAbKi
         6uagfSyySYjK3fuGlBICeDbpu16fMcyIne0Obl/2YE1j456yYWKaxgGIhpzrxg374S1P
         /rhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=abbwhhQgie2zwXLpQrwNZHmhm1e7uRKQChzXAIX90vQ=;
        b=hBRQGwgE2tqNoPWK4zxR//7O30DMsY/sE4WofIcWMdTQioNjiytA34He62OGO9ukAj
         qLvftV/0NVASv1zRUyBOBFpIYOTBDwU/902p+b/RqHh6tpLk/jwnqKdpNGRzqt8j6SUu
         k/uaSXAr89MbsgFHjQxRrzpscgobaQk3DZKORKhK6Xx/xFW3/S0g4wEtLkRPFQKeVw61
         yyRIyp2tk1ymUSh9Os3TPSGdFKw2DpdWtsFZRDOSHyeC3SPCBqkJ8MCuOg2PNFpcNJy0
         szlLeQui/ebma88En8rTq1FKz4OoQ4ZyplXV5UtCSM1gXC7KIhthwud1fIMjgx4Vx2iP
         dw2A==
X-Gm-Message-State: APjAAAWuSjh15htreLX83wBQYfgUt26f2pWHOytO8o+O7+Q/o6ea4JKN
        C3OFSVCcIPzFYj3ZhTk9DxQ=
X-Google-Smtp-Source: APXvYqyUl2sgcTdEBy3Cw6Tr4Ze4P/bih0rI3/DUlOgsQPO6w4YwxxA3/vexOLN5x8i03YWgfdTWng==
X-Received: by 2002:a1c:3284:: with SMTP id y126mr5960528wmy.164.1571935548519;
        Thu, 24 Oct 2019 09:45:48 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z15sm25195288wrr.19.2019.10.24.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/32] drm/tegra: dp: Probe link using existing parsing helpers
Date:   Thu, 24 Oct 2019 18:45:07 +0200
Message-Id: <20191024164534.132764-6-thierry.reding@gmail.com>
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

Use existing parsing helpers to probe a DisplayPort link.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index e7602fc39a4a..f9234f66062d 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -47,21 +47,20 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
  */
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 {
-	u8 values[3];
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	int err;
 
 	drm_dp_link_reset(link);
 
-	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
+	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, dpcd, sizeof(dpcd));
 	if (err < 0)
 		return err;
 
-	link->revision = values[0];
-	link->max_rate = drm_dp_bw_code_to_link_rate(values[1]);
-	link->max_lanes = values[2] & DP_MAX_LANE_COUNT_MASK;
+	link->revision = dpcd[DP_DPCD_REV];
+	link->max_rate = drm_dp_max_link_rate(dpcd);
+	link->max_lanes = drm_dp_max_lane_count(dpcd);
 
-	if (values[2] & DP_ENHANCED_FRAME_CAP)
-		link->caps.enhanced_framing = true;
+	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(dpcd);
 
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
-- 
2.23.0

