Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718BBE44D7
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 09:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437278AbfJYHsS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 03:48:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13036 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJYHsS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 03:48:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db2a8ca0000>; Fri, 25 Oct 2019 00:48:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 25 Oct 2019 00:48:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 25 Oct 2019 00:48:17 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:48:17 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 07:48:15 +0000
Subject: Re: [PATCH v5 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Mark Brown <broonie@kernel.org>
CC:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-kernel@lists.codethink.co.uk>,
        "Edward Cragg" <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-4-ben.dooks@codethink.co.uk>
 <2eef499e-d9d4-732a-ddd6-8d307d8cb08d@nvidia.com>
 <20191024191846.GJ46373@sirena.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <549a97c6-ff73-abe0-7c2b-7f29f975e259@nvidia.com>
Date:   Fri, 25 Oct 2019 08:48:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024191846.GJ46373@sirena.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571989706; bh=woREg5ZGPYnyjcnXQe0LrTdl/bxEh/wloZDheV0D1f0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lAP1Sj08gBAXtiugJ6WTIE8CLP4n9lYXObLhwkh/u+CjgIrSBYhHBKRuNSNHk7I0d
         hyVYa8Vs26OvXdEpn9lVMA7ywtL0EFGnsn8K7LxrmUr50YpVfbhbzTZbg3VcS5Oj8z
         ubr/WnheSJ0i8UPEU75nrsnBdlVCXss827oaornGWrgwpdo/egbyv7aF2FNS8s6URF
         voGrdxAS1kRj1h+suyrRhlIDkOBz/YLSD4JfPdl28NpD9Rj/bE3PYJ3gt2CF77D8ZG
         7FOkKalxBTqfKmV7OsyjoruqEckbo6/iPQApRQsOjd0/5FHGrBYxT1ptD2jufF99/h
         HtEF7LGoCxSEQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/10/2019 20:18, Mark Brown wrote:
> On Thu, Oct 24, 2019 at 05:12:21PM +0100, Jon Hunter wrote:
>> On 18/10/2019 16:48, Ben Dooks wrote:
> 
>>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
>>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>>  	case SND_SOC_DAIFMT_DSP_A:
>>> +		ch_val = TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE;
> 
>> Sorry, I just saw the feedback on the previous iteration. I don't think
>> we want to set the polarity but based upon the format that is passed ...
> 
> The polarity should be set based on the the inversion flags in the
> format, normally both DSP modes trigger on the rising edge of the LRCLK.
> The difference is if there's a delay before the first data bit or not.

Yes. Sorry I realise my email was not clear and when I meant format, I
was referring to the bits in the format mask part of the format. In the
example, I shared we use the inversion bits for the determining the
polarity. There was an old version of one of our drivers where we had
done this incorrectly.

Cheers
Jon

-- 
nvpublic
