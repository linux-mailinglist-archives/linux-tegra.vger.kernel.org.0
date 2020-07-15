Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E90B220A84
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jul 2020 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbgGOKug (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Jul 2020 06:50:36 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16921 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbgGOKuf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jul 2020 06:50:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0edf410000>; Wed, 15 Jul 2020 03:49:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 Jul 2020 03:50:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 Jul 2020 03:50:35 -0700
Received: from [10.26.73.219] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 10:50:32 +0000
Subject: Re: [PATCH 5.7 000/166] 5.7.9-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200714184115.844176932@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fc3af2c8-d6ca-0ad1-597e-3bba2292613c@nvidia.com>
Date:   Wed, 15 Jul 2020 11:50:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714184115.844176932@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594810177; bh=6dulyk5J0b5kPd52lL5YG9AkDa8kEpX5Tl54hn1nZXU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Koq+zkJFb4oCuYXxhRBPuCTS2kEzC7yWwoE3GTyIR+Kvs5M92gj2nCO7MDlFKbMF/
         ULyV6LI3qM05vjbu+Jl43IFfUEBUT6IdjBdYyAzfpWjsN2V74Fdv6oxSzXYseAoHPb
         8BP1nnNy5go2tWa7oWTerVPymj6adup8NZlVK5qD7DGiIer0za9vg/9jcVZEeOPH+m
         dmZI+UcvoI3aokFUocwBigZki/KTpYwxrqFUQcbOYWxbkn2PqT4c/JjgyOlgCNGqgF
         PUyqR+EGkbaT/hnWtTpqWEXcsydvYOIxAxVDaBIpVuMKHDXsMELfhYky4b1XYvda5G
         iJ+wzNsJ/i0QQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2020 19:42, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.9 release.
> There are 166 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 16 Jul 2020 18:40:38 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.9-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.7:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.7.9-rc1-gc2fb28a4b6e4
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04


Cheers
Jon

-- 
nvpublic
