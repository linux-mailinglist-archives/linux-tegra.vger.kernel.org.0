Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A771B2336
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2020 11:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgDUJtm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-tegra@lfdr.de>); Tue, 21 Apr 2020 05:49:42 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18967 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUJtl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 05:49:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9ec1410000>; Tue, 21 Apr 2020 02:47:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 02:49:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 02:49:40 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 09:49:40 +0000
Received: from [10.26.73.24] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 09:49:36 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "Wolfram Sang" <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
Date:   Tue, 21 Apr 2020 10:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,
DKIM-Signature: v a a-sha256; claxed/relaxed; d idia.com; s;
	t87462465; bhmqRv+sNd/vlpkXkRsCrkXSkOm+NZfBA8tHeeFzi60	h PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Content-Type:Content-Language:
	 Content-Transfer-Encoding;
	b�MZuIoMEvnocJwaAlK59ppeq2HXtg8If2WkeG7oekW2SEfUw3GtGcyqdn9hJH1oG
	 iWeL+2EeEngLPi+venjHFoJSPqmU2/GtzShtyfKipiSVWCY1Q5wSiH3IcS61O4jNUw
	 Y/qqm0avHiNNN3bfuGOS735o3X3ZLDF8lA13aKEhc6KrpXFSXrTlzMobSZsiF5/qgf
	 8QLaBKcYl0nQyy3ZuOXo4x4ZWmbJOnlrzq8jWUn7EuU/lQ77GDAwGa66DRoR/6T9Qx
	 Scu9IgO6uxJMqmVC32Jeb12Ig5aTwq1RpzBHJTaHZRh+4yZi8opT9FiPj9FgTzmEuh
	 J78e3AStRA77A
On 21/04/2020 01:32, Dmitry Osipenko wrote:
> 21.04.2020 01:11, Dmitry Osipenko пишет:
>> Hello Jon,
>>
>> 20.04.2020 22:53, Jon Hunter пишет:
>>> Hi Dmitry,
>>>
>>> On 24/03/2020 19:12, Dmitry Osipenko wrote:
>>>> Boot CPU0 always handle I2C interrupt and under some rare circumstances
>>>> (like running KASAN + NFS root) it may stuck in uninterruptible state for
>>>> a significant time. In this case we will get timeout if I2C transfer is
>>>> running on a sibling CPU, despite of IRQ being raised. In order to handle
>>>> this rare condition, the IRQ status needs to be checked after completion
>>>> timeout.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>>>  1 file changed, 15 insertions(+), 12 deletions(-)
>>>
>>>
>>> I have noticed a regression on tegra30-cardhu-a04 when testing system
>>> suspend. Git bisect is pointing to this commit and reverting it fixes
>>> the problem. In the below console log I2C fails to resume ...
>>>
>> ...
>>> [   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16
>>
>> ...
>>> [   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: EMEM address decode error (SMMU translation error [--S])
>>>
>>> [   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: Page fault (SMMU translation error [--S])
>>
>> This looks very wrong, the error tells that 3d hardware is active and
>> doing something odd. Are you running some 3d tests?

I am not running any GFX tests. However, I am not sure if the above is
unrelated.

>>> Have you seen this?
>>
>> No, I haven't seen that. I'm not using PCIE and it looks like it's the
>> problem.
>>
>> Looking at the PCIE driver code, seems it's not syncing the RPM state on
>> suspend/resume.
>>
>> Please try this change:
>>
>> --- >8 ---
>> diff --git a/drivers/pci/controller/pci-tegra.c
>> b/drivers/pci/controller/pci-tegra.c
>> index 3e64ba6a36a8..b1fcbae4109c 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -2870,8 +2870,8 @@ static int __maybe_unused
>> tegra_pcie_pm_resume(struct device *dev)
>>
>>  static const struct dev_pm_ops tegra_pcie_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(tegra_pcie_pm_suspend, tegra_pcie_pm_resume, NULL)
>> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_pcie_pm_suspend,
>> -				      tegra_pcie_pm_resume)
>> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				      pm_runtime_force_resume)
>>  };
>>
>>
>>  static struct platform_driver tegra_pcie_driver = {
>> --- >8 ---
>>
>> Secondly, I2C driver suspends on NOIRQ level, while APBDMA driver
>> suspends on default level. This is also wrong, please try to apply this
>> hunk as well:
>>
>> --- >8 ---
>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>> index f6a2f42ffc51..e682ac86bd27 100644
>> --- a/drivers/dma/tegra20-apb-dma.c
>> +++ b/drivers/dma/tegra20-apb-dma.c
>> @@ -1653,7 +1653,7 @@ static int __maybe_unused
>> tegra_dma_dev_resume(struct device *dev)
>>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
>>  			   NULL)
>> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>>  };
>>
>>  static const struct of_device_id tegra_dma_of_match[] = {
>> --- >8 ---
>>
> 
> Although, I'm now having a second though about the APBDMA change... I'm
> recalling that there are some complications in regards to PCIE driver
> suspending, requiring it to be at NOIRQ level, but this should be wrong
> because PCIE driver uses voltage regulator driver at NOIRQ level, while
> regulator drivers suspend on default level. The current behavior of the
> PCIE driver should be wrong, I think it needs to be moved to the default
> suspend-resume level somehow.

I can try the above, but I agree it would be best to avoid messing with
the suspend levels if possible.

I am adding Manikanta to get some feedback on why we moved the PCI
suspend to the NOIRQ phase because it is not clear to me if we need to
do this here.

Manikanta, can you comment on whether we really need to suspend Tegra
PCI during the noirq phase?
 	
Cheers
Jon

-- 
nvpublic
