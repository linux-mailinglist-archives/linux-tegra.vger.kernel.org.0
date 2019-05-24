Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3ECD2968F
	for <lists+linux-tegra@lfdr.de>; Fri, 24 May 2019 13:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390850AbfEXLFW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 May 2019 07:05:22 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12755 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390808AbfEXLFW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 May 2019 07:05:22 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce7cff00000>; Fri, 24 May 2019 04:05:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 24 May 2019 04:05:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 24 May 2019 04:05:20 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 11:05:18 +0000
Subject: Re: [PATCH 5.0 000/139] 5.0.19-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190523181720.120897565@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <dc558022-94e7-7cb6-956c-12b3c725e475@nvidia.com>
Date:   Fri, 24 May 2019 12:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523181720.120897565@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558695921; bh=jhG50WTwPNveZTbJtBPyWZG34FEcQGwnAu8nIfcYYMQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RBWVP8KpfL3oP9O8H4+uNZO/Clc0k8+R02j8hlBmZ6EZYXT/w4hxThTB4795yyeUG
         uPWvfh91hQ5ewHBNh0bm7RUSizQMtCBuIG6feIdvH3vJ3vICVIXaRK4ykQAzbpNLf2
         jVlMgWpMEd5WVsqjaADVgb7R5jmUi6Glliit9GnCYELYPl73QnPXV9izIokYizCIyv
         ivreCukJCFp+wE9h4awE3ezlRTXPBzx5lpDFaGO33XvPSJusZ3EbuCMMLubeE0UfCg
         YaXP+uO1a8k0EVgmFHIeeO+3JrtKVEpEp86SuJO/9jmtQQkYJEpLcmRCQQasOZPawD
         CFsUkeYQQPRVA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 23/05/2019 20:04, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.0.19 release.
> There are 139 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat 25 May 2019 06:14:53 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.0.19-rc1.gz
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

Linux version:	5.0.19-rc1-gc780292
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
