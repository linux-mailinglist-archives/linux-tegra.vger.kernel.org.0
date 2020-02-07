Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD4F155695
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Feb 2020 12:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgBGLX4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Feb 2020 06:23:56 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10542 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGLXz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Feb 2020 06:23:55 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3d488f0000>; Fri, 07 Feb 2020 03:22:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Feb 2020 03:23:54 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:23:54 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:23:49 +0000
CC:     <spujar@nvidia.com>, "perex@perex.cz" <perex@perex.cz>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sharadg@nvidia.com" <sharadg@nvidia.com>,
        "mkumard@nvidia.com" <mkumard@nvidia.com>,
        "viswanathl@nvidia.com" <viswanathl@nvidia.com>,
        "rlokhande@nvidia.com" <rlokhande@nvidia.com>,
        "dramesh@nvidia.com" <dramesh@nvidia.com>,
        "atalambedu@nvidia.com" <atalambedu@nvidia.com>
Subject: Re: [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S driver
To:     David Laight <David.Laight@ACULAB.COM>,
        'Dmitry Osipenko' <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
 <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <bea2a750-3ef0-21ab-a8ac-d76b6d1a23e0@nvidia.com>
Date:   Fri, 7 Feb 2020 16:53:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581074575; bh=ZddZAhdQ+7CGcCBN+PpuH4oNPpiNVDulArnMHC1dZrI=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=ehVM/iIZ7eZPVLh7aunXLnqExOarktq9fSo597dkmZXz32g65RggQW3VFIk3s0h5f
         NN3TrRsEuffMhKs4TLRMbwt8o7f+4F7FG7N1kskfmk0uDsCRkUS1PqC0QNfPv+xcpt
         dbmYHdAbwUz/BdLKHgjRgXbo+7F3iBvp77kewxVbmIezWY101ME0vEa9Qd6eUzLq17
         YBSZFjSwqcDK8/mejHIbI5CoCy7q2f3lBZFTNvGvj2hO7wm7i+ewWnUe1Wp7XHwf6b
         Rm3H9D35dIqONnO2T16SJbkVfQcNizG5P39oM2M02FXAuN+nTQMhI94UsiTbo0zxQw
         deDxvOCBNXfiw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/6/2020 10:36 PM, David Laight wrote:
> External email: Use caution opening links or attachments
>
>
> From: f Dmitry Osipenko
>> Sent: 06 February 2020 16:59
>>
>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>> +static const int tegra210_cif_fmt[] =3D {
>>> +   0,
>>> +   TEGRA_ACIF_BITS_16,
>>> +   TEGRA_ACIF_BITS_32,
>>> +};
>>> +
>>> +static const int tegra210_i2s_bit_fmt[] =3D {
>>> +   0,
>>> +   I2S_BITS_16,
>>> +   I2S_BITS_32,
>>> +};
>>> +
>>> +static const int tegra210_i2s_sample_size[] =3D {
>>> +   0,
>>> +   16,
>>> +   32,
>>> +};
>> static const *unsigned* int?
> Or get rid of the table lookups completely.
> Assuming the index is never zero then the value
> can be calculated as (const_a + const_b * index).

All above tables are mapped to tegra210_i2s_format_text[].=20
Additions/removal of entries will require changes in equation. It is=20
better keep the mapping as it is.
>
>          David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)

