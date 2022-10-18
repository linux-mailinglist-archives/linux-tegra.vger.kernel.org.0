Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A6B602F44
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Oct 2022 17:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiJRPOB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Oct 2022 11:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiJRPOA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Oct 2022 11:14:00 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FF4915E3;
        Tue, 18 Oct 2022 08:13:59 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ot12so33072554ejb.1;
        Tue, 18 Oct 2022 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNhLngTIuDz1fSYbv22Q+H67fNTF0+BxYrf0gp74wcE=;
        b=SJ+IAl+5OCTWqEqNS36XDi+g263hCCGcnv4o+XbHlDJ0gApDWpYXAX3H9pg10kSFbs
         1c+0+FMqM1YzZxp/KuVkkOBnXCmtICYgDnkTG2MvOK0a7StFrLopq47qfs4qOevwCYEo
         XJIutrgBVM4p17Zch+5QVppdx/uVViK45dBPOnYGMDKTmQyQ0mg82PSrobNxHdba/bvl
         cGYeQtzraRd0YOAuZwX5cZoPta0Ld9wAsTsMVx2YhGalaPbF/BbT8069N/KTz0mGAZ9V
         EYqQiw2UMUIJ7Rp5Az+5XcoH4e9/tDnpLy7JnkCMUY912y8s7ETc+Q+1mNzCX/f7SEx1
         w6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNhLngTIuDz1fSYbv22Q+H67fNTF0+BxYrf0gp74wcE=;
        b=TZlIKs6oupWuIrN5lAmOfOqkRl6vNpAlcWnp0I438OBP9mDhiMQMjWrZEhiYw1lWVJ
         JySRMowL/eA+V5z92oyXMgE1tmPc3XwcJslwksblSEhJujmv6K04F9lpZ6Gj7lr2nRxe
         XRN5yjo8Nf4U2bwUr8DbNEFn7+artCVOQkopCwBFgkPHamjtftJbJf0IGTXVmhJSpTIE
         y9BqEcwNF6eXgTlrpT5jwOl8HuZU/S4p+42C/QszF7Ac/2AcSeRWImHPz0nwe2e2s0GJ
         LATsHpnLV1SVVrHAH1awvDKpyQPY89Cb5W37Fz74NE81awBfQ3pAxmczoLGgmtery88R
         yPNA==
X-Gm-Message-State: ACrzQf3e6jh+Y5JqKYeEXe9h/3+KewmaZxrAFcvHei1pb2YMqPQg2c4f
        n4eCW+YMWhI6qeaLHisp8RE=
X-Google-Smtp-Source: AMsMyM49rLo/J1OXRnregHqWmX5zETPBTJALo8rB9x3LRt9TqKEOvT1Vo3wcC0KotJWcvAsjr0kH5A==
X-Received: by 2002:a17:907:7638:b0:78d:9e03:86a8 with SMTP id jy24-20020a170907763800b0078d9e0386a8mr2859624ejc.6.1666106037381;
        Tue, 18 Oct 2022 08:13:57 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ey4-20020a0564022a0400b00459148fbb3csm9069904edb.86.2022.10.18.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:13:56 -0700 (PDT)
Date:   Tue, 18 Oct 2022 17:13:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
Message-ID: <Y07CsnyOAwU/pv7y@orome>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome>
 <ea6c20a6-f171-4618-1763-45d4efa907c9@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+4WO9rRGtMXr/sgr"
Content-Disposition: inline
In-Reply-To: <ea6c20a6-f171-4618-1763-45d4efa907c9@suse.de>
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


--+4WO9rRGtMXr/sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 01:58:53PM +0200, Thomas Zimmermann wrote:
> Hi Thierry
>=20
> Am 17.10.22 um 16:54 schrieb Thierry Reding:
> > On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> [...]
> > >=20
> > > That whole 'Memory Manangement' block is will be unmaintainable. Befo=
re I go
> > > into a detailed review, please see my questions about the reservedmem=
 code
> > > at the end of the patch.
> >=20
> > It looks reasonably maintainable to me. Given that we only have __iomem
> > and non-__iomem cases, this is about the extent of the complexity that
> > could ever be added.
>=20
> I think we should split the detection and usage, as the driver does with
> other properties. It would fit better into the driver's overall design. I=
'll
> send out another email with a review to illustrate what I have in mind.

Okay, great.

> > > >    /*
> > > >     * Modesetting
> > > >     */
> > > > @@ -491,15 +594,15 @@ static void simpledrm_primary_plane_helper_at=
omic_update(struct drm_plane *plane
> > > >    	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plan=
e_state);
> > > >    	drm_atomic_for_each_plane_damage(&iter, &damage) {
> > > > -		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(sdev->screen_base);
> > > >    		struct drm_rect dst_clip =3D plane_state->dst;
> > > >    		if (!drm_rect_intersect(&dst_clip, &damage))
> > > >    			continue;
> > > > -		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->forma=
t, &dst_clip));
> > > > -		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_pla=
ne_state->data, fb,
> > > > -			    &damage);
> > > > +		iosys_map_incr(&sdev->screen_base, drm_fb_clip_offset(sdev->pitc=
h, sdev->format,
> > > > +								      &dst_clip));
> > >=20
> > > You'll modify screen_base and it'll eventually blow up. You have to k=
eep
> > > initializing the dst variable within the loop.
> > >=20
> > > > +		drm_fb_blit(&sdev->screen_base, &sdev->pitch, sdev->format->form=
at,
> > > > +			    shadow_plane_state->data, fb, &damage);
> > > >    	}
> > > >    	drm_dev_exit(idx);
> > > > @@ -518,7 +621,7 @@ static void simpledrm_primary_plane_helper_atom=
ic_disable(struct drm_plane *plan
> > > >    		return;
> > > >    	/* Clear screen to black if disabled */
> > > > -	memset_io(sdev->screen_base, 0, sdev->pitch * sdev->mode.vdisplay=
);
> > > > +	iosys_map_memset(&sdev->screen_base, 0, 0, sdev->pitch * sdev->mo=
de.vdisplay);
> > > >    	drm_dev_exit(idx);
> > > >    }
> > > > @@ -635,8 +738,6 @@ static struct simpledrm_device *simpledrm_devic=
e_create(struct drm_driver *drv,
> > > >    	struct drm_device *dev;
> > > >    	int width, height, stride;
> > > >    	const struct drm_format_info *format;
> > > > -	struct resource *res, *mem;
> > > > -	void __iomem *screen_base;
> > > >    	struct drm_plane *primary_plane;
> > > >    	struct drm_crtc *crtc;
> > > >    	struct drm_encoder *encoder;
> > > > @@ -706,35 +807,9 @@ static struct simpledrm_device *simpledrm_devi=
ce_create(struct drm_driver *drv,
> > > >    	drm_dbg(dev, "framebuffer format=3D%p4cc, size=3D%dx%d, stride=
=3D%d byte\n",
> > > >    		&format->format, width, height, stride);
> > > > -	/*
> > > > -	 * Memory management
> > > > -	 */
> > > > -
> > > > -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > -	if (!res)
> > > > -		return ERR_PTR(-EINVAL);
> > > > -
> > > > -	ret =3D devm_aperture_acquire_from_firmware(dev, res->start, reso=
urce_size(res));
> > > > -	if (ret) {
> > > > -		drm_err(dev, "could not acquire memory range %pr: error %d\n", r=
es, ret);
> > > > +	ret =3D simpledrm_device_init_mm(sdev);
> > > > +	if (ret)
> > > >    		return ERR_PTR(ret);
> > > > -	}
> > > > -
> > > > -	mem =3D devm_request_mem_region(&pdev->dev, res->start, resource_=
size(res), drv->name);
> > > > -	if (!mem) {
> > > > -		/*
> > > > -		 * We cannot make this fatal. Sometimes this comes from magic
> > > > -		 * spaces our resource handlers simply don't know about. Use
> > > > -		 * the I/O-memory resource as-is and try to map that instead.
> > > > -		 */
> > > > -		drm_warn(dev, "could not acquire memory region %pr\n", res);
> > > > -		mem =3D res;
> > > > -	}
> > > > -
> > > > -	screen_base =3D devm_ioremap_wc(&pdev->dev, mem->start, resource_=
size(mem));
> > > > -	if (!screen_base)
> > > > -		return ERR_PTR(-ENOMEM);
> > > > -	sdev->screen_base =3D screen_base;
> > > >    	/*
> > > >    	 * Modesetting
> > > > @@ -878,5 +953,35 @@ static struct platform_driver simpledrm_platfo=
rm_driver =3D {
> > > >    module_platform_driver(simpledrm_platform_driver);
> > > > +static int simple_framebuffer_device_init(struct reserved_mem *rme=
m, struct device *dev)
> > > > +{
> > > > +	struct simpledrm_device *sdev =3D dev_get_drvdata(dev);
> > > > +
> > > > +	sdev->sysmem_start =3D rmem->base;
> > > > +	sdev->sysmem_size =3D rmem->size;
> > >=20
> > >  From what I understand, you use the sysmem_ variables in the same co=
de that
> > > allocates the simpledrm_device, which creates a chicken-egg problem. =
When
> > > does this code run?
> >=20
> > This will run as a result of the of_reserved_mem_device_init_by_idx()
> > call earlier. It might be possible to push more code from the sysmem
> > initialization code path above into this function. That may also make
> > the somewhat clunky sysmem_start/size fields unnecessary.
> >=20
> > Alternatively, we may be able to skip the whole RESERVEDMEM_OF_DECLARE
> > bits here and directly resolve the memory-region property and read its
> > "reg" property. However it seemed more appropriate to use the existing
> > infrastructure for this, even if it's rather minimal.
>=20
> I agree. It would still be nicer if there was a version of
> of_reserved_mem_device_init_by_idx that returns the instance of reserved_=
mem
> instead of setting it in the device structure behind our back.

There's of_reserved_mem_lookup() which does that, or at least something
close to that. Ultimately, as Rob mentioned, we may not need any of this
infrastructure and can just directly parse the node from the driver.
This should allow us to avoid any of this infrastructure (i.e. the extra
indirection) and encapsulate the handling of this better.

I have a couple of ideas, but I'll wait for your feedback to work that
in as well.

Thierry

--+4WO9rRGtMXr/sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNOwrAACgkQ3SOs138+
s6GjBBAAwMOwYJOhKQB73ERCKCA5rnQjsnTexose3tnO8d1wi+1hsDpRZx8uuXYs
H/6wum0kONVmCZd7D6gVTgAcXbNdyWNsgtghlrVMDkgHVvVfa7ler5gylBtWwqlX
Tjt53HUcSXCBqISKcyhQd+IOoL1Qfwb9sCJdxAdJF1Qga0F8oXu24+4Kj0vH5RMe
ATL+eXl9kvCdzhQMuAQEYDudvoJrDuxJ3QJJhaS2WAnjBQN6Ukb1iLubl4vleaFH
6Hf3wUAiF0+kMDTAi874Gb6rjF4NvHWIO7/m0uOMlrefJyQ04IPuYebcbXYA+upF
ET3vQILn79XWSH5Vx1NEihZ6mVWg6JcVx4Wnf9qlkQSoyNf1lxnQrq5qc33F05Ho
rNa3MycoOADcRMhalpHtfZF7fWhy8h0YNUM2FsCKUiaGWzvfdsxGXp5qycho9kNm
98QX/xVWd/HHGEHPNjnz73dEd+acb2vDzgxXUJ2yWxjlQ4w1KjPLqf01HYv8I/qI
kqIrhoGcs41keS8PSW/4PWW4Vax6BZt2X7SeRyxk21D4dlijftMfcNY5YR2Rs/PM
QFcndH/LumO2D+rYLLDMItlQ7V3T3s6WNuky6hmTuXpWU9cfxwAyxc1UI+SZX5T3
TgSzPvEFJl2gmTkjfGyUVxVPVtTxxg8uo7aMYfZchq0fctrVB6E=
=D93o
-----END PGP SIGNATURE-----

--+4WO9rRGtMXr/sgr--
