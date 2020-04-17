Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129561AE362
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 19:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgDQRLZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 13:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgDQRLX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 13:11:23 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BF8C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:11:23 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so3886555wrs.9
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=djzvG6XaGhdYeLytN4z7/I2dAr4mdJr3iEf2jKXsxZI=;
        b=oAB38V466n9u/hH5DZQ+vkvHG7UZW4JmOaoSj+6gJTlpKc2JzmmNd6Y4AW/me6g9EK
         JMoaUMHdIuFVnkRdICPbPzIC8/71ix6u9MuNsZsmuRcPLYZZ8kTQin1mmNS/4P5UyPtL
         7nZnmQNBLMiw0McBwUt509NilnZ4wWAgvZQOigs7TjBQtZGptsaAjojSTSVNDF9v2xIl
         s68GQQzwhxPn4e87DaWiAi2K5BSJidJzkQPOXewQBSy7lSO7A+YjXqj9HR5plwhiqXAE
         NfLPR1hjsiGlV5wkR6morj/8X1/dco3zcQ4nwU2JZa/leuW6L3rcGaHf3w9d4NmMcJpd
         HXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=djzvG6XaGhdYeLytN4z7/I2dAr4mdJr3iEf2jKXsxZI=;
        b=bzovLlb0T4suqvfxO5vih5YXVNXi1/ZXeDkkZORtyXVMfXZZ8NNd+kQyX1/kaC1B57
         HiwUDAUKsJiakDBiKT33J1K8BLA/3bKoJC5au6a9qingj3pP3LiG4yJmJYyueUN/aGUF
         PsoAty4hHqKp290XTmrPg5ljnr8Xfybnxn8HCE99OmL8QER1mcxcJNXnx1r+VioekJ55
         KXP4w+qQTjHrWLFiAmLFNavgaiqsBXVveOfTRPNk+0r0Z8F3pfcePfsjES7xm0j5j26u
         bImK2A9o8wVq4P97XHz0CbTuhGWmFdkh53M+sOXHy3gCH92sES+J3SeYir948U88obp5
         i4Tw==
X-Gm-Message-State: AGi0PubWkCgN1WWa3EX4eDFvsDT31rkGiyWS9oj4Ak3Ipsc67zSwtc7E
        QGFiDBpiR51quDLGdOyEOsKyN+aS
X-Google-Smtp-Source: APiQypJ1hzIsBxZXdPGvU2K3Qy/KAiMo3ErE/EvNDI89dOBXBA7eUV3bLRT0sp4Ki0DRJSz8uxO+uQ==
X-Received: by 2002:adf:f986:: with SMTP id f6mr4875873wrr.221.1587143482005;
        Fri, 17 Apr 2020 10:11:22 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id w6sm29487997wrm.86.2020.04.17.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:11:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson TX2
Date:   Fri, 17 Apr 2020 19:11:17 +0200
Message-Id: <20200417171117.2556374-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200417171117.2556374-1-thierry.reding@gmail.com>
References: <20200417171117.2556374-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The RTC found on the MAX77620 PMIC can be used as a wakeup source on
Jetson TX2, which is useful to wake the system from suspend at a given
time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index da96de04d003..7a0fa157f48c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -221,7 +221,8 @@ pmic: pmic@3c {
 				compatible = "maxim,max77620";
 				reg = <0x3c>;
 
-				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pmc>;
+				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 
@@ -379,6 +380,10 @@ vdd_pex: ldo8 {
 						regulator-max-microvolt = <1050000>;
 					};
 				};
+
+				rtc {
+					wakeup-source;
+				};
 			};
 		};
 	};
-- 
2.24.1

