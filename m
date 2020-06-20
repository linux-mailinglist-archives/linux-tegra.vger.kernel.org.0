Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66ADD202306
	for <lists+linux-tegra@lfdr.de>; Sat, 20 Jun 2020 11:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgFTJwZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 20 Jun 2020 05:52:25 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12917 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgFTJwY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Jun 2020 05:52:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eeddc000000>; Sat, 20 Jun 2020 02:50:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 20 Jun 2020 02:52:24 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 20 Jun 2020 02:52:24 -0700
Received: from [10.26.73.131] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 20 Jun
 2020 09:52:21 +0000
Subject: Re: [PATCH 5.7 000/376] 5.7.5-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200619141710.350494719@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8d7dd6fa-3018-5da3-0736-0d58fad8fd68@nvidia.com>
Date:   Sat, 20 Jun 2020 10:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619141710.350494719@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592646656; bh=lD07L5NNMIdNB7yVyT49Fb0e5CR/+FCLThENGCom1R0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ERDMEpvcnrFy9hy/XA2paFCD893OOTdLw77+wY6+PIVUd/UDu1YYmXHYkwhpl0e2T
         kZUTcFgsOAgz6c75NrqSrbSqZLZUwQevJgdMylWP/262Zuze0DqTKfPQOAy2MrFYj4
         0hXPu7SXKZzBn+8kkxOq9q7CIh+PN/vSHisXFLQwf/pgWzhYgl0a3vBl/7w4vQIbC9
         iGGwjil0Uwz/afT4jbgn1kIBLD9oNVgZEedCpK6ge7d8W6fDaRfFleYlDF/pW1Q1Mz
         +mNB9FfWyCM54o5cUmox1tKrd2yiFkKAEg756IOYYR0vmVlqPCDrIBb41GCi6ZGsZC
         kNw5k0vfMlRpQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 19/06/2020 15:28, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.7.5 release.
> There are 376 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sun, 21 Jun 2020 14:15:50 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.7.5-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.7.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.7:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    56 tests:	56 pass, 0 fail

Linux version:	5.7.5-rc1-g19411dc6b061
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
