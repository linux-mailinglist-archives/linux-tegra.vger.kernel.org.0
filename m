Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1997FBB3
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Aug 2019 16:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729620AbfHBOFP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 2 Aug 2019 10:05:15 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7870 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbfHBOFP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Aug 2019 10:05:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4443240000>; Fri, 02 Aug 2019 07:05:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 02 Aug 2019 07:05:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 07:05:15 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Fri, 2 Aug 2019 14:05:14 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 537EA40DF8; Fri,  2 Aug 2019 17:05:12 +0300 (EEST)
Date:   Fri, 2 Aug 2019 17:05:12 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Mark Brown" <broonie@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] soc/tegra: regulators: Add regulators coupler for
 Tegra30
Message-ID: <20190802140512.GD3883@pdeschrijver-desktop.Nvidia.com>
References: <20190725151832.9802-1-digetx@gmail.com>
 <20190725151832.9802-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190725151832.9802-4-digetx@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564754724; bh=4T40FxzWga3LbNPFV+QKshbSr6vY3IQ06h0Men8HJ24=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=Dkl004srNhOkuivE2fGUwLql8dZNBYo49DqQdSe6IH0rxWhuzuke+kF25uM/GXm0w
         JcD+8ygRTNScG2Sdctgvg1KuAbwS/RpKmDp+khLiDU0/dv1FuvMAhWlXqqdazZjI/F
         SZvtskJ8QXsnqSySjCRekP+iswUqfcFROzP+v6gtuD2NMWgzfCmM0QmaUIJPQLqt/U
         cP+zScMJzcxCgG5epYh0lZdYoB20161MpAkRyTwzuly0B7UprQw49AE9T2imMIKLyZ
         AmNbFVblTo6xvb+CvZbOsbOVIIBVHQqSqw3LBib5mh5cSGNbDBcfA7zfmc1u0+Pmyd
         yfeenziXqPhRQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 25, 2019 at 06:18:32PM +0300, Dmitry Osipenko wrote:
> Add regulators coupler for Tegra30 SoCs that performs voltage balancing
> of a coupled regulators and thus provides voltage scaling functionality.
> 
> There are 2 coupled regulators on all Tegra30 SoCs: CORE and CPU. The
> coupled regulator voltages shall be in a range of 300mV from each other
> and CORE voltage shall be higher than the CPU by N mV, where N depends
> on the CPU voltage.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig              |   4 +
>  drivers/soc/tegra/Makefile             |   1 +
>  drivers/soc/tegra/regulators-tegra30.c | 316 +++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/soc/tegra/regulators-tegra30.c
> 
...

> +
> +static int tegra30_core_cpu_limit(int cpu_uV)
> +{
> +	if (cpu_uV < 800000)
> +		return 950000;
> +
> +	if (cpu_uV < 900000)
> +		return 1000000;
> +
> +	if (cpu_uV < 1000000)
> +		return 1100000;
> +
> +	if (cpu_uV < 1100000)
> +		return 1200000;
> +
> +	if (cpu_uV < 1250000) {
> +		switch (tegra_sku_info.cpu_speedo_id) {
> +		case 0 ... 1:
Aren't we supposed to add /* fall through */ here now?
> +		case 4:
> +		case 7 ... 8:
> +			return 1200000;
> +
> +		default:
> +			return 1300000;
> +		}
> +	}
> +

Other than that, this looks ok to me.

Peter.
