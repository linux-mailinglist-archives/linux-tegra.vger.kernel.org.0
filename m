Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131D5D9030
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732449AbfJPL7X (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:59:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37762 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387750AbfJPL7X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:59:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so2465697wmc.2
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TTm1yH+LKe82ax9D0+gMsm0IzcThTKrWjWeqmPcRo4Q=;
        b=IhsDAcW0Ex+z+6pdOZExuZsmXvbnSknUgpjM+C8pNypqYVT+6firf0jcv1NiAji4YL
         eerfIvUqKXg6VsLixMS/+89VReg3BeK++mY/TGECBUaHfAIGK+aSeVqZxJq/ivhPLVaf
         vhW+SElQsrAKlxqlhhvreGiza8r8TV9fkiDtbnsSA7MNuGzp+OQWl0kXnaBGaIxQRA1C
         qSxrW85ScpUoKQ3gKMmqwr+MZgByIZhBuCU//EqJy0PbFU2f/WNy3qjqhqeFgYuKLDgs
         5G1W99l+3Jxw4PxS7Xf3MN61i4180ogqaHoLkdHn4KYuNanW1G5ZFV0Qp01zRAzscZNg
         +2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TTm1yH+LKe82ax9D0+gMsm0IzcThTKrWjWeqmPcRo4Q=;
        b=lMVNXfVqG/Ro34heNMEttZGtS72VALel2xpW8CN0Fptjb+IFRhEeUNdfJpNTHWhjYV
         LvXcgcDyjgqCCkDeybmnaxW0zSAmPgOYS6/7ujIBaI1jR8i3gt42zadQh/eiGsjaspXy
         MuKGxjeiR9gLEBZ1gszAiGctJ7wIN79crMuUvjkFqPvscJfGPqMfrEV4axnJAdTJmM4r
         x1RXA/Ef3GHVBQqGmkXotL2dcSb/me5K/vH4bEH80sFDZtiwbS4pr+i6s0JUlztMYOI/
         jjeiKIFdKtCE2D7B8vCiX1y26HVT8QgNyC5Fm6oxOktlGpGy00ns+udxayDXiWS9pPPO
         uMmg==
X-Gm-Message-State: APjAAAUkJbEDGIO0B1y4vyowxg7lBNgeHZnp271psfFHHDcO25dIeHmW
        FfTmpltPc7snAfOgm2vtz+l0TcBy
X-Google-Smtp-Source: APXvYqxYV5qngHAUNy6ve0WZ/TAfb2JvKCyAnp6IFM2+F+42LoB79alldK0IkxLw/O+j22D5XVmfCA==
X-Received: by 2002:a05:600c:21c8:: with SMTP id x8mr2831499wmj.123.1571227161103;
        Wed, 16 Oct 2019 04:59:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id o18sm6131567wrm.11.2019.10.16.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:59:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/8] gpu: host1x: Add direction flags to relocations
Date:   Wed, 16 Oct 2019 13:59:10 +0200
Message-Id: <20191016115916.1769133-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115916.1769133-1-thierry.reding@gmail.com>
References: <20191016115916.1769133-1-thierry.reding@gmail.com>
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
index b74362cb63eb..959086644b52 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -311,6 +311,8 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
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

