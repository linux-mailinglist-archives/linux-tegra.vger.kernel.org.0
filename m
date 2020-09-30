Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FE627ED05
	for <lists+linux-tegra@lfdr.de>; Wed, 30 Sep 2020 17:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgI3Pbj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Sep 2020 11:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3Pbi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 11:31:38 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B68C061755;
        Wed, 30 Sep 2020 08:31:35 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id u21so3471014eja.2;
        Wed, 30 Sep 2020 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GQ+QciihMmxst/0zRv51AWM5s8LUs2MsZl6VvL+SYew=;
        b=l/k1LR8TC1z0fC5fy2fy08r63R7eGpR3i1LrTcGYD/JujjpDS47TRdxX5M4l1lzPY4
         Sorp/3LaoevnyxeRBoKxaLwa/W/GgtwF1vi+kE5lI1kUOAqzV7TeepINGKN/ORl0wppL
         elKrH2QH96btK5rqSqUnSEIfD+kUoIgNv/REQo80OfkGgBcC/BDQ1/K4xjhsX2BAnsca
         hF0hBmZPaz7U2kd/f04Ig5aKA2iZixGtjuh76g9xlfjXNjnEFy13YCQq+ypuAhmrIqrM
         IJcZRhaKKMLNtX1Hiw+Xf70XilefX1hJLHY+zPk9/C3YWwqpsR3jSmiu89zFFAumc3to
         ynyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GQ+QciihMmxst/0zRv51AWM5s8LUs2MsZl6VvL+SYew=;
        b=Fjg+HmtV+k7A2xjaHFX6BWUBFPSGlwb9Zk0f27KqJ2WbguG7aPCdbnTyD5jgWJSjhd
         4SgwlcTQQVzJMCCVqCMrZagrvmaND3vL5aZ0iMOr7Cgw1NzvFyiJbQTQu1snmHX3/NaD
         Q7+NE82vEtzEZlAOln3M5l2gzFoxi800ELMZc2RJg97S6vhAn1F2dD1TidaqTgj4XTF/
         8VVSVzbfF+FwMKUfOQIi6EmvUdW/UF3A7BbqnkbJOZty0+tPALgUrYjbeNsjJflj73a7
         Lee1M8L7FA+dwDtsrkn5enSzWppJo6yb6G8B7Q4HVSkC3+AauyGWYrwk9VRoYVIoLtLy
         OIYA==
X-Gm-Message-State: AOAM533C5oNJKDoaVN3FLcMMoIA6MtBN1k3BUvYpZlQgXelwsmkQ4ZU0
        fNhz6NWwTYAEWjT3Oe+bU7c=
X-Google-Smtp-Source: ABdhPJz/A7wNImE0eB1aa4tmPvsTghk9VoJMMbhBz8FvSzSuJxmPq8kOu4GYGFhDPidJ2RALp8Pk8Q==
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr3390476eje.210.1601479894477;
        Wed, 30 Sep 2020 08:31:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id e4sm1827755edk.38.2020.09.30.08.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:31:33 -0700 (PDT)
Date:   Wed, 30 Sep 2020 17:31:31 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, krzk@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930153131.GB3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <20200930084258.25493-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 01:42:57AM -0700, Nicolin Chen wrote:
> Previously the driver relies on bus_set_iommu() in .probe() to call
> in .probe_device() function so each client can poll iommus property
> in DTB to configure fwspec via tegra_smmu_configure(). According to
> the comments in .probe(), this is a bit of a hack. And this doesn't
> work for a client that doesn't exist in DTB, PCI device for example.
>=20
> Actually when a device/client gets probed, the of_iommu_configure()
> will call in .probe_device() function again, with a prepared fwspec
> from of_iommu_configure() that reads the SWGROUP id in DTB as we do
> in tegra-smmu driver.
>=20
> Additionally, as a new helper devm_tegra_get_memory_controller() is
> introduced, there's no need to poll the iommus property in order to
> get mc->smmu pointers or SWGROUP id.
>=20
> This patch reworks .probe_device() and .attach_dev() by doing:
> 1) Using fwspec to get swgroup id in .attach_dev/.dettach_dev()
> 2) Removing DT polling code, tegra_smmu_find/tegra_smmu_configure()
> 3) Calling devm_tegra_get_memory_controller() in .probe_device()
> 4) Also dropping the hack in .probe() that's no longer needed.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v2->v3
>  * Used devm_tegra_get_memory_controller() to get mc pointer
>  * Replaced IS_ERR_OR_NULL with IS_ERR in .probe_device()
> v1->v2
>  * Replaced in .probe_device() tegra_smmu_find/tegra_smmu_configure()
>    with tegra_get_memory_controller call.
>  * Dropped the hack in tegra_smmu_probe().
>=20
>  drivers/iommu/tegra-smmu.c | 144 ++++++++++---------------------------
>  1 file changed, 36 insertions(+), 108 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 6a3ecc334481..636dc3b89545 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -61,6 +61,8 @@ struct tegra_smmu_as {
>  	u32 attr;
>  };
> =20
> +static const struct iommu_ops tegra_smmu_ops;
> +
>  static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
>  {
>  	return container_of(dom, struct tegra_smmu_as, domain);
> @@ -484,60 +486,50 @@ static void tegra_smmu_as_unprepare(struct tegra_sm=
mu *smmu,
>  static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>  				 struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu *smmu =3D dev_iommu_priv_get(dev);
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> -	struct device_node *np =3D dev->of_node;
> -	struct of_phandle_args args;
>  	unsigned int index =3D 0;
>  	int err =3D 0;
> =20
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup =3D args.args[0];
> -
> -		if (args.np !=3D smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> -
> -		of_node_put(args.np);
> +	if (!fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> +		return -ENOENT;
> =20
> +	for (index =3D 0; index < fwspec->num_ids; index++) {
>  		err =3D tegra_smmu_as_prepare(smmu, as);
> -		if (err < 0)
> -			return err;
> +		if (err)
> +			goto disable;
> =20
> -		tegra_smmu_enable(smmu, swgroup, as->id);
> -		index++;
> +		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
>  	}
> =20
>  	if (index =3D=3D 0)
>  		return -ENODEV;
> =20
>  	return 0;
> +
> +disable:
> +	while (index--) {
> +		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
> +		tegra_smmu_as_unprepare(smmu, as);
> +	}
> +
> +	return err;
>  }
> =20
>  static void tegra_smmu_detach_dev(struct iommu_domain *domain, struct de=
vice *dev)
>  {
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>  	struct tegra_smmu_as *as =3D to_smmu_as(domain);
> -	struct device_node *np =3D dev->of_node;
>  	struct tegra_smmu *smmu =3D as->smmu;
> -	struct of_phandle_args args;
>  	unsigned int index =3D 0;
> =20
> -	while (!of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					   &args)) {
> -		unsigned int swgroup =3D args.args[0];
> -
> -		if (args.np !=3D smmu->dev->of_node) {
> -			of_node_put(args.np);
> -			continue;
> -		}
> -
> -		of_node_put(args.np);
> +	if (!fwspec || fwspec->ops !=3D &tegra_smmu_ops)
> +		return;
> =20
> -		tegra_smmu_disable(smmu, swgroup, as->id);
> +	for (index =3D 0; index < fwspec->num_ids; index++) {
> +		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
>  		tegra_smmu_as_unprepare(smmu, as);
> -		index++;
>  	}
>  }
> =20
> @@ -807,80 +799,26 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct i=
ommu_domain *domain,
>  	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
>  }
> =20
> -static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
> -{
> -	struct platform_device *pdev;
> -	struct tegra_mc *mc;
> -
> -	pdev =3D of_find_device_by_node(np);
> -	if (!pdev)
> -		return NULL;
> -
> -	mc =3D platform_get_drvdata(pdev);
> -	if (!mc)
> -		return NULL;
> -
> -	return mc->smmu;
> -}
> -
> -static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *=
dev,
> -				struct of_phandle_args *args)
> -{
> -	const struct iommu_ops *ops =3D smmu->iommu.ops;
> -	int err;
> -
> -	err =3D iommu_fwspec_init(dev, &dev->of_node->fwnode, ops);
> -	if (err < 0) {
> -		dev_err(dev, "failed to initialize fwspec: %d\n", err);
> -		return err;
> -	}
> -
> -	err =3D ops->of_xlate(dev, args);
> -	if (err < 0) {
> -		dev_err(dev, "failed to parse SW group ID: %d\n", err);
> -		iommu_fwspec_free(dev);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
>  static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
>  {
> -	struct device_node *np =3D dev->of_node;
> -	struct tegra_smmu *smmu =3D NULL;
> -	struct of_phandle_args args;
> -	unsigned int index =3D 0;
> -	int err;
> -
> -	while (of_parse_phandle_with_args(np, "iommus", "#iommu-cells", index,
> -					  &args) =3D=3D 0) {
> -		smmu =3D tegra_smmu_find(args.np);
> -		if (smmu) {
> -			err =3D tegra_smmu_configure(smmu, dev, &args);
> -			of_node_put(args.np);
> -
> -			if (err < 0)
> -				return ERR_PTR(err);
> -
> -			/*
> -			 * Only a single IOMMU master interface is currently
> -			 * supported by the Linux kernel, so abort after the
> -			 * first match.
> -			 */
> -			dev_iommu_priv_set(dev, smmu);
> -
> -			break;
> -		}
> +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);

It looks to me like the only reason why you need this new global API is
because PCI devices may not have a device tree node with a phandle to
the IOMMU. However, SMMU support for PCI will only be enabled if the
root complex has an iommus property, right? In that case, can't we
simply do something like this:

	if (dev_is_pci(dev))
		np =3D find_host_bridge(dev)->of_node;
	else
		np =3D dev->of_node;

? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
sure that exists.

Once we have that we can still iterate over the iommus property and do
not need to rely on this global variable.

> -		of_node_put(args.np);
> -		index++;
> -	}
> +	/* An invalid mc pointer means mc and smmu drivers are not ready */
> +	if (IS_ERR(mc))
> +		return ERR_PTR(-EPROBE_DEFER);
> =20
> -	if (!smmu)
> +	/*
> +	 * IOMMU core allows -ENODEV return to carry on. So bypass any call
> +	 * from bus_set_iommu() during tegra_smmu_probe(), as a device will
> +	 * call in again via of_iommu_configure when fwspec is prepared.
> +	 */
> +	if (!mc->smmu || !fwspec || fwspec->ops !=3D &tegra_smmu_ops)
>  		return ERR_PTR(-ENODEV);
> =20
> -	return &smmu->iommu;
> +	dev_iommu_priv_set(dev, mc->smmu);
> +
> +	return &mc->smmu->iommu;
>  }
> =20
>  static void tegra_smmu_release_device(struct device *dev)
> @@ -1089,16 +1027,6 @@ struct tegra_smmu *tegra_smmu_probe(struct device =
*dev,
>  	if (!smmu)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	/*
> -	 * This is a bit of a hack. Ideally we'd want to simply return this
> -	 * value. However the IOMMU registration process will attempt to add
> -	 * all devices to the IOMMU when bus_set_iommu() is called. In order
> -	 * not to rely on global variables to track the IOMMU instance, we
> -	 * set it here so that it can be looked up from the .probe_device()
> -	 * callback via the IOMMU device's .drvdata field.
> -	 */
> -	mc->smmu =3D smmu;

I don't think this is going to work. I distinctly remember putting this
here because we needed access to this before ->probe_device() had been
called for any of the devices.

Thierry

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90pNMACgkQ3SOs138+
s6G7QA//XGftMbLm6fRUKoKS/Cmf6fM3+TAW+NS8MyjN5o1E1LEY9a8Gyzm5W0cu
ywcAkD+hjyCrhnmzVidi3oi1bxBhRgtUq3Zcye3eH42osro0O4PU6A+8s2zIYp7R
tdQcRNSaNcx1uw5RRn4znzhuNWxHwAGDtI6H0KkGe6eagfxAFV2kkc+5PqkZQFRT
fmLgPUa6Tt8jI+RkoeOvnu0s1iF1tCE76NYuM3GrW8sOopl9BARntPP9fTjRLvss
JJXuHrchrF4uhJPYrBxgbMFZZFBVsvbncf7kXqqnK0QWMAuNDWrLD+5upbtXtifG
sKzrTpRfHkVyWHLmYigvdYBl2yafyDM3a0aPslKwob/+rA8UGmjJ/IuS28Bjb8eh
MVncdJO9a+cue0tUjW9jk3jF0p+FnAOa/7cYKN6q4CJ+sEgOLGmNdtHEKOiiPsVE
WdA0gMmiSsRBMA8E3aZzqHx74WSXWLzjc+FRIsZnFG8AqK51O7AkG2hlciJu5Q8S
UuM6Sd/Q4CRmb/gK8wxLz3zQxwTooqsxTMHf/CF2ase8z/PeED6DE3N3/Ec3IHTs
pXD4g7r6yVG5UF+zdCpiZPP7etxIG0OfVVQpOaOsND3mkCs2MkqFc55eIUGe/HYH
EpmTMcTkpty+UDUcdjfWB80e4eMD4DQZ9/pjkSjLbg45/AgsKdk=
=9hqH
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
