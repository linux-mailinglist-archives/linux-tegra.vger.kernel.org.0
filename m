Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F4114BF66
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 19:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgA1STZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 13:19:25 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1100 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgA1STY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 13:19:24 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e307b1d0000>; Tue, 28 Jan 2020 10:19:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 10:19:23 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 Jan 2020 10:19:23 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:19:21 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Dmitry Osipenko <digetx@gmail.com>, Mark Brown <broonie@kernel.org>
CC:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-kernel@lists.codethink.co.uk>,
        <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
Date:   Tue, 28 Jan 2020 18:19:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580235549; bh=haGbRhnwYfqYm8OYOnYaS4TBQKtjm+tRkVZtCR7beeg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=b2YDan7jVhnoJbfoEICNiUrr3zwMH3xSwNsZomEUUiX4D1JJN4iAv2eZq7nNYBUb3
         syMh2miFnxtG9sm7webZD9FnIkb0QRmQsEtk5eN0RqpXFcVuKh750K6u1ciC9bA0fF
         l+Rv/+MDSEL4JmDcG5wJ8M4zKlF9u7wcOkSRBpdh4gkk7+JMEHxXwCd1ilPQgA/q3G
         jXWHrK6MlXpTY7tIrWnXzFWg3JygEkcVKx6m4Z9gzP5ZP2AmfggAh4tBfIOqf7auVV
         PoYjZpFJCs6xPLTnIltkkS0LHVWOhSktKd/oX/n3IrcywEvNvRnqXeGmGHsTfXfJ/Q
         CVzELsefxq+EQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/01/2020 17:42, Dmitry Osipenko wrote:
> 28.01.2020 15:13, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>>> 24.01.2020 19:50, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>>>                 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>>                 .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
>>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
>>
>>> It should solve the problem in my particular case, but I'm not sure tha=
t
>>> the solution is correct.
>>
>> If the format implemented by the driver is S24_3LE the driver should
>> advertise S24_3LE.
>=20
> It should be S24_LE, but seems we still don't know for sure.

Why?

>>> The v5.5 kernel is released now with the broken audio and apparently
>>> getting 24bit to work won't be trivial (if possible at all). Ben, could
>>> you please send a patch to fix v5.5 by removing the S24 support
>>> advertisement from the driver?
>>
>> Why is that the best fix rather than just advertising the format
>> implemented by the driver?
>=20
> The currently supported format that is known to work well is S16_LE.
>=20
> I'm suggesting to drop the S24_LE and S32_LE that were added by the
> applied patches simply because this series wasn't tested properly before
> it was sent out and turned out that it doesn't work well.

S32_LE should be fine, however, I do have some concerns about S24_LE.

Jon

--=20
nvpublic
