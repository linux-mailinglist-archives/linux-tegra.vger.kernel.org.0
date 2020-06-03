Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADE11ECA95
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 09:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgFCHaP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 03:30:15 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14317 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgFCHaO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 03:30:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed751250002>; Wed, 03 Jun 2020 00:28:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 03 Jun 2020 00:30:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 03 Jun 2020 00:30:14 -0700
Received: from [10.26.72.154] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jun
 2020 07:30:10 +0000
Subject: Re: [PATCH 5.4 000/139] 5.4.44-rc2 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200602101919.871080962@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8cd6c3b7-7f1a-1a7a-9d60-8a814b164698@nvidia.com>
Date:   Wed, 3 Jun 2020 08:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602101919.871080962@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591169317; bh=fZAEcwv5gLvFlFnhS4YScQ780WLLoVMhSbg3sT199b0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=R9cVMKx9Ap290TRhrlkEC0N67dVtkGvt+AnvpLV5OGMTknL+OhzLvni4tJz2+OQta
         Er6wwXhprzy7ZT1js1t1sKYe1XvgYGUYi23dEFoKfIDNZ0uSnwdh+Ly2Nr4us60vAT
         obYxO3xRabkaQxCpMvhQcJL8liMnDI98vGZZVr4TzGffSjDG8/fJ6uutn+YTjJsWYW
         hgXXlZFVMsoOvVe+o0A6HJZTOh75WIL9iynPHOjy26SOSd+alU5a9cfU/r7G9tVZ30
         fbyiBQHTHXbcKb6WLpLzxKTe4y4d7EAG8aQqgmBXhcGRon3Lu4I2Ld6g8qxjZYLFhe
         r60i9SvI1zH2w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/06/2020 11:24, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.44 release.
> There are 139 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 04 Jun 2020 10:16:52 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.44-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.4:
    11 builds:	11 pass, 0 fail
    26 boots:	26 pass, 0 fail
    42 tests:	42 pass, 0 fail

Linux version:	5.4.44-rc2-g2ad6b0698b0e
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
