Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F18DE387E
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436826AbfJXQpn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42150 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436821AbfJXQpm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so17060977wrs.9
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IN+YQnEOyJUS5k1O2xwcjJm7/Rodceth/lgx2YM8Gws=;
        b=hYjszF6NhG//c4hvZIbDA0GvgbAJF8UnSShL2kJUVMVnWx/AKDGV1Y8rejCkDZSHTy
         MXbxES99xFAwluer9AsNg2buiwlPQKbighBMo5tWpWqdgILpEUQEd75+lypGydnNI3rz
         83uX13NDePQd/XRKDc6z62E7xy6O43sH4UTGb4oaxsv1uX4ufXjSzlQSNyrVfb3rhc0y
         nKiI4ShbizlsozhFyDElpbMpXLeER7StLM0EiCiahookxWBFflCip4Btr1MN6RG7EEne
         4ZTwa93a3tpOAcsEIuP205nBbAW5TequGUgr6b2AmRFhl1ISl4DIm4KAgd6ovg1TjeKD
         2pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IN+YQnEOyJUS5k1O2xwcjJm7/Rodceth/lgx2YM8Gws=;
        b=jFCq/kWnkzxBGMmUgXs7hvc/NLGm3m9tLo7a4JTcYai8U4Ji5TC94jkyfo4Dzx1Wr2
         ueEDa/dXiZgksjaI5fhyQ48663u9shkZwNLv/ZIQPraaeg+Qla95xNLX27gVXq/SItWl
         aHx2TPBRqh0uIqBeSA/CcAbKkIrqVtrgd+C89h9SHXUvVCqyImPspeYbpBRmgLmFrFvt
         8yhruWW2G5Bh01E0bzVu7xZkzcne92jOEgG5PAhKmbWu479Hb7ltUl1xk0+VHsEMO8hH
         I7dG//vMPGaYwQoRQ6dXUAu58K0HgVZH3CpahUhRFUvp+Xnm6OyuTX7bC24+oRYgoK3K
         txdg==
X-Gm-Message-State: APjAAAXuUSGLv5Jnl/jo5Bzk+2k3x6nL+D9pvb2SqmlU4mJmVmu62RS9
        q2RdLrUc1cGMHkpvks8srcV+DPHT
X-Google-Smtp-Source: APXvYqwAeJKMyLSjXtstNJqix0x6l67WkcLJwRvv30XQzva/DaHCuGReyfFc0aj/heUwuzEbH4su5w==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr4588523wrr.316.1571935539407;
        Thu, 24 Oct 2019 09:45:39 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r13sm37818229wra.74.2019.10.24.09.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/32] drm/tegra: Add missing kerneldoc for struct drm_dp_link
Date:   Thu, 24 Oct 2019 18:45:03 +0200
Message-Id: <20191024164534.132764-2-thierry.reding@gmail.com>
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

The drm_dp_link structure tracks capabilities on the DP link. Add some
kerneldoc to explain what each of its fields means.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 88842fd25abf..1cf252e7309a 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -11,6 +11,13 @@ struct drm_dp_aux;
 
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
 
+/**
+ * struct drm_dp_link - DP link capabilities
+ * @revision: DP specification revision supported on the link
+ * @rate: maximum clock rate supported on the link
+ * @num_lanes: maximum number of lanes supported on the link
+ * @capabilities: bitmask of capabilities supported on the link
+ */
 struct drm_dp_link {
 	unsigned char revision;
 	unsigned int rate;
-- 
2.23.0

