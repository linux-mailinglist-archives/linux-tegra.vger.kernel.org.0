Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F201A0DC8
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Apr 2020 14:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgDGMhK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Apr 2020 08:37:10 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18715 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgDGMhJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Apr 2020 08:37:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8c738e0000>; Tue, 07 Apr 2020 05:35:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 Apr 2020 05:37:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 Apr 2020 05:37:09 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr
 2020 12:37:08 +0000
Received: from [10.26.73.75] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Apr 2020
 12:37:05 +0000
Subject: Re: [PATCH 5.4 00/36] 5.4.31-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200407101454.281052964@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fb1eb01e-af93-105d-6272-e973f0ad4e11@nvidia.com>
Date:   Tue, 7 Apr 2020 13:37:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200407101454.281052964@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586262926; bh=b8rQQsHbl604+XF06rnKBM1Zw3iYYIZWpkjjKW/n5kc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=jsK3toCGPYyFBYftusuyrmTa2Cf01FhFOyDUqsg+xOulmaQoFDJy3naQnsBwSiPgD
         FQFsOn++LZUxMoHr5TR0LU6F0OSx9hwiwTdxFk3PW0JYtZWl1S/45vuBiu0SR2NHeB
         bFc0Lj4fW5+yrASbknaa9ko7cEY8VbCAt0PYP5pLKOVl4dQdHYWtu97X7GmKL0QW0z
         pDuvrqSBAX3KMcdJCaxE0guyFdMEzGVXB5nEIvV/YojQnk0L8Zx2JVS2BJ8xviuHcP
         wNJbKxubVIJmH4nIflwHVPY4RBo1Gv38cEW961J5v4qbgjVVE9iEVv+/3uM2AvyPFz
         enmAm6ML+YlBQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 07/04/2020 11:21, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.31 release.
> There are 36 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 09 Apr 2020 10:13:38 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.31-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


All tests are passing for Tegra ...

Test results for stable-v5.4:
    13 builds:	13 pass, 0 fail
    24 boots:	24 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	5.4.31-rc1-g40da5db79b55
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
