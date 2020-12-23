Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D121E2E20DA
	for <lists+linux-tegra@lfdr.de>; Wed, 23 Dec 2020 20:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgLWT1U (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 23 Dec 2020 14:27:20 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9933 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgLWT1U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Dec 2020 14:27:20 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fe399ee0001>; Wed, 23 Dec 2020 11:26:38 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Dec
 2020 19:26:38 +0000
Received: from jonathanh-vm-01.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 23 Dec 2020 19:26:38 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.10 00/40] 5.10.3-rc1 review
In-Reply-To: <20201223150515.553836647@linuxfoundation.org>
References: <20201223150515.553836647@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <796530b145704445910cea10f27a4267@HQMAIL111.nvidia.com>
Date:   Wed, 23 Dec 2020 19:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608751598; bh=8jDy+y0IwnCupso5faPxT4ZLDxpEk/20DpxinHNA1V8=;
        h=From:To:CC:Subject:In-Reply-To:References:X-NVConfidentiality:
         Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
         Date;
        b=k65WZ7CpFGA8PPcVqzW2Xj8/ds8Uogoh5OlxNS4YH75PvrOOmvtZmR6Nd9lQEqfnL
         W1MtDbA+eDMEmxSgC2YimG1eFaW5TUNwJOk/iZSDKGQWjXnF40JmoN7U0MlkW+JD7o
         QvZlTJcGupAvs5h/wlYeuJWtfhIjPDFOMZOI22oaaxzj8a8wG/kBg+8AwWoEkenQYD
         fiIgF8Jglmklm0cSz4KKqxC1eFB/oUJQ8DF+fa2bMGkm34bbdbw1qzZAc3dsDMBOUE
         SN/MH2CN/S6UqI5eFq12PexfC1/Zw1nLky04y9LLFYircU70Abyrr5+d/+PHSM3GsA
         rAj5JEjph0jbA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 23 Dec 2020 16:33:01 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.10.3 release.
> There are 40 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 25 Dec 2020 15:05:02 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.3-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.10:
    12 builds:	12 pass, 0 fail
    26 boots:	26 pass, 0 fail
    64 tests:	64 pass, 0 fail

Linux version:	5.10.3-rc1-ga5ba578b5228
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
