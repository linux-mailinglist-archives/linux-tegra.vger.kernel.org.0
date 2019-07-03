Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3A75DDF6
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jul 2019 08:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfGCGRv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jul 2019 02:17:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40977 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbfGCGRu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jul 2019 02:17:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so1245438wrm.8
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jul 2019 23:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+b+ZNE8muQpXOkikX4gDxD4noa9WUcqsJTLAj8ORuJM=;
        b=JKwTiDBL2F+xPIXodfp3SDz4pvAQOhkw28XjDRRIIYEZDf0uHXJ1kaleuATAaqGLSj
         /lUVb0laNogltshs0CJYJM/yRK5yRpb7G7aiJv4OhPU4LA7450Dc2/qnaeiyRbXcW6sU
         nm0PusQqZCpWiHtb9fRFRri5N45uAQ3MzhWMu9l+CFg/k5JUiRkPVLg+Nqw8/WwRE2A8
         lGEnGR1X1u/hGIzOEXy2X1Ud6SvgllAo5AV9pnp0rHC2lFF7dZez2Of7YCaciwEvGILQ
         iI+ghMdv9+1ejKc7ydDrAXaUhi/ErjFpwMBtxxQXrETNf0ebq/cu896eshbhURPsvkcR
         gcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+b+ZNE8muQpXOkikX4gDxD4noa9WUcqsJTLAj8ORuJM=;
        b=mJ6PB2asq+xRhSqEAVLhoNJF40UJd1ypBn6GVs1k2P88+VKsmSY8yV7cnpTgnMdlia
         aGCq/YFF0EdRFRgn0Izhp1tm/TG6cDak9HzNATcREwDmqr2QNAVqSjwcLN0TJxC3vSuR
         AXtA3mD7wxUTFnVREDAqJxQE9YAReDzcvYn7O54zhPtNhn0aX+zSbtUoOpJqHhxKKDSS
         CT0uHl75hJ1MMIatpgKjzk4k+GUv4xJA2K6WkAWnlcCoclB7gFpAjomiK3R3FjlLAdxo
         1AKZUC/h0TGCsedyIPfIC4VVZ3r7KM0FQGfhYgeZQCcyetK1fq4+IkzLIS0waHqtt6gz
         WLdw==
X-Gm-Message-State: APjAAAVCeNoWd3OkbTurcLhf7pkQ/QdvCdqcUP8zqibpsRkYj8hh0zkx
        +DW3AMm6Hw37E2rObANMF6sWAA==
X-Google-Smtp-Source: APXvYqz+4yF7FL0ZwdGQ6A6cFS0uz4zTCMWbnntXpvljfOHA2f6i0BKfL5+UQZ2+UhOOhD69RM5yiA==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr28538311wrs.152.1562134669005;
        Tue, 02 Jul 2019 23:17:49 -0700 (PDT)
Received: from dell ([2.27.35.164])
        by smtp.gmail.com with ESMTPSA id c1sm1572121wrh.1.2019.07.02.23.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 23:17:48 -0700 (PDT)
Date:   Wed, 3 Jul 2019 07:17:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>,
        Richard Fontana <rfontana@redhat.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Brian Masney <masneyb@onstation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-input <linux-input@vger.kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Hoff <christian_hoff@gmx.net>,
        Enrico Weigelt <info@metux.net>,
        Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 2/4] input: keyboard/mouse/touchscreen/misc: Use
 dev_get_drvdata()
Message-ID: <20190703061746.GI4652@dell>
References: <20190701032342.25971-1-huangfq.daxian@gmail.com>
 <20190701075255.GD172968@dtor-ws>
 <CABXRUiSO2Fos1V3hR5t3AviZ9Hit_y+E-Tp3PNOQj6-FKUBJBw@mail.gmail.com>
 <CAHp75VeUo2Au66tETo3zneBpeaVU+Y+-h5zghpo+hPuB=a6-eA@mail.gmail.com>
 <CABXRUiQ77feNzEdQ7GqNxLS9YAMybVG3eAWWSDPFdGvERaxCyg@mail.gmail.com>
 <20190702143225.12b0fe07@karo-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190702143225.12b0fe07@karo-electronics.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 02 Jul 2019, Lothar Waßmann wrote:

> Hi,
> 
> On Tue, 2 Jul 2019 19:47:16 +0800 Fuqian Huang wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> 於 2019年7月2日週二 下午5:51寫道：
> > >
> > > On Tue, Jul 2, 2019 at 11:20 AM Fuqian Huang <huangfq.daxian@gmail.com> wrote:  
> > > >
> > > > I am not an expert on this. I just write a coccinelle script to search
> > > > this kind of misuse and fix it in a naive way.
> > > > Could you tell me about how to use the proper bus accessors? Then I
> > > > will fix it up and resend a v2 patch set.  
> > >
> > > First, don't top post.
> > > And answering to this, simple drop the patch.
> > > Proper bus accessors is exactly what it's used in the current code.  
> > 
> > But why not use dev_get_drvdata directly.
> > It simplifies getting the 'driver_data' from 'struct device' directly.
> > And the platform_device here is not required.
> > Replace it can remove the unnecessary step back and forth. (dev -> pdev -> dev).
> > 
> Did you check whether the compiler generates different (better) code
> with and without your patch? My guess is it won't.

I can see Fuqian's point.  If bus APIs are preferred, maybe it would
be nicer if the function was adapted to accept a platform_device
instead?

Caveat: I haven't taken the time to look into the call-site details.
	This comment is based on just the patch alone.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
