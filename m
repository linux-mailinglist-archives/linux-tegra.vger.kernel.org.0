Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F83C27FD9B
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Oct 2020 12:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731895AbgJAKqT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Oct 2020 06:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKqS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 06:46:18 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EF3C0613D0;
        Thu,  1 Oct 2020 03:46:18 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so7309446ejm.7;
        Thu, 01 Oct 2020 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q5uEB4x1P5aLwGMlaO/j3HoONRcybUh4egSZYbmqf5g=;
        b=Kr4L/mkeLGOTEtq3ekhhpb1SFpq8JuJW4jzPpN6zlVQGxkAp/jb+kwW7I8hCPO24rr
         ie1b3Q2RiE88ZFGBnJUYy2WhybSzrXVb9uAXtMh+BqBLe5ZAGvcWY/0qeGvwQ7zCcxwL
         W6rQvGOOFD1amT1/xjU5F+Jtr9qaE37jaPYITPSbZexujjVJCQ3kx4FhEPrjmtey8k4d
         MgX6KR17oyIDArJFRqB6oGuXFdgJ/dHX7o7Bczhcu5+bhGKfSdVZECm090qmbeL4Czyn
         2ejNiyBXWN+QmG3w3c7hwryM1IKZeaeyEua2XGVakXIPqEcSBQ23hkeM90QfQanAKraG
         0cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q5uEB4x1P5aLwGMlaO/j3HoONRcybUh4egSZYbmqf5g=;
        b=RQX9IWqdF6mmxb5YyavPBQ/eAYfv7QVbxmjSg/vwPXnT2UWjjNi+Z666iRhP1bIEsl
         sHypAF7nKK7kox4OyH/LUgiz473/EDJEcBqPsmgssEkSBXC9U9GCDj/ucbWA8EBlXBqx
         a2+Md+YN910AUM0cqHlHsU9th7FSVOIABURxYy+CaQjEgyYoK2knGx9OlNqHUnkL1ZD+
         fYS24osy9MmjENAPNWAR9GgSQQ4NmNjhgkihV0ihPedPr2OsIQFHyeoqLeZ0W8UhiXye
         mJfkdiSoNeKT/mBQvnjqbLoCE5H4cD06DlyfYrtaxIj3NhaNO2XFfhvadc6UxwFnlYGi
         gSQw==
X-Gm-Message-State: AOAM5320e05HIe9lxcAOqx4OkMWUyBdgBpWJcALB1DqMSoFh42QQEhcB
        upmUZwQzvyZUr8jLcp65KBQ=
X-Google-Smtp-Source: ABdhPJwaE2LltUJSYXb2cw3F9/V/85ZIniNCwa2IoQOF8aRSq7izvbfXX0w3pODR5xMNgWjvW1JKgA==
X-Received: by 2002:a17:907:33ca:: with SMTP id zk10mr5251443ejb.317.1601549177033;
        Thu, 01 Oct 2020 03:46:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w1sm3591663eds.18.2020.10.01.03.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:46:15 -0700 (PDT)
Date:   Thu, 1 Oct 2020 12:46:14 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001104614.GB3939583@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline
In-Reply-To: <20200930203618.GC2110@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 01:36:18PM -0700, Nicolin Chen wrote:
> On Wed, Sep 30, 2020 at 05:31:31PM +0200, Thierry Reding wrote:
> > On Wed, Sep 30, 2020 at 01:42:57AM -0700, Nicolin Chen wrote:
> > > Previously the driver relies on bus_set_iommu() in .probe() to call
> > > in .probe_device() function so each client can poll iommus property
> > > in DTB to configure fwspec via tegra_smmu_configure(). According to
> > > the comments in .probe(), this is a bit of a hack. And this doesn't
> > > work for a client that doesn't exist in DTB, PCI device for example.
> > >=20
> > > Actually when a device/client gets probed, the of_iommu_configure()
> > > will call in .probe_device() function again, with a prepared fwspec
> > > from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> > > in tegra-smmu driver.
> > >=20
> > > Additionally, as a new helper devm_tegra_get_memory_controller() is
> > > introduced, there's no need to poll the iommus property in order to
> > > get mc->smmu pointers or SWGROUP id.
> > >=20
> > > This patch reworks .probe_device() and .attach_dev() by doing:
> > > 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> > > 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> > > 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> > > 4) Also dropping the hack in .probe() that's no longer needed.
> > >=20
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> [...]
> > >  static struct iommu_device *tegra_smmu_probe_device(struct device *d=
ev)
> > >  {
> > > -	struct device_node *np =3D dev->of_node;
> > > -	struct tegra_smmu *smmu =3D NULL;
> > > -	struct of_phandle_args args;
> > > -	unsigned int index =3D 0;
> > > -	int err;
> > > -
> > > -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", ind=
ex,
> > > -					  &args) =3D=3D 0) {
> > > -		smmu =3D tegra_smmu_find(args.np);
> > > -		if (smmu) {
> > > -			err =3D tegra_smmu_configure(smmu, dev, &args);
> > > -			of_node_put(args.np);
> > > -
> > > -			if (err < 0)
> > > -				return ERR_PTR(err);
> > > -
> > > -			/*
> > > -			 * Only a single IOMMU master interface is currently
> > > -			 * supported by the Linux kernel, so abort after the
> > > -			 * first match.
> > > -			 */
> > > -			dev_iommu_priv_set(dev, smmu);
> > > -
> > > -			break;
> > > -		}
> > > +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> > > +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >=20
> > It looks to me like the only reason why you need this new global API is
> > because PCI devices may not have a device tree node with a phandle to
> > the IOMMU. However, SMMU support for PCI will only be enabled if the
> > root complex has an iommus property, right? In that case, can't we
> > simply do something like this:
> >=20
> > 	if (dev_is_pci(dev))
> > 		np =3D find_host_bridge(dev)->of_node;
> > 	else
> > 		np =3D dev->of_node;
> >=20
> > ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> > sure that exists.
> >=20
> > Once we have that we can still iterate over the iommus property and do
> > not need to rely on this global variable.
>=20
> I agree that it'd work. But I was hoping to simplify the code
> here if it's possible. Looks like we have an argument on this
> so I will choose to go with your suggestion above for now.
>=20
> > > -		of_node_put(args.np);
> > > -		index++;
> > > -	}
> > > +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> > > +	if (IS_ERR(mc))
> > > +		return ERR_PTR(-EPROBE_DEFER);
> > > =20
> > > -	if (!smmu)
> > > +	/*
> > > +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
> > > +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
> > > +	 * call in again via of_iommu_configure when fwspec is prepared.
> > > +	 */
> > > +	if (!mc->smmu || !fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> > >  		return ERR_PTR(-ENODEV);
> > > =20
> > > -	return &smmu->iommu;
> > > +	dev_iommu_priv_set(dev, mc->smmu);
> > > +
> > > +	return &mc->smmu->iommu;
> > >  }
> > > =20
> > >  static void tegra_smmu_release_device(struct device *dev)
> > > @@ -1089,16 +1027,6 @@ struct tegra_smmu *tegra_smmu_probe(struct dev=
ice *dev,
> > >  	if (!smmu)
> > >  		return ERR_PTR(-ENOMEM);
> > > =20
> > > -	/*
> > > -	 * This is a bit of a hack. Ideally we'd want to simply return this
> > > -	 * value. However the IOMMU registration process will attempt to add
> > > -	 * all devices to the IOMMU when bus_set_iommu() is called. In order
> > > -	 * not to rely on global variables to track the IOMMU instance, we
> > > -	 * set it here so that it can be looked up from the .probe_device()
> > > -	 * callback via the IOMMU device's .drvdata field.
> > > -	 */
> > > -	mc->smmu =3D smmu;
> >=20
> > I don't think this is going to work. I distinctly remember putting this
> > here because we needed access to this before ->probe_device() had been
> > called for any of the devices.
>=20
> Do you remember which exact part of code needs to access mc->smmu
> before ->probe_device() is called?
>=20
> What I understood is that IOMMU core didn't allow ERR_PTR(-ENODEV)
> return value from ->probe_device(), previously ->add_device(), to
> carry on when you added this code/driver:
>     commit 8918465163171322c77a19d5258a95f56d89d2e4
>     Author: Thierry Reding <treding@nvidia.com>
>     Date:   Wed Apr 16 09:24:44 2014 +0200
>         memory: Add NVIDIA Tegra memory controller support
>=20
> ..until the core had a change one year later:
>     commit 38667f18900afe172a4fe44279b132b4140f920f
>     Author: Joerg Roedel <jroedel@suse.de>
>     Date:   Mon Jun 29 10:16:08 2015 +0200
>         iommu: Ignore -ENODEV errors from add_device call-back
>=20
> As my commit message of this change states, ->probe_device() will
> be called in from both bus_set_iommu() and really_probe() of each
> device through of_iommu_configure() -- the later one initializes
> an fwspec by polling the iommus property in the IOMMU core, same
> as what we do here in tegra-smmu. If this works, we can probably
> drop the hack here and get rid of tegra_smmu_configure().

Looking at this a bit more, I notice that tegra_smmu_configure() does a
lot of what's already done during of_iommu_configure(), so it'd indeed
be nice if we could somehow get rid of that. However, like I said, I do
recall that for DMA/IOMMU we need this prior to ->probe_device(), so it
isn't clear to me if we can do that.

So I think in order to make progress we need to check that dropping this
does indeed still work when we enable DMA/IOMMU (and the preliminary
patches to pass 1:1 mappings via reserved-memory regions). If so, I
think it should be safe to remove this.

Thierry

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91s3UACgkQ3SOs138+
s6FGFQ//UIutDswzxar109cdPM0Y0CGIzSx/3nUhqABe2YDtIjHTiWIPMI/1wD4C
eXi41rJdSOXjgA/Ic1rJamsHcdtDdT00zUTBDE43wZ9eM6Pr9Vw7eBCaTedxb3LC
9B/Ig3NWaVgDV4u05sN8rKX4v3iAMlimE4fgp1+K3UHpY2Q5z6RuQdvY3fzrU/Nt
gjy3m/PxxnAoeQgAsBwZa0PJb7aLZUvitKXMKgfrNBvo+U/G9xmEEICizvRKkiVz
S2nEx3gzdPsszwt2Y+FtcAJYbHx0sCnD9W27iC/QgIHumZPdgMrH3igU6/PoVWpj
njrvvpEwcyogkpCKWWRLb+zYRb4PEgCQrMJOe2xZ0/kx9TmYoyWzyZ5pSdFOhQwN
XexOut4jdf4m0A+HmSXJG8F0ZuoBbLhNUstTH6DkHRJZT/a7NFbQa1GB6GjSQ7zy
DlzcUZ+odZ0KwumbPykP1wMBc8Oob3ceNWyq+4fC0gQYdhrIQAUUqPWd34HaAhVe
rDSI1I1om25PZ9xZ+hlYrpuJDsUDXvwvcUiykyYRL7uIRYjmvjcFsyIt6K+4zmUG
oTmTRp+aBb8j+iuRCEL/UQPRyr0+aoguKqUVoflBnP3ftF0zhMwsL7RB+FZpYiRa
7+kANHJJ38g4scfV02E3oiWQQVlg2JbJEAENNKLdTDYkay58IjU=
=ACdI
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
