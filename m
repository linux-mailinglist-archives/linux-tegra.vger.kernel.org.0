Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99DDBC8768
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 13:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfJBLft (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 07:35:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36730 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfJBLft (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 07:35:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so19262537wrd.3
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lcHTFGnV6yd1Wisj/4WziWM4TpBppOAjLSZl4nawSJU=;
        b=eD96z9Elya1XUGB+Q18HX9SWnsU38rYlY8tjsrZIgLSMIXu0P7kjHTLvtv1/wVCrhl
         FG2W8G45OCvbX+JqzC7Jl5VjE0p4KMnyg98PTxxDZJWhytCU3ulnB78hqXf/2WNO9l2d
         EEtSDnsfJmP5hI0l0mEfzdxIS3oj9i5TRImnDXSSy94F25ZEFTFnJLlZNZMnrzB8N/PC
         IrczoKvu1vopl/xl64wzvZLwvE8fYZXPw0NgkF1CUfM1wMvLLtCHgnIg0r1yM9DebDjS
         5q82fgIrnlrqg5TszVfQ+mTGQhGxIo5sEjsWyrrzvp69YgAIskol8UVc401EAeAZ8QH5
         ARgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lcHTFGnV6yd1Wisj/4WziWM4TpBppOAjLSZl4nawSJU=;
        b=QXE/I/icM91B8PJHSVgJfG4CpQgGO1C4HSIIkfZeMRppReXFcmH8TrTpVk+ewKBVk2
         syAC3QAqtdFSGiOtEwtY+Aw2zjEFxCeJzZeA01TD8l9KFHyHVUNdSIGibE+qYYw9jTVW
         uYSRvKieNPrRBkzFddS0zf1PtPpVPYFW40ZrX+h+XQWXVWWtuximAazUT1rBs3kJZwnh
         BfXV+OViBud5eKomcLmVG43SeldLXCSgNcmAZ7FxTIrmaAVMj8KQqZsGTU5Chja1S4uB
         x/6XRhtBTLeMDlv7WRrFO80t2Za/jMWrfhVnFJbAwX7sd45zhyFYjfjbincUfkzQ+nXp
         YXWQ==
X-Gm-Message-State: APjAAAUbjatCT3DwaMhxpAcDcIE/IFsXVjhY1g6n+55QB0bGOOE60q2E
        B9b77YaILaKj60dd/QeSs5M=
X-Google-Smtp-Source: APXvYqwyw0bClBOZtn+Z6AWh9gjMAvPUdDkRxvGS9DbxgkVUgVdIAZ9r/C1bo5F3Pg8nJErtH72hCQ==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr2287380wrs.311.1570016146111;
        Wed, 02 Oct 2019 04:35:46 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z3sm5233757wmi.30.2019.10.02.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 04:35:44 -0700 (PDT)
Date:   Wed, 2 Oct 2019 13:35:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
Message-ID: <20191002113543.GO3716706@ulmo>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-6-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Wfe1KbQWcwuymTys"
Content-Disposition: inline
In-Reply-To: <20191002014153.29831-6-pgwipeout@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Wfe1KbQWcwuymTys
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 09:41:53PM -0400, Peter Geis wrote:
> Add the functions to the chipidea host driver to enable tegra specific
> dma alignment and reset handlers.
>=20
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c |  7 +++++++
>  drivers/usb/chipidea/host.c          | 13 +++++++++++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/=
ci_hdrc_tegra.c
> index 29415c3a2f48..2f7d542d2273 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -118,6 +118,13 @@ static int tegra_udc_probe(struct platform_device *p=
dev)
>  	udc->data.usb_phy =3D udc->phy;
>  	udc->data.capoffset =3D DEF_CAPOFFSET;
> =20
> +	/* check the double reset flag */
> +	if (of_property_read_bool(pdev->dev.of_node,
> +				"nvidia,needs-double-reset")) {
> +		dev_dbg(&pdev->dev, "setting double reset flag\n");
> +		udc->data.flags |=3D CI_HDRC_TEGRA_DOUBLE_RESET;
> +	}

Like I said, I think it'd be better to put this into the same patch that
adds the flag.

> +
>  	udc->dev =3D ci_hdrc_add_device(&pdev->dev, pdev->resource,
>  				      pdev->num_resources, &udc->data);
>  	if (IS_ERR(udc->dev)) {
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index b45ceb91c735..e95b7cb8c54d 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -20,6 +20,7 @@
>  #include "ci.h"
>  #include "bits.h"
>  #include "host.h"
> +#include "tegra.h"
> =20
>  static struct hc_driver __read_mostly ci_ehci_hc_driver;
>  static int (*orig_bus_suspend)(struct usb_hcd *hcd);
> @@ -275,6 +276,13 @@ static int ci_ehci_hub_control(
>  		goto done;
>  	}
> =20
> +	/* For Tegra USB1 port we need to issue Port Reset twice internally */
> +	if (ci->platdata->flags & CI_HDRC_TEGRA_DOUBLE_RESET &&
> +	(typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_PORT_FEAT_RESET)) {
> +		spin_unlock_irqrestore(&ehci->lock, flags);
> +		return tegra_ehci_internal_port_reset(ehci, status_reg);
> +	}
> +
>  	/*
>  	 * After resume has finished, it needs do some post resume
>  	 * operation for some SoCs.
> @@ -364,6 +372,11 @@ int ci_hdrc_host_init(struct ci_hdrc *ci)
>  	rdrv->name	=3D "host";
>  	ci->roles[CI_ROLE_HOST] =3D rdrv;
> =20
> +	if (ci->platdata->flags & CI_HDRC_TEGRA_HOST) {
> +		ci_ehci_hc_driver.map_urb_for_dma =3D tegra_ehci_map_urb_for_dma;
> +		ci_ehci_hc_driver.unmap_urb_for_dma =3D tegra_ehci_unmap_urb_for_dma;
> +	}

Same here.

That said, there are a few other bits in ehci-tegra.c that we may need.
For example, the tegra_ehci_reset() function sets different values for
the TX FIFO threshold, which we don't do for ChipIdea as far as I can
tell. We also differentiate between Tegra20 and later generations with
respect to whether or not they have the HOSTPC registers.

tegra_ehci_hub_control() also seems to have a number of other work-
arounds that are not yet ported as part of this series. And then there
is the matter of tegra_reset_usb_controller(). I recall that this has
caused severe headaches in the past, so we need to be very careful when
changing to the ChipIdea driver that we don't reintroduce old bugs
again.

Thierry

> +
>  	return 0;
>  }
> =20
> --=20
> 2.17.1
>=20

--Wfe1KbQWcwuymTys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ui48ACgkQ3SOs138+
s6HzTA/9FqAAuCnK/P2DVr6120E8bHa0vZStkR3dDyKE2oB5BaOH7PSm2mSpv6S+
xJasvxIUG46ds2TXyLFNNFO9sPlUZeQ7rTwdGOtBU2OJbV7egS1KVQ9NWqqP6Mib
GzNB4FZvkf/6Rkp5jZP+9TL05yaP8+c9ry+Dc25Uu+mAcbnAENj5Md/hZhd8LsmY
QhPY1BB2PIek1h6urIyWI6K/vpbgaoCl65BEJpXLM/kk1FYDHLzUQYFPwhnYlPWq
CUXhK8o/+YPt1y1BCN4lOVYdvNhkIHnlW4MdyULz3devp8GdJGDEcYWWc8C8aPbs
FonVzjUbPaMU0cLmFUCLfsIZf8YQVBKL+hRvyqnwHI2qf9C81a71NsSJ0RIbQiSK
ia9p/MjJSTC8nFbfrmNcQS7HIHruakd/Gtd0uJT1VnQaft9919UrkmI9fD17PyR4
EZFE6+o6bOB7MWO8vbdYk/9tULrHVmyqk5sYb39DWNLfR1FkcOMkN3IrjaiZdDcW
Sdz/HIdrrpGPT+8b+p4GcetuuwChChU77hZayMA7/pGRGP1vjQuEnucglmvkinv1
//BmtDfCD4mU2F9UGMXDTiIM3f3v1aWCF5UAIcfnnTTHLo4AS+L367VlTiKLREub
/v9b1GP9wHG8sZTqwwgJlArn7FFZZzUcvK7YoamhZeWUh3tszSM=
=kkGd
-----END PGP SIGNATURE-----

--Wfe1KbQWcwuymTys--
