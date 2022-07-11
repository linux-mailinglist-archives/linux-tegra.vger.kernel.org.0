Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FF556BC3F
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Jul 2022 17:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbiGHOqD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Jul 2022 10:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238663AbiGHOpt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 10:45:49 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 144A46D55B
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 07:44:40 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 999E51063;
        Fri,  8 Jul 2022 07:44:15 -0700 (PDT)
Received: from [10.57.86.102] (unknown [10.57.86.102])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5642D3F66F;
        Fri,  8 Jul 2022 07:44:14 -0700 (PDT)
Message-ID: <70cb6f20-7028-9cf8-6b3a-a074c0047687@arm.com>
Date:   Fri, 8 Jul 2022 15:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Content-Language: en-GB
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     mperttunen@nvidia.com, iommu@lists.linux.dev,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Joerg Roedel <joro@8bytes.org>
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
 <Ysg/7u5gRiDbEm5F@orome>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Ysg/7u5gRiDbEm5F@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-07-08 15:32, Thierry Reding wrote:
> On Thu, Jul 07, 2022 at 06:30:44PM +0100, Robin Murphy wrote:
>> Conditional registration is a problem for other subsystems which may
>> unwittingly try to interact with host1x_context_device_bus_type in an
>> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
>> typical system already reveals plenty of entries from enabled but
>> otherwise irrelevant configs, so lets keep things simple and register
>> our context bus unconditionally too.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/host1x/context_bus.c | 5 -----
>>   1 file changed, 5 deletions(-)
> 
> Applied, thanks.
> 
> Do we need this in v5.19 or is it enough if this gets into v5.20?

It's not strictly a critical fix, so I think 5.20 is fine. I plan to 
post v4 of my bus_set_iommu() series next week as the hopefully-final 
version, but at this point I think it might be safer to hold off 
actually merging that until early next cycle, to give it plenty of time 
in -next.

Thanks,
Robin.
