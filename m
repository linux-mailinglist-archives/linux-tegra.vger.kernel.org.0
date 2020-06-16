Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637771FB2E1
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFPNzb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgFPNza (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D4FC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l26so2973894wme.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m+Oy5TCjklnJXJnTpsKQEAS9YPNmRw7/jZUo1uh4cXY=;
        b=LxamS/MKqnBLmNYe28YdSGsQ2D8LWMfmQDzPPPrawRoo0jK+j9uVCTVLqs3pRS/lLV
         fPfBQTV4wbWNspZy2uIfTzJLjaPx88EiNXMYxUhzlj94j4q3Ua6rTaCdigGBt1p3vAED
         EsLzN8r3e7G/PmEt1aeNOjqoo63QtrqHRoEJ0NbE9VuZ9zjOQVvGH8EU6yxURx12AARe
         YTMteZDPpvpcq2c7rfr4RUc+BoMcVO73enc2RF6ANHiWUarzlVFt8MkXya37iTOScJgU
         aN4QX72MwfXU/uMzvNOrO9+IUZWhYtoLMPNs8DIZ0zePW1mYaDGMcvDLoBpMbhImHzH+
         i1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+Oy5TCjklnJXJnTpsKQEAS9YPNmRw7/jZUo1uh4cXY=;
        b=YDgg4+f4FfQj9iW33suHQJbmd0ohNGzMgiJRSfPsCZoiz8H2KnxbPdf7baiSb03FAj
         20qcGJtRiB3xdCQhaKbsAOCYEbzTRYCJ6AsJlRL8rTcejDsjjwC5z758QmTkKNqsCeZ4
         GAweeLGqmREWqhgFm+a27nTFz0OQRcQ+02YQhLh3eHXkRM/J4LpVPSfDHRh3j1IxAaeM
         0/6e/aOtWQ5Tynp1K8IwTlN6ou8P8zFsmTyiZEVkYy9RaW2o11P/9nW/AwaDEyArP2i+
         7yz0jiiymSWjDXIABpZailJ2D+U4bHaM7zXoMQKv2xUX9lBay+00Mkr+BGZpFTtKA+1Z
         s6EQ==
X-Gm-Message-State: AOAM530Aq/jBm/5aZo62uKczG6MQbZUclK3kqqM/MIIiIwtQhPxfA8Ap
        rygCN15enThxfb8lG1R8w3g=
X-Google-Smtp-Source: ABdhPJw3jkTqJ+lgKZ6qIB5biG0YKqBZg1et2dqIrNIfkE5GKlgmyf7OxfU5uJnFQ/yiM2iWbEIe1w==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr3164846wmi.132.1592315728126;
        Tue, 16 Jun 2020 06:55:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w14sm1974388wrt.55.2020.06.16.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 68/73] arm64: tegra: Fix indentation in Tegra194 device tree
Date:   Tue, 16 Jun 2020 15:52:33 +0200
Message-Id: <20200616135238.3001888-69-thierry.reding@gmail.com>
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

Properly indent subsequent lines so that they align with the first line.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index e0aa6c74073a..307f999edbf9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1669,7 +1669,7 @@ pcie@141a0000 {
 		pinctrl-0 = <&pex_rst_c5_out_state>, <&clkreq_c5_bi_dir_state>;
 
 		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>,
-			<&bpmp TEGRA194_CLK_PEX1_CORE_5M>;
+			 <&bpmp TEGRA194_CLK_PEX1_CORE_5M>;
 		clock-names = "core", "core_m";
 
 		resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
-- 
2.24.1

