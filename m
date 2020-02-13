Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C90C615C9FF
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Feb 2020 19:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgBMSKg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Feb 2020 13:10:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34109 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbgBMSKg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Feb 2020 13:10:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id n10so5922226wrm.1;
        Thu, 13 Feb 2020 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bDVNuolBkjv+p1AhHxh1W/MOMNiNj9nA6rK0kUcVqcI=;
        b=oTrUC8U8EUO3Bm7HzhBIc3cxXYr0kgAGBCALmItqa744KZ48XoVNqNowp2hI8x3dXq
         BTDVDsoCurz04rlRFv9+0T3VYj5aANC916+fynF09Wmxm7J5PJmvbYoHGCI6CYX3313w
         R82Q2M7SwRH7yvBq+fd+IdEOqI6grWVwmpdv32uxYB/BlZ3ZfmuVyr1dPL4RJpTEXOYz
         9BxjAMz9xcaBUDKMeVdsknG54IQVaubf5nCYYu9g68c23eILoo20UX13tMu6dFCuXxwu
         hc90M1fQiQ6x/Y/QIcplPX9ZaydrgTWhO1gXENNdDy5G4i0fxwn06Dd7UUOvMI+H90Ni
         n75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bDVNuolBkjv+p1AhHxh1W/MOMNiNj9nA6rK0kUcVqcI=;
        b=Mwz9vhq/qlSqsMLtEYNFJSC/ZW9Iejq8v0Z5FR/NT51ZVTS5UWd8CrRNZB/qDwOxr8
         3W7vLrXdLOFl4nqzov7Uejui3twtzKYBTKZBIlutRZTJCrCLrtmI2jQvP6KoGwecheIN
         IqilxuyfuTPTwko73NHj/IWBCZV9nZBlHq03MP2hg8/lOc7vNko+t6W7pJpzgFOYJeqq
         tbnQZFxrL+x6Rk9qZMFNo+sxNNtmSNGMpSdxAtqdiEvoyZp9aiijF3wlBe/FfyoiKgeA
         b+HqJZqOm4iZfvGsZaD7DG+5MxTod0UjJdeg9ABLYvi/XmcGa7csnzElV/ktfHU47OFB
         OUgQ==
X-Gm-Message-State: APjAAAWectOb87zzFiOAy3LaTWJIcqrKB3EAq4DQHtJt8nvtrBbPxqQF
        OTAUSKsSKFdoZy6D77QG3kA=
X-Google-Smtp-Source: APXvYqzcbisb26mJM2Ua2B4vqeqfNOnBNzpCFYZ5yZfmyHROKcICKNBNWe1YTwzobvnBgiDkVt2ElA==
X-Received: by 2002:a05:6000:1012:: with SMTP id a18mr22559448wrx.113.1581617432121;
        Thu, 13 Feb 2020 10:10:32 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id g2sm3864937wrw.76.2020.02.13.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 10:10:30 -0800 (PST)
Date:   Thu, 13 Feb 2020 19:10:29 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] memory: Introduce memory controller mini-framework
Message-ID: <20200213181029.GA1006063@ulmo>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
 <20200213163959.819733-4-thierry.reding@gmail.com>
 <25442f94-1401-d3f1-6c06-2cba43f513d1@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <25442f94-1401-d3f1-6c06-2cba43f513d1@arm.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 05:03:10PM +0000, Robin Murphy wrote:
> On 13/02/2020 4:39 pm, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This new framework is currently nothing more than a registry of memory
> > controllers, with the goal being to order device probing. One use-case
> > where this is useful, for example, is a memory controller device which
> > needs to program some registers before the system MMU can be enabled.
> > Associating the memory controller with the SMMU allows the SMMU driver
> > to defer the probe until the memory controller has been registered.
>=20
> I'm doubtful of how generic an argument that really is - does anyone other
> than Tegra actually do this? (Most things I know of with programmable Str=
eam
> IDs at least have the good grace to configure them in the bootloader or t=
he
> devices' own drivers)

I'm not aware of any of the bootloaders doing anything with the SMMU, so
adding only the stream ID programming seems a little useless. Since it's
only at the kernel level that the SMMU will end up being used, it seems
natural to define the stream ID mapping there as well.

With regards to the devices' own drivers, they get probed way too late
for this to take any effect. If the DMA API is backed by an IOMMU, the
stream ID mappings will be required long before drivers actually take
control of their devices.

> If the underlying aim is just "make SMMUs on Tegras wait for an extra
> thing", I'd suggest simply wiring up the existing tegra_mc APIs in your
> arm-smmu-nvidia.c hooks. (hmm, what did happen to those patches?)

Passing around global symbols seems like a bit of a hack, whereas
encoding this in device tree actually gives us a way of properly
describing this relationship.

That said, I could look at moving the memory controller lookup code into
the Tegra-specific ARM SMMU implementation if it's not something that's
more broadly useful.

The NVIDIA implementation is currently blocked on two things. On one
hand we can't enable the SMMU before we have this series in place to
make sure that it starts up with the correct stream ID mapping. The
other blocker currently is that memory clients can access 40 bits of
addresses, but bit 39 has special meaning, so there's a bit more glue
that we need in device tree (via the DMA parent) to properly describe
the DMA ranges for these devices. Otherwise the IOMMU will hand out
IOVAs with bit 39 set (DMA API allocates from the top) and that causes
memory accesses to be jumbled in undesirable ways.

If I move the memory lookup code into the NVIDIA ARM SMMU implementation
it would probably easiest to integrate all of it into a single series.

Thierry

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
> > Changes in v3:
> > - add device-managed variants of the consumer APIs
> > - add kerneldoc
> >=20
> > Changes in v2:
> > - fix double unlock (Dan Carpenter, kbuild test robot)
> > - add helper to get optional memory controllers
> > - acquire and release module reference
> >=20
> >   drivers/memory/Makefile           |   1 +
> >   drivers/memory/core.c             | 248 ++++++++++++++++++++++++++++++
> >   include/linux/memory-controller.h |  34 ++++
> >   3 files changed, 283 insertions(+)
> >   create mode 100644 drivers/memory/core.c
> >   create mode 100644 include/linux/memory-controller.h
> >=20
> > diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> > index 27b493435e61..d16e7dca8ef9 100644
> > --- a/drivers/memory/Makefile
> > +++ b/drivers/memory/Makefile
> > @@ -3,6 +3,7 @@
> >   # Makefile for memory devices
> >   #
> > +obj-y				+=3D core.o
> >   obj-$(CONFIG_DDR)		+=3D jedec_ddr_data.o
> >   ifeq ($(CONFIG_DDR),y)
> >   obj-$(CONFIG_OF)		+=3D of_memory.o
> > diff --git a/drivers/memory/core.c b/drivers/memory/core.c
> > new file mode 100644
> > index 000000000000..b2fbd2e808de
> > --- /dev/null
> > +++ b/drivers/memory/core.c
> > @@ -0,0 +1,248 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019-2020 NVIDIA Corporation.
> > + */
> > +
> > +#include <linux/memory-controller.h>
> > +#include <linux/module.h>
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
> > +/**
> > + * memory_controller_register() - register a memory controller
> > + * @mc: memory controller
> > + */
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
> > +/**
> > + * memory_controller_unregister() - unregister a memory controller
> > + * @mc: memory controller
> > + */
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
> > +			__module_get(mc->dev->driver->owner);
> > +			kref_get(&mc->ref);
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
> > +/**
> > + * memory_controller_get() - obtain a reference to a memory controller
> > + * @dev: consumer device
> > + * @con_id: consumer name
> > + *
> > + * Returns: A pointer to the requested memory controller or an ERR_PTR=
()-
> > + * encoded error code on failure.
> > + */
> > +struct memory_controller *
> > +memory_controller_get(struct device *dev, const char *con_id)
> > +{
> > +	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
> > +		return of_memory_controller_get(dev, dev->of_node, con_id);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_get);
> > +
> > +/**
> > + * memory_controller_get_optional() - obtain a reference to an optional
> > + *                                    memory controller
> > + * @dev: consumer device
> > + * @con_id: consumer name
> > + *
> > + * Returns: A pointer to the requested memory controller, NULL if no m=
emory
> > + * controller for the consumer device/name pair exists, or an ERR_PTR(=
)-
> > + * encoded error code on failure.
> > + */
> > +struct memory_controller *
> > +memory_controller_get_optional(struct device *dev, const char *con_id)
> > +{
> > +	struct memory_controller *mc;
> > +
> > +	mc =3D memory_controller_get(dev, con_id);
> > +	if (IS_ERR(mc)) {
> > +		if (mc =3D=3D ERR_PTR(-ENODEV))
> > +			return NULL;
> > +	}
> > +
> > +	return mc;
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_get_optional);
> > +
> > +/**
> > + * memory_controller_put() - release a reference to a memory controller
> > + * @mc: memory controller
> > + */
> > +void memory_controller_put(struct memory_controller *mc)
> > +{
> > +	if (mc) {
> > +		kref_put(&mc->ref, memory_controller_release);
> > +		module_put(mc->dev->driver->owner);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(memory_controller_put);
> > +
> > +static void devm_memory_controller_release(struct device *dev, void *r=
es)
> > +{
> > +	memory_controller_put(*(struct memory_controller **)res);
> > +}
> > +
> > +/**
> > + * devm_memory_controller_get() - obtain a reference to a memory contr=
oller
> > + * @dev: consumer device
> > + * @con_id: consumer name
> > + *
> > + * This is a device-managed variant of memory_controller_get(). The me=
mory
> > + * controller reference obtained with this function is automatically r=
eleased
> > + * when the device is unbound from its driver.
> > + *
> > + * Returns: A pointer to the requested memory controller or an ERR_PTR=
()-
> > + * encoded error code on failure.
> > + */
> > +struct memory_controller *devm_memory_controller_get(struct device *de=
v,
> > +						     const char *con_id)
> > +{
> > +	struct memory_controller **ptr, *mc;
> > +
> > +	ptr =3D devres_alloc(devm_memory_controller_release, sizeof(*ptr),
> > +			   GFP_KERNEL);
> > +	if (!ptr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	mc =3D memory_controller_get(dev, con_id);
> > +	if (!IS_ERR(mc)) {
> > +		*ptr =3D mc;
> > +		devres_add(dev, ptr);
> > +	} else {
> > +		devres_free(ptr);
> > +	}
> > +
> > +	return mc;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_memory_controller_get);
> > +
> > +/**
> > + * memory_controller_get_optional() - obtain a reference to an optional
> > + *                                    memory controller
> > + * @dev: consumer device
> > + * @con_id: consumer name
> > + *
> > + * This is a device-managed variant of memory_controller_get_optional(=
). The
> > + * memory controller reference obtained with this function is automati=
cally
> > + * released when the device is unbound from its driver.
> > + *
> > + * Returns: A pointer to the requested memory controller, NULL if no m=
emory
> > + * controller for the consumer device/name pair exists, or an ERR_PTR(=
)-
> > + * encoded error code on failure.
> > + */
> > +struct memory_controller *
> > +devm_memory_controller_get_optional(struct device *dev, const char *co=
n_id)
> > +{
> > +	struct memory_controller **ptr, *mc;
> > +
> > +	ptr =3D devres_alloc(devm_memory_controller_release, sizeof(*ptr),
> > +			   GFP_KERNEL);
> > +	if (!ptr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	mc =3D memory_controller_get_optional(dev, con_id);
> > +	if (!IS_ERR(mc)) {
> > +		*ptr =3D mc;
> > +		devres_add(dev, ptr);
> > +	} else {
> > +		devres_free(ptr);
> > +	}
> > +
> > +	return mc;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_memory_controller_get_optional);
> > +
> > +static int devm_memory_controller_match(struct device *dev, void *res,=
 void *data)
> > +{
> > +	struct memory_controller **mc =3D res;
> > +
> > +	if (WARN_ON(!mc || !*mc))
> > +		return 0;
> > +
> > +	return *mc =3D=3D data;
> > +}
> > +
> > +/**
> > + * devm_memory_controller_put() - release a reference to a memory cont=
roller
> > + * @mc: memory controller
> > + *
> > + * This is a device-managed variant of memory_controller_put(). Typica=
lly it
> > + * should never be necessary to call this function, since the device-m=
anaged
> > + * code should take care of releasing the reference at the right time.
> > + */
> > +void devm_memory_controller_put(struct device *dev,
> > +				struct memory_controller *mc)
> > +{
> > +	WARN_ON(devres_release(dev, devm_memory_controller_release,
> > +			       devm_memory_controller_match, mc));
> > +}
> > +EXPORT_SYMBOL_GPL(devm_memory_controller_put);
> > diff --git a/include/linux/memory-controller.h b/include/linux/memory-c=
ontroller.h
> > new file mode 100644
> > index 000000000000..54490cb5e625
> > --- /dev/null
> > +++ b/include/linux/memory-controller.h
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2019-2020 NVIDIA Corporation.
> > + */
> > +
> > +#ifndef _LINUX_MEMORY_CONTROLLER_H
> > +#define _LINUX_MEMORY_CONTROLLER_H
> > +
> > +#include <linux/device.h>
> > +#include <linux/list.h>
> > +
> > +struct memory_controller {
> > +	struct device *dev;
> > +	struct kref ref;
> > +	struct list_head list;
> > +};
> > +
> > +int memory_controller_register(struct memory_controller *mc);
> > +void memory_controller_unregister(struct memory_controller *mc);
> > +
> > +struct memory_controller *memory_controller_get(struct device *dev,
> > +						const char *con_id);
> > +struct memory_controller *memory_controller_get_optional(struct device=
 *dev,
> > +							 const char *con_id);
> > +void memory_controller_put(struct memory_controller *mc);
> > +
> > +struct memory_controller *devm_memory_controller_get(struct device *de=
v,
> > +						     const char *con_id);
> > +struct memory_controller *
> > +devm_memory_controller_get_optional(struct device *dev, const char *co=
n_id);
> > +void devm_memory_controller_put(struct device *dev,
> > +				struct memory_controller *mc);
> > +
> > +#endif
> >=20

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5FkREACgkQ3SOs138+
s6HNUg/9EOdySng2TmBOMFxRRKCHfWzl25A72JMKBgGqmVJaseeU7p04iDvMfNTX
SNhz36h2jifCsOW1XN71YHWIXrdhYTjKalezx3SfAdMiwjef5LAtl0jVB96+XbIq
L+WAPffQ5KjpdHNqym/GzAlezziWmVKTYqM+OwTLHjnuBJ87aNJpoiQ+/NYP5AVD
+wHcur+2y2/kc7Mg+vvqDCUhfaD3jbd6GLnp3zkkCUw0nYThlRGd9H9CeDKE588S
Glqfbp8yXy125sNsGHg5/h6ib4F67WTS8DqV+UrYq9X8t8pcq6kgq293QjOTeUQ2
hlbWlGOrQ/WJXUOmhQhk2+Ii/wsqQWvaC4h/lg9qRsfylOXhmYg9u27d5gDFN2a7
vryha/EXPbYbR/RwYZYm2LHjV4KWozCcRivWkYlpmnF8reFK+3wgF0zyJ7TxegwW
QV6BhGK3B24yO8ULBDKxrd2LiqyJ1cjo2zTGwWHIQd2NfcNsIarlBGGJekntvrlU
EExtKYZil3ICQWzFIZhNjHNX9pHKJOp9LT4CDbRnXjNftWMao8mug5m+NxduQAWp
qik/xEU/ZTuDEUuKFgjpaFFJxprFHilbqsfV5xgS3hDHxbqx1eb9l/0bw0rLNzkr
9bZuFdFznmC2mPELFp8rpWsQbDOMQ1u7kZuoKVaqPIDg/mNk1D8=
=dS7u
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
