Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A24B209BC9
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390822AbgFYJRX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 05:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390071AbgFYJRX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 05:17:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C644AC061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rJ8/3dKlR6UdgvJARN4X5NXocLtd/y87+BNOyXJLebQ=; b=V37uxWeVYsyGBMXkO11d2N7IWl
        8sIU9guRW4YwUU7kXc9t1GoAcQdp+aEwPyG0a7EnnafKOVvkHEy2t2WDR7wRQg4UG+08VFsTnRcbt
        5BbUyTQVLXaoxFf7u5Sp7veYbWW6ui6Jjyy0n7Pg6RtTwUk6XB8FAilfLHAeasSmSjBB8uuvLms9H
        +HbKNq4JuP3z39Me2V2Cw+dQCO18/lE6MWjjueQDb/5wFZzgGJCziSKyKteVwQEJIILUBMwd/r46M
        UIG56D90ZECtvS5MnJ7kbQqmKVUNI0EKjUDaREZ1+ZJdxNWdDnGa8YlXrUYeGQjqduer/BSKLfr3p
        sjxnAWhg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1joO0V-0000fc-Nq; Thu, 25 Jun 2020 12:17:19 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e04c02f0-b034-6e5b-51bf-0a142f3138a6@kapsi.fi>
Date:   Thu, 25 Jun 2020 12:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/24/20 11:55 PM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
> ...
>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
>> Not sure if they are still needed.
> 
> Hello Mikko!
> 
> A quick comment for the starter. Switching away from the Tegra-specific
> GEM IOCTLs to the dma-buf heaps is a such radical change! But I like it!
> 
> Previously I was curious about whether we could have multiple CMA
> regions (one shared/reusable and other private, for example) for the
> Tegra DRM driver and at a quick glance the dma-buf heaps could be a nice
> solution that avoids re-inventing a driver-specific things for that.
> 
> I'm instantly foreseeing these types of heaps:
> 
> 1. Large reusable CMA heap.
> 2. Smaller non-reusable common CMA that could be used when allocation
> from a reusable CMA fails. Or vice versa, when we want to reduce the
> chance to block for a long time on allocation, for example.
> 3. Sparse (system) memory heap.
> 
> It's the first time I'm looking at the dma-buf heaps and it sounds like
> a very nice idea to utilize them!
> 
> The https://lkml.org/lkml/2019/11/18/787 says that the system-contiguous
> and carveout heaps we not added because they were not needed, but they
> will be needed for the Tegra20 drivers and for the case where IOMMU is
> disabled. It shouldn't be difficult to add these types of heaps.
> 
> I'll continue to examine the dma-buf heaps in a more details.
> 

Sure, let's go with this for now. We can anyway add GEM IOCTLs later if 
they are needed, without any compatibility issues.

Mikko
