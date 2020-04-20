Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BF41B0218
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Apr 2020 09:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgDTHCM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Apr 2020 03:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbgDTHCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Apr 2020 03:02:12 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D518C061A0F
        for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2020 00:02:12 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id t189so5316243vst.7
        for <linux-tegra@vger.kernel.org>; Mon, 20 Apr 2020 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BNLp6+Gsbqdw+yeE2veHuTXUKvMYmfTKb4PTArDW8Jg=;
        b=L7fR/GkTpewbsAps7RKRuWYf+NNZDSy0hbHYUxnqot+bJG1LVvhyjdr511thwzxM6B
         /92BfD9yixIJ/mjHt+bantd4QKvPXVlJ0hN6wT3PF2MKEWywX3JYk6NtQ66v8STIo6EU
         yiQt5o84kdRUXRZPOqiRCs+vJX93kEJD6l87VLCswb+JLGQEd65DQJUbwmeQ2blUayRz
         kKMb84g0Q0zkM5oRuWQ3GaI5NS42bFtD3b0QZJntIYyoBbUsYOS1lIW7Eek/Vw1LzAqw
         Snxtr6alJ98BYmb3qwaI65XTPLgpZ8UqsvuxMBjKllNJHnxZHd4AQ/7Vz51AUMuQ8K+r
         O4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BNLp6+Gsbqdw+yeE2veHuTXUKvMYmfTKb4PTArDW8Jg=;
        b=HgCKMeXDdfKVOVpUPLINocuJZBYL/XPAIH96BEXLjs9nBG0BtA1IyGWT1CuX/W268s
         xZA7BXONk9o48PXwZHlTa5lYgjocD+c6yHBaYmiJHuVXWJgOO5XPXmIiF6116osYT5rH
         qFebjCJr5uHnxjy040Y7Opzu5m+AJJEof3708ARu4pae0MiaW8Re3FAT1ZIsLIw6CC1T
         KWzbhgr3WZOtGTkzugtAbXS74+BuobLQkeXHlxx8vIIkTLiK+/Ebis9YN4FrmrILD3mN
         vKOIVc5FXCgdXt1UdptwiAQTJOId2Hxd7EW7VGqGUgkWKa2Qwegw0shwEc7rHMfwrSTl
         pp5w==
X-Gm-Message-State: AGi0PuY+oDJfQCgy/oN6dLi9M0cJLoFXzFOFIWxXNUThXwsGLJR8BuBO
        211Aiqw43QUjDKK8So02qZ9ek4hLytbdmlMSZU8WLA==
X-Google-Smtp-Source: APiQypJCnqnlxKqs9guzvf9mOORv7sEeQSGGEvng3tyC5ztteYaF3RWvFLV6aKVmRypvKB+gvlpDmm9joMqZXDlk/Hw=
X-Received: by 2002:a67:8b09:: with SMTP id n9mr9999698vsd.191.1587366131112;
 Mon, 20 Apr 2020 00:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
 <20200419072030.GB3544449@kroah.com> <6911ee08-1376-a515-9393-1ebc6cc6a255@nvidia.com>
 <20200419165204.GA3697430@kroah.com>
In-Reply-To: <20200419165204.GA3697430@kroah.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Apr 2020 09:01:35 +0200
Message-ID: <CAPDyKFrdCip_r0fq2=FswsR8iRtC-Gqv2gbvT6PqFXYcaZyBkw@mail.gmail.com>
Subject: Re: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "(Exiting) Baolin Wang" <baolin.wang@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bradley Bolen <bradleybolen@gmail.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Aniruddha Tvs Rao <anrao@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 19 Apr 2020 at 18:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Apr 19, 2020 at 09:23:39AM -0700, Sowjanya Komatineni wrote:
> >
> > On 4/19/20 12:20 AM, Greg KH wrote:
> > > External email: Use caution opening links or attachments
> > >
> > >
> > > On Fri, Apr 17, 2020 at 12:14:01PM -0700, Sowjanya Komatineni wrote:
> > > > This series includes manually backported changes that implements Tegra
> > > > specific timeout callback to switch between finite and infinite HW busy
> > > > detection wait modes.
> > > >
> > > > sdhci-tegra driver patch implements set_timeout callback based on one of
> > > > the sdhci host driver patch that refactors sdhci_set_timeout and allows
> > > > drivers to call __sdhci_set_timeout with their timeout callback
> > > > implementation.
> > > >
> > > > Both of these patches are manually backported in this series.
> > > Is this a bugfix or a new feature?  I can't tell, but it feels like it's
> > > a new feature.  What's wrong with just using the 5.4.y kernel tree?
> > >
> > > thanks,
> > >
> > > greg k-h
> > Ulf recent patches for increased timeout adds capability
> > MMC_CAP_NEED_RSP_BUSY for sdhci-tegra as well.
> >
> > So, it will always use R1B for R1B type commands so there are no known bugs
> > or failures with mmc devices we use on our platforms.
>
> I have no idea what this means, sorry.
>
> > So, we can treat this patch as an improvement for long operation commands
> > where HW will wait as long as device is busy.
>
> Ok, so this isn't a regression and can't match the stable kernel rules,
> sorry.

Let me help to clarify. This isn't a regression, correct. However, the
patch fixes a long outstanding bug for sdhci-tegra.

For some SD/MMC commands, the mmc core may provide a long busy timeout
trusting the mmc host to cope with it. It has turned out that
sdhci-tegra didn't, thus it may report a cmd-timeout error, while in
fact it shouldn't.

I believe that is what the small series of patches should be addressing.

Kind regards
Uffe
