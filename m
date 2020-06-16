Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741CE1FB2A2
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNxk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNxj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:39 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C2DC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:38 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t194so3161250wmt.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yARV6SdW9Fdnel5OryZ3Ntg8sa7z8FvpxnGgYK03I6Q=;
        b=AGlDwMAuMttD93ZFrny7xaafBGk7hcL8tTNIcMQgSh8uA03JtKERONtDRyKr0AeuxW
         kBGDGSMMp+DQzwKHrCDk3hc04BnS8ZNMDgN07q6yhB6pUpah2zVivskpv9NqkEVywtEK
         wg5gSF9WcjnOwpRGFo5b0QIYFg8+rYz7C3yuw73DZFqTwryGhZNDElyTukTWWaJVKArp
         wHoSxg6B8KBI/HQj43XsSKhyxLXqFipwdnrtCIHv2BDBSYyj2CoodJLAwchKHzKF6xPx
         +/TKsnU6Y9XXKev7srolYC3/5hfbWh1S0ylx5R673wqqvo2TnghjY61Vylj9/J4vOm9S
         1S7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yARV6SdW9Fdnel5OryZ3Ntg8sa7z8FvpxnGgYK03I6Q=;
        b=IdrRTN6ij5faGPfoAwyMaZh+1bZtShJP0yBek+a4cN/5j42pU4K9lYKyxS2hghIpB3
         td9JQiuDsaY+6iJDiYYRkUqjiOdHnZ9UfX3iyw23ekuhgyDWOfYfDARsgBWRoR+Fiy3d
         RaDa/kYvmLZYo3hdrpf2X9M6bBD3JKlx/uqLz8bUVyAj8mEXjjpOrMc1vL4+CGqgJbDm
         mgLxqGo/A2P6Hvy3aXv11X21Lc0HwLDbmi+Ub3MdDZkFKGsXyJa6na3P0quswIyP3xOf
         Wmy1yMfpnZ0FyrBwA1Jb1jYbwbd4e1I6FyKMGIWXpzg1AtmdDfkeFJ9/nsY+MRbEZN7b
         uxRw==
X-Gm-Message-State: AOAM530sWcxYYE+/uKOY//TshlWqeKsp8aeU+0NSM+ayj5xS0CEfbuoY
        /XNlTvKkiVhFwqk/QE+GP7k=
X-Google-Smtp-Source: ABdhPJxX7fKw9SsyOsD/tQmPgKjfCQrvFnNEvc8F1ERpNkP2tRdih686XFt6qhBQ1mJ6JYZbbqjhtg==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr3299951wmj.43.1592315616766;
        Tue, 16 Jun 2020 06:53:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l204sm4290844wmf.19.2020.06.16.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 22/73] ARM: tegra: Add #reset-cells to Tegra124 memory controller
Date:   Tue, 16 Jun 2020 15:51:47 +0200
Message-Id: <20200616135238.3001888-23-thierry.reding@gmail.com>
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

The memory controller exposes a set of memory client resets and needs to
specify the #reset-cells property in order to advertise the number of
cells needed to describe each of the resets.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 6d34742b56b9..98cd7962a559 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -622,6 +622,7 @@ mc: memory-controller@70019000 {
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
 		#iommu-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
-- 
2.24.1

