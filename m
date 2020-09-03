Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA96525B7F3
	for <lists+linux-tegra@lfdr.de>; Thu,  3 Sep 2020 02:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgICAzY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Sep 2020 20:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgICAyD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Sep 2020 20:54:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB51C061247;
        Wed,  2 Sep 2020 17:54:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e11so1411199ljn.6;
        Wed, 02 Sep 2020 17:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x1zSL+5XrZ1f5CiQoL/vK+B3H/oDgqCKzqkda5Kz3q8=;
        b=QNupbBjyW8Qu0LunCK4NJ1lAuNqY0K2uhx2PLJUM7maEzDRBMIOpFKP4qo1gbow9p3
         Gwsc+Bbdg34RyuttExzw9toGbH/C/rot/szXnbHoIdiqm4N4a4L3OQe9jdaWcgxwTUji
         OK0gJzaI1Js0a8I7ub0tR+iwMLT7rOgrHDS9P8Lxna2skgqR3UPUKBXr0pm835fg7H0K
         UBtK+w9Mz43yZT+CJAv+SDjXlSK/ZorVxtTEQxk2epKbqieN0DB/vuZri60+eh19WC4e
         jkgdLQ4ivnZDdeC4yVnHq5FDisWaBvkBnrq0fqHLFmVeC1z/ZpnTdpW4MH/a27mm5J6K
         /f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x1zSL+5XrZ1f5CiQoL/vK+B3H/oDgqCKzqkda5Kz3q8=;
        b=DrrW1AbPy9uKK/JxtM86BFY66W028pbvbc41qPKo/koiGuN7is7aoWsgfV9tHsBRIA
         CmGXVGgsdbmlWJ4c/z9ZXZ87VzHW28zLQj1yCbTgTqILiI7OljRklbfs+CbbWIM3q0x3
         izOHsHWcdLiow8QRGSRvjAcT0q8Xy9YurklrJXDOWpMAVWeK5pqwqmQOD/vCjmuWwyQe
         81UUfAY6MLKG3hLLYsGf09sSUATYXOXjM0W38U2SKwfv+ktQtR4B8tACod+dGkoe8u/T
         45zLnfDGq02Pm588nUyWWtjRrHgzInsOckeNcQlYfXVSz4PoBNkomSk/CMs8yjzesmrH
         we7g==
X-Gm-Message-State: AOAM530yCmI92L8tKpkPhvHcz1NkR0mf2gJ+2MA6XgOAFVlhr9zIpIdt
        QNBYU0lNNEaDpXmk9IJIFQQ=
X-Google-Smtp-Source: ABdhPJy0fvwIBTRs/0shQjTtL64TL9+TDhPZuA7M3L+Lq2QAhURoNVIJ2cYYBAg2jkfiS7OtyXuziA==
X-Received: by 2002:a2e:7210:: with SMTP id n16mr287821ljc.262.1599094439623;
        Wed, 02 Sep 2020 17:53:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:53:59 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/22] i2c: tegra: Clean up probe function
Date:   Thu,  3 Sep 2020 03:52:47 +0300
Message-Id: <20200903005300.7894-10-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver's probe function code is difficult to read and follow. This
patch reorders code of the probe function, forming logical groups that are
easy to work with. The clock and hardware initializations are factored
out into separate functions in order to keep code clean and ease error
unwinding.

Driver now makes use of devm_platform_get_and_ioremap_resource() and
platform_get_irq() which are replacing boilerplate parts of the code.

The dev_err_probe() is now used for reset control retrieval because reset
is now requested before clocks, and thus, BPMP driver that provides reset
controls for newer SoCs may cause the probe defer.

The error message of devm_request_irq() is removed because this function
takes care of printing the message by itself.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 359 ++++++++++++++++++---------------
 1 file changed, 196 insertions(+), 163 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a8ef8619b7ef..35a5d46865bc 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -447,6 +447,9 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 	i2c_dev->tx_dma_chan = chan;
 
+	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
+				I2C_PACKET_HEADER_SIZE;
+
 	dma_buf = dma_alloc_coherent(i2c_dev->dev, i2c_dev->dma_buf_size,
 				     &dma_phys, GFP_KERNEL | __GFP_NOWARN);
 	if (!dma_buf) {
@@ -1427,19 +1430,25 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
-static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
 	struct device_node *np = i2c_dev->dev->of_node;
+	u32 bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
 	bool multi_mode;
-	int ret;
 
-	ret = of_property_read_u32(np, "clock-frequency",
-				   &i2c_dev->bus_clk_rate);
-	if (ret)
-		i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ; /* default clock rate */
+	of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
+	i2c_dev->bus_clk_rate = bus_clk_rate;
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
+
+	if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
+		i2c_dev->is_dvc = true;
+
+	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
+		i2c_dev->is_vi = true;
+
+	return 0;
 }
 
 static const struct i2c_algorithm tegra_i2c_algo = {
@@ -1654,203 +1663,234 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
-static int tegra_i2c_probe(struct platform_device *pdev)
+static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
 {
-	struct clk *div_clk, *fast_clk, *slow_clk;
-	struct device *dev = &pdev->dev;
-	struct tegra_i2c_dev *i2c_dev;
-	phys_addr_t base_phys;
-	struct resource *res;
-	void __iomem *base;
-	int irq, ret;
+	const struct tegra_i2c_hw_feature *hw = i2c_dev->hw;
+	struct device *dev = i2c_dev->dev;
+	struct clk *clk;
+	int err, mode;
+
+	clk = devm_clk_get(dev, "div-clk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get div-clk\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_phys = res->start;
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	i2c_dev->div_clk = clk;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "no IRQ resource\n");
-		return -EINVAL;
+	if (!hw->has_single_clk_source) {
+		clk = devm_clk_get(dev, "fast-clk");
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get fast-clk\n");
+
+		i2c_dev->fast_clk = clk;
 	}
-	irq = res->start;
 
-	div_clk = devm_clk_get(&pdev->dev, "div-clk");
-	if (IS_ERR(div_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(div_clk),
-				     "failed to get div-clk\n");
+	if (i2c_dev->is_vi) {
+		clk = devm_clk_get(dev, "slow");
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get slow clk\n");
 
-	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
-	if (!i2c_dev)
-		return -ENOMEM;
+		i2c_dev->slow_clk = clk;
+	}
 
-	i2c_dev->base = base;
-	i2c_dev->base_phys = base_phys;
-	i2c_dev->div_clk = div_clk;
-	i2c_dev->adapter.algo = &tegra_i2c_algo;
-	i2c_dev->adapter.retries = 1;
-	i2c_dev->adapter.timeout = 6 * HZ;
-	i2c_dev->irq = irq;
-	i2c_dev->cont_id = pdev->id;
-	i2c_dev->dev = &pdev->dev;
+	err = clk_prepare(i2c_dev->fast_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare fast clk: %d\n", err);
+		return err;
+	}
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(&pdev->dev, "i2c");
-	if (IS_ERR(i2c_dev->rst)) {
-		dev_err(dev, "failed to get reset control: %pe\n",
-			i2c_dev->rst);
+	err = clk_prepare(i2c_dev->slow_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare slow clk: %d\n", err);
+		goto unprepare_fast_clk;
+	}
 
-		return PTR_ERR(i2c_dev->rst);
+	err = clk_prepare(i2c_dev->div_clk);
+	if (err) {
+		dev_err(dev, "failed to prepare div-clk: %d\n", err);
+		goto unprepare_slow_clk;
 	}
 
-	tegra_i2c_parse_dt(i2c_dev);
+	if (i2c_dev->is_multimaster_mode) {
+		err = clk_enable(i2c_dev->div_clk);
+		if (err) {
+			dev_err(dev, "failed to enable div-clk: %d\n", err);
+			goto unprepare_div_clk;
+		}
+	}
 
-	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
-	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
-						  "nvidia,tegra20-i2c-dvc");
-	i2c_dev->is_vi = of_device_is_compatible(dev->of_node,
-						 "nvidia,tegra210-i2c-vi");
-	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
-	i2c_dev->dma_buf_size = i2c_dev->adapter.quirks->max_write_len +
-				I2C_PACKET_HEADER_SIZE;
-	init_completion(&i2c_dev->msg_complete);
-	init_completion(&i2c_dev->dma_complete);
+	switch (i2c_dev->bus_clk_rate) {
+	case I2C_MAX_FAST_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
+		mode = hw->clk_divisor_fast_plus_mode;
+		break;
 
-	if (!i2c_dev->hw->has_single_clk_source) {
-		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-		if (IS_ERR(fast_clk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(fast_clk),
-					     "failed to get fast clock\n");
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_FREQ:
+		mode = hw->clk_divisor_fast_mode;
+		break;
 
-		i2c_dev->fast_clk = fast_clk;
+	default:
+		mode = hw->clk_divisor_std_mode;
+		break;
 	}
 
-	if (i2c_dev->is_vi) {
-		slow_clk = devm_clk_get(dev, "slow");
-		if (IS_ERR(slow_clk))
-			return dev_err_probe(&pdev->dev, PTR_ERR(slow_clk),
-					     "failed to get slow clock\n");
+	i2c_dev->clk_divisor_non_hs_mode = mode;
 
-		i2c_dev->slow_clk = slow_clk;
-	}
+	return 0;
 
-	platform_set_drvdata(pdev, i2c_dev);
+unprepare_div_clk:
+	clk_unprepare(i2c_dev->div_clk);
+unprepare_slow_clk:
+	clk_unprepare(i2c_dev->slow_clk);
+unprepare_fast_clk:
+	clk_unprepare(i2c_dev->fast_clk);
 
-	ret = clk_prepare(i2c_dev->fast_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare fast clock: %d\n", ret);
-		return ret;
-	}
+	return err;
+}
 
-	ret = clk_prepare(i2c_dev->slow_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare slow clock: %d\n", ret);
-		goto unprepare_fast_clk;
-	}
+static void tegra_i2c_release_clocks(struct tegra_i2c_dev *i2c_dev)
+{
+	if (i2c_dev->is_multimaster_mode)
+		clk_disable(i2c_dev->div_clk);
 
-	if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ &&
-	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_plus_mode;
-	else if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
-		 i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_FREQ)
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_fast_mode;
-	else
-		i2c_dev->clk_divisor_non_hs_mode =
-				i2c_dev->hw->clk_divisor_std_mode;
+	clk_unprepare(i2c_dev->div_clk);
+	clk_unprepare(i2c_dev->slow_clk);
+	clk_unprepare(i2c_dev->fast_clk);
+}
 
-	ret = clk_prepare(i2c_dev->div_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare div-clk: %d\n", ret);
-		goto unprepare_slow_clk;
-	}
+static int tegra_i2c_init_runtime_pm_and_hardware(struct tegra_i2c_dev *i2c_dev)
+{
+	int ret;
 
 	/*
-	 * VI I2C is in VE power domain which is not always on and not
-	 * an IRQ safe. So, IRQ safe device can't be attached to a non-IRQ
-	 * safe domain as it prevents powering off the PM domain.
-	 * Also, VI I2C device don't need to use runtime IRQ safe as it will
-	 * not be used for atomic transfers.
+	 * VI I2C is in VE power domain which is not always ON and not
+	 * IRQ-safe. Thus, IRQ-safe device shouldn't be attached to a
+	 * non IRQ-safe domain because this prevents powering off the power
+	 * domain.
+	 *
+	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
+	 * be used for atomic transfers.
 	 */
 	if (!i2c_dev->is_vi)
-		pm_runtime_irq_safe(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+		pm_runtime_irq_safe(i2c_dev->dev);
+
+	pm_runtime_enable(i2c_dev->dev);
+
 	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
-		dev_err(dev, "runtime resume failed\n");
-		goto disable_rpm;
+		dev_err(i2c_dev->dev, "runtime resume failed: %d\n", ret);
+		pm_runtime_disable(i2c_dev->dev);
+		return ret;
 	}
 
-	if (i2c_dev->is_multimaster_mode) {
-		ret = clk_enable(i2c_dev->div_clk);
-		if (ret < 0) {
-			dev_err(dev, "failed to enable div-clk: %d\n", ret);
-			goto put_rpm;
-		}
-	}
+	/* initialize hardware state */
+	ret = tegra_i2c_init(i2c_dev, false);
 
-	if (i2c_dev->hw->supports_bus_clear)
-		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+	pm_runtime_put(i2c_dev->dev);
 
-	ret = tegra_i2c_init_dma(i2c_dev);
-	if (ret < 0)
-		goto disable_div_clk;
+	return ret;
+}
 
-	ret = tegra_i2c_init(i2c_dev, false);
-	if (ret) {
-		dev_err(dev, "failed to initialize I2C controller\n");
-		goto release_dma;
-	}
+static int tegra_i2c_probe(struct platform_device *pdev)
+{
+	struct tegra_i2c_dev *i2c_dev;
+	struct resource *res;
+	int err;
 
+	i2c_dev = devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
+	if (!i2c_dev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2c_dev);
+
+	init_completion(&i2c_dev->msg_complete);
+	init_completion(&i2c_dev->dma_complete);
+
+	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
+	i2c_dev->cont_id = pdev->id;
+	i2c_dev->dev = &pdev->dev;
+
+	/* initialize virt base of hardware registers */
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(i2c_dev->base))
+		return PTR_ERR(i2c_dev->base);
+
+	/* initialize phys base of hardware registers */
+	i2c_dev->base_phys = res->start;
+
+	/* initialize controller's interrupt */
+	err = platform_get_irq(pdev, 0);
+	if (err < 0)
+		return err;
+
+	i2c_dev->irq = err;
+
+	/* interrupt will be enabled during of transfer time */
 	irq_set_status_flags(i2c_dev->irq, IRQ_NOAUTOEN);
 
-	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
-			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ %i\n", i2c_dev->irq);
-		goto release_dma;
+	err = devm_request_irq(i2c_dev->dev, i2c_dev->irq, tegra_i2c_isr,
+			       IRQF_NO_SUSPEND, dev_name(i2c_dev->dev),
+			       i2c_dev);
+	if (err)
+		return err;
+
+	/* initialize hardware reset control */
+	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	if (IS_ERR(i2c_dev->rst)) {
+		dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
+			      "failed to get reset control\n");
+		return PTR_ERR(i2c_dev->rst);
 	}
 
-	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
+	err = tegra_i2c_parse_dt(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_clocks(i2c_dev);
+	if (err)
+		return err;
+
+	err = tegra_i2c_init_dma(i2c_dev);
+	if (err)
+		goto release_clocks;
+
+	err = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
+	if (err)
+		goto release_dma;
+
+	i2c_dev->adapter.dev.of_node = i2c_dev->dev->of_node;
+	i2c_dev->adapter.dev.parent = i2c_dev->dev;
+	i2c_dev->adapter.retries = 1;
+	i2c_dev->adapter.timeout = 6 * HZ;
+	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
 	i2c_dev->adapter.owner = THIS_MODULE;
 	i2c_dev->adapter.class = I2C_CLASS_DEPRECATED;
-	strlcpy(i2c_dev->adapter.name, dev_name(&pdev->dev),
+	i2c_dev->adapter.algo = &tegra_i2c_algo;
+	i2c_dev->adapter.nr = i2c_dev->cont_id;
+
+	if (i2c_dev->hw->supports_bus_clear)
+		i2c_dev->adapter.bus_recovery_info = &tegra_i2c_recovery_info;
+
+	strlcpy(i2c_dev->adapter.name, dev_name(i2c_dev->dev),
 		sizeof(i2c_dev->adapter.name));
-	i2c_dev->adapter.dev.parent = &pdev->dev;
-	i2c_dev->adapter.nr = pdev->id;
-	i2c_dev->adapter.dev.of_node = pdev->dev.of_node;
 
-	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
-	if (ret)
-		goto release_dma;
+	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
 
-	pm_runtime_put(&pdev->dev);
+	err = i2c_add_numbered_adapter(&i2c_dev->adapter);
+	if (err)
+		goto release_rpm;
 
 	return 0;
 
+release_rpm:
+	pm_runtime_disable(i2c_dev->dev);
 release_dma:
 	tegra_i2c_release_dma(i2c_dev);
+release_clocks:
+	tegra_i2c_release_clocks(i2c_dev);
 
-disable_div_clk:
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
-
-put_rpm:
-	pm_runtime_put_sync(&pdev->dev);
-
-disable_rpm:
-	pm_runtime_disable(&pdev->dev);
-	clk_unprepare(i2c_dev->div_clk);
-
-unprepare_slow_clk:
-	clk_unprepare(i2c_dev->slow_clk);
-
-unprepare_fast_clk:
-	clk_unprepare(i2c_dev->fast_clk);
-
-	return ret;
+	return err;
 }
 
 static int tegra_i2c_remove(struct platform_device *pdev)
@@ -1858,17 +1898,10 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adapter);
-
-	if (i2c_dev->is_multimaster_mode)
-		clk_disable(i2c_dev->div_clk);
-
-	pm_runtime_disable(&pdev->dev);
-
-	clk_unprepare(i2c_dev->div_clk);
-	clk_unprepare(i2c_dev->slow_clk);
-	clk_unprepare(i2c_dev->fast_clk);
+	pm_runtime_disable(i2c_dev->dev);
 
 	tegra_i2c_release_dma(i2c_dev);
+	tegra_i2c_release_clocks(i2c_dev);
 
 	return 0;
 }
-- 
2.27.0

