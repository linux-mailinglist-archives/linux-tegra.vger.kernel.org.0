Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6BA1E3897
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439898AbfJXQqO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:14 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33576 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439897AbfJXQqO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so18096122wro.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZmA4CCQ3zKG7QoqtlGNTQGTEdWNG2D4PniESW4LhASE=;
        b=MbJRPFT36/d6lD1Yv6VGcEWxYAtG+W2eMU8WZXpifEbv4Ko1LJmKrZHv64DWhwjJ4X
         Wo6gN06pmq70cRoQwxDA5iEqKx1n/btinPa+hAu5UzZ7/aY8qbfuSfNWSCBckoN3eDwo
         Yy5UAAa+ou7GnkOoUx4dw1YYodX8lkkiN1oFu4i71s1DSxB3KjAaUXHAdtZzoJkTNsuB
         Oev+s7myrSfmsF35MTlPB8RiOfznxGsyF4k8kzj8J9WMxa4XR6NUZUudA9D/A2EiJlTk
         bDIaZVkPDbiwwXkA3x7OcA3+S+DLdnVqqPwwDjJlrW/posDNZVOCNoQUq0eZf+scGyRc
         zwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZmA4CCQ3zKG7QoqtlGNTQGTEdWNG2D4PniESW4LhASE=;
        b=hPuDFxs/zo0nF152FEXaE9jl/IQpouGMgRYUnNymELRHA4OiOh7rvlUdHvY0mNTh3U
         NgCHa929hDsqSMiWctGGsvFdB1bQ44KZGNJskPKdRTvgXdXSDKiWKGBbMNeV2Tusf6FB
         NSQ5qjf+UaRqDHk1454XZl8NUN6ifkh8L9BlTB/iW2kBXUAPn5mRhEnaQRT3fzVK+MI8
         7O7OmRF6GQJYwHdSYnvSnYhItKyXt4+q7WxignQM/wDwtnezIcDeRtl9YpBSAA2lP7H7
         9f9kxcq3/n2VSJWw4PZBl7h2c7slsoNPE/c8q+mcZd9SfFZw3lK1hvZIH9iUNwYsIMhl
         5c5A==
X-Gm-Message-State: APjAAAVga1lnWyBr4R/AJd8A0/mzg/1CaCUgGQtAH/+U9X70EgpWpeVz
        9T1tgi0gLgeoZlwOLLrPldE=
X-Google-Smtp-Source: APXvYqyH/0NeQY+42spVg1z2IjJVsOvpIuMFgks8UGun/fp1nCfAHu/yMIbrC3S2ZU3ULFlM4t72Ug==
X-Received: by 2002:adf:9f08:: with SMTP id l8mr4500171wrf.325.1571935570614;
        Thu, 24 Oct 2019 09:46:10 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id y1sm29072699wrw.6.2019.10.24.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 15/32] drm/tegra: dp: Add support for eDP link rates
Date:   Thu, 24 Oct 2019 18:45:17 +0200
Message-Id: <20191024164534.132764-16-thierry.reding@gmail.com>
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

Parses additional link rates from DPCD if the sink supports eDP 1.4.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 127 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dp.h |   9 +++
 2 files changed, 136 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index e9a5db77a2dc..bcf9df965ef8 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -33,6 +33,8 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 
 static void drm_dp_link_reset(struct drm_dp_link *link)
 {
+	unsigned int i;
+
 	if (!link)
 		return;
 
@@ -47,6 +49,111 @@ static void drm_dp_link_reset(struct drm_dp_link *link)
 
 	link->rate = 0;
 	link->lanes = 0;
+
+	for (i = 0; i < DP_MAX_SUPPORTED_RATES; i++)
+		link->rates[i] = 0;
+
+	link->num_rates = 0;
+}
+
+/**
+ * drm_dp_link_add_rate() - add a rate to the list of supported rates
+ * @link: the link to add the rate to
+ * @rate: the rate to add
+ *
+ * Add a link rate to the list of supported link rates.
+ *
+ * Returns:
+ * 0 on success or one of the following negative error codes on failure:
+ * - ENOSPC if the maximum number of supported rates has been reached
+ * - EEXISTS if the link already supports this rate
+ *
+ * See also:
+ * drm_dp_link_remove_rate()
+ */
+int drm_dp_link_add_rate(struct drm_dp_link *link, unsigned long rate)
+{
+	unsigned int i, pivot;
+
+	if (link->num_rates == DP_MAX_SUPPORTED_RATES)
+		return -ENOSPC;
+
+	for (pivot = 0; pivot < link->num_rates; pivot++)
+		if (rate <= link->rates[pivot])
+			break;
+
+	if (pivot != link->num_rates && rate == link->rates[pivot])
+		return -EEXIST;
+
+	for (i = link->num_rates; i > pivot; i--)
+		link->rates[i] = link->rates[i - 1];
+
+	link->rates[pivot] = rate;
+	link->num_rates++;
+
+	return 0;
+}
+
+/**
+ * drm_dp_link_remove_rate() - remove a rate from the list of supported rates
+ * @link: the link from which to remove the rate
+ * @rate: the rate to remove
+ *
+ * Removes a link rate from the list of supported link rates.
+ *
+ * Returns:
+ * 0 on success or one of the following negative error codes on failure:
+ * - EINVAL if the specified rate is not among the supported rates
+ *
+ * See also:
+ * drm_dp_link_add_rate()
+ */
+int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < link->num_rates; i++)
+		if (rate == link->rates[i])
+			break;
+
+	if (i == link->num_rates)
+		return -EINVAL;
+
+	link->num_rates--;
+
+	while (i < link->num_rates) {
+		link->rates[i] = link->rates[i + 1];
+		i++;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_dp_link_update_rates() - normalize the supported link rates array
+ * @link: the link for which to normalize the supported link rates
+ *
+ * Users should call this function after they've manually modified the array
+ * of supported link rates. This function removes any stale entries, compacts
+ * the array and updates the supported link rate count. Note that calling the
+ * drm_dp_link_remove_rate() function already does this janitorial work.
+ *
+ * See also:
+ * drm_dp_link_add_rate(), drm_dp_link_remove_rate()
+ */
+void drm_dp_link_update_rates(struct drm_dp_link *link)
+{
+	unsigned int i, count = 0;
+
+	for (i = 0; i < link->num_rates; i++) {
+		if (link->rates[i] != 0)
+			link->rates[count++] = link->rates[i];
+	}
+
+	for (i = count; i < link->num_rates; i++)
+		link->rates[i] = 0;
+
+	link->num_rates = count;
 }
 
 /**
@@ -125,6 +232,26 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
 
+	/* Parse SUPPORTED_LINK_RATES from eDP 1.4 */
+	if (link->edp >= 0x14) {
+		u8 supported_rates[DP_MAX_SUPPORTED_RATES * 2];
+		unsigned int i;
+		u16 rate;
+
+		err = drm_dp_dpcd_read(aux, DP_SUPPORTED_LINK_RATES,
+				       supported_rates,
+				       sizeof(supported_rates));
+		if (err < 0)
+			return err;
+
+		for (i = 0; i < DP_MAX_SUPPORTED_RATES; i++) {
+			rate = supported_rates[i * 2 + 1] << 8 |
+			       supported_rates[i * 2 + 0];
+
+			drm_dp_link_add_rate(link, rate * 200);
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index e07b9a1e43d8..a20ee9f1f1b6 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -66,6 +66,8 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
  * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
  * @rate: currently configured link rate
  * @lanes: currently configured number of lanes
+ * @rates: additional supported link rates in kHz (eDP 1.4)
+ * @num_rates: number of additional supported link rates (eDP 1.4)
  */
 struct drm_dp_link {
 	unsigned char revision;
@@ -87,8 +89,15 @@ struct drm_dp_link {
 
 	unsigned int rate;
 	unsigned int lanes;
+
+	unsigned long rates[DP_MAX_SUPPORTED_RATES];
+	unsigned int num_rates;
 };
 
+int drm_dp_link_add_rate(struct drm_dp_link *link, unsigned long rate);
+int drm_dp_link_remove_rate(struct drm_dp_link *link, unsigned long rate);
+void drm_dp_link_update_rates(struct drm_dp_link *link);
+
 int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_power_up(struct drm_dp_aux *aux, struct drm_dp_link *link);
 int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link);
-- 
2.23.0

