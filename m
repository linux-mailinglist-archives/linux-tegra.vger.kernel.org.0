Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389F7EE60
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2019 03:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729715AbfD3BaS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 21:30:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3006 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfD3BaS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 21:30:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cc7a50a0001>; Mon, 29 Apr 2019 18:29:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Apr 2019 18:30:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 29 Apr 2019 18:30:16 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Apr
 2019 01:30:14 +0000
Subject: Re: [PATCH v2] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Rob Herring <robh@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190412080855.387-1-josephl@nvidia.com>
 <20190429215605.GA3078@bogus>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <4d08d43e-d325-c357-9d4e-1ad7d2ec5569@nvidia.com>
Date:   Tue, 30 Apr 2019 09:30:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429215605.GA3078@bogus>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1556587787; bh=WcVvCIYL++Y4/n1+Xz6Tu56dIgRAmQvNOhrKo0esrIY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=EdgV0s/g4MHQ4czaeNejKtV8l0MHumtuM10bX/MiODEJU+mU5ybmcatHQ9+fj451T
         xM2h6uOlmXx6ixFyh6sWi0MwajuN1SjMtjnpQVXC2OAc8UoA7rj+GileRQTRSP1rsW
         hun7OWevGtQH/vc2P8Vu+SidtChcHc9PpO+OXV0Bn2JuIExajjXaBPcL/9n6e9NWzR
         RLZjQcmmuBHkfdCYEWxdF/T6zFmALxL34N0+oQsfUjY0c7byEmBEX2zY/CoNJsK7wM
         HXb/iJe126DBgkyh7a3tH9onNoq0s3TStwfhGeHLvGCzZTupj/Q8PEv5elNdNvM7U0
         3fyzV29Uibz6A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/30/19 5:56 AM, Rob Herring wrote:
> On Fri, Apr 12, 2019 at 04:08:55PM +0800, Joseph Lo wrote:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged the training data to the table that the kernel can share the
>> result. So the bindings are used for both kernel and firmware.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> This patch splits from the original patch set that supports EMC scaling
>> with binding document and drivers. Because the binding would be shared
>> by both firmware and kernel. We want to settle this first. Then we can
>> fix the kernel and firmware to support the same.
>>
>> Changes in v2:
>> * only use "tegra210" string in compatible string and remove the legacy
>>    "tegra21" string.
>> * clock-frequency -> fix the unit from kilohertz to hertz
>> * add "interrupts" property
>> * s/nvidia,emc-min-mv/nvidia,emc-min-millivolt/
>> * s/nvidia,gk20a-min-mv/nvidia,gk20a-min-millivolt/
>> * s/nvidia,source/clock-names/
>> * fix lots of properties that use underline to hyphen
>> * s/nvidia,emc-clock-latency-change/nvidia,emc-clock-latency-microsecond/
>> * add more information in the property descriptions
>> ---
>>   .../nvidia,tegra210-emc.txt                   | 614 ++++++++++++++++++
>>   1 file changed, 614 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>> new file mode 100644
>> index 000000000000..318239c3c295
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>> @@ -0,0 +1,614 @@
>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>> +====================================================
>> +
>> +Required properties :
>> +- compatible : should be "nvidia,tegra210-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- clocks : phandles of the possible source clocks
>> +- clock-names : names of the possible source clocks
>> +- interrupts : Should contain the EMC general interrupt
>> +- #address-cells : should be 1
>> +- #size-cells : should be 0
>> +- nvidia,memory-controller : phandle of the memory controller.
>> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CODE in
>> +		        the register to find matching emc-table nodes
>> +
...
>> +- nvidia,ptfv : a 12 word array of control data for periodic training
>> +- nvidia,emc-registers :
>> +- nvidia,emc-shadow-regs-ca-train :
>> +- nvidia,emc-shadow-regs-quse-train :
>> +- nvidia,emc-shadow-regs-rdwr-train :
>> +  a 221 word array of the following registers (See TRM 18.10.2 for register
>> +  descriptions)
> 
> I think this dumping of register values should not be in DT. I think the
> result here will be a lot of duplication of data. How many of the
> registers' values vary between 2 frequencies, for example?
> 
> We have bindings already for DDR that use timing values (see
> bindings/lpddr2/lpddr2.txt). There's one for LPDDR3 being added. This
> data is similar to the SPD data which is used in DIMMs. If SPD data is
> enough information for any DIMM to work on any PC, then that should be
> sufficient for embedded uses too.
> 
Hi Rob,

Thanks for the review. After some internal discussions, we decide to 
choose another approach. Instead of these EMC table bindings in the DT, 
we think that would be easier to pass the binary blob of the EMC table. 
Because the timing/settings in the EMC table could be different depends 
on vendors and devices (lpddr2/3/4), unify binding may not fit for each 
vendor.

For Tegra210, lpddr4 is the only SDRAM devices we support, it's more 
complicated than lpddr2/3. And the rate above 800MHz must be trained 
before it can be used, it's done by firmware, so the table also includes 
these training data. Just want to describe the table could have many 
private settings.

So we want to go through the EMC table with binary blob, it makes the DT 
binding easier for review and control in the driver. Will re-work the 
series to support this approach.

reserved-memory {
     #address-cells = <...>;
     #size-cells = <...>;
     ranges;

     emc_table: emc-table@.... {
         compatible = ...;
         reg = <...>;
     };
};

external-memory-controller@... {
     ...
     memory-region = <&emc_table>;
};

Thanks,
Joseph
