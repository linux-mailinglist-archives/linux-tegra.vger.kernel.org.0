Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1462B23E681
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Aug 2020 06:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgHGEFT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Aug 2020 00:05:19 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17455 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgHGEFS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Aug 2020 00:05:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2cd2cc0000>; Thu, 06 Aug 2020 21:04:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 06 Aug 2020 21:05:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 06 Aug 2020 21:05:18 -0700
Received: from [10.2.172.190] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 04:05:17 +0000
Subject: Re: [PATCH v9 08/10] gpu: host1x: mipi: Keep MIPI clock enabled and
 mutex locked till calibration done
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1596740494-19306-1-git-send-email-skomatineni@nvidia.com>
 <1596740494-19306-9-git-send-email-skomatineni@nvidia.com>
 <f2522713-6995-d6a1-e691-a5443823056b@gmail.com>
 <7ef2a6dd-d220-ff47-e6ef-7443a1779fae@nvidia.com>
 <a0a187d3-04e9-88d9-5146-1448d4bd79e9@nvidia.com>
 <54e01160-4041-f8fa-065d-f635e8d69e2f@nvidia.com>
 <7c47b165-8663-87f0-bff5-37036d472fb9@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <ecf679f8-e08b-3297-2d33-1e5737c92982@nvidia.com>
Date:   Thu, 6 Aug 2020 21:05:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c47b165-8663-87f0-bff5-37036d472fb9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596773068; bh=TdvaX7h//x/UTjwiPedljow/na1Blr25QNq9fFRxWsw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=WTGuEIRZhAbj+5dDCcLMffChRu57HUpZnKj96V6tdscVvEv06VwzGn1L/IH7ZaYoD
         /bTUX8wIHLXxcAknqyPAuZ5/vUcO9OegBVcdqJ6VX1Iko8eridFSUZre8EQrLPl4uD
         1pZLC+IWXXanHcS38CQkanCOiqjOH2HECUMgDKApdZuDGlQRcAFyKbrbKEv2NHGOMS
         7n+zEsPbrLLWRwQ1Ate4pI4C0yJWx2WhFNd6Db+sbqDMxbgLS5goK4pLfV//GnXqLJ
         Ud63Cpq3QspAKrzSpm+xkZYfkbFubambzwGagVhoVOW4Nia6Sjjj1dTiUuEvK6/6e0
         llanf/e/CNfjg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 8/6/20 9:01 PM, Dmitry Osipenko wrote:
> 07.08.2020 06:18, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 8/6/20 8:14 PM, Sowjanya Komatineni wrote:
>>> On 8/6/20 8:10 PM, Sowjanya Komatineni wrote:
>>>> On 8/6/20 7:31 PM, Dmitry Osipenko wrote:
>>>>> 06.08.2020 22:01, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> ...
>>>>>> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>>>>>>  =C2=A0 {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_mipi_soc *soc =3D=
 device->mipi->soc;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i;
>>>>>> @@ -381,12 +375,16 @@ int tegra_mipi_calibrate(struct
>>>>>> tegra_mipi_device *device)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D MIPI_CAL_CTRL_START;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_mipi_writel(device->mipi, valu=
e, MIPI_CAL_CTRL);
>>>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 mutex_unlock(&device->mipi->lock);
>>>>>> -=C2=A0=C2=A0=C2=A0 clk_disable(device->mipi->clk);
>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Wait for min 72uS to let calibration log=
ic finish calibration
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * sequence codes before waiting for pads i=
dle state to apply the
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * results.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0 usleep_range(75, 80);
>>>>> Could you please explain why the ACTIVE bit can't be polled instead o=
f
>>>>> using the fixed delay? Doesn't ACTIVE bit represents the state of the
>>>>> busy FSM?
>>>> Based on internal discussion, ACTIVE bit gets cleared when all
>>>> enabled pads calibration is done (same time as when DONE set to 1).
>>>>
>>>> Will request HW designer to look into design and confirm exactly when
>>>> ACTIVE bit gets cleared.
>>>>
>>>> Will get back on this.
>>>>
>>> Verified with HW designer. above is correct. ACTIVE bit update happens
>>> same time as DONE bit.
>>>
>>> Active =3D !(DONE)
>>>
>>> In case of calibration logic waiting for LP-11 where done bit does not
>>> get set, ACTIVE will still be 1 and on next start trigger new
>>> calibration will start
>>>
>> Based on internal design check from designer, as long as its in waiting
>> for LP-11 stage, next calibration request can be triggered again but
>> ACTIVE bit we will see it at 1. So we should check for DONE bits to
>> confirm if calibration is done or not.
>>
>> To start next calibration, it can take effect as long as its in wait for
>> LP-11 mode.
> I meant the start_calibration() will poll the ACTIVE bit (calibration
> busy), while the finish_calibration() will poll the DONE bit
> (calibration applied).

ACTIVE bit can be 1 when previous calibration process does not see LP-11.

So there is no need to use ACTIVE bit during start of calibration.

At HW level, both ACTIVE and DONE bits get set at same time.

So waiting for ACTIVE to be 0 during start calibration instead of 7uS=20
will not work as ACTIVE bit will not become 0 after calibration sequence=20
codes and it will get updated along with DONE bits only after applying=20
results to pads which happens after seeing LP-11 on pads.


