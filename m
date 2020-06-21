Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8DC2029C9
	for <lists+linux-tegra@lfdr.de>; Sun, 21 Jun 2020 11:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgFUJYj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 21 Jun 2020 05:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727917AbgFUJYj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 21 Jun 2020 05:24:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 464412488D;
        Sun, 21 Jun 2020 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592731478;
        bh=w2g+r6zQVomgDt7m/xNcoLp98F2ry0jU+Bnz8mFuFYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ibnwb4x0EIlemjCb4h71oy3MRbMC9w6haqzS8g0HIzgG8EiwQi1fK/AdWnJcc1WrN
         yxFf1GVtL4jr9U0XWAx4EBBdtnizHSrynsbTuTm5YGOPMhvJv0H9kGkKEFTN0zmZSW
         wEiFYqKYJEHnTCM9wpucJYJ0Bde7FQjule9c6SVY=
Date:   Sun, 21 Jun 2020 11:24:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
        patches@kernelci.org, ben.hutchings@codethink.co.uk,
        lkft-triage@lists.linaro.org, stable@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.7 000/376] 5.7.5-rc1 review
Message-ID: <20200621092436.GA97925@kroah.com>
References: <20200619141710.350494719@linuxfoundation.org>
 <8d7dd6fa-3018-5da3-0736-0d58fad8fd68@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d7dd6fa-3018-5da3-0736-0d58fad8fd68@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 20, 2020 at 10:52:19AM +0100, Jon Hunter wrote:
> 
> On 19/06/2020 15:28, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.7.5 release.
> > There are 376 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Sun, 21 Jun 2020 14:15:50 +0000.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.5-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v5.7:
>     11 builds:	11 pass, 0 fail
>     26 boots:	26 pass, 0 fail
>     56 tests:	56 pass, 0 fail
> 
> Linux version:	5.7.5-rc1-g19411dc6b061
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra30-cardhu-a04

Thanks for testing all of these and letting me know.

greg k-h
