Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3322D6CBC3
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jul 2019 11:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389549AbfGRJVX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Jul 2019 05:21:23 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:10400 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbfGRJVX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Jul 2019 05:21:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d303a120000>; Thu, 18 Jul 2019 02:21:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 02:21:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 02:21:22 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 09:21:20 +0000
Subject: Re: [PATCH 5.1 00/54] 5.1.19-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190718030053.287374640@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <88d64ff4-9509-2813-4485-dae855b39f8e@nvidia.com>
Date:   Thu, 18 Jul 2019 10:21:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718030053.287374640@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563441682; bh=DQDMxntRr2m9V/g5mRz7KY9HBsu/k5m0kWJFEj19UH0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=dMeVoXC9bqCrEZgUUTmsDmpYMbS4Gu8TBrRXHXCpGa0AR+VyAzxvnk9wFn5p3BjoI
         4PF/7kuintWn7g0+NXY5ZhFbVZvSJ3UiFJJco+t0reSyvi9UkbjY6eT/xvjgXdsjU+
         IOsW11w+ZbOYT7m5GOZOvEa/H/PmLl8E61eKR7d4rI76RsneaEXm8JtrkBwTmICKK5
         SCgWrGg9I8fhgb/KgBjxx7eLZuhwf9SgQAuQX6kKAvhqD64ogSc1NU16WsSHgF+VXR
         Pte4YkYmZfUu4i/cdGSmeAwQrMkgCFVAQ0CSA8fQb9jnqhSdgqs6bZrHTkNVYnsFjZ
         KSVrxpRiMCJWA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/07/2019 04:00, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.1.19 release.
> There are 54 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat 20 Jul 2019 02:59:27 AM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.1.19-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.1.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.1:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	5.1.19-rc1-gf7d61f5b654e
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
