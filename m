Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE4C2136F8B
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jan 2020 15:33:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgAJOdk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 09:33:40 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33324 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgAJOdk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 09:33:40 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so4544464wmd.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wPPIfpUVp9HPZTa3lVOfDTxKHbqfXtWL5nrRxR5B21s=;
        b=ql8JzfyuVof50Majq4v4YzsqGy532Ro2vuoG8sKY8SEDZOuE6lB6c/cWVsd9fk/Q+H
         xbeeRwKQ2iOiPXDrR/Gpie4lURSIIEMYOUmSq8YaBn6YA58wXCQKCVZyqAAjNWP3GExU
         q/vNMT8l8cfTvFbPWO0y3qoAVRbRfpMA4uzdldU70WcWg9P6r9kO2EgakCZnpCSx/RFH
         u+KF03D+x6ddWJaF12by2oA6E9kEjXieDtMVpcxdUDpFsNrq5rK85E9TADMg1EXu6gz5
         V6IkLB3qlkaY/jvTNWAG9YR6j9/sY4ZbF+tmw2PYFT1Rs+ONrOYA2Cd7oRYZPsBXdSNk
         leUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wPPIfpUVp9HPZTa3lVOfDTxKHbqfXtWL5nrRxR5B21s=;
        b=hrvxQ+tjJvezzXInXR6XIFJXMv9Zj84QrV+aRF2zfl3K22ILWr9xL2S5SkfgweEA++
         ZyeeudgoP6dri6ZuKm+WphTjcAq/ERIrm8vmIXMbj+YLlBh/y+E9iys6mxisVBgTiQxe
         BFzX3oP01doRftawTSSLR/xc4rxA4Jn41dum30br30slz8rCtkm5JD18UD7DGUvlMQqq
         BnPnV+6xO4LkJe9gdjkXaAuaPrtf+N1Btf0fhHKuJQxv7UGVDdeEQFWB0RYz+mkSomNo
         68jpLbEtYclSx3Iw6Drd6PaPuilhFlNtCaOdekKxF0+f6CbqdbWfYjqAv7vI7G3WDHOm
         OZYg==
X-Gm-Message-State: APjAAAWFY5crvu4JGIpKMsS5mrjHjTlkL41WXg0xLw1HqVQSrHx7Uw9o
        P9JKk6864i6dzm00tYrta74=
X-Google-Smtp-Source: APXvYqziDE2/LT4+o8aekdFSyRGTnlrmHxrO9lRCeCYXfvFS3RnFiJ4QbWKyZiTjOiGnxG+R82MzOg==
X-Received: by 2002:a1c:9e15:: with SMTP id h21mr4507801wme.95.1578666818458;
        Fri, 10 Jan 2020 06:33:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id s10sm2376838wrw.12.2020.01.10.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 06:33:37 -0800 (PST)
Date:   Fri, 10 Jan 2020 15:33:36 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] soc/tegra: fuse: Add APB DMA dependency for Tegra20
Message-ID: <20200110143336.GD2233456@ulmo>
References: <20191229150121.1635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjuZg6miEcdLYP6q"
Content-Disposition: inline
In-Reply-To: <20191229150121.1635-1-digetx@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bjuZg6miEcdLYP6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2019 at 06:01:21PM +0300, Dmitry Osipenko wrote:
> Tegra20 FUSE driver depends on DMA channel presence, otherwise it fails to
> probe.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.6/soc, thanks.

Thierry

--bjuZg6miEcdLYP6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YizwACgkQ3SOs138+
s6GXrBAAvR80pePuQVxKoF6mknFT8LeNOteuYXFRqyvhZCvVswsu/UNxU9wN1e0V
G1aqotq3X7Z2LOW1wIykHfayAOiBp/gefW1OQaXerOdFRQUl7+bLr5gqOCVhoaIQ
VUaES7yuQUORq0uQ2W5gqJyRvaK83QdWGiB6Am24Tnn3OqMeYynp8aWAEMrrd2ur
ZMcRZxx+fTFgHYHKutXlXRJg0RHAEBz3Bsdnp/it7raetKrr7fvZCFXQone2IecN
vrh2SlygYz41HCOUL4ge/JiZauteixtfmw7MQgGYL6buqyPpzWbIFn+1yr3jb3jl
wntVeN6iz+RhXf1GiHFxTUmq+NshT9NiAvSCKph8L5yp5usUxc1swZVGIXxc8afA
PCfL+coHn/OafbdUyO7yHWQ75pSt9Aqi4dHCUi98soiY/2yPOgYrh8DmKt+g4U5w
5QYEqEgqst6hEevS9fXuZx8wcmP74X/E6NelCt5g86G+vh3VUFor1DIV9kAwNrmj
3kkq9rgbyBkol09YoFGd0FZLjSm0vrH1AQO3adAjwxmBu7A/0GpSrty+PJle8gWY
++2YDIjbqXmgLV+VWY75B+b1toWdRBuA1j9eGHylHHnVEtI515khuNA+WDTFwU+G
HA4h0CtBAjFjT6a+r8FYq61Bl55LjJOWHWAeWZiD6Ig4CbpR43k=
=XBdC
-----END PGP SIGNATURE-----

--bjuZg6miEcdLYP6q--
