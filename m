Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E177163EF
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2019 14:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfEGMpJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 May 2019 08:45:09 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:10536 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEGMpJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 May 2019 08:45:09 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd17dd00001>; Tue, 07 May 2019 05:45:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 May 2019 05:45:08 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 May 2019 05:45:08 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 May
 2019 12:45:05 +0000
Subject: Re: [PATCH 5.0 000/122] 5.0.14-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190506143054.670334917@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d0683ebc-a3d0-c726-cf69-40d55e52e845@nvidia.com>
Date:   Tue, 7 May 2019 13:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506143054.670334917@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557233104; bh=z8eBBt/ftcusB8sv7i5DphK4f+siDOoKbWArHa4qBOU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=j2AXwDjyahFkXfgUcJTo2vqVyxzTs39u/8UId188fBKqXbo7NIyDCZLDrTLl4ZJqJ
         5J8nbhR0O6j0ed2pisbVZlZnmZYEBTKqUioPRrXMCvIfmf+55LLiqejIGb7Ytlrbkx
         2mNwqsQN3MF5ATNHaQDpYh+nLxKYEu5qGFjZ/ppnaCvfnGBVPbb4CZbyiNmCowxCsd
         g7vStm/H8ONwhNXLdIhTubm9BpyMP+yMy+v7cGFAH72t2UFL90Fey373zFAFW1BVXa
         eEDpHJStDF1DALA6iUPa1u48sd8UPVUhlCSRDT3tqHuXst/2RPdiw+Xve+O6hb5v0u
         bFSZsX0bzG4fA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 06/05/2019 15:30, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.0.14 release.
> There are 122 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 08 May 2019 02:29:09 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.14-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.0.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.0:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	5.0.14-rc1-g5b4a1a1
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
