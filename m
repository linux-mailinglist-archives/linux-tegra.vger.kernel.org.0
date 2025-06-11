Return-Path: <linux-tegra+bounces-7279-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBEAD547C
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Jun 2025 13:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F400D169F2A
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Jun 2025 11:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523226E709;
	Wed, 11 Jun 2025 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nS0nlRsc"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DF260562;
	Wed, 11 Jun 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642480; cv=none; b=UlTPzOjuJkUmDykuhi0S+tj8bFo0YzKDtL/vdLpZXYXPZ1J61zPCAndf7xQ6p0H+8g3dBVwiB2rbiMrnvaFAj964B7pq/PpPHw1vQuk3LkXEPRcYqvuJ+eixeSXgTolQDtQms1KunpxdoKzDc/Sb+JWVbFZQkOTqs3Z5LA2m6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642480; c=relaxed/simple;
	bh=IdMBVvgaXytKVcHq/lbqSGRHi2D8T8Rr04wHTwx+0gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6elnQCjtvSKdaf4WL8AT4VhzuKsqhpANFPd9865Eynt9n/OYGekVK0/JbHhIKaCCeShp8xcOp1CUgdsZVA+7y7i5eCC//Ln6YImis4lNLRvK1E6eT/yJy5rcBAoqzpExM9El6SopbaXqnwqcR9iA7lr0cJQJ5/O4jfumGTq3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nS0nlRsc; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9DC196003010;
	Wed, 11 Jun 2025 12:47:48 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 0b2qLiOQMRWj; Wed, 11 Jun 2025 12:47:46 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B7514600300D;
	Wed, 11 Jun 2025 12:47:45 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749642466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asfj8P0qBl+47/jdsiGM3FqMrZ4mD4Q9Fmdq7rUrsPM=;
	b=nS0nlRscUryncl2VrCpg9Drtep5/5mB+xDfRFEae1u6GFaOWQcLulY+h2Oyl5lnccdAe4j
	HtHYY/mtuReuUFo0O8HNQRPscns/FhqeuBi29p2B9XAyjIj7hjDvY7CpELzZk9l8/MIdpq
	jTbXVb2r/07TwBGvDLnd5K2RGsYPtDI=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EDDCE360061;
	Wed, 11 Jun 2025 12:47:43 +0100 (WEST)
Message-ID: <da94459b-1e06-4e07-936c-51aac41c0d26@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:47:20 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
 <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Mikko, thanks for the quick review!

On 6/10/25 4:26 AM, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
>> Add support for booting and using NVJPG on Tegra210 to the Host1x
>> and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.
> 
> Hello Diogo -- I'm happy to see this driver!
> 
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   drivers/gpu/drm/tegra/Makefile |   1 +
>>   drivers/gpu/drm/tegra/drm.c    |   2 +
>>   drivers/gpu/drm/tegra/drm.h    |   1 +
>>   drivers/gpu/drm/tegra/nvjpg.c  | 379 +++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   4 files changed, 383 insertions(+)
>> ...
>> +
>> +static __maybe_unused int nvjpg_runtime_resume(struct device *dev)
>> +{
>> +    struct nvjpg *nvjpg = dev_get_drvdata(dev);
>> +    int err;
>> +
>> +    err = clk_prepare_enable(nvjpg->clk);
>> +    if (err < 0)
>> +        return err;
>> +
>> +    usleep_range(20, 30);
>> +
>> +    if (nvjpg->rst) {
>> +        err = reset_control_acquire(nvjpg->rst);
>> +        if (err < 0) {
>> +            dev_err(dev, "failed to acquire reset: %d\n", err);
>> +            goto disable_clk;
>> +        }
>> +
>> +        err = reset_control_deassert(nvjpg->rst);
>> +        if (err < 0) {
>> +            dev_err(dev, "failed to deassert reset: %d\n", err);
>> +            goto release_reset;
>> +        }
>> +
>> +        usleep_range(20, 30);
>> +    }
> 
> Do we need this manual reset handling? NVJPG is only on T210+ where the 
> power domain code handles the reset as well. Did you run into any issues 
> with it?

Everything works just fine without the manual reset handling. I was
unsure if I should add it to the driver and in the end I decided to do
it because I thought that it would be better if the driver had explicit
control over it. However if delegating this to the power domain code is
enough I'll delete it for v2.

>> +
>> +    err = nvjpg_load_falcon_firmware(nvjpg);
>> +    if (err < 0)
>> +        goto assert_reset;
>> +
>> +    err = falcon_boot(&nvjpg->falcon);
>> +    if (err < 0)
>> +        goto assert_reset;
>> +
>> +    return 0;
>> +
>> +assert_reset:
>> +    reset_control_assert(nvjpg->rst);
>> +release_reset:
>> +    reset_control_release(nvjpg->rst);
>> +disable_clk:
>> +    clk_disable_unprepare(nvjpg->clk);
>> +    return err;
>> +}
>> ...
>> +
>> +static int nvjpg_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct nvjpg *nvjpg;
>> +    int err;
>> +
>> +    /* inherit DMA mask from host1x parent */
>> +    err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
>> +    if (err < 0) {
>> +        dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
>> +        return err;
>> +    }
>> +
>> +    nvjpg = devm_kzalloc(dev, sizeof(*nvjpg), GFP_KERNEL);
>> +    if (!nvjpg)
>> +        return -ENOMEM;
>> +
>> +    nvjpg->config = of_device_get_match_data(dev);
>> +
>> +    nvjpg->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> 
> This can be devm_platform_ioremap_resource -- slightly simpler.

Thanks, I'll update that for v2.

>> +    if (IS_ERR(nvjpg->regs))
>> +        return PTR_ERR(nvjpg->regs);
>> +
>> +    nvjpg->rst = devm_reset_control_get_exclusive_released(&pdev- 
>> >dev, "nvjpg");
>> +    if (IS_ERR(nvjpg->rst)) {
>> +        err = PTR_ERR(nvjpg->rst);
>> +
>> +        if (err != -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
>> +            dev_err(&pdev->dev, "failed to get reset control: %d\n",
>> +                err);
>> +            return err;
>> +        }
>> +
>> +        /*
>> +         * At this point, the reset control is most likely being used
>> +         * by the generic power domain implementation. With any luck
>> +         * the power domain will have taken care of resetting the SOR
>> +         * and we don't have to do anything.
>> +         */
>> +        nvjpg->rst = NULL;
>> +    }
> 
> I see you've taken this from sor.c, but I think it should be 
> unnecessary. I imagine the code in sor.c is overcomplicated as well, 
> maybe because we used not to have the power domain implementation.

Following my comment above I'll delete this block for v2.

>> +
>> +    nvjpg->clk = devm_clk_get(dev, "nvjpg");
>> +    if (IS_ERR(nvjpg->clk)) {
>> +        dev_err(&pdev->dev, "failed to get clock\n");
>> +        return PTR_ERR(nvjpg->clk);
>> +    }
> 
> Probably a good idea to set the clock rate to max (see vic.c).

Sounds good, I'll update it for v2.

>> +
>> +    nvjpg->falcon.dev = dev;
>> +    nvjpg->falcon.regs = nvjpg->regs;
>> +
>> +    err = falcon_init(&nvjpg->falcon);
>> +    if (err < 0)
>> +        return err;
>> +
>> +    platform_set_drvdata(pdev, nvjpg);
>> +
>> +    INIT_LIST_HEAD(&nvjpg->client.base.list);
>> +    nvjpg->client.base.ops = &nvjpg_client_ops;
>> +    nvjpg->client.base.dev = dev;
>> +    nvjpg->client.base.class = HOST1X_CLASS_NVJPG;
>> +    nvjpg->dev = dev;
>> +
>> +    INIT_LIST_HEAD(&nvjpg->client.list);
>> +    nvjpg->client.version = nvjpg->config->version;
>> +    nvjpg->client.ops = &nvjpg_ops;
>> +
>> +    err = host1x_client_register(&nvjpg->client.base);
>> +    if (err < 0) {
>> +        dev_err(dev, "failed to register host1x client: %d\n", err);
>> +        goto exit_falcon;
>> +    }
>> +
>> +    pm_runtime_use_autosuspend(dev);
>> +    pm_runtime_set_autosuspend_delay(dev, 500);
>> +    devm_pm_runtime_enable(dev);
>> +
>> +    return 0;
>> +
>> +exit_falcon:
>> +    falcon_exit(&nvjpg->falcon);
>> +
>> +    return err;
>> +}
>> +
>> +static void nvjpg_remove(struct platform_device *pdev)
>> +{
>> +    struct nvjpg *nvjpg = platform_get_drvdata(pdev);
>> +
>> +    host1x_client_unregister(&nvjpg->client.base);
>> +    falcon_exit(&nvjpg->falcon);
>> +}
>> +
>> +static const struct dev_pm_ops nvjpg_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(nvjpg_runtime_suspend, nvjpg_runtime_resume, 
>> NULL)
>> +    SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                pm_runtime_force_resume)
>> +};
> 
> There are modern, improved variants with no SET_ prefix.

I'll update it for v2 as well.

Thank you for your time!
Diogo

