Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC83C14DB47
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 14:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgA3NJb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 08:09:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13012 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgA3NJb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 08:09:31 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e32d5560000>; Thu, 30 Jan 2020 05:08:38 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 05:09:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 05:09:30 -0800
Received: from [10.26.11.91] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 13:09:27 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
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
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
 <c01e6e09-d3ed-7c39-5a66-e25950f8bdcc@nvidia.com>
 <5898e2ed-1773-8f8f-b26b-d4613a8ad4de@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <68c35b2c-160a-0114-7265-e7ca01523ffc@nvidia.com>
Date:   Thu, 30 Jan 2020 13:09:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5898e2ed-1773-8f8f-b26b-d4613a8ad4de@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580389718; bh=vMjNIMhnnsMm3t7wZl2/ug6FswrpT9lMOEs3C10Yj9U=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UqSWE/IXPHG0gbwK7K7HVhSRKrvUaj9UgcSvmpjRjY1Tioi6e4rGSp2uiL2kf+t93
         IZo44BRPUICuwt0DoGZfduh2oI2BtC3pBzjBB/1zaKelOc/K2gC7qgJpgPskMv3M0S
         wwkN0mO4hy/FrL5mlDbnqa/UstH3p7RsgWeqtPNtIzLFVP+oWYem1eOMswbdcvIUUV
         3JjmeQ53GldcZ2TyaXk00yauYtr5jcDGQYLXY8str0sbW05eogA1tm4pbXELVQg3/2
         J1KCNqEtsyULlUiA1fRedJNlqDCsiQ4a3pXubXASEaHURLOhZXUG9R3w27wx2EvHHl
         LFXP88SML+M7g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/01/2020 12:07, Ben Dooks wrote:
> On 30/01/2020 12:05, Jon Hunter wrote:
>>
>> On 30/01/2020 08:17, Ben Dooks wrote:
>>
>> ...
>>
>>> I'll be back in the office next week to test.
>>
>> Any objections to reverting this patch now for v5.6 and pushing to
>> stable for v5.5, then getting this fixed properly for v5.7?
> 
> No, as long as it does not drag on too much.

I won't if you can address the comments previously posted for the other
patches :-)

> The other option is just to remove the announcement of these
> capabilities.

This patch is not that big and so we may as well revert.

> I think I need to check exactly what got merged and then go and
> work out a full series.

Looks like 3 of 7 patches were merged. So if we revert this, then there
are still 5 that are needed.

Cheers!
Jon

-- 
nvpublic
