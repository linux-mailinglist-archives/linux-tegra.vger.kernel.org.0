Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F60E4910
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Oct 2019 12:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407236AbfJYK7N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Oct 2019 06:59:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37113 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407262AbfJYK7N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Oct 2019 06:59:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id q130so1563524wme.2
        for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2019 03:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GyL5Yf1R+cNJwmYuxDq7TkPQMREhF8qQy7ku3jf9B7s=;
        b=YXq9UBizjmUlrlmCmaBtR4aBR2vOCNJUE32EaKNUrjilCrKYoqrcizmzE7ThxN2DM8
         mrecvTFx2/vXjjLtGuWB6eh929oJxlkcqIgtRURb6Q5L3pJVbCAdSw53zeiLmDjtbtio
         ssFbnkrJiHQ0JjuIncUsX621DHmjAF8g7/e6KMlByN+qOQBnsq11Kg/X+lsMurE2IGLD
         OmqrRdlL8NrfbjiOn3jDqBv14KyA7grd5piEM5+sQmakgZ9IkhK81fvWG883buCSFoKj
         /qhATk9LuE4ki1tLjYkQAs/F5PIvHdSVmu4PTrQHIyFzu/uiBPd6hI33Y42cr9CNMYVX
         A02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GyL5Yf1R+cNJwmYuxDq7TkPQMREhF8qQy7ku3jf9B7s=;
        b=VVNvxiBTb2Qh9DBZNSR/AzoJI1aS95EdQpDOY+uZaZ3OD9pZ6KUYE3V0Pd9PQ7nSQX
         pf0aCZHNexsWjOSfwqn3qSKjWDTXBnmPX9uJr2/hn9+jR9pRDZiR6XoqBixqb/kdQN9n
         k1jnERwZtcLOddafxd59n8BCkTphayzsTnMHxsDxynGuGWrl6BAYYyv+xgWg1fzLvSwh
         yEMdWnEWuELDw3UxL+hfpsRUpts8KU1hDDVuXHCoyvK3Mb+ULBt79ejoAlGPWqUl2RLG
         8LZYQa8selA9hIkDW8T7GvCL0IOaKffsiZgpznFSe0JVrp7+GHZ+78U83cPnhit/XyzN
         RrhQ==
X-Gm-Message-State: APjAAAWcKn82YW2oVA2EdyOwFSCWOwBShr24mqnfi6Fx7iLxf5EEND5K
        1saBjHTiugieavMcO3SG8sY=
X-Google-Smtp-Source: APXvYqz7QHlyIMNln+5Vh6sc8APNGhxYcSgrbpYu/pGasbAX4Vs0D8oRgXimLyZhsxdPdAhKKI3s/A==
X-Received: by 2002:a1c:234c:: with SMTP id j73mr3126153wmj.51.1572001150582;
        Fri, 25 Oct 2019 03:59:10 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id v128sm2443048wmb.14.2019.10.25.03.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 03:59:08 -0700 (PDT)
Date:   Fri, 25 Oct 2019 12:59:06 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload()
 callbacks
Message-ID: <20191025105906.GA928835@ulmo>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
 <20191024181539.GA31268@qmqm.qmqm.pl>
 <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 12:10:49AM +0300, Dmitry Osipenko wrote:
> 24.10.2019 21:15, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> > On Thu, Oct 24, 2019 at 07:31:37PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The ->load() and ->unload() drivers are midlayers and should be avoided
> >> in modern drivers. Fix this by moving the code into the driver ->probe=
()
> >> and ->remove() implementations, respectively.
> >>
> >> v2: kick out conflicting framebuffers before initializing fbdev
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> Micha=C5=82, Dmitry,
> >>
> >> do you guys have a way of testing that the removal of the conflicting
> >> framebuffer actually works?
> > [...]
> >=20
> > I might be able to check during the weekend. Is this patch alone enough
> > for v5.3?
>=20
> I don't think it will apply cleanly on top of 5.3, but should work with
> linux-next or by cherry-picking 9d5a54987265.

I just noticed that I based this version on top of a local branch that
will cause conflicts if you apply this to either 5.3 or linux-next. I'll
resend this later rebased onto drm/tegra/for-next, so it should apply
cleanly on at least linux-next. drm/tegra/for-next also contains this:

commit 051172e8c1ceef8749f19faacc1d3bef65d20d8d
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Sep 25 13:26:59 2019 +0200

    drm/tegra: Fix ordering of cleanup code

    Commit Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after
    initialization") changed the initialization order of the IOMMU related
    bits but didn't update the cleanup path accordingly. This asymmetry can
    cause failures during error recovery.

    Fixes: b9f8b09ce256 ("drm/tegra: Setup shared IOMMU domain after initia=
lization")
    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
    Tested-by: Dmitry Osipenko <digetx@gmail.com>

which will conflict with the ->load() and ->unload() removal patch.

If for some reason you can't use linux-next, it shouldn't be terribly
complicated to backport this to v5.3, though.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2y1XcACgkQ3SOs138+
s6GUUw/+JX4T/+S+Np6c8xtia3ypDnqM/9eryUpqn+hyZ634Kk5VwjduevZoaLR/
KmOKEIA0xD9+ZFylmKsb/sFdgbmkCBx6rlNJhZq5uleGjnNi+6Ybokl4KAtGbzST
u2xGRWNfv/yGy7mmx720nZVPcFpWaXNDCUqlDUVBE1UvIL6LlMKLzLCEdZn7tr8Z
zetlXNd41+l2Me19xAUIZrl3pPEslM0JjvR9i2oEduHTUkITK1+QudFZhDYRJwcm
a9ZEV0qabJpp8AZBLn7cPkyhNPLl2vasuCFIAHBW5+7gtjX3bgtTq5hO5bD8zaKs
3K5G8ZNUHitZcWetD4O298tJqLgrzLSOVuUcCIigsgzmE16VHoxNu9w4kzFBVHwn
BPbcd6qvf6nJeuwagRZ6u2V8jJlFPnzv8RZcRT8DW/R9yAtcEYOItm2LkN1OAtiG
UXaCCccYgl17fhuvdzpS3MCQjSEw7wA3kwbuPWaVUXGSvVZsVrzXwZdN7Q4hfwMV
q/N+Dtn4s6Xv7ia3/cxETW7KVYdEFVPSN2Be6hN5olcnQnjvos8OJII9H4ivGk9+
KhxZYv0LBL7S6yZeoQTZmTpUOTVnEG5a0mVf4UG3QPGwe2kkschynjjQ101IG/v6
9/0ylUXbXeV04bfvliLASaHIwbJ6K6+rTrwjXNq0zSqtcIFVlh4=
=Esw+
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
