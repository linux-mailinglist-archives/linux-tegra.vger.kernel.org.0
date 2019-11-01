Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B74EC949
	for <lists+linux-tegra@lfdr.de>; Fri,  1 Nov 2019 20:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfKAT4y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 1 Nov 2019 15:56:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42929 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfKAT4y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Nov 2019 15:56:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id z12so8048274lfj.9
        for <linux-tegra@vger.kernel.org>; Fri, 01 Nov 2019 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c/1S4MjpEhaUuRWidZvrk8sA+V6O3n+vHUEiQqgBvHs=;
        b=ug+iO7yqyKaWcnieuyakmRdXAPkgrkmmgl3DoK8D/2eH+0xMVEiDYjw8ghnAlhSzqc
         eg7F+I7eitL18a/sgHjNH9YUP/lfN2tXxPErfFd2pQeR9gR8eLJgMvdb5frn4+q2WpQd
         bPMVgaDVbvAO1E+9bJaj+JKqr/gbLjEYp4rEPG3v2C60sYHtU3F2IcGrtAadlacbz4a6
         /WzZWVPN38KkBmZniMxZhWuMUu5QxDpLHEAmenZlEmmZTVpMTyJfoDpf6nvQHayWHqti
         o71HA0yJMzBPYOIR045t1+m2ipt8BaKOt/hEzLbAhfEpEzvHoirS2G5YuwBAOxkwEwbB
         RywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/1S4MjpEhaUuRWidZvrk8sA+V6O3n+vHUEiQqgBvHs=;
        b=qR+iIWMywjaHWIEGKrqDnVCBjZz2MSAp7Pba+6I3Z5bdtgQpoX5A6CcJ9Zn7wIbNff
         N9xF4CM+kP0uG1vho0zC58qKKcvGuXqPpAySaHjBrQL01TqWp786twAr46JYdhyqyVl1
         LTt9qU3GxhSimUlh/giizLtnLRa74l2T4FFEho4HVF2A2j0njNQO5OydW04FqaeA+Cwg
         HupJrwQ+naZq126HyX8rKo3ItUquPj59aowsbphaZ5FfbKN+aQcbptijUC+BGKnGN+Zq
         j56fPxFOO5IGEOwq9wvBexQOFGsY1SradWg7II/phpann/d/TSeU7uIjPbtKYI5AEIq0
         t9Dw==
X-Gm-Message-State: APjAAAU4TK/bJnRWI8zWrp/7unPW7zvvqzyBf8q6wcLCbOGrWRNswXk7
        5wwfKIm1ZTQtIMiieTltlx3W3udq
X-Google-Smtp-Source: APXvYqy45E8bR8suQhnp6ZWkspc0hY7Yf8U+GIvnp1VJkbRwVGZpixX/8cMST0VjJ1z3ET1+xG9kNw==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr8571629lfa.10.1572638210165;
        Fri, 01 Nov 2019 12:56:50 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id y11sm2677497ljn.94.2019.11.01.12.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 12:56:49 -0700 (PDT)
Subject: Re: [RFC 1/3] memory: Introduce memory controller mini-framework
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
 <20191015162945.1203736-2-thierry.reding@gmail.com>
 <0888ea6f-2092-001e-5663-3a1d3f305ba4@gmail.com>
 <20191101101804.GD1167505@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b9736f34-53cd-4261-6a8c-4b6ab4d21eeb@gmail.com>
Date:   Fri, 1 Nov 2019 22:56:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191101101804.GD1167505@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.11.2019 13:18, Thierry Reding пишет:
> On Thu, Oct 31, 2019 at 06:11:33PM +0300, Dmitry Osipenko wrote:
>> 15.10.2019 19:29, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> This new framework is currently nothing more than a registry of memory
>>> controllers, with the goal being to order device probing. One use-case
>>> where this is useful, for example, is a memory controller device which
>>> needs to program some registers before the system MMU can be enabled.
>>> Associating the memory controller with the SMMU allows the SMMU driver
>>> to defer the probe until the memory controller has been registered.
>>>
>>> One such example is Tegra186 where the memory controller contains some
>>> registers that are used to program stream IDs for the various memory
>>> clients (display, USB, PCI, ...) in the system. Programming these SIDs
>>> is required for the memory clients to emit the proper SIDs as part of
>>> their memory requests. The memory controller driver therefore needs to
>>> be programmed prior to the SMMU driver. To achieve that, the memory
>>> controller will be referenced via phandle from the SMMU device tree
>>> node, the SMMU driver can then use the memory controller framework to
>>> find it and defer probe until it has been registered.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/memory/Makefile           |  1 +
>>>  drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
>>>  include/linux/memory-controller.h | 25 ++++++++
>>>  3 files changed, 125 insertions(+)
>>>  create mode 100644 drivers/memory/core.c
>>>  create mode 100644 include/linux/memory-controller.h
>>
>> Hello Thierry,
>>
>> This looks like a very good endeavour! I have couple comments, please
>> see them below.
>>
>>> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
>>> index 27b493435e61..d16e7dca8ef9 100644
>>> --- a/drivers/memory/Makefile
>>> +++ b/drivers/memory/Makefile
>>> @@ -3,6 +3,7 @@
>>>  # Makefile for memory devices
>>>  #
>>>  
>>> +obj-y				+= core.o
>>>  obj-$(CONFIG_DDR)		+= jedec_ddr_data.o
>>>  ifeq ($(CONFIG_DDR),y)
>>>  obj-$(CONFIG_OF)		+= of_memory.o
>>> diff --git a/drivers/memory/core.c b/drivers/memory/core.c
>>> new file mode 100644
>>> index 000000000000..1772e839305a
>>> --- /dev/null
>>> +++ b/drivers/memory/core.c
>>> @@ -0,0 +1,99 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2019 NVIDIA Corporation.
>>> + */
>>> +
>>> +#include <linux/memory-controller.h>
>>> +#include <linux/of.h>
>>> +
>>> +static DEFINE_MUTEX(controllers_lock);
>>> +static LIST_HEAD(controllers);
>>> +
>>> +static void memory_controller_release(struct kref *ref)
>>> +{
>>> +	struct memory_controller *mc = container_of(ref, struct memory_controller, ref);
>>> +
>>> +	WARN_ON(!list_empty(&mc->list));
>>> +}
>>> +
>>> +int memory_controller_register(struct memory_controller *mc)
>>> +{
>>> +	kref_init(&mc->ref);
>>> +
>>> +	mutex_lock(&controllers_lock);
>>> +	list_add_tail(&mc->list, &controllers);
>>> +	mutex_unlock(&controllers_lock);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(memory_controller_register);
>>> +
>>> +void memory_controller_unregister(struct memory_controller *mc)
>>> +{
>>> +	mutex_lock(&controllers_lock);
>>> +	list_del_init(&mc->list);
>>> +	mutex_unlock(&controllers_lock);
>>> +
>>> +	kref_put(&mc->ref, memory_controller_release);
>>> +}
>>> +EXPORT_SYMBOL_GPL(memory_controller_unregister);
>>> +
>>> +static struct memory_controller *
>>> +of_memory_controller_get(struct device *dev, struct device_node *np,
>>> +			 const char *con_id)
>>> +{
>>> +	const char *cells = "#memory-controller-cells";
>>> +	const char *names = "memory-controller-names";
>>> +	const char *prop = "memory-controllers";
>>> +	struct memory_controller *mc;
>>> +	struct of_phandle_args args;
>>> +	int index = 0, err;
>>> +
>>> +	if (con_id) {
>>> +		index = of_property_match_string(np, names, con_id);
>>> +		if (index < 0)
>>> +			return ERR_PTR(index);
>>> +	}
>>> +
>>> +	err = of_parse_phandle_with_args(np, prop, cells, index, &args);
>>> +	if (err) {
>>> +		if (err == -ENOENT)
>>> +			err = -ENODEV;
>>> +
>>> +		return ERR_PTR(err);
>>> +	}
>>> +
>>> +	mutex_lock(&controllers_lock);
>>> +
>>> +	list_for_each_entry(mc, &controllers, list) {
>>> +		if (mc->dev && mc->dev->of_node == args.np) {
>>> +			kref_get(&mc->ref);
>>
>> This is not enough because memory controller driver could be a loadable
>> module, thus something like this is needed here:
>>
>> 	__module_get(mc->dev->driver->owner);
>>
>> This won't allow MC driver to be unloaded while it has active users.
> 
> Good catch. I've added that (and the module_put() from below) to the
> patch.
> 
>>> +			mutex_unlock(&controllers_lock);
>>> +			goto unlock;
>>> +		}
>>> +	}
>>> +
>>> +	mc = ERR_PTR(-EPROBE_DEFER);
>>> +
>>> +unlock:
>>> +	mutex_unlock(&controllers_lock);
>>> +	of_node_put(args.np);
>>> +	return mc;
>>> +}
>>> +
>>> +struct memory_controller *
>>> +memory_controller_get(struct device *dev, const char *con_id)
>>> +{
>>> +	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
>>> +		return of_memory_controller_get(dev, dev->of_node, con_id);
>>> +
>>> +	return ERR_PTR(-ENODEV);
>>> +}
>>> +EXPORT_SYMBOL_GPL(memory_controller_get);
>>
>> In most cases memory controllers are unique in a system, so it looks to
>> me that it will be more universal to have ability to get MC by its
>> device-tree compatible name. Like this:
>>
>> 	of_memory_controller_get_by_compatible(const char *compatible);
>>
>> This will allow current drivers (like Tegra20 devfreq driver for
>> example) to utilize this new API without having trouble of maintaining
>> backwards compatibility with older device-trees that do not have a
>> phandle to MC.
>>
>> https://elixir.bootlin.com/linux/v5.4-rc5/source/drivers/devfreq/tegra20-devfreq.c#L100
>>
>> Of course there could be cases where there are multiple controllers with
>> the same compatible, but that case could be supported later on by those
>> who really need it. I don't think that any of NVIDIA Tegra SoCs fall
>> into that category.
> 
> This has the slight disadvantage that we would have to iterate over a
> number of compatible strings in case we want to transparently support
> more than a single version of the memory controller.

Good point.

> An alternative, which is used by a number of other resource registry
> APIs, would be to work with lookup tables. Basically those would make
> a mapping between a provider and a device/consumer pair. The result
> would look something like this:
> 
> 	struct memory_controller_lookup {
> 		const char *provider;
> 		const char *dev_id;
> 		const char *con_id;
> 	};
> 
> 	static const struct memory_controller_lookup *tegra124_mc_lookup[] = {
> 		{ "70019000.memory-controller", "6000c800.actmon", NULL },
> 	};
> 
> memory_controller_get() could then use that as a last-resort to find a
> reference to a memory controller if a device tree phandle isn't
> available.

The explicit lookup table sounds like a good idea because it should be
usable in a case of a non-OF devices as well.

> On the other hand it should be fairly easy to conditionalize all the
> code based purely on the availability of a phandle:
> 
> 	mc = memory_controller_get(dev, NULL);
> 	if (IS_ERR(mc)) {
> 		if (mc != ERR_PTR(-ENODEV))
> 			return PTR_ERR(mc);
> 
> 		mc = NULL;
> 	}
> 
> 	...
> 
> 	if (mc) {
> 		...
> 	}
> 
> The above could be simplified by wrapping the logic in a helper that can
> be used if consumers can work without: memory_controller_get_optional().

Optional retrieval helpers are a common thing among subsystem APIs.
Although it probably shouldn't be necessary for the start of the MC API
and could be added later on, once there will be a real need in it.
AFAIK, none of the Tegra drivers have such a need right now.
