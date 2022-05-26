Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5A453547B
	for <lists+linux-tegra@lfdr.de>; Thu, 26 May 2022 22:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbiEZUfb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 May 2022 16:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238028AbiEZUf0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 May 2022 16:35:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAAEE15E3
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 13:35:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id wh22so5127120ejb.7
        for <linux-tegra@vger.kernel.org>; Thu, 26 May 2022 13:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rP0CIw0sCXHsB0ox3/mgCacUh8tuHWT9Bz7uieM7Ovc=;
        b=aIOgf2nSKMUOEdK+BVUHNB8qTMO7GSASTNCfNybjeij5O0SBSNCpynokr/bXX0L8zU
         6f1o2GIkipED1fDnIuQhjzhxPG+AQYZzdJJ52x0ObVDa3/yDWh3djzroqN2SD4g+vZ/F
         5yUGBYf9LZeQBMcpnzn4P09nCoz5RQOWCjKXgVXaCHDQCATm+pYHe6VN/NuFUpldZykT
         JrAzB3rlb1DH3cQPai8yS9ZHcJ6CV2x9tM8A6mJRA3mj4DSoyxKHnC8HmccWvCwIUPMu
         J9aMikOkj04MW+PbnFvSzbeoY8JbLbltgKjPmP52BY40AnoQYudzk63Z1MI0KnVO0ke6
         xL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rP0CIw0sCXHsB0ox3/mgCacUh8tuHWT9Bz7uieM7Ovc=;
        b=7XqtaBYELndQr8mAGTpcvp2qkA5mvd7QUFsUGGgPLldQPMni2v8khIJcojdbG2X0kf
         TyUZB5LB6xkb4vLdeqE2tS3ooR1HmO+Abio5ma33ZHRO+W8HRnBg52XnH3s0vT7T2umd
         K1At4nIbeqIGbxbNFlEpOFgBS50uZ8K/OQ7GMUgtqrxC3AITlPvuloGAI0/VLwrsL0Iw
         2C0qVSNMNwlTFhgyannDaEAj3HTL4aixxhqhiiRUSnIAL7YqwSiPOjHXHB9HSMNbyVQR
         QebMiwFdF/PSVv6wo9YCKOYP/s1G+cbo4GIhkbY0QAREzwzP+O+OkxRkZPKtTYFj9c2R
         g6rg==
X-Gm-Message-State: AOAM533WZi7L/PR1iL39rUJ+R4YEG3GzgQrdAws2eIlD+KmJOHHdj8hl
        pr+T45WBePLjkktbCWwGBFaqUQ==
X-Google-Smtp-Source: ABdhPJw3dLqLRSfOPtpaI+gLVPSMD3i0UCerfJ7adtp5fmHU+AixiPGbBDVzP47Z7YhpNLEHWVGwZQ==
X-Received: by 2002:a17:907:7faa:b0:6ff:18e6:a44 with SMTP id qk42-20020a1709077faa00b006ff18e60a44mr6954282ejc.380.1653597323339;
        Thu, 26 May 2022 13:35:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006fec6e1d856sm816826ejn.82.2022.05.26.13.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:35:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: tegra: adjust whitespace around '='
Date:   Thu, 26 May 2022 22:35:17 +0200
Message-Id: <20220526203518.830765-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526203518.830765-1-krzysztof.kozlowski@linaro.org>
References: <20220526203518.830765-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 4f0e51f1a343..5e099537f99f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1055,7 +1055,7 @@ padctl: padctl@7009f000 {
 		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 		resets = <&tegra_car 142>;
 		reset-names = "padctl";
-		nvidia,pmc =  <&tegra_pmc>;
+		nvidia,pmc = <&tegra_pmc>;
 
 		status = "disabled";
 
-- 
2.34.1

