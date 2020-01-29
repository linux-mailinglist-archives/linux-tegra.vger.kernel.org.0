Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBC314C8F5
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Jan 2020 11:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgA2Ktm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Jan 2020 05:49:42 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16401 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgA2Ktm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jan 2020 05:49:42 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3163370000>; Wed, 29 Jan 2020 02:49:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 02:49:41 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jan 2020 02:49:41 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 10:49:39 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
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
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
Date:   Wed, 29 Jan 2020 10:49:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128121315.GD4689@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580294967; bh=8oeXNa7PQw59Mhh8dYLmZBqtB+uRob3RjBpDu8t6TmE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=SyMYxB+n/w0CCa0NBzF6RBJsankibifU7BZr5i5kXPqdIP6L7RxHjMexAwZQuR8gO
         7vhJlCWz6qqDqJvnZxfThUOFxEbVysb4ZVLezWOHmn8cdole4ggIljrLrELM/y2EZ9
         VGjNWdhUEpaHEZLfhNPjL2oqHYO64PF7/eAKkhpxF8gPEYaKyPcKNLOz5dj7RCixsN
         e0kCcvcEvLZXwp/4qfe5b1/p5Vhp3v0+N8G9t0adSdI3VAzPsRPaxi40Rp13sUipwu
         B+WTZN8SdwxuIHpUC9t33r9pj/J0S4uk+ySFBXA5suhDN3CUWJ2ZWeSVm/iTrjqvhU
         owhgSrLDMd+IQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 28/01/2020 12:13, Mark Brown wrote:
> I really don't understand why this is all taking so long, this thread
> just seems to be going round in interminable circles long after it
> looked like the issue was understood.  I have to admit I've not read
> every single message in the thread but it's difficult to see why it
> doesn't seem to be making any progress.

Sorry about that. On reviewing this with the audio team at NVIDIA, I was
told we don't support S24_LE for I2S. The reason being that the crossbar
between the DMA and I2S is not able to extract the correct 24-bits from
the 32-bit sample to feed to the I2S interface. The Tegra documentation
does show support for 24-bits, but not state explicit support for S24_LE.

Now Ben says that he has this working, but I am unable to reproduce
this, so before just dropping the S24_LE support, I would like to
understand how this is working for Ben in case there is something that
we have overlooked here.

Jon

-- 
nvpublic
