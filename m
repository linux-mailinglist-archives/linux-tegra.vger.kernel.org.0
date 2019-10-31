Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD1AEB380
	for <lists+linux-tegra@lfdr.de>; Thu, 31 Oct 2019 16:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfJaPLi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 31 Oct 2019 11:11:38 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33786 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJaPLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 31 Oct 2019 11:11:38 -0400
Received: by mail-lj1-f193.google.com with SMTP id t5so7065620ljk.0
        for <linux-tegra@vger.kernel.org>; Thu, 31 Oct 2019 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r0+SnsUBrU036ki/u9zXA8lU9FLF8N+QpK3TWylHn0Q=;
        b=fyHdS+HJpockD668OHkgA5XWU4kJhvi09lJzp4Lmn0gj9ww3frs6YizoKFUG7/q5s5
         yCrf77w2f2Ec/Lo7RSZMahCH6aELWJtf4xNXgGs5rRalLGmPCqVcD0mCbNvXySSIYMxN
         dMvNxsvKV7KADWYduV6qnMSa/odUQs+3F0X55hIhYsCjmBkgGDjEGaAfngTyF6vbcDWT
         C+AIMTh06LTnoNKZiH35xAx19YZVscI+ujNzkM7GmRwg/Txss7fn5kMaTgyxzeSwUEvi
         1Xu/0Ot2YJI5sYZcAClB8Rz0WngryEDvOitG+TQfccG/GDx/5eAod7YMO+ew0PW7U06l
         Nvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r0+SnsUBrU036ki/u9zXA8lU9FLF8N+QpK3TWylHn0Q=;
        b=Ni2Z1mOH7kthvgNCu/EAoHmVROElHeKQp1U8XDcOicUgJFXY3VK8fd89G5Lm1w0evz
         zs+3OOp5iJ3gZQ5oMBeYHa1gTeI2k4x83Sj2QDfUFCUvEDVCqPwHlfq2MqfQ6cClzG1/
         1RlYKyVzy81jwi+tq+PgsptPd3QJ2CFIzhLjZYpnPTR1kTEnfbfvP0S5YVox2ZGwzwSc
         cpaEAhyl5jF62caGPH9NXz5i+HPSGJOz+76iRT92KDeEfDhmPmMPH01h5fbBLoZyzaHy
         FdYRO9M8D9X8trAe6syCE20jlSuSs/FrU3y2M8taA0brNP2eBtLeBLkfa8QoalxbL+1s
         M13Q==
X-Gm-Message-State: APjAAAXUfb7QfkFRMCfMVBDolCwknjMgPeIv6pt0hKl4h5ayybTASME8
        Dgwpj5rWFZq1DcbNBJ7d005Dv4Nz
X-Google-Smtp-Source: APXvYqxfCFOTJwk0Wgd+b3I7BxOouq4x08OssycSq7/WciF8tOieiyeyL8dP8lEXb05tn7e5zQXg/g==
X-Received: by 2002:a2e:3016:: with SMTP id w22mr4636537ljw.117.1572534695491;
        Thu, 31 Oct 2019 08:11:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id 12sm1323631lju.55.2019.10.31.08.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2019 08:11:34 -0700 (PDT)
Subject: Re: [RFC 1/3] memory: Introduce memory controller mini-framework
To:     Thierry Reding <thierry.reding@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
 <20191015162945.1203736-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0888ea6f-2092-001e-5663-3a1d3f305ba4@gmail.com>
Date:   Thu, 31 Oct 2019 18:11:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015162945.1203736-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.10.2019 19:29, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> This new framework is currently nothing more than a registry of memory
> controllers, with the goal being to order device probing. One use-case
> where this is useful, for example, is a memory controller device which
> needs to program some registers before the system MMU can be enabled.
> Associating the memory controller with the SMMU allows the SMMU driver
> to defer the probe until the memory controller has been registered.
> 
> One such example is Tegra186 where the memory controller contains some
> registers that are used to program stream IDs for the various memory
> clients (display, USB, PCI, ...) in the system. Programming these SIDs
> is required for the memory clients to emit the proper SIDs as part of
> their memory requests. The memory controller driver therefore needs to
> be programmed prior to the SMMU driver. To achieve that, the memory
> controller will be referenced via phandle from the SMMU device tree
> node, the SMMU driver can then use the memory controller framework to
> find it and defer probe until it has been registered.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/Makefile           |  1 +
>  drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
>  include/linux/memory-controller.h | 25 ++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 drivers/memory/core.c
>  create mode 100644 include/linux/memory-controller.h

Hello Thierry,

This looks like a very good endeavour! I have couple comments, please
see them below.

> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index 27b493435e61..d16e7dca8ef9 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -3,6 +3,7 @@
>  # Makefile for memory devices
>  #
>  
> +obj-y				+= core.o
>  obj-$(CONFIG_DDR)		+= jedec_ddr_data.o
>  ifeq ($(CONFIG_DDR),y)
>  obj-$(CONFIG_OF)		+= of_memory.o
> diff --git a/drivers/memory/core.c b/drivers/memory/core.c
> new file mode 100644
> index 000000000000..1772e839305a
> --- /dev/null
> +++ b/drivers/memory/core.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 NVIDIA Corporation.
> + */
> +
> +#include <linux/memory-controller.h>
> +#include <linux/of.h>
> +
> +static DEFINE_MUTEX(controllers_lock);
> +static LIST_HEAD(controllers);
> +
> +static void memory_controller_release(struct kref *ref)
> +{
> +	struct memory_controller *mc = container_of(ref, struct memory_controller, ref);
> +
> +	WARN_ON(!list_empty(&mc->list));
> +}
> +
> +int memory_controller_register(struct memory_controller *mc)
> +{
> +	kref_init(&mc->ref);
> +
> +	mutex_lock(&controllers_lock);
> +	list_add_tail(&mc->list, &controllers);
> +	mutex_unlock(&controllers_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(memory_controller_register);
> +
> +void memory_controller_unregister(struct memory_controller *mc)
> +{
> +	mutex_lock(&controllers_lock);
> +	list_del_init(&mc->list);
> +	mutex_unlock(&controllers_lock);
> +
> +	kref_put(&mc->ref, memory_controller_release);
> +}
> +EXPORT_SYMBOL_GPL(memory_controller_unregister);
> +
> +static struct memory_controller *
> +of_memory_controller_get(struct device *dev, struct device_node *np,
> +			 const char *con_id)
> +{
> +	const char *cells = "#memory-controller-cells";
> +	const char *names = "memory-controller-names";
> +	const char *prop = "memory-controllers";
> +	struct memory_controller *mc;
> +	struct of_phandle_args args;
> +	int index = 0, err;
> +
> +	if (con_id) {
> +		index = of_property_match_string(np, names, con_id);
> +		if (index < 0)
> +			return ERR_PTR(index);
> +	}
> +
> +	err = of_parse_phandle_with_args(np, prop, cells, index, &args);
> +	if (err) {
> +		if (err == -ENOENT)
> +			err = -ENODEV;
> +
> +		return ERR_PTR(err);
> +	}
> +
> +	mutex_lock(&controllers_lock);
> +
> +	list_for_each_entry(mc, &controllers, list) {
> +		if (mc->dev && mc->dev->of_node == args.np) {
> +			kref_get(&mc->ref);

This is not enough because memory controller driver could be a loadable
module, thus something like this is needed here:

	__module_get(mc->dev->driver->owner);

This won't allow MC driver to be unloaded while it has active users.

> +			mutex_unlock(&controllers_lock);
> +			goto unlock;
> +		}
> +	}
> +
> +	mc = ERR_PTR(-EPROBE_DEFER);
> +
> +unlock:
> +	mutex_unlock(&controllers_lock);
> +	of_node_put(args.np);
> +	return mc;
> +}
> +
> +struct memory_controller *
> +memory_controller_get(struct device *dev, const char *con_id)
> +{
> +	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
> +		return of_memory_controller_get(dev, dev->of_node, con_id);
> +
> +	return ERR_PTR(-ENODEV);
> +}
> +EXPORT_SYMBOL_GPL(memory_controller_get);

In most cases memory controllers are unique in a system, so it looks to
me that it will be more universal to have ability to get MC by its
device-tree compatible name. Like this:

	of_memory_controller_get_by_compatible(const char *compatible);

This will allow current drivers (like Tegra20 devfreq driver for
example) to utilize this new API without having trouble of maintaining
backwards compatibility with older device-trees that do not have a
phandle to MC.

https://elixir.bootlin.com/linux/v5.4-rc5/source/drivers/devfreq/tegra20-devfreq.c#L100

Of course there could be cases where there are multiple controllers with
the same compatible, but that case could be supported later on by those
who really need it. I don't think that any of NVIDIA Tegra SoCs fall
into that category.

> +void memory_controller_put(struct memory_controller *mc)
> +{
> +	if (mc)
> +		kref_put(&mc->ref, memory_controller_release);
		module_put(mc->dev->driver->owner);

> +}
> +EXPORT_SYMBOL_GPL(memory_controller_put);


[snip]
