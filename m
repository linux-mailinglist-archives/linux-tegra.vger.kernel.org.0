Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7953196D3
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Feb 2021 00:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhBKXpj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 11 Feb 2021 18:45:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:45254 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229997AbhBKXpg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Feb 2021 18:45:36 -0500
Date:   12 Feb 2021 08:44:43 +0900
X-IronPort-AV: E=Sophos;i="5.81,172,1610377200"; 
   d="scan'208";a="71834855"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2021 08:44:43 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 894464003EDC;
        Fri, 12 Feb 2021 08:44:43 +0900 (JST)
Message-ID: <87im6y5fv8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     <broonie@kernel.org>, <robh@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
        <1612939421-19900-2-git-send-email-spujar@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi Sameer

> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index bc0b62e..0754d70 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
>  	 *  or device's module clock.
>  	 */
>  	clk = devm_get_clk_from_child(dev, node, NULL);
> -	if (!IS_ERR(clk)) {
> -		simple_dai->sysclk = clk_get_rate(clk);
> +	if (IS_ERR(clk))
> +		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>  
> +	if (!IS_ERR(clk)) {
>  		simple_dai->clk = clk;
> -	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
> +		simple_dai->sysclk = clk_get_rate(clk);
> +	} else if (!of_property_read_u32(node, "system-clock-frequency",
> +					 &val)) {
>  		simple_dai->sysclk = val;
> -	} else {
> -		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
> -		if (!IS_ERR(clk))
> -			simple_dai->sysclk = clk_get_rate(clk);
>  	}

The comment is indicating that that the clock parsing order,
but this patch exchanges it.
This comment also should be updated, I think.

	/*
	 * Parse dai->sysclk come from "clocks = <&xxx>"
	 * (if system has common clock)
	 *  or "system-clock-frequency = <xxx>"
	 *  or device's module clock.
	 */

asoc_simple_set_clk_rate() will be called if it has simple_dai->clk.
CPU or Codec component clock rate will be exchanged by this patch, I think.
I'm not sure the effect of this patch to existing boards.

And also, this patch has too many unneeded exchange,
thus it was difficult to read for me.
I think it can be simply like this ?
It is understandable what it want to do.

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 8c423afb9d2e..d441890de4dc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -168,16 +168,14 @@ int asoc_simple_parse_clk(struct device *dev,
 	 *  or device's module clock.
 	 */
 	clk = devm_get_clk_from_child(dev, node, NULL);
+	if (IS_ERR(clk))
+		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
+
 	if (!IS_ERR(clk)) {
 		simple_dai->sysclk = clk_get_rate(clk);
-
 		simple_dai->clk = clk;
 	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
 		simple_dai->sysclk = val;
-	} else {
-		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
-		if (!IS_ERR(clk))
-			simple_dai->sysclk = clk_get_rate(clk);
 	}
 
 	if (of_property_read_bool(node, "system-clock-direction-out"))




Thank you for your help !!

Best regards
---
Kuninori Morimoto
