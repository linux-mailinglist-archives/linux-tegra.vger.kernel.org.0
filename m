Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1538167A372
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Jan 2023 20:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjAXT5a (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 24 Jan 2023 14:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbjAXT53 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 14:57:29 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBCD46D6A
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 11:57:26 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t18so2173220wro.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Jan 2023 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB9I+/Tk9kHQT8QPiB3II5sGODvwetZQhB7HX9QWOdE=;
        b=YiZbCsTkWX7qaBcx9slMjH6+effXtwjymWr3GN8IP7nGKDffEFwF+GniYQJGxRDdij
         ddxnoXiPHLtD1J2xu06stt50XG7TMZHlU4vUx1FUq5u1vVJ1iFg138K5ObVFl5VqTbij
         vgJu63fNHqpEAcA70RBCp7uEoqgSo8vC4mMsXr1eFSwwyt5n7FebqWFUxG22D15WSOLx
         rr65vwxKSRjpn0Q/Phw+MaIIrh5QNbS8PF3uygWX27Z16dxkYQc/uZt6NRcmIevTJ0To
         TDTM2yGHMo7TX+Uiq+7ajTJHTvsLOzLdPh7rrhMVO04WMLFrxkUZDic+0tnVmERM7//X
         EyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uB9I+/Tk9kHQT8QPiB3II5sGODvwetZQhB7HX9QWOdE=;
        b=PDtIYSyHSfAW7+NhPDRWsICRRZXarimlvf6NvJiCh8SaVqBUC43ZZed4hrVI9PYN7B
         ue9yy4vFaxxQh+ib0Dk6JO7mmwGJ0iVvoalIAm9mx8fu8TqDAmh+1A9oz/ejPXeco02e
         GN2Pd83ujopQZ7aGnkeSml/xLkpD0JAPkcs8RBMIoY522eLFOrOuBBVvCfhqZ6XL/fJk
         qWx37AUg4Omdoa9aBQvnClfKo0ZciPpca6ZhkcA3n6d1/BGqo5fqBfdFTpA1QEo1Fv/y
         P2Wi/fAWIXpMwm6dtiam3CXpL+e5rRFanAN3JpSzYsKc+/c9l9VTjpk1E11SCkE0nRHV
         1mHA==
X-Gm-Message-State: AFqh2koWWTK9lnZyAC8SaW3m3XoUyQLeUfw3EUWk6vRv07y3K1wqF62N
        swSQBDbvVKuJiUCAObOlIV56/Q==
X-Google-Smtp-Source: AMrXdXsxJ+yxlj1AkbpDDlit6M5S/lntxDSsaXZO6X121kBm1RStBcF/mVtX9lX/QgH1/sqY8z727Q==
X-Received: by 2002:a5d:404c:0:b0:2be:1258:897d with SMTP id w12-20020a5d404c000000b002be1258897dmr25315390wrp.43.1674590245043;
        Tue, 24 Jan 2023 11:57:25 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q3-20020adff943000000b002bfae43109fsm2473693wrr.93.2023.01.24.11.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 11:57:24 -0800 (PST)
Message-ID: <fa2bd92a-f2ae-a671-b537-87c0f3c03dbd@linaro.org>
Date:   Tue, 24 Jan 2023 20:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>, Wei Ni <wni@nvidia.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: thermal/drivers/tegra: Getting rid of the get_thermal_instance()
 usage
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux PM mailing list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi,

does anyone know what is the purpose of the get_thermal_instance() usage 
in this code:

https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/thermal/tegra/soctherm.c?h=thermal/linux-next#n623

The driver is using a function which is reserved for the thermal core. 
It should not.

Is the following change ok ?

diff --git a/drivers/thermal/tegra/soctherm.c 
b/drivers/thermal/tegra/soctherm.c
index 220873298d77..5f552402d987 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -620,9 +620,8 @@ static int tegra_thermctl_set_trip_temp(struct 
thermal_zone_device *tz, int trip
  				continue;

  			cdev = ts->throt_cfgs[i].cdev;
-			if (get_thermal_instance(tz, cdev, trip_id))
-				stc = find_throttle_cfg_by_name(ts, cdev->type);
-			else
+			stc = find_throttle_cfg_by_name(ts, cdev->type);
+			if (!stc)
  				continue;

  			return throttrip_program(dev, sg, stc, temp);
@@ -768,9 +767,9 @@ static int tegra_soctherm_set_hwtrips(struct device 
*dev,
  			continue;

  		cdev = ts->throt_cfgs[i].cdev;
-		if (get_thermal_instance(tz, cdev, trip))
-			stc = find_throttle_cfg_by_name(ts, cdev->type);
-		else
+
+		stc = find_throttle_cfg_by_name(ts, cdev->type);
+		if (!stc)
  			continue;

  		ret = throttrip_program(dev, sg, stc, temperature);


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
