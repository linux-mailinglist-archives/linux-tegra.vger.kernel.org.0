Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74EE140A98
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jan 2020 14:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgAQNVH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jan 2020 08:21:07 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9211 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgAQNVH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jan 2020 08:21:07 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e21b4ad0001>; Fri, 17 Jan 2020 05:20:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jan 2020 05:21:06 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jan 2020 05:21:06 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 13:21:04 +0000
Subject: Re: [PATCH 5.4 000/203] 5.4.13-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200116231745.218684830@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <25658ca7-fa1a-303b-7a75-099b9bcf235b@nvidia.com>
Date:   Fri, 17 Jan 2020 13:21:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116231745.218684830@linuxfoundation.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579267245; bh=27gvYn8c0XyLdxDIFt9pEGPaVy6Ucera7mFjnECD8R0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=B+BBN4O2/jUeoYZ8FyI/TgRD/ZnvZYFdCCtksrWrWSLuFx+3sT36NGcO86Zc6St+R
         J0ijb3dG7QtAgQPHawH5wqBTgq6Hk/2RGI50yePXciAWuAxZU6X/U4n9LPUHDZ5Hj+
         L5vEZnf6JUBfbaY1a45yt8+SvImikDfFuPSVjQXMpNXp1hlqGASOxi4ngE0CpCj8Fi
         dVbQWcc2c5mFkNK7NriLH7HjO5bfzxc87H/0FbNO7BUg0k9tzWtDKkCVtYygYH5J5P
         yQwx8Guq1TqmSDh82SIPsmkyIBpl747fu4teMGdnDWW/lKkM1AlCw8PAaVmWaidGN8
         iy//mcRCIrPEw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/01/2020 23:15, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.4.13 release.
> There are 203 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 18 Jan 2020 23:16:00 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.13-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.4:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    38 tests:	38 pass, 0 fail

Linux version:	5.4.13-rc1-g3c8b6cdc962e
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
