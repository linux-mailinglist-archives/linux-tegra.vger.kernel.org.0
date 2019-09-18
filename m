Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9973B5FE5
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfIRJOP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 05:14:15 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:8000 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfIRJOO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 05:14:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d81f56b0001>; Wed, 18 Sep 2019 02:14:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 02:14:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 02:14:14 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:14:13 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 09:14:11 +0000
Subject: Re: [PATCH 7/8] ASoC: tegra: config fifos on hw_param changes
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Sameer Pujar <spujar@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-8-ben.dooks@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1956fa67-c654-f719-5c7c-5e4b40d01e3a@nvidia.com>
Date:   Wed, 18 Sep 2019 10:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917181233.534-8-ben.dooks@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568798060; bh=/LlTe+oxxZpC4IvRHBKrnvBPwarRus8FwhUHq+oVQmw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VBFCdTjtCTKaw5rKPPDpAefNimfwpu6V3lrNPpifw2QCRQX326KlsO0AygYTk7V5R
         nGGYdnEJWaDP3Lp9uIEhKTFa8UOwfpdNXHlsl4c6RAR2rrE2nFlRQMfAu3Frv8wj3r
         7ojuduuLzLBjVKQOIRpU6SLvJMvYPmrLNodKjxmXlIWChBTmByFqx13nleJvzhBWZd
         TCwZXqcfjEYi0Qt1mCPFyFnmEm6gRYvDrMqOUC+BF/nJ9nxp1wMcQAQmoE3B3uAAwm
         wq8/8QspyZUvguxpgpQ72zvto4CCPUaYAa1g7kryx7W3NfsUafNRtoW8IFWA30pruJ
         eHY0mp0zmq+Qg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 17/09/2019 19:12, Ben Dooks wrote:
> If the hw_params uses a different bit or channel count, then we
> need to change both the I2S unit's CIF configuration as well as
> the APBIF one.
> 
> To allow changing the APBIF, add a call to reconfigure the RX or
> TX FIFO without changing the DMA or allocation, and get the I2S
> driver to call it once the hw params have been calculate.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 114 ++++++++++++++++++---------------
>  sound/soc/tegra/tegra30_ahub.h |   5 ++
>  sound/soc/tegra/tegra30_i2s.c  |   2 +
>  3 files changed, 69 insertions(+), 52 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
> index 952381260dc3..58e05ceb86da 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
> +			       struct tegra30_ahub_cif_conf *cif_conf)
> +{
> +	int channel = rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX0;
> +	u32 reg, val;
> +
> +	pm_runtime_get_sync(ahub->dev);
> +
> +	reg = TEGRA30_AHUB_CHANNEL_CTRL +
> +	      (channel * TEGRA30_AHUB_CHANNEL_CTRL_STRIDE);
> +	val = tegra30_apbif_read(reg);
> +	val &= ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_MASK |
> +		 TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_MASK);
> +	val |= (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_SHIFT) |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_EN |
> +	       TEGRA30_AHUB_CHANNEL_CTRL_RX_PACK_16;
> +	tegra30_apbif_write(reg, val);

Aren't you just programming the same value to the APBIF here that was
previously programmed by the allocate function? I don't see the point in
moving this? What am I missing here?

Cheers
Jon

-- 
nvpublic
