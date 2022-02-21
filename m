Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA8F4BDD5A
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Feb 2022 18:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355279AbiBUKiv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Feb 2022 05:38:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355209AbiBUKih (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Feb 2022 05:38:37 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E531546644;
        Mon, 21 Feb 2022 02:00:23 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id DDE7B21109;
        Mon, 21 Feb 2022 09:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645437589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fHL0JZPXyX1YIVnRK0AS+olhsoA5+HUzzw6KQSXtmAw=;
        b=WMckRs2ovKZQ2zqZfI9aewp2LSqa5hManvNPe090MnzBTNPRuhaJ8wH/xYP/O3I0WNhTkj
        q0NtJ1lUUi7ZK0Y08SYpUsh58n4f0SIwHgoki5ZViX1x1YQSfI3w3wDVEaOTyuETjAtDpO
        iULc36RcU8pW2PYr96frSeh5N/S4B7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645437589;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fHL0JZPXyX1YIVnRK0AS+olhsoA5+HUzzw6KQSXtmAw=;
        b=GloitVsiZK6acWdPu60/OPMK5WiLZ+Ot5zVxWOr78ZA6Dqi7OyBzxwAiJkoR8F8EdhrkfT
        wzTBeVfyQgNScVBA==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id CDFC1A3B9C;
        Mon, 21 Feb 2022 09:59:49 +0000 (UTC)
Date:   Mon, 21 Feb 2022 10:59:49 +0100
Message-ID: <s5hy22435gq.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mohan Kumar <mkumard@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
        jonathanh@nvidia.com, spujar@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: Add HDA support for Tegra234
In-Reply-To: <s5hr18295n7.wl-tiwai@suse.de>
References: <20220216092240.26464-1-mkumard@nvidia.com>
        <20220216092240.26464-5-mkumard@nvidia.com>
        <Yg0aXq+T5/xsBHRG@orome>
        <s5hr18295n7.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Feb 2022 16:45:48 +0100,
Takashi Iwai wrote:
> 
> On Wed, 16 Feb 2022 16:38:06 +0100,
> Thierry Reding wrote:
> > 
> > On Wed, Feb 16, 2022 at 02:52:38PM +0530, Mohan Kumar wrote:
> > > Add hda clocks, memory ,power and reset binding entries
> > > for Tegra234.
> > > 
> > > Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> > > ---
> > >  include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
> > >  include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
> > >  include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
> > >  include/dt-bindings/reset/tegra234-reset.h     | 2 ++
> > >  4 files changed, 21 insertions(+)
> > >  create mode 100644 include/dt-bindings/power/tegra234-powergate.h
> > 
> > Actually it looks like I may need to pick this up as well to satisfy the
> > dependency from patch 6.
> > 
> > Takashi, any objections if I pick up patches 4 and 6 and you take the
> > remainder through your tree? I don't think there are any dependencies on
> > this patch 4 from patches 1-3 and 5.
> 
> Sure, I'm fine with it.

Now I merged patches 1, 2, 3 and 5 to sound.git tree for-next branch.


thanks,

Takashi
