Return-Path: <linux-tegra+bounces-7641-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E359AF0F75
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Jul 2025 11:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626801C26D72
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Jul 2025 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36CB2472BA;
	Wed,  2 Jul 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0xj1xrtP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98EA244697
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447655; cv=none; b=dNzChZhdlm2H/8QF1CBpqGNNsSI8L3uI66dVUTCvlysN6VObpAENNUwsMSov3DTsoL13qhubqB1LZ1U3kIorYXt9cMIyoIlo6SzeCj/y7XFdgXsUPMDUsgsAV+NjNNCTTXN7BlOUKEQNSWzEINLAlTapKNCPZePG9WObmV0T6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447655; c=relaxed/simple;
	bh=vlWos34yRED/o/ej5hygk3znQ4/3QzLL9YsUqSMGkEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8+Ncc61oZbIY/XDk34UUEQnahaVGowJH4BnpkK8OSggDDtclQbbsoiQK1U/zI8y38c/k/mBJ4IE84CFXmhBi9rAiRfCbHV+mYC5PzpI8HSbYiNkQlwRxs7/cOkPsZh9Zn5ychub2rm/TdgJt0Sh07o55V8O98YpYEp76abByO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0xj1xrtP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2766782f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447652; x=1752052452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YZckgbGxJ1hnYLvQegjvXHpxK5P631feiXbEW2g4Cw=;
        b=0xj1xrtPJMC04YUKqyVYo9cUW5+74PZKNGEJpdVwLy05vfxQ/QG/FgONOTsfc5lfGE
         qwWr1mQwXqvMmqGM/8GdAwiNH97jXzKICcdrNvkzPStrXshiZKlmPOHkrib3PqLhQoDE
         ekqIcn5oGnCDUWXLwKZ+J3FxbCsauuyqgA6g4Oz6G/cXIlq9P2jNAkKqb180OvnRVdSO
         aWq6vovTe5usH3lDFf3neIChOmRQ24Ip849eHAX1WQpICmYnnCoNYO6z7vLrRtl6RzUo
         dDadXylPFDtckhSt+eN7bOU5ljcMQittboEtDBe3UHpqBuK0Kq/5r+cdP25c31FSv4Xl
         onzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447652; x=1752052452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YZckgbGxJ1hnYLvQegjvXHpxK5P631feiXbEW2g4Cw=;
        b=jWx/xiKn8GXIW/fk6qfU8xy72vAcyOAgfIl624fCzmEy/bo74Leg3kYVoAzYN1jM+d
         yJlRz8KJhYBd3isVAK9L+FKrKNIIB3jsvn1VPnTsQtBoJ3gGlJiSKedWmiqNr2Dl2nu9
         HjCYVgFhLxfN3rusu164lVsn5AFEJdSH6/wD+MqdRuRxDeAe8vpSK0R2UHq7goKwh5Il
         t/eT4dRAMFdCQwqoUi/u887Grlr89EEkCQO3UvR9SDdRBe9ud+zxB/ehqOBWVEc8TeHg
         OaBRGunj8Lryazlkmiz+7HcXz9ybB33at19JsTTzRcOqczJMIwPotSJPNwIxS2FXJPSD
         zqbw==
X-Forwarded-Encrypted: i=1; AJvYcCWMZdkReQhfSbgQpZ4LpmXf5zyY1nzZGXVs0+VU+WJArLoSuu3cLcws97tU4Mo1JgNFsT4P6oZiEiphIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylvYVQxzaEIXFts4gsrKv38C/qZ+x9CpbojwbCeEu2VjcaHsPn
	MAZALAnmAfe9FgL7v8yZ02Q0HLDXplxn5FPXSgxalWlb60g+Zbl0cHPocu8+aiCsr44=
X-Gm-Gg: ASbGncteysmnkCGBFHJt3+RxPhIP+bG117gOLN7qdNwFGgwZh7h0rLuBFNFfo48iJSn
	zOe/xwxNDihjh32qHGZo5ua03gSrGRmys/gs3vJHdmykmSCgY63oV0DUxoWBQ9wgjROGOgApcQu
	d+Klb1etOlAIHeG237KuO9/e9BL44VKlWRWwh/HMHsuAL0lVTN7lscsl93gwwGQHDbGoYT8kfgZ
	Zhq6Z3GU28krl9Cef0SpJS5Ln2mPmFxzEuIxVtkMKKGrUWoxEVH47zyOdN1BFVBwGAuC7bBvZpX
	1VBFMc6Z4zvSpp/THe1C4KxjBY/UkLFNtoGD42JMjjp/5X99/E0CGw==
X-Google-Smtp-Source: AGHT+IFLfzi/BCJ/h+mSdQ9xGwiNV5G7jBvFCAXe3W2of4zOmeQyAuTVDpN9h6oQsHMDpXT+EB5rNg==
X-Received: by 2002:a05:6000:1ac8:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3b1ffdcdb14mr1602151f8f.21.1751447652166;
        Wed, 02 Jul 2025 02:14:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:02 +0200
Subject: [PATCH 01/12] gpio: tegra186: don't call the set() callback
 directly
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-1-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7sWctEykrkqk6kYWh/FDX1BbGBSXDLqJlAMoLkCHSyw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhfHAx9yu9sVGaYUJpQKy3p/DsY1uFA2E2PJ
 dw2rteNfFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 crrWEADNO3YgH2sFCwknhWS5gSLq6uoC3TtC/1AZ+gw/8JXgB0xDrRk44uWBlNhzIxcjeyA3a1D
 NOC17eX9+Gizfeu9aBdfT0XFJ6Y4+ubDnN3VTUtJlvtfAnrGfSIGo1ePdBhBvNUPO/UH2IyULa6
 sPuMfT6h9nyhD6EOa7b/avX/5aEDV/iP/3V4YzAb8ScflVzJECzdNfMbmUySMGO03AUF/2HAGSa
 h6lfs6AtQhvHX/y3y+USH4Y3wTlIIs7tvkfPdN7sTP/ecxeMUaoIb/fHDoywq+aql5JufdNJ2Iv
 kHwzqJT72tp7EHKlr1SCkC+DQPThqRm1RTHUHZMad3FKwtNfWzcBU8hN19jofknqGEJrYI2Cht2
 GCmjx/Mtp//IVxDPqD/U27l0xEj+E2AWnI3V5rV9T6/TAmPcGiEgMSM30Gdf6W23s+frYX2ffwm
 l+yZ7yil38/vgV+vuXTMqrqZ9LVTcF9SNYWWMzizIKaoxOAvJCvyy/4wYmfICH8JKYIzL5xlOZM
 CoUltAKCdelNK54P+IlbpB4x7G9VWaNnlj25J3abIsSqfGjJX6hWy45nz18pjia9MghfMNTsIlf
 CjxWNWrxMmH9AxcXn0ZFiu9s5BEGHvGFhUA/dH4m+2BcBABYCetZWNV7GxCU6JkEVVpz59rx/uV
 dgKFr/7YNY00LLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drivers should not dereference GPIO chip callbacks directly. Move the
module's set() function higher to make it available to the
direction_output() callback and call it instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tegra186.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d27bfac6c9f53d23806725f5fc89fd0331f4afb0..04effccf9ecdf0828bc50455dace3ba8e8bdbbef 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -202,6 +202,26 @@ static int tegra186_init_valid_mask(struct gpio_chip *chip,
 	return 0;
 }
 
+static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int level)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	void __iomem *base;
+	u32 value;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (WARN_ON(base == NULL))
+		return;
+
+	value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
+	if (level == 0)
+		value &= ~TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
+	else
+		value |= TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
+
+	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
+}
+
 static int tegra186_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
@@ -251,7 +271,7 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
 	u32 value;
 
 	/* configure output level first */
-	chip->set(chip, offset, level);
+	tegra186_gpio_set(chip, offset, level);
 
 	base = tegra186_gpio_get_base(gpio, offset);
 	if (WARN_ON(base == NULL))
@@ -359,26 +379,6 @@ static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return value & BIT(0);
 }
 
-static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int level)
-{
-	struct tegra_gpio *gpio = gpiochip_get_data(chip);
-	void __iomem *base;
-	u32 value;
-
-	base = tegra186_gpio_get_base(gpio, offset);
-	if (WARN_ON(base == NULL))
-		return;
-
-	value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
-	if (level == 0)
-		value &= ~TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
-	else
-		value |= TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
-
-	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
-}
-
 static int tegra186_gpio_set_config(struct gpio_chip *chip,
 				    unsigned int offset,
 				    unsigned long config)

-- 
2.48.1


