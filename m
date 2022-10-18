Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B77A60299C
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Oct 2022 12:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJRKrk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Oct 2022 06:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiJRKrX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Oct 2022 06:47:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424E6B5FCA;
        Tue, 18 Oct 2022 03:46:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b12so19837070edd.6;
        Tue, 18 Oct 2022 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j3M/lz5qKcy4O2cA0PXIjVvWRcebK1YS0t2E2ZHQI8=;
        b=QcLRzTaL8Uq8n1qWmbchdjMXkIpeVLbnkFZGrHCwtuk/sfV/QjDOD6OnRgKTGDgSWw
         pPRnk2dZOZFirQkmViI9HrJwVFrycme3NpsIRjY+mJ8b0QvtEHX/3zDiNZd9QvqVE6z3
         MiX3TQAClob5Zwq0Si3p7afVpVanyLmcoViRyXv+cxJuhKNaEx/nnFr3RdPle9y+uW2k
         W0q7PPmsf4f2POTNZj11eMmL49SIeGFPp+7cTUOvEuz6DnNxSUS+QHzmPAAE/W6EYDaL
         hSOe4Ji6Y8xIlSkEm3m+uWKs7zXJPw6Nint5EwzSzLRY6GLG0PRwKZClo1mKI87X+ArS
         bWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j3M/lz5qKcy4O2cA0PXIjVvWRcebK1YS0t2E2ZHQI8=;
        b=CD1nlfj4+zH8+OFm6YHvYw1cK0FdrRJya6zd+NB8oJSIGB+jlo6y3pgBpyKQCGUFpG
         koHQtnTEPBKZ5pb0UE06/4FSDiq0AfXXCaawJf664Mt6rfBBGL42ZpLfK6NGKJFP/oV2
         hEUlEAp5plhiaSWTW0F5T5NGSbsnHl53yat3ErcBb7QAFa/nWh9Tp2Qz1T+U70fAuEG7
         iazW76HDM2y4RpE6gr/HcngM3kV0/SvpWuoZgH/NEEfvdj2VkALzDGe5nI/UY9V0n4SL
         7sE1VZ7JpfANj/EZ9gj8iSBcc4MPG9oKk3q1K3drD97O7ceExN6jyXxjaPgERMbREfkN
         qVFA==
X-Gm-Message-State: ACrzQf2yToXD4Fw0aWI7IBo5aHVm4coZXjdW3ax14VqYE5cPtFMvyOlG
        kd7xdUFmJlQNcJBLcVCwZzs=
X-Google-Smtp-Source: AMsMyM6njbmUZixipehzHmt3TZ6nV54TCeLyJPOOe8JL01Az5mF9LWX4XqEDq1hWN+QrS/XIxiEqWA==
X-Received: by 2002:a05:6402:4303:b0:45c:cd3d:f5 with SMTP id m3-20020a056402430300b0045ccd3d00f5mr2001704edc.188.1666090015727;
        Tue, 18 Oct 2022 03:46:55 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e11-20020a056402104b00b00459f4974128sm8739778edu.50.2022.10.18.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 03:46:54 -0700 (PDT)
Date:   Tue, 18 Oct 2022 12:46:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
Message-ID: <Y06EHB8D1ip3PVyb@orome>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome>
 <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0puBMFs9lsK95MlP"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--0puBMFs9lsK95MlP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2022 at 01:15:59PM -0500, Rob Herring wrote:
> On Mon, Oct 17, 2022 at 9:54 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > Simple framebuffers can be set up in system memory, which cannot be
> > > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > > separate code path that obtains system memory framebuffers from the
> > > > reserved memory region referenced in the memory-region property.
> > > >
> > > > v2: make screen base a struct iosys_map to avoid sparse warnings
>=20
> [...]
>=20
> > > > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > > > +{
> > > > +   pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->b=
ase,
> > > > +           (unsigned long)rmem->size);
> > > > +
> > > > +   rmem->ops =3D &simple_framebuffer_ops;
> > > > +
> > > > +   return 0;
> > > > +}
> > > > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_f=
ramebuffer_init);
> > >
> > > What's the prupose of these code at all?  I looked through the kernel=
, but
> > > there aren't many other examples of it.
> >
> > This is a fairly standard construct to deal with early memory
> > reservations. What happens is roughly this: during early kernel boot,
> > the reserved-memory core code will iterate over all children of the top-
> > level reserved-memory node and see if they have a compatible string that
> > matches one of the entries in the table created by these
> > RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
> > a matched entry and register a struct reserved_mem for these. The init
> > function in this case just dumps an informational message to the boot
> > log to provide some information about the framebuffer region that was
> > reserved (which can be used for example for troubleshooting purposes)
> > and sets the device init/release operations (which will be called when a
> > device is associated with the reserved memory region, i.e. when the
> > of_reserved_mem_device_init_by_idx() function is called).
> >
> > The reason why there aren't many examples of this is because these are
> > special memory regions that (at least upstream) kernels seldom support.
> > Perhaps the most common use-cases are the shared DMA pools (such as
> > CMA).
>=20
> Also, not all regions need to be handled 'early' before slab allocator
> or drivers are probed. Do you need early handling here? I can't see
> why other than if fbcon is up early.

No, I don't think this needs early handling. Obviously we want this to
be available as soon as possible, but since the framebuffer driver is
built on top of DRM and that all becomes available fairly late, I don't
think this could ever run *that* early.

So are you saying that in general if we don't need early handling we
should avoid RESERVEDMEM_OF_DECLARE and instead manually resolve the
memory regions and inspect them? In other words, RESERVEDMEM_OF_DECLARE
should only ever be used when this early handling is needed?

Thierry

--0puBMFs9lsK95MlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNOhBwACgkQ3SOs138+
s6GMixAAosptozjyV0LN3+Kp4L51xHZfeK0y399j2b2MNorrcoEyr0Ptv/VlWgdp
BD72CEq7CX+8QFn16zTZyMtnytAxl4Gr0Rhci+WadHS+FxMX2C8/0UeBJfs8jOhS
56rdz1momIif7MPtcgW1nQSIQFC+3UVOgI21F1CHYXUDHoPmnSvpMYjzVgVZkloT
7l6gRVGGrE5wfrb7pby8SNay2400ZIaS3IXfXGL34U8rQDA8Upc3IJh0cY+Fw8Tg
RPPRiQHQdbTgMyi1jgYlyXpGAlYy3ywuDrX1sqo0fKooh5SqLoGqidQTsHAEBUPf
DfdUFzpyDxB+SvtVf+b8lx+FC/mnVqg07lH9cKmfhzjqGgo5SElSZjeqjQgxYXdc
VeQySrqJGwzNaj4qQp57O+2LtgncXzTstUSECJ87dvwTRUw+yMygDMRfh25qpmTM
9rn5dO3URjJ0Nzvnulj1Xn5XHA9DpHltc7g4pKiWueYPuxPr2DMdLFF/QT2+sbdy
HoNLcZeECKbk8J9caeIeuDi3pVScE6uaJ4jvq0UrkQMfBRNEaBKlMlrmVz8wlqMd
i43iJYrUrAUiWvXpGCWnwflP1MI6wKLbwIrMaNmzBpTOM526+yR1al/rK8ccp8wb
xGCKg+0FWKl3o1eVDkcrW8QWzZdWR3pPG621KgYy/b56JDMzLOU=
=Cnem
-----END PGP SIGNATURE-----

--0puBMFs9lsK95MlP--
