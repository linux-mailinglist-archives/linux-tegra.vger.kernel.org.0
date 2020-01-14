Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F54139DD4
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jan 2020 01:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbgANAMA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jan 2020 19:12:00 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55437 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgANAMA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jan 2020 19:12:00 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so4868114pjz.5
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2020 16:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YszI0U18pHqA+Y3QA9OqnxsfwdnvOec+C4YDrgbYg80=;
        b=L1hYEJgKHWr/Gyj0fmCj7zWsybXM9yORn6pBPtcxw9h9s5Yc5uArF4pWiVeuaFNJh7
         bOs01G47TpIetL9Cm8U/+cR5pzygAPrZMi0vBO1wMFgujDbKFJ22wHFjmelcJuhTmW4X
         BslhLglhFFClkDef6TUGLTFzZSANH83yE8R3N7XECv4QWqwCGbk32JT1DUl0/snxiND/
         0QqZB6DUK59jjjySpgRm0l/IRe5Q7qi9yFoQQ9L7IgYfLHoJYaAdliaIj6+4BjrWXttw
         MXZSqAp05ZG1ov8wVSmIa883+mziVqos9f58MCtbquB/HmY8Kgq3wNtRljjWXu9bTX2U
         cvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YszI0U18pHqA+Y3QA9OqnxsfwdnvOec+C4YDrgbYg80=;
        b=AZfgxOfUSk8QfQGnmdb2dxw3L1prLU6DCkXPljBA3NQw3KB75mOqrdAmkcYCdvC+RP
         nhSxzdXYUtbmNr+73ZAnzB2/i1hhEcF8RFhLy7vq/WusFYg0HuRXcGKl40/KWk7iB2JH
         /he+oqxKZ2BbATtphImz/8mI+uBxSjXhjhKJ0t7Ve5UHvqcoNRf8moLhAkBH+VFc3pzQ
         s3cRgBsQv6GoFpcIkchQaSHvg99J+TS99SWgBfbE/UQNEJz54DyznNSegyKvpC0SYEaj
         BBa1TTxUN59ujh3RklqGqKRx68Ieyo1aVI7mLvf+MmtlYgJ1MmfFQ2kJamick7W288xB
         oKeQ==
X-Gm-Message-State: APjAAAVpyq3FZFlOMysnjtneedeKM37SseOjAVWWLSC5/vvAdCWY++CU
        Uaa6OcT63sXslBBWm3K6J0jeiA==
X-Google-Smtp-Source: APXvYqxx7U9QSEOfywuAVGzjNyUg0PYvYeG8HS4oMuifbJvLl3PcMnddxE7pxUtrCTCrnOSPk2maZQ==
X-Received: by 2002:a17:902:6501:: with SMTP id b1mr17177997plk.121.1578960719070;
        Mon, 13 Jan 2020 16:11:59 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 12sm15676997pfn.177.2020.01.13.16.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:11:58 -0800 (PST)
Date:   Mon, 13 Jan 2020 16:11:55 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Android Kernel Team <kernel-team@android.com>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200114001155.GJ1214176@minitux>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200111045639.210486-1-saravanak@google.com>
 <20200113140751.GA2436168@ulmo>
 <CAGETcx8YAXOdr1__gTCT2xCPq47Cg9vGj+5HJ_ZLzy4mHxU2xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx8YAXOdr1__gTCT2xCPq47Cg9vGj+5HJ_ZLzy4mHxU2xA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon 13 Jan 14:01 PST 2020, Saravana Kannan wrote:

> I added everyone from the other thread, but somehow managed to miss
> the Bjorn who sent the emails! Fixing that now.
> 

Thanks for looping me in Saravana.

> On Mon, Jan 13, 2020 at 6:07 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> >
> > On Fri, Jan 10, 2020 at 08:56:39PM -0800, Saravana Kannan wrote:
[..]
> > In the case where you're trying to inherit the bootloader configuration
> > of the SMMU, how do you solve the problem of passing the page tables to
> > the kernel? You must have some way of reserving that memory in order to
> > prevent the kernel from reusing it.
> 
> Maybe "inherit" makes it sound a lot more complicated than it is?
> Bjorn will know the details of what the bootloader sets up. But
> AFAICT, it looks like a simple "bypass"/identity mapping too. I don't
> think it actually sets up page tables.
> 

In the Qualcomm case we have a number of stream mappings installed when
the bootloader jumps to the OS, each one with SMR/S2CR referring to a CB
with SMMU_CBn_SCTLR.M not set.

As such the relevant hardware is able to access (without translation)
DDR even with SMMU_CR0.USFCFG being set.

The one case where this causes issues is that upon attaching a device to
a context we'll set SMMU_CBn_SCTLR.M, so until we actually have a
translation installed we do get faults - the difference is that these
are not picked up as fatal faults by the secure firmware, so they are
simply reported in Linux.

[..]
> > > > One option that I can think of would be to create an early identity
> > > > domain for each master and inherit it when that master is attached to
> > > > the domain later on, but that seems rather complicated from an book-
> > > > keeping point of view and tricky because we need to be careful not to
> > > > map regions twice, etc.
> > > >
> > > > Any good ideas on how to solve this? It'd also be interesting to see if
> > > > there's a more generic way of doing this. I know that something like
> > > > this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> > > > because translations are only enabled when the devices are attached to a
> > > > domain.
> > >
> > > Good foresight. As [1] shows, identity mapping doesn't solve it in a
> > > generic way.
> >
> > I think your [1] is a special case of identity mappings where the
> > mappings are already active. If you pass the information about the
> > mappings via memory-region properties, then you should be able to
> > reconstruct the identity mapping in the kernel before switching the
> > SMMU over to the new mapping for a seamless transition.
> 
> Ok, makes sense. But I don't have the full details here. So I'll let
> Bjorn comment here.
> 

It might be possible that we can install page tables and setup 1:1
mappings for the necessary resources, but it's not all devices with a
memory-region and a iommu context defined that should have this.

I will have to discuss this in more detail with the Qualcomm engineers.

PS. One detail that I did notice while distilling the downstream patches
is that unused mappings must have SMMU_S2CRx.CBNDX = 255 or I get odd
crashes when the display (CBNDX = 0) is active. I've yet to conclude
why this is.

Regards,
Bjorn
