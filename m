Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD734182C84
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Mar 2020 10:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCLJd7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Mar 2020 05:33:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33642 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCLJd7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Mar 2020 05:33:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id r7so5078311wmg.0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2020 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gcUSGwWcahiMg4TCjkBZRNzVm/BoVmZE25MELfHaX/Q=;
        b=OLKx0puZQbng2hoGJNvGbLv4nYwbK6YtgBzfO/+Qzjn2v5uJ7Am+GkLSZc+abhwJQg
         UqN5RnghzyaTDZDq2V3RdqQZO0O/0JxsRGo/p2T7a52AAHxCFYbXWGu6MS1776CqdqsR
         0/mhYyBp9njBBDRKeR+xPfb4B3T8kDuTytjG054p6ZswdGP3I4zl4TqI9XNjZrOUb/VK
         goJCzkMycWm2PG1BTLVcWI2vJFvr6FIYJU9YHP6tsseWz3p1lFWytMkCoqb3RX+CyOFu
         NsI0BjNhPUMxt1XN9E+EeYtkWHdg8+A6bpwOp3LdUu8hDotH0HfehRcqtB27Nz3MjRCJ
         DGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gcUSGwWcahiMg4TCjkBZRNzVm/BoVmZE25MELfHaX/Q=;
        b=tS7ZYmFb+6GrHh0/g1JobY1ZjOapTB00STR1eQl/lppm+jF4XtuHIG1JBoyGQDv0OB
         DU/Uz/bvV8k55WMcdii6K/2szd8YILj3QkQOk4LbftZSSw3NNmbYUstxiyu0XKpIQ6ya
         Ybxfl9J1HGKwoDpDLheZuXvlPzJYK0HYhirGK0uJyG+nwvAi7ZiSd4nik/PpUQKxd40u
         /13z8iUSYIiJ+1EpqdLnJm8cxgYJqSoM8Jp0IM6yqbikn42pnP/uSSU64R2fkto77lqz
         h3HshxJ5cXbbvIw/aPCPuOpv1aXaQGpOXh+irjKiNwn7ONk3NNDCZNiEM5H5bvYaVq7w
         OzxQ==
X-Gm-Message-State: ANhLgQ0hvcULSYmVN/3yTn+i907VuEa476ns/B0p/SgPsvJWQCKgxIYe
        QPQmzkcw7m8vBReom6HVFKNacqH8
X-Google-Smtp-Source: ADFU+vuzaA9ysORGD0kQb/tfxKduSsjHe6qfz4cjYXNs5L/yF4WtVxV9kXqVxr4X8rEhGfdIx6Qjzw==
X-Received: by 2002:a1c:b657:: with SMTP id g84mr3912841wmf.107.1584005636670;
        Thu, 12 Mar 2020 02:33:56 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id o16sm60475248wrj.5.2020.03.12.02.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 02:33:55 -0700 (PDT)
Date:   Thu, 12 Mar 2020 10:33:53 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe
 error
Message-ID: <20200312093353.GB1199023@ulmo>
References: <20200308223809.23549-1-digetx@gmail.com>
 <20200308223809.23549-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
In-Reply-To: <20200308223809.23549-3-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2020 at 01:38:09AM +0300, Dmitry Osipenko wrote:
> Driver fails to probe with -EPROBE_DEFER if display output isn't ready
> yet. This produces a bit noisy error message in KMSG during kernel's boot
> up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
> than a corresponding voltage regulator driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 56d933e81797..d7f2c4654b6b 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *=
pdev)
> =20
>  	err =3D tegra_dc_rgb_probe(dc);
>  	if (err < 0 && err !=3D -ENODEV) {
> -		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
> +		if (err =3D=3D -EPROBE_DEFER)
> +			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
> +		else
> +			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
> +				err);
>  		return err;
>  	}

I'd prefer if we had just a single message and only differentiate on the
kernel message level, something more along these lines:

	if (err < 0 && err !=3D -ENODEV) {
		const char *level =3D KERN_ERR;

		if (err =3D=3D -EPROBE_DEFER)
			level =3D KERN_DEBUG;

		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
			   err);
		return err;
	}

Do you mind if I squash that into your patch?

Thierry

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5qAf0ACgkQ3SOs138+
s6F7cw/+O35lxc5r6vj9s5CaQ62P06ket9HhkxwvO5/+Ja+IWAlbcn5oEGvk+hMh
AhAKUG06jyhsQdTVB1AMzAkX9iNZ/08dThYj+/Ub2u4rU+zWkoDxGT8fKeXoPcDQ
tbl4wq6s+7JL1Xwp2X4Owj3dxq89uZxRFryYjK0gcuaSkXF4IB14QZvca27kri8i
MFA6Scoua9FlPbwGtYy1xqw00HxIPnk0f3iNp8M2VnpNpbMyrX6PFu8xF6SEBDaI
JQkgQa8JfO97fFNdI+G9GnnoWlcrq5SFgtRGF134Cx36e9zxrErTNQzkOsEbY35Z
3M/fmNxAXV8d0erYR7UabwVPZR8FLUHEmjBQ+GoY43D/I+uQIZE5lZWwqLI8Lolx
OnL4f0yBeUGgV7C4xwn2J4zBjGkPCRwmfZAc3OFRANHVf7NDWBF+N9awiKuwrMvV
mq8+XR+mvPBrrrYxlHSDV0m24T/4xDHC88NoZ+fwSgwnV/XKxwbOeddMmL9JHVkb
Mzj193AFrVuPGAEBguXBdVKndajsphdDIjqvUVqnPOJvOHG+5gOgqpzQwiPttaX4
Wh2q6nWMh7I9z5uOv+HgC3UOs44rjQY3XZtJWR3VWrKddevSUAqj1L3C0qnEbtP8
N/HKRWNj8I5bv2RmTBSujVivFFhxJD1mp03nF4PSiPefW3Zkgyg=
=GCDB
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--
