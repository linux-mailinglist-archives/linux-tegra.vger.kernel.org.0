Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D371FBEBD
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 21:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgFPTHA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 15:07:00 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14456 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbgFPTHA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 15:07:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee918230000>; Tue, 16 Jun 2020 12:06:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 12:06:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 12:06:59 -0700
Received: from [10.26.75.222] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 19:06:58 +0000
Subject: Re: [PATCH 02/73] ARM: tegra: Remove simple clocks bus
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <74f8be81-216b-b69b-4517-c90d5f7d578a@nvidia.com>
Date:   Tue, 16 Jun 2020 20:06:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616135238.3001888-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592334371; bh=R2i0lM6/Q2GYNtUg/5aZk4Dq/DDByTEiEOBnYdFl5H4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=oFNo6rWySVm7C3865r6yK8ZWn6xIfYx3w+gdXGcFYy4ryJlPY70EbiVggqKD+Lzvq
         IlTsdrdNw2nMaM7o9ryVRdiQetCmnx8jm9rrM+ZHrnj545vAHlp8DaKotrv1WYg6de
         kL8cy+aJdyVwiK+QZmCTQFJ4KTHEFVuW6c9BJVZvqmg0xEsRDl4H2VwWSPyRF71et5
         hYZ/dbeYG+HSxVgTf69FlPdbkhaMIySRSeFZHQHWRS64BZDIM4imkRtpdWZfpCRUi1
         WfwI1QPuXy6hqolXR4unVaVA3R3po9II7yVxWmD6MFRRSSmDNF76Sgj7evpu5U2C4u
         EWsHTlTNNvu6g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 16/06/2020 14:51, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The standard way to do this is to list out the clocks at the top-level.
> Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra114-roth.dts       | 15 ++++-----------
>  arch/arm/boot/dts/tegra114-tn7.dts        | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 15 ++++-----------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-harmony.dts     | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-paz00.dts       | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-seaboard.dts    | 15 ++++-----------
>  arch/arm/boot/dts/tegra20-trimslice.dts   | 19 ++++++-------------
>  arch/arm/boot/dts/tegra20-ventana.dts     | 15 ++++-----------
>  arch/arm/boot/dts/tegra30-beaver.dts      | 15 ++++-----------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 15 ++++-----------
>  13 files changed, 54 insertions(+), 145 deletions(-)

...

> diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
> index 8debd3d3c20d..5b26482a55b7 100644
> --- a/arch/arm/boot/dts/tegra20-trimslice.dts
> +++ b/arch/arm/boot/dts/tegra20-trimslice.dts
> @@ -366,30 +366,23 @@ usb-phy@c5008000 {
>  		status = "okay";
>  	};
>  
> -	sdhci@c8000000 {
> +	mmc@c8000000 {
>  		status = "okay";
>  		broken-cd;
>  		bus-width = <4>;
>  	};
>  
> -	sdhci@c8000600 {
> +	mmc@c8000600 {
>  		status = "okay";
>  		cd-gpios = <&gpio TEGRA_GPIO(P, 1) GPIO_ACTIVE_LOW>;
>  		wp-gpios = <&gpio TEGRA_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  	};

I think that the above belongs in patch 13/73.

Jon
-- 
nvpublic
