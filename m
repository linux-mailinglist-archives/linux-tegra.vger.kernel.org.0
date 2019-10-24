Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB7EE3888
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439729AbfJXQp5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:57 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37478 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQp5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:57 -0400
Received: by mail-wm1-f66.google.com with SMTP id q130so3102052wme.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9SI3/7KEnup2lABZq6qRUS5Tek0bF2ZiqM4PxAGcko=;
        b=FEtaRflDCATBZy8YPHJkPoNZVI+yjg+9VjgnqxeMFx6vAZhLUk8mRG8xCoG+d3rNp1
         f3VMurZmZPX8x88uMccNkkdt6pmaLN1eDL8FfFsIKr8DcxrZw/0QPQd2xWbgI3Pgg66N
         D+sZPN7nZA64gJoym+9feP7BEeKm+DdQDlO7HcArGQyY+jIyh0sMJVOI2hYACucjYbsp
         jghzqa5oel8g7x9wtl5T6fGvdKoUTHU4BpguPWO+txD+e8RFQdEX4mQJ17+xOVJm9Dkq
         IEX6OPGy9W7qHXurNA3NALVI/QjVSq0IhXeIx/3+5fGiyNbo4lu+WQ0GeB4NSX1D3P93
         INYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9SI3/7KEnup2lABZq6qRUS5Tek0bF2ZiqM4PxAGcko=;
        b=Z6NoGNqjRjNQRuUXuPs/qxkmppfg6j99BezdqE7c9H76awtm5d3yk0U5MHjBnkL1Dr
         g3GCIV7einASaWpPvtzl0DVT44b22zHa1u2uAsOn20RPgG8FfE0MkqHD2xNFJ0vfYnZH
         1Q4Aln6XzfgIZrz9fqTmmrO0zGbrxHPlnuO/TjN8wCl7UK+Dc3htQOTr+x8YD3JCHCJT
         bSYIobWFI2B4aBF/YrxApzN3phEEyykKHVZz93+o964JuNfC5tuLi9Zfq0B0Su9yGNTu
         im0nDBFkItaEwPHu7p+/8TFHqs3pA3BIZkHj9c2ZADndfTpsbHOKo8Rwf501SVrUtHXC
         k0sQ==
X-Gm-Message-State: APjAAAU/8lHxt+7msLlrHQLe5BbiqEvxJ8x7kiuKu4ebyLx95BdV6dHk
        WzZopkjTITnJmqBrUSoSQdw=
X-Google-Smtp-Source: APXvYqyv4rA+Hp2xsAFcvJ/wzAlNSBiHkV23Ji4mYrcVhZFeenfluQxWhoiaUWPwAAuh8N2LBeogSg==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr5975598wmh.7.1571935555583;
        Thu, 24 Oct 2019 09:45:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id p17sm22595775wrn.4.2019.10.24.09.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 08/32] drm/tegra: dp: Read channel coding capability from sink
Date:   Thu, 24 Oct 2019 18:45:10 +0200
Message-Id: <20191024164534.132764-9-thierry.reding@gmail.com>
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

Parse from the sink capabilities whether or not it supports ANSI 8B/10B
channel coding as specified in ANSI X3.230-1994, clause 11.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 3 +++
 drivers/gpu/drm/tegra/dp.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index e22ebab677b9..0bd87cff4575 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -13,6 +13,7 @@ static void drm_dp_link_caps_reset(struct drm_dp_link_caps *caps)
 	caps->enhanced_framing = false;
 	caps->tps3_supported = false;
 	caps->fast_training = false;
+	caps->channel_coding = false;
 }
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
@@ -21,6 +22,7 @@ void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
 	dest->enhanced_framing = src->enhanced_framing;
 	dest->tps3_supported = src->tps3_supported;
 	dest->fast_training = src->fast_training;
+	dest->channel_coding = src->channel_coding;
 }
 
 static void drm_dp_link_reset(struct drm_dp_link *link)
@@ -67,6 +69,7 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	link->caps.enhanced_framing = drm_dp_enhanced_frame_cap(dpcd);
 	link->caps.tps3_supported = drm_dp_tps3_supported(dpcd);
 	link->caps.fast_training = drm_dp_fast_training_cap(dpcd);
+	link->caps.channel_coding = drm_dp_channel_coding_supported(dpcd);
 
 	link->rate = link->max_rate;
 	link->lanes = link->max_lanes;
diff --git a/drivers/gpu/drm/tegra/dp.h b/drivers/gpu/drm/tegra/dp.h
index 999078812943..984dac21568e 100644
--- a/drivers/gpu/drm/tegra/dp.h
+++ b/drivers/gpu/drm/tegra/dp.h
@@ -35,6 +35,13 @@ struct drm_dp_link_caps {
 	 * AUX CH handshake not required for link training
 	 */
 	bool fast_training;
+
+	/**
+	 * @channel_coding:
+	 *
+	 * ANSI 8B/10B channel coding capability
+	 */
+	bool channel_coding;
 };
 
 void drm_dp_link_caps_copy(struct drm_dp_link_caps *dest,
-- 
2.23.0

