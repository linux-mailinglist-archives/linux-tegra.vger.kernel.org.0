Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD045CB525
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 09:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730841AbfJDHif (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 03:38:35 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14071 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730636AbfJDHie (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 03:38:34 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d96f6fd0001>; Fri, 04 Oct 2019 00:38:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 04 Oct 2019 00:38:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 04 Oct 2019 00:38:34 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct
 2019 07:38:34 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Oct 2019
 07:38:31 +0000
Subject: Re: [PATCH 5.2 000/313] 5.2.19-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20191003154533.590915454@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <53dd9082-6f91-f267-1eb1-93f5c4ff00bc@nvidia.com>
Date:   Fri, 4 Oct 2019 08:38:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003154533.590915454@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570174717; bh=gxAowOsZ/W+EEjclBCzkG3WGOqH+gDKWLzCFwZDHEF8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RoBI49MN/RGRtaTI1cYuYalPt2HdCmhLXOIDpDENw6x60zzCkjNrPQEy18t+ADY2K
         rgMnvzfjTmEN/Xgf3w/HzY+/2KLmXMJYgf821ysbpODrV9vGZuNyeMBaVhYbcoNqW6
         yUw/h4IEGtdMeQnfKC+UOxGVG2DMyCKyQeBYGk95OXitsOSB7H1ErIikjBCwaXse5T
         2XNSSSi4OGaUe56021UGLY2sm5loDDCCxQS1cenlWfbhqYRtovONTRroUBETlZ9rgd
         tEs+0JZiynB6NKvS/jeUm5uCmFNu2oJRTCN9Ryso//ORnesHedGmDcG0X4XKgewsPF
         XthRF3CiN7yHQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 03/10/2019 16:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.2.19 release.
> There are 313 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat 05 Oct 2019 03:37:47 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.19-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.2.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.2:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	5.2.19-rc1-g2c8369f13ff8
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
