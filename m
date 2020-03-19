Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA4818BB2E
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2020 16:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCSPdB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Mar 2020 11:33:01 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:34538 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727023AbgCSPdB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Mar 2020 11:33:01 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1jExAA-0000Vn-Tx; Thu, 19 Mar 2020 15:32:51 +0000
MIME-Version: 1.0
Date:   Thu, 19 Mar 2020 15:32:50 +0000
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Mark Brown <broonie@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
In-Reply-To: <20200130131039.GC6682@sirena.org.uk>
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
 <20200130131039.GC6682@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1df9cc13ea636502ac09191523ff0669@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2020-01-30 13:10, Mark Brown wrote:
> On Thu, Jan 30, 2020 at 08:17:37AM +0000, Ben Dooks wrote:
>> On 29/01/2020 14:33, Jon Hunter wrote:
> 
>> > controller. Applying these patches it is not distorted but now I am
>> > observing the clocking issue Ben reported and so the tone is not quite
>> > right.
> 
>> I thought they had been applied? I probably dragged them back in when
>> putting in the support for the test channel on the colibri.
> 
> There were review comments from Jon on patch 6 that you never responded
> to.

Hmm, I may have accidentally deleted those.

I will look to see if I can re-form the series and re-send in the next
couple of weeks. I've got no access currently to the machine and having
to deal with working from home for the next month or so.

-- 
Ben
