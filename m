Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84565460FB
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 16:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfFNOjB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 10:39:01 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10765 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbfFNOjA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 10:39:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03b1830000>; Fri, 14 Jun 2019 07:38:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 07:38:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Jun 2019 07:38:58 -0700
Received: from [10.24.192.32] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 14:38:55 +0000
Subject: Re: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC:     Thierry Reding <thierry.reding@gmail.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <jonathanh@nvidia.com>, <vidyas@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190516055307.25737-1-mmaddireddy@nvidia.com>
 <20190516055307.25737-28-mmaddireddy@nvidia.com>
 <20190604132233.GT16519@ulmo>
 <20190613152404.GB30445@e121166-lin.cambridge.arm.com>
 <cb2dd446-1275-7179-33ac-e5c237d81da6@nvidia.com>
 <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
X-Nvconfidentiality: public
From:   Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <1508173d-0ecc-f498-6ab2-78a718086b35@nvidia.com>
Date:   Fri, 14 Jun 2019 20:08:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560523139; bh=FF/7cNtCJHnENzFQyT6T9/uPvxp3CZfwgTXK3h9xoVA=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding:Content-Language;
        b=CgEfTuSK979PG0bJ4inWdDyccRNKNM9On5xoZSBladXKi2jnmvVmcQOBm3T3kZH0v
         zcVcOZLkLmI+1f6NmTW+euKIOj/Bn+n4CtwVChy73Yyhzi4XI2scgI+PhLS2a1eQDf
         VEmkfd25rKmIB5/SDyLXOaOar+l1gyqE98LBjBxn+mA+ZS0OiKkdcc7a0MZNI9M4FT
         WtM4bkWi0VA4c01gm6C9rywaorXoyLS+hPcY0Al0l9qNKex/+CjW/erMrQ+oHjF+3K
         95qEG5UuTX9oFPXUyNUEvhg+D23YSIWjOMRY6WXzEK+7udQzLatIIBt06oVZX7rfcE
         Yx72Z/rsxZOBQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 14-Jun-19 8:02 PM, Lorenzo Pieralisi wrote:
> On Fri, Jun 14, 2019 at 04:07:35PM +0530, Manikanta Maddireddy wrote:
>>
>> On 13-Jun-19 8:54 PM, Lorenzo Pieralisi wrote:
>>> On Tue, Jun 04, 2019 at 03:22:33PM +0200, Thierry Reding wrote:
>>>
>>> [...]
>>>
>>>>> +	} else {
>>>>> +		value = afi_readl(port->pcie, ctrl);
>>>>> +		value &= ~AFI_PEX_CTRL_RST;
>>>>> +		afi_writel(port->pcie, value, ctrl);
>>>>> +	}
>>>>>  
>>>>>  	usleep_range(1000, 2000);
>>>>>  
>>>>> -	value = afi_readl(port->pcie, ctrl);
>>>>> -	value |= AFI_PEX_CTRL_RST;
>>>>> -	afi_writel(port->pcie, value, ctrl);
>>>>> +	if (port->reset_gpiod) {
>>>>> +		gpiod_set_value(port->reset_gpiod, 1);
>>>> After this the port should be functional, right? I think it'd be better
>>>> to reverse the logic here and move the polarity of the GPIO into device
>>>> tree. gpiod_set_value() takes care of inverting the level internally if
>>>> the GPIO is marked as low-active in DT.
>>>>
>>>> The end result is obviously the same, but it makes the usage much
>>>> clearer. If somebody want to write a DT for their board, they will look
>>>> at the schematics and see a low-active reset line and may be tempted to
>>>> describe it as such in DT, but with your current code that would be
>>>> exactly the wrong way around.
>>> I agree with Thierry here, you should change the logic.
>>>
>>> Question: what's the advantage of adding GPIO reset support if that's
>>> architected already in port registers ? I am pretty sure there is a
>>> reason behind it (and forgive me the dumb question) and I would like to
>>> have it written in the commit log.
>>>
>>> Thanks,
>>> Lorenzo
>> Each PCIe controller has a dedicated SFIO pin to support PERST#
>> signal. Port register can control only this particular SFIO pin.
>> However, in one of the Nvidia platform, instead of using PCIe SFIO
>> pin, different gpio is routed PCIe slot. This happened because of a
>> confusion in IO ball naming convention. To support this particular
>> platform, driver has provide gpio support. I will update the commit
>> log in V5.
> What happens on that platform where you trigger reset through a port
> register with :
>
> value = afi_readl(port->pcie, ctrl);
> value |= AFI_PEX_CTRL_RST;
> afi_writel(port->pcie, value, ctrl);
>
> (imagine the DT is not updated for instance or on current
> mainline) ?
>
> Lorenzo

Lets take an example of PCIe controller-0, SFIO ball name which is controlled
by the port-0 register is PEX_L0_RST. It will deassert PEX_L0_RST SFIO line
but it doesn't go to PCIe slot, so fundamental reset(PERST# deassert) is not
applied to the endpoint connected to that slot.

Manikanta

>> Manikanta
>>
>>>>> +	} else {
>>>>> +		value = afi_readl(port->pcie, ctrl);
>>>>> +		value |= AFI_PEX_CTRL_RST;
>>>>> +		afi_writel(port->pcie, value, ctrl);
>>>>> +	}
>>>>>  }
>>>>>  
>>>>>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>>>>> @@ -2238,6 +2249,7 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>>>>  		struct tegra_pcie_port *rp;
>>>>>  		unsigned int index;
>>>>>  		u32 value;
>>>>> +		char *label;
>>>>>  
>>>>>  		err = of_pci_get_devfn(port);
>>>>>  		if (err < 0) {
>>>>> @@ -2296,6 +2308,23 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>>>>  		if (IS_ERR(rp->base))
>>>>>  			return PTR_ERR(rp->base);
>>>>>  
>>>>> +		label = kasprintf(GFP_KERNEL, "pex-reset-%u", index);
>>>> devm_kasprintf()?
>>>>
>>>> Thierry
>>>>
>>>>> +		if (!label) {
>>>>> +			dev_err(dev, "failed to create reset GPIO label\n");
>>>>> +			return -ENOMEM;
>>>>> +		}
>>>>> +
>>>>> +		rp->reset_gpiod = devm_gpiod_get_from_of_node(dev, port,
>>>>> +							      "reset-gpios", 0,
>>>>> +							      GPIOD_OUT_LOW,
>>>>> +							      label);
>>>>> +		kfree(label);
>>>>> +		if (IS_ERR(rp->reset_gpiod)) {
>>>>> +			err = PTR_ERR(rp->reset_gpiod);
>>>>> +			dev_err(dev, "failed to get reset GPIO: %d\n", err);
>>>>> +			return err;
>>>>> +		}
>>>>> +
>>>>>  		list_add_tail(&rp->list, &pcie->ports);
>>>>>  	}
>>>>>  
>>>>> -- 
>>>>> 2.17.1
>>>>>

