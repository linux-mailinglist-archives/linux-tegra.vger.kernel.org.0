Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084C82254D3
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Jul 2020 02:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgGTAKs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 20:10:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43690 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726312AbgGTAKr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 20:10:47 -0400
Date:   20 Jul 2020 09:10:46 +0900
X-IronPort-AV: E=Sophos;i="5.75,373,1589209200"; 
   d="scan'208";a="52534087"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Jul 2020 09:10:46 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4FFE04137903;
        Mon, 20 Jul 2020 09:10:46 +0900 (JST)
Message-ID: <871rl72gjb.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 09/10] arm64: tegra: Audio graph header for Tegra210
In-Reply-To: <1595135417-16589-10-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
        <1595135417-16589-10-git-send-email-spujar@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi Sameer

> +&tegra_admaif {
> +	admaif_port: port {
> +		admaif0: endpoint@0 {
> +			remote-endpoint = <&xbar_admaif0>;
> +		};
> +		admaif1: endpoint@1 {
> +			remote-endpoint = <&xbar_admaif1>;
> +		};
(snip)
> +		admaif8: endpoint@8 {
> +			remote-endpoint = <&xbar_admaif8>;
> +		};
> +		admaif9: endpoint@9 {
> +			remote-endpoint = <&xbar_admaif9>;
> +		};
> +	};
> +};

I'm not familiar with your system, so, one question.
Does this ADMAIF has total 10 interface which is used in the same time ?
or select one of 10 connections when use ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
