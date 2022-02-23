Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D968C4C1786
	for <lists+linux-tegra@lfdr.de>; Wed, 23 Feb 2022 16:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242318AbiBWPpG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 23 Feb 2022 10:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242316AbiBWPoz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 10:44:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C41BC0842;
        Wed, 23 Feb 2022 07:44:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2D0FB820C7;
        Wed, 23 Feb 2022 15:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA92C340F7;
        Wed, 23 Feb 2022 15:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645631064;
        bh=LqDOo3v9PWjpxu17lpwbu10rYiQP/VJ3cojMJYbLfTw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HegQM5C3fFANIr3M6bw5CabK6deIDanZOHDD72SQBoAXj/D+nHnrpfdaYPjtTZ5h/
         s2BYK230JnTicE2KS8mmIm/yb4A8/y6zgepHhOJOJkHXcbgdJn5N/sIxqfYCTSotfn
         qtr8QOfXQYKiXP796vE2kuW4RC1XnfyY/0ngsdlEA5RlE9UO2kRoj4bQ9YnzsYg6y4
         +F2h1MXmcT9nLfCIe8Q5kLvwl0/vPDaLx/usRbEdO4uzR7BnP02GwLc6oSm+ltAoxt
         ibJwRO9vqEIIbsVoi+7dgaYYQzJV3bs2q8GeRjHD3gdlTBh2hk11SD77lj6dSWyqCq
         7sB5NYZ7rT5Pw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nMtoU-009wgt-BY; Wed, 23 Feb 2022 15:44:22 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Subject: [PATCH 4/5] pinctrl: msmgpio: Make the irqchip immutable
Date:   Wed, 23 Feb 2022 15:44:04 +0000
Message-Id: <20220223154405.54912-5-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223154405.54912-1-maz@kernel.org>
References: <20220223154405.54912-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com, joey.gouly@arm.com, jonathanh@nvidia.com, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, bjorn.andersson@linaro.org, agross@kernel.org, tglx@linutronix.de, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prevent gpiolib from messing with the irqchip by advertising
the irq_chip structure as immutable, making it const, and adding
the various calls that gpiolib relies upon.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 53 +++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 780878dede9e..33ce5aa4e562 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -42,7 +42,6 @@
  * @chip:           gpiochip handle.
  * @desc:           pin controller descriptor
  * @restart_nb:     restart notifier block.
- * @irq_chip:       irq chip information
  * @irq:            parent irq for the TLMM irq_chip.
  * @intr_target_use_scm: route irq to application cpu using scm calls
  * @lock:           Spinlock to protect register resources as well
@@ -63,7 +62,6 @@ struct msm_pinctrl {
 	struct pinctrl_desc desc;
 	struct notifier_block restart_nb;
 
-	struct irq_chip irq_chip;
 	int irq;
 
 	bool intr_target_use_scm;
@@ -859,6 +857,8 @@ static void msm_gpio_irq_enable(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	if (d->parent_data)
 		irq_chip_enable_parent(d);
 
@@ -876,6 +876,8 @@ static void msm_gpio_irq_disable(struct irq_data *d)
 
 	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
 		msm_gpio_irq_mask(d);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 /**
@@ -949,6 +951,14 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
+static void msm_gpio_irq_eoi(struct irq_data *d)
+{
+	d = d->parent_data;
+
+	if (d)
+		d->chip->irq_eoi(d);
+}
+
 static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
 						       unsigned int type)
 {
@@ -1246,6 +1256,26 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 	return device_property_count_u16(pctrl->dev, "gpios") > 0;
 }
 
+static const struct irq_chip msm_gpio_irq_chip = {
+	.name			= "msmgpio",
+	.irq_enable		= msm_gpio_irq_enable,
+	.irq_disable		= msm_gpio_irq_disable,
+	.irq_mask		= msm_gpio_irq_mask,
+	.irq_unmask		= msm_gpio_irq_unmask,
+	.irq_ack		= msm_gpio_irq_ack,
+	.irq_eoi		= msm_gpio_irq_eoi,
+	.irq_set_type		= msm_gpio_irq_set_type,
+	.irq_set_wake		= msm_gpio_irq_set_wake,
+	.irq_request_resources	= msm_gpio_irq_reqres,
+	.irq_release_resources	= msm_gpio_irq_relres,
+	.irq_set_affinity	= msm_gpio_irq_set_affinity,
+	.irq_set_vcpu_affinity	= msm_gpio_irq_set_vcpu_affinity,
+	.flags			= (IRQCHIP_MASK_ON_SUSPEND |
+				   IRQCHIP_SET_TYPE_MASKED |
+				   IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+				   IRQCHIP_IMMUTABLE),
+};
+
 static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
@@ -1267,22 +1297,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	if (msm_gpio_needs_valid_mask(pctrl))
 		chip->init_valid_mask = msm_gpio_init_valid_mask;
 
-	pctrl->irq_chip.name = "msmgpio";
-	pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
-	pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
-	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
-	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
-	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
-	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
-	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
-	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
-	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
-	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
-	pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
-	pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND |
-				IRQCHIP_SET_TYPE_MASKED |
-				IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND;
-
 	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
 	if (np) {
 		chip->irq.parent_domain = irq_find_matching_host(np,
@@ -1291,7 +1305,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		if (!chip->irq.parent_domain)
 			return -EPROBE_DEFER;
 		chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
-		pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
 		/*
 		 * Let's skip handling the GPIOs, if the parent irqchip
 		 * is handling the direct connect IRQ of the GPIO.
@@ -1304,7 +1317,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	}
 
 	girq = &chip->irq;
-	girq->chip = &pctrl->irq_chip;
+	girq->chip = (struct irq_chip *)&msm_gpio_irq_chip;
 	girq->parent_handler = msm_gpio_irq_handler;
 	girq->fwnode = pctrl->dev->fwnode;
 	girq->num_parents = 1;
-- 
2.30.2

