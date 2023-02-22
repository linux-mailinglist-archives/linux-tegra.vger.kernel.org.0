Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375E869F351
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Feb 2023 12:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjBVLP1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Feb 2023 06:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbjBVLPZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Feb 2023 06:15:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABDC83F9;
        Wed, 22 Feb 2023 03:15:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 724ACB81260;
        Wed, 22 Feb 2023 11:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96280C433D2;
        Wed, 22 Feb 2023 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677064513;
        bh=L+vlKF7HhKxFmv88Coa+zjcHwjiWGvdeEhd8PDUoiRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PJbMubh3B2HkoSiUZH0OTHYBRvfoY+pKE03DyTYLWPzFk4IW/FgJR4CZGvFLUr9vt
         KvZvE4DrfmDWPImH4o3NCc8jfUpCGXkXBQMPQaDem9yw8g+P/LffaSrkBI5ywVgF8d
         90I9pFnfH6s1j3byFYsxO0IlUgTZ4uKQ7ZVChq+M=
Date:   Wed, 22 Feb 2023 12:15:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?utf-8?B?0KHQstGP0YLQvtGB0LvQsNCyINCg0LjQs9C10LvRjA==?= 
        <clamor95@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/X5Po7Ieao3svBm@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
 <Y/Xefn/76JW1C03d@kroah.com>
 <C94BE033-EE34-40E4-96D4-1EB4C1B04A09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C94BE033-EE34-40E4-96D4-1EB4C1B04A09@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Feb 22, 2023 at 11:39:59AM +0200, Святослав Ригель wrote:
> 
> 
> 22 лютого 2023 р. 11:21:02 GMT+02:00, Greg Kroah-Hartman <gregkh@linuxfoundation.org> написав(-ла):
> >On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:
> >> вт, 21 лют. 2023 р. о 21:27 Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> пише:
> >> >
> >> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> >> > > FM34NE is digital sound processing chip used for active
> >> > > noise suppression mainly on ASUS Transformers.
> >> > >
> >> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> > > ---
> >> > >  drivers/staging/Kconfig          |   2 +
> >> > >  drivers/staging/Makefile         |   1 +
> >> > >  drivers/staging/dsp/Kconfig      |   7 +
> >> > >  drivers/staging/dsp/Makefile     |   2 +
> >> > >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> >> > >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> >> > >  6 files changed, 1221 insertions(+)
> >> > >  create mode 100644 drivers/staging/dsp/Kconfig
> >> > >  create mode 100644 drivers/staging/dsp/Makefile
> >> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> >> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
> >> >
> >> >
> >> > Sorry, but why is this going into drivers/staging/ at all?  What is
> >> > needed to be done to get this out of staging?  Why not do that work
> >> > right now?  At the least, we need a TODO file in the directory that
> >> > lists what needs to be done and who is responsible for it.
> >> 
> >> Because this driver sets up fm34 and switches it to bypass mode allowing
> >> sound to work on the device. There is no dsp framework in kernel which could
> >> be called to operate dsp from the actual sound codec. (If there is, I
> >> would be glad
> >> if you show me). Fm34 must be active only on DMIC use, all other cases require
> >> it to be in bypass.
> >
> >That does not explain at all why this needs to go into drivers/staging/
> >and not the normal portion of the kernel.  Why this specific location?
> >What is wrong with it that requires it to go here?
> 
> It is not fully functional and does not perform its main function
> (noise cancellation) because it has to be called only for DMIC. Same
> time it is essential to be set so that audio could work on device.

But why does that mean it should go to drivers/staging/?  That's not
what staging is for (broken code).

> Once there is such a framework in kernel, which allows to control dsp
> from, I assume, asoc machine driver, this driver can be moved wherever
> it should be. Currently I can not tell where it should be since I
> haven't seen dsp drivers like this in kernel.

Then work to create that, don't dump stuff in drivers/staging/ for no
valid reason.

thanks,

greg k-h
