Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DC42349FC
	for <lists+linux-tegra@lfdr.de>; Fri, 31 Jul 2020 19:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732710AbgGaRPf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 Jul 2020 13:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732693AbgGaRPf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Jul 2020 13:15:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 669112074B;
        Fri, 31 Jul 2020 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596215735;
        bh=8hBXf7FfLOq/6phPJ5oAQWj2+E+wrE3AqwTXE+mB6LY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UeHTcU0SIDFNVmZni3W21BKisHs3IDr3koLw/4YIDv/obmY6i+sP/DOnwZpVbaDDX
         zQyo0Hkd9Nt1TH7rTL8dEWO2npmBXh9EJAbXy1VAfnTV8rl+HqmIRcZFY+gRih/A5O
         m9zxCDs7uV13IelJSI9RRAKqVkHXLIHe8VjJKhMI=
Date:   Fri, 31 Jul 2020 19:15:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     torvalds@linux-foundation.org, akpm@linux-foundation.org,
        linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
        ben.hutchings@codethink.co.uk, lkft-triage@lists.linaro.org,
        stable@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5.7 00/20] 5.7.12-rc1 review
Message-ID: <20200731171521.GB2012979@kroah.com>
References: <20200730074420.533211699@linuxfoundation.org>
 <f01a47b2f2cc422299a135420847c7a1@HQMAIL101.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f01a47b2f2cc422299a135420847c7a1@HQMAIL101.nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 31, 2020 at 12:53:22PM +0000, Jon Hunter wrote:
> On Thu, 30 Jul 2020 10:03:50 +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.7.12 release.
> > There are 20 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat, 01 Aug 2020 07:44:05 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.12-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.7:
>     11 builds:	11 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     56 tests:	56 pass, 0 fail
> 
> Linux version:	5.7.12-rc1-g3d6db9c81440
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04

Wonderful, thanks for testing all of these and letting me know.

greg k-h
