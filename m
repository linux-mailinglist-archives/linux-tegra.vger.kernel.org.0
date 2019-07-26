Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A07E76E76
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jul 2019 18:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfGZQEq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jul 2019 12:04:46 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:63748 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfGZQEq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jul 2019 12:04:46 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45wDQL2M4szB2;
        Fri, 26 Jul 2019 18:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1564157003; bh=q0otr/lKVYk8Vw94f1khvqK934TypKC8T264nuUJhyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W6ZsDhbGgytuC3eE4wxZAGUGtoVaBDMNE39oasiDVLypGr3Vozr8P+8YoU3aX5lMj
         yh1+ENgQ6ii4Z0bTIvsQaagyr6VEobkQRqWZAR9YdN5bsKDwY7+gx4tdriWWWfTyFS
         7vvzbOx9tFjTAExRaF06FSQGNps9RykfX0BVopGs9PW3jRAG1oVUNSZw0NGvGTvWLS
         ONX92eAtJ3fCnqMA+qQpYyDTS1XXWV4vBUSLyVBI7a4K4JGgbDFZkKxoiVGNUTPErc
         Gv2IFp19gNZ/bFRVU7uWUoCXO4K1jLCI2AcpYcZ7CZXonsCNVyiMy9rqgvC694+X0a
         g95lBQ+tFP1FA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Fri, 26 Jul 2019 18:04:42 +0200
From:   mirq-test@rere.qmqm.pl
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Message-ID: <20190726160442.GA22187@qmqm.qmqm.pl>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 26, 2019 at 12:16:16PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The control back-bone (CBB) starts at physical address 0, so give it a
> unit-address to comply with standard naming practices checked for by the
> device tree compiler.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
>  .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> index 62e07e1197cc..02f6a8f0d741 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -8,17 +8,17 @@
>  	compatible = "nvidia,p2888", "nvidia,tegra194";
>  
>  	aliases {
> -		sdhci0 = "/cbb/sdhci@3460000";
> -		sdhci1 = "/cbb/sdhci@3400000";
> +		sdhci0 = "/cbb@0/sdhci@3460000";
> +		sdhci1 = "/cbb@0/sdhci@3400000";
>  		serial0 = &tcu;
>  		i2c0 = "/bpmp/i2c";
> -		i2c1 = "/cbb/i2c@3160000";
> -		i2c2 = "/cbb/i2c@c240000";
> -		i2c3 = "/cbb/i2c@3180000";
> -		i2c4 = "/cbb/i2c@3190000";
> -		i2c5 = "/cbb/i2c@31c0000";
> -		i2c6 = "/cbb/i2c@c250000";
> -		i2c7 = "/cbb/i2c@31e0000";
> +		i2c1 = "/cbb@0/i2c@3160000";
> +		i2c2 = "/cbb@0/i2c@c240000";
> +		i2c3 = "/cbb@0/i2c@3180000";
> +		i2c4 = "/cbb@0/i2c@3190000";
> +		i2c5 = "/cbb@0/i2c@31c0000";
> +		i2c6 = "/cbb@0/i2c@c250000";
> +		i2c7 = "/cbb@0/i2c@31e0000";
>  	};
[...]

There are aliases in tegra194.dtsi like gen1_i2c, maybe they could
be used here?

Best Regards,
Micha³ Miros³aw
