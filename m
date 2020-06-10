Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A771F533B
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 13:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgFJLay (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 07:30:54 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14256 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgFJLax (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 07:30:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee0c4110000>; Wed, 10 Jun 2020 04:29:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 10 Jun 2020 04:30:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 10 Jun 2020 04:30:53 -0700
Received: from [10.26.72.59] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jun
 2020 11:30:29 +0000
Subject: Re: [PATCH 5.7 00/24] 5.7.2-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200609174149.255223112@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7208a2cc-c439-57bc-f154-a23e6ac683f5@nvidia.com>
Date:   Wed, 10 Jun 2020 12:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609174149.255223112@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591788561; bh=GsIIfv0RxTft168UtiBuDmZd7wbKQQsUU+u0Jmb5/qg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=n5DAZOGfWB9tiqbKywER04sO0xPElihsfKetQ+5Vlg+vRU4zDacoCpaIUoItOsL3S
         u4R/04THOxsWt+zHwiTTFtd8wMa+C5AlR8pB+XKTiz3+I0Ut1D1Xd2IhY8V7XGuZ8u
         7OeGrqpwsjE9nTBon7NLLs6KiiS43nWeqotQkVDVJZACC2tTB0Xu8TvP+fPX4dMJ9n
         URPWTFl7Gk0cwaRXSgqSvIZsB+ZvImTyReNF8YzA42iTbG64M6Bt/ihagPqhK7XBhY
         G1mP9i4iTgJP7tr0L6K44yGsxwx7FPRCRwlvdpjEe7TDYAOt66F83VawkcV5Q/z5Vd
         209r8XH87uYGw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/06/2020 18:45, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.2 release.
> There are 24 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 11 Jun 2020 17:41:38 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.2-rc1.gz
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
    50 tests:	50 pass, 0 fail

Linux version:	5.7.2-rc1-g00f7cc67908b
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
