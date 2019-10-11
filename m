Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB709D3BBF
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Oct 2019 10:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfJKI60 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 11 Oct 2019 04:58:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbfJKI6Z (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Oct 2019 04:58:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8261321A4A;
        Fri, 11 Oct 2019 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570784305;
        bh=ijDYyOqW4d9Zq6da2aZOrNguLiG9SqY9eG3PBnDYyhk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sogbkESbdjM7dBTX1/f213dnKQZUVkmpCxQTWiVOyz9JvfDRhGY1wYv2S8y0VDNLt
         pnBqE2NBdaCwB+kMt2cBWL8Kb4Y7lJisCUPKpxUDKlLHl/Be2xA1vrP2kZDcELlfGb
         Qzfsn5sTofrB9Oklcb5fVp+StZV3AtHpOMmDx+Qs=
Date:   Fri, 11 Oct 2019 10:58:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
        patches@kernelci.org, ben.hutchings@codethink.co.uk,
        lkft-triage@lists.linaro.org, stable@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.3 000/148] 5.3.6-stable review
Message-ID: <20191011085822.GC1075470@kroah.com>
References: <20191010083609.660878383@linuxfoundation.org>
 <2b3c98b9-5657-f028-0182-b205c4fc92c0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b3c98b9-5657-f028-0182-b205c4fc92c0@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 11, 2019 at 09:33:41AM +0100, Jon Hunter wrote:
> 
> On 10/10/2019 09:34, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.3.6 release.
> > There are 148 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sat 12 Oct 2019 08:29:51 AM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.3.6-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.3.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests passing for Tegra ...
> 
> Test results for stable-v5.3:
>     12 builds:	12 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     38 tests:	38 pass, 0 fail
> 
> Linux version:	5.3.6-rc1-ge863f125e178
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04
> 

Great, thanks for testing all of these and letting me know.

greg k-h
