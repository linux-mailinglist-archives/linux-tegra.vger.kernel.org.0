Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54025463CA
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 18:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfFNQQ5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 12:16:57 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9440 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFNQQ5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 12:16:57 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03c8770000>; Fri, 14 Jun 2019 09:16:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 09:16:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Jun 2019 09:16:56 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 16:16:53 +0000
Subject: Re: [PATCH V1 2/2] mailbox: tegra: avoid resume NULL mailboxes
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Jassi Brar <jassisinghbrar@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
 <1560515734-2085-2-git-send-email-bbiswas@nvidia.com>
 <20190614155210.GC26922@ulmo>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <c774e527-7bd8-d731-6f68-8fdca87d99be@nvidia.com>
Date:   Fri, 14 Jun 2019 09:16:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614155210.GC26922@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560529016; bh=MzSP8jyEG8u6MG6Y0F/p2kf3GqAnZBXD6d8IVDO5Kw8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=qykwxzgm14bEEejuZ8tyYTB6/NtnSk2VtlxjBY80uDnT45kr5Vz7v+M3vfDS13j/Q
         PozeTgJA5GJ1gX+ImzWRMjpC/pjclPstUOnRvtuLf6K8Fx2a6qY7tiCAZbLPvRMDmX
         WTd/MFuuQ8v5K868rZcy3q1XeXPfqQjUBCrOaTM9+DiCMLd/5xzW8UjFC3SK/2YlS+
         UCpsFxnskgcPZQqxhiP4LieaJDlqwU4rBa2IGiHCtcuZfZuHzcJMIKKo8ly1OoFjFo
         2p5nqrZNxeVsCves92fpg9pouzPS6FFURUmff8RUgT33nBc6cInXc9B0Q1OcZ4L/Fu
         Z9oK9JeMYuwJg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/14/19 8:52 AM, Thierry Reding wrote:
> On Fri, Jun 14, 2019 at 05:35:34AM -0700, Bitan Biswas wrote:
>> If Tegra hsp device tree does not have 'shared irqs',
> 
> s/hsp/HSP/, otherwise looks good.
Shall correct.

> 
> Thierry
> 
>> mailboxes pointer is NULL. Add non-NULL HSP mailboxes
>> check in resume callback before tegra_hsp_mailbox_startup()
>> call and prevent NULL pointer exception.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>   drivers/mailbox/tegra-hsp.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
>> index f147374..a11fb1c 100644
>> --- a/drivers/mailbox/tegra-hsp.c
>> +++ b/drivers/mailbox/tegra-hsp.c
>> @@ -782,11 +782,13 @@ static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)
>>   			tegra_hsp_doorbell_startup(db->channel.chan);
>>   	}
>>   
>> -	for (i = 0; i < hsp->num_sm; i++) {
>> -		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
>> +	if (hsp->mailboxes) {
>> +		for (i = 0; i < hsp->num_sm; i++) {
>> +			struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
>>   
>> -		if (mb->channel.chan->cl)
>> -			tegra_hsp_mailbox_startup(mb->channel.chan);
>> +			if (mb->channel.chan->cl)
>> +				tegra_hsp_mailbox_startup(mb->channel.chan);
>> +		}
>>   	}
>>   
>>   	return 0;
>> -- 
>> 2.7.4

-Thanks,
  Bitan
