Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A615223BBB
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 14:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgGQMzm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 08:55:42 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15598 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgGQMzl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 08:55:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f119f910001>; Fri, 17 Jul 2020 05:54:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 05:55:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 05:55:40 -0700
Received: from [10.25.99.49] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 12:55:21 +0000
CC:     <spujar@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
Subject: Re: Re: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI
 link with multiple Codecs
To:     Mark Brown <broonie@kernel.org>
References: <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
 <20200630153220.GL5272@sirena.org.uk>
 <fb286ab7-21f2-43ad-2751-c76b7b6e4cf2@nvidia.com>
 <20200702122605.GE4483@sirena.org.uk>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <6194dad2-040b-c0f2-b269-571a303bbb08@nvidia.com>
Date:   Fri, 17 Jul 2020 18:25:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702122605.GE4483@sirena.org.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594990481; bh=SusogErtypZgY+TzdZS2HFWYqEUTbBJkbKRjGIuYqvc=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=CVhmyGBZcGr+Ew3ideddsTJWWsTullCZJHR3/D8XmLHsiV2Jm+4xp8TaKd7EYMTGF
         HPDeCCX45FfXcap1FcW+RZ3dJIgpCKzLjSjaj05k/WOj2HQlQBBhVEg2xVMe+xOPIn
         OQAWAYffwU1bNtxD5KfBoSZE4ILYseTTMS62kK9aSM8iki+oTGPCdj1x+MaHZA+V+B
         6hIOXD4L76hcGKwGiCgA5e/qpm8fiIPhGoKgnNYJbymhyKMyy3/CoN5FbzDmuidjhW
         hMVmKQw2wkuZjZvSAp2Vns2E+IY3rwBscDpE3q/BI87S1vc/MbvVvHBle6pUfIOPvy
         /s/Enp4rdzLoA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mark,


On 7/2/2020 5:56 PM, Mark Brown wrote:
> On Thu, Jul 02, 2020 at 04:06:14PM +0530, Sameer Pujar wrote:
>
>> For the HW I am using, there are no fixed endpoints and I am not sure if it
>> is allowed to have empty endpoints in audio-graph-card. Crossbar/router
>> provides the flexibility to connect the components in any required order.
>> Patch [05/23] exposes required graph and MUX controls for the flexible
>> configurations. Mostly, in DT, I am trying to model the component itself and
>> finally router can help me specify the audio path to interconnect various
>> components. Hence I was trying to understand if it is really necessary to
>> represent the links using audio-graph-card. Kindly help me understand what
>> more it offers. If simple-card works fine, are we allowed to use it?
> The links in the graph card should be the physical links at the edge of
> the devices, those must be fixed no matter what.

I used graph-card and could get few things working with it. Based on the 
feedback so far, I am planning to split the series as suggested and send 
two series as below.
[1] Tegra AHUB series and related DT bindings as V5.
[2] Audio graph card enhancements and related DT bindings for Tegra 
platforms as V1.

Thanks,
Sameer.


