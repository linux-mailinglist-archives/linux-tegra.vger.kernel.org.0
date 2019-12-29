Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DB312C306
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Dec 2019 16:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfL2PBh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 29 Dec 2019 10:01:37 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44947 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbfL2PBh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 29 Dec 2019 10:01:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id u71so31096792lje.11
        for <linux-tegra@vger.kernel.org>; Sun, 29 Dec 2019 07:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nx0Fu7rX7xP4XMJGjQOllDfFnE/oVAfnVBtfuP67sAc=;
        b=JQMpE4kYmJQVejhCouy1LeH0yTjI3MPuBD2P9GpiBZpk3ZQkuSOpzASleiTq6lI+D0
         RuAZU4r9ezMpnfBBG0TQEe5kpguC7PAHlISnmH0mVqf9OiaaSMGMAvcCwtmLYO3brJqd
         mbpm7BgREJnlEeGUPTATBasWKHYknqPYcbfU9npISdPAXC3i5ud9OhvwzrUUCRuypRr0
         cno5o85rHHx2rmCyjRCuE8n+uOqIC5vlBR6HUnCgvO1MOLSiQONjI6rUlbhzpPGAdtRZ
         9xddVi/EphG5CssKWPlSWGaUq7tDrtS2Mf/ziDGrMd336gdc/THFpZKdcVmyVDTdpnU5
         +rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nx0Fu7rX7xP4XMJGjQOllDfFnE/oVAfnVBtfuP67sAc=;
        b=ddyOdSn7yE7G977Ftt3+Ho4Qta4b2YlXZTRdQ6e5cnalcCtSoZpOvl/YnUKo0yUO4K
         r3GfsgUjOmGpNa9AC8O8tM9Em99GxSYkK0joNpo6510TKhNg4Ham7mefVXvUtwlWwHGY
         oaafY3C0rw5Z5rYX4AHxgYdlu/Yh9CR2fEXbjZSVEtbgMDVqcgzmnXuO3z4tt1Vb1E38
         S6cgZlOQ3G33Gsr3FUSnJhEa4NScoopxq1ELxfi9M6uYm9XKLW4TSRJh8+rSDNoPI50O
         k6HUba54AZXLoGF6VMqRVkOWygZpV4ULKA6SogPuLH577BH523DHzoMgQOU0wix67xRf
         lZFA==
X-Gm-Message-State: APjAAAWaMon3e6diLeu2VZeuvBIp2A9yKDwUhCUU2qCP+QgpdAEOviYx
        P/aO23PUoEV94a7v4+ddyXs=
X-Google-Smtp-Source: APXvYqxVbuXdl7SJZpusUWJf5l9BuKa5fhPWoW4cPtTX06wfnliRL/v5vyxeMwDytMrl1TkH9ckNOQ==
X-Received: by 2002:a2e:8651:: with SMTP id i17mr25936931ljj.121.1577631694939;
        Sun, 29 Dec 2019 07:01:34 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id c12sm17540052lfp.58.2019.12.29.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 07:01:34 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] soc/tegra: fuse: Add APB DMA dependency for Tegra20
Date:   Sun, 29 Dec 2019 18:01:21 +0300
Message-Id: <20191229150121.1635-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra20 FUSE driver depends on DMA channel presence, otherwise it fails to
probe.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 84bd615c4a92..3693532949b8 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -126,6 +126,7 @@ config SOC_TEGRA_FUSE
 	def_bool y
 	depends on ARCH_TEGRA
 	select SOC_BUS
+	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
 
 config SOC_TEGRA_FLOWCTRL
 	bool
-- 
2.24.0

