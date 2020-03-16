Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDE7186C70
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2020 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731130AbgCPNs4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Mar 2020 09:48:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50243 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgCPNs4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Mar 2020 09:48:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id z13so1690798wml.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Mar 2020 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mNuIcFRvWWtU/PuZPk0eD/H/O7lw1rT0jNE2PsQxCJg=;
        b=KZS+lz7lt+gfG4h51laMCdrXX4I/DCdT5/1wyMqLScK+zmyJDrL/+Fzm5Jffkbg0Dp
         qSzz1oDec37Xt5+FDONCcX21nC3F1qYnfNw4yr5KLwJb1MvjUIYR/UzZXW74m/in0+R/
         axlkYhFUDb8HlGXZTb6wnRO3zHQLa8IAaTrvpFIUnLCTRLulA4YZSj8YUqPMY2m77Gik
         wWa+Pp1OEz61k2hNO+LFOLdA1jWiOys3Y8DLlSPx25zsqXoTd9+Qsk35e5N4lZLGUy1v
         IaGlOXcq0+/7PK/RLHG7uxk4rKFjsSA+ETIh+gkVj0nAjNhuZhkiiYuxc6VH9YumSAfA
         19pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mNuIcFRvWWtU/PuZPk0eD/H/O7lw1rT0jNE2PsQxCJg=;
        b=FMiiCisu+Ip7iXeUJhHlKisJuKjICwqgl51u1nklqaHnAsg4w9AUNZvDw2wctQQrFP
         7ul43+Re7IrchJos4HRemFYZwnqug4iqTNIZavbDhScJLKRwMZ2Aj48TuaYgjzYdZcAI
         ZWjlP6uW2xoN1Ly2YZwSRRdwjCtL/coKvreoTz5Eyp47/agUp/qO4RQFyOap20LiObEn
         rzEKQlRqY0uJVHYJyHMBRcHcMgQjZdWQeTdw9xETIuL8QEuuCZWLC9/RIMpT0P+RJ5I3
         N2UiUuPEFGDkV4r+dbpfpcG8+d3kJsVDhd8470ywdwhU/DCNbtqEX6xjNo0zhU/XOzTR
         sw7w==
X-Gm-Message-State: ANhLgQ1U7Y7GbxjbmCP/5LlG1+wjOS8KikHgDQJQeWFQxl659HGqu2ep
        rj++3JwOPpbcrW5pAF8SyQU=
X-Google-Smtp-Source: ADFU+vvxCZE1cx3VH2gU6qTI2ea+XHXem/rX60EuuNUSF0ftq/8KcqLMsyuncSjSUCGCHf9M0P5RaA==
X-Received: by 2002:a1c:6885:: with SMTP id d127mr28305994wmc.33.1584366533270;
        Mon, 16 Mar 2020 06:48:53 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id b82sm24135863wmb.46.2020.03.16.06.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 06:48:51 -0700 (PDT)
Date:   Mon, 16 Mar 2020 14:48:50 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Message-ID: <20200316134850.GB3825456@ulmo>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
 <20200313165848.2915133-10-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20200313165848.2915133-10-thierry.reding@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2020 at 05:58:48PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.7-phy
>=20
> for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:
>=20
>   phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +0100)
>=20
> This is a dependency for the USB changes that are also part of this
> series of pull requests, so it was deemed easier to take this all
> through the ARM SoC tree. The patches have all been acked by Kishon.

Please don't merge this just yet. Stephen reported today that this was
breaking the build in linux-next because of a conflict with the USB
tree. I'll rebase this on top of Greg's usb-next branch and resend the
pull request.

Sorry for the inconvenience.

Thierry

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5vg8IACgkQ3SOs138+
s6FqWw//c6MHAtQmVy/jmygoyRjW60kHc9dGR6wmzgrZ2PEAN3SPkKHxMmsAOjQ1
POFT7wg72m/PWduosFoVp6hLzSgVLFEY4HhEtuEGV9LaAtiEkDCmCSa3Q0cHsxhI
SPYBmvkfmX3pWU0asxuh18gQJ8N2umoD99whfEgi4fwfwVpM19vrYdmpfjn43YrO
RgNKr8v5/nL390jLNKqTwb4vv8uHOq5lSMG7udBFWH57JiOiajAHqVdigo6R/QGG
WLkP3qS5Q+dQ1JH6NII68bFgCZNUxJweOaQXb9lBERmqmBdhWUqBtmoOu72hkZwT
iBo0uXtAToTQ1i5N8+9GQi85BDoa3/ZktIiHeJPLAjRGSB1U2l3SU387cB8/DR+M
nY47ctZlt6+oD3guO1Ilh8HxCqu8MV0OdnlauEZRDriunAaH5Xcg2STsPqUErjZg
skbyWtMNbkx/XSNVkYkX2LSE0Pn5m/PUdsD7ieD40jOtHzkvi8njKRvE5F3KHCFg
vc1EwoVYJ9e6EMsF0g9c+4Fxf/AhL9WcUqCfscSFLk14pSo40yQ3qc0QRMsbuFas
1GQMWuPCMICvf7UxVfCg6bjKZgPAhSmRuF/Y2XUOo00DyksRUpr4JxmQN31XTqDh
U+6rwgMb5I6RKtr2JxYdxKpWg+kwdZqOfr3zNg4PYJK4jq0WRpw=
=s9Fz
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
