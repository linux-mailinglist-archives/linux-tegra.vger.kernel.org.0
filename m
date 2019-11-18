Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59681004CB
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKRL4L (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:56:11 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8838 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfKRL4K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:56:10 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd286da0000>; Mon, 18 Nov 2019 03:56:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 03:56:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 03:56:10 -0800
Received: from [10.26.11.241] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 11:56:08 +0000
Subject: Re: [PATCH 3/3] soc/tegra: pmc: Add reset sources and levels on
 Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
 <20191118063348.1816857-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9da23ccc-0e37-44a8-b722-690c047b9641@nvidia.com>
Date:   Mon, 18 Nov 2019 11:56:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118063348.1816857-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574078170; bh=q7awpy+Rp+fdN4MSztFN6PEm+Y7sz6Lko4O9XbKHH4s=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UFKVaxIiXWEcyplpVlIzppo+PRq1gVcJkvHz4UPDvd4Po6p0GAEPbsEFS2z4Rb0cg
         bE07mXovZBK36x/Cy2rgjnSKqKd51kXAR/bCaPeGGvfgYpMb5Aabi4spJfCmBYR1i8
         d6XzL5UWRTsyoa/ordkcnm+Bdhu6To6q8nVPuneoqAcJP9QdtqHbjVMq4UQmWjqaiP
         y9p6pmPZH+Fu2/PnguDCpWmplhyE9xFclJdwPaAiFHhq5qiKLVaBAz+cy3QDwO9CP8
         1NsGuTeD2RoitmiORqHz2BBo9czB1+y8/yI1NWva70nv2QvkbczHg8EyUIcfYNmpPC
         ANXSkhhfk/9Bw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/11/2019 06:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra194 supports the same reset levels as Tegra186 but extends the set
> of reset sources. Provide custom PMC register definitions to account for
> the larger field for the reset sources as well as the updated list of
> reset sources.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 32b3e8d9155f..63195281718d 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2927,6 +2927,43 @@ static const struct tegra_io_pad_soc tegra194_io_pads[] = {
>  	{ .id = TEGRA_IO_PAD_AUDIO_HV, .dpd = 61, .voltage = UINT_MAX },
>  };
>  
> +static const struct tegra_pmc_regs tegra194_pmc_regs = {
> +	.scratch0 = 0x2000,
> +	.dpd_req = 0x74,
> +	.dpd_status = 0x78,
> +	.dpd2_req = 0x7c,
> +	.dpd2_status = 0x80,
> +	.rst_status = 0x70,
> +	.rst_source_shift = 0x2,
> +	.rst_source_mask = 0x7c,
> +	.rst_level_shift = 0x0,
> +	.rst_level_mask = 0x3,
> +};
> +

You added the regs here, but ...

> +static const char * const tegra194_reset_sources[] = {
> +	"SYS_RESET_N",
> +	"AOWDT",
> +	"BCCPLEXWDT",
> +	"BPMPWDT",
> +	"SCEWDT",
> +	"SPEWDT",
> +	"APEWDT",
> +	"LCCPLEXWDT",
> +	"SENSOR",
> +	"AOTAG",
> +	"VFSENSOR",
> +	"MAINSWRST",
> +	"SC7",
> +	"HSM",
> +	"CSITE",
> +	"RCEWDT",
> +	"PVA0WDT",
> +	"PVA1WDT",
> +	"L1A_ASYNC",
> +	"BPMPBOOT",
> +	"FUSECRC",
> +};
> +
>  static const struct tegra_wake_event tegra194_wake_events[] = {
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
>  	TEGRA_WAKE_IRQ("rtc", 73, 10),
> @@ -2949,6 +2986,10 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
>  	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
>  	.irq_set_wake = tegra186_pmc_irq_set_wake,
>  	.irq_set_type = tegra186_pmc_irq_set_type,
> +	.reset_sources = tegra194_reset_sources,
> +	.num_reset_sources = ARRAY_SIZE(tegra194_reset_sources),
> +	.reset_levels = tegra186_reset_levels,
> +	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
>  	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events = tegra194_wake_events,
>  };

.. but does not look like you updated the above to use the new register
struct. Looks like it still uses the Tegra186 regs.

Jon

-- 
nvpublic
