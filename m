Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB070B6279
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 13:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfIRLuT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 07:50:19 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:37272 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfIRLuS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 07:50:18 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iAYTN-0001FL-Tk; Wed, 18 Sep 2019 12:50:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Sep 2019 12:50:13 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Mark Brown <broonie@kernel.org>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
In-Reply-To: <20190918100828.GA2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
 <20190918100828.GA2596@sirena.co.uk>
Message-ID: <943c243563b4936a537b52b6c3b1fd99@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2019-09-18 11:08, Mark Brown wrote:
> On Wed, Sep 18, 2019 at 08:44:50AM +0100, Ben Dooks wrote:
>> On 2019-09-17 19:26, Pierre-Louis Bossart wrote:
> 
>> > You need to add your own Signed-off-by when sending patches from other
>> > people
> 
>> Yes, will do when this series has been reviewed and modifications 
>> done.
> 
> I didn't look at it due to the lack of signoffs.

Thanks, although you could have just flagged this and reviewed the rest
anyway. I'll post a new version with signoff sorted at the end of the 
week
as I cannot get in to the office to test any changes until Friday.
