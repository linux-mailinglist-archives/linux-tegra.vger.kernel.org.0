Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB68110630
	for <lists+linux-tegra@lfdr.de>; Wed,  1 May 2019 10:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfEAIns (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 May 2019 04:43:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:47664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfEAIns (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 May 2019 04:43:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B05B21734;
        Wed,  1 May 2019 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556700227;
        bh=nqU4Ne54nAYYVwV/En/Nlu9SJUv5DPfaJj7HvYaVPVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SjnWpIVN1eenhFh+EckL7uKpPTC6kgjq+oiV1ZleEgK+AE+GfSirxJ3wpCp2tU0//
         tHVZ4Tzm3Atws4IIQMm7eDyK0WthjMvVYU8701zbTaiISfB5ThSLaaRY4bReSzaTsF
         jHGTlQAeWXkIiBKNe/9SYbH0jVTTeZOluWygxwVI=
Date:   Wed, 1 May 2019 10:43:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
        patches@kernelci.org, ben.hutchings@codethink.co.uk,
        lkft-triage@lists.linaro.org, stable@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.0 00/89] 5.0.11-stable review
Message-ID: <20190501084344.GA22332@kroah.com>
References: <20190430113609.741196396@linuxfoundation.org>
 <0cfe6d22-5919-f1f3-f7f0-eb6232b5db9c@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cfe6d22-5919-f1f3-f7f0-eb6232b5db9c@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 01, 2019 at 09:26:39AM +0100, Jon Hunter wrote:
> 
> On 30/04/2019 12:37, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 5.0.11 release.
> > There are 89 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> > 
> > Responses should be made by Thu 02 May 2019 11:35:03 AM UTC.
> > Anything received after that time might be too late.
> > 
> > The whole patch series can be found in one patch at:
> > 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.11-rc1.gz
> > or in the git tree and branch at:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> > and the diffstat can be found below.
> > 
> > thanks,
> > 
> > greg k-h
> 
> All tests are passing for Tegra ...
> 
> Test results for stable-v5.0:
>     12 builds:	12 pass, 0 fail
>     22 boots:	22 pass, 0 fail
>     32 tests:	32 pass, 0 fail
> 
> Linux version:	5.0.11-rc1-g852cce3
> Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra194-p2972-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra30-cardhu-a04

Great!  Thanks for testing all of these and letting me know.

greg k-h
