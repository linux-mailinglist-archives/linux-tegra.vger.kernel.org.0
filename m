Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93A6A164980
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Feb 2020 17:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBSQJY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Feb 2020 11:09:24 -0500
Received: from mga04.intel.com ([192.55.52.120]:26621 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgBSQJY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Feb 2020 11:09:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 08:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; 
   d="scan'208";a="434517377"
Received: from jsahoo-mobl.amr.corp.intel.com (HELO [10.254.110.74]) ([10.254.110.74])
  by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2020 08:09:22 -0800
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
To:     Dmitry Osipenko <digetx@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d60ccad5-9c52-551b-ae22-2815ab768a59@linux.intel.com>
Date:   Wed, 19 Feb 2020 10:09:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


> I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
> loaded.
> 
> The offending patch is:
> 
>    ASoC: soc-pcm: call snd_soc_component_open/close() once

We also see a regression Kai bisected to the same patch

https://github.com/thesofproject/linux/pull/1805#issuecomment-588266014


