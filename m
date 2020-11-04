Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 068E22A6627
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Nov 2020 15:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730113AbgKDONK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Nov 2020 09:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbgKDONK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:10 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4CDC0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:10 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o13so14807079ljj.11
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NAXZ2yqySRWSwfhJrxaNVSgF2MSixnwPtKl9eGEwyI=;
        b=ZV84EIcV/XxHVHr/vYOw3jw6tutCNzFgeV31YYlfCPdMIDYWvKhBqPNbaD/hdKzJhp
         C1RG/ebQ7JWK8Ewnkny1zoqBaH6bim0peFHGzgaBNT1VJme8zqgQ+AzlEAGo3hVfoNmr
         ZsTlSoCx6ysI5v9hQJwjFfURgnvji6tMYgqXFHwNaPbXiVKGW4Q6H7koM+mjohm20BdR
         sce9z816542emaVqwoG2V5Fj0Ifi7EiexK9i+gU6PjdB6YrzlNF40eN37OSm3++mXyio
         4LHb6q+JDoN58lscxvEfHrddPh8zoGX0i8DlprJL+Njq6/Kce30dMdIinpif2fLouYyO
         PBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NAXZ2yqySRWSwfhJrxaNVSgF2MSixnwPtKl9eGEwyI=;
        b=qiwSPp9Q1eZzuR9CHVkmqNLs5rkEHJrEti+/X4mmR3ifEVx2V+u9r0w3EWAUZGTn9d
         f3zPZe2DUy3mYUhKMwvqdHo/MQbBNh2oSWKDXivdqnAdHwIHkyprglBbbInyINjNI/Lr
         ygHEnd5nv7fxQXWwS3M1sBbTYbyHjXU1F6PV3TrbE2ds3nhwknB/wSsQTiaRzyPFHQAd
         4jsyx3c3ssz078eMs4heyt1tzXq1TU1cKCoaAOkhxs67QEeVgOhpnTZSuSyU1Hh2FKQB
         vrwC1qFci/enymDw0Vmlr6SXqMv+iK8ZX7nR2svyl5fK/Cw+CS7YA97RbJqTcwNAYlOK
         3+aQ==
X-Gm-Message-State: AOAM530H1dnuRsWYvlmnfnH3L9QxA0BVJN8V9y/3DZWBR0KmYMsFu0lc
        5jBxkmtuG18UpAqNONilO2ndoy/fJNs=
X-Google-Smtp-Source: ABdhPJw6IXIxv1C/8xDjSrOcuNIGoRFxb8+rFn8YEhgTnkMx/gpoCbteTLqpcJzWsPP/+2IsZ+sCBQ==
X-Received: by 2002:a2e:91c9:: with SMTP id u9mr11337693ljg.172.1604499188583;
        Wed, 04 Nov 2020 06:13:08 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:08 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 8/8] ARM: tegra: nexus7: Use panel-lvds as the only panel compatible
Date:   Wed,  4 Nov 2020 17:12:51 +0300
Message-Id: <20201104141251.25834-9-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Depending on a driver probe order, panel-simple driver may probe first,
which results in this error:

  panel-simple display-panel: Reject override mode: panel has a fixed mode

We don't want to use panel-simple anyways because customized timings are
preferred for Nexus 7, hence remove the panel-simple compatibles from the
panel node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index fb5b33f1bcd8..df33f3db8a38 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1103,8 +1103,16 @@ cpu@3 {
 	};
 
 	display-panel {
-		compatible = "hydis,hv070wx2-1e0", "chunghwa,claa070wp03xg",
-			     "panel-lvds";
+		/*
+		 * Nexus 7 supports two compatible panel models:
+		 *
+		 *  1. hydis,hv070wx2-1e0
+		 *  2. chunghwa,claa070wp03xg
+		 *
+		 * We want to use timing which is optimized for Nexus 7,
+		 * hence we need to customize the timing.
+		 */
+		compatible = "panel-lvds";
 
 		power-supply = <&vdd_pnl>;
 		backlight = <&backlight>;
-- 
2.27.0

