Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2909B27FC9D
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Oct 2020 11:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731747AbgJAJrR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Oct 2020 05:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAJrQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Oct 2020 05:47:16 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5418DC0613D0;
        Thu,  1 Oct 2020 02:47:16 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so7097375ejb.4;
        Thu, 01 Oct 2020 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gykynIitEaXJG3cyYb62xJ1HXKqglX6HJKQ54gJCbHY=;
        b=n6AMI//ZYzURVN587XgWTs+NS6JY5XOmfrv0Qj1SjOpBqdQGWrKix/L60+k+TwojEj
         azucQH17Q2MZ9DUuUpPZxTbRWRqFHU1lK8ogC/8RZex6ECl8uOkF7ctmmbQKgvyqPvzi
         sqDUS4bWm4zaqUIEBQgUan2AqkkjM973TUPC8c9SUFdfpHWF7hgKE8gIxp/ZJ691gOc1
         revaWmz1b85wqlLpNobae4C9i4FcNS05e4Jtg3uijeYUcoS7KEh0RryHABEPexJfTbn1
         ATjSfhx1B0w5Atzo2GvrmvRQhmWJNJNknIQMkvVolu+fX1+lWx0JePands0AMHraWVBn
         +sPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gykynIitEaXJG3cyYb62xJ1HXKqglX6HJKQ54gJCbHY=;
        b=JFxhK55w3Pv4c/f/Z7Rd8VKPBCtpUZrHJfzCJ96loQXHUMG4mv9UJ3S4IVEW+QCjA0
         O7jMjahp6LbyR0kQHbmohbVjY5sKpjwkkW8Nm6k04xmbIGBz687ljI6hyL8N07JP7a9d
         V7sll1xYbQ+NWWMwytLqJle2CO53Wkc5dQnECwS61fdWlzLia1Fpqs0ajl4ZHGsF4GnF
         H0VS3jjnXd9a0U/b+hkJJ5Mp1uyobw2kPQpQhSU7l4CjcBt+oe1t1IUNrq9pevGjzKQ3
         8evFZJ0RF5dE2Pf4+J35t8TjivB5Nm3qbRYwgK6xnOT9tFdHrgGmboXmPMyMvKc73m92
         eWyg==
X-Gm-Message-State: AOAM530AxPeTG9x+Bsw4LeocjbMIMiLuN/3aG6Ld126J73dFA3OJWbAG
        fWJOilXnJTn1EvLwCbFW40U=
X-Google-Smtp-Source: ABdhPJzq5dWO8E0Bl4iG9rjFRf6nA0DcXFr/TdGlTYr8TOMd6ljJjs+tnEcTXFVo+mxL7yIYgOZnNA==
X-Received: by 2002:a17:906:cf9d:: with SMTP id um29mr7060504ejb.74.1601545634924;
        Thu, 01 Oct 2020 02:47:14 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id v17sm3712617ejj.55.2020.10.01.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:47:13 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:47:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20201001094712.GC3919720@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <20200930203618.GC2110@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline
In-Reply-To: <20200930203618.GC2110@Asurada-Nvidia>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--w7PDEPdKQumQfZlR
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

I think this may have been important primarily for DMA/IOMMU integration
and may not currently exhibit because we don't enable that yet.

Thierry

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl91pZ0ACgkQ3SOs138+
s6GNTQ/+NkhK7Yibt6Oym5E+J5NgLQUZlYmYY6j9jGoU93ZPrhqSVdslCbVabWlN
sxxf199yP1PlBA6Juqa1QXJVjqpWuJSRWfHypduaRJhyuBLYuv6qy6xUSuBvece8
FEvyOiIaeha3h5goVNnhyAL9I3LPwm+mBcDVNjGHNA/WlNQjaOTlVs5Envvz4E0T
WrA0usr+HYF6KiXcaA34qMQuHKLCuQf+fbM1lkjbRtUSD5Bocwaz4qdl62mDqOcK
qGcEX13IsYTqCgmmsdRpObmp0A+z264OMk4goz2k+rJif/w4V2vxBJ+c5+TUfadQ
UnA8fQ3IeUQlGfNCsg1pja6qNzigPqbjWPKhacDrDUnOVx0dO3PUyJ0rdo0iBUdR
UtS6YkeYKiOtwhCfz5qpoiOgJfQM1+88CvlmVDSe+SFcPg+0ZPNGmrM1FdXjrxly
1lc23QJ2L7/6IzhiTf3ags6S0XdY9ayz3OsBffWlGHFRtdx2S8O8eftUcvgqmSlg
3XVwTg6xBDhq8jPAyly732Wftt+tHw6BYLZgZEgy/H1XoOfmQbfLpINSSV+MblYi
rs4ZNHA1russ7OFd6IBZOBpwIaiZVivB8uvULnj7P2NuQR49UMpvQu5ngcftSn9a
Pj9sO+11LCLf9I0x6Vsun1CY+7OWWCwyjyswk7llXBxIjMpjEeA=
=SuLd
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--
