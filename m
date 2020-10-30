Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F032C29FDE1
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Oct 2020 07:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgJ3GfR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 30 Oct 2020 02:35:17 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19307 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgJ3GfQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Oct 2020 02:35:16 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9bb4290001>; Thu, 29 Oct 2020 23:35:21 -0700
Received: from [10.25.99.37] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 06:35:08 +0000
Subject: Re: [PATCH v4 00/15] Audio graph card updates and usage with Tegra210
 audio
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <c98d63a7-f311-a94f-abcc-1c5a87ba8025@nvidia.com>
Date:   Fri, 30 Oct 2020 12:04:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604039721; bh=ycvf4n5KD1xsLuNvIWPme1ipDvYuSNjDWB6qo9gxrm0=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
         Content-Language:X-Originating-IP:X-ClientProxiedBy;
        b=OFw85CW5ZHPXwP2yMStP6E8VJZGIr7gva0pPhFEPMqhFXd/kbLi0yx6xXFBnoiCj9
         scstZc7uTWQBYHCxC8lcqQvSxa4QZjYOsH0nCbPxZP30C1tbMIRl2cfXcQR8FDH7J7
         c3LBaUOOEcLZICdBXB2ZWKYqIB0Vc6Hm0VA6gnyPJ0lwP430wVX1CippU+vVpVOfsj
         ZeYmF3TXY030eMT1m/uhVd5gD3VKLp3T3YWWoKdtkHafIiVd07tdhHDA8zzT/VZcaD
         VECCUJqlDuilUr3l2JwuUEO4h5EUdu1lBW0j4lR3DRHIf/oiYZwv1MhV/OhUJA65UR
         CJqGl6OxIyi0g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mark, Morimoto-san,

> Summary of changes:
>   * Support multiple instances of a component. For example there can be
>     multiple I2S devices which can use the same component driver.
>
>   * Support open platforms with empty Codec endpoint. Customers can plug
>     their own HW and can populate codec endpoint.
>
>   * In a component model there can be many components which can be
>     connected togethe. In such cases Identify no-pcm DPCM DAI links which
>     can be used in BE<->BE connections.
>
>   * Add Tegra audio graph driver which is based on generic audio graph
>     driver and specific customizations are done in Tegra driver.
>
>   * This pushes DT support for Tegra210 based platforms which uses
>     audio-graph card and above enhancements.
>
> The series is based on following references where DPCM usgae for Tegra
> Audio and simple-card driver proposal were discussed.
>
>   * https://lkml.org/lkml/2020/4/30/519 (DPCM for Tegra)
>   * https://lkml.org/lkml/2020/6/27/4 (simple-card driver)
>
> Changelog
> =========
>
> v3 -> v4
> --------
>   * Added new patches to convert graph.txt and audio-graph-card.txt
>     to corresponding json-schema files. Later these references
>     are used in Tegra audio graph schema.
>
>   * AHUB component binding docs are updated to reflect the usage
>     of ports/port/endpoint
>
>   * More common stuff is moved into graph_parse_of() and this is
>     used by both generic and Tegra audio graph.
>
>   * DT binding for Tegra audio graph is updated to included "ports { }"
>
>   * As per the suggestion 'void *data' member is dropped from
>     'asoc_simple_priv' and instead container method is used to
>     maintain required custom data internal to Tegra audio graph.
>
> v2 -> v3
> --------
>   * Dropped new compatible addition in generic graph driver
>     after reviewing it with Morimoto-san. Instead added Tegra
>     audio graph driver and new compatibles are added in the same.
>   * Added new patches to expose new members for customization
>     in audio graph driver.
>   * Added new patch for Tegra audio graph driver and related
>     documentation.
>   * Minor change in below commit where mutex version of helper is used
>     "ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM"
>   * DT binding is updated to use the newly exposed compatibles
>   * No changes in other patches
>
> v1 -> v2
> --------
>   * Re-organized ports/endpoints description for ADMAIF and XBAR.
>     Updated DT patches accordingly.
>   * After above change, multiple Codec endpoint support is not
>     required and hence dropped for now. This will be considered
>     separately if at all required in future.
>   * Re-ordered patches in the series.

>
> Sameer Pujar (15):
>    ASoC: soc-core: Fix component name_prefix parsing
>    ASoC: soc-pcm: Get all BEs along DAPM path
>    ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
>    ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
>    ASoC: audio-graph: Support empty Codec endpoint
>    ASoC: audio-graph: Expose new members for asoc_simple_priv
>    ASoC: audio-graph: Expose helpers from audio graph

Would you suggest to keep above in a separate series and thus not 
blocked by below doc updates? If so do I need to resend above in a next 
revision or if these are good to be picked up?

>    Documentation: of: Convert graph bindings to json-schema
>    ASoC: dt-bindings: audio-graph: Convert bindings to json-schema
>    ASoC: dt-bindings: tegra: Add graph bindings
>    ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card

Documentation patches in the series have some dependency over 
Morimoto-san's audio-graph series 
https://patchwork.kernel.org/project/alsa-devel/list/?series=372759. I 
will update doc related patches once dependency is merged.

>    ASoC: tegra: Add audio graph based card driver
>    arm64: defconfig: Enable Tegra audio graph card driver
>    arm64: tegra: Audio graph header for Tegra210
>    arm64: tegra: Audio graph sound card for Jetson Nano and TX1
