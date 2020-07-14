Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC9A21EAFA
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 10:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgGNIIG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 04:08:06 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16320 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgGNIIF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 04:08:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0d67740000>; Tue, 14 Jul 2020 01:06:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 01:08:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 01:08:05 -0700
Received: from [10.26.72.103] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 08:08:03 +0000
Subject: Re: [PATCH] ALSA: hda: Enable sync-write operation as default for all
 controllers
To:     Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20200618144051.7415-1-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8fc9f086-9a34-4287-8f51-6e0ebc34928f@nvidia.com>
Date:   Tue, 14 Jul 2020 09:08:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618144051.7415-1-tiwai@suse.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594713972; bh=wXjtpt92lXHea/LvRhP9pH3OyC9jJX6GLMwk3vi+S1A=;
        h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iHgksAVauWoPQ40HWwaxzIuoG0KE3XXZciaiFVy6yU6i2SeECKMnO+9tsSvJij7XU
         TL3Pqea7hv4Gz4nySMW17yE+hBwrpd2LFGoBmwAbiebOi/9akqiOoLCveH+KML/0Dj
         y+lvQdOX8+/XwHz3wPB3BiFYSmTfB7WIqWBEt2/hzTFRnZC1+OOWQyf28+EbRCzs9Y
         AO5/HxbSBoNzhXadqbDDhUX2MILzGnFEVeVdKrlLFpeLmj8Y5xk+h1J4SJg6J54U+g
         fm1FYy4BspXCcty5BpQ/4Hyg/Xc/R9eLBZsjRmm8LMvcRf+8hyB6Kl+vj7dKyaVIaa
         rczsxXIwQ5l5A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Takashi,

On 18/06/2020 15:40, Takashi Iwai wrote:
> In the end we already enabled the sync-write mode for most of HD-audio
> controllers including Intel, and it's no big merit to keep the async
> write mode for the rest.  Let's make it as default and drop the
> superfluous AZX_DCAPS_SYNC_WRITE bit flag.
> 
> Also, avoid to set the allow_bus_reset flag, which is a quite unstable
> and hackish behavior that was needed only for some early platforms
> (decades ago).  The straight fallback to the single cmd mode is more
> robust.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>


I have noticed a regression in HDA playback on our Tegra186 Jetson TX2
platform. Bisect is pointing to this patch and reverting this does
appear to fix it. Interestingly, I am not seeing any problems on other
Tegra platforms, however, Tegra186 does have the IOMMU enabled for HDA
which is one different between the other platforms.

We can take a closer look at this for Tegra, but I am wondering if we
revert this for Tegra for now.

Cheers
Jon

-- 
nvpublic
