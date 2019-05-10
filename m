Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8BC119B6B
	for <lists+linux-tegra@lfdr.de>; Fri, 10 May 2019 12:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfEJKR3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 May 2019 06:17:29 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1201 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfEJKR3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 May 2019 06:17:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd54fc00000>; Fri, 10 May 2019 03:17:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 03:17:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 May 2019 03:17:28 -0700
Received: from [10.26.11.182] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 10:17:24 +0000
Subject: Re: [PATCH 5.0 00/95] 5.0.15-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190509181309.180685671@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <912cf693-6a06-e186-eb94-5fb20146aa24@nvidia.com>
Date:   Fri, 10 May 2019 11:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509181309.180685671@linuxfoundation.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557483456; bh=oJiGzx8ssLDRt+sn91Scjb0FtmanI0XedaTgZ35AC00=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UuGM/3hWpA4u4fUpk7RNU5hwIZS21WBV2K0DQ+SIYOPr8yGphGRbcBeW7UaAaA6tC
         Gk28IfHfqb0UsURqSsWno/cdlt8EHVLf5vl9Uzxk1As8mvYMO3qcFFElWaqfvBVf0F
         2DJrpdRlZ3qNmSjyN54LR6hyQBXw+9OsIE10h+oY05Dg4LKFxpI46sJiQyAVRosEOy
         RogYhRwE/eJrrDd47q+ltQC+doXFqQsBe7ywBECZBOQi6qDlfEytrFRAHR+qnnZIDA
         gdZUTonPVO8zr7Qb2SL4DbLRmwug3Q9npX8r7m9h8t/25dHfm4FXrWL2DxUjnMgXUy
         P5jneZSMuMC3g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/05/2019 19:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.0.15 release.
> There are 95 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat 11 May 2019 06:11:22 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.15-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.0:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	5.0.15-rc1-gdf13766
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
