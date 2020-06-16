Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8EB1FB2B2
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFPNyN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbgFPNyL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5781DC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q11so20891568wrp.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pwE35G81wgEIvaTTAj8x7ONwFHGN+HySTYYEqF0s99Y=;
        b=Jv1sFJzp58JI28XF+/gu0gljB0qYxU/OqEcP3oSh5BKS1iaklTd4gA410IVLtHQ3f6
         +H1LWqsCDVN0aSJJ02TumbWf7ZGMTeKvdoizX8Vyp+tyiOjlzYseMxJQPNO4wkMz0OPz
         EeLZj5zvZnnGjasW7eOPXmGAkr+0JfND+l5tgQRr/IlGrUB/X02T4hGbhCXADKxyHCjy
         +hkh6xUSCRV5LeyvgWIFGtjVc9YUp1w6nPcxH9gF5iaTZLFVWa5s2GCsO9ERlM/Cz5tT
         kaAXZuxWOYsJ9Eo+CCD7Xi5DKakAIT/zcNqIbbKYuJBgYiCCx0PPZ2uS0utLzHUcx7PF
         CcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pwE35G81wgEIvaTTAj8x7ONwFHGN+HySTYYEqF0s99Y=;
        b=ihTjfjCPB+bJMEjIWbYdIsq22YKkXg8RZEcZN+c+qt+YM8HDSWSExtMGnO6EOvhKnH
         KWuLB8EH53ST66Z507+x4Dnpj1QaLvrpaHClePCXqok8oeLtx4WzCNBSuSo8a/y6LK53
         8v+wJZQskFjHdGGZG6oKJmmbUGA53WHXEMupgut8597lq1THQemZvTvtoVSpZQTz6Lbr
         DYOligHqIFCwrRQnVt60Hgi+PDwrsUh5yJs8kbjh0pU9i/cY7AeRqVUTPbXfJNyudMhC
         eg7iGSC7sZhC6oQXnOq65mfV8Moj/AWljLQ1ru/i0ZfMpXE7vsuELYqjH8Q8YSe5H0/X
         4rPA==
X-Gm-Message-State: AOAM533SwjeYvbDLGeOH0BYIEys7GtjcYJ1GwNrfcHiEKIHaCuYoMlOI
        ttZxDpP/+U7fdz8w0KP1cYI=
X-Google-Smtp-Source: ABdhPJw3w75sDLQDhSMDHVawPQsm/dWJbeacSJHf5qyvFJ1g0kkLRv427rHG4Bu1lBl4G8L3bUF52g==
X-Received: by 2002:adf:82f4:: with SMTP id 107mr2387804wrc.163.1592315649142;
        Tue, 16 Jun 2020 06:54:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z16sm29333427wrm.70.2020.06.16.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 33/73] ARM: tegra: The Tegra30 DC is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:58 +0200
Message-Id: <20200616135238.3001888-34-thierry.reding@gmail.com>
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

The display controller on Tegra30 is in fact not backwards-compatible
with the instantiation found on earlier SoCs. Drop the misleading
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d80f9d3d2d18..bedab43016c7 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -197,7 +197,7 @@ gr3d@54180000 {
 		};
 
 		dc@54200000 {
-			compatible = "nvidia,tegra30-dc", "nvidia,tegra20-dc";
+			compatible = "nvidia,tegra30-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_DISP1>;
-- 
2.24.1

