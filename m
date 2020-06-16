Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0163A1FB28F
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgFPNxD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbgFPNxD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BFFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t194so3159112wmt.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NcQyUR9ZMCNSxD7yzbRR2V9chBQB5uCLO5RENeG6ZPg=;
        b=dradM+XTFqtfIk1wbaLcrDc3FqQghNUwqkBA23/Q+SDlv1IEGaxnp5M7Yt+kPAymjT
         A3huBfelTXnU0x9tSR0GOtIeh4TRwlqQCYJZP+5mouXGtTkHqkVJ0EO2Abf8gwlx+Ibp
         TIcb1FhefLyWpB34AJsIeL0n5pi5GUITuQ5iwGZ57jgbohaXvHQjWjpr5a3L0Xk5/BPD
         IkwTxCFCNXjtUhkOAaM2QDnEALieTLEXXisoqMfgFOWQYhljpDsX1GAZeQd5JXm0t7Un
         wdT/6KQSvlw5pItHR6mVeUUdabTU7Ai3obwpKT45J26/64dqjzje52JaGw18xKNlTnYD
         rMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NcQyUR9ZMCNSxD7yzbRR2V9chBQB5uCLO5RENeG6ZPg=;
        b=cGtfr93zbxuFZdYQ7k1J2VXTLTeUrg5UeOO/qaWD1cteTJVKgg7mtLVha6rFtu35Ai
         Hc5kP6YwNGac+q0+a3SjNUhFc8Rff/RAPZPRnngEK6xmfpuxZhZQQc8pw6B5T4+0lBm5
         b3FpC2NqO5yI5PdeIXhQhHP9o9CkLwSvZq000bGgRv4s1nBJLW5/3nZhMg+REH/HVU3t
         67cvOrDY0Dxqn8B7khwCf4EpVJ/2PsxdZrztCP8xSiTfJTMLAt6eCDXeZdfbDqrT6yNb
         2x3SeIaA2nRceFHcjKR4Yon3L/y7HtGlbCY/R9IhWQFhbmDXZ3w0rF8nPv8ypz4SQW6W
         IV/A==
X-Gm-Message-State: AOAM530YH0uAHmUJZclqIMBf9rZOTeIVCa7wtuIIoUu3cxle2vzEy0MH
        qNTuLnnwjEz2NzVVYrKSv4k=
X-Google-Smtp-Source: ABdhPJw+XVbp6SdHrlPiQJidsycshiRYm0yP/7i8nx2fCykybpVhxL6NfQXcic+eGUBXuvoy4iA/KA==
X-Received: by 2002:a05:600c:21c2:: with SMTP id x2mr3392321wmj.33.1592315581703;
        Tue, 16 Jun 2020 06:53:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id v19sm4088915wml.26.2020.06.16.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/73] ARM: tegra: tn7: Use the correct DSI/CSI supply
Date:   Tue, 16 Jun 2020 15:51:31 +0200
Message-Id: <20200616135238.3001888-7-thierry.reding@gmail.com>
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

The correct DSI/CSI supply property is called vdd-dsi-csi-supply, so use
that instead of the wrong vdd-supply property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114-tn7.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114-tn7.dts b/arch/arm/boot/dts/tegra114-tn7.dts
index 90935db591a5..0e520ae1109d 100644
--- a/arch/arm/boot/dts/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/tegra114-tn7.dts
@@ -37,7 +37,7 @@ host1x@50000000 {
 		dsi@54300000 {
 			status = "okay";
 
-			vdd-supply = <&vdd_1v2_ap>;
+			avdd-dsi-csi-supply = <&vdd_1v2_ap>;
 
 			panel@0 {
 				compatible = "lg,ld070wx3-sl01";
-- 
2.24.1

