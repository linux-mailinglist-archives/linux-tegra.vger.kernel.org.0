Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326142E6BDF
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Dec 2020 00:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbgL1Wzx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Dec 2020 17:55:53 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10567 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbgL1UTF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Dec 2020 15:19:05 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fea3d910000>; Mon, 28 Dec 2020 12:18:25 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Dec
 2020 20:18:25 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 28 Dec 2020 20:18:25 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.4 000/453] 5.4.86-rc1 review
In-Reply-To: <20201228124937.240114599@linuxfoundation.org>
References: <20201228124937.240114599@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <01c137002d0a45b194caba0b78c153f3@HQMAIL107.nvidia.com>
Date:   Mon, 28 Dec 2020 20:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1609186705; bh=S0R+2Yr0rxZu4J7adXQCYD+ocOT23ypjJhgIdKPEQX8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=B7k+sQ5R5z5wcJ5ucaZrOYYYidrlXewLo5GUQfJrkSdkNimtNOE6nKF3oxk3LS2Jl
         cPuLXRI7rmzqXmAa4QSz501+9d8GIQnsfDM+2J3/FpxS/Br5YKrOKWDETTVpKveMsZ
         3TaqYjBbPcZdann6Q1I6zVUKE6qS80z/r6v0kMuBNRDqi1ekRH0XmXBrlmSdJlB/Kb
         GLAmoYMJGmAlDFcwqYgqJc+guTcug9J/ewo5OP0kSpMjgWs3auDOQosmPzkNB2GDQV
         EsYd/0P9S8oAk7Yhia+hc6VNgqvRyl6Ou0VG8WAOR9ZUf00e1Cyimv2LHEVDtV5AIb
         47AccWcz9n41w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Dec 2020 13:43:56 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.86 release.
> There are 453 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 30 Dec 2020 12:48:23 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.86-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.4:
    12 builds:	12 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.4.86-rc1-g11e71509ffb7
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
