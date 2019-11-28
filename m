Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0CA10CBDD
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfK1Ph5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:57 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43550 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK1Ph5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so31686532wra.10
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
        b=Ul+EHQu58/zzBjdgiA+xRnMIB1WtzSPokN6O7LS3eVKpgAmKdsOgwROqSQ8Odk+Y1v
         EZ9bvAfT0jIAF5Wr+BM9P2GIilzGyjYx1hK1Ap7p/lV2NdHCj4ksCLEaichMm+Gur5Wc
         pQKx+DVEaasZjKHzLa37KgAfc0gHWdWLfhr8CRp8qtqesSmsR7aIq6XZr7001WyRj7Mt
         1o/qWhbABVisu1a3q1P3duIUCIr4gTNm6KoY1k4EKGf7oGDXDfLL08YyDsnPmCfOmFjO
         pkZm09G/E4C2MfPbnIgEA5nF+TKegW1+WwygiIRQikRL3p0N3F9h3Uy8CLnJyWcHizU8
         PcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
        b=CSTX9lg8jxOqlBXSEHecHOI3O+g6/B0SiT3jwPVCwSbtAXUpzqXpFVPhtehfH5SsjK
         j9ArMf3vrkeb0pnsD4kDnsweRUjy/Np9/8gZeBWDU4IjdbXsbZtRg975Rd97DOYB1OSJ
         gfR51J+Dl1WL4SL60KVLHfpQpZpSH38fu+RzR+FCuWrf+SCVa/WdFIKmaw+SqjkC7W3T
         zW2AXvUC/N0WBxew6PJLqqEN1pZmvXF7m81stDJPO4ekVVrXzf8X15wPWGuEzWscelP3
         5YcufrUmsTKgOZps2Km/L1Q8lhXVzug6brXsVVQ7P6AvVDgaU/64yQu6AHgZIInvMHu7
         HyhA==
X-Gm-Message-State: APjAAAULpJy/MTaE/AdAiAvPE1tbfpp2opC7BCB4FHSo94lOIzBNgjnq
        +TQbPoug+JikQSNVPdkxKUk=
X-Google-Smtp-Source: APXvYqwCi2enm9WVk9Vzi9jS5O75DRxVjDMjX+CMd235U8su11RkDUEiTHNvcQkSgYM6QnmzreDmfg==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr8000464wrv.396.1574955475125;
        Thu, 28 Nov 2019 07:37:55 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id d14sm10958907wru.9.2019.11.28.07.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 6/9] drm/tegra: vic: Export module device table
Date:   Thu, 28 Nov 2019 16:37:38 +0100
Message-Id: <20191128153741.2380419-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Export the module device table to ensure the VIC compatible strings are
listed in the module's aliases table. This in turn causes the driver to
be automatically loaded on boot if VIC is the only enabled subdevice of
the logical host1x DRM device.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 9444ba183990..c4d82b8b3065 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -386,13 +386,14 @@ static const struct vic_config vic_t194_config = {
 	.supports_sid = true,
 };
 
-static const struct of_device_id vic_match[] = {
+static const struct of_device_id tegra_vic_of_match[] = {
 	{ .compatible = "nvidia,tegra124-vic", .data = &vic_t124_config },
 	{ .compatible = "nvidia,tegra210-vic", .data = &vic_t210_config },
 	{ .compatible = "nvidia,tegra186-vic", .data = &vic_t186_config },
 	{ .compatible = "nvidia,tegra194-vic", .data = &vic_t194_config },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, tegra_vic_of_match);
 
 static int vic_probe(struct platform_device *pdev)
 {
@@ -516,7 +517,7 @@ static const struct dev_pm_ops vic_pm_ops = {
 struct platform_driver tegra_vic_driver = {
 	.driver = {
 		.name = "tegra-vic",
-		.of_match_table = vic_match,
+		.of_match_table = tegra_vic_of_match,
 		.pm = &vic_pm_ops
 	},
 	.probe = vic_probe,
-- 
2.23.0

