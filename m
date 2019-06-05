Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CC535B3F
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 13:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfFELZr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 07:25:47 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46585 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfFELZr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 07:25:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id m15so14492195ljg.13
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d+B3754XRf3q/ESj6yOjW7+T+1YilplBjRQvtPvVems=;
        b=a8YSIX8jBb+r1uK8V5CYTGntkoyx26CKQrHFyVpSOQGKYDhM5Nt8J2G+iXxC3hTMLb
         CQc/oi+cw8n6T0qmw0tUCj+aqezVSLuZqrBtRW8Yi0m48IE8BFvoyINnGACabk3ly3VC
         laQ0ZUFsoK6dCltzRIRidR2sGb6gbnkBr+IN49wzoZ5shYQAdosL3HJttgjBEbsVIDgb
         kgamNeqMfYfxba1b9+MGJr1Q3J85kLAedVaoU/NmFaWJfNIzAaxPmITrGYkc4f5HSlc7
         +9s3tdGJ1Cew9nvP82zF0ZnwxPj0uAtQo5UzbRd3tpQyOQimvxv0poYLMrGQJMu3ZYcV
         2ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d+B3754XRf3q/ESj6yOjW7+T+1YilplBjRQvtPvVems=;
        b=mRcE6bfFhCmhCdRg2z/wbNrrZON1LCJsOoKFGpZGPM/WDMaBCHywdG0PM9rBc0KxIw
         5JrGza0UtDNtmEdIQrM4bXwx0fQHY5G7kKJCfMvywpRtUg0WKzhqM1fd2RZrpUQt8ygR
         Yre+3Z6xMVyG69lJoFQgvGO2WhucKn7p5sPOqtB1ln0lEhn+NjdsHuJgM0mfZJOE8+76
         9P3Ffn2cRSTFKjqRglNw0WR8y2duZZ5SWnEt80pF5SZGr3K3LRSSvZq6cCJ4FXEVqazu
         B+bLsUDCo0s1cBSt3UiNFKw7s9+as+28h+KxU9TNKwVr+ikVwvc+5aOLxlKZJrkUW15q
         dVBQ==
X-Gm-Message-State: APjAAAUb3VmbozRX9cPRmR2RCTEgreB5+p8pu6gnS3gMaK9X9bsjeGGA
        AjgWX0oPsi3bklTlNpOvTCcvUJqz
X-Google-Smtp-Source: APXvYqzhO0wo8nocKbIpZIMWPvWvp/MH98/pVmgz56+4/26QWtDKuwnhu2BAJI5zakYcccGsZP88RQ==
X-Received: by 2002:a2e:91d7:: with SMTP id u23mr20551152ljg.150.1559733944982;
        Wed, 05 Jun 2019 04:25:44 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id o11sm4090168lfl.15.2019.06.05.04.25.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:25:44 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
 <20190605082848.GB10944@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com>
Date:   Wed, 5 Jun 2019 14:25:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605082848.GB10944@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.06.2019 11:28, Thierry Reding пишет:
> On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
>> 04.06.2019 18:31, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> When deferring probe, avoid logging a confusing error message. While at
>>> it, make the error message more informational.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/gpu/host1x/dev.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>> index c55e2d634887..5a3f797240d4 100644
>>> --- a/drivers/gpu/host1x/dev.c
>>> +++ b/drivers/gpu/host1x/dev.c
>>> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
>>>  
>>>  	host->clk = devm_clk_get(&pdev->dev, NULL);
>>>  	if (IS_ERR(host->clk)) {
>>> -		dev_err(&pdev->dev, "failed to get clock\n");
>>>  		err = PTR_ERR(host->clk);
>>> +
>>> +		if (err != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
>>> +
>>>  		return err;
>>>  	}
>>
>> The clock driver should be available at the time of host1x's probing on
>> all Tegra's because it is one of essential core drivers that become
>> available early during boot.
> 
> That's the currently baked-in assumption. However, there can be any
> number of reasons for why the clocks may not show up as early as
> expected, as evidenced in the case of Tegra186.
> 
>> I guess you're making this change for T186, is it because the BPMP
>> driver's probe getting deferred? If yes, won't it be possible to fix the
>> defer of the clock driver instead of making such changes in the affected
>> drivers?
> 
> The reason why this is now happening on Tegra186 is because the BPMP is
> bound to an IOMMU to avoid getting faults from the new no-bypass policy
> that the ARM SMMU driver is implementing as of v5.2-rc1.
> 
> As a result of binding to an IOMMU, the first probe of the BPMP driver
> will get deferred, so any driver trying to request a clock after that
> and before BPMP gets probed successfully the next time, any clk_get()
> calls will fail with -EPROBE_DEFER.
> 
> This is a bit unfortunate, but like I said, these kinds of things can
> happen, and probe deferral was designed specifically to deal with that
> kind of situation so that we wouldn't have to rely on all of these
> built-in assumptions that occasionally break.
> 
> The driver also already handles deferred probe properly. The only thing
> that this patch really changes is to no longer consider -EPROBE_DEFER an
> error. It's in fact a pretty common situation in many drivers and should
> not warrant a kernel log message.

You're trying to mask symptoms instead of curing the decease and it looks
like the decease could be cured.

Won't something like this work for you?

From fbeabba5f1151e96edc38620db67593585558ca0 Mon Sep 17 00:00:00 2001
From: Dmitry Osipenko <digetx@gmail.com>
Date: Wed, 5 Jun 2019 14:02:00 +0300
Subject: [PATCH 1/2] iommu/arm-smmu: Move driver registration to subsys level

On some platforms there is a dependency on the IOMMU availability that
comes up early during of the boot process. One example is NVIDIA Tegra186
which uses firmware, called BPMP, which manages lots of core functions
like system clocks for example. That firmware driver require IOMMU
functionality and hence the driver's probing is getting deferred because
the ARM's SMMU driver is probed later, thus all the drivers that depend
on the BPMP availability are also getting deferred on Tegra186. Let's move
SMMU driver's registration to an earlier boot stage, allowing drivers like
BPMP to probe successfully without the defer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/arm-smmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5e54cc0a28b3..08919f2fdf04 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -2410,4 +2410,9 @@ static struct platform_driver arm_smmu_driver = {
 	.probe	= arm_smmu_device_probe,
 	.shutdown = arm_smmu_device_shutdown,
 };
-builtin_platform_driver(arm_smmu_driver);
+
+static int __init arm_smmu_init(void)
+{
+	return platform_driver_register(&arm_smmu_driver);
+}
+subsys_initcall(arm_smmu_init);
-- 
2.21.0

From 12ec90e22405b6d5574cbfcbd33b92736ad6bfe4 Mon Sep 17 00:00:00 2001
From: Dmitry Osipenko <digetx@gmail.com>
Date: Wed, 5 Jun 2019 14:13:15 +0300
Subject: [PATCH 2/2] firmware/tegra: Move driver registration to subsys-sync
 level

The BPMP driver depends on the ARM SMMU driver which is now getting
probed from the subsys level, hence let's move the BPMP's probing to
the subsys-sync level in order to avoid probe deferring of the BPMP's
driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index dd775e8ba5a0..3f649e12f9f6 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -883,4 +883,4 @@ static int __init tegra_bpmp_init(void)
 {
 	return platform_driver_register(&tegra_bpmp_driver);
 }
-core_initcall(tegra_bpmp_init);
+subsys_initcall_sync(tegra_bpmp_init);
-- 
2.21.0


