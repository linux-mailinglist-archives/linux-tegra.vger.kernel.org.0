Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5E914AD53
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 01:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgA1AnS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jan 2020 19:43:18 -0500
Received: from mga07.intel.com ([134.134.136.100]:17363 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgA1AnR (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jan 2020 19:43:17 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jan 2020 16:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,371,1574150400"; 
   d="scan'208";a="261266505"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2020 16:42:48 -0800
Date:   Tue, 28 Jan 2020 08:43:01 +0800
From:   Wei Yang <richardw.yang@linux.intel.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wei Yang <richardw.yang@linux.intel.com>,
        akpm@linux-foundation.org, dan.j.williams@intel.com,
        aneesh.kumar@linux.ibm.com, kirill@shutemov.name,
        yang.shi@linux.alibaba.com, thellstrom@vmware.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Message-ID: <20200128004301.GD20624@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jan 26, 2020 at 05:47:57PM +0300, Dmitry Osipenko wrote:
>18.01.2020 02:22, Wei Yang пишет:
>> Use the general helper instead of do it by hand.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  mm/mremap.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>> 
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index c2af8ba4ba43..a258914f3ee1 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -253,11 +253,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>>  
>>  	for (; old_addr < old_end; old_addr += extent, new_addr += extent) {
>>  		cond_resched();
>> -		next = (old_addr + PMD_SIZE) & PMD_MASK;
>> -		/* even if next overflowed, extent below will be ok */
>> +		next = pmd_addr_end(old_addr, old_end);
>>  		extent = next - old_addr;
>> -		if (extent > old_end - old_addr)
>> -			extent = old_end - old_addr;
>>  		old_pmd = get_old_pmd(vma->vm_mm, old_addr);
>>  		if (!old_pmd)
>>  			continue;
>> @@ -301,7 +298,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>>  
>>  		if (pte_alloc(new_vma->vm_mm, new_pmd))
>>  			break;
>> -		next = (new_addr + PMD_SIZE) & PMD_MASK;
>> +		next = pmd_addr_end(new_addr, new_addr + len);
>>  		if (extent > next - new_addr)
>>  			extent = next - new_addr;
>>  		move_ptes(vma, old_pmd, old_addr, old_addr + extent, new_vma,
>> 
>
>Hello Wei,
>
>Starting with next-20200122, I'm seeing the following in KMSG on NVIDIA
>Tegra (ARM32):
>
>  BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:190
>

Thanks.

Would you mind letting me know which case you are testing? Or the special
thing is 32-bit platform?

>and eventually kernel hangs.
>
>Git's bisection points to this patch and reverting it helps. Please fix,
>thanks in advance.

-- 
Wei Yang
Help you, Help me
