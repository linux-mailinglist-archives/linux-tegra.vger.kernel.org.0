Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7944F222528
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgGPOTP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:14 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648F5C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:14 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n22so3807263ejy.3
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJRt1d0tuOJa8Fmf2Td5qwrg+gnX4K9VBuBPB08W6pA=;
        b=TSBmscnHkyQR3/JE6MHEYu70nLn0cylf0xdKyZBn1bptqT6wcFCGhVVcIlCB8hbcDa
         87S+DPuu6CA+y82kDezba2/cZWCtmll+11ev4CzhHhDCJ1shKu77cPL9IhXFgTT08Mne
         rHe0H2iezK8thNDE06leZyeVzMgPWwPiCRTDy5WhN4wZBUJ/OdmTkBEMfRz+ecnISF55
         A3Sjbm+MkDfy8xDewDtigd6kQczqD6GuphZ+3APOj0StIFVcp2jNLwllJZJKi4ToLgZ3
         qupP5WoGbKRv5Izs8h5YqJ+NITCmnqPGsbXHS89I3Iwi4MsdMY8CyGN4/xbDjlsQRjni
         8kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJRt1d0tuOJa8Fmf2Td5qwrg+gnX4K9VBuBPB08W6pA=;
        b=tRlO/fKtyGfkziCv2l/Jr2ECMDVrzmah5HCoW+iWhTr4wYvmOsdeWhoC/uo7xzepUS
         ShZlDh6wjj6+0sv+v1zsz2M/MJNi/e0uQzZraMVOtH2wZtxkLqO1TTUTefxgI37ACEnA
         ZLFGfPJec6OzVmL0wzznCx2hgJC/SrLBMCvpheBrllxT4nl7AnGhl5y1035gUqDmUbCK
         8CyMf016+yr5lpP8KDjo26YLXILjnETOKZ5oxKrguPbtN9yDAiqnSI7vhMbZVaE3rZki
         JPEHf9ltQ+y2GDltGd8bHXuGQQ98Ww6SXjmzikaCSOJMm2HkbTerULfjcmm3D4Psoysx
         rvtw==
X-Gm-Message-State: AOAM531E4fImz+E9OBPpFG765nyDwLFi34xXUi4gcpPkjq1qPb/Q+8BN
        eECbJSmM0x6YZQdHLgUpYak=
X-Google-Smtp-Source: ABdhPJwat+/nqVVdWV013vBqcSn/O3qjSdM5/ozEVK9nSvae2FeNCIy2z7O9aIHd17bK99+doM7ZPw==
X-Received: by 2002:a17:906:1a54:: with SMTP id j20mr3854851ejf.455.1594909153137;
        Thu, 16 Jul 2020 07:19:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id fi29sm5097702ejb.83.2020.07.16.07.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] soc/tegra: fuse: Extract tegra_get_platform()
Date:   Thu, 16 Jul 2020 16:18:52 +0200
Message-Id: <20200716141856.544718-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function extracts the PRE_SI_PLATFORM field from the HIDREV
register and can be used to determine which platform the kernel runs on
(silicon, simulation, ...). Note that while only Tegra194 and later
define this field, it should be safe to call this on prior generations
as well since this field should read as 0, indicating silicon.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c    | 2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 5 +++++
 include/soc/tegra/fuse.h               | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index d1f8dd0289e6..7e6b6ee59120 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -336,7 +336,7 @@ static ssize_t platform_show(struct device *dev, struct device_attribute *attr,
 	 * platform type is silicon and all other non-zero values indicate
 	 * the type of simulation platform is being used.
 	 */
-	return sprintf(buf, "%d\n", (tegra_read_chipid() >> 20) & 0xf);
+	return sprintf(buf, "%d\n", tegra_get_platform());
 }
 
 static DEVICE_ATTR_RO(platform);
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3cdd69d1bd4d..89f1479b4d0e 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -47,6 +47,11 @@ u8 tegra_get_minor_rev(void)
 	return (tegra_read_chipid() >> 16) & 0xf;
 }
 
+u8 tegra_get_platform(void)
+{
+	return (tegra_read_chipid() >> 20) & 0xf;
+}
+
 u32 tegra_read_straps(void)
 {
 	WARN(!chipid, "Tegra ABP MISC not yet available\n");
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 1097feca41ed..214908fc5581 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -23,6 +23,7 @@
 
 u32 tegra_read_chipid(void);
 u8 tegra_get_chip_id(void);
+u8 tegra_get_platform(void);
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
-- 
2.27.0

