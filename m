Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD3B10892F
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 08:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfKYHdg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 02:33:36 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17709 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfKYHdg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 02:33:36 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ddb83d00000>; Sun, 24 Nov 2019 23:33:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 24 Nov 2019 23:33:34 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 24 Nov 2019 23:33:34 -0800
Received: from [10.25.75.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 07:33:30 +0000
Subject: Re: [PATCH 6/6] arm64: tegra: Add support for PCIe endpoint mode in
 P2972-0000 platform
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <lorenzo.pieralisi@arm.com>, <bhelgaas@google.com>,
        <robh+dt@kernel.org>, <jonathanh@nvidia.com>,
        <andrew.murray@arm.com>, <kishon@ti.com>,
        <gustavo.pimentel@synopsys.com>, <linux-pci@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kthota@nvidia.com>,
        <mmaddireddy@nvidia.com>, <sagar.tv@gmail.com>
References: <20191122104505.8986-1-vidyas@nvidia.com>
 <20191122104505.8986-7-vidyas@nvidia.com> <20191122132533.GD1315704@ulmo>
 <e1e44c1c-c1ab-27dd-b3ac-a9ed878411a2@nvidia.com>
 <20191125072542.GC1409040@ulmo>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <4f92c07a-ea0f-a632-f5c5-b87666f8ecdd@nvidia.com>
Date:   Mon, 25 Nov 2019 13:03:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191125072542.GC1409040@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574667216; bh=DtCnKb+8WTqKZMwRLLM3YNWAIKyw64fTfUEa8m1Vqng=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BnlENGEfiOjLfqX15gYfbbj86P0203209Hc63gkA4SIRqAT06GkBbwgkO/eKwf3HE
         QdhzkSFF1SzU81P8cLWGj9RFR0cZqJTTU9DrVsPWH4DS5muDKG6p0VHnu/ZK/AM8zo
         LzqLdpQTw9P4/IvFZpRm9pJX/phNSX9dOyUmdBb6Aq8R/5ZcTg8cxu9EzmHRtAwuLI
         ArwDJCLM3TzLVzR1bjGyBNPPYa/Ce2DtDD1jh2mTRPy6+Z82+oVTJylR5nbMpAZBxa
         B+TPG5CZ5p9HDkfdQaSk2jZAMAx0WWwYqFkaFiF9p5e1EbgIaDSzwev3AdLK35gJ0H
         /5cKCJhG6IUiw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/25/2019 12:55 PM, Thierry Reding wrote:
> On Mon, Nov 25, 2019 at 12:30:53PM +0530, Vidya Sagar wrote:
>> On 11/22/2019 6:55 PM, Thierry Reding wrote:
>>> On Fri, Nov 22, 2019 at 04:15:05PM +0530, Vidya Sagar wrote:
>>>> Add endpoint mode support for PCIe C5 controller in P2972-0000 platform
>>>> with information about supplies, PHY, PERST GPIO and GPIO that controls
>>>> PCIe reference clock coming from the host system.
>>>>
>>>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>>>> ---
>>>>    .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 29 +++++++++++++++++++
>>>>    1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>>> index 7eb64b816e08..58c3a9677bc8 100644
>>>> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
>>>> @@ -43,6 +43,19 @@
>>>>    		gpio@c2f0000 {
>>>>    			status = "okay";
>>>> +			/*
>>>> +			 * Change the below node's status to 'okay' when
>>>> +			 * PCIe C5 controller is enabled to operate in endpoint
>>>> +			 * to allow REFCLK from the host system to flow into
>>>> +			 * the controller.
>>>> +			 */
>>>> +			pex-refclk-sel-high {
>>>> +				gpio-hog;
>>>> +				output-high;
>>>> +				gpios = <TEGRA194_AON_GPIO(AA, 5) 0>;
>>>> +				label = "pex_refclk_sel_high";
>>>> +				status = "disabled";
>>>> +			};
>>>
>>> Why don't we put this into the PCIe controller's node as a reference to
>>> that GPIO? Seems like the controller would know exactly when this pin
>>> needs to go high or low, so why does it have to be a hog?
>>>
>>> Thierry
>> Are you saying something like 'nvidia,enable-refclk-in'?
>> I was thinking, since this is like a board level configuration specific to Jetson-Xavier,
>> it would suffice to just hog it according to the mode of operation of PCIe controller.
>> But, I see one advantage of referencing it in the PCIe node (so that the driver can configure
>> it as and when needed) is that one has to be careful just to enable either PCIe RP or EP
>> node and not worry about other thing (like this).
>> Let me know if I got this right.
> 
> Yeah, that's exactly why I think referencing this from the controller
> and controlling it in the driver is preferable.
> 
> If this is some sort of select signal I think it makes sense to name it
> "nvidia,refclk-select-gpios" or something. Does this appear in the
> schematic somewhere? Or does the IP have a name for this? Those are
> usually good places to look for inspiration on the name because it's
> what hardware designers will be familiar with and they are technically
> the ones who should write the DT, even if that's rarely the case.
Schematic has "PEX_REFCLK_SEL" name.
I would go with 'nvidia,refclk-select-gpios' and make the change.

- Vidya Sagar
> 
> Thierry
> 
>>
>> - Vidya Sagar
>>
>>>
>>>>    		};
>>>>    		pwm@c340000 {
>>>> @@ -144,6 +157,22 @@
>>>>    			    "p2u-5", "p2u-6", "p2u-7";
>>>>    	};
>>>> +	pcie_ep@141a0000 {
>>>> +		status = "disabled";
>>>> +
>>>> +		vddio-pex-ctl-supply = <&vdd_1v8ao>;
>>>> +
>>>> +		nvidia,pex-rst-gpio = <&gpio TEGRA194_MAIN_GPIO(GG, 1)
>>>> +					GPIO_ACTIVE_LOW>;
>>>> +
>>>> +		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
>>>> +		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
>>>> +		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
>>>> +
>>>> +		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
>>>> +			    "p2u-5", "p2u-6", "p2u-7";
>>>> +	};
>>>> +
>>>>    	fan: fan {
>>>>    		compatible = "pwm-fan";
>>>>    		pwms = <&pwm4 0 45334>;
>>>> -- 
>>>> 2.17.1
>>>>
>>

