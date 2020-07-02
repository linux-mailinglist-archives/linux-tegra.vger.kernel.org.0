Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBDF211774
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Jul 2020 02:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgGBAwS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Jul 2020 20:52:18 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44777 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726388AbgGBAwS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Jul 2020 20:52:18 -0400
Date:   02 Jul 2020 09:52:17 +0900
X-IronPort-AV: E=Sophos;i="5.75,302,1589209200"; 
   d="scan'208";a="50880523"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2020 09:52:17 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D4FCE400C09E;
        Thu,  2 Jul 2020 09:52:16 +0900 (JST)
Message-ID: <87d05ezqlc.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for DPCM
In-Reply-To: <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
        <1593233625-14961-16-git-send-email-spujar@nvidia.com>
        <87h7utytlx.wl-kuninori.morimoto.gx@renesas.com>
        <9c7871ae-6649-7b0d-4780-c8389c299b04@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi Sameer

> > At least my CPU driver doesn't use component:pcm_construct
> > but is using DAI:pcm_new for some reasons.
> > I'm not sure checking DAI:pcm here is enough, or not...
> 
> OK. If adding DAI:pcm_new above here is not sufficient, then a flag
> can be used to describe FE component? or is there a better
> alternative?

soc_component_is_pcm() is called from simple_dai_link_of_dpcm :: "FE" side.
I wonder component->driver->non_legacy_dai_naming can't work for you ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
