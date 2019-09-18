Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F26BEB6264
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 13:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbfIRLop (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 07:44:45 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:37012 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfIRLop (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 07:44:45 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAYO0-00012f-W1; Wed, 18 Sep 2019 12:44:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 12:44:40 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Mark Brown <broonie@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration callback
In-Reply-To: <20190918104827.GB2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
 <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
 <20190918104827.GB2596@sirena.co.uk>
Message-ID: <3aa9531f43ec8e3c499a61d0d61159b0@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 11:48, Mark Brown wrote:
> On Wed, Sep 18, 2019 at 11:25:39AM +0100, Jon Hunter wrote:
> 
>> Why 2? From looking at various codecs that support dsp-a/b modes, it 
>> is
>> more common for the f-sync to be 1 regardless of the number of slots.
> 
> In DSP modes only one edge really matters anyway so it's not super
> important how long the pulse is.

I could never get an answer for why this was set as-is on the customer's
setup and not sure if I have the ability to re-test this.
