Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F025B649A
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 15:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbfIRNej (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 09:34:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:61836 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730330AbfIRNei (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 09:34:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 06:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,520,1559545200"; 
   d="scan'208";a="211856930"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 18 Sep 2019 06:34:38 -0700
Received: from pbossart-mac01.local (unknown [10.251.11.91])
        by linux.intel.com (Postfix) with ESMTP id 947E45800D0;
        Wed, 18 Sep 2019 06:34:36 -0700 (PDT)
Subject: Re: [alsa-devel] [PATCH 1/8] ASoC: tegra: Add a TDM configuration
 callback
To:     Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40d78f13-c1b9-3e2d-c144-2209a4c0d716@linux.intel.com>
Date:   Wed, 18 Sep 2019 08:33:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918104827.GB2596@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/18/19 5:48 AM, Mark Brown wrote:
> On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:
> 
>> Why 2? From looking at various codecs that support dsp-a/b modes, it is
>> more common for the f-sync to be 1 regardless of the number of slots.
> 
> In DSP modes only one edge really matters anyway so it's not super
> important how long the pulse is.

There are exceptions to the rule.
In the early days of SOF, we had to provide support for amplifiers that 
did require a pulse larger than a bit. In the SOF IPC we added an 
'frame_pulse_width' field to pass the configuration all the way from 
topology to the firmware and Intel SSP driver.
The other quirk we added is the ability to control zero-padding per slot 
instead of at the end of the frame, e.g. 1 bit of padding after 24 bits 
when using 4 slots w/ 25 bits in a 100-bit frame.
