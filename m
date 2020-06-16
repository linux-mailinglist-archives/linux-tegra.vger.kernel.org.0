Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680751FB293
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFPNxM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgFPNxK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05A5C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r15so3155064wmh.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pY2kP8QaLCgM9u5xuScF1WBRP6jpC7y6DLBKjAmpX6o=;
        b=VTca1UDWHTX77gU57cx6/hNUlHYLBsgnw9+ftt2tDVmQmcfmb5r/SLrzbfVZfMvcIp
         Xsng1EHW3Q/OEaEHKVOZ20asRi6gZhVAV8CuuGalt2xQWDb4afQ6+vZ32wsocAu+vTkT
         9lXdceT+ou/cZVzb1QyDfgvVyN3pyKdMnnCyTe9vUKn+XjCz0W6vVgDmb7kgOpelQb1A
         34mi4/rvDndOjaMr++0u+xaHlRCGj504dJEiCc5AxNKyXVNwMmIlN2An1ZJK2Vgv30Uv
         g7nZiARjfw72+ryz9zm6f1E2Fl6C27ss4Y+ydoB/Ff8aaJf4aINMz6CMj+Pu/d5p2gV/
         AlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pY2kP8QaLCgM9u5xuScF1WBRP6jpC7y6DLBKjAmpX6o=;
        b=grxTw7fCuGrnKDSgDm43Ffe7VeUl0jqLpzg4dzK6zZIl6noUHsV4PRWrILHYbzjJD8
         9E8ChWwBkCyo+Xz42BQGsqik4B2Fs4diPx9R+k7ekbu6pPCq6n5EZYXsTz5KpbEjtnYX
         yAS5MwVp7zFyACqJHKRf31WaIMKnkN7bmq6boIC/mTzM/mBmeWm7RmDtxN0yXqwDTJuM
         GHitelhQlPKRh5v6iHIQ2nL5YXsCk0qz4BbhAzcp7GSq/1cONi8ZS/uFpHDgfEVi6F9C
         6z19729j9hajTihY1sCkuMv1b9QanTnQicGjBbtU32CtXg7qkcoSuHho3bFxambqGeJz
         vBOA==
X-Gm-Message-State: AOAM533aBeViKksoSb1EfsD7X4dUJVY082qC3lUDgFMlRgyZ60EdZ0SC
        T+02vI5vcmUnQf+Rms4tAcY=
X-Google-Smtp-Source: ABdhPJxwsXO2fi8BEJOi5Kwj7YFoJAXFVUwoG6JstBm0/h33mt2ttTmZVcUOpkIw9wIw7Ck+amnTEg==
X-Received: by 2002:a1c:f608:: with SMTP id w8mr3299282wmc.78.1592315588654;
        Tue, 16 Jun 2020 06:53:08 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id j41sm532604wre.12.2020.06.16.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:34 +0200
Message-Id: <20200616135238.3001888-10-thierry.reding@gmail.com>
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

The instantiation of gr2d in Tegra114 is not backwards-compatible with
the version found on earlier chips. Remove the misleading compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index a0ac9ea9ec9d..d583dfba688f 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -35,7 +35,7 @@ host1x@50000000 {
 		ranges = <0x54000000 0x54000000 0x01000000>;
 
 		gr2d@54140000 {
-			compatible = "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
+			compatible = "nvidia,tegra114-gr2d";
 			reg = <0x54140000 0x00040000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
-- 
2.24.1

