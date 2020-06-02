Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8401EB5D5
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jun 2020 08:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgFBGcO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 2 Jun 2020 02:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgFBGcO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Jun 2020 02:32:14 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC36C061A0E
        for <linux-tegra@vger.kernel.org>; Mon,  1 Jun 2020 23:32:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id d6so967842pjs.3
        for <linux-tegra@vger.kernel.org>; Mon, 01 Jun 2020 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b+M/coCkFNl7rEB1+V9a1SGv0MbqkwxWHT5JS/FD5kU=;
        b=KUDscq8WItKoh9ZYSx8jWuci35Nw048l0iXzgRVyQNROloiXf5EDGPMxaYe40ytsfc
         7tzL55dftrs+QMwkqTdiodq2N8ZWMmLGst4MFycYH/KwplJZf7c1hurZa2MrQVPYUm9Z
         0u0j0yJqrH/+bHMnGrM4KLjgs4VZxEJLD3+q8rbI9pKCvgLMWyyP6HJnYpWnroAJVTOv
         caH7/VDudXhENr5UEvSEpFioSFfzRuyXUSN0a8UmQdYPFHFBFZ6DyWsi1G125N8sJhSL
         3NopBKEm9MvPaBjxc4O8AdWAxCzTs5dU1BSHm/v6l5A94OOISy6xU8k+9nvxuBQKd5MB
         L92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b+M/coCkFNl7rEB1+V9a1SGv0MbqkwxWHT5JS/FD5kU=;
        b=sTic58NFJLeJ0FRxrOJ3lN6ophp9CCiiePyIFEctKrbAoq1GzImXJcE1Tr8eWrRRN9
         hNLb0gkOKS8aIqI/MSENsuJU1QUFbCWFdf3nyCgEyRfNLCgFH9eSN6OtQHqX0K4sHgNb
         lVuFwks2ehpdbT1mkv2y/rAqm4z5Jm+NhJfLOQQx5lMSsdmzN7BpAH22313M/iJTI6LW
         /9lBWFpRFfBDsej9gjX0kT4Tik1NSf31VpWKnwZsmBqadAVcd0OUrxVFCwLtLczLWLfM
         uQ+SKNdgNq8ymAtPAzgaROqVP1WtbgdGDL0duSI4CPyk0fv9iUjKFJn41P90cTlajrMn
         uSlw==
X-Gm-Message-State: AOAM5324zmj6x724LCRpPJzH/OGK0jfVC9QU2Ed/xWG5BCSX29b9c5sR
        0ScNTgY6NytjFXRjeYibS1i+1g==
X-Google-Smtp-Source: ABdhPJy5cUvakA8S6grGUMTST0kl4+hlBnKMXzZSlSFWY+9TVWtjdijoQ9DEyc9FF+kCM3nqIrBYGQ==
X-Received: by 2002:a17:90a:ee82:: with SMTP id i2mr731084pjz.29.1591079533656;
        Mon, 01 Jun 2020 23:32:13 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k14sm1228630pgn.94.2020.06.01.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 23:32:12 -0700 (PDT)
Date:   Mon, 1 Jun 2020 23:32:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200602063210.GT11847@yoga>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527110343.GD11111@willie-the-truck>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed 27 May 04:03 PDT 2020, Will Deacon wrote:

> Hi John, Bjorn,
> 
> On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > >
> > > Rob, Will, we're reaching the point where upstream has enough
> > > functionality that this is becoming a critical issue for us.
> > >
> > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > mainline with display, GPU, WiFi and audio working and the story is
> > > similar on several devboards.
> > >
> > > As previously described, the only thing I want is the stream mapping
> > > related to the display controller in place, either with the CB with
> > > translation disabled or possibly with a way to specify the framebuffer
> > > region (although this turns out to mess things up in the display
> > > driver...)
> > >
> > > I did pick this up again recently and concluded that by omitting the
> > > streams for the USB controllers causes an instability issue seen on one
> > > of the controller to disappear. So I would prefer if we somehow could
> > > have a mechanism to only pick the display streams and the context
> > > allocation for this.
> > >
> > >
> > > Can you please share some pointers/insights/wishes for how we can
> > > conclude on this subject?
> > 
> > Ping? I just wanted to follow up on this discussion as this small
> > series is crucial for booting mainline on the Dragonboard 845c
> > devboard. It would be really valuable to be able to get some solution
> > upstream so we can test mainline w/o adding additional patches.
> 
> Sorry, it's been insanely busy recently and I haven't had a chance to think
> about this on top of everything else. We're also carrying a hack in Android
> for you :)
> 

Thanks for taking the time to get back to us on this!

> > The rest of the db845c series has been moving forward smoothly, but
> > this set seems to be very stuck with no visible progress since Dec.
> > 
> > Are there any pointers for what folks would prefer to see?
> 
> I've had a chat with Robin about this. Originally, I was hoping that
> people would all work together towards an idyllic future where firmware
> would be able to describe arbitrary pre-existing mappings for devices,
> irrespective of the IOMMU through which they master and Linux could
> inherit this configuration. However, that hasn't materialised (there was
> supposed to be an IORT update, but I don't know what happened to that)
> and, in actual fact, the problem that you have on db845 is /far/ more
> restricted than the general problem.
> 
> Could you please try hacking something along the following lines and see
> how you get on? You may need my for-joerg/arm-smmu/updates branch for
> all the pieces:
> 
>   1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
>      "pinning" and configure for bypass.
> 
>   2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
>      for the display controller
> 
> I /think/ that's sufficient, but note that it differs from the current
> approach because we don't end up reserving a CB -- bypass is configured
> in the S2CR instead. Some invalidation might therefore be needed in
> ->cfg_probe() after unhooking the CB.
> 
> Thanks, and please yell if you run into problems with this approach.
> 

This sounded straight forward and cleaner, so I implemented it...

Unfortunately the hypervisor is playing tricks on me when writing to
S2CR registers:
- TRANS writes lands as requested
- BYPASS writes ends up in the register as requested, with type FAULT
- FAULT writes are ignored

In other words, the Qualcomm firmware prevents us from relying on
marking the relevant streams as BYPASS type.


Instead Qualcomm seems to implement "bypass" by setting up stream
mapping, of TRANS type, pointing to a context bank without
ARM_SMMU_SCTLR_M set.

Regards,
Bjorn
