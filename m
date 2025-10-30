Return-Path: <linux-tegra+bounces-10148-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F366DC21D64
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Oct 2025 19:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B8481888C87
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Oct 2025 18:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E9C36CE17;
	Thu, 30 Oct 2025 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB1n7yzy"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6646A23BD17;
	Thu, 30 Oct 2025 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761850296; cv=none; b=o8Mu1z30KWmKGGuCKyxrIRB5ctnCwNc6eCvg7bGcOi/SZL+5JLkgFXjiZKOWADmrCrnP5SZHjV652pepltUq8rqUhFK4lOO75fz2Wr5/iuA/p+CW5PhpsYoOX8xJGYXmjDhi6CqOO4LTtDOuhXgFLu438eTE1O0magFaasyvAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761850296; c=relaxed/simple;
	bh=or+V+SumNH0gU2c9duwiNTP+SlKS5gb5NwFmTGAPpz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1vsrwwR17VLUBbRDyZu4ttTVxk1WseV6XuDrdB3lcrK4GJoQHEapKRXKzEz4rD/O46eLCdnJ42XBymOI0oRyvrrZ1WPK9M2OwsIJAA4c9hYR7b+vX/xf0BCcsmbwKH4wGC0725j+ndNz/8AE/DiIzVOLGGJFcYjxoaChtWlFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pB1n7yzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777CBC4CEFB;
	Thu, 30 Oct 2025 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761850296;
	bh=or+V+SumNH0gU2c9duwiNTP+SlKS5gb5NwFmTGAPpz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pB1n7yzyDshO3wPHpDZKp24AhL46Yn2wpnRz4jzIWqiqTz7J4p/ZajhrM77ZkqzbQ
	 XXCM/US1uP26Ylt/tYF0Rp2N6fTv6WlN+v2M2e+0SPvdbEWZEptNBUxicMeKXOHhxN
	 d72CUD7gWR8XgzAyOcqM7gWWAuRQqQ+AsoxHds7tVkzPA3Sk0Kdb6mMNZYYBlhohKK
	 cDrQHG/AcZgZrZc1yRr0Yia20WTZ2dY0OutfkJvxmXXYKyGdpdOYhPOEeuGZ7c04Nd
	 +phL9qvFGWzlGycDtf2nJgZgsIWLnn7GlHFfNZLPZCWOM8dKMUc6MWlZ4797JRsQkr
	 LlFJU0EfHzwQQ==
Date: Thu, 30 Oct 2025 13:54:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Robie Basak <robibasa@qti.qualcomm.com>
Subject: Re: [PATCH RESEND v2] devfreq: move governor.h to a public header
 location
Message-ID: <us5vhy57yq7ktklgpsfr262sgquo5yuwau2yn7kefaipmj37ur@tzi5a2czke7m>
References: <20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-governor-public-v2-1-432a11a9975a@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 08:26:28PM +0200, Dmitry Baryshkov wrote:
> Some device drivers (and out-of-tree modules) might want to define
> device-specific device governors. Rather than restricting all of them to
> be a part of drivers/devfreq/ (which is not possible for out-of-tree
> drivers anyway) move governor.h to include/linux/devfreq-governor.h and
> update all drivers to use it.
> 
> The devfreq_cpu_data is only used internally, by the passive governor,
> so it is moved to the driver source rather than being a part of the
> public interface.
> 
> Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v2:
> - Fixed typo in commit subject (Mikko Perttunen)
> - Link to v1: https://lore.kernel.org/r/20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com
> ---
>  drivers/devfreq/devfreq.c                          |  2 +-
>  drivers/devfreq/governor_passive.c                 | 27 +++++++++++++++++-
>  drivers/devfreq/governor_performance.c             |  2 +-
>  drivers/devfreq/governor_powersave.c               |  2 +-
>  drivers/devfreq/governor_simpleondemand.c          |  2 +-
>  drivers/devfreq/governor_userspace.c               |  2 +-
>  drivers/devfreq/hisi_uncore_freq.c                 |  3 +-
>  drivers/devfreq/tegra30-devfreq.c                  |  3 +-
>  .../governor.h => include/linux/devfreq-governor.h | 33 +++-------------------
>  9 files changed, 37 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 2e8d01d47f6996a634a8ad5ddf20c5a68d1a299d..00979f2e0e276a05ee073dcf5cd8e930bdd539fb 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -20,6 +20,7 @@
>  #include <linux/stat.h>
>  #include <linux/pm_opp.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/workqueue.h>
>  #include <linux/platform_device.h>
>  #include <linux/list.h>
> @@ -28,7 +29,6 @@
>  #include <linux/of.h>
>  #include <linux/pm_qos.h>
>  #include <linux/units.h>
> -#include "governor.h"
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/devfreq.h>
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index 953cf9a1e9f7f93804cc889db38883bf97ae005d..8cd6f9a59f6422ccd138ff4b264dc8a547ad574f 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -14,8 +14,33 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/units.h>
> -#include "governor.h"
> +
> +/**
> + * struct devfreq_cpu_data - Hold the per-cpu data
> + * @node:	list node
> + * @dev:	reference to cpu device.
> + * @first_cpu:	the cpumask of the first cpu of a policy.
> + * @opp_table:	reference to cpu opp table.
> + * @cur_freq:	the current frequency of the cpu.
> + * @min_freq:	the min frequency of the cpu.
> + * @max_freq:	the max frequency of the cpu.
> + *
> + * This structure stores the required cpu_data of a cpu.
> + * This is auto-populated by the governor.
> + */
> +struct devfreq_cpu_data {
> +	struct list_head node;
> +
> +	struct device *dev;
> +	unsigned int first_cpu;
> +
> +	struct opp_table *opp_table;
> +	unsigned int cur_freq;
> +	unsigned int min_freq;
> +	unsigned int max_freq;
> +};
>  
>  static struct devfreq_cpu_data *
>  get_parent_cpu_data(struct devfreq_passive_data *p_data,
> diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> index 2e4e981446fa8ea39f65b09dddff198c0b8e3338..fdb22bf512cf134d75f1eaf3edb80e562dd28bec 100644
> --- a/drivers/devfreq/governor_performance.c
> +++ b/drivers/devfreq/governor_performance.c
> @@ -7,8 +7,8 @@
>   */
>  
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/module.h>
> -#include "governor.h"
>  
>  static int devfreq_performance_func(struct devfreq *df,
>  				    unsigned long *freq)
> diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> index f059e881480465b051f27d740348adaf779aebf0..ee2d6ec8a512248f070b2c5bee8146320b7be312 100644
> --- a/drivers/devfreq/governor_powersave.c
> +++ b/drivers/devfreq/governor_powersave.c
> @@ -7,8 +7,8 @@
>   */
>  
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/module.h>
> -#include "governor.h"
>  
>  static int devfreq_powersave_func(struct devfreq *df,
>  				  unsigned long *freq)
> diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> index c234357363675508c12732a08c1cd26c349039d1..9c69b96df5f97306e9be46aa6bb1d9d2f8e58490 100644
> --- a/drivers/devfreq/governor_simpleondemand.c
> +++ b/drivers/devfreq/governor_simpleondemand.c
> @@ -9,8 +9,8 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/math64.h>
> -#include "governor.h"
>  
>  /* Default constants for DevFreq-Simple-Ondemand (DFSO) */
>  #define DFSO_UPTHRESHOLD	(90)
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 175de0c0b50e087861313060eab70a35b757fd20..395174f93960d0762456238654f4d356e21cf57c 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -9,11 +9,11 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/kstrtox.h>
>  #include <linux/pm.h>
>  #include <linux/mutex.h>
>  #include <linux/module.h>
> -#include "governor.h"
>  
>  struct userspace_data {
>  	unsigned long user_frequency;
> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> index 96d1815059e32c4e70a1d3c257655cc6b162f745..b8e4621c57ebc76513e4eba978aa54f2b884e210 100644
> --- a/drivers/devfreq/hisi_uncore_freq.c
> +++ b/drivers/devfreq/hisi_uncore_freq.c
> @@ -9,6 +9,7 @@
>  #include <linux/bits.h>
>  #include <linux/cleanup.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/errno.h>
> @@ -26,8 +27,6 @@
>  #include <linux/units.h>
>  #include <acpi/pcc.h>
>  
> -#include "governor.h"
> -
>  struct hisi_uncore_pcc_data {
>  	u16 status;
>  	u16 resv;
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 4a4f0106ab9ddcfb106a1860370cbf8a3579322a..77cbb204087c970c1fec0c1597b1e76c1a11b390 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -9,6 +9,7 @@
>  #include <linux/clk.h>
>  #include <linux/cpufreq.h>
>  #include <linux/devfreq.h>
> +#include <linux/devfreq-governor.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
> @@ -21,8 +22,6 @@
>  
>  #include <soc/tegra/fuse.h>
>  
> -#include "governor.h"
> -
>  #define ACTMON_GLB_STATUS					0x0
>  #define ACTMON_GLB_PERIOD_CTRL					0x4
>  
> diff --git a/drivers/devfreq/governor.h b/include/linux/devfreq-governor.h
> similarity index 80%
> rename from drivers/devfreq/governor.h
> rename to include/linux/devfreq-governor.h
> index 0adfebc0467a3db39278814fa66d2b1f25d61f7a..dfdd0160a29f35f5608575b07b450cf5157420ff 100644
> --- a/drivers/devfreq/governor.h
> +++ b/include/linux/devfreq-governor.h
> @@ -5,11 +5,11 @@
>   * Copyright (C) 2011 Samsung Electronics
>   *	MyungJoo Ham <myungjoo.ham@samsung.com>
>   *
> - * This header is for devfreq governors in drivers/devfreq/
> + * This header is for devfreq governors
>   */
>  
> -#ifndef _GOVERNOR_H
> -#define _GOVERNOR_H
> +#ifndef __LINUX_DEVFREQ_DEVFREQ_H__
> +#define __LINUX_DEVFREQ_DEVFREQ_H__
>  
>  #include <linux/devfreq.h>
>  
> @@ -47,31 +47,6 @@
>  #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
>  #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
>  
> -/**
> - * struct devfreq_cpu_data - Hold the per-cpu data
> - * @node:	list node
> - * @dev:	reference to cpu device.
> - * @first_cpu:	the cpumask of the first cpu of a policy.
> - * @opp_table:	reference to cpu opp table.
> - * @cur_freq:	the current frequency of the cpu.
> - * @min_freq:	the min frequency of the cpu.
> - * @max_freq:	the max frequency of the cpu.
> - *
> - * This structure stores the required cpu_data of a cpu.
> - * This is auto-populated by the governor.
> - */
> -struct devfreq_cpu_data {
> -	struct list_head node;
> -
> -	struct device *dev;
> -	unsigned int first_cpu;
> -
> -	struct opp_table *opp_table;
> -	unsigned int cur_freq;
> -	unsigned int min_freq;
> -	unsigned int max_freq;
> -};
> -
>  /**
>   * struct devfreq_governor - Devfreq policy governor
>   * @node:		list node - contains registered devfreq governors
> @@ -124,4 +99,4 @@ static inline int devfreq_update_stats(struct devfreq *df)
>  
>  	return df->profile->get_dev_status(df->dev.parent, &df->last_status);
>  }
> -#endif /* _GOVERNOR_H */
> +#endif /* __LINUX_DEVFREQ_DEVFREQ_H__ */
> 
> ---
> base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
> change-id: 20250903-governor-public-d9cd4198f858
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 
> 

