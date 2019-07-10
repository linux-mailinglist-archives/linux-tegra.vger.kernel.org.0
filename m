Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C169640FB
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jul 2019 08:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGJGMe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jul 2019 02:12:34 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1800 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfGJGMe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jul 2019 02:12:34 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2581d00000>; Tue, 09 Jul 2019 23:12:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 09 Jul 2019 23:12:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 09 Jul 2019 23:12:34 -0700
Received: from [10.26.11.158] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Jul
 2019 06:12:31 +0000
Subject: Re: [PATCH 4.14 00/56] 4.14.133-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190708150514.376317156@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <741eb65b-6d60-56f4-cede-5ce213a035ba@nvidia.com>
Date:   Wed, 10 Jul 2019 07:12:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708150514.376317156@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562739152; bh=sDn6tYgl4tFH3IIy85KyzkkxLxzSaY7zf2D0YcO4f8M=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rmaT4ItQTsFoQX3B4LRnsD74o62BG80ypgW+tk0BwdNC6ry/KuJpaemFjbVn2/hLZ
         MZXmvozCsr4aNnWDq3ZomBjuQi8ZnJBPANHIe8B2kx0Yegaktx7AQrN018H+31w883
         4Kn6Nz0n0F5YKcOXwgddEWJXzU/GxuS8F2qZZU2o8EGknVZWlqIAPuMwI7UArkY0Gt
         v4tPsDMP1uKXXqre058Q6nqcRo+PUYvQ99glhLnfFtqwWOg61M6Y3TjpMZu2qmY38b
         Ni/UyWYypBPzDuCJ0usHSYjaAnqRPGBfawZ66/zu1raVYIfLQ88Pytv/FuPRkDyrG0
         h4x9ruaiWHFww==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 08/07/2019 16:12, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.133 release.
> There are 56 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 10 Jul 2019 03:03:52 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.133-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    24 tests:	24 pass, 0 fail

Linux version:	4.14.133-rc1-g5c87156a66f2
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
