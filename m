Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A3A1AF830
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Apr 2020 09:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgDSHUf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Apr 2020 03:20:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:48226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgDSHUe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Apr 2020 03:20:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B12C21D82;
        Sun, 19 Apr 2020 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587280833;
        bh=vt3TJOLsgbVq5z3ryXQV9c3uwAyQdtYrPyTNZTdaUCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xo5YEXruRxHnfGTcFc0NCKUcIXKpDkCfOCmbljxB9b2kJY6yeQGUdCppiIK9zrMj9
         2DM2w0mBZMRJJ9QcqcFVdAbgbmZdp4RCqv6hnw6zDqsNZ3rJyKs9jJGKJQqhDrW/k5
         aFWYVspO1ws1g/FMCPkh6mayFSwoXQKJoXMJRmd4=
Date:   Sun, 19 Apr 2020 09:20:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        baolin.wang@linaro.org, kstewart@linuxfoundation.org,
        tglx@linutronix.de, bradleybolen@gmail.com, faiz_abbas@ti.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, bbiswas@nvidia.com,
        anrao@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
Message-ID: <20200419072030.GB3544449@kroah.com>
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 17, 2020 at 12:14:01PM -0700, Sowjanya Komatineni wrote:
> This series includes manually backported changes that implements Tegra
> specific timeout callback to switch between finite and infinite HW busy
> detection wait modes.
> 
> sdhci-tegra driver patch implements set_timeout callback based on one of
> the sdhci host driver patch that refactors sdhci_set_timeout and allows
> drivers to call __sdhci_set_timeout with their timeout callback
> implementation.
> 
> Both of these patches are manually backported in this series.

Is this a bugfix or a new feature?  I can't tell, but it feels like it's
a new feature.  What's wrong with just using the 5.4.y kernel tree?

thanks,

greg k-h
