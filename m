Return-Path: <linux-tegra+bounces-13-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F04267F406A
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Nov 2023 09:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66DD5B20EBC
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Nov 2023 08:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E445A20B01;
	Wed, 22 Nov 2023 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8LTOuFu"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37D4A1
	for <linux-tegra@vger.kernel.org>; Wed, 22 Nov 2023 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700642558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JklgPZMO6OqmeViq25n8y74P+opPCcYmBt1jmDMzJaw=;
	b=a8LTOuFuUOnKgzxKbq6PXhLg+2RU1//ZUL4RAXfplITjg5R/jEtATAtwme1t2+JrlfY4U0
	/jx4qdpnKmOGvnqzpcwebndcVl/bjTKc4NfMCsgM2JDVctEIfJooa+EiF7O7U923wBBP4/
	pmFqIzHtVCAHuAQzChVde01jrpv/CF0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-52CViw7pPXWAVUXigK4OQA-1; Wed, 22 Nov 2023 03:42:37 -0500
X-MC-Unique: 52CViw7pPXWAVUXigK4OQA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-544b5d65a1aso4575551a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Nov 2023 00:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700642556; x=1701247356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JklgPZMO6OqmeViq25n8y74P+opPCcYmBt1jmDMzJaw=;
        b=Uq3xqGddPRpZfHBG+AEDg8qoN6tRinBylJI3q5piQbuABOgp0FHWGjYaQvZxTb/qIZ
         c1vyChV3d329ndIcN+v9sc3crRKml46KwuJz4LWwpfGnE4zWpXQn9j3s+pPm8zZAIAzc
         yB8Dj4hFOISXLd/IWI+whOArKBHdys/3rgiFphWzT+d/pDYsLINXKAqJz8WuZf/aQh3h
         hiFE7OQvc7hFQQ7xFz90wi3k8hHqDxdbogsV/0HuCRCIbAvEgSIpQ6QQqkroXfYMg2uq
         v2esF1MMxNbngsoXk8tVPKKlipZW/AiuYpp8cv/1dGABgggFSiSLAXzD8xkGddCktlSY
         Y6nw==
X-Gm-Message-State: AOJu0Yyw0VkFiNqBwXqo6oTwuLrOQITj0UBiL7dztvYHJ4NSFdlncWuT
	b6MtgzbGeNWZTUHJ9hu2BhrUrfCmkf8poQBwodQz0IrNkwzgbEfpB9+NO78F/YGm6tyoAIw7cgo
	6evTdyj4WickjCFd5Ahgi3SA=
X-Received: by 2002:a50:ee8e:0:b0:532:bf2a:8cbc with SMTP id f14-20020a50ee8e000000b00532bf2a8cbcmr1074594edr.16.1700642556337;
        Wed, 22 Nov 2023 00:42:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxArAdliv8159t4/mg6wNprGb74aZdGoe+N5rfxMIglonZ4sDjt0/8JuUuvDqRR7ldDuvEIg==
X-Received: by 2002:a50:ee8e:0:b0:532:bf2a:8cbc with SMTP id f14-20020a50ee8e000000b00532bf2a8cbcmr1074578edr.16.1700642555975;
        Wed, 22 Nov 2023 00:42:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7db8a000000b00546cf67c348sm5795023edt.59.2023.11.22.00.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:42:35 -0800 (PST)
Message-ID: <3e7a7b77-9104-4141-b8a9-3caca05416dd@redhat.com>
Date: Wed, 22 Nov 2023 09:42:34 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbdev/simplefb: Add support for generic
 power-domains
To: Richard Acayan <mailingradian@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>,
 Robert Foss <rfoss@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
 <20231101172017.3872242-3-thierry.reding@gmail.com> <ZVwFNfkqjrvhFHM0@radian>
 <60319873-e1f5-43b4-aa22-68a5671d413b@redhat.com> <ZV1E1aigUFcLceWK@radian>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZV1E1aigUFcLceWK@radian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/22/23 01:01, Richard Acayan wrote:
> On Tue, Nov 21, 2023 at 10:01:18AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/21/23 02:17, Richard Acayan wrote:
>>> Hello,
>>>
>>> On Wed, Nov 01, 2023 at 06:20:17PM +0100, Thierry Reding wrote:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> The simple-framebuffer device tree bindings document the power-domains
>>>> property, so make sure that simplefb supports it. This ensures that the
>>>> power domains remain enabled as long as simplefb is active.
>>>>
>>>> v2: - remove unnecessary call to simplefb_detach_genpds() since that's
>>>>       already done automatically by devres
>>>>     - fix crash if power-domains property is missing in DT
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>>  drivers/video/fbdev/simplefb.c | 93 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 93 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
>>>> index 18025f34fde7..fe682af63827 100644
>>>> --- a/drivers/video/fbdev/simplefb.c
>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>> @@ -25,6 +25,7 @@
>>>>  #include <linux/of_clk.h>
>>>>  #include <linux/of_platform.h>
>>>>  #include <linux/parser.h>
>>>> +#include <linux/pm_domain.h>
>>>>  #include <linux/regulator/consumer.h>
>>>>  
>>>>  static const struct fb_fix_screeninfo simplefb_fix = {
>>>> @@ -78,6 +79,11 @@ struct simplefb_par {
>>>>  	unsigned int clk_count;
>>>>  	struct clk **clks;
>>>>  #endif
>>>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>>>> +	unsigned int num_genpds;
>>>
>>> This is the cause of the crash that occurred on the older patch series.
>>> The field is unsigned, a deviation from v6.6:drivers/remoteproc/imx_rproc.c.
>>>
>>> Instead of making it signed, this version emits an error whenever the
>>> count is negative.
>>
>> I'm not sure what you are trying to say here ?
> 
> In v1 of the patch, there was no error propagation from of_count_phandle_with_args
> and this field was directly assigned to the return value. This was a
> problem (the "crash" as mentioned in this patch's changelog) when the
> return value is negative, since unsigned integers cannot hold negative
> values. On mainstream architectures, the driver would believe that there
> is an absurd amount of power domains.
> 
> I compared the versions of this patch and figured that the fix to the
> crash was more error handling.
> 
> Basically, if "unsigned" was removed, the error handling for the call to
> of_count_phandle_with_args could be dropped with few consequences.

I see, thank you for explaining.

I believe that actually handling the error is better then storing
a negative value, so I believe that the fix in v2 is correct.

>>>> +	struct device **genpds;
>>>> +	struct device_link **genpd_links;
>>>> +#endif
>>>>  #if defined CONFIG_OF && defined CONFIG_REGULATOR
>>>>  	bool regulators_enabled;
>>>>  	u32 regulator_count;
>>>> @@ -432,6 +438,89 @@ static void simplefb_regulators_enable(struct simplefb_par *par,
>>>>  static void simplefb_regulators_destroy(struct simplefb_par *par) { }
>>>>  #endif
>>>>  
>>>> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
>>>> +static void simplefb_detach_genpds(void *res)
>>>> +{
>>>> +	struct simplefb_par *par = res;
>>>> +	unsigned int i = par->num_genpds;
>>>> +
>>>> +	if (par->num_genpds <= 1)
>>>> +		return;
>>>> +
>>>> +	while (i--) {
>>>> +		if (par->genpd_links[i])
>>>> +			device_link_del(par->genpd_links[i]);
>>>> +
>>>> +		if (!IS_ERR_OR_NULL(par->genpds[i]))
>>>> +			dev_pm_domain_detach(par->genpds[i], true);
>>>> +	}
>>>> +}
>>>> +
>>>> +static int simplefb_attach_genpds(struct simplefb_par *par,
>>>> +				  struct platform_device *pdev)
>>>> +{
>>>> +	struct device *dev = &pdev->dev;
>>>> +	unsigned int i;
>>>> +	int err;
>>>> +
>>>> +	err = of_count_phandle_with_args(dev->of_node, "power-domains",
>>>> +					 "#power-domain-cells");
>>>> +	if (err < 0) {
>>>> +		dev_info(dev, "failed to parse power-domains: %d\n", err);
>>>> +		return err;
>>>
>>> This error path is taken when there is no power-domains property in the
>>> device tree with err = -ENOENT.
>>>
>>> Strangely, this does not suppress the error like the next if statement,
>>> even though it is possible that nothing is wrong.
>>>
>>>> +	}
>>>> +
>>>> +	par->num_genpds = err;
>>>> +
>>>> +	/*
>>>> +	 * Single power-domain devices are handled by the driver core, so
>>>> +	 * nothing to do here.
>>>> +	 */
>>>> +	if (par->num_genpds <= 1)
>>>> +		return 0;
>>>> +
>>>> +	par->genpds = devm_kcalloc(dev, par->num_genpds, sizeof(*par->genpds),
>>>> +				   GFP_KERNEL);
>>> <snip>
>>>> @@ -518,6 +607,10 @@ static int simplefb_probe(struct platform_device *pdev)
>>>>  	if (ret < 0)
>>>>  		goto error_clocks;
>>>>  
>>>> +	ret = simplefb_attach_genpds(par, pdev);
>>>> +	if (ret < 0)
>>>> +		goto error_regulators;
>>>
>>> With the error case specified above, not specifying power-domains (which
>>> is valid according to dtschema) causes the entire driver to fail
>>> whenever there are no power domains in the device tree.
>>>
>>> On google-sargo, this causes a bug where the framebuffer fails to probe:
>>>
>>>     [    0.409290] simple-framebuffer 9c000000.framebuffer: failed to parse power-domains: -2
>>>     [    0.409340] simple-framebuffer: probe of 9c000000.framebuffer failed with error -2
>>
>> Ok so this is a problem, sorry for not catching this during review.
>>
>> I believe that this should be fixed by changing the code to:
>>
>> 	err = of_count_phandle_with_args(dev->of_node, "power-domains",
>> 					 "#power-domain-cells");
>> 	if (err < 0) {
>> 		if (err == -ENOENT)
>> 			return 0;
>>
>> 		dev_info(dev, "failed to parse power-domains: %d\n", err);
>> 		return err;
>> 	}
>>
>> Can you submit a (tested) patch fixing this? Then I'll push it
>> to drm-misc-next right away.
> 
> Okay, will do. If my above response changes the preferred fix, let me
> know.

Please move ahead with the proposed fixed, thank you.

> Thank you for committing to having this fixed.

You're welcome.

Regards,

Hans




