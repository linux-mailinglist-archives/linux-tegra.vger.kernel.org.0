Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7B15F2D53
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Oct 2022 11:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbiJCJ2K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Oct 2022 05:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiJCJ1C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 05:27:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3ED402EB
        for <linux-tegra@vger.kernel.org>; Mon,  3 Oct 2022 02:26:44 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id a10so3436230wrm.12
        for <linux-tegra@vger.kernel.org>; Mon, 03 Oct 2022 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=crQJQSZoczKrIegK5IuceoLZkv1wMF3jvS/SHAicAiM=;
        b=KGtMSGAXICJ/DwV4XMfRjrdoTh5T91r4Ev/sgJYT606zjHusP4FkxTaiO9AsqX61IP
         tWJZ/y+BQqTdTC/FVc8iezYmgFUCdrYPP07Uey3+gaDImlht2ehw9tsdKlR5GQm9fXiN
         LL4vdY1I2Cf9P9EAjpJdNgCnEhe2xW8MA28zyybyeFCeOXy1PzaBz7rcO7mUzTl59X8L
         Bzi7vEcavPtVf0zik3VvmhVC01fyxhNGzGWU5nxlJYSUo1lxq3rnxl9rpmflPbC7qPuy
         nzrbr9zdhqdo5AQD33oWWuqQ+N6u+O0EjKSTVhxr+47ylNLO5MbxZQl+tUjV54JC41Tc
         eJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=crQJQSZoczKrIegK5IuceoLZkv1wMF3jvS/SHAicAiM=;
        b=hSmKbwPlWXRsOkx8WMzHMiwVWidEFkKmeBt2d31MPKNCxSJ4gDKsC0aSc9xZ32J2BN
         etH/jGRmTQ1wjaPwD3QTa8UtKKSgLvTgsYnZ2zK+NPrlwMGHQ56tV+iGVPruqXzP17Tp
         r/3Vh5Tx3cncxW9bBjNGIIgax0eynVarFcNRGYxHfBxeJ5jIYtWXlGpq8zZD+2pDB+jY
         UiPLWj+5dgdzN+6JYdlde+5tCGk/uh3T3RcGc9cxGm/AX/EHRfZZMmW3nfpT8B+uzDVR
         vQNlvdUSCtbHcVd6i0o/+Q12BryfwM9/uglC7xxytgxH2RGqk9yHXoJPzbUIeDAplrpf
         PlJg==
X-Gm-Message-State: ACrzQf2XDmu3cQxbtGrwT18GtFRKxTtdz7VdANDD8WffJV4AYhtApBjR
        v21MN6PfDxdr+CAFmCfDNIYQrQ==
X-Google-Smtp-Source: AMsMyM59ImhLTPdv9LNieneqIQ7rNDbQ3mpJ8oimrU92zL1/bQKjPVd9QQ5UNQQyhAl6v5lxqDi5oQ==
X-Received: by 2002:a5d:4cc2:0:b0:22e:372d:9c9 with SMTP id c2-20020a5d4cc2000000b0022e372d09c9mr3384076wrt.576.1664789193641;
        Mon, 03 Oct 2022 02:26:33 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:f3a:9f5e:1605:a75a])
        by smtp.gmail.com with ESMTPSA id ay3-20020a5d6f03000000b0022cc157bf26sm9707520wrb.85.2022.10.03.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 02:26:33 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v8 06/29] thermal/of: Remove unused functions
Date:   Mon,  3 Oct 2022 11:25:39 +0200
Message-Id: <20221003092602.1323944-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
References: <20221003092602.1323944-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
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

Remove the dead code: of_thermal_get_trip_points()

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_core.h |  7 -------
 drivers/thermal/thermal_of.c   | 17 -----------------
 2 files changed, 24 deletions(-)

diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 879e91a48435..c5990a3fcf8a 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -141,8 +141,6 @@ thermal_cooling_device_stats_update(struct thermal_cooling_device *cdev,
 #ifdef CONFIG_THERMAL_OF
 int of_thermal_get_ntrips(struct thermal_zone_device *);
 bool of_thermal_is_trip_valid(struct thermal_zone_device *, int);
-const struct thermal_trip *
-of_thermal_get_trip_points(struct thermal_zone_device *);
 #else
 static inline int of_thermal_get_ntrips(struct thermal_zone_device *tz)
 {
@@ -153,11 +151,6 @@ static inline bool of_thermal_is_trip_valid(struct thermal_zone_device *tz,
 {
 	return false;
 }
-static inline const struct thermal_trip *
-of_thermal_get_trip_points(struct thermal_zone_device *tz)
-{
-	return NULL;
-}
 #endif
 
 int thermal_zone_device_is_enabled(struct thermal_zone_device *tz);
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 5cce83639085..2f533fc94917 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -54,23 +54,6 @@ bool of_thermal_is_trip_valid(struct thermal_zone_device *tz, int trip)
 }
 EXPORT_SYMBOL_GPL(of_thermal_is_trip_valid);
 
-/**
- * of_thermal_get_trip_points - function to get access to a globally exported
- *				trip points
- *
- * @tz:	pointer to a thermal zone
- *
- * This function provides a pointer to trip points table
- *
- * Return: pointer to trip points table, NULL otherwise
- */
-const struct thermal_trip *
-of_thermal_get_trip_points(struct thermal_zone_device *tz)
-{
-	return tz->trips;
-}
-EXPORT_SYMBOL_GPL(of_thermal_get_trip_points);
-
 static int of_thermal_set_trip_hyst(struct thermal_zone_device *tz, int trip,
 				    int hyst)
 {
-- 
2.34.1

