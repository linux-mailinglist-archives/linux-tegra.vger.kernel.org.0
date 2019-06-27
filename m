Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83D457E59
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Jun 2019 10:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfF0Iht (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 27 Jun 2019 04:37:49 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5726 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0Ihs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jun 2019 04:37:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d14805e0000>; Thu, 27 Jun 2019 01:37:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 27 Jun 2019 01:37:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 27 Jun 2019 01:37:47 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Jun
 2019 08:37:45 +0000
Subject: Re: [PATCH 4.9 0/1] 4.9.184-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190626083606.302057200@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a2147ac3-c604-6119-f61e-690ba6ca9131@nvidia.com>
Date:   Thu, 27 Jun 2019 09:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626083606.302057200@linuxfoundation.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561624670; bh=RQR/z5ROe/FE7FSuDVTSt0jSIMLCbwVV1Gpw15ehRUE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RVcNZGZNShkwSL5HBocGC9D5O/OPFcPhbbWfD+vpR8LYlDuecZBX+z2H6UycXeDXI
         a78G0eCdgOnleL8BHgA+zl/YJTrUu1l1YaeNZDfMQCV1uGKp+IJhSFHvrXCbVsfqvT
         DbjsT1TK2QtFk+oBsPoeEp6UGNb784pIpz9217+PU6hVDl9xgwmaoe07LtJ1it6PLF
         fcXviIdvbmyNE5RzUIuxQfvT4EQLbx22WL7GuIqmW8g5FbG+72NUWwHXSvbvTCZOab
         NP49MpcD/3rMYORMYYgr+LJyRh+SbRZCdTpkHtJinmOdQl+1+RFOPO0aKNkYUmPvAP
         7dlPJYPbfBZiA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/06/2019 09:45, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.184 release.
> There are 1 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri 28 Jun 2019 08:35:42 AM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.184-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


All tests are passing for Tegra ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    24 tests:	24 pass, 0 fail

Linux version:	4.9.184-rc1-g493abc5bd149
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
