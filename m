Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4693B19BC2D
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Apr 2020 09:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgDBHJP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Apr 2020 03:09:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2851 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgDBHJP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Apr 2020 03:09:15 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e858f380001>; Thu, 02 Apr 2020 00:07:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 02 Apr 2020 00:09:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 02 Apr 2020 00:09:14 -0700
Received: from [10.26.72.253] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Apr
 2020 07:09:12 +0000
Subject: Re: [PATCH 4.4 00/91] 4.4.218-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200401161512.917494101@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4e761152-6dd1-dfcc-df24-a073323f202d@nvidia.com>
Date:   Thu, 2 Apr 2020 08:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200401161512.917494101@linuxfoundation.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585811257; bh=aKuO06o/p0WjOAsfkQaSFQpNWt/Xw+05r2eb3unKntI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=LT/wmqhbUV4sOJ2GqdzUcbBQRxdZUZkn053qXVTyrYu1n+vHgTxqjcn5+ZyP3W+bU
         lq+boBwzU+T+idXsG2pX4L9B18tJ3DPvPy+sTJLx2nauRmnRLqbg4ZekfKUJenX6RS
         JveWUDw9ohOSxb6C6RwgooDp7ebkfAs8LaYwl6GHkj9lWorG0h+duorOmFIvBJfztF
         M4ec05SH/I491x+dr38uNxzNXTEXKvAynUIkrixolUodWkugcTmSqJmHNzgUx9qS66
         pTy1qKKfn2+mHpKO1MdxU308oTvOhVIkST7WP5nHNFUsYpH+cvJP3kM7OrEzHqYHgX
         wwgozn52iZ5xA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/04/2020 17:16, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.218 release.
> There are 91 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 03 Apr 2020 16:09:36 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.218-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


All tests are passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    19 tests:	19 pass, 0 fail

Linux version:	4.4.218-rc1-g2d26509e19e3
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
