Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82532DF58E
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Dec 2020 14:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgLTNht (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 20 Dec 2020 08:37:49 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4440 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgLTNht (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Dec 2020 08:37:49 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdf53830000>; Sun, 20 Dec 2020 05:37:07 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 20 Dec
 2020 13:37:07 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 20 Dec 2020 13:37:07 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.9 00/49] 5.9.16-rc1 review
In-Reply-To: <20201219125344.671832095@linuxfoundation.org>
References: <20201219125344.671832095@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <fe0ddbc7c95741dfafad875a0b662af4@HQMAIL101.nvidia.com>
Date:   Sun, 20 Dec 2020 13:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608471427; bh=X5MVrtlg6S7l1rMKdJTqlxsRPmdK3qRJsEQpVTumvi8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=TTtxh67eE8yVGNF0QwuCJQjJggP+8K5O+dVBTjppc7rmwIwDFAgZ8ZZ40R9CPbffL
         cG+DIIpHvyc5nFJP6QSOFMQbj7G1mFnqhVIhCHmxX+/RRp9bmdQEGknlZQmnDPupJ2
         OZfquhfzOGltC7Ckjh2meFzvwkxhUjkCwLUc2+f378L7Ay2x0NLe97eDNQ5bNUG/pP
         rgO9wU8TDSjUiGLTFANm4TKxpVDuX2kNj4x/N5egW54eGb7f0SE6dp4h7+BL/oi6ho
         xI+6I8y6mL+///7IMmAnOwFwDgcSrVl+jGmlMYGNjmsrmFSMuknBKAmoiovQzWoqUa
         jiaqvKsiNZUGw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 19 Dec 2020 13:58:04 +0100, Greg Kroah-Hartman wrote:
> ------------------
> Note, I would like to make this the past, or next-to-last 5.9.y kernel
> to be released.  If anyone knows of any reason they can not move to the
> 5.10.y kernel now, please let me know!
> ------------------
> 
> This is the start of the stable review cycle for the 5.9.16 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 21 Dec 2020 12:53:29 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.9.16-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.9.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.9:
    12 builds:	12 pass, 0 fail
    26 boots:	26 pass, 0 fail
    64 tests:	64 pass, 0 fail

Linux version:	5.9.16-rc1-g345f3d037fc5
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
