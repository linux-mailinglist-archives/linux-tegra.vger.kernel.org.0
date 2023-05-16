Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA74704DD0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 May 2023 14:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjEPMbM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 May 2023 08:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjEPMbL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 08:31:11 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C7E946AE
        for <linux-tegra@vger.kernel.org>; Tue, 16 May 2023 05:31:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6682F4;
        Tue, 16 May 2023 05:31:55 -0700 (PDT)
Received: from [10.57.83.102] (unknown [10.57.83.102])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DE913F663;
        Tue, 16 May 2023 05:31:08 -0700 (PDT)
Message-ID: <aadb69ff-732d-cffc-ab44-398269a11d4e@arm.com>
Date:   Tue, 16 May 2023 13:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 0/4] iommu: tegra-gart cleanups
Content-Language: en-GB
To:     Nicolas Chauvet <kwizart@gmail.com>
Cc:     joro@8bytes.org, iommu@lists.linux.dev, will@kernel.org,
        jgg@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
References: <cover.1684154219.git.robin.murphy@arm.com>
 <CABr+WTnzNPfOGbAmy-E3pH9U5XR0y2PdVmDd2gtnv67ByEb_0w@mail.gmail.com>
 <11d8adf1-75f5-5728-2139-e32aae6e6c49@arm.com>
 <CABr+WTm=SehaNVaFym5FM-tpCvh93Ma_xG3xX5PuGt6n9+xh4Q@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CABr+WTm=SehaNVaFym5FM-tpCvh93Ma_xG3xX5PuGt6n9+xh4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2023-05-16 13:16, Nicolas Chauvet wrote:
> Le mar. 16 mai 2023 à 13:45, Robin Murphy <robin.murphy@arm.com> a écrit :
>>
>> On 2023-05-16 10:53, Nicolas Chauvet wrote:
> ...
>>> For what it worth, I've tried to test this serie with "grate patches"
>>> (1) rebased on top on 6.4-rc2, that would make use of the tegra-gart.
>>> That was on PAZ00 (with only 512M of RAM and 96M CMA still allocated).
>>> Unfortunately, this lead to the following errors with display problems
>>> (no character displayed in lxt-terminal and etc)
>>
>> Thanks for testing - it's quite possible I've made a silly mistake
>> somewhere, but just to double-check, does the same happen with the
>> existing driver if you boot with "tegra-gart.gart_debug=1" (or at least
>> enable the parameter via sysfs before the DRM driver gets going)?
> 
> Using echo 1 > /sys/module/tegra_gart/parameters/gart_debug shows the
> same messages and the same artefacts (missing refreshed window
> content).
> Using "echo 0 > /sys/module/tegra_gart/parameters/gart_debug" revert
> back to normal...

OK, cool, so it looks like a pre-existing bug in the caller, but I guess 
it does mean that unconditionally enabling the checks isn't ideal until 
that can be sorted out.

Thanks,
Robin.

> [ 7661.026139] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [ 7661.033189] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [ 7661.042197] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> [ 7661.589552] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [ 7661.596690] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [ 7661.605865] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> [ 7662.078823] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [ 7662.085987] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [ 7662.095137] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
> [ 7662.123677] tegra-mc 7000f000.memory-controller: gart: Page entry is in-use
> [ 7662.130758] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> mapping failed 4294967274 262144
> [ 7662.140100] [drm:tegra_bo_gart_map_locked [tegra_drm]] *ERROR*
> failed size 262144: -12
