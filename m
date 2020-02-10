Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D20F157DBF
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Feb 2020 15:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgBJOtU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 10 Feb 2020 09:49:20 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10300 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgBJOtU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Feb 2020 09:49:20 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e416d300001>; Mon, 10 Feb 2020 06:48:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Feb 2020 06:49:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 06:49:19 -0800
Received: from [10.25.75.202] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 14:49:13 +0000
CC:     <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>
Subject: Re: [PATCH v2 6/9] ASoC: tegra: add Tegra186 based DSPK driver
To:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
 <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
 <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <ffff29e1-7ffb-01a0-a36a-fbc1e0604e5c@nvidia.com>
Date:   Mon, 10 Feb 2020 20:19:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581346097; bh=pGRqxh5K8EuRcbN7wmMZRcTfJvaodHRotMWQZiA3Ab0=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Lw6tOnb+ikPrnt3kc9xzVkN/YrTCIVw0uDOdwsjasTHyrKtfOX6ofYuT2/D5ijo0H
         24A7Vi9tGozF/cwHOAFqb4JFMZbhjXlzWVcF89l4acEl7Es2sH4jZWulLDOz1GscQT
         fVoFkqHPMOweMnnqq4VPaiUmAeuCT/cstefwq9Cgd7wK7gK5SBeDdzAj5WZtlQ2aqr
         YyNOKb+CQS6/omYObvyJsLqcD90X/z3VS+G/3u4K9v1LwcBer45pNdYPBXCgCpoAjp
         PGS5JCijnKZjoCoXOrSSSSMLW1Iwm3TsTlTXsea/aEn6NECDO67mFI8zTe6BFXHymT
         j923KetnGthqg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/10/2020 5:52 PM, Jon Hunter wrote:
> On 10/02/2020 11:15, Sameer Pujar wrote:
>>
>> On 2/7/2020 11:52 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 07.02.2020 14:26, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 2/6/2020 10:45 PM, Dmitry Osipenko wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> +static const struct dev_pm_ops tegra186_dspk_pm_ops =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_s=
uspend,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 te=
gra186_dspk_runtime_resume, NULL)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_fo=
rce_suspend,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_force_=
resume)
>>>>>> +};
>>>>> Could you please explain why drivers need the "late" system sleep?
>>>> It was done to ensure core drivers are suspended first and defer the
>>>> codec driver suspend
>>> Suspend order is opposite to the drivers registration order. If there i=
s
>>> no real problem with that, then you should use the default suspend
>>> level. Please don't try to fix a non-existent problems.
>> No. This was done specifically to allow sound core to first stop any
>> ongoing audio activity during normal suspend and ensure a safe suspend
>> of AHUB devices by doing a LATE suspend.
> What Dmitry is saying is that if the DSPK driver is registered after the
> sound core then we will not need to suspend in the late phase. The DSPK
> device should only be registered once the sound core is loaded, because
> otherwise we should fail to register it with the sound core. So I don't
> think we need this to be late afterall.

I was originally thinking if DMA is the main reason for using LATE=20
suspend for audio drivers as well. I did a small sanity check and=20
appears normal suspend is fine. I will update the drivers with normal=20
suspend. If we come across any issue later, it can be addressed=20
separately. Thanks Dmitry and Jon.
>
> Jon
>

