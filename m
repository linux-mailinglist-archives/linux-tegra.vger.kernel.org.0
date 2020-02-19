Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDF55163B32
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Feb 2020 04:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgBSD2e (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Feb 2020 22:28:34 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10618 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgBSD2e (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Feb 2020 22:28:34 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4cab410000>; Tue, 18 Feb 2020 19:28:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Feb 2020 19:28:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Feb 2020 19:28:33 -0800
Received: from [10.2.163.58] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 03:28:32 +0000
Subject: Re: [RFC PATCH v3 3/6] dt-binding: tegra: Add VI and CSI bindings
To:     Rob Herring <robh@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-4-git-send-email-skomatineni@nvidia.com>
 <20200218231503.GA19099@bogus>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <5948bf42-9be2-8cf0-1c28-80f69b708c65@nvidia.com>
Date:   Tue, 18 Feb 2020 19:28:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218231503.GA19099@bogus>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582082881; bh=cyoNazDtmT/h6DgHu5pqneFWToIbbP0fvPs2dxTlGMQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=CdpmAVZEN1+rPUXrq9ZTWHWteIUNLSIzWrA/h8Q6AVwCh3Xe4Ldg0Ae3e+GxK7GcY
         WacUUqIeiFWQEZwv0nLL99pvzd7yUg5NLPubTPS2AdWA9TN8XbQJ5bJzJhlHt8RWiJ
         6TtgMMo7qUbLyfXy4x+CGr20WXD3ZKfZtjAwmfiJbSKnFl580R/kSRv7HVRDeRfjs+
         DG1NxmOr8BuAAqNiKBcjMuDvb6+c8RLy2qK8dxdArj863jZSvKQewH3SZODclwBXVd
         vmrRmSBURvYrfXz/xK9kY16Mw5IA3TJfGDN44vMmxj06JQg/J89pX6dCvGDarNLTJx
         Ln17zs2CfuKFQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 2/18/20 3:15 PM, Rob Herring wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Feb 14, 2020 at 10:23:25AM -0800, Sowjanya Komatineni wrote:
>> Tegra contains VI controller which can support up to 6 MIPI CSI
>> camera sensors.
>>
>> Each Tegra CSI port from CSI unit can be one-to-one mapper to
>> VI channel and can capture from an external camera sensor or
>> from built-in test pattern generator.
>>
>> This patch adds dt-bindings for Tegra VI and CSI.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
>>   1 file changed, 47 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 9999255ac5b6..3d0ed540a646 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -40,14 +40,24 @@ of the following host1x client modules:
>>
>>     Required properties:
>>     - compatible: "nvidia,tegra<chip>-vi"
>> -  - reg: Physical base address and length of the controller's registers.
>> +  - reg: Physical base address and length of the controller registers.
>>     - interrupts: The interrupt outputs from the controller.
>> -  - clocks: Must contain one entry, for the module clock.
>> +  - clocks: Must contain an entry for the module clock "vi"
>>       See ../clocks/clock-bindings.txt for details.
>>     - resets: Must contain an entry for each entry in reset-names.
>>       See ../reset/reset.txt for details.
>> -  - reset-names: Must include the following entries:
>> -    - vi
>> +  - reset-names: Must include the entry "vi"
>> +
>> +  Tegra210 has CSI part of VI sharing same host interface and register
>> +  space. So, VI device node should have CSI child node.
>> +
>> +  - csi: mipi csi interface to vi
>> +
>> +    Required properties:
>> +    - compatible: "nvidia,tegra<chip>-csi"
>> +    - reg: Physical base address and length of the controller registers.
>> +    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
>> +      See ../clocks/clock-bindings.txt for details.
>>
>>   - epp: encoder pre-processor
>>
>> @@ -310,12 +320,41 @@ Example:
>>                };
>>
>>                vi {
>> -                     compatible = "nvidia,tegra20-vi";
>> -                     reg = <0x54080000 0x00040000>;
>> +                     compatible = "nvidia,tegra210-vi";
>> +                     reg = <0x0 0x54080000 0x0 0x700>;
>>                        interrupts = <0 69 0x04>;
>> -                     clocks = <&tegra_car TEGRA20_CLK_VI>;
>> -                     resets = <&tegra_car 100>;
>> +                     assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +                     assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
>> +                     clocks = <&tegra_car TEGRA210_CLK_VI>;
>> +                     clock-names = "vi";
>> +                     resets = <&tegra_car 20>;
>>                        reset-names = "vi";
>> +
>> +                     #address-cells = <2>;
>> +                     #size-cells = <2>;
>> +
>> +                     ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
>> +
>> +                     csi@0x54080838 {
> Drop '0x'
Will fix in v4
>
>> +                             compatible = "nvidia,tegra210-csi";
>> +                             reg = <0x0 0x54080838 0x0 0x2000>;
> Kind of odd that this address and ranges address are not the same. And
> also wrong that the size here exceeds the bounds of ranges.
>
> Also, best practice is to make the child address 0 or relative to the
> parent.

Actual CSI starts at offset 0x808 but we don't use couple of registers 
at offset 0x808.

Will update ranges in v4 to start from 0x838 offset and will make child 
address relative to parent.

>
>> +                             status = "disabled";
> Don't show status in examples.
Will remove.
>
>> +                             assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
>> +                                               <&tegra_car TEGRA210_CLK_CILCD>,
>> +                                               <&tegra_car TEGRA210_CLK_CILE>;
>> +                             assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
>> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>,
>> +                                                      <&tegra_car TEGRA210_CLK_PLL_P>;
>> +                             assigned-clock-rates = <102000000>,
>> +                                                    <102000000>,
>> +                                                    <102000000>;
>> +                             clocks = <&tegra_car TEGRA210_CLK_CSI>,
>> +                                      <&tegra_car TEGRA210_CLK_CILAB>,
>> +                                      <&tegra_car TEGRA210_CLK_CILCD>,
>> +                                      <&tegra_car TEGRA210_CLK_CILE>;
>> +                             clock-names = "csi", "cilab", "cilcd", "cile";
>> +                     };
>> +
>>                };
>>
>>                epp {
>> --
>> 2.7.4
>>
