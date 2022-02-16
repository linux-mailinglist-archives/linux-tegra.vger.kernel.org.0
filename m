Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E624B8BA6
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Feb 2022 15:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbiBPOmB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Feb 2022 09:42:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbiBPOmA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Feb 2022 09:42:00 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8416E7A3;
        Wed, 16 Feb 2022 06:41:48 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id F1B8D1F37D;
        Wed, 16 Feb 2022 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645022506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0NmCPawJxtkRgoA7hRxfbe/jdl3paV1z2Xf8gjyvC9c=;
        b=J/AC/hjMMRwtePnQ/Jeq6EvVehzyNVPebobHgwOS0I0J/Pl6XwpUztzcnoNfUsRA30yV+H
        He5UbkbVO3AUkCBQO+HrzKYZI8RCyhURCumHN7owG49Up1FDqyWVPgP8tNSeTyFp78hWIF
        tE9lqVPzwXoeNmVXF3lCTN9V/qklR4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645022506;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0NmCPawJxtkRgoA7hRxfbe/jdl3paV1z2Xf8gjyvC9c=;
        b=DF08cEWU9EeJbAJnzhuQavcmu4gbVbcOxuT4AS3sQxDN8ZAhVeUB1CDfEGeQ9r0e6MFf1c
        bSVjJqzlXuT+jABQ==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 9AA35A3B84;
        Wed, 16 Feb 2022 14:41:46 +0000 (UTC)
Date:   Wed, 16 Feb 2022 15:41:46 +0100
Message-ID: <s5h4k4yan6d.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mohan Kumar <mkumard@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, robh+dt@kernel.org, tiwai@suse.com,
        jonathanh@nvidia.com, spujar@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Add Tegra234 HDA support
In-Reply-To: <Yg0I312RA5gh1Rra@orome>
References: <20220210065057.13555-1-mkumard@nvidia.com>
        <s5hmtiscl65.wl-tiwai@suse.de>
        <s5hk0dwckza.wl-tiwai@suse.de>
        <Yg0I312RA5gh1Rra@orome>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Feb 2022 15:23:27 +0100,
Thierry Reding wrote:
> 
> On Tue, Feb 15, 2022 at 02:34:01PM +0100, Takashi Iwai wrote:
> > On Tue, 15 Feb 2022 14:29:54 +0100,
> > Takashi Iwai wrote:
> > > 
> > > On Thu, 10 Feb 2022 07:50:51 +0100,
> > > Mohan Kumar wrote:
> > > > 
> > > > This series add the support for TEGRA234 HDA driver support
> > > > 
> > > > Mohan Kumar (6):
> > > >   ALSA: hda/tegra: Add Tegra234 hda driver support
> > > >   ALSA: hda/tegra: Hardcode GCAP ISS value on T234
> > > >   ALSA: hda/tegra: Update scratch reg. communication
> > > >   dt-bindings: Add HDA support for Tegra234
> > > >   dt-bindings: Document Tegra234 HDA support
> > > >   arm64: tegra: Add hda dts node for Tegra234
> > > 
> > > Applied all six patches to for-next branch now.
> > 
> > ... and now I realized that it's conflicting with the latest Tegra234
> > reset stuff on linux-next.
> > 
> > Maybe better to split the patches to be merged through several trees?
> 
> It's usually best for me to pick up at least the DT changes (patch 6)
> into the Tegra tree, that way I can easily resolve conflicts there when
> they arise.
> 
> The device tree bindings (patches 3 & 4) traditionally go along with
> the driver changes, though.
> 
> If you prefer the patch series to be split, that's fine. For other
> subsystems we usually deal with this by having one series and then the
> subsystem maintainer picking up all the non-DT changes and I take the
> rest.

OK, that's fine for me.
Let's revisit the latest patchset.


thanks,

Takashi
