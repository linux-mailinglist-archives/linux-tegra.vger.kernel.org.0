Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5827D59E44B
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Aug 2022 15:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243480AbiHWM50 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Aug 2022 08:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240762AbiHWM47 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Aug 2022 08:56:59 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8644D1232C6;
        Tue, 23 Aug 2022 03:01:42 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r4so17335279edi.8;
        Tue, 23 Aug 2022 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PUA2nr1wioVzDta9NpRPg2RNm4EXbTJFLkDHu1Yc67I=;
        b=RzCIb3fC9rUen/D1vmmMtmBfn7tnb3I6i96gMc17FaP25sM1SPevjN8+ALMtmleeQd
         KDJ7c9FHmvtExIEV88nYFCoUz+7lmYOx6Q5PBAK2JxopOZ/UuX/flPl2VsgVyo8BRS1N
         c6lRfMcTeBKqlVrEuXPQN6G3d8B55D3Bq9CPE/GRCAn1qdny6TDPYunYwawt5OlNV1i5
         xFqtbha8jWjcHLh0NQoCE1hu5HXE0avTduoUTU4P7qfxOhvuALOcQeif1r/MzWYQSGfg
         OjaMQa/TToqTHy5jecXHAvaSs1ls+IQWnbmXznL508j+47EWZOZPn4xrsUlZSekBzrcT
         xRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PUA2nr1wioVzDta9NpRPg2RNm4EXbTJFLkDHu1Yc67I=;
        b=LESNy2a4jyS97rc7MQDTSgdysMUd0tUsP0YbG6JdUH58zK0s9cvsImKJGjmg9Hr7L3
         XtTQsW6nEwmi+LfGYJ3akTfG1cwqq80LejXry8BGAkvpFqt1U3+DHWkCythEzHE+vGKZ
         p5/D9D1BHUT5EEKzm87II0Q2pHgGH17FieuO0fArR5UT9PtYZqr25lTmLZVS3f+zNqE/
         ij1YaH7f163Ek89U15KDwceWIrNerx48+MnzV25+BHv68E415Tb4Zrq45CaE4nS3clni
         tlHRWNs65wHwtRkDgdZsVCZyg5pFlvqyhJOwvw054aCZNnQtqYUkmfjTbclue9rt+8hC
         4N5Q==
X-Gm-Message-State: ACgBeo1zy59nhVKuj4xVbMrFU8LrKBS878uP9hvHt39lvG8Y7lm7p1cj
        u47alLOMZ4bxcuzN1iEayzU=
X-Google-Smtp-Source: AA6agR6VgNqPndRYRwLHtUJsMNlHsCu3V4eKUsxekz1ZbevLr3JDMUTpWtKAYsm/CRJbKE3ITlHyqA==
X-Received: by 2002:a05:6402:4021:b0:447:29f9:a881 with SMTP id d33-20020a056402402100b0044729f9a881mr1031970eda.391.1661248895466;
        Tue, 23 Aug 2022 03:01:35 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20ad4.dip0.t-ipconnect.de. [79.194.10.212])
        by smtp.gmail.com with ESMTPSA id p16-20020a056402501000b0044625884285sm1184942eda.49.2022.08.23.03.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:01:34 -0700 (PDT)
Message-ID: <5988bf07-dd2e-a7ad-1ed9-831a402c3c5d@gmail.com>
Date:   Tue, 23 Aug 2022 12:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Rob Clark <robdclark@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
 <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com>
 <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
 <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
 <73b51dde-689f-64ce-a1c8-0d7c84a2ed66@collabora.com>
 <CAF6AEGuR1cRQYaQBYGnMBzy=XJUcN2o2gzabZaGO2Dj62Uq1DA@mail.gmail.com>
 <CAF6AEGvvR1NUd_GKP=Bxp3VTDMBYT+OwTkkgOWxgYFijZaVVEQ@mail.gmail.com>
 <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
 <2ce5ff0a-9ab2-d146-04db-487a64714fce@gmail.com>
 <cf8cd8da-08d2-5e70-a239-2a67da37c9ea@collabora.com>
 <e9bde303-6474-aa0b-7880-cf7d8b163983@collabora.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e9bde303-6474-aa0b-7880-cf7d8b163983@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am 22.08.22 um 19:26 schrieb Dmitry Osipenko:
> On 8/16/22 22:55, Dmitry Osipenko wrote:
>> On 8/16/22 15:03, Christian König wrote:
>>> Am 16.08.22 um 13:44 schrieb Dmitry Osipenko:
>>>> [SNIP]
>>>>> The other complication I noticed is that we don't seem to keep around
>>>>> the fd after importing to a GEM handle.  And I could imagine that
>>>>> doing so could cause issues with too many fd's.  So I guess the best
>>>>> thing is to keep the status quo and let drivers that cannot mmap
>>>>> imported buffers just fail mmap?
>>>> That actually should be all the drivers excluding those that use
>>>> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
>>>> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
>>>> work for the MSM driver, isn't it?
>>>>
>>>> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
>>>> refuse to do the mapping.
>>>>
>>>> Although, AMDGPU "succeeds" to do the mapping using
>>>> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus fault,
>>>> hence mapping actually fails. I think it might be the AMDGPU
>>>> driver/libdrm bug, haven't checked yet.
>>> That's then certainly broken somehow. Amdgpu should nerve ever have
>>> allowed to mmap() imported DMA-bufs and the last time I check it didn't.
>> I'll take a closer look. So far I can only tell that it's a kernel
>> driver issue because once I re-applied this "Don't map imported GEMs"
>> patch, AMDGPU began to refuse mapping AMDGPU_GEM_DOMAIN_GTT.
>>
>>>> So we're back to the point that neither of DRM drivers need to map
>>>> imported dma-bufs and this was never tested. In this case this patch is
>>>> valid, IMO.
>> Actually, I'm now looking at Etnaviv and Nouveau and seems they should
>> map imported dma-buf properly. I know that people ran Android on
>> Etnaviv. So maybe devices with a separated GPU/display need to map
>> imported display BO for Android support. Wish somebody who ran Android
>> on one of these devices using upstream drivers could give a definitive
>> answer. I may try to test Nouveau later on.
>>
> Nouveau+Intel combo doesn't work because of [1] that says:
>
> "Refuse to fault imported pages. This should be handled (if at all) by
> redirecting mmap to the exporter."
>
> [1]
> https://elixir.bootlin.com/linux/v5.19/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L154
>
> Interestingly, I noticed that there are IGT tests which check prime
> mmaping of Nouveau+Intel [2] (added 9 years ago), but they fail as well,
> as expected. The fact that IGT has such tests is interesting because it
> suggests that the mapping worked in the past. It's also surprising that
> nobody cared to fix the failing tests. For the reference, I checked
> v5.18 and today's linux-next.
>
> [2]
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/prime_nv_test.c#L132
>
> Starting subtest: nv_write_i915_cpu_mmap_read
> Received signal SIGBUS.
> Stack trace:
>   #0 [fatal_sig_handler+0x163]
>   #1 [__sigaction+0x50]
>   #2 [__igt_unique____real_main354+0x406]
>   #3 [main+0x23]
>   #4 [__libc_start_call_main+0x80]
>   #5 [__libc_start_main+0x89]
>   #6 [_start+0x25]
> Subtest nv_write_i915_cpu_mmap_read: CRASH (0,005s)
>
> Starting subtest: nv_write_i915_gtt_mmap_read
> Received signal SIGBUS.
> Stack trace:
>   #0 [fatal_sig_handler+0x163]
>   #1 [__sigaction+0x50]
>   #2 [__igt_unique____real_main354+0x33d]
>   #3 [main+0x23]
>   #4 [__libc_start_call_main+0x80]
>   #5 [__libc_start_main+0x89]
>   #6 [_start+0x25]
> Subtest nv_write_i915_gtt_mmap_read: CRASH (0,004s)
>
> I'm curious about the Etnaviv driver because it uses own shmem
> implementation and maybe it has a working mmaping of imported GEMs since
> it imports the dma-buf pages into Entaviv BO. Although, it should be
> risking to map pages using a different caching attributes (WC) from the
> exporter, which is prohibited on ARM ad then one may try to map imported
> udmabuf.
>
> Apparently, the Intel DG TTM driver should be able to map imported
> dma-buf because it sets TTM_TT_FLAG_EXTERNAL_MAPPABLE.

Even with that flag set it is illegal to map the pages directly by an 
importer.

If that ever worked then the only real solution is to redirect mmap() 
calls on importer BOs to dma_buf_mmap().

Regards,
Christian.

>
> Overall, it still questionable to me whether it's worthwhile to allow
> the mmaping of imported GEMs since only Panfrost/Lima can do it out of
> all drivers and h/w that I tested. Feels like drivers that can do the
> mapping have it just because they can and not because they need.
>

