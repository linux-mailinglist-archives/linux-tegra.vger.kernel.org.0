Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 186B0E3887
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439722AbfJXQpz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40594 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQpz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so26845577wro.7
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W2ba8i6cmLNAVuw9Ax+u8c8Mx7vEOPzpNImQ2Ltx3BU=;
        b=k9WJb44yg/elITsDxYJnXcTvdo6WewwN3UuPJc9iOB1Licvzg4FbMNxOVLzfqVPrd7
         6YtBLIAosFZE9WAiGJjfPBSOmPvx90IUBe8vXAkcKYfr723hw03CxvIJpDpiaJrdKhF7
         K3OAZ2AAof+X8sSSQw+DWZW+7DXT1bum7c9psxevh/w7z35KPtifFHGTQ5dbv+1lg+B0
         0SMn1BPvKS5Tw1Hf/Yh+SQMs8iB1N2Pa34oFf1qW6kWhWg0H4bRN+7tohthu/c1qEb5u
         hOgIyB4a4rgoQ8AbjXDezwqmmzZwp8j6h3KbMDu9P20SV8qJ/HBYHPNe5dFNl1Q9TrJS
         CGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W2ba8i6cmLNAVuw9Ax+u8c8Mx7vEOPzpNImQ2Ltx3BU=;
        b=fwTG+dgg8VJhwmfIQsRd5mOE4bTT011dqY0PzmXwC2kWXeTZtYBJml62P69I4sJOrG
         5ev44Z9ZlN38cgdIhWd5P6NQnfRZwXdsJBmS35s7A4DeuiO+fnAPl4w0IKR+Yi1KwKwN
         68OkJv9WhWeNerlmNwp/MsShnCZHPUXUgBsTUeP9V0dvfb2/spN0FLMVS5VA5lv5gZ9E
         OJlPK3BVugvN0ylnm5ttTwdFM7i+gMWmytWfAhHcea1hoqdeqW19jznjfGdvF29h71QF
         gw0YVGAe7koiW5LlplybzMMFGauh84/1/iLRdzk5ClZBpJ0H0sbvCD5dxqel0q7QnRa2
         Z2lQ==
X-Gm-Message-State: APjAAAUjMs0xNpaBoW6E/Yk/j1i/uNyFKrvVXYZ3iCxl3xqN02swg0pI
        WSfwWOPXxQ+tzeSQGs2eSDw=
X-Google-Smtp-Source: APXvYqzxAAu40HRGwD/211/4A721vw1pPY68bX60qRMq+Gu+zzY6cblRT/v/7RfYzdUkACAccI9Myw==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr4691068wrs.63.1571935553087;
        Thu, 24 Oct 2019 09:45:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n1sm31200223wrg.67.2019.10.24.09.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 07/32] drm/tegra: dp: Read TPS3 capability from sink
Date:   Thu, 24 Oct 2019 18:45:09 +0200
Message-Id: <20191024164534.132764-8-thierry.reding@gmail.com>
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

The TPS3 capability can be exposed by DP 1.2 and later sinks if they
support the alternative training pattern for channel equalization.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 3 +++
 drivers/gpu/drm/tegra/dp.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 97fc0225483f..e22ebab677b9 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -11,6 +11,7 @@
 static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
 {
 	caps->enhanced_framing = false;
+	caps->tps3_supported = false;
 	caps->fast_training = false;
 }
 
@@ -18,6 +19,7 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 			   const struct drm_dp_link_caps *src)
 {
 	dest->enhanced_framing = src->enhanced_framing;
+	dest->tps3_supported = src->tps3_supported;
 	dest->fast_training = src->fast_training;
 }
 
@@ -63,6 +65,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->max_lanes = drm_dp_max_lane_count(dpcd);
 
 	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(dpcd);
+	link->caps.tps3_supported = drm_dp_tps3_supported(dpcd);
 	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
 
 	link->rate = link->max_rate;
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index d6ae477bab5c..999078812943 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -22,6 +22,13 @@ struct drm_dp_link_caps {
 	 */
 	bool enhanced_framing;
 
+	/**
+	 * tps3_supported:
+	 *
+	 * training pattern sequence 3 supported for equalization
+	 */
+	bool tps3_supported;
+
 	/**
 	 * @fast_training:
 	 *
-- 
2.23.0

