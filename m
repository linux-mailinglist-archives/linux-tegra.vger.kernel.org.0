Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD1F1514F6
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 05:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgBDE3i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Feb 2020 23:29:38 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11538 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbgBDE3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Feb 2020 23:29:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e38f2f80000>; Mon, 03 Feb 2020 20:28:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Feb 2020 20:29:36 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:29:36 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:29:31 +0000
CC:     <spujar@nvidia.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>
Subject: Re: [PATCH v2 5/9] ASoC: tegra: add Tegra210 based AHUB driver
To:     Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <robh+dt@kernel.org>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
 <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <125e08ae-8800-a81c-078e-e785ca9d4eaf@nvidia.com>
Date:   Tue, 4 Feb 2020 09:59:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580790520; bh=wVpdIIs0547yQaMYO5AyL0NeEChuyPF6vnSMSMeoo7g=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Ecu5oqfHFKQhPHd263g8ghyvlryujc4E3xVUcTEp8RIWvBWxO3WqcC07dSxuYUWUD
         v5IuluCuxfOkqsw4yYZUnBBfccDyKyquxFoYWgNPj5NgbR83gP6p2q4hVaKRJUlzNn
         3BXQrprR4i8pSH2DVq4dtrlzFZZGTW8yHj7rnQg9Ri/c23rTgXKdGCpz483ON58Znr
         zTCexRKVA7/S8EYI4BghHxywyC1d9wrP/kCIv3QnYjWwqGvShQe7Ik+U7MSP294GvL
         nCg4hmjikgqa4A0PiVSIMR8RiytNgLkwgl5udDg5SnP3EpjVKDkRCCCU2dakBR07BW
         zSfYDB+9fgeRg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/30/2020 9:52 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int tegra_ahub_probe(struct platform_device *pdev)
>> +{
>> +     struct tegra_ahub *ahub;
>> +     void __iomem *regs;
>> +     int ret;
>> +
>> +     ahub =3D devm_kcalloc(&pdev->dev, 1, sizeof(*ahub), GFP_KERNEL);
>> +     if (!ahub)
>> +             return -ENOMEM;
> ahub =3D devm_kzalloc(&pdev->dev, sizeof(*ahub), GFP_KERNEL);

Earlier I had the impression that it won't memset it to 0. Now looking=20
at the implementation I see that it uses '__GFP_ZERO' flag, which I=20
think would initialize it to '0'. Will update. Thanks.

