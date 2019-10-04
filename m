Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF29CB295
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 02:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732285AbfJDAAW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 3 Oct 2019 20:00:22 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39849 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732203AbfJDAAW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Oct 2019 20:00:22 -0400
Received: by mail-qt1-f195.google.com with SMTP id n7so6180563qtb.6
        for <linux-tegra@vger.kernel.org>; Thu, 03 Oct 2019 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKtZv54n4MZzkkLVmGwj++RGlAv7GhrmXetpsGQZicA=;
        b=Y+YkQPiSn2EAQX82bP5XhjQIUiuk7g2GNOF8Bo1/3WEleTt81okdNoX43mhyydQKkL
         S9hlPy45zxfhO0CqrB6yYR9xHsjtaQw+dX5WS9OQiooKBfdeoeVWzQ6Mv9EzQNI0gC6Y
         OuTg7FpnAZ4T0cOH2cUYTYH3q2PPzrildyP4CiaFtv2OAB32nZNhe4dOsdq+BgL/RPVC
         TiZhzpSQv5C5oNl4UusrOuhncoBgSgKpYusUoO6oWcxMnwv8KlvZ4UvA5m7XBVZlu52k
         4RK6P5YhlU8SrADL+7n1h6vwZs5knDb/WC27yLAcs5d3IJ3GDvSdmfCp6kwWnTfyobUd
         CshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKtZv54n4MZzkkLVmGwj++RGlAv7GhrmXetpsGQZicA=;
        b=PPf1t9gsPKs08k3yb9pQDB9pI3bJmghTW0vvCvGf5mxbao/b2N8PbDqzwd/fxFGKh8
         +fDekDxueDE7/4OC/EOkWyaaUgvK2V+URKLm9oqLhNg1VzqtgeoBf6n2SMjeKSI/JpFr
         A+ATsES8iK/W3JwPHaajS6YBKjJ5w6TXKJJ9rcM6eGP+sWQr/yf6muveqNNuXWH1bop5
         M9A1un7fhfxIpUJiLkOSf/LO8EIjwzrTBgQzYkCXEPPqmslaGg20iRMVylnvctMwXi7q
         lzmfK5QNB0YNODmrofKxGR3kPQoSzCnnzpRX37WSVOb708pov/oPx9Fpv5t4juGgGMvd
         YEPw==
X-Gm-Message-State: APjAAAV3h4WIfJHB88q1Ju/tSjHsipBNdCDPe1YnLJTYS/A7xnNAVcwk
        sYXWzv0e7NcnpfrscteiJjE=
X-Google-Smtp-Source: APXvYqzI9zw6UszA5S/VMtruaHb1KM6RdNGQ2JEGAXDZA6slStvh9OO5kn5ZwrsGw7StENrWMC9TDA==
X-Received: by 2002:a0c:e0ca:: with SMTP id x10mr10936119qvk.155.1570147220939;
        Thu, 03 Oct 2019 17:00:20 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:985:aeca:d5d1:6523])
        by smtp.gmail.com with ESMTPSA id c8sm2248848qko.102.2019.10.03.17.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 17:00:20 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH] arm: tegra: enable pinctrl_single by default
Date:   Thu,  3 Oct 2019 20:00:17 -0400
Message-Id: <20191004000017.31656-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable PINCTRL_SINGLE by default, this is required to enable
GENERIC_PINCTRL.
This prevents tegra_defconfig build from failing with the following
error:
drivers/soc/tegra/pmc.c:1753:3: error: ‘const struct pinconf_ops’ has no member named ‘is_generic’
  .is_generic = true,

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 9a2f11a780a8..c9e6d0f8917b 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -130,6 +130,7 @@ CONFIG_SPI=y
 CONFIG_SPI_TEGRA114=y
 CONFIG_SPI_TEGRA20_SFLASH=y
 CONFIG_SPI_TEGRA20_SLINK=y
+CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_AS3722=y
 CONFIG_PINCTRL_PALMAS=y
 CONFIG_GPIO_SYSFS=y
-- 
2.17.1

