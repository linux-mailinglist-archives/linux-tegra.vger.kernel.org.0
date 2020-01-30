Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DC114D4F8
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 02:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgA3B3s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Jan 2020 20:29:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:49565 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgA3B3s (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jan 2020 20:29:48 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jan 2020 17:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,380,1574150400"; 
   d="scan'208";a="262007116"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2020 17:29:45 -0800
Date:   Thu, 30 Jan 2020 09:30:00 +0800
From:   Wei Yang <richardw.yang@linux.intel.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Wei Yang <richardw.yang@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, akpm@linux-foundation.org,
        dan.j.williams@intel.com, aneesh.kumar@linux.ibm.com,
        kirill@shutemov.name, yang.shi@linux.alibaba.com,
        thellstrom@vmware.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Message-ID: <20200130013000.GA5137@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
 <20200117232254.2792-4-richardw.yang@linux.intel.com>
 <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
 <20200129094738.GE25745@shell.armlinux.org.uk>
 <20200129215745.GA20736@richard>
 <20200129232441.GI25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129232441.GI25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 29, 2020 at 11:24:41PM +0000, Russell King - ARM Linux admin wrote:
>On Thu, Jan 30, 2020 at 05:57:45AM +0800, Wei Yang wrote:
>> On Wed, Jan 29, 2020 at 09:47:38AM +0000, Russell King - ARM Linux admin wrote:
>> >On Sun, Jan 26, 2020 at 05:47:57PM +0300, Dmitry Osipenko wrote:
>> >> 18.01.2020 02:22, Wei Yang пишет:
>> >> > Use the general helper instead of do it by hand.
>> >> > 
>> >> > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> > ---
>> >> >  mm/mremap.c | 7 ++-----
>> >> >  1 file changed, 2 insertions(+), 5 deletions(-)
>> >> > 
>> >> > diff --git a/mm/mremap.c b/mm/mremap.c
>> >> > index c2af8ba4ba43..a258914f3ee1 100644
>> >> > --- a/mm/mremap.c
>> >> > +++ b/mm/mremap.c
>> >> > @@ -253,11 +253,8 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>> >> >  
>> >> >  	for (; old_addr < old_end; old_addr += extent, new_addr += extent) {
>> >> >  		cond_resched();
>> >> > -		next = (old_addr + PMD_SIZE) & PMD_MASK;
>> >> > -		/* even if next overflowed, extent below will be ok */
>> >> > +		next = pmd_addr_end(old_addr, old_end);
>> >> >  		extent = next - old_addr;
>> >> > -		if (extent > old_end - old_addr)
>> >> > -			extent = old_end - old_addr;
>> >> >  		old_pmd = get_old_pmd(vma->vm_mm, old_addr);
>> >> >  		if (!old_pmd)
>> >> >  			continue;
>> >> > @@ -301,7 +298,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>> >> >  
>> >> >  		if (pte_alloc(new_vma->vm_mm, new_pmd))
>> >> >  			break;
>> >> > -		next = (new_addr + PMD_SIZE) & PMD_MASK;
>> >> > +		next = pmd_addr_end(new_addr, new_addr + len);
>> >> >  		if (extent > next - new_addr)
>> >> >  			extent = next - new_addr;
>> >> >  		move_ptes(vma, old_pmd, old_addr, old_addr + extent, new_vma,
>> >> > 
>> >> 
>> >> Hello Wei,
>> >> 
>> >> Starting with next-20200122, I'm seeing the following in KMSG on NVIDIA
>> >> Tegra (ARM32):
>> >> 
>> >>   BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:190
>> >> 
>> >> and eventually kernel hangs.
>> >> 
>> >> Git's bisection points to this patch and reverting it helps. Please fix,
>> >> thanks in advance.
>> >
>> >The above is definitely wrong - pXX_addr_end() are designed to be used
>> >with an address index within the pXX table table and the address index
>> >of either the last entry in the same pXX table or the beginning of the
>> >_next_ pXX table.  Arbitary end address indicies are not allowed.
>> >
>> 
>> #define pmd_addr_end(addr, end)						\
>> ({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
>> 	(__boundary - 1 < (end) - 1)? __boundary: (end);		\
>> })
>> 
>> If my understanding is correct, the definition here align the addr to next PMD
>> boundary or end.
>> 
>> I don't see the possibility to across another PMD. Do I miss something?
>
>Look at the definition of p*_addr_end() that are used when page tables
>are rolled up.
>

Sorry, I don't get your point.

What's the meaning of "roll up" here?

Would you mind giving me an example? I see pmd_addr_end() is not used in many
places in core kernel. By glancing those usages, all the places use it like
pmd_addr_end(addr, end). Seems no specially handing on the end address.

Or you mean the case when pmd_addr_end() is defined to return "end" directly? 

>> >When page tables are "rolled up" when levels don't exist, it is common
>> >practice for these macros to just return their end address index.
>> >Hence, if they are used with arbitary end address indicies, then the
>> >iteration will fail.
>> >
>> >The only way to do this is:
>> >
>> >	next = pmd_addr_end(old_addr,
>> >			pud_addr_end(old_addr,
>> >				p4d_addr_end(old_addr,
>> >					pgd_addr_end(old_addr, old_end))));
>> >
>> >which gives pmd_addr_end() (and each of the intermediate pXX_addr_end())
>> >the correct end argument.  However, that's a more complex and verbose,
>> >and likely less efficient than the current code.
>> >
>> >I'd suggest that there's nothing to "fix" in the v5.5 code wrt this,
>> >and trying to "clean it up" will just result in less efficient or
>> >broken code.
>> >
>> >-- 
>> >RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
>> >FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
>> >According to speedtest.net: 11.9Mbps down 500kbps up
>> 
>> -- 
>> Wei Yang
>> Help you, Help me
>> 
>
>-- 
>RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
>FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
>According to speedtest.net: 11.9Mbps down 500kbps up

-- 
Wei Yang
Help you, Help me
