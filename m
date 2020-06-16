Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA55A1FB2B1
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgFPNyN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE2C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q25so3190515wmj.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0bJaWiGAhJszD2fhBZ2xH/S+esEu46q901tkT6Dtu8=;
        b=L5+uZE3I+wdjwilJ4x8jBjK4vDzKX8qay5GzTqiUDGgf9h/nLUrS/watMlAxNvXgiV
         zu7IegCNJivLmqqIxYGYVi6/0xg6yc4vuPoK4/SrLqD9RuS6S6YRhLtdR5i5K6RaqhBK
         ltzEqBV8OjWReIh2AhKXFoIBPDojWJDscg5KkB3PpKxefx8PspmLwSQn2rAxxy+Y3F7t
         nd6Gy804clL96GDsdPFV05n6fDhNt00XkRRG+P+btYYYSWtLDYFFnVpKS3wnZRP5Gvje
         59ULsigYEGHAoTjEDYdZ4e7l2skUd41bShmAUoqYcfMNH//0oLUj9CexSX5+8IsMICeW
         TNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0bJaWiGAhJszD2fhBZ2xH/S+esEu46q901tkT6Dtu8=;
        b=eq0voActoQzdD2o4ffLcvRDnMkTdMf3XWgHDVaQekexBcjCc2ZPuC9SmgUUEsYIBMN
         FOm2LKK61cUHze4+WL/Ul3gbPHy6pPJj7rgckj/KOIXjFJNW3SOQ2fdnDzgMVjEAMNIz
         2LcByNyLplbDJWYZDcVC68gp/8Ur7hOFwPBYIZst6uPR50IZRjyNSACm61cnKIeim1HZ
         v5J2s9Tquj1OkXxmGtYuclKBzQ/hiKWjVBABBGcHGPT5fs98tp6eloxUuYEfwIv3UG4o
         i4JFPP9c5CiMXfVDstBEVKjaEVyAwV82Ptz3z/yw2PY0PyS+HL19/OXaAXWr9Zt+cEQ3
         lO1g==
X-Gm-Message-State: AOAM531pd/P3Aa2l+A+5D719Itam4rNJud2ZG2cgF+KO+pfs0SVOVFil
        BMEp5ADGLfxAkMkMWSrLx9FXURQr
X-Google-Smtp-Source: ABdhPJzCcs5yosf+6VumZWXzFFZs0nXLbY90G2PWiQYes4KMg/vzkl4qcvOh7mRMNLDG5bnCH5j8Yg==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr3216264wma.23.1592315647234;
        Tue, 16 Jun 2020 06:54:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e5sm30870819wrw.19.2020.06.16.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 32/73] ARM: tegra: Remove spurious comma from node name
Date:   Tue, 16 Jun 2020 15:51:57 +0200
Message-Id: <20200616135238.3001888-33-thierry.reding@gmail.com>
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

This was probably left there by mistake or perhaps was a typo in the
first place. Remove it.

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index c209020e13fd..811c06599bfa 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -527,7 +527,7 @@ spi2-cs1-n-pw2 {
 			};
 
 			/* Colibri USBH_OC */
-			spi2-cs2-n-pw3, {
+			spi2-cs2-n-pw3 {
 				nvidia,pins = "spi2_cs2_n_pw3";
 				nvidia,function = "spi2_alt";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-- 
2.24.1

