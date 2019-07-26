Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1027634E
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jul 2019 12:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfGZKQX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jul 2019 06:16:23 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:47087 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfGZKQX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jul 2019 06:16:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id d4so52841107edr.13
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jul 2019 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3d8K+IP7Z62EKI1ZjJ9rcL+LSug/j9TnHUjTaLFYOY=;
        b=ozHtnV42uI/pFK8boJa/OE3nZB/tZ629d7jUI4P9ngfaa0e+s+AJHL5509gN+z7KZh
         hLvYxWH7pdd1rd0mE+lBWzi49r3UQRzYFHxpZoqoBCITmUnyfDIbI6sI29mUFr18v29f
         spN76EwDxjQJEjclPX2FRGQUlSpiRnOttnlGMuVDyYYv6AvA8e7tROZVwa/+T96kAOow
         nX/2pcVWEbo8oDjamEH0cZj9tehZuD7D3PHG81tcxWV4E+FL5aUhJpVQ0rHMTBqCAVRy
         K3Y/g/UH7mAy3fPg3yjelAf6Shmrnrahle2j/fZjYCu5nffqoGKl3RGBdtl8/k2FwDtD
         tPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3d8K+IP7Z62EKI1ZjJ9rcL+LSug/j9TnHUjTaLFYOY=;
        b=kdGF1ueVbne0x92lgzrfb1cBmr/t3+0dPsD/8HDJG0Cqj6K6gMOq9we1hGwp5pTWEE
         mX9LOLC9rJm0M0cwl5RQCz7vJKL5QRbdgm8qilJkWktW8uP284J8H7/5eXAhZGBOXoyv
         DkQcMkPSODN/gL7m3W6fbZoCNhKdMicUxMTFGOoSV0zKtDre2dL4woFcqG+NXb667VtE
         GqkVQeY4CQNKzb2kTNp3bPPKiXYNCwWrlG1XQcjLuAcv6KAhYZlnGqVKArIodjfBLUdE
         PMtWGHdYjAMUqbzepFX5qnlve1cu0M2xEJu5SX/YlpvvwFPCipbpmeARZjpDbx3SmERJ
         vdjA==
X-Gm-Message-State: APjAAAXZAG8VqJ3DGJhtA6BVFRMGjnwsn7DaPCbbU2ZStDhi999CJvYV
        S92y1y9++bzR/P5ll0OXR+w=
X-Google-Smtp-Source: APXvYqyKsM9F2qOnBdoZ6kxjChFZSQTUooFmd/W2XILTJVP936B/RF5aWf++WDglXdzQi56RsbKvRw==
X-Received: by 2002:a17:907:20bb:: with SMTP id pw27mr69989946ejb.93.1564136181254;
        Fri, 26 Jul 2019 03:16:21 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id 34sm13960589eds.5.2019.07.26.03.16.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:16:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] arm64: tegra: Add unit-address for ACONNECT on Tegra194
Date:   Fri, 26 Jul 2019 12:16:17 +0200
Message-Id: <20190726101618.26896-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ACONNECT complex starts at physical address 0x2900000, so give it a
unit-address to comply with standard naming practices checked for by the
device tree compiler.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 740aaf597115..fb0b9fd0b405 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -11,7 +11,7 @@
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
 	cbb@0 {
-		aconnect {
+		aconnect@2900000 {
 			status = "okay";
 
 			dma-controller@2930000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 2597eb7f747b..923415fd72a4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -59,7 +59,7 @@
 			snps,rxpbl = <8>;
 		};
 
-		aconnect {
+		aconnect@2900000 {
 			compatible = "nvidia,tegra194-aconnect",
 				     "nvidia,tegra210-aconnect";
 			clocks = <&bpmp TEGRA194_CLK_APE>,
-- 
2.22.0

