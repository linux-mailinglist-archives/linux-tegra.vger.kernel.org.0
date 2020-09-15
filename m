Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F164526B829
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Sep 2020 02:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgIPAhf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Sep 2020 20:37:35 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11893 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgIONYC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 09:24:02 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f60bec80004>; Tue, 15 Sep 2020 06:16:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 15 Sep 2020 06:17:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 15 Sep 2020 06:17:43 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep
 2020 13:17:42 +0000
Subject: Re: [PATCH 9/9] arm64: tegra: Initial Tegra234 VDK support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
 <20200716141856.544718-10-thierry.reding@gmail.com>
 <3c2f4e9c-28af-d5dc-1daa-40744da32898@nvidia.com>
 <20200915124427.GC3496938@ulmo>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <69859635-da61-acb8-82d4-3dbc6fd7fc10@nvidia.com>
Date:   Tue, 15 Sep 2020 14:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915124427.GC3496938@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600175816; bh=wQ0FBtmKb890miK9IKO3NY2XodAPS5XDbIvdFurIXg0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=czu4g7ZHERkifSXV44RscIxPqpw/xh/hKUXY6tuaFCn1blid5Zu6YR0tyqIyUKiZZ
         8WNC80EYEOHnd2DWsC+YGnaQ1rOBeDfQX+/JiYpdDi569apTQuyHrLbC5NVg2xn2HZ
         sds3Cqp/mvysKfnUhnzovA2ZUznyZhpxN7VegHBre7yEVB8ls63N3UUT+5ISzoy92m
         fU7MC2DaJ8dhxwabzWYyC6XMwbeQqtopBJ9ibUd31F6apgOP5nev/YK6o5/QTasTAh
         NfuEBCyDplLdVduWt8avJAc3hv5Op6y3cMiugmnpIuOV21s42qzRr16fe4TslPPX0D
         uOn/EITb+TT0w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 15/09/2020 13:44, Thierry Reding wrote:
> On Mon, Sep 07, 2020 at 08:46:48PM +0100, Jon Hunter wrote:
>>
>> On 16/07/2020 15:18, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
>>> supports a subset of the peripherals that will be available in the final
>>> chip and serves as a bootstrapping platform.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>>>  .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
>>>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++++
>>>  drivers/soc/tegra/Kconfig                     |  10 +
>>>  include/dt-bindings/clock/tegra234-clock.h    |  14 ++
>>>  include/dt-bindings/reset/tegra234-reset.h    |  10 +
>>>  6 files changed, 266 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
>>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>>  create mode 100644 include/dt-bindings/clock/tegra234-clock.h
>>>  create mode 100644 include/dt-bindings/reset/tegra234-reset.h
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
>>> index 2273fc5db19c..9296d12d11e9 100644
>>> --- a/arch/arm64/boot/dts/nvidia/Makefile
>>> +++ b/arch/arm64/boot/dts/nvidia/Makefile
>>> @@ -9,3 +9,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
>>>  dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
>>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
>>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
>>> +dtb-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra234-sim-vdk.dtb
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
>>> new file mode 100644
>>> index 000000000000..f6e6a24829af
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
>>> @@ -0,0 +1,40 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/dts-v1/;
>>> +
>>> +#include "tegra234.dtsi"
>>> +
>>> +/ {
>>> +	model = "NVIDIA Tegra234 VDK";
>>> +	compatible = "nvidia,tegra234-vdk", "nvidia,tegra234";
>>> +
>>> +	aliases {
>>> +		sdhci3 = "/cbb@0/sdhci@3460000";
>>> +		serial0 = &uarta;
>>> +	};
>>> +
>>> +	chosen {
>>> +		bootargs = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x03100000";
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	cbb@0 {
>>> +		serial@3100000 {
>>> +			status = "okay";
>>> +		};
>>> +
>>> +		sdhci@3460000 {
>>> +			status = "okay";
>>> +			bus-width = <8>;
>>> +			non-removable;
>>> +			only-1-8-v;
>>> +		};
>>> +
>>> +		rtc@c2a0000 {
>>> +			status = "okay";
>>> +		};
>>> +
>>> +		pmc@c360000 {
>>> +			nvidia,invert-interrupt;
>>> +		};
>>> +	};
>>> +};
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> new file mode 100644
>>> index 000000000000..3509687441a1
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> @@ -0,0 +1,191 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <dt-bindings/clock/tegra234-clock.h>
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/mailbox/tegra186-hsp.h>
>>> +#include <dt-bindings/reset/tegra234-reset.h>
>>> +
>>> +/ {
>>> +	compatible = "nvidia,tegra234";
>>> +	interrupt-parent = <&gic>;
>>> +	#address-cells = <2>;
>>> +	#size-cells = <2>;
>>> +
>>> +	bus@0 {
>>> +		compatible = "simple-bus";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +
>>> +		ranges = <0x0 0x0 0x0 0x40000000>;
>>> +
>>> +		misc@100000 {
>>> +			compatible = "nvidia,tegra234-misc";
>>> +			reg = <0x00100000 0xf000>,
>>> +			      <0x0010f000 0x1000>;
>>> +			status = "okay";
>>> +		};
>>
>>
>> Is there meant to be a fallback option here, because I don't see
>> anything to match the above compatible string?
> 
> I've got the below patch in my tree that's meant to add that code, but
> it's in the wrong order in my local branch, so it didn't make it into
> this subset. I'll reorder the patches to include the APBMISC support
> patch in this series.

OK, I think that the same also applies to efuse, pmc, rtc and bpmp-shmem
from looking at this patch.

Jon

-- 
nvpublic
