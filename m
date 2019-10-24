Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04ED4E3880
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436821AbfJXQpn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52616 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436822AbfJXQpn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id p21so2156133wmg.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DYjBFdBkh2ExDAy5mIdVeU5TwdGnRp9l6pBdmT3a3c=;
        b=QQoIImawfuOekh1LfxlRAP4b6eF5hXLjNtWE1GNNfz7nRipP4eaowMSTELRpE0navZ
         muQr9OVrzQVdbMfdaqtOyQIBD+lh1WbFNMrXBF6CQr6hRyL9BmK4mEqItglK32v64GhY
         x6MsU1bNN+/+X/xZidb26xcqO12sqT4rn5oz+PoMChVNZaXVbtyo2P5JbE5GtvSmiuuN
         BpHQ80tBKtpgRxfXGkYyUJn1ZgFIEskEtqmftdviBPcC2L4tsRb3C/v6Q3G/Qs/Fgk3x
         8nrFySjTg/JNkG+qVkz12y0jIE681ptcS9VGv3X7Pnqy97H81H/9J696YEeNk9V0EU/q
         dUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DYjBFdBkh2ExDAy5mIdVeU5TwdGnRp9l6pBdmT3a3c=;
        b=j55pBqzeam6RoN1UxYxOAGiKHUlWrHzDs5uVLgVeZw7FTsDbBH94eWUpqRM9VinitV
         MROn3+czffgLwAu2JYpImLysxk616btlX7vtvPx76FaHrgEqi33ZdlEGDXXehbfgaNrU
         g5eO30bSbW2nucYY69t/fUEWFYiSuWzN1BGIPgtR/UrZPdgWXhcGYaWAe3/38+CUKKpD
         g9/Q5xfwZkKHf7245Dx8IyTDvWfeKOROfrDNJCp13p7G6JIZ88P9TXfWOKx8IT/OnJZH
         I1PmXRT90tfoYjyMbRyckdO0p3GmxsW03bc/q9lxmitKBYwaP7Aw3I7PEbiX4CTNUBvT
         xtmA==
X-Gm-Message-State: APjAAAVlSWhl83Qxxdy+xI7fNiqHevuPjmry4CtjmbiwsDbVHTpM5mBS
        GfRokjsVNK4reCDsf+ZTgbc=
X-Google-Smtp-Source: APXvYqwSeJIzZ3He6mdaGu8fUEI1GFMx1cvsK7/HbMJTKLryIrN8fCFQx4VE364WszsLtnqgveVxeA==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr5368725wmk.173.1571935541531;
        Thu, 24 Oct 2019 09:45:41 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c189sm3953652wme.24.2019.10.24.09.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 02/32] drm/tegra: dp: Add drm_dp_link_reset() implementation
Date:   Thu, 24 Oct 2019 18:45:04 +0200
Message-Id: <20191024164534.132764-3-thierry.reding@gmail.com>
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

Subsequent patches will add non-volatile fields to struct drm_dp_link,
so introduce a function to zero out only the volatile fields.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 50ba967ebcbd..c19060b8753a 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -8,6 +8,17 @@
 
 #include "dp.h"
 
+static void drm_dp_link_reset(struct drm_dp_link *link)
+{
+	if (!link)
+		return;
+
+	link->revision = 0;
+	link->rate = 0;
+	link->num_lanes = 0;
+	link->capabilities = 0;
+}
+
 /**
  * drm_dp_link_probe() - probe a DisplayPort link for capabilities
  * @aux: DisplayPort AUX channel
@@ -24,7 +35,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	u8 values[3];
 	int err;
 
-	memset(link, 0, sizeof(*link));
+	drm_dp_link_reset(link);
 
 	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
 	if (err < 0)
-- 
2.23.0

