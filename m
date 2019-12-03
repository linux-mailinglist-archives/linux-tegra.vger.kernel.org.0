Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1746B1101FF
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfLCQTa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35880 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so4430256wru.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
        b=UqCeb9VgVsi5yo+3k3wpc86dDAXTjZtAMQHpnCQwMLRJRXbjR/WSS4//0jL9gWcZaI
         i80WwGIoVyhi+MG1ezE5sWd9+NiUgjqlhT8OUOTh8HGdHTe7r+4b6pK185xGAqcae9nA
         5+bD13qEOOJlkB5OKOnD++hQPX6poKgLFef1xobqD2y3vKpfj9mW/pdDxy1bbq08CbeP
         IsepQaNIAOl5M4I1GuQhNiOKPQiI1Zzk969+JbcRTObhGM2KJV5PtRdoeBoWk5OIz1dc
         zI3bFc/YBkF5DKOc8NWsPmecYbJcRRo47HmMqhEQQ5MjIrnLyAKE9bgsXKDrI1lNONQH
         PQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qux6awnp95L6xNm3T6+oYkp3AFsi3QUxGHXoIt7wf6k=;
        b=JU3mYyieoWaVzvWbgjqOp4yFtINGAS/dajPoigBxWUHx4iZE54DSZTKa14GAscSGnc
         kcjHXsk5dh6TXe+CEYXwDmpUdYyYGw1JsdNSzqme0elZ0ePS2SALvYCWkTnutJ4qs00t
         6HCd1IlqaonbbOOyX8i8MSE+0M+KC48OUGUD+S/az9OkfDO7nE6+EU4HVgGmPwut1vZV
         m/oZipYQmRuEpm3nyqUnLCRDAksOaA9n7x3Qi8ns4fryrhHNboqOYxw5HKIXG1Gi0H8j
         4GhBebBj2xrHYFgwcRWgd7Z4dgtc/QpWEjPRtYKSdZfmAFoTfMz6luOZDgBtm/yI796R
         3KNg==
X-Gm-Message-State: APjAAAVhptczu7QiSiafrR6bzqQo6WfaqQfrWkuu4/jMnw7yqpGZ3Gr/
        3Lzs7pJsMXbQgqkrYOMCqE8=
X-Google-Smtp-Source: APXvYqwaplyrvpWZla0pN+4IoaFpU0BdHYNiurx7esWjyDLcNYfr98Ii/Vaq3gdyCmy8OwMNXYlJAA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr5905794wrl.328.1575389968528;
        Tue, 03 Dec 2019 08:19:28 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l7sm4141691wrq.61.2019.12.03.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2 6/9] drm/tegra: vic: Export module device table
Date:   Tue,  3 Dec 2019 17:19:11 +0100
Message-Id: <20191203161914.1312555-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
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

