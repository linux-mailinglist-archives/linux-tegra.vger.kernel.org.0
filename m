Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F3EE89A8
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Oct 2019 14:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388740AbfJ2NhM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Oct 2019 09:37:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40060 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfJ2NhM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Oct 2019 09:37:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id w9so2442142wmm.5;
        Tue, 29 Oct 2019 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8lwcaYnJrBKyqIG9quTXehDwR3z8AXMYUrj3JaJqoL0=;
        b=jSRS6F2qMonve33J/HWHD6MXsXHOUiX2hcdxSgsj/jPwNkKm6igjOBRq36WOFRR5I6
         Tyel5I8PmE4Rdsb06RdIZoG8ZeFGfVo/zW6wrDRVjiK2jY9E/GpYEwFJ+YqlTdtyHbM0
         vQDUMEVIqVhw39sowvaDpCss+lRM1dKJ9j3zzW9eHbjdZPsS3IrfKZt93f16cbOjLbdV
         jMv8BH7H3CAONeKjNcqFV2Wxph+qJpXS07b40lVWLMkrn9qUSFSRzMYXujJVr5xRKJrp
         HywHR+rr85QWTTFRKaFJCSwYxK8dONmTTc5oEVq+qqdFULzcRXrsaAMZYq/xZ+aL8Z2d
         eQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8lwcaYnJrBKyqIG9quTXehDwR3z8AXMYUrj3JaJqoL0=;
        b=sMH3rQumdt75QueNIrXz/yi3r/kvlF0/8Hp+nUXlXMO+9G06llkF99wNUBIvAMj2IN
         TrTeFx+DEjSNAJ+L84zOrq2xwMa6OSbd4U+dvjch88eOms2GXrIPsr9BY30hJv9wSlrL
         Oz6G0vRPXpskf6cFDF9O/4MbO1GwYd91x+ZftDl+aHCBXFQwcxBk6nCDZwfax6SnknTu
         aD3DyJ5XjaVx999bORDQnpJ2yrMeX7r3HAOxxRbOpcYKUsU/hHdYGXyZfD7mQ1q6EVrF
         78Xnlpv9sMFD1SBJWxd86KzZNzF4c+DF69i/x0ma7YPuOW5VkgixeSwbRA56Y9m7z0iy
         sPVA==
X-Gm-Message-State: APjAAAVHOPe+zWav2IShNrygoXQkj1dYaHn4XIc6LbUfRZljATwcT7qk
        5IfFTk1iTMvhvzseQMZEz0XOg7Ux
X-Google-Smtp-Source: APXvYqwV+/m9LTZGb6jkb4Nea5n4oOgmFOuTdwUtlzkPVDv43LKJ7ejn3TwrfWT18J+SNbkZsz8ykQ==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr4243929wmb.140.1572356229436;
        Tue, 29 Oct 2019 06:37:09 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l15sm2819271wme.5.2019.10.29.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:37:07 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:37:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Message-ID: <20191029133706.GH508460@ulmo>
References: <20190926191755.27131-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ecMC0kzqsE2ddMN"
Content-Disposition: inline
In-Reply-To: <20190926191755.27131-1-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3ecMC0kzqsE2ddMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 10:17:54PM +0300, Dmitry Osipenko wrote:
> It is possible to get a lockup if kernel decides to enter LP2 cpuidle
> from some clk-notifier, in that case CCF's "prepare" mutex is kept locked
> and thus clk_get_rate(pclk) blocks on the same mutex with interrupts being
> disabled, hanging machine.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> Changelog:
>=20
> v5: Clk notifier now takes powergates_lock to avoid potential racing with
>     tegra_io_pad_*().
>=20
>     The original fallback to 100MHz when clk_get_rate() fails is preserved
>     now.
>=20
> v4: Added clk-notifier to track PCLK rate-changes, which may become useful
>     in the future. That's done in response to v3 review comment from Peter
>     De Schrijver.
>=20
>     Now properly handling case where clk pointer is intentionally NULL on
>     the driver's probe.
>=20
> v3: Changed commit's message because I actually recalled what was the
>     initial reason for the patch, since the problem reoccurred once again.
>=20
> v2: Addressed review comments that were made by Jon Hunter to v1 by
>     not moving the memory barrier, replacing one missed clk_get_rate()
>     with pmc->rate, handling possible clk_get_rate() error on probe and
>     slightly adjusting the commits message.
>=20
>  drivers/soc/tegra/pmc.c | 71 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 56 insertions(+), 15 deletions(-)

Applied to for-5.5/soc, thanks.

Thierry

--3ecMC0kzqsE2ddMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24QIIACgkQ3SOs138+
s6FSwxAAizux6FGJiu8C/lxKhpOifS4J9zZnsoI30S8mDSYeeRt1IqLcxtOXNiVL
Ch4E4gBOE6MMI7PWaiWwvTPcJSD9dR9Fc4RMvs30DN1dapyuuBANuqsiSWjeok7v
fomzpCvZl4BHwKP1FkNZTL39B5z9r4tdAP4DRQz3fOuMi3qU135f+RPJuVXkdmHk
DfirDHIvTvNYJNUY7EZjUZvHvno7ai/yuUiHAayXghcUrP8xEk4iYxWfXonAoqWC
TYVItuoUXz1KcBNPEpPKMIU2DstXE3IiDaTOB2wn9ooxI+nnKSN0It9DRQQTLc/Y
0LrOSwMi0OhJV3FlMoFc82t582ZxSwTcSkF629p4CX+M9JEuvFZ7r3oEi/WkP+3+
ZuMSQihQ02wjdzsX+zaxfV2SJRvGl8Q8HgbaZDwiVsY7ZpUeWT+ud8MzHCvV7WHE
CJMjKPfhXep54kUTIzTK8prZ9JTq4HIHCnaljszzrvDDbcFtp1GfVlJTMdAYYlaV
TZH5hPnzG3EkX2tF0ND0Ovfej1+t4ea9rwf6p0JywAfQxISawPKSPK91DoWw7vFN
DcinaU1607kTJdfx1ucKWEUjx/h3eChE2baLeRfaF2xWRYlTvPCWcis7H68TZVSm
axjmHvrRbHhjYRwOp0mha6ltwZgGiEu8x9LuliyVkqOQtJmIAUA=
=ISZs
-----END PGP SIGNATURE-----

--3ecMC0kzqsE2ddMN--
