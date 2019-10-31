Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B0BEB145
	for <lists+linux-tegra@lfdr.de>; Thu, 31 Oct 2019 14:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfJaNdq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 31 Oct 2019 09:33:46 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43896 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726728AbfJaNdq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 31 Oct 2019 09:33:46 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 59160C34EDB324E71694;
        Thu, 31 Oct 2019 21:33:44 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 31 Oct 2019
 21:33:40 +0800
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>, <seanpaul@chromium.org>
References: <20191030135458.27960-1-yuehaibing@huawei.com>
 <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <cb0a976a-0148-d554-15ff-5f4059eccd37@huawei.com>
Date:   Thu, 31 Oct 2019 21:33:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2019/10/31 6:26, Dmitry Osipenko wrote:
> 30.10.2019 16:54, YueHaibing пишет:
>> If IOMMU_SUPPORT is not set, but IOMMU_IOVA is m and
>> COMPILE_TEST is y, building fails:
>>
>> drivers/gpu/host1x/dev.o: In function `host1x_remove':
>> dev.c:(.text+0x624): undefined reference to `put_iova_domain'
>> dev.c:(.text+0x624): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `put_iova_domain'
>> dev.c:(.text+0x62c): undefined reference to `iova_cache_put'
>> dev.c:(.text+0x62c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `iova_cache_put'
>>
>> Select IOMMU_IOVA while COMPILE_TEST is set to fix this.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: 52499a6ad2ae ("gpu: host1x: select IOMMU_IOVA")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/gpu/host1x/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
>> index cf987a3..354232d 100644
>> --- a/drivers/gpu/host1x/Kconfig
>> +++ b/drivers/gpu/host1x/Kconfig
>> @@ -2,7 +2,7 @@
>>  config TEGRA_HOST1X
>>  	tristate "NVIDIA Tegra host1x driver"
>>  	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>> -	select IOMMU_IOVA if IOMMU_SUPPORT
>> +	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>  	help
>>  	  Driver for the NVIDIA Tegra host1x hardware.
>>  
>>
> 
> It should be better to unconditionally select IOMMU_IOVA here.
> 
> The same could be done for drivers/staging/media/tegra-vde/ and
> drivers/gpu/host1x/, please see [1].

Yep, I will repost, thanks!

> 
> [1] https://lore.kernel.org/linux-iommu/20190829154902.GC19842@ulmo/
> 
> .
> 

