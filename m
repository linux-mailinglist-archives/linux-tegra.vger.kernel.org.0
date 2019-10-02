Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC485C8740
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 13:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfJBL0g (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 07:26:36 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39289 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfJBL0g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 07:26:36 -0400
Received: by mail-wm1-f65.google.com with SMTP id v17so6572597wml.4
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 04:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1e07DIRPn9XV5+5iL6HCttxu9LjuaNAEFrYNejh7WmM=;
        b=Ie+57yjBfIUf+wpiLe/C1thCL6H6Q9IlskneJRzpspP8sUkyHLogs4I/lwWfpBP2TL
         oMaNQSo4AOO2010CvHOdd9fvCplPmNzJ1VVFaJADJy+nCoY3+FRjXY9g36lgW0gJLx+m
         SUtSlM9FL03rRWSxRZe+boLqmFwBAc+O9a+tV1Vyhsswr+DbCjAKeHqBGrVK3vS8HGNO
         czsPdWFoNbls3ht7zLUbAP8PRQScezXegoqXKBih0f1Ll3meBnQ6jZjJD1xq1QYxzrmy
         KSMAszT0h+yrPnzEwdjh08vcHTCKqYs6NimojGdDcA8gfNW25jQa6P72BylA68/v4z2U
         SM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1e07DIRPn9XV5+5iL6HCttxu9LjuaNAEFrYNejh7WmM=;
        b=ku4NPKVgSrQy/SyYA4glTt/cC6h6kcUVimWup6PgqP6tzZYb8+u6fFULosl/z8Uc0w
         J1svBF+cMHjnXzxuvz9uNwnuip8TJuqSLbG6L8EX/00mgJXwaTStTtOo679/vYtDUkI/
         Pcw2DhW09Qrf7QxmaFIyO9E3Ivd3Y8ydA3eTRr/SvD38xd5WxNco4NtEphTEeI2zwPv2
         Q0rBxrsX3yxDjzkdtEymv+z/V2+dvXNQCj4fhqFBEPX4S4Ps374XfJoTEry88zNnpFtk
         qD8Edt6YJyCJTLgHPxoe79wJENm462kZsz7Xv2Ed8RWhL++G4oNYkk2j8zgKWXlXDuzT
         /j7g==
X-Gm-Message-State: APjAAAUBSZZTObcVCNNiV8eprFcI33f7z6rvO9IyvSm6uC/2m7o3WYph
        Gzxhw0QYQbnuZ5oe6b+XR5TvjN6D
X-Google-Smtp-Source: APXvYqxAmYHi8pGB4skXNutTcGs8zOhiaLqX9s8ewM3Zhet1ZvgzEnvsJgk/nmhO28CUj1zWTec/rQ==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr2623426wmd.14.1570015594099;
        Wed, 02 Oct 2019 04:26:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u10sm37096319wrg.55.2019.10.02.04.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:26:32 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:26:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/5] usb: chipidea: tegra: add the tegra specific bits
Message-ID: <20191002112631.GN3716706@ulmo>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-5-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Osvg0bgWkLaeQPMj"
Content-Disposition: inline
In-Reply-To: <20191002014153.29831-5-pgwipeout@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Osvg0bgWkLaeQPMj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 09:41:52PM -0400, Peter Geis wrote:
> As Tegra requires special handlers for resets and dma alignment, add
> those functions to a header.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/usb/chipidea/tegra.h | 159 +++++++++++++++++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 drivers/usb/chipidea/tegra.h

Can't you move these into the ci_hdrc_tegra.c file? It's kind of odd to
have large functions like this implemented in a header.

Thierry

--Osvg0bgWkLaeQPMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UiWQACgkQ3SOs138+
s6Hmcw/+KhXGTEl/xfxFqCXkWJT6Txhy9mEN14EXJTnIpkdsxvGlQjFWIj/9Sl3z
GyFw4jpFVNH/Jy90Btaktphf2r+946txCysXMLB9kwGcZrzg3J1AAH1oOaooPGj3
109iGkY3RpFSGId1tvRP2v00Y5rMZn3MSDcuAW/Y2S/mi0AD9k9PH/qG84pW1B7P
bV8b7A3xxIu6nXFAocG6/WkQrDDJjYa5gl7dXOATOV8KoizFBD5Os3FZMrbWBhJ7
NJaV/0l+Puw96ptjcixyp+c1ncw6WPUv01jJcfgtGmmGi4nDq1TCQHplYo2O83IE
WIwEkKLafjemlsKxRhIkKc1oUVCjeGKUlz3xUjUtkcMRmOF+66U15V/ekvrTMw3l
U34eaE98Z/lke7kH4h27VQqgaXgJ3idQWDau1yQ77msrzNnjqwrd1yZnGsJHqbIX
ipWhmAB/H+SgIbb0IONbFpSV91Y6iTBm5eH/TW5PJwCWIlu7Es+p5qO5/+osAfWQ
s8neWqOCTqtZOzKZRyQ5E8m355dC1vIYAdIC/jjpwTNEHPBlENhGzvNenHdDhzsT
T+cUE93yupj+wXMZIldQRpaqXP0Qjxb1hV1f+HSOU01NJhAY0w18tWDgqhm9OtdO
mEA/Dz/bv1XYBBWGC9zSZmVS+wLzaiYg3FQlZH5FHZxhTGXHows=
=opof
-----END PGP SIGNATURE-----

--Osvg0bgWkLaeQPMj--
