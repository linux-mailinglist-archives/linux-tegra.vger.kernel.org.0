Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC6A1AFC38
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Apr 2020 18:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDSQwK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Apr 2020 12:52:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgDSQwJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Apr 2020 12:52:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9CB6E214D8;
        Sun, 19 Apr 2020 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587315129;
        bh=UWteWxbDPNTpoSlaYMeXa+k+FglQVJHR7vn1F+zACL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eHoI2e3Al5vRlx+OgjrIbCaHxoA+xl51dxObFhZvlGeiUulOYB5JTKyJ2c8a1KOCB
         +ZeJIvbJ/eVCtGXRaqlfwPftlglTmGW/4YvtnPtMyH5ZVcmegz1DCwBlxdbjwDP6Ye
         ATZjy8bzf2/17wkoAlkC4wbyHDfd9JN2folOObNA=
Date:   Sun, 19 Apr 2020 18:52:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        baolin.wang@linaro.org, kstewart@linuxfoundation.org,
        tglx@linutronix.de, bradleybolen@gmail.com, faiz_abbas@ti.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com,
        anrao@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
Message-ID: <20200419165204.GA3697430@kroah.com>
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
 <20200419072030.GB3544449@kroah.com>
 <6911ee08-1376-a515-9393-1ebc6cc6a255@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6911ee08-1376-a515-9393-1ebc6cc6a255@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Apr 19, 2020 at 09:23:39AM -0700, Sowjanya Komatineni wrote:
> 
> On 4/19/20 12:20 AM, Greg KH wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, Apr 17, 2020 at 12:14:01PM -0700, Sowjanya Komatineni wrote:
> > > This series includes manually backported changes that implements Tegra
> > > specific timeout callback to switch between finite and infinite HW busy
> > > detection wait modes.
> > > 
> > > sdhci-tegra driver patch implements set_timeout callback based on one of
> > > the sdhci host driver patch that refactors sdhci_set_timeout and allows
> > > drivers to call __sdhci_set_timeout with their timeout callback
> > > implementation.
> > > 
> > > Both of these patches are manually backported in this series.
> > Is this a bugfix or a new feature?  I can't tell, but it feels like it's
> > a new feature.  What's wrong with just using the 5.4.y kernel tree?
> > 
> > thanks,
> > 
> > greg k-h
> Ulf recent patches for increased timeout adds capability
> MMC_CAP_NEED_RSP_BUSY for sdhci-tegra as well.
> 
> So, it will always use R1B for R1B type commands so there are no known bugs
> or failures with mmc devices we use on our platforms.

I have no idea what this means, sorry.

> So, we can treat this patch as an improvement for long operation commands
> where HW will wait as long as device is busy.

Ok, so this isn't a regression and can't match the stable kernel rules,
sorry.

greg k-h
