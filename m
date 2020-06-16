Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A961FB2A0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNxe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNxe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87565C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:33 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t194so3160984wmt.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/9XFSVrKLvXMFRORsrMQRhRGbU7+Ty1LYTYIIl67+uY=;
        b=a3Vupsutl4pW5ybN7BmsJULlopCvyjdaqfZql3T06j67XadK578BZoy6Q8vH3P+q/a
         CIqEaRCcy9YJGgznyBuGGdL/8yJWDVnkDEKn3+yOGYKYCP/XiwtpxDbwDj8RqRYeHyCx
         HpmPil7/i8KOuZsJ96IsYsnGGRoyGF45P/Cr3M3zjkGsiD7CK6nC1C6aFD+6cgUWzQTL
         x8CVlgIFSVTUPDU92bSv907Jqfh0XVBUSDDBRaj0/LIbZqi3PUEXSfTDA8f2iXbRuaR4
         q7eBGmQt8uEIj40lIyAUPCTKw+1VIdQTfUss9RmOZ8L8c4nWlqAK8Rl7Z45/JS1+yRic
         g3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/9XFSVrKLvXMFRORsrMQRhRGbU7+Ty1LYTYIIl67+uY=;
        b=n2SVrYxwkk32ENdXJo1cFg17jhrX+VPoP4UbzIup1lAMUpd3Z+r00jPksceLvubOpo
         gD0op/6f02JBx/MuSPA1SSFWLlmHx//8JUmDIj0gLmz647RD1EDkDUavNmQrjii7+TIR
         C0faCH3CD8fSlfRP8YEUPeb612NLoIfF0WmobanHFBbNvgFfE90Da5jluMCLvV3LTDLG
         H7RhaLgtKqNgxFEbyuZePzTn+tQwuBEGGZajRvfo00J3aknJ5Yz9lvx7ZYH0zksvxZqx
         H1P2jvcKLaX7qpN5vB1kT/E+oPg6AD0/zZWhtntS9rcOic7qQwQUYjwCGjUEE0TtF/Sj
         SazA==
X-Gm-Message-State: AOAM530UvblahOfJux6WZ5+5PiXnvf+Kl5rWPgKjGfAyY5nxYMFxRyyU
        aT58UtQDh55G34MvPD9EminAWh2I
X-Google-Smtp-Source: ABdhPJxe75OJqkWS3Sz/HQco06TpC/JRFA3xcSI3Y1FIvxfpzB659gaqZboHOrCUDPmhs31/LuYg/g==
X-Received: by 2002:a1c:658a:: with SMTP id z132mr3312806wmb.20.1592315612317;
        Tue, 16 Jun 2020 06:53:32 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a7sm4344861wmh.14.2020.06.16.06.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 20/73] ARM: tegra: Add micro-USB A/B port on Jetson TK1
Date:   Tue, 16 Jun 2020 15:51:45 +0200
Message-Id: <20200616135238.3001888-21-thierry.reding@gmail.com>
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

Run the micro-USB A/B port on Jetson TK1 in host mode by default.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 289bf6e99041..6eaa39646221 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1775,6 +1775,12 @@ sata-0 {
 		};
 
 		ports {
+			/* Micro A/B */
+			usb2-0 {
+				status = "okay";
+				mode = "host";
+			};
+
 			/* Mini PCIe */
 			usb2-1 {
 				status = "okay";
-- 
2.24.1

