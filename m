Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2104A691FA5
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Feb 2023 14:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjBJNRK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Feb 2023 08:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjBJNRJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Feb 2023 08:17:09 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA7E57761
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 05:17:07 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so5605664wms.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Feb 2023 05:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tXU/U+0NbqGnMtrpnVNZ+Tlb6Bo7WAgqsB5bjiLYgzM=;
        b=pI9c57AN+45GJ6vxUiLNdsVSudpz/rqnqRrU/Y7FMoxYbx3tlbQAHpi2JlJf89Vn90
         RN/tNRPk38zLWWtM1CbXLe08qiTluDrGyE6X6bEVplEDION64e+a1OBHx7Mum8cVc3PB
         WBUFsrZODYjcz+1Ndd6ouE1e7rXPfNA7wAavsbRUXKKbPnP5TWvC0AKkUJHD/uziRRhd
         /cOuLFjNy/rFmaMMdNN0hLffRTTDtUsyesTirkp445R+3NxDI71yv1lZtn0j6sDTwIaL
         GAmGf7OAgf3vuAQb3b/rqRyGL1OZvGFWgrALAOpv+ntEVawlPp8Dcto1jRno8jSSOUGn
         7m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXU/U+0NbqGnMtrpnVNZ+Tlb6Bo7WAgqsB5bjiLYgzM=;
        b=ktLGTvMsFYztCLg/IEr97gzAJLs4sWwhhm6dFtGib5Y56OS2KX8dOpXnQwwEmqtEfQ
         HV8Z7IzmZpUvSl2JfyVhXGDdQeXFpZeG/gCWbSH+F7i3uI4RX3U3cHiikNgv2hyRvqMm
         CqxbPuroT5nBa2j85dCx3LsqmrPNwCJeB6REVd3FPNWQq/I5ast1fwqvFo0RPiAh3QZG
         8ILA658tihvA2Ye2jpv9qC7PS0e8BlH5XltGN0XocjY2XUk6mk2LFTxta+WVTviVKwY9
         pEjmzwydJe6KolDv7KJDAlyEyXjT1d3h721vWRUeeDf+q24iaAJzvTxIbzjytYlOa5d6
         ePVg==
X-Gm-Message-State: AO0yUKVIJn8QlFGrPaFDg9FSABbtNX85sjPi8MDJzModkf/aMJBpvQ8D
        aihSuLfCzO+xCp6XWz0olxMTnQ==
X-Google-Smtp-Source: AK7set/GYY5H9HdCYGUrog6I7mpTHpeDJBJcrBwvptJntx7ysPDg3AkRikIpQjg/pi49ULxIKFX1lQ==
X-Received: by 2002:a05:600c:1714:b0:3df:dc29:d69 with SMTP id c20-20020a05600c171400b003dfdc290d69mr12266192wmn.36.1676035026337;
        Fri, 10 Feb 2023 05:17:06 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c314800b003e11ad0750csm3863632wmo.47.2023.02.10.05.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:17:05 -0800 (PST)
Date:   Fri, 10 Feb 2023 14:17:03 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wei Ni <wni@nvidia.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux PM mailing list <linux-pm@vger.kernel.org>
Subject: Re: thermal/drivers/tegra: Getting rid of the get_thermal_instance()
 usage
Message-ID: <20230210131703.GF175687@linaro.org>
References: <fa2bd92a-f2ae-a671-b537-87c0f3c03dbd@linaro.org>
 <Y9J4WAFyXyV/nqlG@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9J4WAFyXyV/nqlG@orome>
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

Hi Thierry,

On Thu, Jan 26, 2023 at 01:55:52PM +0100, Thierry Reding wrote:
> On Tue, Jan 24, 2023 at 08:57:23PM +0100, Daniel Lezcano wrote:
> > 
> > Hi,
> > 
> > does anyone know what is the purpose of the get_thermal_instance() usage in
> > this code:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/drivers/thermal/tegra/soctherm.c?h=thermal/linux-next#n623
> > 
> > The driver is using a function which is reserved for the thermal core. It
> > should not.
> > 
> > Is the following change ok ?
> > 
> > diff --git a/drivers/thermal/tegra/soctherm.c
> > b/drivers/thermal/tegra/soctherm.c
> > index 220873298d77..5f552402d987 100644
> > --- a/drivers/thermal/tegra/soctherm.c
> > +++ b/drivers/thermal/tegra/soctherm.c
> > @@ -620,9 +620,8 @@ static int tegra_thermctl_set_trip_temp(struct
> > thermal_zone_device *tz, int trip
> >  				continue;
> > 
> >  			cdev = ts->throt_cfgs[i].cdev;
> > -			if (get_thermal_instance(tz, cdev, trip_id))
> > -				stc = find_throttle_cfg_by_name(ts, cdev->type);
> > -			else
> > +			stc = find_throttle_cfg_by_name(ts, cdev->type);
> > +			if (!stc)
> >  				continue;
> > 
> >  			return throttrip_program(dev, sg, stc, temp);
> > @@ -768,9 +767,9 @@ static int tegra_soctherm_set_hwtrips(struct device
> > *dev,
> >  			continue;
> > 
> >  		cdev = ts->throt_cfgs[i].cdev;
> > -		if (get_thermal_instance(tz, cdev, trip))
> > -			stc = find_throttle_cfg_by_name(ts, cdev->type);
> > -		else
> > +
> > +		stc = find_throttle_cfg_by_name(ts, cdev->type);
> > +		if (!stc)
> >  			continue;
> > 
> >  		ret = throttrip_program(dev, sg, stc, temperature);
> 
> There's a small difference in behavior after applying this patch. Prior
> to this I get (on Tegra210):
> 
> 	[   12.354091] tegra_soctherm 700e2000.thermal-sensor: missing thermtrips, will use critical trips as shut down temp
> 	[   12.379009] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when cpu reaches 102500 mC
> 	[   12.388882] tegra_soctherm 700e2000.thermal-sensor: programming throttle for cpu to 102500
> 	[   12.401007] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when cpu reaches 102500 mC
> 	[   12.471041] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when gpu reaches 103000 mC
> 	[   12.482852] tegra_soctherm 700e2000.thermal-sensor: programming throttle for gpu to 103000
> 	[   12.482860] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when gpu reaches 103000 mC
> 	[   12.485357] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when pll reaches 103000 mC
> 	[   12.501774] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when mem reaches 103000 mC
> 
> and after these changes, it turns into:
> 
> 	[   12.447113] tegra_soctherm 700e2000.thermal-sensor: missing thermtrips, will use critical trips as shut down temp
> 	[   12.472300] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when cpu reaches 102500 mC
> 	[   12.481789] tegra_soctherm 700e2000.thermal-sensor: programming throttle for cpu to 102500
> 	[   12.495447] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when cpu reaches 102500 mC
> 	[   12.496514] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when gpu reaches 103000 mC
> 	[   12.510353] tegra_soctherm 700e2000.thermal-sensor: programming throttle for gpu to 103000
> 	[   12.526856] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when gpu reaches 103000 mC
> 	[   12.528774] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when pll reaches 103000 mC
> 	[   12.569352] tegra_soctherm 700e2000.thermal-sensor: programming throttle for pll to 103000
> 	[   12.577635] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when pll reaches 103000 mC
> 	[   12.590952] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut down when mem reaches 103000 mC
> 	[   12.600783] tegra_soctherm 700e2000.thermal-sensor: programming throttle for mem to 103000
> 	[   12.609204] tegra_soctherm 700e2000.thermal-sensor: throttrip: will throttle when mem reaches 103000 mC
> 
> The "programming throttle ..." messages are something I've added locally
> to trace what gets called. So it looks like for "pll" and "mem" thermal
> zones, we now program trip points whereas we previously didn't.

The DT descriptioni (tegra210.dtsi) says one thing and the implementation says
something else.

If we refer to the PLL description, there is one 'hot' trip point and
one 'critical' trip point. No polling delay at all, so we need the
interrupts.

Logically, we should set the 'hot' trip point first, when the trip
point is crossed, we setup the next trip point, which is the critical.

With these two trip points, the first one will send a notification to
the userspace and the second one will force a shutdown of the
system. For both, no cooling device is expected.

Well, actually I don't get the logic of the soctherm driver. It should
just rely on the thermal framework to set the trip point regardless
the cooling devices.

The device tree also is strange. For example, the dram sets
cooling-device = <&emc 0 0>; an inoperative action for a 'nominal'
trip point ... If the goal is to stop the mitigation, that is already
done by the governor when the trip point is crossed the way down. The
second trip point is an 'active' cooling device but it refers to a emc
which is, at the first glance, a passive cooling device.

The gpu description only describes hot and critical trip points. The
cooling device maps to the 'hot' trip point ! The governor is not used
in this case, so the cooling device is inoperative. Same for the cpu
thermal zone.

IOW, the driver is not correctly implemented and the device tree is
wrong. Thermal is not working correctly on these board AFAICT.



-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
