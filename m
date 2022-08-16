Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A30595B33
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Aug 2022 14:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233418AbiHPMFa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Aug 2022 08:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbiHPMEk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Aug 2022 08:04:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB57B443D;
        Tue, 16 Aug 2022 04:52:20 -0700 (PDT)
Received: from [192.168.2.145] (unknown [109.252.119.13])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id A9B6E6600373;
        Tue, 16 Aug 2022 12:52:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660650738;
        bh=kqKfHUdOjX/jiDvnlWraX7Xx48/f4964xeZX7O95bw8=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=j6x1zL5fq6e4V5W504IPzxEnHQNFy8U6jSRtlqwi7t/AdhXj/xtkSNVYGOxhZKsG2
         3ptwwZ9zW9D4kChAn4iEYfI7FoGTBt7yf91qhLFHQThaw6CfqGjkmjXY+EnG5gByZe
         0a+UBHRDopmcDrEnG+DIcyfvwTTDzNnqQibVGzmfeXnZ/ELkDBJfsucopu6tB0VcIK
         HHLDNzeKrgtXUUp8IXdomolyHXZjm+Q9Hj7o2bhhwt54VoAUahnT9rzy+hdiR5RPaD
         /xcj3SutWutCjP+tvritwcqMnkDJ7CiTdQzVDp4jFeDQqlT5K2McPiu2MmUGDs2nZK
         LgEELEl1XO5eA==
Message-ID: <b2aeb72a-196d-6dd6-84b0-8fcbe28e2f08@collabora.com>
Date:   Tue, 16 Aug 2022 14:52:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Rob Clark <robdclark@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
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
In-Reply-To: <5f118e10-db7a-a128-1e87-c9dddb65b2ac@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/16/22 14:44, Dmitry Osipenko wrote:
> On 8/12/22 18:01, Rob Clark wrote:
>> On Fri, Aug 12, 2022 at 7:57 AM Rob Clark <robdclark@gmail.com> wrote:
>>>
>>> On Fri, Aug 12, 2022 at 4:26 AM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>>
>>>> On 8/11/22 02:19, Rob Clark wrote:
>>>>> On Wed, Aug 10, 2022 at 3:23 PM Dmitry Osipenko
>>>>> <dmitry.osipenko@collabora.com> wrote:
>>>>>>
>>>>>> On 8/11/22 01:03, Rob Clark wrote:
>>>>>>> On Wed, Aug 10, 2022 at 12:26 PM Dmitry Osipenko
>>>>>>> <dmitry.osipenko@collabora.com> wrote:
>>>>>>>>
>>>>>>>> On 8/10/22 18:08, Rob Clark wrote:
>>>>>>>>> On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>>>
>>>>>>>>>> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
>>>>>>>>>>> On 7/6/22 00:48, Rob Clark wrote:
>>>>>>>>>>>> On Tue, Jul 5, 2022 at 4:51 AM Christian König <christian.koenig@amd.com> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
>>>>>>>>>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>>>>>>>>>>>>>> handle imported dma-bufs properly, which results in mapping of something
>>>>>>>>>>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
>>>>>>>>>>>>>> userspace writes to the memory mapping of a dma-buf that was imported into
>>>>>>>>>>>>>> Tegra's DRM GEM.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
>>>>>>>>>>>>>> Mapping of imported GEMs require special care from userspace since it
>>>>>>>>>>>>>> should sync dma-buf because mapping coherency of the exporter device may
>>>>>>>>>>>>>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
>>>>>>>>>>>>>> for consistency.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>>>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> I'm pretty sure that this is the right approach, but it's certainly more
>>>>>>>>>>>>> than possible that somebody abused this already.
>>>>>>>>>>>>
>>>>>>>>>>>> I suspect that this is abused if you run deqp cts on android.. ie. all
>>>>>>>>>>>> winsys buffers are dma-buf imports from gralloc.  And then when you
>>>>>>>>>>>> hit readpix...
>>>>>>>>>>>>
>>>>>>>>>>>> You might only hit this in scenarios with separate gpu and display (or
>>>>>>>>>>>> dGPU+iGPU) because self-imports are handled differently in
>>>>>>>>>>>> drm_gem_prime_import_dev().. and maybe not in cases where you end up
>>>>>>>>>>>> with a blit from tiled/compressed to linear.. maybe that narrows the
>>>>>>>>>>>> scope enough to just fix it in userspace?
>>>>>>>>>>>
>>>>>>>>>>> Given that that only drivers which use DRM-SHMEM potentially could've
>>>>>>>>>>> map imported dma-bufs (Panfrost, Lima) and they already don't allow to
>>>>>>>>>>> do that, I think we're good.
>>>>>>>>>>
>>>>>>>>>> So can I have an ack from Rob here or are there still questions that this
>>>>>>>>>> might go boom?
>>>>>>>>>>
>>>>>>>>>> Dmitry, since you have a bunch of patches merged now I think would also be
>>>>>>>>>> good to get commit rights so you can drive this more yourself. I've asked
>>>>>>>>>> Daniel Stone to help you out with getting that.
>>>>>>>>>
>>>>>>>>> I *think* we'd be ok with this on msm, mostly just by dumb luck.
>>>>>>>>> Because the dma-buf's we import will be self-import.  I'm less sure
>>>>>>>>> about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
>>>>>>>>> special path for imported dma-bufs either, and in that case they won't
>>>>>>>>> be self-imports.. but I guess no one has tried to run android cts on
>>>>>>>>> panfrost).
>>>>>>>>
>>>>>>>> The last time I tried to mmap dma-buf imported to Panfrost didn't work
>>>>>>>> because Panfrost didn't implement something needed for that. I'll need
>>>>>>>> to take a look again because can't recall what it was.
>>>> Upd: I re-checked Panfrost using today's linux-next and mapping of
>>>> imported dma-buf works, I mapped imported buf from video decoder.
>>>> Apparently previously I had some local kernel change that broke the mapping.
>>>>
>>>>>>>>> What about something less drastic to start, like (apologies for
>>>>>>>>> hand-edited patch):
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>>>>>> index 86d670c71286..fc9ec42fa0ab 100644
>>>>>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>>>>>> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
>>>>>>>>> *obj, unsigned long obj_size,
>>>>>>>>>  {
>>>>>>>>>         int ret;
>>>>>>>>>
>>>>>>>>> +       WARN_ON_ONCE(obj->import_attach);
>>>>>>>>
>>>>>>>> This will hang NVIDIA Tegra, which is what this patch fixed initially.
>>>>>>>> If neither of upstream DRM drivers need to map imported dma-bufs and
>>>>>>>> never needed, then why do we need this?
>>>>>>>
>>>>>>> oh, tegra isn't using shmem helpers?  I assumed it was.  Well my point
>>>>>>> was to make a more targeted fail on tegra, and a WARN_ON for everyone
>>>>>>> else to make it clear that what they are doing is undefined behavior.
>>>>>>> Because so far existing userspace (or well, panfrost and freedreno at
>>>>>>> least, those are the two I know or checked) don't make special cases
>>>>>>> for mmap'ing against the dmabuf fd against the dmabuf fd instead of
>>>>>>> the drm device fd.
>>>>>>
>>>>>> It's not clear to me what bad Android does form yours comments. Does it
>>>>>> export dma-buf from GPU and then import it to GPU? If yes, then DRM core
>>>>>> has a check for the self-importing [1].
>>>>>>
>>>>>> [1]
>>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_prime.c#L918
>>>>>>
>>>>>> If you're meaning something else, then please explain in a more details.
>>>>>
>>>>> So, android/gralloc allocates buffers externally to the driver and
>>>>> imports them into driver.  (And that seems to not just be window
>>>>> surfaces, but in cases random textures, etc)
>>>>>
>>>>> In the normal case these should be allocated from drm/msm so it should
>>>>> hit [1].. this is the "dumb luck" I mentioned earlier.  But I'm not
>>>>> confident enough to say that there is no other case.
>>>>>
>>>>>>
>>>>>>> I *think* it should work out that we don't hit this path with
>>>>>>> freedreno but on android I can't really guarantee or prove it.  So
>>>>>>> your patch would potentially break existing working userspace.  Maybe
>>>>>>> it is userspace that isn't portable (but OTOH it isn't like you are
>>>>>>> going to be using freedreno on tegra).  So why don't you go for a more
>>>>>>> targeted fix that only returns an error on hw where this is
>>>>>>> problematic?
>>>>>>
>>>>>> That's what the first versions of the patch did and Christian suggested
>>>>>> that it's not a good approach. In fact it should be not only Tegra that
>>>>>> has a broken dma-buf mapping, but apparently OMAP driver too.
>>>>>
>>>>> Hmm, I guess I'm a bit more conservative when it comes to potentially
>>>>> breaking userspace.
>>>>
>>>> If such userspace exists, then of course the mapping should continue to
>>>> work. Still will be great to know what that userpsace is.
>>>
>>> Definitely existing mesa does not have a special mmap path for
>>> imported dma-bufs (both in the case of panfrost and freedreno, I
>>> didn't check any others).  The only question is whether there is a
>>> case where some app/test/etc imports a foreign dma-buf fd and then
>>> does something that would trigger mmap'ing, like readpix.
>>
>> The other complication I noticed is that we don't seem to keep around
>> the fd after importing to a GEM handle.  And I could imagine that
>> doing so could cause issues with too many fd's.  So I guess the best
>> thing is to keep the status quo and let drivers that cannot mmap
>> imported buffers just fail mmap?
> 
> That actually should be all the drivers excluding those that use
> DRM-SHMEM because only DRM-SHMEM uses dma_buf_mmap(), that's why it
> works for Panfrost. I'm pretty sure mmaping of imported GEMs doesn't
> work for the MSM driver, isn't it?
> 
> Intel and AMD drivers don't allow to map the imported dma-bufs. Both
> refuse to do the mapping.
> 
> Although, AMDGPU "succeeds" to do the mapping using
> AMDGPU_GEM_DOMAIN_GTT, but then touching the mapping causes bus fault,
> hence mapping actually fails. I think it might be the AMDGPU
> driver/libdrm bug, haven't checked yet.

To make it more clear, I imported AMDGPU dma-buf to Intel iGPU and vice
versa.

> So we're back to the point that neither of DRM drivers need to map
> imported dma-bufs and this was never tested. In this case this patch is
> valid, IMO.
> 


-- 
Best regards,
Dmitry
