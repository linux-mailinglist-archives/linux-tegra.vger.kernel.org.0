Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDC32510ED
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Aug 2020 06:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgHYEy3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Aug 2020 00:54:29 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21098 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725792AbgHYEy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 00:54:29 -0400
Date:   25 Aug 2020 13:54:28 +0900
X-IronPort-AV: E=Sophos;i="5.76,351,1592838000"; 
   d="scan'208";a="55442315"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2020 13:54:28 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D029641C6063;
        Tue, 25 Aug 2020 13:54:27 +0900 (JST)
Message-ID: <87sgcbwcnf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
In-Reply-To: <2d3aa11e-3c56-1f7a-3d41-2457f973d55b@nvidia.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
        <1596605064-27748-4-git-send-email-spujar@nvidia.com>
        <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
        <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
        <2d3aa11e-3c56-1f7a-3d41-2457f973d55b@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Hi Sameer

>             +static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
>             +{
>             +     struct snd_soc_dai *dai = snd_soc_find_dai(dlc);
>             +
>             +     if (dai && (dai->component->driver->pcm_construct ||
>             +                 dai->driver->pcm_new))
>             +             return true;
>             +
>             +     return false;
>             +}
(snip)
> I tried testing this with LOCKDEP config enabled at my end.
> It seems I don't see warning originated from above function.
> Are you suggesting that, in general, snd_soc_find_dai()
> should be called with client_mutex held?

Hmm ? strange...

snd_soc_find_dai() is using lockdep_assert_held()

	struct snd_soc_dai *snd_soc_find_dai(...)
	{
		...
=>		lockdep_assert_held(&client_mutex);
		...
	}

and lockdep_assert_held() will indicate WARN_ON()

	-- lockdep.h --
	...
	#ifdef CONFIG_LOCKDEP
	...
	#define lockdep_assert_held(l)	do {				\
=>			WARN_ON(debug_locks && !lockdep_is_held(l));	\
		} while (0)

> May be snd_soc_dai_link_set_capabilities() requires similar fix?

Yes, I'm posting fixup patch.

	https://patchwork.kernel.org/patch/11719919/

Thank you for your help !!

Best regards
---
Kuninori Morimoto
