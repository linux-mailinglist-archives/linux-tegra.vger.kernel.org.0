Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD721514FB
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 05:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgBDEeq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Feb 2020 23:34:46 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13044 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgBDEeq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Feb 2020 23:34:46 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e38f44e0000>; Mon, 03 Feb 2020 20:34:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Feb 2020 20:34:45 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 20:34:45 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 04:34:40 +0000
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
 <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <104d2019-6505-09b1-0e9f-bcfcdd70c18e@nvidia.com>
Date:   Tue, 4 Feb 2020 10:04:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <bd802f93-dd03-f39d-86e1-39f8571bbbb0@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580790862; bh=NSwCQ+2ljFmQNO7j63odtMCpslIrNcC8Sz110szttQU=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=lfn1MScFrfOu1ACyFaZn1We5MjYcA2OqeE0152DvpHPtGtWMqKctHUxYH25JeaKBF
         UATjyF7sC5vc2TSztTVFcCxvp1ieeFKNu3fssbwTHwKt2Jdg+Zm8AxNUfH0Vn9v4tw
         Lboh5DkBy0pSwN37H7FlUlQrfMNylAI02lwTj+I9nuHcnwyBhTLh/If6C7wFIfajdN
         E3zqngGu3aE2Tkf7i3yW9os/ZCYxWau9FUEhEiifNN1Yaa29jwktdxwOVOt/MG6cma
         JIL8csFlc2rnNhziFmWZOsBLYIL2qePFOyoabBcR8v1Ktl75WncpgqhsSBIALXz20s
         cTS/jPZT29q4Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 1/30/2020 10:39 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +     ret =3D devm_snd_soc_register_component(&pdev->dev,
>> +                                           ahub->soc_data->cmpnt_drv,
>> +                                           ahub->soc_data->dai_drv,
>> +                                           ahub->soc_data->num_dais);
>> +     if (ret < 0) {
>> +             dev_err(&pdev->dev, "failed to register component, err: %d=
\n",
>> +                     ret);
>> +             return ret;
>> +     }
> In the the patch #4 ("ASoC: tegra: add Tegra210 based I2S driver") I see
> the following:
>
>          ret =3D devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt=
,
>                                          tegra210_i2s_dais,
>                                          ARRAY_SIZE(tegra210_i2s_dais));
>          if (ret !=3D 0) {
>                  dev_err(dev, "can't register I2S component, err: %d\n", =
ret);
>                  return ret;
>          }
>
> Please be consistent in regards to errors checking. The correct variant
> should be: if (ret !=3D 0). Usually error codes are a negative value, but
> it is much safer to check whether value isn't 0 in all cases where
> positive value isn't expected to happen.

yes "if (ret)" is good enough in such cases.
>
> I'd also recommend to rename all "ret" variables to "err" everywhere in
> the code where returned value is used only for errors checking. This
> will make code more explicit, and hence, easier to read and follow.

OK, I will update it to 'err' for better.
>
> So, it will be nicer to write it as:
>
>          err =3D devm_snd_soc_register_component(&pdev->dev,
>                                          ahub->soc_data->cmpnt_drv,
>                                          ahub->soc_data->dai_drv,
>                                          ahub->soc_data->num_dais);
>          if (err) {
>                  dev_err(&pdev->dev, "failed to register component: %d\n"=
, err);
>                  return err;
>          }

