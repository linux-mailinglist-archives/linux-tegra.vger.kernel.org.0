Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6551AE41E
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 19:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgDQRyv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 13:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729980AbgDQRyv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 13:54:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9BCC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:50 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e25so2944750ljg.5
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
        b=DPUU6a0iy8DAotclL1Bt81ah0Or3GtD0+dChp+lHlSXmGB8kysZ6r9FbOXAJpnTGWV
         1MJBh+CPPbv10t1SEDUcTT1dZaeEibqoZgtykLH9W+Uj8yPQDAuaqb2ks8quw98r3nrg
         XU796S36wcrw+VUSyNhtpqbCsWd+DkxdlLGD3gurgw46GR9jNln95Ek0MNYGpPIJXrkU
         DzrhGmnDmtA8v+/EXeTwIojY/zLzTyYqP4Qw+/G35DCjughaQYJd6KeektIKllo+IJ+E
         8/OXrhyEWqKiS0PyW+66aeFi3T1TxA5NkXsncM81a31F9bsttj8BLMOlbxMdE/+Banbf
         GINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pVig2XpcIi1wUU1dzHSjXjcQnTVD/QNrePxBnDzBNIU=;
        b=hqjGQiGwcYTE34++Dc6uOvdN3abq3/8c/TzIpKaTI/4tSjZi5af4g/dV4GHfktMQMn
         pzeJzvfgBtfiv+so/t6PCRjnX3a5xvnUsEsooFxTEFwEYv4zyAsePvGym/Sai+r/s5Ar
         YujJweig2QBO56pfj7qtmVJg1PwtBjLwdPYyh3AquPJXli7wNwsrA1snksEg8hN4Ftuc
         7Sjbl6mhucFey9ScKlYplVxHDsV5jn5gziNfNTzqqe+c8pDObrwYYoSAR9qm2yrtNJds
         zvY32/sg2VYRu9krZ42I2fhD6/HePL6OYXuYwVZZVDU+ty+oWq6O47R8H3GFKyzPCb/t
         sUHg==
X-Gm-Message-State: AGi0PuZn2GUg90iufszciLy5Mz378bp4YIznAIrhq69jpy1Egiy2gaZA
        vWk+jQSimrVrhCfVY8QkRkQ=
X-Google-Smtp-Source: APiQypILZrkqG5hAVUaDseO32nMzi3/C2Q7vP4vjEu67S83PDI8GaNjtl9ZwQ/N5SYtCxQUfGILT3w==
X-Received: by 2002:a2e:6c05:: with SMTP id h5mr2810388ljc.217.1587146089229;
        Fri, 17 Apr 2020 10:54:49 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:54:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 1/3] drm/tegra: output: Don't leak OF node on error
Date:   Fri, 17 Apr 2020 20:52:36 +0300
Message-Id: <20200417175238.27154-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417175238.27154-1-digetx@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The OF node should be put before returning error in tegra_output_probe(),
otherwise node's refcount will be leaked.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/output.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e36e5e7c2f69..a6a711d54e88 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
 	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
 	if (panel) {
 		output->panel = of_drm_find_panel(panel);
+		of_node_put(panel);
+
 		if (IS_ERR(output->panel))
 			return PTR_ERR(output->panel);
-
-		of_node_put(panel);
 	}
 
 	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
@@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
 	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
 	if (ddc) {
 		output->ddc = of_find_i2c_adapter_by_node(ddc);
+		of_node_put(ddc);
+
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
-
-		of_node_put(ddc);
 	}
 
 	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,
-- 
2.26.0

