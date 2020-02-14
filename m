Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F5715D598
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Feb 2020 11:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgBNK1o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Feb 2020 05:27:44 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2828 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgBNK1o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Feb 2020 05:27:44 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4676020001>; Fri, 14 Feb 2020 02:27:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 02:27:43 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 14 Feb 2020 02:27:43 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 10:27:41 +0000
Subject: Re: [PATCH 5.5 000/120] 5.5.4-stable review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
CC:     <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <ben.hutchings@codethink.co.uk>, <lkft-triage@lists.linaro.org>,
        <stable@vger.kernel.org>, linux-tegra <linux-tegra@vger.kernel.org>
References: <20200213151901.039700531@linuxfoundation.org>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e49bd26e-560c-840e-7f21-ee040a783143@nvidia.com>
Date:   Fri, 14 Feb 2020 10:27:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213151901.039700531@linuxfoundation.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581676034; bh=gqoddqc2BfvFroBZhmAgg3EGZtr0ZjG9XmoRe93PULk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=qZsHJ2ohHJB6PsfCWLv8e82ACEoXQN/wbzhYmVnciTX6kp4Yihr5sqO9FoDcN6O9l
         CjrOl9DHm9Fkp2b7DMA9n4b3clbiSRUTe0R2fApLwismX1upvaNLQ9oM0fRBvcNZHE
         xfzVGNRgWSqyyqQ0CuJK42Z+oQiwJVCAgVWToXc8eyrxWWCxunDX2FfvVhWPFCgJSB
         6AFKrD7Kjp+CBA4ICjQtp7LUMvhMkEfgPvsGZThLl7P5TQ2mlgeED162n2jB8GkCoB
         PDZR8wfEM465fFcQpnQO8rlqJpqHc+RzkD9qvjRif6EocM8iGT6O5GFedtU5R5qHXG
         4D1j7w3MC0WDA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/02/2020 15:19, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.5.4 release.
> There are 120 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Sat, 15 Feb 2020 15:16:41 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.5.4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.5.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests are passing for Tegra ...

Test results for stable-v5.5:
    13 builds:	13 pass, 0 fail
    22 boots:	22 pass, 0 fail
    40 tests:	40 pass, 0 fail

Linux version:	5.5.4-rc2-ged6d023a1817
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra20-ventana,
                tegra210-p2371-2180, tegra210-p3450-0000,
                tegra30-cardhu-a04

Cheers
Jon

-- 
nvpublic
