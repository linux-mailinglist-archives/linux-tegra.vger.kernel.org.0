Return-Path: <linux-tegra+bounces-12-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E27F3A8A
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Nov 2023 01:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0270C28284F
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Nov 2023 00:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3C9163;
	Wed, 22 Nov 2023 00:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMRdcuAG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DFDE7;
	Tue, 21 Nov 2023 16:01:30 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41eae4ebf61so36686921cf.2;
        Tue, 21 Nov 2023 16:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700611289; x=1701216089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kE1Uvs4N1rH7utdpskkQ7WkEQho1ScyTsI9oYGFbmLE=;
        b=KMRdcuAGMIhpOl6tf7RJMPCHPKWE8CgVFuhmOWiwopywuIwaTXNCv+KpxRwqghRlHt
         NZmBvjxCOKMyssFs0v9+4h4QSDWEs3KRFL87f6u0CyEKcddwH2IgiN1kTklUmgq1XWF8
         7NI6WTLAZ8Rj1SVA/r4bhVEFtjdBpAqNW3v0CHQuw9Gl/ekutAOWY9/sJJbFNqUlCId4
         jDzPzK/Q/pcsVSO/VR0Uf+uliLa9E4WPUY/10uN4J0hOX0Ofvi+XBt7aS9/YAYldvERG
         Riu+oOF8jnfdjPkKLhNW7HBfyK9+5RW4GG5Txs8vxU8qCI3W6HC2jPYpGhAHWf7uzBHR
         PILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700611289; x=1701216089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE1Uvs4N1rH7utdpskkQ7WkEQho1ScyTsI9oYGFbmLE=;
        b=FYiIoPNyEM7D37PSaIPq/feufkPBAwUc+LGThhnpmj+doWlKp+2cPs9HISHoltvPm7
         wBKMOn7tv/gbwWchxIyvAuIOqsUqCgZObPka8+bjTfGwhF7jXuAfFTx3X2UJbeMxoqj8
         oV6B6fn82pzcK8bb6ysEI1lJQPu68HGEIMKPAgtn08jhZeEhnxrMVSqQm0MD6lqv9Cl/
         46a12ckr4q0oxGFumpcOdU2La/DW3M/l2I1/+6JeSxx0/kcaP0ONYec4EhyZ5Hb6jumR
         H4jBywSKgazdJzInSh2emg5W+im5dSyTjrZzuRM5IyfT/IAqHjv/b9LFqiPj509QSxhn
         RHwg==
X-Gm-Message-State: AOJu0Yx7bRg4gd2D89MALPpFcK/u+vQwa68iPBTZBazK7s1ZZLFKOHN9
	vIiykPQ4qb1jHtkxGtnRYqc=
X-Google-Smtp-Source: AGHT+IFyW2Md2ERf4BtFMklQPxBC6byAg0sD79oY4QZ+sE29NNK3emmqFUx2H8D0VoDcV+6Fm6VrBQ==
X-Received: by 2002:a05:6214:c2b:b0:66d:2491:6e69 with SMTP id a11-20020a0562140c2b00b0066d24916e69mr586131qvd.36.1700611289526;
        Tue, 21 Nov 2023 16:01:29 -0800 (PST)
Received: from localhost ([2607:fea8:529e:7800::80ec])
        by smtp.gmail.com with ESMTPSA id t1-20020a0cef41000000b00679f7657dbdsm18096qvs.99.2023.11.21.16.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 16:01:28 -0800 (PST)
Date: Tue, 21 Nov 2023 19:01:25 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>,
	Robert Foss <rfoss@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/2] fbdev/simplefb: Add support for generic
 power-domains
Message-ID: <ZV1E1aigUFcLceWK@radian>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
 <20231101172017.3872242-3-thierry.reding@gmail.com>
 <ZVwFNfkqjrvhFHM0@radian>
 <60319873-e1f5-43b4-aa22-68a5671d413b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60319873-e1f5-43b4-aa22-68a5671d413b@redhat.com>

On Tue, Nov 21, 2023 at 10:01:18AM +0100, Hans de Goede wrote:
> Hi,
>
> On 11/21/23 02:17, Richard Acayan wrote:
>> Hello,
>> 
>> On Wed, Nov 01, 2023 at 06:20:17PM +0100, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The simple-framebuffer device tree bindings document the power-domains
>>> property, so make sure that simplefb supports it. This ensures that the
>>> power domains remain enabled as long as simplefb is active.
>>>
>>> v2: - remove unnecessary call to simplefb_detach_genpds() since that's
>>>       already done automatically by devres
>>>     - fix crash if power-domains property is missing in DT
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/video/fbdev/simplefb.c | 93 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 93 insertions(+)
>>>
>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>>> index 18025f34fde7..fe682af63827 100644
>>> --- a/drivers/video/fbdev/simplefb.c
>>> +++ b/drivers/video/fbdev/simplefb.c
>>> @@ -25,6 +25,7 @@
>>>  #include <linux/of_clk.h>
>>>  #include <linux/of_platform.h>
>>>  #include <linux/parser.h>
>>> +#include <linux/pm_domain.h>
>>>  #include <linux/regulator/consumer.h>
>>>  
>>>  static const struct fb_fix_screeninfo simplefb_fix = {
>>> @@ -78,6 +79,11 @@ struct simplefb_par {
>>>  	unsigned int clk_count;
>>>  	struct clk **clks;
>>>  #endif
>>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>>> +	unsigned int num_genpds;
>> 
>> This is the cause of the crash that occurred on the older patch series.
>> The field is unsigned, a deviation from v6.6:drivers/remoteproc/imx_rproc.c.
>> 
>> Instead of making it signed, this version emits an error whenever the
>> count is negative.
>
> I'm not sure what you are trying to say here ?

In v1 of the patch, there was no error propagation from of_count_phandle_with_args
and this field was directly assigned to the return value. This was a
problem (the "crash" as mentioned in this patch's changelog) when the
return value is negative, since unsigned integers cannot hold negative
values. On mainstream architectures, the driver would believe that there
is an absurd amount of power domains.

I compared the versions of this patch and figured that the fix to the
crash was more error handling.

Basically, if "unsigned" was removed, the error handling for the call to
of_count_phandle_with_args could be dropped with few consequences.

>>> +	struct device **genpds;
>>> +	struct device_link **genpd_links;
>>> +#endif
>>>  #if defined CONFIG_OF && defined CONFIG_REGULATOR
>>>  	bool regulators_enabled;
>>>  	u32 regulator_count;
>>> @@ -432,6 +438,89 @@ static void simplefb_regulators_enable(struct simplefb_par *par,
>>>  static void simplefb_regulators_destroy(struct simplefb_par *par) { }
>>>  #endif
>>>  
>>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>>> +static void simplefb_detach_genpds(void *res)
>>> +{
>>> +	struct simplefb_par *par = res;
>>> +	unsigned int i = par->num_genpds;
>>> +
>>> +	if (par->num_genpds <= 1)
>>> +		return;
>>> +
>>> +	while (i--) {
>>> +		if (par->genpd_links[i])
>>> +			device_link_del(par->genpd_links[i]);
>>> +
>>> +		if (!IS_ERR_OR_NULL(par->genpds[i]))
>>> +			dev_pm_domain_detach(par->genpds[i], true);
>>> +	}
>>> +}
>>> +
>>> +static int simplefb_attach_genpds(struct simplefb_par *par,
>>> +				  struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	unsigned int i;
>>> +	int err;
>>> +
>>> +	err = of_count_phandle_with_args(dev->of_node, "power-domains",
>>> +					 "#power-domain-cells");
>>> +	if (err < 0) {
>>> +		dev_info(dev, "failed to parse power-domains: %d\n", err);
>>> +		return err;
>> 
>> This error path is taken when there is no power-domains property in the
>> device tree with err = -ENOENT.
>> 
>> Strangely, this does not suppress the error like the next if statement,
>> even though it is possible that nothing is wrong.
>> 
>>> +	}
>>> +
>>> +	par->num_genpds = err;
>>> +
>>> +	/*
>>> +	 * Single power-domain devices are handled by the driver core, so
>>> +	 * nothing to do here.
>>> +	 */
>>> +	if (par->num_genpds <= 1)
>>> +		return 0;
>>> +
>>> +	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
>>> +				   GFP_KERNEL);
>> <snip>
>>> @@ -518,6 +607,10 @@ static int simplefb_probe(struct platform_device *pdev)
>>>  	if (ret < 0)
>>>  		goto error_clocks;
>>>  
>>> +	ret = simplefb_attach_genpds(par, pdev);
>>> +	if (ret < 0)
>>> +		goto error_regulators;
>> 
>> With the error case specified above, not specifying power-domains (which
>> is valid according to dtschema) causes the entire driver to fail
>> whenever there are no power domains in the device tree.
>> 
>> On google-sargo, this causes a bug where the framebuffer fails to probe:
>> 
>>     [    0.409290] simple-framebuffer 9c000000.framebuffer: failed to parse power-domains: -2
>>     [    0.409340] simple-framebuffer: probe of 9c000000.framebuffer failed with error -2
>
> Ok so this is a problem, sorry for not catching this during review.
>
> I believe that this should be fixed by changing the code to:
>
> 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
> 					 "#power-domain-cells");
> 	if (err < 0) {
> 		if (err == -ENOENT)
> 			return 0;
>
> 		dev_info(dev, "failed to parse power-domains: %d\n", err);
> 		return err;
> 	}
>
> Can you submit a (tested) patch fixing this? Then I'll push it
> to drm-misc-next right away.

Okay, will do. If my above response changes the preferred fix, let me
know.

Thank you for committing to having this fixed.

> Regards,
>
> Hans

