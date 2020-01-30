Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E7914D434
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 00:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgA2X7K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Jan 2020 18:59:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgA2X7K (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jan 2020 18:59:10 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 60269205ED;
        Wed, 29 Jan 2020 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580342348;
        bh=yxkaudjRnjvvfdKWPnNCLoYBv3LloMsyXzwr45ZzU78=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cLuVWANomNH0rT6PVVW/FB09C+GLkJj5uCGw3ovSGcUEOHRFFVDPAPxxYR0gh0Nv+
         rNcyGRrkz2MGQ9q+Z7eXg5x1wJHt/u0eFEWGdiV25ZvsrWayVp2v21BRkWLQiy3930
         etAwh0LVr43xhSG865jgg0JD+Vm2JPvztCMi0lZU=
Date:   Wed, 29 Jan 2020 15:59:07 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Wei Yang <richardw.yang@linux.intel.com>, dan.j.williams@intel.com,
        aneesh.kumar@linux.ibm.com, kirill@shutemov.name,
        yang.shi@linux.alibaba.com, thellstrom@vmware.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Message-Id: <20200129155907.75868e8a36c5fffc3ec354b9@linux-foundation.org>
In-Reply-To: <b5eb4766-38ba-0153-2844-cc303fe0dc07@gmail.com>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
        <20200117232254.2792-4-richardw.yang@linux.intel.com>
        <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
        <20200126185951.c9246349befcccce210a4ab8@linux-foundation.org>
        <b5eb4766-38ba-0153-2844-cc303fe0dc07@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 29 Jan 2020 20:18:56 +0300 Dmitry Osipenko <digetx@gmail.com> wrote:

> 27.01.2020 05:59, Andrew Morton пишет:
> > On Sun, 26 Jan 2020 17:47:57 +0300 Dmitry Osipenko <digetx@gmail.com> wrote:
> ...
> >> Hello Wei,
> >>
> >> Starting with next-20200122, I'm seeing the following in KMSG on NVIDIA
> >> Tegra (ARM32):
> >>
> >>   BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:190
> >>
> >> and eventually kernel hangs.
> >>
> >> Git's bisection points to this patch and reverting it helps. Please fix,
> >> thanks in advance.
> > 
> > Thanks.  I had these tagged for 5.7-rc1 anyway, so I'll drop all five
> > patches.
> > 
> 
> Hello Andrew,
> 
> FYI, I'm still seeing the offending patches in the today's next-20200129.

hm, me too.  Stephen, it's unexpected that 9ff4452912d63f ("mm/mremap:
use pmd_addr_end to calculate next in move_page_tables()") is still in
the -next lineup?  It was dropped from -mm on Jan 26?

