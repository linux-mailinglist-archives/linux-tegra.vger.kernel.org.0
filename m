Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F8F1A0DCC
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Apr 2020 14:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgDGMhh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Apr 2020 08:37:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18732 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgDGMhg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Apr 2020 08:37:36 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8c73a90000>; Tue, 07 Apr 2020 05:35:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 05:37:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 07 Apr 2020 05:37:36 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 12:37:35 +0000
Received: from [10.26.73.75] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 12:37:32 +0000
Subject: Re: [PATCH 5.5 00/46] 5.5.16-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200407101459.502593074@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <199fe542-6a96-7b84-06cc-c902140b9eb7@nvidia.com>
Date:   Tue, 7 Apr 2020 13:37:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407101459.502593074@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586262954; bh=fqvFleIixLUNgNh43TyuSxsyEN9NmXQwyWYBRPJyceo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Xn6i5hO5vhYigvMR8tR7+kGrvh6cI8jLw39Q2ekklYpanMYdHSeeKHDLJlIYtOsGC
         72bNAEuOXSrjRhUwijKDWv4eUQ8a1ow41Ck7BXbo8hk00UZQAoeF79gfjbJ75GhuqA
         tF0VP1vFROMTDjOcD2Rs6OUhHBxfzZNzvMZ4iZ/n6rxYkbXNbScWuUcPRJ6L9cm87t
         mYtFsAa90bPuhwdpq99T9GSLLvwmERfN+dQ+wu0I2pBllO/5w/grdKfEn88rm5nXDv
         UXqrvGKgYoVYgcs3HE/YT81Kd29RDD6AeeTZNSvdzPNVL2ivLzM04kDh7lbkgRXz5K
         pjDFraE+SnrlQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 07/04/2020 11:21, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.5.16 release.
> There are 46 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 09 Apr 2020 10:13:38 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.5.16-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.5.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.5:
    13 builds:	13 pass, 0 fail
    24 boots:	24 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	5.5.16-rc1-g5052d9d1233c
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
