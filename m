Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBA97BD4F
	for <lists+linux-tegra@lfdr.de>; Wed, 31 Jul 2019 11:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbfGaJgB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 31 Jul 2019 05:36:01 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19081 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfGaJgB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Jul 2019 05:36:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d4161090000>; Wed, 31 Jul 2019 02:36:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 31 Jul 2019 02:36:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 31 Jul 2019 02:36:00 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 09:35:58 +0000
Subject: Re: [PATCH 4.19 000/113] 4.19.63-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20190729190655.455345569@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7fd48fde-0b0c-e949-1624-af95efb49050@nvidia.com>
Date:   Wed, 31 Jul 2019 10:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729190655.455345569@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564565769; bh=QMpy/21BdV/Ml++rcAFpkiL6AS0cp0YvYxOfn1ob4o8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VNMcEQXvky+EByu+uezfWO7pl0XLaOJ5WCke3FE0wrKIKjUoD9wnhBAgmCsb5sHmb
         AI8kcZGOgH0obWdvIGoMAvMrpQkZc331KklqTKyMziqykNBzwulZjtO0/objPLle0m
         venz3x8rrNffIgbLf6eb9snzBL9Z/6lr07Y5Myn7X8QaZsG2FF79abbniRRAVQqv6V
         CW5Ir3z1VuRRpPLLlX3mPs1pwS7RkiCknWzFl2uoowCh/vcZlum2yHYRzgjrQsNL+7
         5GozFpv6pyUiypdCDUA9rXNBG+5BkD28CjZRKcG52zdWUXwlgxX7O4a6Thznoa05aJ
         ZqeNzhwdwqGjg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/07/2019 20:21, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.19.63 release.
> There are 113 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Wed 31 Jul 2019 07:05:01 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.63-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.19:
    12 builds:	12 pass, 0 fail
    22 boots:	22 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.19.63-rc1-g0c75526c53c7
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
