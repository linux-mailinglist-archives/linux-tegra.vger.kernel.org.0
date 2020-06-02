Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685C21EC01E
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jun 2020 18:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgFBQeF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 2 Jun 2020 12:34:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18823 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFBQeF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Jun 2020 12:34:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ed67f700001>; Tue, 02 Jun 2020 09:33:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 02 Jun 2020 09:34:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 02 Jun 2020 09:34:04 -0700
Received: from [10.26.72.151] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 16:34:02 +0000
Subject: Re: [PATCH 4.4 00/47] 4.4.226-rc2 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200602100034.001608787@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f6c8ef22-648c-e0fc-0dbb-5db8ab1801df@nvidia.com>
Date:   Tue, 2 Jun 2020 17:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602100034.001608787@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1591115632; bh=dO9FAXY2H297iJOHtU92SBoDR8kGdEM8PvbArK2JJjc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=TWk3STfzl2RVgJAsFHoalAhhDqkhz/gE6gHdPUrVyqiIkod6zeAIu8fi0SbDG2SZz
         n//l41PXOSHT5IQ/ElYL+FKhZNX+SpfXKBIgP37NWfJ9jeZpltZ9pXhN9ClJbrQKQf
         vP1rsXAcd5vltEzl8IfB68E7veKAd2/9mgXKyXsq1XI86595fdzEIxIAlegEqojwln
         YuKjBcRfuy2SQcNtm6Vl//1dSiFRKN7XSU0NL9MMG518X22j6cVTZZEvzW0EC+kyec
         ZkspJFfr3mEkH7DiEHOThxjcnL4cVgOfXmBz1kaZV8yILlvF86CaZ18sitPWyvs1sC
         2Xcw01ktI4Msw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 02/06/2020 11:16, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.4.226 release.
> There are 47 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Thu, 04 Jun 2020 09:57:12 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.4.226-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.4.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h


All tests are passing for Tegra ...

Test results for stable-v4.4:
    6 builds:	6 pass, 0 fail
    12 boots:	12 pass, 0 fail
    19 tests:	19 pass, 0 fail

Linux version:	4.4.226-rc2-gab13e7ba60cc
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
