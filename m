Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC121D9FB5
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2020 20:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgESSlo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 May 2020 14:41:44 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2596 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESSln (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 May 2020 14:41:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ec427d80000>; Tue, 19 May 2020 11:39:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 19 May 2020 11:41:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 19 May 2020 11:41:43 -0700
Received: from [10.2.164.184] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 May
 2020 18:41:42 +0000
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200516154314.14769-1-digetx@gmail.com>
 <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
 <b634e7a5-9a30-3bd1-126d-be62e4dd73e1@gmail.com>
 <20200519162444.GD2113674@ulmo>
 <b4eb368e-adc2-7b77-3ae9-fefdcfddaf3d@gmail.com>
 <11c93dac-f5ba-2193-6f44-63af27fdce09@nvidia.com>
Message-ID: <aed72c87-0e16-6dea-a4e2-7fc6a97cd313@nvidia.com>
Date:   Tue, 19 May 2020 11:41:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <11c93dac-f5ba-2193-6f44-63af27fdce09@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589913560; bh=iZlQs82j0ApbkPQdu87ucYsr+TgY4OnZJ+MHqCwsxLk=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=P9u4/1Sl9X+4HDsYW3u6yJb4qijrQmfBCuSzVUrjBrUY6igbhbyxSJrp/mkpT0FRJ
         ewP1nIG4rzaLL7fV2lTa+dA37ETnXuGk9yE3HCh3ocftmjkyvhbeqa8LkNObg2+LVt
         14crCDGIhhRzjRrWHttf+v9i4wksRPw6wYuI3gdllyBJCrhM8S441kOAh1uqQzQo2m
         hce9U4Mavm5praAolVSCLO+sKqfUNi5r8t+K4gx/K0wupecEwHIA31V78RYf6k1xAx
         0UIQUaLNyctGoRJbJIWc4qMdjPRNWOFj5jSFhAnKOqhmKern+NqDYBAPSHSgKfheHE
         6NUd0EXU6sV1g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 5/19/20 11:34 AM, Sowjanya Komatineni wrote:
>
> On 5/19/20 9:33 AM, Dmitry Osipenko wrote:
>> 19.05.2020 19:24, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Tue, May 19, 2020 at 05:05:27PM +0300, Dmitry Osipenko wrote:
>>>> 19.05.2020 10:28, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx@gmail.com>=20
>>>>> wrote:
>>>>>> Several people asked me about the MMC warnings in the KMSG log and
>>>>>> I had to tell to ignore them because these warning are irrelevant to
>>>>>> pre-Tegra210 SoCs.
>>>>> Why are the warnings irrelevant?
>>>> That's what the DT binding doc says [1].
>>>>
>>>> [1]
>>>> https://www.kernel.org/doc/Documentation/devicetree/bindings/mmc/nvidi=
a%2Ctegra20-sdhci.txt=20
>>>>
>>>>
>>>> Although, looking at the driver's code and TRM docs, it seems that all
>>>> those properties are really irrelevant only to the older Terga20=20
>>>> SoC. So
>>>> the binding doc is a bit misleading.
>>>>
>>>> Nevertheless, the binding explicitly says that the properties are
>>>> optional, which is correct.
>>> Optional only means that drivers must not fail if these properties
>>> aren't found, it doesn't mean that the driver can't warn that they
>>> are missing.
>>>
>>> Quite possibly the only reason why they were made optional is because
>>> they weren't part of the bindings since the beginning. Anything added
>>> to a binding after the first public release has to be optional by
>>> definition, otherwise DT ABI wouldn't be stable.
>>>
>>> I think these warnings were added on purpose, though I also see that
>>> there are only values for these in device tree for Tegra186 and=20
>>> Tegra194
>>> but not Tegra210 where these should also be necessary.
>
> dt binding doc we have is common for MMC, SD and SDIO of all Tegras.=20
> Its not mandatory to have both 3v3 and 1v8 in device tree as based on=20
> signal mode.
>
> As these driver strengths are SoC specific, they are part of Tegra SoC=20
> specific device tree where same values will be applicable to all Tegra=20
> SoC specific platforms.
>
> Based on interface usage on platform, we use one or both of them like=20
> sdcard supports dual voltage and we use both 3V3 and 1V8 but if same=20
> interface is used for WIFI SD we use 1V8 only.
>
> So made these dt properties as optional.
>
> Other reason they are optional is, Tegra210 and prior has drive=20
> strength settings part of apb_misc and Tegra186 and later has driver=20
> strengths part of SDMMC controller. So,
>
> - Pinctrls "sdmmc-3v3-drv" and "sdmmc-1v8-drv" for driver strengths=20
> are applicable for Tegra210 and prior.
> - dt properties pad-autocal-pull-up/down-offset-1v8/3v3-timeout are=20
> for T186 onwards for driver strengths
>
> Looks like dt binding doc need fix to clearly document these based on=20
> SoC or agree with Yaml we can conditionally specify pinctrl or dt=20
> properties based on SoC dependent.
>
>
>>> Adding Sowjanya who wrote this code. Perhaps she can clarify why the
>>> warnings were added. If these values /should/ be there on a subset of
>>> Tegra, then I think we should keep them, or add them again, but perhaps
>>> add a better way of identifying when they are necessary and when it is
>>> safe to work without them.
>>>
>>> That said, looking at those checks I wonder if they are perhaps just
>>> wrong. Or at the very least they seem redundant. It looks to me like
>>> they can just be:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0if (tegra_host->pinctrl_state_XYZ =3D=3D NULL) =
{
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>>> =C2=A0=C2=A0=C2=A0=C2=A0}
>>>
>>> That !IS_ERR(...) doesn't seem to do anything. But in that case, it's
>>> also obvious why we're warning about them on platforms where these
>>> properties don't exist in DT.
>
> As drive strengths are through dt properties for T186 and later and=20
> thru pinctrl for T210 and prior, driver first checks for dt autocal=20
> timeout pull-up/down properties and if they are not found, it then=20
> checks for presence of pinctrl_state_xyx_drv only when valid=20
> pinctrl_state_xyz is present.
>
> Driver expects either pinctrl or dt properties and shows warning when=20
> neither of them are present as its mandatory to use fixed driver=20
> strengths when auto calibration fails.
>
> =C2=A0=C2=A0=C2=A0 err =3D device_property_read_u32(host->mmc->parent,
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "nvidia,pad-auto=
cal-pull-down-offset-3v3-timeout",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 &autocal->pull_d=
own_3v3_timeout);
> =C2=A0=C2=A0=C2=A0 if (err) {
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!IS_ERR(tegra_host->pinctrl_sta=
te_3v3) &&
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 (tegra_host->pin=
ctrl_state_3v3_drv =3D=3D NULL))
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_warn("%s: Mis=
sing autocal timeout 3v3-pad drvs\n",
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 mmc_hostname(host->mmc));
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 autocal->pull_down_3v3_timeout =3D =
0;
> =C2=A0=C2=A0=C2=A0 }
>
>>>
>>> So I think we either need to add those values where appropriate so that
>>> the warning doesn't show, or we need to narrow down where they are
>>> really needed and add a corresponding condition.
>>>
>>> But again, perhaps Sowjanya can help clarify if these really are only
>>> needed on Tegra210 and later or if these also apply to older chips.
>> Either way will be cleaner to convert the DT binding to YAML rather than
>> clutter the driver, IMO.
>>
>
>
>
Auto calibration is present from Tegra30 onward and looking into change=20
where autocalibration was added to sdhci driver somehow it was enabled=20
only for T30/T210/T186/T194.

tegra_sdhci_parse_pad_autocal_dt() was added when auto-calibration was=20
added to driver and I see this dt parse is being done irrespective of=20
NVQUIRK_HAS_PADCALIB quirk so even on platforms without auto cal enabled=20
in driver, these messages shows up.

This should be fixed in driver to allow=20
tegra_sdhci_parse_pad_autocal_dt() only when NVQUIRK_HAS_PADCALIB is set=20
to avoid dt parsing to happen on platforms that don't have auto cal enabled=
.

