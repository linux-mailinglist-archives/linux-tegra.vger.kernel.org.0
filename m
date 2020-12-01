Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8532CA407
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Dec 2020 14:42:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391105AbgLANkJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Dec 2020 08:40:09 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4901 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387823AbgLANkI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Dec 2020 08:40:08 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc647900000>; Tue, 01 Dec 2020 05:39:28 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Dec
 2020 13:39:28 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 1 Dec 2020 13:39:28 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.14 00/50] 4.14.210-rc1 review
In-Reply-To: <20201201084644.803812112@linuxfoundation.org>
References: <20201201084644.803812112@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <9ad15b4673f94eceb70d361d3a46c202@HQMAIL107.nvidia.com>
Date:   Tue, 1 Dec 2020 13:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606829968; bh=5v/I57oLWmYickjKvUos65N2kjUawPc4iYf2HBLF+aA=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=HEvEtDLzXcj6k9j7VmNxzq4RuQSTkPIdPzhAA0F0/YrDCJ48QENtSSTnckLp/L4tG
         cnRvQYuuht6qwwG396JB3bIzppN62um1m98+HvnofrZUL0q4LYsJlywqbCLQ3VyCfF
         T6o5hlJnPOzjYitbYE60SDtUaoXh15A9a4o0kykiBKgch3X/fGNuuJ/V8OPqAWtzuY
         lXzpxYoh3Gkh8RfUzxbB8pxDIpnWTKcX72+MAJmweKl4ZFQB8tImQIXa2ADzL6W1Cp
         Ij+yDCv1fMvl8D/x7z6rpHZrBaqpI1PEFGmpvuSiqGsHmdS5/4vsdPOHxQ5kQd85WU
         eWWsokmLp/Pqw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 01 Dec 2020 09:52:59 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.210 release.
> There are 50 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 03 Dec 2020 08:46:29 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.210-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.14:
    8 builds:	8 pass, 0 fail
    10 boots:	10 pass, 0 fail
    16 tests:	16 pass, 0 fail

Linux version:	4.14.210-rc1-g07930d77d7ba
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
