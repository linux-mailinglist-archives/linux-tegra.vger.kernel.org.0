Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC0D1FB2CB
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPNy5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:54 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4D0C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b6so1731701wrs.11
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QXMHdTSjKnJTBQa+yeQ6TFk/aEjdgmbMfG2wiWsT72M=;
        b=EDytKPF67Kca8PxTD99/qP0+/Wj7QFQI3dL50eTw54CjHBD8+DUtjPb3NIrSzhoWT5
         CQ3x0ptbKZxTelIAeLaoAMjxJCujZFcgSDc0USIe9HQR4Trnc+mG+iS6T51UGQvFSTLN
         nRnvX7L7bkC8Yqscse9fDO7D+V962xsaP/RCCwynTV+NdV3mv2uoMibQAGfbdTehfLMp
         WF4IqhfuIJ6SNr2Um2Uu3nQtnyr+QCsU1e7+Aqch8C5Mt6Mso7irh5Iyz6O3f+9XX5+Q
         6kzOqHaC9ZJIrYEFul5kTuxP5L9359jFUyJJqyci2nxM/EigdKteJqQfufxGzsrDcV7N
         FgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QXMHdTSjKnJTBQa+yeQ6TFk/aEjdgmbMfG2wiWsT72M=;
        b=OvEFjVWBcnzjAXA3zfW7+EiYk6yZmJ9na4fRz0mN4h5hUc/+WbhPqnxZjooErm4vzW
         tlknBiK9SIGD7oe3U0fl9J474SWdkLPFRmDIT1I8uiNvzsRmi6DUUlqQqP3QGVewY5Rl
         sELum1dW2gjPHmkEpJUXxyb520K5k7XssFRHxsrHVYnkuTWy8Fh/6m40Wi3ac4WMhgYX
         MeyfZoi2Q71mpDbxVhuh14gZYMXAw3A7Q5EgqazLrx3AYKrJdQNjyVJNeeg+/y7gWscL
         KBex1CVUPpX31E0iqa8AheonqP3kmBrEvgp1M7RB/cfQ+sS3YTtwtaflaSQ6gZUipu7k
         /TFQ==
X-Gm-Message-State: AOAM533y3N/apKTJvy2fcZyB1y3aRWtTfkYIg+vCEDpnRmFb0iMhjaVV
        pppiOZxFQ9Qgdk+eRzzH2qQ=
X-Google-Smtp-Source: ABdhPJy0/S0KAmsoECEct/X2U6rXeakk+08ygv95OV1lQM7msU4JDMhCOceAP/jFaAKlI2VyrBfaNQ==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr3226956wrx.61.1592315692287;
        Tue, 16 Jun 2020 06:54:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j41sm539180wre.12.2020.06.16.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 51/73] arm64: tegra: Remove undocumented battery-name property
Date:   Tue, 16 Jun 2020 15:52:16 +0200
Message-Id: <20200616135238.3001888-52-thierry.reding@gmail.com>
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

battery-name is not a documented property, so drop it to avoid
validation failures.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 1 -
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index bba8a4b82b0b..bb45ca6a5cf2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -781,7 +781,6 @@ TEGRA_GPIO(J, 0)
 				battery: smart-battery {
 					compatible = "sbs,sbs-battery";
 					reg = <0xb>;
-					battery-name = "battery";
 					sbs,i2c-retry-count = <2>;
 					sbs,poll-retry-count = <10>;
 				/*	power-supplies = <&charger>; */
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index d32053934f3c..9f630ecc06bc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1330,7 +1330,6 @@ ec_i2c_0: i2c-tunnel {
 				battery: bq27742@55 {
 					compatible = "ti,bq27742";
 					reg = <0x55>;
-					battery-name = "battery";
 				};
 			};
 		};
-- 
2.24.1

