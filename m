Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291BEE388A
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439741AbfJXQp7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50830 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQp7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id 11so126507wmk.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lnMOXHki5l5YHT5nhAWPY1kZFjM9Z7XrrlTmxdNtDB8=;
        b=T1gviikxvQIZr4jUM5jOqCz7ZYaO2amBvBHkxQ9hUN7Gei22idMJIbafztcB1cr7xa
         Leg4mcQR+OYjxmkWE35DlP9bpJzLBz3aLVsW6H68iyWX/y+k1VW9q0SpRlVXiVafD3oX
         QWuY+IiIpRl0iyqNk2aHiUjMv7krelyaja2UVgCS0Un4+qA9GUQVwTDaTQXoz08p+Kjw
         xFC1jw3OuusUFT5PeL9u+GUzboK8lc/i72Sn2cwb2zPl6He04UuV3jsD+OKaQDMl9zWg
         Z2kWEewZqDKvnC5oc01HgDLjauQK9fxc4eABw+JR6R+oakdjBBsWEWyjgLm0W2imCPdA
         QjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lnMOXHki5l5YHT5nhAWPY1kZFjM9Z7XrrlTmxdNtDB8=;
        b=dLgONj8ERvbcyNyJH0y7LkTvXSv5kjk5ZNijnaPjt5qbPFywhsY2AAKaOxp4gBYkjB
         MRsWJNLLiiF1h1xjMb0X27J8lMXrtXvx0axv/HC8Nt3FGlJY7Df5J51XEElFMG/5s5m0
         13cBbrkZ1zyjKqGQmkdsXLnK4FadjOi/HX06fxyxdy62nrHl4gsomSAB8dcUnlTqDekC
         XLRJ99C/oxHo31jhu/BSc8MD9EgmOvVOD0gLQhyrq6wun1FBDIByPLvQRiGkqGshmjh6
         eyMA9Md5HJNBQiYF1q7Gq8xy6SxRXXrhSokd4hQzC3zN22x6HMc3Q9gF75MBXyhcSHUP
         CG+Q==
X-Gm-Message-State: APjAAAVZz357gzYgS0FwSE4eY+QX6bKcwLgqnQj/DTD69Ld7pT/Nx46I
        HRHm1Ji95xkusrb5wIVZpZE=
X-Google-Smtp-Source: APXvYqw+WRepsU1FlsCHgNAsAd5lm7lvHENMKSFTPWEDlyGF4qPLf0sAQvpgB3+/ezT1z1JCgjGw2w==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr6040145wml.68.1571935557725;
        Thu, 24 Oct 2019 09:45:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id n1sm31200504wrg.67.2019.10.24.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 09/32] drm/tegra: dp: Read alternate scrambler reset capability from sink
Date:   Thu, 24 Oct 2019 18:45:11 +0200
Message-Id: <20191024164534.132764-10-thierry.reding@gmail.com>
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

Parse from the sink capabilities whether or not the eDP alternate
scrambler reset value of 0xfffe is supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 5 +++++
 drivers/gpu/drm/tegra/dp.h | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 0bd87cff4575..1f48c2190e3b 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -14,6 +14,7 @@ static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
 	caps->tps3_supported = false;
 	caps->fast_training = false;
 	caps->channel_coding = false;
+	caps->alternate_scrambler_reset = false;
 }
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
@@ -23,6 +24,7 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 	dest->tps3_supported = src->tps3_supported;
 	dest->fast_training = src->fast_training;
 	dest->channel_coding = src->channel_coding;
+	dest->alternate_scrambler_reset = src->alternate_scrambler_reset;
 }
 
 static void drm_dp_link_reset(struct drm_dp_link *link)
@@ -71,6 +73,9 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
 	link->caps.channel_coding = drm_dp_channel_coding_supported(dpcd);
 
+	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
+		link->caps.alternate_scrambler_reset = true;
+
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
 
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 984dac21568e..45e8ff18ab6a 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -42,6 +42,13 @@ struct drm_dp_link_caps {
 	 * ANSI 8B/10B channel coding capability
 	 */
 	bool channel_coding;
+
+	/**
+	 * @alternate_scrambler_reset:
+	 *
+	 * eDP alternate scrambler reset capability
+	 */
+	bool alternate_scrambler_reset;
 };
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
-- 
2.23.0

