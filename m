Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7BD608CB
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2019 17:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfGEPMK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 5 Jul 2019 11:12:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45763 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfGEPMJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Jul 2019 11:12:09 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so6531798lfm.12;
        Fri, 05 Jul 2019 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+UJP5d8d4R7j2ybp/z262FGakRH0zeassz+JZDSgOkc=;
        b=hbUbsiXNaQz36B81KUhBjhvIUIfzHd8SYh1zWb7ZPNb2g/Hi9y3Bo/STNk2vlm7M/Z
         aPk4HnZReVoh3mUTjzWMPES5BJoQETWYE0PsO+59zkZ4WIZT5rT+ULo7fKCNZEdjMXXP
         BRLbv+7I6xhwAWYUIAw0qwvV9wV9rRBbyO+GjKtXbiBeVQHzkdQBgbnQ+IwPorCFCuTB
         SPRYph/EJX6rhbHDxLPmNnF/BpRasHhCDZBmRvPGNTldaygtPDv/Q/7gefmzkviKyH+8
         +Qo3knHieQex0gZ1TuxMY3uq/Rre0HiiM+m8dtgi/no7bQjt/61IUO/0oTMcC19J7k9a
         38sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+UJP5d8d4R7j2ybp/z262FGakRH0zeassz+JZDSgOkc=;
        b=QMNPZJ0BkMMMZ2DFfFK7rA6+daGxlMq/SYipIBJOd2dfNl43K60UBZj2BHy1tpSy8P
         r37GF8MyAzbfay/E9A2GWCXkPUykAklJsUA5Q0sqq5dlm0vqavSMaO8O6sA0SXu4jx4B
         i+NYxTOwq5LDkbeL9yBz3oGpyVKGxnNFBw0km94RdNLIGNAI0SW1wXjbOcPuPL1uVS9p
         2xvHNQWIEMUdLAnF0cOTtp5MW6ROzoc8kBAKF13wRSQhNNE1etWzkO3lJNQlTNdPzRrD
         Hzho69yoDdvohmg7bp8mzEPeIHmkEckXvfwmtq0OJaIhyhnbVhKRtI8y3nhn8bLphMqL
         m4gA==
X-Gm-Message-State: APjAAAW4xcBc35vSXsfUnzc+qBWdTuKF5YjiQ4tXAI2EPFgqvjAGl3w2
        yjCatJ+KaoZ6K0Dcum5kYoSIHVgr
X-Google-Smtp-Source: APXvYqzz63aFUveYFlYoX/IDK56bwneXg5+8snrrvQOzJrfb+MCKJiREOCmTeOHOkD+rM81Dlf/heg==
X-Received: by 2002:a19:7110:: with SMTP id m16mr2270647lfc.4.1562339527654;
        Fri, 05 Jul 2019 08:12:07 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id r17sm1851253ljb.77.2019.07.05.08.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 08:12:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/tegra: Fix gpiod_get_from_of_node() regression
Date:   Fri,  5 Jul 2019 18:11:39 +0300
Message-Id: <20190705151139.19032-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

That function now returns ERR_PTR instead of NULL if "hpd-gpio" is not
present in device-tree. The offending patch missed to adapt the Tegra's
DRM driver for the API change.

Fixes: 025bf37725f1 ("gpio: Fix return value mismatch of function gpiod_get_from_of_node()")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 274cb955e2e1..471d33809cd4 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -126,8 +126,12 @@ int tegra_output_probe(struct tegra_output *output)
 						       "nvidia,hpd-gpio", 0,
 						       GPIOD_IN,
 						       "HDMI hotplug detect");
-	if (IS_ERR(output->hpd_gpio))
-		return PTR_ERR(output->hpd_gpio);
+	if (IS_ERR(output->hpd_gpio)) {
+		if (PTR_ERR(output->hpd_gpio) == -ENOENT)
+			output->hpd_gpio = NULL;
+		else
+			return PTR_ERR(output->hpd_gpio);
+	}
 
 	if (output->hpd_gpio) {
 		err = gpiod_to_irq(output->hpd_gpio);
-- 
2.22.0

