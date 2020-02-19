Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67338164B53
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Feb 2020 18:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgBSRBg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Feb 2020 12:01:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:19722 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgBSRBg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Feb 2020 12:01:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 09:01:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; 
   d="scan'208";a="239745116"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga006.jf.intel.com with ESMTP; 19 Feb 2020 09:01:33 -0800
Date:   Wed, 19 Feb 2020 19:01:33 +0200 (EET)
From:   Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
cc:     Dmitry Osipenko <digetx@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
In-Reply-To: <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2002191900170.2957@eliteleevi.tm.intel.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com> <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com> <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Wed, 19 Feb 2020, Pierre-Louis Bossart wrote:

>> I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
>> loaded.
>> The offending patch is:
>> 
>>    ASoC: soc-pcm: call snd_soc_component_open/close() once
> 
> We also see a regression Kai bisected to the same patch
> 
> https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014

issue rootcaused -- this relates to the new "opened" tracking, I'll send a 
patch shortly after a few more test rounds.

Br, Kai
