Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085271E3BFD
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2020 10:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgE0IcH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 May 2020 04:32:07 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15514 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbgE0IcG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 May 2020 04:32:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ece257a0000>; Wed, 27 May 2020 01:31:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 27 May 2020 01:32:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 27 May 2020 01:32:06 -0700
Received: from [10.26.74.131] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 May
 2020 08:32:03 +0000
Subject: Re: [PATCH 4.4 00/65] 4.4.225-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200526183905.988782958@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ccc743ba-8793-d7bb-c7cf-6d60da80b35e@nvidia.com>
Date:   Wed, 27 May 2020 09:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526183905.988782958@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1590568314; bh=3tt2dF2V7/kCgzeSVLYjR3TOjAsuScqeV8pK46xs0cM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=M32ykJnznA6rctrHnjUQQwrBn/gr9KfLbpjLksT8+CoAjVwMF4i98ITjBvrnMOzNT
         gF5BWyTuWNpBagaTIzk2HvxywgxDDZ3As/zbkeUjVMiOFqrmV4UYOOFQI5fwT1jv8c
         TghthlBnE7xgK37DcYipTtWv15H4yZa3ZKmU7AgWWKe6gu9zwgp2idd0sc7+sHBXO/
         t4e6QQ4Qbjv4QKtzlkKMQJz54jOBkr9I/ihKmxv8FMaAvq9wLMXxDZFHKv7I/IF8rA
         pmsFaeKj5vhWaquDpth5IB2d/nW1Cl3aKoknbedKp8P3qGg2UluJ2EKvzchTxIil1n
         LMrxuJrOam7ew==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/05/2020 19:52, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.225 release.
> There are 65 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 28 May 2020 18:36:22 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.225-rc1.gz
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

Linux version:	4.4.225-rc1-g1f47601a4296
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
