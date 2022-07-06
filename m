Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C27569470
	for <lists+linux-tegra@lfdr.de>; Wed,  6 Jul 2022 23:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbiGFVdL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 Jul 2022 17:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbiGFVdI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Jul 2022 17:33:08 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C6D27145;
        Wed,  6 Jul 2022 14:33:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q9so23753828wrd.8;
        Wed, 06 Jul 2022 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hsb46ZR+iAjqJM/8jf9bwePKdQ+/VlInmNQnXhNixRE=;
        b=Wa3nZRhLF9IHRHbwDFrn1FWmzoVxEe86/4eIaRBlZPnYa5XrWxF/wPux8zCxjedEgX
         zH1luibjn/6XoZOXRkl5XC0whSxrvaFZo+JuwIICukmnAwDQZMfRlvkbc5doIjsm1ama
         7h4KJmSIRyZSa9W9N7Xnbd2CNfrAHpxp6oNcSfEcxFv8p/lsX52mjKaMg/8jr/gtfbZN
         UF+j43kPXekINVTaVB/PdDGC19QKOMxxvT1gPSgcbGanJh4Ig+l1p1hm5YiwCfNWggO4
         ZQOk+HJN9M1+QhScQ8xgJJJgjLia/EpxdF/7UG2PlrgNRUSlVB0TzmY0SL9mNNHdUB8f
         rGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsb46ZR+iAjqJM/8jf9bwePKdQ+/VlInmNQnXhNixRE=;
        b=qdB3Kx/V/blknejwRb405pNCJ0iIbDUS3DeLPstAm/vWoBzrapJtmS5PpW1wL5zqcR
         wO9cjQg/ddg+AK/qyy6YER/2uJsjfxlTDbtnvRRW7QTXH883tnfrdrPrzrBZHieGyg1v
         ChIt7VJAKqbJSSFIhpvsroWeKmrqaKQQuE2vD4Bqi7BHxOFQtQLMIvTdoGZaFIu6CTjs
         HfURNjjpCWCH9KXoKoEBl7zMjj1EOJMatlkhS6nPGiB+7VVv0F6rMN8127n7bgc2791I
         uN/wI8E59Rdf5cXUgTuAoTkxFlqeS/UNpFf24F9wWa+AJsm/nMTatsm+pv2TxDLDDmlE
         3phA==
X-Gm-Message-State: AJIora/FUStG3x28kxcQGgqo1qa3CWqdD7Jfg4g+Kdd7XX1fiYjK5e2K
        FtK4Io3Nyj+IrIHIgLtX64A=
X-Google-Smtp-Source: AGRyM1vyW79xSHqhJZ9b3VpkkIdExBoC880cCzeYt+jyEemqyowpVRmIY5gtv1pfkD4tsrPnjWxvNw==
X-Received: by 2002:adf:fcc6:0:b0:21d:8093:1b5c with SMTP id f6-20020adffcc6000000b0021d80931b5cmr2875478wrs.41.1657143184999;
        Wed, 06 Jul 2022 14:33:04 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i30-20020a1c541e000000b003a032c88877sm23140851wmb.15.2022.07.06.14.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:33:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bhadram Varka <vbhadram@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/9] dt-bindings: Add Tegra234 MGBE clocks and resets
Date:   Wed,  6 Jul 2022 23:32:48 +0200
Message-Id: <20220706213255.1473069-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706213255.1473069-1-thierry.reding@gmail.com>
References: <20220706213255.1473069-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the clocks and resets used by the Multi-Gigabit Ethernet (MGBE)
hardware found on NVIDIA Tegra234 SoCs.

Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h | 101 +++++++++++++++++++++
 include/dt-bindings/reset/tegra234-reset.h |   8 ++
 2 files changed, 109 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 6fbe66063066..b8c64e0f120c 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -174,10 +174,111 @@
 #define TEGRA234_CLK_PEX1_C5_CORE		225U
 /** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC4_BASE */
 #define TEGRA234_CLK_PLLC4			237U
+/** @brief RX clock recovered from MGBE0 lane input */
+#define TEGRA234_CLK_MGBE0_RX_INPUT		248U
+/** @brief RX clock recovered from MGBE1 lane input */
+#define TEGRA234_CLK_MGBE1_RX_INPUT		249U
+/** @brief RX clock recovered from MGBE2 lane input */
+#define TEGRA234_CLK_MGBE2_RX_INPUT		250U
+/** @brief RX clock recovered from MGBE3 lane input */
+#define TEGRA234_CLK_MGBE3_RX_INPUT		251U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
+/** @brief Monitored branch of MBGE0 RX input clock */
+#define TEGRA234_CLK_MGBE0_RX_INPUT_M		357U
+/** @brief Monitored branch of MBGE1 RX input clock */
+#define TEGRA234_CLK_MGBE1_RX_INPUT_M		358U
+/** @brief Monitored branch of MBGE2 RX input clock */
+#define TEGRA234_CLK_MGBE2_RX_INPUT_M		359U
+/** @brief Monitored branch of MBGE3 RX input clock */
+#define TEGRA234_CLK_MGBE3_RX_INPUT_M		360U
+/** @brief Monitored branch of MGBE0 RX PCS mux output */
+#define TEGRA234_CLK_MGBE0_RX_PCS_M		361U
+/** @brief Monitored branch of MGBE1 RX PCS mux output */
+#define TEGRA234_CLK_MGBE1_RX_PCS_M		362U
+/** @brief Monitored branch of MGBE2 RX PCS mux output */
+#define TEGRA234_CLK_MGBE2_RX_PCS_M		363U
+/** @brief Monitored branch of MGBE3 RX PCS mux output */
+#define TEGRA234_CLK_MGBE3_RX_PCS_M		364U
+/** @brief RX PCS clock recovered from MGBE0 lane input */
+#define TEGRA234_CLK_MGBE0_RX_PCS_INPUT		369U
+/** @brief RX PCS clock recovered from MGBE1 lane input */
+#define TEGRA234_CLK_MGBE1_RX_PCS_INPUT		370U
+/** @brief RX PCS clock recovered from MGBE2 lane input */
+#define TEGRA234_CLK_MGBE2_RX_PCS_INPUT		371U
+/** @brief RX PCS clock recovered from MGBE3 lane input */
+#define TEGRA234_CLK_MGBE3_RX_PCS_INPUT		372U
+/** @brief output of mux controlled by GBE_UPHY_MGBE0_RX_PCS_CLK_SRC_SEL */
+#define TEGRA234_CLK_MGBE0_RX_PCS		373U
+/** @brief GBE_UPHY_MGBE0_TX_CLK divider gated output */
+#define TEGRA234_CLK_MGBE0_TX			374U
+/** @brief GBE_UPHY_MGBE0_TX_PCS_CLK divider gated output */
+#define TEGRA234_CLK_MGBE0_TX_PCS		375U
+/** @brief GBE_UPHY_MGBE0_MAC_CLK divider output */
+#define TEGRA234_CLK_MGBE0_MAC_DIVIDER		376U
+/** @brief GBE_UPHY_MGBE0_MAC_CLK gate output */
+#define TEGRA234_CLK_MGBE0_MAC			377U
+/** @brief GBE_UPHY_MGBE0_MACSEC_CLK gate output */
+#define TEGRA234_CLK_MGBE0_MACSEC		378U
+/** @brief GBE_UPHY_MGBE0_EEE_PCS_CLK gate output */
+#define TEGRA234_CLK_MGBE0_EEE_PCS		379U
+/** @brief GBE_UPHY_MGBE0_APP_CLK gate output */
+#define TEGRA234_CLK_MGBE0_APP			380U
+/** @brief GBE_UPHY_MGBE0_PTP_REF_CLK divider gated output */
+#define TEGRA234_CLK_MGBE0_PTP_REF		381U
+/** @brief output of mux controlled by GBE_UPHY_MGBE1_RX_PCS_CLK_SRC_SEL */
+#define TEGRA234_CLK_MGBE1_RX_PCS		382U
+/** @brief GBE_UPHY_MGBE1_TX_CLK divider gated output */
+#define TEGRA234_CLK_MGBE1_TX			383U
+/** @brief GBE_UPHY_MGBE1_TX_PCS_CLK divider gated output */
+#define TEGRA234_CLK_MGBE1_TX_PCS		384U
+/** @brief GBE_UPHY_MGBE1_MAC_CLK divider output */
+#define TEGRA234_CLK_MGBE1_MAC_DIVIDER		385U
+/** @brief GBE_UPHY_MGBE1_MAC_CLK gate output */
+#define TEGRA234_CLK_MGBE1_MAC			386U
+/** @brief GBE_UPHY_MGBE1_EEE_PCS_CLK gate output */
+#define TEGRA234_CLK_MGBE1_EEE_PCS		388U
+/** @brief GBE_UPHY_MGBE1_APP_CLK gate output */
+#define TEGRA234_CLK_MGBE1_APP			389U
+/** @brief GBE_UPHY_MGBE1_PTP_REF_CLK divider gated output */
+#define TEGRA234_CLK_MGBE1_PTP_REF		390U
+/** @brief output of mux controlled by GBE_UPHY_MGBE2_RX_PCS_CLK_SRC_SEL */
+#define TEGRA234_CLK_MGBE2_RX_PCS		391U
+/** @brief GBE_UPHY_MGBE2_TX_CLK divider gated output */
+#define TEGRA234_CLK_MGBE2_TX			392U
+/** @brief GBE_UPHY_MGBE2_TX_PCS_CLK divider gated output */
+#define TEGRA234_CLK_MGBE2_TX_PCS		393U
+/** @brief GBE_UPHY_MGBE2_MAC_CLK divider output */
+#define TEGRA234_CLK_MGBE2_MAC_DIVIDER		394U
+/** @brief GBE_UPHY_MGBE2_MAC_CLK gate output */
+#define TEGRA234_CLK_MGBE2_MAC			395U
+/** @brief GBE_UPHY_MGBE2_EEE_PCS_CLK gate output */
+#define TEGRA234_CLK_MGBE2_EEE_PCS		397U
+/** @brief GBE_UPHY_MGBE2_APP_CLK gate output */
+#define TEGRA234_CLK_MGBE2_APP			398U
+/** @brief GBE_UPHY_MGBE2_PTP_REF_CLK divider gated output */
+#define TEGRA234_CLK_MGBE2_PTP_REF		399U
+/** @brief output of mux controlled by GBE_UPHY_MGBE3_RX_PCS_CLK_SRC_SEL */
+#define TEGRA234_CLK_MGBE3_RX_PCS		400U
+/** @brief GBE_UPHY_MGBE3_TX_CLK divider gated output */
+#define TEGRA234_CLK_MGBE3_TX			401U
+/** @brief GBE_UPHY_MGBE3_TX_PCS_CLK divider gated output */
+#define TEGRA234_CLK_MGBE3_TX_PCS		402U
+/** @brief GBE_UPHY_MGBE3_MAC_CLK divider output */
+#define TEGRA234_CLK_MGBE3_MAC_DIVIDER		403U
+/** @brief GBE_UPHY_MGBE3_MAC_CLK gate output */
+#define TEGRA234_CLK_MGBE3_MAC			404U
+/** @brief GBE_UPHY_MGBE3_MACSEC_CLK gate output */
+#define TEGRA234_CLK_MGBE3_MACSEC		405U
+/** @brief GBE_UPHY_MGBE3_EEE_PCS_CLK gate output */
+#define TEGRA234_CLK_MGBE3_EEE_PCS		406U
+/** @brief GBE_UPHY_MGBE3_APP_CLK gate output */
+#define TEGRA234_CLK_MGBE3_APP			407U
+/** @brief GBE_UPHY_MGBE3_PTP_REF_CLK divider gated output */
+#define TEGRA234_CLK_MGBE3_PTP_REF		408U
 /** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
 #define TEGRA234_CLK_AZA_2XBIT			457U
 /** @brief aza_2xbitclk / 2 (aza_bitclk) */
 #define TEGRA234_CLK_AZA_BIT			458U
+
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 4f72ed1c2320..92c94ee1f13d 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -31,6 +31,12 @@
 #define TEGRA234_RESET_I2C7			33U
 #define TEGRA234_RESET_I2C8			34U
 #define TEGRA234_RESET_I2C9			35U
+#define TEGRA234_RESET_MGBE0_PCS		45U
+#define TEGRA234_RESET_MGBE0_MAC		46U
+#define TEGRA234_RESET_MGBE1_PCS		49U
+#define TEGRA234_RESET_MGBE1_MAC		50U
+#define TEGRA234_RESET_MGBE2_PCS		53U
+#define TEGRA234_RESET_MGBE2_MAC		54U
 #define TEGRA234_RESET_PEX2_CORE_10		56U
 #define TEGRA234_RESET_PEX2_CORE_10_APB		57U
 #define TEGRA234_RESET_PEX2_COMMON_APB		58U
@@ -45,6 +51,8 @@
 #define TEGRA234_RESET_QSPI0			76U
 #define TEGRA234_RESET_QSPI1			77U
 #define TEGRA234_RESET_SDMMC4			85U
+#define TEGRA234_RESET_MGBE3_PCS		87U
+#define TEGRA234_RESET_MGBE3_MAC		88U
 #define TEGRA234_RESET_UARTA			100U
 #define TEGRA234_RESET_PEX0_CORE_0		116U
 #define TEGRA234_RESET_PEX0_CORE_1		117U
-- 
2.36.1

