Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27AC6E3886
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436833AbfJXQpw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39626 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQpw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id a11so10775515wra.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JHEow/Zl5+7m5KVB2Rml4lhaxLw0XA1AxOO1PkpGdtc=;
        b=LYgUaVWY/w2p8l5B6g5S0XZNWLGLhSswJGS3no0zLziCxypzsvykd3HXYli8pjBZW1
         WhudNHAb+9NBPfo/WcqXxHDgureHA6KYuVLyw2Wt1MwthSyUoeAsx65HTkbz6JQzWouX
         9FExQ9Y9KcIwtxYKqO7+lbu7fEclrgmEOHYtFu5rFbBMbcPzNmmJuSGTTaSQ2ubkJ2sc
         O1JYtZAO3m5tc/7+WM40UxYP+9B3F+Afp02I+xOAompRyFPwEOooqll/W9yZ7p3W8i/X
         Hn+sEE/riMCwhKLyjgtna6ZBeR5eDhzn3F4QC5eVeSzA8EdsetSwk7m3Z+9nlMBzU7do
         XYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHEow/Zl5+7m5KVB2Rml4lhaxLw0XA1AxOO1PkpGdtc=;
        b=Z3Gau6kbT/mtLIBZJATxR/WSmwqTwQaUMrACrfq3s5MZyrhJXpx1Z86j5+7EHk6gu6
         Qcg4epVQyMbcuybCKl4g3udvq1qFioM9NHDzDTSdVqvLXQl8uTVnU6j3m6+FHdvhii2q
         pNcsIPzUiAjWdKRb5JdldrF9bRuj2tFARhWlZqXGwT1Qq+WwUVPATP0VYWoasQ6TwBr6
         3+2+bZCn0jNGnPYp9GFGmxNLKUVV6Entw9n4S+sFgdg/OYCZBK45RWld9r7c6kM3gJm7
         2ia3Emrh6Kyv46UNdMsYQHGxIiayaCY9ph6kO+REqzBWOaRjjmucusrpYttZFqN2Fiv8
         IsGg==
X-Gm-Message-State: APjAAAUVJfuWbUbCpv7cmqW9+mG9MYbtqHA5He2yEQsbUT2p4RJ+EXJF
        T8LzolNiBuZLvkq3sDdR+bR3RhdT
X-Google-Smtp-Source: APXvYqwnrAO1zMBoRxS8dkqIdGXuMX0/xi0kc+5Lq0cTDOs3P869WQW4f/5XMI5t1p6pDADzNyNfSg==
X-Received: by 2002:adf:d190:: with SMTP id v16mr4911600wrc.64.1571935550755;
        Thu, 24 Oct 2019 09:45:50 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 62sm10661186wre.38.2019.10.24.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/32] drm/tegra: dp: Read fast training capability from link
Date:   Thu, 24 Oct 2019 18:45:08 +0200
Message-Id: <20191024164534.132764-7-thierry.reding@gmail.com>
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

While probing the DisplayPort link, query the fast training capability.
If supported, drivers can use the fast link training sequence instead of
the more involved full link training sequence.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 3 +++
 drivers/gpu/drm/tegra/dp.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index f9234f66062d..97fc0225483f 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -11,12 +11,14 @@
 static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
 {
 	caps->enhanced_framing = false;
+	caps->fast_training = false;
 }
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 			   const struct drm_dp_link_caps *src)
 {
 	dest->enhanced_framing = src->enhanced_framing;
+	dest->fast_training = src->fast_training;
 }
 
 static void drm_dp_link_reset(struct drm_dp_link *link)
@@ -61,6 +63,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->max_lanes = drm_dp_max_lane_count(dpcd);
 
 	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(dpcd);
+	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
 
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 6246f9afb5fe..d6ae477bab5c 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -21,6 +21,13 @@ struct drm_dp_link_caps {
 	 * enhanced framing capability (mandatory as of DP 1.2)
 	 */
 	bool enhanced_framing;
+
+	/**
+	 * @fast_training:
+	 *
+	 * AUX CH handshake not required for link training
+	 */
+	bool fast_training;
 };
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
-- 
2.23.0

