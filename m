Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AAD4C8BEC
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Mar 2022 13:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiCAMpp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Mar 2022 07:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbiCAMpp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Mar 2022 07:45:45 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2B4985AF
        for <linux-tegra@vger.kernel.org>; Tue,  1 Mar 2022 04:45:04 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c18-20020a7bc852000000b003806ce86c6dso1157698wml.5
        for <linux-tegra@vger.kernel.org>; Tue, 01 Mar 2022 04:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vVkDLDktF1NJ9W5pxZGteLQiXPtYz4QvqpHL8HfSgw0=;
        b=Ly23InJsarN0c8lW9n6BqRnQoZXO6uhUx+iFgQRtqL0fbo/KO78/tC0dA81HXKuyZU
         ZfhASA/BQj/jacTHdgQMOVkSVezfqiFZbHXlAcT6hSYxHxtpFakk3YSQD/BTUdrZMj/D
         nHCDcGrffrfX46NuDsoqZpkutTJTns3b2zWy1IFxABNml5FJbz/dyFi1oWirxU5YMI9F
         YZI+SRa8o10rqeVlgowu2BcLyXgQtUI9fiq1Sq93sIRduco06Ayh0gidnV6XatWkR0pR
         FqCRCl3TXT6SjuvzD0oI2wNI+/CM1IJqKnpuPe7NWWL6rKFgn05ci8DrzoWT6tz6/tj/
         pvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vVkDLDktF1NJ9W5pxZGteLQiXPtYz4QvqpHL8HfSgw0=;
        b=n/b0OIL6m2pzw0fT7XFWx086SNs1rHeZbZXkXxiUTrT/GLsyjuGWw9eInREqCUOHly
         PNEDyBupClQWol2qXuwZo0nIePtacEcnwwVVrpWkTKZp9f+v23C4O17eFQoL+9izIJ94
         QO4bkq9TlBChQHk6MEtWYJq67fWqUpNvi2LifDn1gCWl28va/Bt8XS7zcGltt4QzDTEe
         DX24GmHE7d+DPxKV0GCXkNfbLH1Oh1A4yILT0AXqmy5LNW4HBbOD3Yo6V+UNG9DrvQ3q
         AJPh7COJb1P/sfcinF/wKETEI8vp+8Nk3OOtBeIafzNCrdcjSykQLzjUrCHfJu3+bBG2
         yAVQ==
X-Gm-Message-State: AOAM533vKOzA/3maqvvR8/ubSdDjrSRPLxCSAsMPh3BHer8wvvHGuPxS
        Frzh3F98NqucDbpPy1ZfVRA=
X-Google-Smtp-Source: ABdhPJywC8YXo+zt45LkAYRRmneKn10kApwWhiB5/AayLAA+CYj8PUsfWsvxUj2wLmjavkXBdTP8pA==
X-Received: by 2002:a05:600c:3503:b0:345:858e:cbe8 with SMTP id h3-20020a05600c350300b00345858ecbe8mr17148371wmq.73.1646138703180;
        Tue, 01 Mar 2022 04:45:03 -0800 (PST)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m10-20020adfe94a000000b001ef57f562ccsm13767800wrn.51.2022.03.01.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 04:45:01 -0800 (PST)
Date:   Tue, 1 Mar 2022 13:45:00 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] drm/tegra: Changes for v5.18-rc1
Message-ID: <Yh4VTKcJPm8IC38r@orome>
References: <20220225163250.1063101-1-thierry.reding@gmail.com>
 <CAPM=9tzr0LSnkHHwP0rUOz+AFwQwtTs38vu+6B-d8VAN=x+BPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wWYfb0W2agy2UDs5"
Content-Disposition: inline
In-Reply-To: <CAPM=9tzr0LSnkHHwP0rUOz+AFwQwtTs38vu+6B-d8VAN=x+BPg@mail.gmail.com>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--wWYfb0W2agy2UDs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 04:51:22PM +1000, Dave Airlie wrote:
> Hi Thierry,
>=20
> dim: d65e338027e7 ("gpu: host1x: Fix an error handling path in
> 'host1x_probe()'"): SHA1 in fixes line not found:
> dim:     e3166698a8a0 ("drm/tegra: Implement buffer object cache")
>=20
> not the same as
>=20
>  1f39b1dfa53c84b56d7ad37fed44afda7004959d
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Fri Feb 7 16:50:52 2020 +0100
>=20
>     drm/tegra: Implement buffer object cache
>=20
> Please fix that up.

Good catch. I sent up an updated version of the PR.

Thanks,
Thierry

--wWYfb0W2agy2UDs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmIeFUwACgkQ3SOs138+
s6HAiw/+LMPw4Gg1CT1MPuljUaQb9yxW4TPoJIusARcNaIwGwpViYD5EXBuibhK4
c/6nbXStHQkQEC+mgXh7RndAdNqinTGcpidnN2Kw5YvYsDxnVEc4L0xmc62FNHcH
aVJGVBTInfdg2KRGxBIUhTUXxEV505JV/RaKNqe+W0FHST5L2ueBsAs2Izu8ADa2
V6ktwtWbq0nxslAAjVx29BeT2fgSy0gKN/AGGiv9ggclP2WdQj4sto5F26bHnHu1
TritSWIcff9NWq/2l4OG1mmPz55iUr9OKA479bUUSAXCZuvmdXleFJSMy8kD5S0D
zHnAunCtkugCBRYSaOCP1tyb7ir7C/Ewbhqgag4mdG5xriXE7v1KXFtG3DVKALt7
CvlJ6eqmjaKdCdPuEIvO1BrNgWZ+AkuG3m0ims90bn99ZLOuE1r0M5c/EtUCwRaG
dQK5T7rHogNndPNgd8jeBPOEM7IWaCZ2YQ+0FLHHJQAIgpYcMzqCYkPPYBHWhFof
0sR3zDz2lYrNU4h7KgcuEIHmpRjS2Lg/3Xd8mMhbV/PU7lX/k8MOJ98cSOmEy5y1
v2pS3ugb8roNilUvtHGkmMM+DavgbI/cO++u/AiRvkIdHPQcvOSjrS2nJCvHk0J2
cYZIiCXxeMWqcWUobWmpEGyOETszc7SGH9vYeTbhTAvxnORV6TA=
=6hPg
-----END PGP SIGNATURE-----

--wWYfb0W2agy2UDs5--
