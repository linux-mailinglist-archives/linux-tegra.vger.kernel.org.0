Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574385383F5
	for <lists+linux-tegra@lfdr.de>; Mon, 30 May 2022 17:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237895AbiE3OrK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 May 2022 10:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241847AbiE3Op1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 May 2022 10:45:27 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA4B5DE4E;
        Mon, 30 May 2022 06:57:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dmitry.osipenko)
        with ESMTPSA id B98F41F417FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1653919049;
        bh=2XRBuky6ctLBMkVpHH42tRbnrHaVzoRJDfOS/8wLl/E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mPwSP+W1lUR0EdMvCliWfZoiylZ8CVpOpjwgflCUTZaI9WHJh5tJXhk8DyguPhNeN
         HogdCkNBgtGD2G8U9Ep2K49/vmqE56g1BgD7MA21xGk1ZVBj+VJcIxxm08FCLdNgVK
         RmZOwzc+caJBzV5axbiwKDrCGcHjZmvJd24egZXw9xLh3XfQFPhTT3EpgfN70g8mqC
         9sjT+smifz0WHNiGEqr7+RZqCI9QQehNyQ19Mpiv9LWCOB9wzR78FM0tska4e7lqKe
         50oVtOr/eGMjVeh2uPvpXIVZhL/NQ2LFQ3MNEmBcidBDh44gsd28fmmYzNC+2ue0aj
         H9xWHCkQ7dKmg==
Message-ID: <7372dd1b-06f7-5336-4738-15f9b4d4d4b3@collabora.com>
Date:   Mon, 30 May 2022 16:57:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Rob Clark <robdclark@gmail.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Qiang Yu <yuq825@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-15-dmitry.osipenko@collabora.com>
 <0a02a31d-a256-4ca4-0e35-e2ea1868a8ae@amd.com>
 <e6e17c52-43c2-064b-500e-325bb3ba3b2c@collabora.com>
 <02e7946b-34ca-b48e-1ba6-e7b63740a2d9@amd.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <02e7946b-34ca-b48e-1ba6-e7b63740a2d9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 5/30/22 16:41, Christian König wrote:
> Hi Dmitry,
> 
> Am 30.05.22 um 15:26 schrieb Dmitry Osipenko:
>> Hello Christian,
>>
>> On 5/30/22 09:50, Christian König wrote:
>>> Hi Dmitry,
>>>
>>> First of all please separate out this patch from the rest of the series,
>>> since this is a complex separate structural change.
>> I assume all the patches will go via the DRM tree in the end since the
>> rest of the DRM patches in this series depend on this dma-buf change.
>> But I see that separation may ease reviewing of the dma-buf changes, so
>> let's try it.
> 
> That sounds like you are underestimating a bit how much trouble this
> will be.
> 
>>> I have tried this before and failed because catching all the locks in
>>> the right code paths are very tricky. So expect some fallout from this
>>> and make sure the kernel test robot and CI systems are clean.
>> Sure, I'll fix up all the reported things in the next iteration.
>>
>> BTW, have you ever posted yours version of the patch? Will be great if
>> we could compare the changed code paths.
> 
> No, I never even finished creating it after realizing how much work it
> would be.
> 
>>>> This patch introduces new locking convention for dma-buf users. From
>>>> now
>>>> on all dma-buf importers are responsible for holding dma-buf
>>>> reservation
>>>> lock around operations performed over dma-bufs.
>>>>
>>>> This patch implements the new dma-buf locking convention by:
>>>>
>>>>     1. Making dma-buf API functions to take the reservation lock.
>>>>
>>>>     2. Adding new locked variants of the dma-buf API functions for
>>>> drivers
>>>>        that need to manage imported dma-bufs under the held lock.
>>> Instead of adding new locked variants please mark all variants which
>>> expect to be called without a lock with an _unlocked postfix.
>>>
>>> This should make it easier to remove those in a follow up patch set and
>>> then fully move the locking into the importer.
>> Do we really want to move all the locks to the importers? Seems the
>> majority of drivers should be happy with the dma-buf helpers handling
>> the locking for them.
> 
> Yes, I clearly think so.
> 
>>
>>>>     3. Converting all drivers to the new locking scheme.
>>> I have strong doubts that you got all of them. At least radeon and
>>> nouveau should grab the reservation lock in their ->attach callbacks
>>> somehow.
>> Radeon and Nouveau use gem_prime_import_sg_table() and they take resv
>> lock already, seems they should be okay (?)
> 
> You are looking at the wrong side. You need to fix the export code path,
> not the import ones.
> 
> See for example attach on radeon works like this
> drm_gem_map_attach->drm_gem_pin->radeon_gem_prime_pin->radeon_bo_reserve->ttm_bo_reserve->dma_resv_lock.

Yeah, I was looking at the both sides, but missed this one.

> Same for nouveau and probably a few other exporters as well. That will
> certainly cause a deadlock if you don't fix it.
> 
> I strongly suggest to do this step by step, first attach/detach and then
> the rest.

Thank you very much for the suggestions. I'll implement them in the next
version.

-- 
Best regards,
Dmitry
