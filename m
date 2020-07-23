Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CB422B420
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jul 2020 19:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729793AbgGWRGP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jul 2020 13:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:37690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbgGWRGP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jul 2020 13:06:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCF6320792;
        Thu, 23 Jul 2020 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595523975;
        bh=dFGkaPhTrcG3HUBZTAfTesF7nsiTuNfo0XBb5wQEX1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RTvmA0OWOlqLsnkELyJxMxOau17wy0jL2Jj6TU5PGFLXp3KOjrv2Hojyx/8VA2Pfv
         u9FbPcSpXHELlHnmOwUDydK7+5ptdXmOczw8tVO8ZELdSS0geWCMFH+gXEYzCEGlrF
         66p4qYKSOKqXQVvgkYBLuAanOXg7qZMhQLAK8puI=
Date:   Thu, 23 Jul 2020 19:06:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        ac100@lists.launchpad.net
Subject: Re: [PATCH] change slave occurence to secondary everywhere
Message-ID: <20200723170618.GA2835510@kroah.com>
References: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723151511.22193-1-bharadwaj.rohit8@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 08:45:13PM +0530, Rohit K Bharadwaj wrote:
> changed usage of slave (deprecated) to secondary
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Odd subject line, you should follow the other patches for this driver:
	staging: nvec: one_line_description_here

Also, you need to version your patches, this was v2, right?  Put below
the --- line what you changed for each version.

v3?

thanks,

greg k-h
