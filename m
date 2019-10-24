Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953AEE388D
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439887AbfJXQqE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52667 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQqE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id p21so2157237wmg.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF+YcAgQiBm0mPw0I9xhh8vL6WGqhRLDBDhFt2a9/Oc=;
        b=M6jfENkJo3FjTB+X/IJHkMe4ddP++PDR0rga1S9dy1uyza5fuVQKXcRtgUnVACgKhY
         sQgRCQB7V6p0YFmecfOpST9/p7EXxpfaxWyFyBRpWeS8iBw8PfvOQoAglILacNQUD+lO
         PLU3YYhIGL5D6MSxJ7RsBsDi5rWhzIE7XgBFWejgZaTr5ZJwlqBPLyvOLUoTCF5rYCiu
         hX5IUCfV4tuQhu9odM5FL3ZkIo/5yLTfZbXHwG5XJHS8LYFsvgYmrjWaIVfO8fHGVm3b
         mu7u41K80lymQ12sjrmx6TuRydFxrJWA6+xSqbud4OrRmEsPybx7Y9EcpmMKvl0ArjCC
         Arnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF+YcAgQiBm0mPw0I9xhh8vL6WGqhRLDBDhFt2a9/Oc=;
        b=sEWgWwtvcT0jKkGywPXErfQSipoTkE4xrxg4SO5E4U/o/NQB9anO1e3ynAO8WyubpG
         VRxA6tqwZwgED/a/P0K/jQLsdjYS6PSCipWwi/heYj4rBd3dmOZzyHIH0/ppoYVVGrE2
         +vFyVEwHw6AELBq6KTbyrIOJJwIpDom8vmPKTRkkzv2PFKk2+Trq4IDGJ9mtBCqNDBjq
         F78SgkjpWzWpCi2fF/sZ66tFwywfgp47x1iHrjDBn6/7vOutzCiansGQVqMqr6Qdu8iF
         g6ABw/JkM4XYdaj5tuosHt3JHA6Pl+OMfHXDX/JzinE/BkSCR2VMdYqDQAYTCD2QV3bZ
         hxow==
X-Gm-Message-State: APjAAAXtTnUHFxbfAsFp/D8v7f9awipIIAX7hOJWXL67oywkeNpyv67J
        zVIbTANuXuoALguiweYxIJ4=
X-Google-Smtp-Source: APXvYqxOgnq4flJoy7BqWhlvmgY1DBITgCFfSAP79ZN7v9S/Q2oJCN4+sXhRdqB3KX2X0POCsolqtQ==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr5550632wmj.73.1571935561964;
        Thu, 24 Oct 2019 09:46:01 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l8sm10077273wru.22.2019.10.24.09.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 11/32] drm/tegra: dp: Read AUX read interval from DPCD
Date:   Thu, 24 Oct 2019 18:45:13 +0200
Message-Id: <20191024164534.132764-12-thierry.reding@gmail.com>
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

Store the AUX read interval from DPCD, so that it can be used to wait
for the durations given in the specification during link training.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.h | 11 +++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 2be0a47ecbec..757a0256592f 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -40,6 +40,8 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 	link->max_lanes = 0;
 
 	drm_dp_link_caps_reset(&link->caps);
+	link->aux_rd_interval.cr = 0;
+	link->aux_rd_interval.ce = 0;
 	link->edp = 0;
 
 	link->rate = 0;
@@ -60,6 +62,7 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 {
 	u8 dpcd[DP_RECEIVER_CAP_SIZE], value;
+	unsigned int rd_interval;
 	int err;
 
 	drm_dp_link_reset(link);
@@ -90,6 +93,34 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 			link->edp = drm_dp_edp_revisions[value];
 	}
 
+	/*
+	 * The DPCD stores the AUX read interval in units of 4 ms. There are
+	 * two special cases:
+	 *
+	 *   1) if the TRAINING_AUX_RD_INTERVAL field is 0, the clock recovery
+	 *      and channel equalization should use 100 us or 400 us AUX read
+	 *      intervals, respectively
+	 *
+	 *   2) for DP v1.4 and above, clock recovery should always use 100 us
+	 *      AUX read intervals
+	 */
+	rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
+			   DP_TRAINING_AUX_RD_MASK;
+
+	if (rd_interval > 4) {
+		DRM_DEBUG_KMS("AUX interval %u out of range (max. 4)\n",
+			      rd_interval);
+		rd_interval = 4;
+	}
+
+	rd_interval *= 4 * USEC_PER_MSEC;
+
+	if (rd_interval == 0 || link->revision >= DP_DPCD_REV_14)
+		link->aux_rd_interval.cr = 100;
+
+	if (rd_interval == 0)
+		link->aux_rd_interval.ce = 400;
+
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
 
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 681cbd0a0094..1fe2d4f45ba3 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -60,6 +60,7 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
  * @max_rate: maximum clock rate supported on the link
  * @max_lanes: maximum number of lanes supported on the link
  * @caps: capabilities supported on the link (see &drm_dp_link_caps)
+ * @aux_rd_interval: AUX read interval to use for training (in microseconds)
  * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
@@ -70,6 +71,16 @@ struct drm_dp_link {
 	unsigned int max_lanes;
 
 	struct drm_dp_link_caps caps;
+
+	/**
+	 * @cr: clock recovery read interval
+	 * @ce: channel equalization read interval
+	 */
+	struct {
+		unsigned int cr;
+		unsigned int ce;
+	} aux_rd_interval;
+
 	unsigned char edp;
 
 	unsigned int rate;
-- 
2.23.0

