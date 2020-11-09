Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9262AC022
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Nov 2020 16:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729829AbgKIPns (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Nov 2020 10:43:48 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9088 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgKIPns (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Nov 2020 10:43:48 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa963b00000>; Mon, 09 Nov 2020 07:43:44 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 15:43:48 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 9 Nov 2020 15:43:48 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.19 00/71] 4.19.156-rc1 review
In-Reply-To: <20201109125019.906191744@linuxfoundation.org>
References: <20201109125019.906191744@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <52bcc88ba6b94aeb981d90d274c2bca7@HQMAIL111.nvidia.com>
Date:   Mon, 9 Nov 2020 15:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604936624; bh=nima8uvAh1EemmzdCSV1vRO7nT46zNXVk8hgRz4fcLI=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=W/hfSHNdsfyJLbFE/nsE7zLr9llrwEY30qbsesg84A9rrtx4PsosJOKdr78pQWPyp
         uxaOBBEfJQTbP9jP/2k3eBh3XxkLAibG3Wji/q94OF98pZ8ubyNPjJFVf84UDp5RoB
         f9PHY+DwFtjD/d/MJvF74l0npwv+l+bbEj42zwH4YJup6J8/uqe3EAvIyogyZiW4IS
         0+/uXLq1vFDy45GxWIYdjHnnypwoTGoXKq4rIT5TUnru04/sSpS0I5ZzORv8zLfabf
         qlL7RWZRCh5SvI7iHAY/ftP3XPIxlUbKBE9t23z8BwMElBO3arWUccKv7Qts+4kb/y
         XCVkfDLlHmJ0A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 09 Nov 2020 13:54:54 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.156 release.
> There are 71 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 11 Nov 2020 12:50:04 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.156-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    15 builds:	15 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	4.19.156-rc1-g4d10cdd4ac50
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
