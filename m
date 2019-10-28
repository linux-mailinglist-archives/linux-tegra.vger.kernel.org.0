Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FA2E7179
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbfJ1Mhe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40298 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJ1Mhe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so9701886wro.7
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eD/3jzkhTttili1L+hDnKUUTcpzreCksFu7kaZ3nllc=;
        b=isl9SFetQ6uOtfd80K61+4EPWD8j7L9JcGCZc82nzVQm6CPSIHQRI2yGIbG5E/6SBk
         yERgD2OTnpMMGK4/d827BFzOocROI6zzASDv4tieJxYqDbJW5LRs+M/T11kuTnYnXuav
         EKLJZwoCkDQHy7nXEMyPBxcg+OboLtPg8YG9DK0tWaFtkhD7lrPHYPHE5xHzXgXjjqHh
         xxzbmxwZD9OATZa41ioak2XZGX6lm8cYPRgw/TBS4ha8obH78XN/Saqbm06+0ZK8df8E
         VwFYnooU5ONhF0lBEy2KQKfcZyhrZoginl47EfbxrR/LSUyeV5Aus94gNHYGdj/xz/ER
         tfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eD/3jzkhTttili1L+hDnKUUTcpzreCksFu7kaZ3nllc=;
        b=XFpmMbMIdJ1CmxnXxUyb2GknzDNBo9M3CPRuy5F7d3Iq4oKr48emL5LFVPVRzz112m
         hU6JFpbNQM5gCXsU4L6TblLw72uORZXdFCoAO0HD9fLwM1XK+r2cdlEN6BLKjP1A9m/4
         wI6a+llqIHjnUqkCEzrcmisgfxHUiaR+ZaOxVLAPZsdrcOpBY9XoqscVKsTjo10U5LHt
         Dqc8HGhWqadxoDYl7vxu0ANjexE0Q1lp0wInSa2EgmWQ3IYbYJUz6yQkHagCrvVBfLRs
         Gopxo/GYjlDFCfih9QTs3wfz/fwwdl6TII/m3jfmx1XJJRNqYxT3iFMi6+ZdRhHIQ13m
         TA2Q==
X-Gm-Message-State: APjAAAWnMbaEu4DpSNsUJxDvOpTJ/wivVgB+kF+5cdw1vWKqk8ncg7Yi
        U7DOCgLXm+IAQ/6ewB5zezxXw2Kk
X-Google-Smtp-Source: APXvYqxJ5QBDdZwav0OKxoV+O0v7Le3RgZKyUoXTyLkXOi/tNWCgpHygWnpuqOrodFLzq79/6dt0cQ==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr14576420wrw.280.1572266251823;
        Mon, 28 Oct 2019 05:37:31 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 12sm12290850wmk.13.2019.10.28.05.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/12] gpu: host1x: Add direction flags to relocations
Date:   Mon, 28 Oct 2019 13:37:11 +0100
Message-Id: <20191028123718.3890217-6-thierry.reding@gmail.com>
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

Add direction flags to host1x relocations performed during job pinning.
These flags indicate the kinds of accesses that hardware is allowed to
perform on the relocated buffers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 ++
 include/linux/host1x.h      | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 9a1c1694604a..efc8a27b9e6a 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -149,6 +149,8 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 	if (err < 0)
 		return err;
 
+	dest->flags = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
+
 	dest->cmdbuf.bo = host1x_bo_lookup(file, cmdbuf);
 	if (!dest->cmdbuf.bo)
 		return -ENOENT;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 1ba23a6a2021..6f8d772591ba 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -173,6 +173,9 @@ int host1x_job_submit(struct host1x_job *job);
  * host1x job
  */
 
+#define HOST1X_RELOC_READ	(1 << 0)
+#define HOST1X_RELOC_WRITE	(1 << 1)
+
 struct host1x_reloc {
 	struct {
 		struct host1x_bo *bo;
@@ -183,6 +186,7 @@ struct host1x_reloc {
 		unsigned long offset;
 	} target;
 	unsigned long shift;
+	unsigned long flags;
 };
 
 struct host1x_job {
-- 
2.23.0

