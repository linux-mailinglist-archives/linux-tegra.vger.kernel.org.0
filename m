Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF060514234
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Apr 2022 08:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354443AbiD2GRF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Apr 2022 02:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354446AbiD2GRF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 02:17:05 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4420FA94C4
        for <linux-tegra@vger.kernel.org>; Thu, 28 Apr 2022 23:13:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bv19so13501052ejb.6
        for <linux-tegra@vger.kernel.org>; Thu, 28 Apr 2022 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=viXcLhXltMgVR3wPsqIa9KtMGQ0jNk7lgpVp7rd3Rfw=;
        b=c4S2DE6YQasUz7KtVf9WKicc51SIwdA4vtns/C0gbrBKxX752dqlpGq5nrrdu9ttDG
         4AS0XIWR+DiDf+gl78G23wL4MALcaanxjf2qcQu+68jJWlJYo6/iMHObdtVx++NDK0L0
         aEYJfH3j74coSi8uP/iUjGUNNfBZTvWqoZLhEWjayN4MkCBjZOLKaO0VBEVEvbN4DDkW
         wFlm6Cxodm0nnoPafgK3SJnO6vopQvJw3QouDMfIw8osaUj6tAuxwxp2BdToIKWmVC/T
         LYNHmLEu50NLl+W2N7QxA1R2T4/jUrqQ4yYkK/oqIQzo7YkKlMglHbhXDJNvGx5t8X6D
         bVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=viXcLhXltMgVR3wPsqIa9KtMGQ0jNk7lgpVp7rd3Rfw=;
        b=eMGqsOeJ9ftphoVOZWAQII2sRU+siWexlcuA6b8b06eo1v9AcyJQ15GzLFvClXQUJy
         GHkP7g/Yf/IbYszKQMDQXfxu9r0xlZ5FBf/Qmvfkt0hN3iQX6BBRlIjkuI26aewoFr7z
         fQOlAq5YheRKmvPCdlmF9NKzfdyGEr8bQ+ZroJeXuu/grGJUD+uqmqf5aQWyf0UL6qD3
         qtizUPq6P4ptikSHd3UbOTe/pyj9iUDoMFOeqG8H9UUJ2NcDqi1761u+yNsdywdW6sHc
         QLHKLuSy1A+kpSvAjZlifrVdZSZc6434IVdyVnaLSNAOObYCdlBOHygac6t/6fG6Q1Nk
         VhZw==
X-Gm-Message-State: AOAM532eEXFVuSfvv15tK6hCcsadQzpOfhWOCItRxNMIt7mFb9brhdc9
        7jI0m73ulp1VYtZ9x5fg2fRlMg==
X-Google-Smtp-Source: ABdhPJzibRTftl8rRIfJFXNZNDkzUnH8FJ1U5QhJrp0S97Px3s2qSHl6zZovZaiIRGJ1vbejJA19rw==
X-Received: by 2002:a17:907:e88:b0:6ef:bce9:ff6a with SMTP id ho8-20020a1709070e8800b006efbce9ff6amr36798968ejc.275.1651212825606;
        Thu, 28 Apr 2022 23:13:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t25-20020aa7db19000000b0042617ba63besm2532191eds.72.2022.04.28.23.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:13:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: tegra: tegra194: drop unused pin groups
Date:   Fri, 29 Apr 2022 08:13:32 +0200
Message-Id: <20220429061332.25135-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The sdmmc1_hv_trim_pins, sdmmc3_hv_trim_pins and sys_reset_n_pins are
not defined as pin groups:

  drivers/pinctrl/tegra/pinctrl-tegra194.c:1119:27: error: ‘sdmmc3_hv_trim_pins’ defined but not used [-Werror=unused-const-variable=]
   1119 | static const unsigned int sdmmc3_hv_trim_pins[] = {

Proper fix would be to define them, but this requires knowledge from
datasheet.  Removal should not cause any harm and at least it silences
the warnings.

Fixes: 613c0826081b ("pinctrl: tegra: Add pinmux support for Tegra194")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 5c1dfcb46749..f6c5d5e6dbb6 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -1110,24 +1110,15 @@ static const unsigned int sdmmc4_dat0_pins[] = {
 static const unsigned int sdmmc1_comp_pins[] = {
 	TEGRA_PIN_SDMMC1_COMP,
 };
-static const unsigned int sdmmc1_hv_trim_pins[] = {
-	TEGRA_PIN_SDMMC1_HV_TRIM,
-};
 static const unsigned int sdmmc3_comp_pins[] = {
 	TEGRA_PIN_SDMMC3_COMP,
 };
-static const unsigned int sdmmc3_hv_trim_pins[] = {
-	TEGRA_PIN_SDMMC3_HV_TRIM,
-};
 static const unsigned int eqos_comp_pins[] = {
 	TEGRA_PIN_EQOS_COMP,
 };
 static const unsigned int qspi_comp_pins[] = {
 	TEGRA_PIN_QSPI_COMP,
 };
-static const unsigned int sys_reset_n_pins[] = {
-	TEGRA_PIN_SYS_RESET_N,
-};
 static const unsigned int shutdown_n_pins[] = {
 	TEGRA_PIN_SHUTDOWN_N,
 };
-- 
2.32.0

