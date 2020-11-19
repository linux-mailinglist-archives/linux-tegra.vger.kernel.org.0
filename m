Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941072B9255
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Nov 2020 13:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbgKSMNc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Nov 2020 07:13:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:50770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727126AbgKSMNb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 07:13:31 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3F38206CA;
        Thu, 19 Nov 2020 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605788011;
        bh=M5kHR2h6piAEAHlOrw6L95h5sj0hsTe1AfQhSSsseF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GatbDLrLye9HBlUeHlvyiRexfTeXyTBKE9JqbhMhdsUZnda6ULyNbsPd8qMWau8VC
         QSfmTpHSMclIq40YW/3vYcluTELDSZSPW+V/pR4gh3hQkpFzlmiEBJYfCJDxMwBXbd
         glMj+aqyQ6BJhZH0pgxI8Pycf5Qj4SeO8x/eSMsc=
Date:   Thu, 19 Nov 2020 13:14:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        lkft-triage@lists.linaro.org, pavel@denx.de,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.9 000/255] 5.9.9-rc1 review
Message-ID: <X7Zhl+k7UY4WxpUt@kroah.com>
References: <20201117122138.925150709@linuxfoundation.org>
 <f75bf0e521f0445dbe73fa5c5174b883@HQMAIL107.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75bf0e521f0445dbe73fa5c5174b883@HQMAIL107.nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Nov 17, 2020 at 07:09:30PM +0000, Jon Hunter wrote:
> On Tue, 17 Nov 2020 14:02:20 +0100, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.9.9 release.
> > There are 255 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Thu, 19 Nov 2020 12:20:51 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.9-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.9.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.9:
>     15 builds:	15 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     64 tests:	64 pass, 0 fail
> 
> Linux version:	5.9.9-rc1-gfb1622495321
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks for testing all of them and letting me know.

greg k-h
