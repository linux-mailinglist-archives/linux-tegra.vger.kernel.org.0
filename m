Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10EF58F4CD
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Aug 2022 01:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbiHJXTU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Aug 2022 19:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbiHJXTT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Aug 2022 19:19:19 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1607B797;
        Wed, 10 Aug 2022 16:19:18 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id g15so6945569iob.0;
        Wed, 10 Aug 2022 16:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=l5p5bclQFAlMwZmWlO8t1SaK7xuragzMNLu8+SffqhU=;
        b=iXu8D1jJDH9R43xBAlDVHcczSFbbeceeaMs+vdM3ROkUuHlsfkvvIZAcW19okAr2K3
         xE3/M2JLwF8VAZLWtwXzUXB12t8mT9Z/vayYB6PlkW6M1Y3xLyjL1PraTGc1n78Wigci
         F9flaSw6/OnQjmgwMncTHnWBIqYq2Xi0Ow6NEmAtEF5j5FHI4L8GnZzkyZT0bz7RNUOH
         LHhD/uRzrsEUGx0X4W2xZZYn5MFuBjuc2z+/KA0qJkwp4NZwNtzZbblg07DPdyIKTXX0
         9UjqS+uM5iR9Yb0Phc/Voha3j60LENKZ03eavcdc9bZ30bEEtdHnLv3vCUeCrATxQMVO
         8tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=l5p5bclQFAlMwZmWlO8t1SaK7xuragzMNLu8+SffqhU=;
        b=MRcEAKvtYrZ+To9yN+UXjHzhzaPWBNmcSxvzBYZc+FDyFQKRZGKGHk/dcz/XwJHNIV
         Q4eWCvtYDpo2C1qBBC+8sQODGhAP8G+TVaNsRovgoAEpyynGn/jkoWdZ7WieBm/5rrl5
         kBnlNcvvbHWnZ4wSeQDHIcX4F3YHY2rtLiY/mTcXlwxpwi/vYZYPVXuFyuzSSyhQFWwM
         b14rJShz5evjGlQFE69re8lzqDL3LwiGEdkdxP5gJpllXg+D7J3GtDV3W2YPIErmIRw4
         cPZregXkBZ/Hq1rq0I7N5rDk2kJLA+i1IsF/SgbubOCMEMwxVyWAxTZQgcGMtgvBuNJz
         hptg==
X-Gm-Message-State: ACgBeo11gS86ncBqkQD68zCPxTvD2VhP3JSvG0fj8QvNPEu6PtGTdTI8
        jxWUABgT8rSGY0l3+uaNEXVMsul3IrTJHnYH8bp1E+W4
X-Google-Smtp-Source: AA6agR7JzmvJ4XVRV58axL/tiNu8bHxsGLOSNYpNcG405gbAjtRKdBV0w34FaH4DoBiVQ9D2yCc0XM3fNmlllCh51DY=
X-Received: by 2002:a05:6638:1353:b0:342:9bfb:7382 with SMTP id
 u19-20020a056638135300b003429bfb7382mr13826837jad.129.1660173557556; Wed, 10
 Aug 2022 16:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com> <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com> <YvOav/vF2awVWIu0@phenom.ffwll.local>
 <CAF6AEGvfAJgwBe4+sK0gAkZ++MwH9x4=698C8XSnmfYNMFZqfA@mail.gmail.com>
 <9674d00e-c0d6-ceba-feab-5dc475bda694@collabora.com> <CAF6AEGv1cVC9ZNMwpwFOki5CrwD3kSAHM9EUFZGWY-y5zcQsCg@mail.gmail.com>
 <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
In-Reply-To: <fc019528-7ec7-9e5b-1b6d-c44da14346cf@collabora.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 10 Aug 2022 16:19:05 -0700
Message-ID: <CAF6AEGv8zSd0fEYB9hd2QOyTt53gFSQoL8JdZtCvtCdYfMfB2Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 10, 2022 at 3:23 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 8/11/22 01:03, Rob Clark wrote:
> > On Wed, Aug 10, 2022 at 12:26 PM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 8/10/22 18:08, Rob Clark wrote:
> >>> On Wed, Aug 10, 2022 at 4:47 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>>>
> >>>> On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
> >>>>> On 7/6/22 00:48, Rob Clark wrote:
> >>>>>> On Tue, Jul 5, 2022 at 4:51 AM Christian K=C3=B6nig <christian.koe=
nig@amd.com> wrote:
> >>>>>>>
> >>>>>>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>>>>>>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers d=
on't
> >>>>>>>> handle imported dma-bufs properly, which results in mapping of s=
omething
> >>>>>>>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lo=
ckup when
> >>>>>>>> userspace writes to the memory mapping of a dma-buf that was imp=
orted into
> >>>>>>>> Tegra's DRM GEM.
> >>>>>>>>
> >>>>>>>> Majority of DRM drivers prohibit mapping of the imported GEM obj=
ects.
> >>>>>>>> Mapping of imported GEMs require special care from userspace sin=
ce it
> >>>>>>>> should sync dma-buf because mapping coherency of the exporter de=
vice may
> >>>>>>>> not match the DRM device. Let's prohibit the mapping for all DRM=
 drivers
> >>>>>>>> for consistency.
> >>>>>>>>
> >>>>>>>> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.inte=
l.com>
> >>>>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>>>>>
> >>>>>>> I'm pretty sure that this is the right approach, but it's certain=
ly more
> >>>>>>> than possible that somebody abused this already.
> >>>>>>
> >>>>>> I suspect that this is abused if you run deqp cts on android.. ie.=
 all
> >>>>>> winsys buffers are dma-buf imports from gralloc.  And then when yo=
u
> >>>>>> hit readpix...
> >>>>>>
> >>>>>> You might only hit this in scenarios with separate gpu and display=
 (or
> >>>>>> dGPU+iGPU) because self-imports are handled differently in
> >>>>>> drm_gem_prime_import_dev().. and maybe not in cases where you end =
up
> >>>>>> with a blit from tiled/compressed to linear.. maybe that narrows t=
he
> >>>>>> scope enough to just fix it in userspace?
> >>>>>
> >>>>> Given that that only drivers which use DRM-SHMEM potentially could'=
ve
> >>>>> map imported dma-bufs (Panfrost, Lima) and they already don't allow=
 to
> >>>>> do that, I think we're good.
> >>>>
> >>>> So can I have an ack from Rob here or are there still questions that=
 this
> >>>> might go boom?
> >>>>
> >>>> Dmitry, since you have a bunch of patches merged now I think would a=
lso be
> >>>> good to get commit rights so you can drive this more yourself. I've =
asked
> >>>> Daniel Stone to help you out with getting that.
> >>>
> >>> I *think* we'd be ok with this on msm, mostly just by dumb luck.
> >>> Because the dma-buf's we import will be self-import.  I'm less sure
> >>> about panfrost (src/panfrost/lib/pan_bo.c doesn't seem to have a
> >>> special path for imported dma-bufs either, and in that case they won'=
t
> >>> be self-imports.. but I guess no one has tried to run android cts on
> >>> panfrost).
> >>
> >> The last time I tried to mmap dma-buf imported to Panfrost didn't work
> >> because Panfrost didn't implement something needed for that. I'll need
> >> to take a look again because can't recall what it was.
> >>
> >>> What about something less drastic to start, like (apologies for
> >>> hand-edited patch):
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> >>> index 86d670c71286..fc9ec42fa0ab 100644
> >>> --- a/drivers/gpu/drm/drm_gem.c
> >>> +++ b/drivers/gpu/drm/drm_gem.c
> >>> @@ -1034,6 +1034,10 @@ int drm_gem_mmap_obj(struct drm_gem_object
> >>> *obj, unsigned long obj_size,
> >>>  {
> >>>         int ret;
> >>>
> >>> +       WARN_ON_ONCE(obj->import_attach);
> >>
> >> This will hang NVIDIA Tegra, which is what this patch fixed initially.
> >> If neither of upstream DRM drivers need to map imported dma-bufs and
> >> never needed, then why do we need this?
> >
> > oh, tegra isn't using shmem helpers?  I assumed it was.  Well my point
> > was to make a more targeted fail on tegra, and a WARN_ON for everyone
> > else to make it clear that what they are doing is undefined behavior.
> > Because so far existing userspace (or well, panfrost and freedreno at
> > least, those are the two I know or checked) don't make special cases
> > for mmap'ing against the dmabuf fd against the dmabuf fd instead of
> > the drm device fd.
>
> It's not clear to me what bad Android does form yours comments. Does it
> export dma-buf from GPU and then import it to GPU? If yes, then DRM core
> has a check for the self-importing [1].
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_prime.=
c#L918
>
> If you're meaning something else, then please explain in a more details.

So, android/gralloc allocates buffers externally to the driver and
imports them into driver.  (And that seems to not just be window
surfaces, but in cases random textures, etc)

In the normal case these should be allocated from drm/msm so it should
hit [1].. this is the "dumb luck" I mentioned earlier.  But I'm not
confident enough to say that there is no other case.

>
> > I *think* it should work out that we don't hit this path with
> > freedreno but on android I can't really guarantee or prove it.  So
> > your patch would potentially break existing working userspace.  Maybe
> > it is userspace that isn't portable (but OTOH it isn't like you are
> > going to be using freedreno on tegra).  So why don't you go for a more
> > targeted fix that only returns an error on hw where this is
> > problematic?
>
> That's what the first versions of the patch did and Christian suggested
> that it's not a good approach. In fact it should be not only Tegra that
> has a broken dma-buf mapping, but apparently OMAP driver too.

Hmm, I guess I'm a bit more conservative when it comes to potentially
breaking userspace.

BR,
-R

>
> --
> Best regards,
> Dmitry
