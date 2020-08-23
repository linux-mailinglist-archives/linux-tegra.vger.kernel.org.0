Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF1524EDB3
	for <lists+linux-tegra@lfdr.de>; Sun, 23 Aug 2020 16:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgHWOs3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 23 Aug 2020 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgHWOs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Aug 2020 10:48:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FBEC061573
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m22so6799964ljj.5
        for <linux-tegra@vger.kernel.org>; Sun, 23 Aug 2020 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3AYMZdZ2Ew5uhUiahMxVm+mxl2q3eNV8uA4cpCzA+kc=;
        b=HoFH01TKRdXI25HIa79/3AhicwledwsohaT79RXct5fPThmhRitEPOZoyaPrBOSEFM
         dcqh9ODYzGvJd39Q7gqqXl6JjTGvJ9lkkl2mgsrFiTpcUMN3dW+sX6TideK8sVlhSnm+
         R5vJjbk8C3TQ3/ua8zsGeSMzH0Qqv6rGr2stfNxapdQ8k6b+8g3Y0GOu+GPxyq1M8nzZ
         TbQaBjkrrEdBOYeeAego5LZsP2OZO0qSQiTbgHiyWxkKHFoOrDpOec7r8ra/xBgOFvhH
         uMxp39L6CL3FqBUENg/h9kGvqFT11jCyqfgpKTDqPJ9OOOfleWdRp9SK7bHGjwm20XzB
         SN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3AYMZdZ2Ew5uhUiahMxVm+mxl2q3eNV8uA4cpCzA+kc=;
        b=E6uRRFGTfyKe7sU1ev7gQwgWuhVs2dz3aCoreinqcP9e0Zfb+qhgeKicWPgYMtbxod
         IbACUe174FrB9cdaBx1wguN/21tUkcO1FSqqK8Miaz/4UjHQENvKK8thOZLFsiQiBzHp
         V9z5yC4qbHZotNddCT4eRAPL5kuYf3rm8Ov+Qf+cV3n5OR51DqpaXVdny65Q1ZuJQYFT
         LG1Y0eMDWwwkuBTHR3JqibfdR3mW2ngOI2YxY3x4IAptswvMt0sTj8dm3Beh5kbxfRpV
         /D/m+HQjvsGidHDKCEoPO7gJ4vIFgNl+epMoRjV4KfP0rkor3Mr2N+xnH5p5cv3Xr2p8
         vlww==
X-Gm-Message-State: AOAM5311/+wPlcbYhBWDL97ltQx0iJRX+IZndnJVVLVPus7Jhniuuutp
        vgjeeuwNbiFERBqkXkkuSY5i/lDhAsA=
X-Google-Smtp-Source: ABdhPJz9LI4BCGGOiFa0dGVaFtNNYUaCfcqVpc4hRk5niQ6Xyjh6o7HEN3l/wKSWThOQYrtDa+qY0g==
X-Received: by 2002:a2e:9ac5:: with SMTP id p5mr788439ljj.253.1598194100795;
        Sun, 23 Aug 2020 07:48:20 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id l24sm1635560ljb.43.2020.08.23.07.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 07:48:20 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Wright Feng <Wright.Feng@cypress.com>, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/4] WiFi SDIO fixes and improvements for Acer A500 and Nexus 7
Date:   Sun, 23 Aug 2020 17:47:21 +0300
Message-Id: <20200823144725.28299-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

I was debugging WiFi performance problems that I started to notice on
Acer A500 and found couple problems. One discovered problem lays in a
wrong SDIO PINCTRL configuration of A500 device-tree, others are found
in MMC core and brcmfmac driver.

This series fixes the PINCTRL configuration and improves MMC clock setup
of Acer A500 and Nexus 7 WiFi.

Big thanks to Wright Feng of Cypress who indirectly helped me to notice the
PINCTRL bug by showing MMC IOS info of the BCM4329 setup that Wright uses,
it lead me to re-check to the PINCTRL configuration!

Dmitry Osipenko (4):
  ARM: tegra: acer-a500: Correct PINCTRL configuration
  ARM: tegra: acer-a500: Set WiFi MMC clock rate to 50MHz
  ARM: tegra: acer-a500: Use PLLC for WiFi MMC clk parent
  ARM: tegra: nexus7: Use PLLC for WiFi MMC clk parent

 .../arm/boot/dts/tegra20-acer-a500-picasso.dts | 18 +++++++++++++++---
 .../tegra30-asus-nexus7-grouper-common.dtsi    |  5 +++++
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.27.0

