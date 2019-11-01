Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7832AEC132
	for <lists+linux-tegra@lfdr.de>; Fri,  1 Nov 2019 11:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfKAKSQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 1 Nov 2019 06:18:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45270 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbfKAKSQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Nov 2019 06:18:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id q13so9153215wrs.12
        for <linux-tegra@vger.kernel.org>; Fri, 01 Nov 2019 03:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QYNQCAi7RCU4YBmIpF6zRvj+ImC2sDJS9xLhmCVTatA=;
        b=N9IXFsvxPEz3D2y+pGAtvFbc2xLWvn8McM8HYBT0mx9KwEq6NemJDIXmZ3atyU2rF1
         yd8s+LcDTh3lEDtPWtBP3+U9RzzFftaoB7xsjM8RpPhFhLN32QgVLbVAdVq1rLIRlKeU
         YgyOXXB1yPe7DmN/fPgmKuFvDj/t338PEI12usLJtPkxJ0CAH+YRWEuCWDrajXpMi92U
         IWvIPT+qd7eC86SbKzpHsT14jkMgB6nVcXrF5vE3v4U0MmH4rjg99A3zNye0Lom3NuJe
         xO2hFmPMH5tafBiDqqC8NC81Kd7IxV11lF8Z33XouCbP6s20YgasvmpF6/RGgUeDqiGY
         I48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QYNQCAi7RCU4YBmIpF6zRvj+ImC2sDJS9xLhmCVTatA=;
        b=cQba8rSchoI0Ly6MQi7IVH3Yp6tJOZBUmKmwGWw8qpMbjQNwNRUrNXZnN9PZIXqcqE
         QNpUhVaYkKWhQDRjIkXz5igQ8ZFNVwwKNdNQ1Do1O3ciRgkslUY45X02JszUWiy/+0+h
         Uyozt17FYdi1k9dJUCmhyyca3y/ZIdoo0JR9mQAH5ZHAzeZZnXJQcs4vtMEmCd17tDGB
         UcCZHQC3xnQ9u+l9f/BeDWivKL9UQWuBuC/C8jD1HkmgaKZTZG11lNzvs59RCbeNNS1y
         HnGpo+2pmQj3whclzgf4ZNnaqKqMLZdgEeYQRJvAV7c9AOj7ee3CA8YxcePohyoR2enD
         Knqg==
X-Gm-Message-State: APjAAAW3ERyK1LyoDKgn5yXiyrQJCiADh6rVSUELktrnDTKv0IibaXoR
        orBEvCdCinXfLHtkRzbw1wI=
X-Google-Smtp-Source: APXvYqxps4RAov54+1V9d0EnsU1tnp0Y90irPlQXBWVP2AF5sI4ximQ8154FiTW+Ize+W8yh9DSlsg==
X-Received: by 2002:adf:9799:: with SMTP id s25mr10009207wrb.390.1572603492570;
        Fri, 01 Nov 2019 03:18:12 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q15sm7026777wrr.82.2019.11.01.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 03:18:05 -0700 (PDT)
Date:   Fri, 1 Nov 2019 11:18:04 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/3] memory: Introduce memory controller mini-framework
Message-ID: <20191101101804.GD1167505@ulmo>
References: <20191015162945.1203736-1-thierry.reding@gmail.com>
 <20191015162945.1203736-2-thierry.reding@gmail.com>
 <0888ea6f-2092-001e-5663-3a1d3f305ba4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline
In-Reply-To: <0888ea6f-2092-001e-5663-3a1d3f305ba4@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bajzpZikUji1w+G9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 06:11:33PM +0300, Dmitry Osipenko wrote:
> 15.10.2019 19:29, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This new framework is currently nothing more than a registry of memory
> > controllers, with the goal being to order device probing. One use-case
> > where this is useful, for example, is a memory controller device which
> > needs to program some registers before the system MMU can be enabled.
> > Associating the memory controller with the SMMU allows the SMMU driver
> > to defer the probe until the memory controller has been registered.
> >=20
> > One such example is Tegra186 where the memory controller contains some
> > registers that are used to program stream IDs for the various memory
> > clients (display, USB, PCI, ...) in the system. Programming these SIDs
> > is required for the memory clients to emit the proper SIDs as part of
> > their memory requests. The memory controller driver therefore needs to
> > be programmed prior to the SMMU driver. To achieve that, the memory
> > controller will be referenced via phandle from the SMMU device tree
> > node, the SMMU driver can then use the memory controller framework to
> > find it and defer probe until it has been registered.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/memory/Makefile           |  1 +
> >  drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
> >  include/linux/memory-controller.h | 25 ++++++++
> >  3 files changed, 125 insertions(+)
> >  create mode 100644 drivers/memory/core.c
> >  create mode 100644 include/linux/memory-controller.h
>=20
> Hello Thierry,
>=20
> This looks like a very good endeavour! I have couple comments, please
> see them below.
>=20
> > diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> > index 27b493435e61..d16e7dca8ef9 100644
> > --- a/drivers/memory/Makefile
> > +++ b/drivers/memory/Makefile
> > @@ -3,6 +3,7 @@
> >  # Makefile for memory devices
> >  #
> > =20
> > +obj-y				+=3D core.o
> >  obj-$(CONFIG_DDR)		+=3D jedec_ddr_data.o
> >  ifeq ($(CONFIG_DDR),y)
> >  obj-$(CONFIG_OF)		+=3D of_memory.o
> > diff --git a/drivers/memory/core.c b/drivers/memory/core.c
> > new file mode 100644
> > index 000000000000..1772e839305a
> > --- /dev/null
> > +++ b/drivers/memory/core.c
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019 NVIDIA Corporation.
> > + */
> > +
> > +#include <linux/memory-controller.h>
> > +#include <linux/of.h>
> > +
> > +static DEFINE_MUTEX(controllers_lock);
> > +static LIST_HEAD(controllers);
> > +
> > +static void memory_controller_release(struct kref *ref)
> > +{
> > +	struct memory_controller *mc =3D container_of(ref, struct memory_cont=
roller, ref);
> > +
> > +	WARN_ON(!list_empty(&mc->list));
> > +}
> > +
> > +int memory_controller_register(struct memory_controller *mc)
> > +{
> > +	kref_init(&mc->ref);
> > +
> > +	mutex_lock(&controllers_lock);
> > +	list_add_tail(&mc->list, &controllers);
> > +	mutex_unlock(&controllers_lock);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_register);
> > +
> > +void memory_controller_unregister(struct memory_controller *mc)
> > +{
> > +	mutex_lock(&controllers_lock);
> > +	list_del_init(&mc->list);
> > +	mutex_unlock(&controllers_lock);
> > +
> > +	kref_put(&mc->ref, memory_controller_release);
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_unregister);
> > +
> > +static struct memory_controller *
> > +of_memory_controller_get(struct device *dev, struct device_node *np,
> > +			 const char *con_id)
> > +{
> > +	const char *cells =3D "#memory-controller-cells";
> > +	const char *names =3D "memory-controller-names";
> > +	const char *prop =3D "memory-controllers";
> > +	struct memory_controller *mc;
> > +	struct of_phandle_args args;
> > +	int index =3D 0, err;
> > +
> > +	if (con_id) {
> > +		index =3D of_property_match_string(np, names, con_id);
> > +		if (index < 0)
> > +			return ERR_PTR(index);
> > +	}
> > +
> > +	err =3D of_parse_phandle_with_args(np, prop, cells, index, &args);
> > +	if (err) {
> > +		if (err =3D=3D -ENOENT)
> > +			err =3D -ENODEV;
> > +
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	mutex_lock(&controllers_lock);
> > +
> > +	list_for_each_entry(mc, &controllers, list) {
> > +		if (mc->dev && mc->dev->of_node =3D=3D args.np) {
> > +			kref_get(&mc->ref);
>=20
> This is not enough because memory controller driver could be a loadable
> module, thus something like this is needed here:
>=20
> 	__module_get(mc->dev->driver->owner);
>=20
> This won't allow MC driver to be unloaded while it has active users.

Good catch. I've added that (and the module_put() from below) to the
patch.

> > +			mutex_unlock(&controllers_lock);
> > +			goto unlock;
> > +		}
> > +	}
> > +
> > +	mc =3D ERR_PTR(-EPROBE_DEFER);
> > +
> > +unlock:
> > +	mutex_unlock(&controllers_lock);
> > +	of_node_put(args.np);
> > +	return mc;
> > +}
> > +
> > +struct memory_controller *
> > +memory_controller_get(struct device *dev, const char *con_id)
> > +{
> > +	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
> > +		return of_memory_controller_get(dev, dev->of_node, con_id);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_get);
>=20
> In most cases memory controllers are unique in a system, so it looks to
> me that it will be more universal to have ability to get MC by its
> device-tree compatible name. Like this:
>=20
> 	of_memory_controller_get_by_compatible(const char *compatible);
>=20
> This will allow current drivers (like Tegra20 devfreq driver for
> example) to utilize this new API without having trouble of maintaining
> backwards compatibility with older device-trees that do not have a
> phandle to MC.
>=20
> https://elixir.bootlin.com/linux/v5.4-rc5/source/drivers/devfreq/tegra20-=
devfreq.c#L100
>=20
> Of course there could be cases where there are multiple controllers with
> the same compatible, but that case could be supported later on by those
> who really need it. I don't think that any of NVIDIA Tegra SoCs fall
> into that category.

This has the slight disadvantage that we would have to iterate over a
number of compatible strings in case we want to transparently support
more than a single version of the memory controller.

An alternative, which is used by a number of other resource registry
APIs, would be to work with lookup tables. Basically those would make
a mapping between a provider and a device/consumer pair. The result
would look something like this:

	struct memory_controller_lookup {
		const char *provider;
		const char *dev_id;
		const char *con_id;
	};

	static const struct memory_controller_lookup *tegra124_mc_lookup[] =3D {
		{ "70019000.memory-controller", "6000c800.actmon", NULL },
	};

memory_controller_get() could then use that as a last-resort to find a
reference to a memory controller if a device tree phandle isn't
available.

On the other hand it should be fairly easy to conditionalize all the
code based purely on the availability of a phandle:

	mc =3D memory_controller_get(dev, NULL);
	if (IS_ERR(mc)) {
		if (mc !=3D ERR_PTR(-ENODEV))
			return PTR_ERR(mc);

		mc =3D NULL;
	}

	...

	if (mc) {
		...
	}

The above could be simplified by wrapping the logic in a helper that can
be used if consumers can work without: memory_controller_get_optional().

Thierry

> > +void memory_controller_put(struct memory_controller *mc)
> > +{
> > +	if (mc)
> > +		kref_put(&mc->ref, memory_controller_release);
> 		module_put(mc->dev->driver->owner);
>=20
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_put);
>=20
>=20
> [snip]

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl28BlkACgkQ3SOs138+
s6G4ZhAAknYbvDUjTAgtBGPOCaQd7sE4Ca0QtwlRWUxP73bLuSgyvQ828QanYf/7
g5PH71qc4ApxPIMKnJxmi6fjE2wYZrAqXcEVKSRp86BTRAtgbeixe1ppSorYq8HW
4PYU9DZBgGBZMPGty6RWGd32A7rd/MsPi0K7U4qaIwpVIZ2LscjQTqYY/J+l7b6l
v6BlFH2LvhOenktBRdLcwp93NvPUTYa4RZCZ/9sn19QOBHkBiPzeyc/kBIaWtYXt
tjGqimDiKIB4NqKdgf9xlJcjfE+9oX8BB5/ZnsZYSYmVRFP/7HaejAwgv3JmSc6M
Gj7H0x8uTKeDkdbBIfJWzxGYBCf9bGoNPB7BhLJr/5pMG3ByBQ6tj/adfnD6GkGx
/R0pFqcmry+cPhyCsVK09ajQTO6P3bAIx0lDfrwDg22I86oswHYMfxoN6OlXzD+c
t1Ayy92zxryTnKH20HE2X4PfxWY15ZStJV08w+pYz8q+J0rjUeDBCuu4t6zzSrgE
y/p18BsWGO6UhkhpkX387eJaE4INRiBVmI5jLbNj06qj0hY1ZKuvRe6mZdWPmcT2
Z2/XQLKF9Je2hyREHvmvi9z1CnDlDoSaRckFp/fVpt1duf72zo7od8D75aF7YTIN
ii1+E7faGAT5+4viocyfiPAeciv9rVosXj3XZOR0cVv9YaXsZz8=
=wopy
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
