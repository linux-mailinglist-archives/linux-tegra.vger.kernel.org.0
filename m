Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F085E4444B
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392549AbfFMQf7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:35:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38185 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389198AbfFMQf6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:35:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so10820890wmj.3
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=izY6IcSd1ZMUK/Og2sQCzdx3wME/KF6zRYuoKOMNJrY=;
        b=uwZwK7xjui5QwA4PAcn29wYQe0DkQ7Tnd4cR71XuPGk0hOb2tzlWga3GQCW1ju6zXh
         dyE7Ry+p8pvlA8zV3oW1A8+EpZV1cugv19uwnKTiRlhN1hkVCN1Pjbo5No1vC8Tbdvo3
         3xWbT91wN2RzuUEOLrSh5FvC2W42RF5TW9r8Iqp6ST0VsGillrOihdyBzVOJzyLWdLKA
         zojxnYCKs91OVHh8AY6iuOnpK15gAQ6AvzgG3lAJH8HCdUp3J0rT7hgMXWrwQWO7xeIj
         LN9rm8JHxMzF+VfUClXJkhC+j3Eoij/DnTAB2P7lQiWCJm3TI/QvKq4eqVOAu1oTyBwc
         K/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=izY6IcSd1ZMUK/Og2sQCzdx3wME/KF6zRYuoKOMNJrY=;
        b=jJDp/zeE66t1eTRyLvAs1oIw5jwIvwqA6yV7b1mAZL/L1vEQOn3i09xRwy4NaBDY6Z
         wHsf7SBv6qqHxYJ5Yh117NbLeLwEIRz0c6InQrD2We7tolYAr04NVuAbYhhoM4kZlynO
         7/KbdzJIgHtxMEYn3zzbTPxFkV04nln8Gp2OV1g9nDquJ3TxBohlS74gzHCejdab1eP9
         Z6VOTpu1E3wYowrcHNhMG8dluIJZHtLkwOPNZ4aRWy4pbLpoFsQpURGKEWyYjr/CLJpM
         rSspglPmZcAsnQIw+27NB8TNp3bn6A3Yc9YI8e+SYQwk7zW3kYdj+c2z93u4oGi5DjI/
         8mfg==
X-Gm-Message-State: APjAAAUlI4QTVi4x2sW3KrVl6VZ37S6gSB3hHQLMaK4picR+Ntnu5CSm
        3zfk9N07AxFu5BuroLkBbz5T/3oS
X-Google-Smtp-Source: APXvYqwmiYoflXf96IGfJABVEJb23lFeN6/CgJLitA0txzxIHhfSiVMbBus85IRh+UNBBuWk/qRjTA==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr4223624wmb.103.1560443757034;
        Thu, 13 Jun 2019 09:35:57 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t14sm217646wrr.33.2019.06.13.09.35.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:35:56 -0700 (PDT)
Date:   Thu, 13 Jun 2019 18:35:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] host1x: debugfs_create_dir() can never return NULL
Message-ID: <20190613163555.GC3258@ulmo>
References: <20190613114522.GB13119@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline
In-Reply-To: <20190613114522.GB13119@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 01:45:22PM +0200, Greg Kroah-Hartman wrote:
> So there is no need to check for a value that can never happen.  No need
> to check the return value all anyway, as any debugfs call can take the
> result of this function as an option just fine.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/host1x/debug.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ce2sACgkQ3SOs138+
s6HtohAAuBwOWfNSd5DrSgcbmINlg+ErR56mOn0jMcWxYmAXsshG6USiEF5D+w44
V4jkx+IGs7r8Yuqz8SyIjjjPXBpDY0oV/nMowpjyQpgKS6/FQINxZ4qPb6wJl1Ab
YgERmRpVFPIV/KCQN+2GHQc6DBgp+OL/WYBTLESQsJVMTIbzaHrjRJxplR/60g8n
um2pDZ5Cn6gDK5T5K//IdVcFHYdt8z0SDof6fOSa5iKLoSW5dDa9Pz69awcQfqI/
L3BklL7jts5HFfNDku0iYljHGmssoaHrv+z5zkYleJkQYgpR3Uv4k+IiL0U1Mdeu
9n8CwlbCPtdrujBHQfDuQ8kGxxhQ4knkbyO8Ovw1aoQRBAOtRYRz7jxMzWTIaoC+
KUUPGkxnGopPrHBGZ++V6I10fL0f2EjYwECN40VVBF2aZHY5fAcpOtp47d1rLalO
dnjaSCcLjkJTAAalVdyA36IPEjKKA7LEFCczJkky0E+bUzDNMe+GuOWjBjn27937
CGOqZkT++LOo0Dyi8aZX92RxjINfNPHRgQox5FoQ7Fl5twxu/fgxj1IyAhLnDAa8
ayIduhhakQsvDDGdhbzlWpN78syxyj8JE+vFZ0Deoo2lddbXypj7fzbr5Xq31LvK
OM72mQ9IwoWLNFfqYDG+rDYZroG7qtdZf2ThT/LDxDGah+fnklk=
=NLIL
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
