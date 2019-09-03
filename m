Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B0DA6059
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Sep 2019 06:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfICE5y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Sep 2019 00:57:54 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14926 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfICE5y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Sep 2019 00:57:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6df2d10000>; Mon, 02 Sep 2019 21:57:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 02 Sep 2019 21:57:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 02 Sep 2019 21:57:53 -0700
Received: from [10.24.193.88] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Sep
 2019 04:57:50 +0000
Subject: Re: [PATCH] soc/tegra: fuse: Add clock error check in
 tegra_fuse_readl
To:     Jon Hunter <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1566991129-13479-1-git-send-email-nkristam@nvidia.com>
 <95734aa4-c7cb-17a2-fa4c-416a5a40b3e6@nvidia.com>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <282de63e-6a0f-349f-0df9-a6a54cab6ea3@nvidia.com>
Date:   Tue, 3 Sep 2019 10:29:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95734aa4-c7cb-17a2-fa4c-416a5a40b3e6@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567486674; bh=GNfEB6lblX2HsLfYXNxFF75xC4KNUay6oQXU3s/HLl8=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=AOfOWiiqfhLBi+H+IRBb4SKa8qnZyHB25u7uo9n9/lXbWVoI9u9sMo3y/Kqa26mf0
         WUJdnY3nSU7FiFXZA/BiGs7MUz1hT2qdDoF+nJtZsiOPRIp0E9HNcE32DzGj3XG8gM
         ebHngjg9DVAJCO6XOSvSSFP9bX6nkNFSjS7vOVFPeEdR25th1E5oS3e3DqtosDDfaI
         kGDNP7Gu9wlFlGo6BSiCvf6KBKp8rWoHIoQsgERxbKF6H7hDUvw38uSu5oV51Og621
         QEyBXGjOHB8DDOD9Q5jTbJ2NS7bFF/shmhuxiNRULDSeztXzeObSQYW9Y9c0yL+yZG
         NKCCvtSQeOusA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 02-09-2019 16:15, Jon Hunter wrote:
> 
> On 28/08/2019 12:18, Nagarjuna Kristam wrote:
>> Tegra fuse clock handle is retrieved in tegra_fuse_probe().
>> tegra_fuse_readl() is exported symbol, which can be called from drivers
>> at any time. tegra_fuse_readl() enables fuse clock and reads corresponding
>> fuse register offset.
>>
>> Calling tegra_fuse_readl() before tegra_fuse_probe(), will cause data
>> abort. Add DEFER_PROBE error check for fuse clock in tegra_fuse_readl(),
>> to avoid enabling of fuse clock, before clock is available.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
>> index 3eb44e6..21b39b7 100644
>> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
>> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
>> @@ -186,7 +186,7 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
>>  
>>  int tegra_fuse_readl(unsigned long offset, u32 *value)
>>  {
>> -	if (!fuse->read)
>> +	if (!fuse->read || (PTR_ERR(fuse->clk) == -EPROBE_DEFER))
>>  		return -EPROBE_DEFER;
> 
> What about the case where fuse->clk is NULL or a different error value?
> 
> Jon
> 
Yes, all error checks are needed, will use IS_ERR as a separate condition for clock.

Thanks,
Nagarjuna
