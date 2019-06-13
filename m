Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF84B44420
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbfFMQfA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:35:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36798 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730744AbfFMQe4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:34:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id u8so10815747wmm.1;
        Thu, 13 Jun 2019 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HzzbYgkXL3nx7rZNrWYRPJ9FH3eafUuwvWKYEt4rTNY=;
        b=EhGkyDzsyQVM4Y/94UxftsVuA8EG6DZPJt0ubfaHzbDr7060e2AlkRN8Zc/vD4NDL4
         Rm2I07fxy+hjZLoiXHVtvVsdQlDzDGew4048qmTDkC0KvtFywEOnqbG7yjSTHZz32gJ7
         z6lz5r5uDFsMQpL/RwT6OHB1szHoIpbZC7ACtuFr+8I59Haa6hu4tRdqkRIaKL4ffoos
         VbIjS3s6oZzhB68MHlgMpEw5oO4ANjp5e2BqrWgUn0w9zGoYUnKTVB/l8sf6CQMHK9o8
         unty7DjXCoDCbcPwqA8q2yBIKhYeKg7l49QAIp30nEzBU8XuiVXkfexqQRQ8Qq19Dbkj
         hhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HzzbYgkXL3nx7rZNrWYRPJ9FH3eafUuwvWKYEt4rTNY=;
        b=oFXvAgHIPi71m//tbpC1nflRKnRQVSUpvccdBqvOuY1t5qXArYXdlS58PZmcqyE8sA
         IYSwVM1hbeQM9Ktkt71RGBG/JJNpR0QGHVYkTPV3Ki56TFE0WQeYB2elb4/jvTRsPVpE
         BMT+Ac+V/SYHL+fhyG9QoZpoCvUtzLEfhKhcYF1JUj3RPuD7CD+/EIUloWuBdNY5zgGM
         /JFnT8MMxbWy/0k/3DIcev6U9rQSyPwg1DezshffLXsHgbu/0ZEqMdkh4R1zp0xMc5sV
         1m+5x3O5lL60dUZvRoBIFC9+fiEw59T904ZXoO9E9vr8OoFYIL8uq4NaGnDl7SbLpC15
         jb2A==
X-Gm-Message-State: APjAAAVofWdITNGmR9TJtl5dT1VfHTkf8YYAO2rhSkSL/0+rkrNg9WZp
        K6SF/wvoIlLBvnrhyHkzD/g=
X-Google-Smtp-Source: APXvYqzOLxHsCwuM6OpMKUGm47fWsof6HuxDcJQf5F/i/8IP53t/xc7LYVZx3n1KnRMnhi0CbPro6g==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr4173350wmh.24.1560443694373;
        Thu, 13 Jun 2019 09:34:54 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id u5sm470875wmc.32.2019.06.13.09.34.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:34:53 -0700 (PDT)
Date:   Thu, 13 Jun 2019 18:34:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: tegra: Add ethernet alias on Jetson TX1
Message-ID: <20190613163452.GA3258@ulmo>
References: <20190613161517.2837-1-thierry.reding@gmail.com>
 <04a355c8-a4ae-9275-a85a-791ce5c1b34c@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <04a355c8-a4ae-9275-a85a-791ce5c1b34c@wwwdotorg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2019 at 10:22:23AM -0600, Stephen Warren wrote:
> On 6/13/19 10:15 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Adding this alias for the Ethernet interface on Jetson TX1 allows the
> > bootloader to pass the MAC address to the Linux kernel.
>=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm6=
4/boot/dts/nvidia/tegra210-p2597.dtsi
>=20
> > +	aliases {
> > +		ethernet =3D "/usb@70090000/ethernet@1";
> > +	};
>=20
> Don't aliases require an ID in the property name, i.e shouldn't this be
> "ethernet0" rather than just "ethernet"? This is a bit more obvious in the
> TX2 patch where sdhci0, sdhci1, and serial0 are shown in the diff context.

I don't think there's a requirement for aliases to have an ID. The IDs,
in the cases that I'm aware of, are used to fix the index given to the
controllers in Linux (which is sometimes abused to get fixed numbering
that can be hardcoded, rather than having a more robust way to look up
the right hardware block).

U-Boot has a comment somewhere about ethernet being equivalent to
ethernet0 and it treats them the same way, if I remember correctly.

As for upstream Linux, there does indeed seem to be a slight tendency
towards ethernet0, though it's pretty well mixed. 32-bit ARM is mostly
balanced, whereas 64-bit ARM uses ethernet0 almost exclusively. Maybe
this means that recently there's been a push to standardize on always
adding the index?

> Patch should probably be CC'd to some/all of ARM/DT/... mailing lists?

Oops... I meant to include those. Added now.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0CeygACgkQ3SOs138+
s6FZGRAAie3WvvLA3MldS9O2cqq/CUfmWuGxbWSyjTIhIRx49f0S1nHj0WJdYOzA
EP7RUHDgqUwJDqkFsNjyZNU7fatwgd784WjL2vXUKZFf5PX04507kzZQvtDvW6g/
ARzahv1N/zU6YvTtLWGC7jgKRa6e8IltBQPIUYEURFamv3i+N+05oLz1xI22Nj3s
b/UAOncXztcR5tlE2Uusk+Avz+uHva6oNYB6WLyIlB+VZMdlUDruMA1n4uy/QZGH
ejkZOt3KteED40l5jQDxocBtqcJmudxE1HHMUsQh8Gz3JUtXK/l+ofks6DXgJ3H6
1ht2S3FoYJUETcV4GU8g1a8oeyuRGQ2yax8rHTBCiVIwBrlvc0b82wXYVOftPFtD
hCur2A/UqlNS3CYSOsE1GuazVNrFPMuqk9qCs1XU0rnw9QioTkUt305vuxCwFoH1
oVFXQGajdXMiTu4QfTtoolCWAugCQLT2W3YFW1qKJ20egvCkvvTQFvz0MX4Q3wGP
m1KD2eo+xCyWFetwLCZzl6yjaDOlzhqctWmVEhxZjV0Vl/C04KklxrD46gohgqzj
fY6TDnjFHVM64MVy8c55OA3PniCv1aQ1brf54eUdlTWp4MS6R3+4zYBP+X5MF3Vb
LQq624SnGItBbllLT+aoKhq0b8uUYszPiYImjX4VmsMqr+O6Q84=
=LHm4
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
