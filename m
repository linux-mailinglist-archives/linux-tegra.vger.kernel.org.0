Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D3873ABA2
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jun 2023 23:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjFVVcX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 22 Jun 2023 17:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjFVVcV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 17:32:21 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6FA1FCB;
        Thu, 22 Jun 2023 14:32:19 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687469538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oBJxrt4i+LGbBD4mfrNY1AHWEbUyplXBhUqOZFUszxU=;
        b=XienpFfNhC63YHZ+S/Fx+4DGtTlTsqVyWMH3tsLqTkagaycqRyv8C1MZzudWZb+RfSPxsv
        qBzFgczekwDrWBaE3B8OghKq3ciYsPzy4ZqKdJncZBE/PD2DjKaa1s2wCTsZeALZNWl87C
        in2DTs+xSyCdryfI9yKhWPKD3vsw2IeiPeX29n/8zE5Z/hwXKlERiEvyQRLohrQh0Q0Kmx
        WrG5Sm1ZvfhAJ6bW44IWd78CJcdW9oD83ABrBRHSopa7Lmeq9JAaFtdw3X91z1u/yOPpbO
        y0enAVd8Yy264z6A6QpnSnlbff/MCMKHoR1ui5jx+ojzM+XJXHopDp/f4hFYMw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 617C81BF206;
        Thu, 22 Jun 2023 21:32:17 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Date:   Thu, 22 Jun 2023 23:32:14 +0200
Message-Id: <20230622213214.3586530-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is apparently no reasons to open-code of_device_uevent() besides:
- The helper receives a struct device while we want to use the of_node
  member of the struct device *parent*.
- of_device_uevent() could not be called by modules because of a missing
  EXPORT_SYMBOL*().

In practice, the former point is not very constraining, just calling
of_device_uevent(dev->parent, ...) would have made the trick.

The latter point is more an observation rather than a real blocking
point because nothing prevented of_uevent() (called by the inline
function of_device_uevent()) to be exported to modules. In practice,
this helper is now exported, so nothing prevent us from using
of_device_uevent() anymore.

Let's use the core helper directly instead of open-coding it.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4d16a3396c4a..84d042796d2e 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
 
+/*
+ * Note that this is really only needed for backwards compatibility
+ * with libdrm, which parses this information from sysfs and will
+ * fail if it can't find the OF_FULLNAME, specifically.
+ */
 static int host1x_device_uevent(const struct device *dev,
 				struct kobj_uevent_env *env)
 {
-	struct device_node *np = dev->parent->of_node;
-	unsigned int count = 0;
-	struct property *p;
-	const char *compat;
-
-	/*
-	 * This duplicates most of of_device_uevent(), but the latter cannot
-	 * be called from modules and operates on dev->of_node, which is not
-	 * available in this case.
-	 *
-	 * Note that this is really only needed for backwards compatibility
-	 * with libdrm, which parses this information from sysfs and will
-	 * fail if it can't find the OF_FULLNAME, specifically.
-	 */
-	add_uevent_var(env, "OF_NAME=%pOFn", np);
-	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
-
-	of_property_for_each_string(np, "compatible", p, compat) {
-		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
-		count++;
-	}
-
-	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
+	of_device_uevent(dev->parent, env);
 
 	return 0;
 }
-- 
2.34.1

