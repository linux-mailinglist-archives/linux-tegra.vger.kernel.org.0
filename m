Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8341832F1C5
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Mar 2021 18:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCERv1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 5 Mar 2021 12:51:27 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3038 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCERvJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Mar 2021 12:51:09 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60426f8d0008>; Fri, 05 Mar 2021 09:51:09 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Mar
 2021 17:51:08 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:51:08 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <jonathanh@nvidia.com>, <f.fainelli@gmail.com>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 4.9 00/41] 4.9.260-rc1 review
In-Reply-To: <20210305120851.255002428@linuxfoundation.org>
References: <20210305120851.255002428@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <f684d9640a044eabb0bcf7d7ce65b384@HQMAIL111.nvidia.com>
Date:   Fri, 5 Mar 2021 17:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614966669; bh=xJ0RK7mSH2e7vIb1QTDPukmu/w8/4VPRYLfjYfhynBM=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=YlOqHWzybRTpENLOpPrrB/MZGyoQoSA0yII/C71RS/anrA9Ce/AyMEgSgRyooP2FX
         YErlDhp0DLmAFeZeAeRepvfZoOQUsPion3Uan4EYYwK/qDk2j0IhgtbuiIxu0O2QGh
         JnX3cWuCJwiyoKaavUCxPZZnpsl/Ma1wKZa0PbCZsFtvqc50RvJlnSZ4TuHMs1TW5u
         tzxCkyeCWbo7pEAdp4jAQVjituRWmQlCLEo5MLsWN7+aCVjQ8tGayKFLCJlxiOTs/H
         hEMu7STTDb+IHKAI/oZaFSNuTDQARKMf9gazNgqneKni8aZFii3q7OYy0w5PL3AujI
         I4w6nzy+myLJQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 05 Mar 2021 13:22:07 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.9.260 release.
> There are 41 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 07 Mar 2021 12:08:39 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.9.260-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.9.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.9:
    8 builds:	8 pass, 0 fail
    16 boots:	16 pass, 0 fail
    30 tests:	30 pass, 0 fail

Linux version:	4.9.260-rc1-ge118f9b98b96
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
