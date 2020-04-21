Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A101F1B235E
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2020 11:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUJzo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Apr 2020 05:55:44 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2381 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgDUJzn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 05:55:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9ec2e20000>; Tue, 21 Apr 2020 02:54:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 02:55:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 02:55:43 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 09:55:43 +0000
Received: from [10.26.73.24] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 09:55:39 +0000
Subject: Re: [PATCH 5.6 00/71] 5.6.6-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200420121508.491252919@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <59a68f6a-d37d-6a74-14e4-648861637185@nvidia.com>
Date:   Tue, 21 Apr 2020 10:55:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420121508.491252919@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587462882; bh=pMaE5yRyDZriRrcyyApCh8QUIB9DdX4aENZQuAnSp+g=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=f8nO6bCyCwSrERsHegb/v3/K8uuBonDU2KtnVbIYbqsTbY7T1gVrX+ue1KKSEh8JT
         5cVXCH8r8NlMbeGRg2qScszNfT/StKHWVF2P+IFKs4WtT2BLche0NMoOOKLPFQ96AF
         tRACGI/1dw0KhuF3jSqWu+JTMyE3U/DX/JuxXztTpJnTCKNXnOdlCdEbwpJUutQ4bU
         KIaS8xg7RAQ0rUqNI3Xnec0Vu/URbDidFaGGy3eQ7HVYLO1bRlZ0UB+OePcxxKwCG/
         V/k8lzaVvxZaY/bWLa15cvWSvMr7aa2ybTdxltcW5nQVWsGVjtBemY2xlW4fTrzCje
         hqM6oL8EVduJA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 20/04/2020 13:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.6.6 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 22 Apr 2020 12:10:36 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.6.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.6.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.6:
    13 builds:	13 pass, 0 fail
    24 boots:	24 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	5.6.6-rc1-g906ecc0031ed
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
