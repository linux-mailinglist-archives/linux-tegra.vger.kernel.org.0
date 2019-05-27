Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86E822B246
	for <lists+linux-tegra@lfdr.de>; Mon, 27 May 2019 12:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfE0KfJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 May 2019 06:35:09 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50787 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbfE0KfJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 May 2019 06:35:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id f204so15660037wme.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 May 2019 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qHnemxDd/2kUpim9rlgQmmcIZc8mqNvWZRwHX4+Gm18=;
        b=NIYAmIydLKqJ5DEiR8RS95LVG2Nw/nQ/zVTgu7q9Jkb8V5d3QCa9GwhVP5lL4UIFYr
         Qgsdmn1cduxy+UnWPvnMGoQRRKAnbQcuTQrplTRcsrwEmT9ak+eO4yiYny6RSe+3EY5s
         27Ph3DtjCu6pRioKnahGFwp3O35I+C5K0W4L1GWW2IiP/sujE/rDkRQXwlV67Hu5dtJm
         39oMTqwMgu4VUn+kzNzpOptalN31kPZ4jb0bUC9F4vcbtib5OJufFzGn62/7wPeHrUXE
         1Vb9axuY2knmUdhfKaoM5qZKPkOg2FmxChkC3/AqjqE+WyXKGB91euzKwqkqICZgupxA
         DjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qHnemxDd/2kUpim9rlgQmmcIZc8mqNvWZRwHX4+Gm18=;
        b=sI/Dmiofx1EFeKhQR7+zagy59dNoRCcAkA8WoVVANVZspGGJnsS3V5jL3tOoJCz7bF
         bRtG16ZRdNsw7j37fjbKzGmGz6vtcBH0ONbmyNJl51M/tgzPHZ9GqF9FwnLMpBpgC2X1
         o6VmCsrxzapz3wwAw9XG1kjeUeykN3zqpTX/vt9DiFgW9Jk6lb9Z6MC+uSSe3e1RPFJw
         +A36MUew4UoWr/AWn5tDYu4Eyobg0l0aIsJNqPHyfrclxU/+ObfCdImlG93AubyhNTMc
         ek3Bfg10z8KRd7ei5BSru8NKJB4NXBjw0YePf5iDkYK/YsMUVb40PAXM//t9ef8ufda5
         gFjg==
X-Gm-Message-State: APjAAAXrPDGoJ1djV7nHxFjUcSEcH/AVbrxkNRPVKq8cCk4cSzwqHKvS
        9sHxekJIUQukCgr+qsXLEQ3M1ww+
X-Google-Smtp-Source: APXvYqzRxvC3i+uHla6pZwuH1Ll6gQwF8fHBx9OastYnopgPxp7Peo8hrAlHbvQHKJn3r2YfQXStQg==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr1309320wma.27.1558953306777;
        Mon, 27 May 2019 03:35:06 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l13sm9888989wme.37.2019.05.27.03.35.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:35:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add pin control states for I2C on Tegra186
Date:   Mon, 27 May 2019 12:35:05 +0200
Message-Id: <20190527103505.8384-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Two of the Tegra I2C controllers share pads with the DPAUX controllers.
In order for the I2C controllers to use these pads, they have to be set
into I2C mode. Use the I2C and off pin control states defined in the DT
nodes for DPAUX as "default" and "idle" states, respectively. This
ensures that the I2C controller driver can properly configure the pins
when it needs to perform I2C transactions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 426ac0bdf6a6..00bd4ce80fa3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -173,6 +173,9 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C4>;
 		reset-names = "i2c";
+		pinctrl-names = "default", "idle";
+		pinctrl-0 = <&state_dpaux1_i2c>;
+		pinctrl-1 = <&state_dpaux1_off>;
 		status = "disabled";
 	};
 
@@ -201,6 +204,9 @@
 		clock-names = "div-clk";
 		resets = <&bpmp TEGRA186_RESET_I2C6>;
 		reset-names = "i2c";
+		pinctrl-names = "default", "idle";
+		pinctrl-0 = <&state_dpaux_i2c>;
+		pinctrl-1 = <&state_dpaux_off>;
 		status = "disabled";
 	};
 
-- 
2.21.0

