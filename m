Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E6168E9EE
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Feb 2023 09:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBHId5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Feb 2023 03:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjBHId4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Feb 2023 03:33:56 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E477B768
        for <linux-tegra@vger.kernel.org>; Wed,  8 Feb 2023 00:33:55 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id D48CD5C0072;
        Wed,  8 Feb 2023 03:33:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 Feb 2023 03:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1675845234; x=
        1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=y
        MaUdS+a0CTiq9wEFVIKTlIcX6qaKtsUGQqpQDpuKvgJV0zbEfcqoTCeXMuRP23WV
        NBmPljneI3tPYtDlgOuSgBg5rVHcnbF5mosJFpAKlYG1cfp7SiewCBKXHMELgUui
        0HlnlVkgujKNWpHp2EZsQEfNgOsB/WulnsyNVLYLhVJG3qKTDxEBbzOJJU8lVk6r
        Of7/RKXbxiW0WDHPmy5Yd1oS+N65oXVipuq6Vs7scxLwIQ31wBeT/wrwU2S6c74K
        rzpbAfA2KwtQCNJMg7zrOYQS41rJu0c1FjnuP5X3dF8RjcOj0x/DzCrsWuvZAeAH
        W5AslNJPEnWfL85F2HQpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675845234; x=
        1675931634; bh=jukRv2y1xt9Uct7GPytfpJjy5G82Ak1THGb0pVwupSk=; b=D
        PWWMLRfuim1VO+n+LmGYnpfrCUG2ISKP8EStW4KqUz95X60TYknJm4QgZbC5jetY
        KXS8Kuw7mxYcamXzTvcVsgGYE5SZKVYX5DhZF+kglLFZVhRO7VFlE0cXdo9rRMHz
        DaqCMy1rR/nMS3Y3pStv10RUTthXTPFzx6tLus7put4GA7u7o6x3RfrvSbJSwhio
        6SCKQtsjS/f4m0+dLXZMCcPFXBu4WLX1zEf+ZFren+uEgp6TTIY/7AfPY4PVmokS
        4/JQgeijKEH9VAPNVpY0G27yKPvDlELbjn/lyKLeEiG4bNoc4QU+rccg6y6MuEwx
        AnNaRDuMAZWVSJ6pmz6ow==
X-ME-Sender: <xms:cV7jYzFq333IxvTrGNU_ToSRZCKZffZ0vILNnYI9Xh-y4HGgZ1wxEw>
    <xme:cV7jYwVZqvxSaRMgJwzkeTBLfGD6zczbFaUsorrIauTe5l8DaaRPygdcTQDxLScZP
    AMgT3IEVV8DWpFtzfI>
X-ME-Received: <xmr:cV7jY1K9fv7a11h1mZF-16L1n7xRN-RtIlS0Qw36LCkaCyHCWN2h8TX_U-Lc-p5cn5QpwfHScsLpCU5rXPdoi5aLa7_uAWzFwG5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegledguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgr
    khgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
    hirdhjpheqnecuggftrfgrthhtvghrnhepgeejteekhfejteeiffelleffhefgieffkefh
    leeujeffkeeiuedvieegfeffieelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:cV7jYxG0iSLAxmEd8aNTs4cMYykuZDROgUPgZL-QpkxMCaIIuW5NEQ>
    <xmx:cV7jY5W1WGZtWIB8mkolNG6BWfOOvjJF_vzgvZlxhNOvarkoaraK0Q>
    <xmx:cV7jY8PKK2N98zaAP-axpRUjBqLB0LVJhFl1wzCq7iwzKjOuZe8Bhw>
    <xmx:cl7jY0MUpsS_jiG34GdszFPAoJhUMflQBAyIRofAsoC23IJbqWaggg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 03:33:51 -0500 (EST)
Date:   Wed, 8 Feb 2023 17:33:48 +0900
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Message-ID: <Y+NebPBazKrqJoEZ@workstation>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
        kernel@pengutronix.de, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On Tue, Feb 07, 2023 at 08:19:04PM +0100, Uwe Kleine-K�nig wrote:
> Hello,
> 
> while checking in which cases hda_tegra_remove() can return a non-zero value, I
> found that actually cannot happen. This series makes the involved functions
> return void to make this obvious.
> 
> This is a preparation for making platform_driver::remove return void, too.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-K�nig (3):
>   ALSA: core: Make snd_card_disconnect() return void
>   ALSA: core: Make snd_card_free_when_closed() return void
>   ALSA: core: Make snd_card_free() return void
> 
>  include/sound/core.h      |  6 +++---
>  sound/core/init.c         | 40 ++++++++++++++-------------------------
>  sound/pci/hda/hda_tegra.c |  6 ++----
>  sound/ppc/snd_ps3.c       |  4 +---
>  4 files changed, 20 insertions(+), 36 deletions(-)

All of the changes in the patches look good to me, as the return value
seems not to be so effective for a long time (15 years or more) and
expected so for future.
 
Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

One of my concern is that we are mostly in the last week for v6.3
development. When taking influence of the changes into account, it
would be possible to postpone to v6.4 development. But it's up to the
maintainer.


> base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a

A small nitpicking. I think you use Linus' tree or so:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=05ecb680708a

Because the hash is not reachable from the branch for next merge window on
the tree of sound subsystem upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=05ecb680708a

I guess it is safer to use his tree as your work-base, even
if the three patches can be applied to it as is (fortunately).


Regards

Takashi Sakamoto
