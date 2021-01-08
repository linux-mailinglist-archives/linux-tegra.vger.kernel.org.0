Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290E32EEE39
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Jan 2021 09:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhAHIAw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Jan 2021 03:00:52 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9873 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHIAw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 03:00:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ff8110b0003>; Fri, 08 Jan 2021 00:00:11 -0800
Received: from [10.25.98.33] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 8 Jan
 2021 08:00:06 +0000
Subject: Re: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Prashant Gaikwad" <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohan Kumar <mkumard@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Ion Agorria <ion@agorria.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
 <20201225012025.507803-3-pgwipeout@gmail.com>
 <0c3665b2-bac6-546a-bdd4-0ab7a90adf7c@nvidia.com>
 <CAMdYzYraT5AXzyscN3Pa+0FWZwHFsD-4ZwbA80kNxgtn7Y1PXw@mail.gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <b3a3ede2-22d5-b13d-f245-7c3b40ea411a@nvidia.com>
Date:   Fri, 8 Jan 2021 13:30:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMdYzYraT5AXzyscN3Pa+0FWZwHFsD-4ZwbA80kNxgtn7Y1PXw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610092811; bh=tAX7+nwrhbWHTaFDYsrLY7TV7AsIei6JzO5pznTK/EY=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=bVvAn6XMiAZ7FoTF4OYFwB8L3AnCfRZgNwnpAWTwq9iSt9JPgLv0hKIvDEi8xr8lQ
         laUYCy+WEWqF1ED0lhDotEwuMGmsiMEXe4bD6D7pLqVems6d7NQ1MaoceT9HHi6S28
         v9peEUWyStRs/KnaepmCvucDQ6yfUdK7HadQ3Sj4Ahyk7ma4QxN3eH21eoUd6zilMn
         Z95vNauSua3gmlKEuJEUMk2qj+ChuLK0NS9bRnPgN/IC3LE7KRH5MMpKmnn/Dkcs81
         C6hDOkSU+Xhj4hJldLe5pFoBhGdHHsqS9y9gOWy1mTyd1SebKlo/bjI5KTdVg9z9NU
         ecaVWzLmv8wmw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/7/2021 2:51 AM, Peter Geis wrote:
> External email: Use caution opening links or attachments
>
>
> On Tue, Jan 5, 2021 at 1:30 AM Sameer Pujar <spujar@nvidia.com> wrote:
>>
>>
>> On 12/25/2020 6:50 AM, Peter Geis wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> Currently hda on tegra30 fails to open a stream with an input/output er=
ror.
>>> This is similar to the issue referenced in [1].
>>>
>>> For example:
>>> speaker-test -Dhw:0,3 -c 2
>>>
>>> speaker-test 1.2.2
>>>
>>> Playback device is hw:0,3
>>> Stream parameters are 48000Hz, S16_LE, 2 channels
>>> Using 16 octaves of pink noise
>>> Rate set to 48000Hz (requested 48000Hz)
>>> Buffer size range from 64 to 16384
>>> Period size range from 32 to 8192
>>> Using max buffer size 16384
>>> Periods =3D 4
>>> was set period_size =3D 4096
>>> was set buffer_size =3D 16384
>>>    0 - Front Left
>>> Write error: -5,Input/output error
>>> xrun_recovery failed: -5,Input/output error
>>> Transfer failed: Input/output error
>>>
>>> [1] states "Due to a legacy HW design problem", implying the issue appl=
ies to all previous tegra-hda devices.
>>> The tegra-hda device was introduced in tegra30 but only utilized in teg=
ra124 until now.
>>> For this reason it is unknown when this issue first manifested.
>>>
>>> Applying the fix in [1] universally resolves this issue on tegra30.
>>> Tested on the Ouya game console and the tf201 tablet.
>>>
>>> [1] 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on Tegr=
a194")
>> This issue was never seen on Tegra210/Tegra186 and hence at that time it
>> was thought to be specific to Tegra194. I never tested this on Tegra30
>> since I don't have this device. I will clarify this with HW folks if
>> workaround is safer for all chips.
> So this is confirmed to not affect Tegra210 and Tegra186, but it does
> affect Tegra194 and Tegra30.
> Is it possible for the hardware team to pitch on on where the fix was
> implemented?

I discussed this with HW team. The issue is applicable to all Tegra chips.

Below is the striping formula referenced from HD audio spec.
 =C2=A0 { ((num_channels * bits_per_sample) / number of SDOs) >=3D 8 }

The current issue is seen because Tegra HW has a problem with boundary=20
condition (=3D 8) for striping. The reason why it is not seen on=20
Tegra210/Tegra186 is because it uses max 2SDO lines. Max SDO lines is=20
read from GCAP register.

For the given stream (channels =3D 2, bps =3D 16);
ratio =3D (channels * bps) / NSDO =3D 32 / NSDO;

On Tegra30,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ratio =3D 32/4 =3D 8=C2=A0 (FAIL)
On Tegra210/186, ratio =3D 32/2 =3D 16 (PASS)
On Tegra194,=C2=A0=C2=A0=C2=A0=C2=A0 ratio =3D 32/4 =3D 8=C2=A0 (FAIL) =3D=
=3D> Earlier workaround was=20
applied for it

If Tegra210/186 is forced to use 4SDO, it fails there as well. So the=20
behavior is consistent across all these chips.

>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> Tested-by: Ion Agorria <ion@agorria.com>
>>> ---
>>>    sound/pci/hda/hda_tegra.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
>>> index 70164d1428d4..f8d61e677a09 100644
>>> --- a/sound/pci/hda/hda_tegra.c
>>> +++ b/sound/pci/hda/hda_tegra.c
>>> @@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, s=
truct platform_device *pdev)
>>>            * in powers of 2, next available ratio is 16 which can be
>>>            * used as a limiting factor here.
>>>            */
>>> -       if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
>>> -               chip->bus.core.sdo_limit =3D 16;
>>> +       chip->bus.core.sdo_limit =3D 16;
>> Future Tegra chips address this problem and hence cannot be enforced by
>> default. May be we can have like below:
>>
>> if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>> chip->bus.core.sdo_limit =3D 16;
>>
> It will need to be a bit more complicated than that, since the
> tegra186 and tegra210 device trees have "nvidia,tegra30-hda" as a
> fallback.
> Looking at the generation map, tegra30-hda can be the fallback for the
> broken implementation and tegra210-hda can be the fallback for the
> working implementation.
> Does that work for you?

As per above explanation, it is fine to apply the workaround for=20
Tegra210/186 as well. So it simplifies things for all existing chips.

>>>           /* codec detection */
>>>           if (!bus->codec_mask) {
>>> --
>>> 2.25.1
>>>

