Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE8A1FB2A7
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgFPNxp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNxp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:45 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF12C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:43 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x14so20879958wrp.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1hzh7RbaArgZesWRTqDN/FeTVQzKBLSZlz7exAjOze0=;
        b=BBE6diyY98Clf7rBWb0sGxUZG+94G+k5yBejFWt18I8AqePPpW3KvTCx90cGKglNJU
         fic1UEDuhg75rs1f5P96aRW1OS12e2O73f/A3LogF3Fgcvb605UpmVK29YRQHWjZqZkA
         Yc7yJP3TBAvq9UfZ/HgOB/ganbZAyo7zWC8zGPuO18Ailw/0zjG7YSn9jNl+ozBH1DNy
         dl+IzfpoKGhL0SpyqVBLplZkDQfNDtKJM5YJATb9cOo4o5gm7Brq/lRvXiubVQH6px+U
         1cHH2SWgCpsGPb3KFzmAeycOUiaYkciFKMuKgCG8V2hqYS3F92imlwGRTJMIbqR8R9ej
         uMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1hzh7RbaArgZesWRTqDN/FeTVQzKBLSZlz7exAjOze0=;
        b=QmP4m6sfsTiIzF8bm2kAodNGnajNYR/qRf/qXWaVdda+QYpb9xxXkGge07GSvaq171
         I2+YgVA0i6izbjvkUQ3KlBsmUgpi25iunGi6OE7d9t2U67agIfqLOd5sDHJdt1fC5yIF
         zjv1B57Ao0/pq4fvU+5A9jvQg4oZqWlSYE77U98P2RMGKpLPHejrCEe7SRi4NxpZEJT9
         yYYzPI+XEv7mdwoZev/h3QfXgm9Ll0U2g4rTzZO89RnN57/QAq1uXGgZ8wjtP/cX/l8o
         jfRwNWnxG+PbD1neiv/Ki8drHmriH/zoSWwcqDHgD3IzcZ5g/0WHmClHFChyZWNNGdhS
         Q2cg==
X-Gm-Message-State: AOAM530/OI4YQlPNAGA9CjbWXjPJAbDIEh7fdx9fUHJS53xhoUDgC2Kz
        MuJEXh+Zzx/BbfP3H8dtd3Q=
X-Google-Smtp-Source: ABdhPJzMz/BaDg4ZelBnXNDvNp1+Uhdm3/Sxq/uv/BGMXs2RJkskuDLu1IVdwz34s+jI8dVzp+W8+Q==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr3131917wrr.405.1592315622168;
        Tue, 16 Jun 2020 06:53:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a3sm4064332wmb.7.2020.06.16.06.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 23/73] ARM: tegra: Fix order of XUSB controller clocks
Date:   Tue, 16 Jun 2020 15:51:48 +0200
Message-Id: <20200616135238.3001888-24-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is purely to make the json-schema validation tools happy because
they cannot deal with string arrays that may be in arbitrary order.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 98cd7962a559..3840019ed5c6 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -680,8 +680,8 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_XUSB_HOST_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FALCON_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS>,
-			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA124_CLK_XUSB_SS_SRC>,
+			 <&tegra_car TEGRA124_CLK_XUSB_SS_DIV2>,
 			 <&tegra_car TEGRA124_CLK_XUSB_HS_SRC>,
 			 <&tegra_car TEGRA124_CLK_XUSB_FS_SRC>,
 			 <&tegra_car TEGRA124_CLK_PLL_U_480M>,
@@ -689,7 +689,7 @@ usb@70090000 {
 			 <&tegra_car TEGRA124_CLK_PLL_E>;
 		clock-names = "xusb_host", "xusb_host_src",
 			      "xusb_falcon_src", "xusb_ss",
-			      "xusb_ss_div2", "xusb_ss_src",
+			      "xusb_ss_src", "xusb_ss_div2",
 			      "xusb_hs_src", "xusb_fs_src",
 			      "pll_u_480m", "clk_m", "pll_e";
 		resets = <&tegra_car 89>, <&tegra_car 156>,
-- 
2.24.1

