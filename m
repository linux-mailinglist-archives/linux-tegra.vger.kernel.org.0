Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793971FB29E
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPNxa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNx3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38ABFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:29 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id y20so3172289wmi.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AoEw0rmMW6HiZqYouRCoCNbDuDDB/aoUdZjuFXCUO0U=;
        b=vaCR19h295ikkD9fn123ptat0C96CwhstcKM9rEN+o+xtuRWEvBCAY4e/aSSpBGC6s
         4VQuHQAo6dbEKZlYfTY+gVmBOaCEhb6yCo7Cipwzpx3j6OhYfZyUHMU26EiUjguLTbM/
         /FCXC9929OAvd2bpPkDJsFOE8dDkzH1ZMZlMj7Lbls3pkDyOnVKS8QzY5yf6f+hrB28l
         pQLZQ/ZERpRg5VL4st5dCvJcezUAXnvXT2/4sfQnIpit8AoSVlZFg2OhO5FeqSi5x3GF
         uEaRfdfB7FZzpHRMQptiRWuak8sXOfgJX2ExIPWNVKT+nXQt3JzPwwj8DEQWKZHSq1i4
         w7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoEw0rmMW6HiZqYouRCoCNbDuDDB/aoUdZjuFXCUO0U=;
        b=j1aCkLkpyMHoSoD7Fcknh4pswpgN2bKDvnYGRNXCg25Y3UvZAVtJpRXARaHtEQ8EQX
         824fQzxgqUWLgmQIP37VAQr0gvUhFrvJ19M4sNTbF77izyNmxoAmwECT/yXXSJHEMzjC
         0oc08/McBihIEkbHryQTbQf91RiyPqgom9BMqwDama1/qiGZdPYq7Y5JdK5wY7rFLhjz
         ZpL5dYC5AJlm2Nqam7Jb3T0VgiBSIpPXVnM61DkBQXZar6unnR6fhAKRQji/lT99xdR7
         qekw3x6LxpXO1t0/BjskmlRE36d9b2/dEafVB+/a4KylqTK6ZvQJIpnfhpIDlR9w5Ksv
         m9nQ==
X-Gm-Message-State: AOAM5338CR/ecDkcAV8wDEyDOquZovlF20C3wpKopO8w4WrXZdGONgUI
        t1FT/58HMELJ22rQ3RqsjIM=
X-Google-Smtp-Source: ABdhPJx3t5vU/Fepyh6XekgeXMiAo8JsP+2/2MPBqrGlymim/ySai0wH8Ig324AlJtsEvB4LkqtNfA==
X-Received: by 2002:a05:600c:29a:: with SMTP id 26mr3226251wmk.76.1592315607927;
        Tue, 16 Jun 2020 06:53:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 89sm2412029wrg.56.2020.06.16.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 18/73] ARM: tegra: Use standard name for Ethernet devices
Date:   Tue, 16 Jun 2020 15:51:43 +0200
Message-Id: <20200616135238.3001888-19-thierry.reding@gmail.com>
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

Ethernet device should be named "ethernet@<unit-address>".

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index eb5f4ad0fe71..8f4c11f918b4 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -37,7 +37,7 @@ pci@2,0 {
 			phy-names = "pcie-0";
 			status = "okay";
 
-			pcie@0 {
+			ethernet@0,0 {
 				reg = <0 0 0 0 0>;
 				local-mac-address = [00 00 00 00 00 00];
 			};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 64a18b525378..39a5744dbcb4 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -36,7 +36,7 @@ pci@2,0 {
 			phy-names = "pcie-0";
 			status = "okay";
 
-			pcie@0 {
+			ethernet@0,0 {
 				reg = <0 0 0 0 0>;
 				local-mac-address = [00 00 00 00 00 00];
 			};
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index fdd3e4e3522b..6a3a72f81c44 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -37,7 +37,7 @@ pci@3,0 {
 			status = "okay";
 			nvidia,num-lanes = <1>;
 
-			pcie@0 {
+			ethernet@0,0 {
 				reg = <0 0 0 0 0>;
 				local-mac-address = [00 00 00 00 00 00];
 			};
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 90694d1a3b0c..6544ce70b46f 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -36,7 +36,7 @@ pci@3,0 {
 			status = "okay";
 			nvidia,num-lanes = <1>;
 
-			pcie@0 {
+			ethernet@0,0 {
 				reg = <0 0 0 0 0>;
 				local-mac-address = [00 00 00 00 00 00];
 			};
-- 
2.24.1

