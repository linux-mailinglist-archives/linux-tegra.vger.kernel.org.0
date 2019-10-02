Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D52CC8706
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 13:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbfJBLK5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 07:10:57 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41953 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfJBLK5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 07:10:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id q9so377685wrm.8
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lwAFLlOupsCPsToIixJbSt2nwj1RPU0uyVOBiLs9kAg=;
        b=oz+u61vRtl6WpS8flKskfJ5cfSsL2O6k30MDvZZ1adUtWiD1KH+LcOJmT1T03FHSWl
         h4vALaIYJWIPaCKaq91zJtpwZdpcqNLqIPs2EclgRbwlbded7f0CASuLOcwa1XKIdu9Z
         qDgggrNZwV4cnlKXLqwR/PSmBihP6OYvVEc/NKDhXZ7uXjQnezyTga0vjydov8vgP6lX
         FPhrDwhNsxg+Fe4RjpaeD69P9xtCx3WQ04iax8xaMXhNFM/AASExE4AzZyhDvCvy40HF
         N2t7682/xgpHIMNy4H54Ua75i2QlSa7GTu7wEWIH1s+8eMpD4/EP4wBLS0sY1meCPAUU
         vS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lwAFLlOupsCPsToIixJbSt2nwj1RPU0uyVOBiLs9kAg=;
        b=jw37ch/kdfN016m8u+H/IvAyG/hNoaSjRm2fG6X+4XCsbnn3AuCvIJUTYX6A+TuFaG
         D8jCe3p5ZykUaNEpmamy9UU0cuD2Ac+kvaPoLm0giOa3BzrN6SfYFZPYMyijEMZ8b9U6
         ClT12o5eKJkaM0wZTQHMG4HG04PHYpW+0BkF0Tg0gTWjxGCcTkbH5P3V3Uy1B2yWEnFK
         e8CRaF2lFWRAnGjtXlOYBWtNjwlh3XrPHX9w2vgZ1vY3MKopU8CC1BYGCzC0RkaGdrIx
         r77HuzEtX5PivwhWYicoXkeCMA82uu/gO+nNiWfRoAPtAMjxWpLTE5Y8olLXksd2oISS
         qwqQ==
X-Gm-Message-State: APjAAAX5t37agnvTS1mpEwB4oJUcgBCpoAtYoD1viIdBlVI8xFXtDgvc
        OxnuH2tX1jFA8D67JxOAjQA=
X-Google-Smtp-Source: APXvYqxXUi/b0+upsXsGAQOrYJIhk4YKoqVhGu+ClQYjGMAnfEUFcwu4+5zsDP6lkevODwl1jJ+iwA==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr685576wrw.359.1570014655236;
        Wed, 02 Oct 2019 04:10:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h17sm5250182wmb.33.2019.10.02.04.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:10:53 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:10:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/5] usb: chipidea: tegra: add tegra specific flags for
 host mode
Message-ID: <20191002111052.GM3716706@ulmo>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-2-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2O+9B+xSKalj/wdD"
Content-Disposition: inline
In-Reply-To: <20191002014153.29831-2-pgwipeout@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--2O+9B+xSKalj/wdD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 09:41:49PM -0400, Peter Geis wrote:
> Tegra controllers require special handlers for aligned dma, as generic
> helpers do not exist yet. Add a flag to set for Tegra devices to permit
> these handlers.
> Also, some Tegra controllers require a double reset, set from the device
> tree. Add a flag for this as well.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  include/linux/usb/chipidea.h | 2 ++
>  1 file changed, 2 insertions(+)

I think it's best to introduce these flags with the same patches that
add support for the features that they control. That way it becomes much
clearer what they're used for.

Thierry

>=20
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index edd89b7c8f18..88cc13fe582f 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -62,6 +62,8 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
>  #define CI_HDRC_IMX_IS_HSIC		BIT(14)
>  #define CI_HDRC_PMQOS			BIT(15)
> +#define CI_HDRC_TEGRA_HOST		BIT(16)
> +#define CI_HDRC_TEGRA_DOUBLE_RESET	BIT(17)
>  	enum usb_dr_mode	dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT		0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> --=20
> 2.17.1
>=20

--2O+9B+xSKalj/wdD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UhbwACgkQ3SOs138+
s6HfShAAhu10cjA+OnSDWHaHzHMLGjvPZJH8H9ov9yxCzmxkqp1G71pYptkFN7vN
ZdHkWACCVJFcyjuIGVztpqq7X5Ks7mvaJlsD8BlcV2ibwml986+ACdQzbaZFp14a
2oV2VVlEqS71RU0bg/eE6Xr/z3gB+T90ERrjBM3++9x1mIAPeJsTA8Vq29kijl1r
ElKAvZusv5/CWgcztnF50Z4eK/qhJXwADRnBmlTzubkCatUzblSIVgimfSV8hzPj
Td78sQr0kDeVryvCG+Z8aFmfItAEQjVG9OJWyrM0Ljnlzb1qN0nf/Q7Loc6N03jN
uJy70bJm4M+PingrscxxbBQOYCDm2YS+Bn4Wz/B2SQPtmmsG9RNPgzGyIEGfVYt3
n7T0gaXNb1UZd+uaSgoQbFIkRvoPYnyF3nCOdD+IHq4D15IQdSM2SpGzxY3L9EKc
GWGXJB0VsvJU+ldYalwq4l/d3Dpj4Ths8+mPS3F9GAapTLp7jK4S+qFJBga4B3Jw
U5T7AGq9BkKfAy2Gxl47vKvNhnHcB7uY8cSv/707cFOX3NJusDvEEvD5nCLBopEC
tBIWRSpaYkuKTg9qewtFcopGvCaJr7x0CYP/cmNmOR54l1hPx3M6VeN/LrfOWnFt
YJUEP2TkVx9/lJUt/dQC9Pejgyz2Wu1cXZgn/uSs6gNbpu3fOjM=
=bAqA
-----END PGP SIGNATURE-----

--2O+9B+xSKalj/wdD--
