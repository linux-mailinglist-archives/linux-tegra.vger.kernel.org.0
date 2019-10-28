Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A30E7171
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389043AbfJ1MhZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34812 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfJ1MhZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id v3so9442407wmh.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bg9aLkLfUTKxfTeyqBBqYQUC6FBcU6JFCGZpsj7ndqo=;
        b=MuwMV2cBGxuqCseG0mrSuo2oEvO+qF05OvTD8L+6lNTugvzPzoiKT+VY9diDTdYKG8
         acfPCvEoUa9+cFd0RDm2Lw4lyQCNTAmY/zlOUrU+IbaMfpKN19jayd4th1nY6KvNTAD4
         ADRVRtQ21cB6xqaHotOeynOJUsLGOMEQis5E6HOvf69sIbLOPmXgz4V68rl6PZRNTLIy
         XnfDvtD+YT8iT+c2ABJjzJcgiGpBCUtTwx9Su9y/famXUIvv4sksw7ze1towVxWUHaBF
         vUukp4WxovOCCi8WVyEM2LLZqADbaFzfaKmYfScJYqba4qlkw5LKfRsz3VKn52kbB7JQ
         tQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bg9aLkLfUTKxfTeyqBBqYQUC6FBcU6JFCGZpsj7ndqo=;
        b=D4BgYDP+bEF6/cxO93lWcDrV+MCJ6QIyBtQDM++wOzMYtfi5/jcNOqIUGEJqqIQBWv
         8CCCDiKtRTGmankaXt3IBtnDfqYNJtWzAe1kKzXvegmD8j6mrb0QBvSfnAVt+aaxyeX/
         edfKbdC/A0WuckuJ/+1pc1i53sPeol/iVnTsUUj1G9Fi7oElfXrW8Sv2ceUT2PF6MBBo
         kRsEKrWxg0uw8PxLiHH1dqNRCW+50GlGVLRyE7lhzFxgWtQUb6Ryfm6oGcjZPcB8/vUo
         5EGyrwvWB6Ak2JKfvMHHKq3F53vbQQeFEH6olV2hYi/Ip85+bvPYqFeD1AG5l//QhGwP
         SkSg==
X-Gm-Message-State: APjAAAWK818cRkR0pA9YTrQr/3sdhJ+9kB7S68LMu8PfyoCW2CGXlmn4
        4Eu3YJNkTWKTaQjtyNi4n8Y=
X-Google-Smtp-Source: APXvYqxpcT29LVgI0DeFwPxEVNHmlij5DXWLor/hWFeN/TxAmFIMyCHnv/wteFbMeZzEJoUhBzKEYQ==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr14331126wmc.134.1572266243371;
        Mon, 28 Oct 2019 05:37:23 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s5sm6636457wmj.37.2019.10.28.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/12] memory: tegra: Add gr2d and gr3d to DRM IOMMU group
Date:   Mon, 28 Oct 2019 13:37:07 +0100
Message-Id: <20191028123718.3890217-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

All of the devices making up the Tegra DRM device want to share a single
IOMMU domain. Put them into a single group to allow them to do that.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra114.c | 10 ++++++----
 drivers/memory/tegra/tegra124.c |  8 +++++---
 drivers/memory/tegra/tegra30.c  | 11 +++++++----
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index ac8351b5beeb..48ef01c3ff90 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -909,16 +909,18 @@ static const struct tegra_smmu_swgroup tegra114_swgroups[] = {
 	{ .name = "tsec",      .swgroup = TEGRA_SWGROUP_TSEC,      .reg = 0x294 },
 };
 
-static const unsigned int tegra114_group_display[] = {
+static const unsigned int tegra114_group_drm[] = {
 	TEGRA_SWGROUP_DC,
 	TEGRA_SWGROUP_DCB,
+	TEGRA_SWGROUP_G2,
+	TEGRA_SWGROUP_NV,
 };
 
 static const struct tegra_smmu_group_soc tegra114_groups[] = {
 	{
-		.name = "display",
-		.swgroups = tegra114_group_display,
-		.num_swgroups = ARRAY_SIZE(tegra114_group_display),
+		.name = "drm",
+		.swgroups = tegra114_group_drm,
+		.num_swgroups = ARRAY_SIZE(tegra114_group_drm),
 	},
 };
 
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 5d0ccb2be206..62b30b1b9677 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -974,16 +974,18 @@ static const struct tegra_smmu_swgroup tegra124_swgroups[] = {
 	{ .name = "vi",        .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
 };
 
-static const unsigned int tegra124_group_display[] = {
+static const unsigned int tegra124_group_drm[] = {
 	TEGRA_SWGROUP_DC,
 	TEGRA_SWGROUP_DCB,
+	TEGRA_SWGROUP_GPU,
+	TEGRA_SWGROUP_VIC,
 };
 
 static const struct tegra_smmu_group_soc tegra124_groups[] = {
 	{
 		.name = "display",
-		.swgroups = tegra124_group_display,
-		.num_swgroups = ARRAY_SIZE(tegra124_group_display),
+		.swgroups = tegra124_group_drm,
+		.num_swgroups = ARRAY_SIZE(tegra124_group_drm),
 	},
 };
 
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 14788fc2f9e8..8947bee6d032 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -931,16 +931,19 @@ static const struct tegra_smmu_swgroup tegra30_swgroups[] = {
 	{ .name = "isp",  .swgroup = TEGRA_SWGROUP_ISP,  .reg = 0x258 },
 };
 
-static const unsigned int tegra30_group_display[] = {
+static const unsigned int tegra30_group_drm[] = {
 	TEGRA_SWGROUP_DC,
 	TEGRA_SWGROUP_DCB,
+	TEGRA_SWGROUP_G2,
+	TEGRA_SWGROUP_NV,
+	TEGRA_SWGROUP_NV2,
 };
 
 static const struct tegra_smmu_group_soc tegra30_groups[] = {
 	{
-		.name = "display",
-		.swgroups = tegra30_group_display,
-		.num_swgroups = ARRAY_SIZE(tegra30_group_display),
+		.name = "drm",
+		.swgroups = tegra30_group_drm,
+		.num_swgroups = ARRAY_SIZE(tegra30_group_drm),
 	},
 };
 
-- 
2.23.0

