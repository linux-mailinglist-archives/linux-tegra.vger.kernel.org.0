Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14CA1358EA
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFEIqu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:46:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39315 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEIqu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:46:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so18573302wrt.6
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+eHts3UorKo8UYBcN1QT/Tt6PpNCT4+hc66JFubl48=;
        b=PSfMaFlRm23bCSXA8pty1uWOdSxy4ziR22dDSPjO+GvFeP1udfidk+tJjzFrzgyqcZ
         qTYHeePbiPsPQ5lQXKwlUsJGpAni7o32ymym0OXwlXnQZy9CaMApEjFb1GQ2GjJci1tx
         +Hnw++3td8TnYsnmwLwKibdULSrWguTmfmnp9wWEVf095wPND3Vpu0SpZCqSKR4baBof
         LfULpwoXHIKrtVQv+aBoX5pC5BlDlewSIshSKSSTHNaNtFd8KMVjBhlAoB5Z4xxBRq1q
         dfKuj7uvKf0Q4jaMcg2y50VnpEa+id5foc1Hau2guzKzofS0US/aeC4PCHu1v0NhEtmI
         yOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+eHts3UorKo8UYBcN1QT/Tt6PpNCT4+hc66JFubl48=;
        b=fJ/nNrrZKmtzAAaz92IfJHz8GRMRBVaEsyCv5+NodKN+rVCnjgFr7i8JmgzbJ4deJr
         +HT4xpRYH9bqiBPE3hJj1HaNpyHdHra0cD1NN1psxH7fSTzd7aI/AhEF51zReQJ2aqMz
         8JGuDZ2w0d4yKoNy1lOQ7jtVCGEE3iSYa2DXdfndkMIMISwpaFye0ugatvFC08CXazHb
         sS1wVCTJkif6dyxGlgyumXrlEN58qmKLg2dLFn558kEBecwINgJ1RJCKQZwitTBkCq40
         B5MEoelV3vMRjSQZRagVkiUc59eEIJn7l21G0TqQGr3qTqL0Mo5n2teONPSqY72lNqLR
         rpDA==
X-Gm-Message-State: APjAAAUC8XIs+ZLmibSsdNZgnEycMzbJzaVKvjDQB/lkV0ViQ75AJ4Sp
        ZXAxkOkFZN1Bul/KdMesDYA=
X-Google-Smtp-Source: APXvYqycG0HDgoAoJqeHklo3PcpK3qTnFMLP01TwiuVnRWc2Io0ZA3jpwM4Y+7jf85/fmTMxsgiZkw==
X-Received: by 2002:adf:e4d2:: with SMTP id v18mr9582368wrm.189.1559724407982;
        Wed, 05 Jun 2019 01:46:47 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d10sm24075929wrh.91.2019.06.05.01.46.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:46:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Use GPIO descriptor API
Date:   Wed,  5 Jun 2019 10:46:46 +0200
Message-Id: <20190605084646.12340-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The legacy GPIO API has long been deprecated. Move the driver over to
the descriptor-based API, which allows us to get rid of some boilerplate
while at it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.h    |  3 +-
 drivers/gpu/drm/tegra/output.c | 52 +++++++++++++---------------------
 2 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 70154c253d45..488f36f00bd8 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -127,8 +127,7 @@ struct tegra_output {
 	const struct edid *edid;
 	struct cec_notifier *cec;
 	unsigned int hpd_irq;
-	int hpd_gpio;
-	enum of_gpio_flags hpd_gpio_flags;
+	struct gpio_desc *hpd_gpio;
 
 	struct drm_encoder encoder;
 	struct drm_connector connector;
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 9c2b9dad55c3..e4d242ca27b8 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -53,18 +53,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
 	struct tegra_output *output = connector_to_output(connector);
 	enum drm_connector_status status = connector_status_unknown;
 
-	if (gpio_is_valid(output->hpd_gpio)) {
-		if (output->hpd_gpio_flags & OF_GPIO_ACTIVE_LOW) {
-			if (gpio_get_value(output->hpd_gpio) != 0)
-				status = connector_status_disconnected;
-			else
-				status = connector_status_connected;
-		} else {
-			if (gpio_get_value(output->hpd_gpio) == 0)
-				status = connector_status_disconnected;
-			else
-				status = connector_status_connected;
-		}
+	if (output->hpd_gpio) {
+		if (gpiod_get_value(output->hpd_gpio) == 0)
+			status = connector_status_disconnected;
+		else
+			status = connector_status_connected;
 	} else {
 		if (!output->panel)
 			status = connector_status_disconnected;
@@ -102,6 +95,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
 int tegra_output_probe(struct tegra_output *output)
 {
 	struct device_node *ddc, *panel;
+	unsigned long flags;
 	int err, size;
 
 	if (!output->of_node)
@@ -130,23 +124,18 @@ int tegra_output_probe(struct tegra_output *output)
 		of_node_put(ddc);
 	}
 
-	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
-						   "nvidia,hpd-gpio", 0,
-						   &output->hpd_gpio_flags);
-	if (gpio_is_valid(output->hpd_gpio)) {
-		unsigned long flags;
+	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
+						       output->of_node,
+						       "nvidia,hpd-gpio", 0,
+						       GPIOD_IN,
+						       "HDMI hotplug detect");
+	if (IS_ERR(output->hpd_gpio))
+		return PTR_ERR(output->hpd_gpio);
 
-		err = gpio_request_one(output->hpd_gpio, GPIOF_DIR_IN,
-				       "HDMI hotplug detect");
+	if (output->hpd_gpio) {
+		err = gpiod_to_irq(output->hpd_gpio);
 		if (err < 0) {
-			dev_err(output->dev, "gpio_request_one(): %d\n", err);
-			return err;
-		}
-
-		err = gpio_to_irq(output->hpd_gpio);
-		if (err < 0) {
-			dev_err(output->dev, "gpio_to_irq(): %d\n", err);
-			gpio_free(output->hpd_gpio);
+			dev_err(output->dev, "gpiod_to_irq(): %d\n", err);
 			return err;
 		}
 
@@ -160,7 +149,6 @@ int tegra_output_probe(struct tegra_output *output)
 		if (err < 0) {
 			dev_err(output->dev, "failed to request IRQ#%u: %d\n",
 				output->hpd_irq, err);
-			gpio_free(output->hpd_gpio);
 			return err;
 		}
 
@@ -186,10 +174,8 @@ void tegra_output_remove(struct tegra_output *output)
 	if (output->cec)
 		cec_notifier_put(output->cec);
 
-	if (gpio_is_valid(output->hpd_gpio)) {
+	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
-		gpio_free(output->hpd_gpio);
-	}
 
 	if (output->ddc)
 		put_device(&output->ddc->dev);
@@ -209,7 +195,7 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	 * The connector is now registered and ready to receive hotplug events
 	 * so the hotplug interrupt can be enabled.
 	 */
-	if (gpio_is_valid(output->hpd_gpio))
+	if (output->hpd_gpio)
 		enable_irq(output->hpd_irq);
 
 	return 0;
@@ -221,7 +207,7 @@ void tegra_output_exit(struct tegra_output *output)
 	 * The connector is going away, so the interrupt must be disabled to
 	 * prevent the hotplug interrupt handler from potentially crashing.
 	 */
-	if (gpio_is_valid(output->hpd_gpio))
+	if (output->hpd_gpio)
 		disable_irq(output->hpd_irq);
 
 	if (output->panel)
-- 
2.21.0

