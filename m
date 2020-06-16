Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF4E1FB2BD
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgFPNyk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgFPNyh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B27AC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x13so20859509wrv.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iUGGlLHCO3otOOHojhNK90R/D2K76Rxe4RnhKkj0ZJg=;
        b=rDV9T/RKG7tgVMzzHfcKh97OGuTfVQ3tZyHdNIw+5vil2PbabFkD8k3EHRhMNbvmA0
         xaigYCxvns3oS/CkHQtJaTgk8dwVg0iz6vNvbjhpq3O+aZ9zAYeC85Kxvun3yinWvL2w
         PKttA7A/fNKVMAtatmAGRioxm3+w6Wq20kswTDSOu7cyQ2/aY+P9G9BIGsZRbdJfDORG
         B0LYAuJKzW2eu9Iid9BRBAjAI3KcCuAxNJ2lkKgY2jyerF0OmljdxJNtwcaPOviCmWWi
         H8/ssoCO91nVDtYu43e4MXx5lmpi4IbDz7JxHIqKFDv2RZhRKTnqKSiAL/Ag8LtlBRlD
         O1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iUGGlLHCO3otOOHojhNK90R/D2K76Rxe4RnhKkj0ZJg=;
        b=oqsLjOv9gBwF5tZ8h2GTByPsOzw/+i4MgfP856IXXvuVhsgd++VsLxC9DK6cpYFLLj
         gwfdbZLXvMzjbAHxn+R4xeh3G5lqI6jTIoRh28a3wYhNImQrc+pjRvgQiHwge1keynOD
         RzetRM5yF6giKrnuhAkH1YCkMuBpCZJH1h/Xt41SjN7Vo7V+UFTmtTcdcx1zacWI1AUR
         cdhgZf2AIsFaR/t5+4FzC6sPjppMZ7vMtUImNySSWJzXUrNoK/Pb7FTrTN7tT5QbqeMH
         w2ptIkQPkY5qPKhRXSQblOEKZQsLHxCHnaDJHorxNdvqeW7xrRBTN4XZ/KKd7qeFmgKY
         ujNA==
X-Gm-Message-State: AOAM531oq+PT7xd/QclONEtfikpBwVD+3R7UnatIis1yc3yuG+VyoK3Y
        5SLTjh4QyMSGUdGbCId+ITY=
X-Google-Smtp-Source: ABdhPJwlysuFl1HhqVqR03E8fIV3rAPMC/xCd2un4eBrG2FUrg8nysVfgPA9K/BElWQqyJRwlKhXeA==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr3127178wrx.167.1592315675040;
        Tue, 16 Jun 2020 06:54:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x13sm1712793wre.83.2020.06.16.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 44/73] arm64: tegra: Add Tegra132 compatible string for host1x
Date:   Tue, 16 Jun 2020 15:52:09 +0200
Message-Id: <20200616135238.3001888-45-thierry.reding@gmail.com>
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

While the host1x controller found on Tegra132 is the same as on Tegra124
it is good practice to also list a SoC-specific compatible string so any
SoC-specific quirks can be implemented in drivers if necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 11a1bb428595..6ebfe503489f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -83,7 +83,9 @@ pci@2,0 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra124-host1x", "simple-bus";
+		compatible = "nvidia,tegra132-host1x",
+			     "nvidia,tegra124-host1x",
+			     "simple-bus";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
-- 
2.24.1

