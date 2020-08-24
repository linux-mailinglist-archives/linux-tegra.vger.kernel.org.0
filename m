Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B5825072A
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Aug 2020 20:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHXSJP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Aug 2020 14:09:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5570 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHXSJB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 14:09:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4401c60003>; Mon, 24 Aug 2020 11:07:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 11:09:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 11:09:01 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 18:09:01 +0000
Received: from jonathanh-vm-01.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Aug 2020 18:09:01 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5.7 000/127] 5.7.18-rc2 review
In-Reply-To: <20200824164741.748994020@linuxfoundation.org>
References: <20200824164741.748994020@linuxfoundation.org>
X-NVConfidentiality: public
MIME-Version: 1.0
Message-ID: <94d251dab39741f288905cd2a863643d@HQMAIL105.nvidia.com>
Date:   Mon, 24 Aug 2020 18:09:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598292422; bh=ofXukPb4xQATIwbT3kOVEDCdFSAr9EkJ6Iwhy59DfQY=;
        h=X-PGP-Universal:From:To:CC:Subject:In-Reply-To:References:
         X-NVConfidentiality:MIME-Version:Message-ID:Date:Content-Type:
         Content-Transfer-Encoding;
        b=FmeFXgWJNORUIK7HsEWHicT8AQe7Dced0qnnIsHIRsbAVpJjnqQgtewtfXxS/TJSY
         VJ+oYmWfLZIiIhOG8t8mV7mSLRgUhR0nsJfZKf8WCiCwxdInk7j5x/ZDEw92lRtuJs
         ebRIllGmtEa5ULXENitVrf+1XHpnXxjCe90dM1vwejYzf08OnmvYdth40tSZ2RYxiK
         2ShufZN8Edxw2jv6Mu3LesrBEFVnwnHmyzulgxn/piKOmT0GQkuAI9eE0NfJLliUCX
         ZUv3afPArKaogBRxexGTREs6KG6EF3Nk4CeE0QAnozl8El5IcXtyX6Wrn/vdB40Ysi
         mMMHfHUlU6xFQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 24 Aug 2020 18:48:33 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.18 release.
> There are 127 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed, 26 Aug 2020 16:47:07 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.18-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v5.7:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.7.18-rc2-gf16d132bb2de
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
