Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6CD33D2D4
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Mar 2021 12:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhCPLRo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Mar 2021 07:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237266AbhCPLQi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 07:16:38 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77C5C06175F;
        Tue, 16 Mar 2021 04:16:36 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id bf3so20975252edb.6;
        Tue, 16 Mar 2021 04:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w497ewu+488OdBwStWhriw2e1ZlR/MrM10KCjfLzrHQ=;
        b=k3xwLxoN2cUdMcYZp9RMsQa5+3FVHUBS3ifWX05tD9NEUSMj9Pyo9T8JpRkdSzLqbE
         T8f5AHECeLo3OchLnI3c4Vz6DX+jfyUfTQUlZyrjYVvujWhdsTtg0N9wRxlsDnV9yexD
         HHrIi5+XIG4JcWzZ/8+z2n1zKkYKwvnHApaSV3Ramo6hFC+kPiSrgwEEpfXl28eShh0Y
         8QaAXpMjgT8dwVCT72rQs0vdB/j6UhDHmge1oyMc1VoFyNpxqnj/VPjHUnXSZ+ZA4nHx
         mlBRBSlB6i9tjifJ3S6mrClnPYnhSmRsVS1NQmjGBSDU5srR13ZK1EkN6hcgmFzTsoHI
         dVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w497ewu+488OdBwStWhriw2e1ZlR/MrM10KCjfLzrHQ=;
        b=aq5WxIbCjKh809yJRHRpLeU05M1oLoXXM+hIMVzA46Gna6FS3mchr1cvJ5Elb2OPRN
         TvxTrv6RTIodoD3n0CTPrhUgn/XZ48BUyKz4fvU6MpDS6YTRVsukwvrod7xExvts8tOs
         RGIPbJu4BOw9bs7XNdWAk7RLearHzZxNOjhpiOxaq5lrq6++woidykP6K3IfyIdeOKZr
         eBPd0/SSdw6sTwoE0dTmbOt6cwe6shEJA7jhkac+3aTqjDIcgRxaTaky3eiC6Afa0nfQ
         NW7z7rLqnV5mwCdKzubawtry+caisfhEhJd+tuijm1IMZQT9M1xfEyGahH2AeArUyuXV
         /DnQ==
X-Gm-Message-State: AOAM5308R4Z46+I5Z3xA7Xn6130k9icV5UW1fn9x0IxrvJVeS+XixdPK
        OmNUc3tH1VvWsI9yVseFwpk=
X-Google-Smtp-Source: ABdhPJyIzZOaz4Tgf49i512tNkvQn4dv3izLQOZTcpSl9Lwz2lkBEAbOW++4Ful92fDlmW7h65nWJA==
X-Received: by 2002:aa7:d94c:: with SMTP id l12mr34203450eds.311.1615893395426;
        Tue, 16 Mar 2021 04:16:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l18sm9199346ejk.86.2021.03.16.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 04:16:31 -0700 (PDT)
Date:   Tue, 16 Mar 2021 12:16:43 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     joro@8bytes.org, will@kernel.org, digetx@gmail.com,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] iommu/tegra-smmu: Add pagetable mappings to debugfs
Message-ID: <YFCTmwpg9pMQqcSu@orome.fritz.box>
References: <20210315203631.24990-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kpZ0hmcZQtWVPaR8"
Content-Disposition: inline
In-Reply-To: <20210315203631.24990-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--kpZ0hmcZQtWVPaR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 01:36:31PM -0700, Nicolin Chen wrote:
> This patch dumps all active mapping entries from pagetable
> to a debugfs directory named "mappings".
>=20
> Attaching an example:
>=20
> SWGROUP: hc
> ASID: 0
> reg: 0x250
> PTB_ASID: 0xe0080004
> as->pd_dma: 0x80004000
> {
>         [1023] 0xf008000b (1)
>         {
>                 PTE RANGE      | ATTR | PHYS               | IOVA        =
       | SIZE
>                 [#1023, #1023] | 0x5  | 0x0000000111a8d000 | 0x00000000ff=
fff000 | 0x1000
>         }
> }
> Total PDE count: 1
> Total PTE count: 1
>=20
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>=20
> Changelog
> v5:
>  * Fixed a typo in commit message
>  * Splitted a long line into two lines
>  * Rearranged variable defines by length
>  * Added Tested-by and Reviewed-by from Dmitry
> v4: https://lkml.org/lkml/2021/3/14/429
>  * Changed %d to %u for unsigned variables
>  * Fixed print format mismatch warnings on ARM32
> v3: https://lkml.org/lkml/2021/3/14/30
>  * Fixed PHYS and IOVA print formats
>  * Changed variables to unsigned int type
>  * Changed the table outputs to be compact
> v2: https://lkml.org/lkml/2021/3/9/1382
>  * Expanded mutex range to the entire function
>  * Added as->lock to protect pagetable walkthrough
>  * Replaced devm_kzalloc with devm_kcalloc for group_debug
>  * Added "PTE RANGE" and "SIZE" columns to group contiguous mappings
>  * Dropped as->count check; added WARN_ON when as->count mismatches pd[pd=
_index]
> v1: https://lkml.org/lkml/2020/9/26/70
>=20
>  drivers/iommu/tegra-smmu.c | 181 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 97eb62f667d2..b728cae63314 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -19,6 +19,11 @@
>  #include <soc/tegra/ahb.h>
>  #include <soc/tegra/mc.h>
> =20
> +struct tegra_smmu_group_debug {
> +	const struct tegra_smmu_swgroup *group;
> +	void *priv;

This always stores the address space, so why not make this:

	struct tegra_smmu_as *as;

? While at it, perhaps throw in a const to make sure we don't modify
this structure in the debugfs code.

> +};
> +
>  struct tegra_smmu_group {
>  	struct list_head list;
>  	struct tegra_smmu *smmu;
> @@ -47,6 +52,8 @@ struct tegra_smmu {
>  	struct dentry *debugfs;
> =20
>  	struct iommu_device iommu;	/* IOMMU Core code handle */
> +
> +	struct tegra_smmu_group_debug *group_debug;
>  };
> =20
>  struct tegra_smmu_as {
> @@ -152,6 +159,9 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu,=
 unsigned long offset)
> =20
>  #define SMMU_PDE_ATTR		(SMMU_PDE_READABLE | SMMU_PDE_WRITABLE | \
>  				 SMMU_PDE_NONSECURE)
> +#define SMMU_PTE_ATTR		(SMMU_PTE_READABLE | SMMU_PTE_WRITABLE | \
> +				 SMMU_PTE_NONSECURE)
> +#define SMMU_PTE_ATTR_SHIFT	(29)

No need for the parentheses here.

> =20
>  static unsigned int iova_pd_index(unsigned long iova)
>  {
> @@ -163,6 +173,12 @@ static unsigned int iova_pt_index(unsigned long iova)
>  	return (iova >> SMMU_PTE_SHIFT) & (SMMU_NUM_PTE - 1);
>  }
> =20
> +static unsigned long pd_pt_index_iova(unsigned int pd_index, unsigned in=
t pt_index)
> +{
> +	return ((dma_addr_t)pd_index & (SMMU_NUM_PDE - 1)) << SMMU_PDE_SHIFT |
> +	       ((dma_addr_t)pt_index & (SMMU_NUM_PTE - 1)) << SMMU_PTE_SHIFT;
> +}
> +
>  static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
>  {
>  	addr >>=3D 12;
> @@ -334,7 +350,7 @@ static void tegra_smmu_domain_free(struct iommu_domai=
n *domain)
>  }
> =20
>  static const struct tegra_smmu_swgroup *
> -tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup)
> +tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsigned int swgroup, i=
nt *index)
>  {
>  	const struct tegra_smmu_swgroup *group =3D NULL;
>  	unsigned int i;
> @@ -342,6 +358,8 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, unsi=
gned int swgroup)
>  	for (i =3D 0; i < smmu->soc->num_swgroups; i++) {
>  		if (smmu->soc->swgroups[i].swgroup =3D=3D swgroup) {
>  			group =3D &smmu->soc->swgroups[i];
> +			if (index)
> +				*index =3D i;

This doesn't look like the right place for this. And this also makes
things hard to follow because it passes out-of-band data in the index
parameter.

I'm thinking that this could benefit from a bit of refactoring where
we could for example embed struct tegra_smmu_group_debug into struct
tegra_smmu_group and then reference that when necessary instead of
carrying all that data in an orthogonal array. That should also make
it easier to track this.

Come to think of it, everything that's currently in your new struct
tegra_smmu_group_debug would be useful in struct tegra_smmu_group,
irrespective of debugfs support.

>  			break;
>  		}
>  	}
> @@ -350,19 +368,22 @@ tegra_smmu_find_swgroup(struct tegra_smmu *smmu, un=
signed int swgroup)
>  }
> =20
>  static void tegra_smmu_enable(struct tegra_smmu *smmu, unsigned int swgr=
oup,
> -			      unsigned int asid)
> +			      struct tegra_smmu_as *as)
>  {
>  	const struct tegra_smmu_swgroup *group;
> +	unsigned int asid =3D as->id;
>  	unsigned int i;
>  	u32 value;
> =20
> -	group =3D tegra_smmu_find_swgroup(smmu, swgroup);
> +	group =3D tegra_smmu_find_swgroup(smmu, swgroup, &i);
>  	if (group) {
>  		value =3D smmu_readl(smmu, group->reg);
>  		value &=3D ~SMMU_ASID_MASK;
>  		value |=3D SMMU_ASID_VALUE(asid);
>  		value |=3D SMMU_ASID_ENABLE;
>  		smmu_writel(smmu, value, group->reg);
> +		if (smmu->group_debug)
> +			smmu->group_debug[i].priv =3D as;

Logically I think this would also be better located in
tegra_smmu_attach_dev() because we're setting up the relationship
between a group and an address space here and this is not in fact
part of enabling the SMMU.

>  	} else {
>  		pr_warn("%s group from swgroup %u not found\n", __func__,
>  				swgroup);
> @@ -389,13 +410,15 @@ static void tegra_smmu_disable(struct tegra_smmu *s=
mmu, unsigned int swgroup,
>  	unsigned int i;
>  	u32 value;
> =20
> -	group =3D tegra_smmu_find_swgroup(smmu, swgroup);
> +	group =3D tegra_smmu_find_swgroup(smmu, swgroup, &i);
>  	if (group) {
>  		value =3D smmu_readl(smmu, group->reg);
>  		value &=3D ~SMMU_ASID_MASK;
>  		value |=3D SMMU_ASID_VALUE(asid);
>  		value &=3D ~SMMU_ASID_ENABLE;
>  		smmu_writel(smmu, value, group->reg);
> +		if (smmu->group_debug)
> +			smmu->group_debug[i].priv =3D NULL;
>  	}
> =20
>  	for (i =3D 0; i < smmu->soc->num_clients; i++) {
> @@ -499,7 +522,7 @@ static int tegra_smmu_attach_dev(struct iommu_domain =
*domain,
>  		if (err)
>  			goto disable;
> =20
> -		tegra_smmu_enable(smmu, fwspec->ids[index], as->id);
> +		tegra_smmu_enable(smmu, fwspec->ids[index], as);
>  	}
> =20
>  	if (index =3D=3D 0)
> @@ -1058,8 +1081,141 @@ static int tegra_smmu_clients_show(struct seq_fil=
e *s, void *data)
> =20
>  DEFINE_SHOW_ATTRIBUTE(tegra_smmu_clients);
> =20
> +static int tegra_smmu_mappings_show(struct seq_file *s, void *data)
> +{
> +	struct tegra_smmu_group_debug *group_debug =3D s->private;
> +	const struct tegra_smmu_swgroup *group;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
> +	unsigned int pd_index;
> +	unsigned int pt_index;
> +	unsigned long flags;
> +	u64 pte_count =3D 0;
> +	u32 pde_count =3D 0;
> +	u32 val, ptb_reg;
> +	u32 *pd;
> +
> +	if (!group_debug || !group_debug->priv || !group_debug->group)
> +		return 0;
> +
> +	group =3D group_debug->group;
> +	as =3D group_debug->priv;
> +	smmu =3D as->smmu;
> +
> +	mutex_lock(&smmu->lock);
> +
> +	val =3D smmu_readl(smmu, group->reg) & SMMU_ASID_ENABLE;
> +	if (!val)
> +		goto unlock;
> +
> +	pd =3D page_address(as->pd);
> +	if (!pd)
> +		goto unlock;
> +
> +	seq_printf(s, "\nSWGROUP: %s\nASID: %d\nreg: 0x%x\n",
> +		   group->name, as->id, group->reg);

Is group->reg really that useful here?

> +
> +	smmu_writel(smmu, as->id & 0x7f, SMMU_PTB_ASID);
> +	ptb_reg =3D smmu_readl(smmu, SMMU_PTB_DATA);
> +
> +	seq_printf(s, "PTB_ASID: 0x%x\nas->pd_dma: %pad\n",
> +		   ptb_reg, &as->pd_dma);

This looks somewhat redundant because as->pd_dma is already part of the
PTB_ASID register value. Instead, perhaps decode the upper bits of that
register and simply output as->pdma so that we don't duplicate the base
address of the page table?

> +	seq_puts(s, "{\n");
> +
> +	spin_lock_irqsave(&as->lock, flags);
> +
> +	for (pd_index =3D 0; pd_index < SMMU_NUM_PDE; pd_index++) {
> +		struct page *pt_page;
> +		unsigned int i;
> +		u32 *addr;
> +
> +		/* An empty PDE should not have a pte use count */
> +		WARN_ON_ONCE(!pd[pd_index] ^ !as->count[pd_index]);
> +
> +		/* Skip this empty PDE */
> +		if (!pd[pd_index])
> +			continue;
> +
> +		pde_count++;
> +		pte_count +=3D as->count[pd_index];
> +		seq_printf(s, "\t[%u] 0x%x (%d)\n",
> +			   pd_index, pd[pd_index], as->count[pd_index]);
> +		pt_page =3D as->pts[pd_index];
> +		addr =3D page_address(pt_page);
> +
> +		seq_puts(s, "\t{\n");
> +		seq_printf(s, "\t\t%-14s | %-4s | %-10s%s | %-10s%s | %-11s\n",
> +			   "PTE RANGE", "ATTR",
> +			   "PHYS", sizeof(phys_addr_t) > 4 ? "        " : "",
> +			   "IOVA", sizeof(dma_addr_t)  > 4 ? "        " : "",
> +			   "SIZE");
> +		for (pt_index =3D 0; pt_index < SMMU_NUM_PTE; pt_index +=3D i) {
> +			size_t size =3D SMMU_SIZE_PT;
> +			dma_addr_t iova;
> +			phys_addr_t pa;
> +
> +			i =3D 1;
> +
> +			if (!addr[pt_index])
> +				continue;
> +
> +			iova =3D pd_pt_index_iova(pd_index, pt_index);
> +			pa =3D SMMU_PFN_PHYS(addr[pt_index] & ~SMMU_PTE_ATTR);
> +
> +			/* Check contiguous mappings and increase size */
> +			while (pt_index + i < SMMU_NUM_PTE) {
> +				dma_addr_t next_iova;
> +				phys_addr_t next_pa;
> +
> +				if (!addr[pt_index + i])
> +					break;
> +
> +				next_iova =3D pd_pt_index_iova(pd_index, pt_index + i);
> +				next_pa =3D SMMU_PFN_PHYS(addr[pt_index + i] & ~SMMU_PTE_ATTR);
> +
> +				/* Break at the end of a linear mapping */
> +				if ((next_iova - iova !=3D SMMU_SIZE_PT * i) ||
> +				    (next_pa - pa !=3D SMMU_SIZE_PT * i))
> +					break;
> +
> +				i++;
> +			}
> +
> +			seq_printf(s, "\t\t[#%-4u, #%-4u] | 0x%-2x | %pa | %pad | 0x%-9zx\n",
> +				   pt_index, pt_index + i - 1,
> +				   addr[pt_index] >> SMMU_PTE_ATTR_SHIFT,
> +				   &pa, &iova, size * i);
> +		}
> +		seq_puts(s, "\t}\n");
> +	}
> +
> +	spin_unlock_irqrestore(&as->lock, flags);
> +
> +	seq_puts(s, "}\n");
> +	seq_printf(s, "Total PDE count: %u\n", pde_count);
> +	seq_printf(s, "Total PTE count: %llu\n", pte_count);

Some of the above looks like it wouldn't be very easily consumed by
scripts. Is that something we want to do? Or is this targetted primarily
at human consumption?

> +
> +unlock:
> +	mutex_unlock(&smmu->lock);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(tegra_smmu_mappings);
> +
>  static void tegra_smmu_debugfs_init(struct tegra_smmu *smmu)
>  {
> +	const struct tegra_smmu_soc *soc =3D smmu->soc;
> +	struct tegra_smmu_group_debug *group_debug;
> +	struct device *dev =3D smmu->dev;
> +	struct dentry *d;
> +	unsigned int i;
> +
> +	group_debug =3D devm_kcalloc(dev, soc->num_swgroups,
> +				   sizeof(*group_debug), GFP_KERNEL);
> +	if (!group_debug)
> +		return;

Memory allocation also becomes slightly easier if this is just embedded
inside struct tegra_smmu_group.

Thierry

--kpZ0hmcZQtWVPaR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBQk5QACgkQ3SOs138+
s6F0NQ//ZDf9bq2/wgsWiL0nbQRsJS/PFmD1CbwikYXsYGXPgD6S/Y86FHqRK06q
p4iaBcCRBe6j9AAEDRo5IbImKXq4dIwTKPSLLwE1cyHazwtXqzzm2upCcliOsU1k
xe3bFvWxAjQYPa/yslNBzl4bHlLSuJxqfUlKj+VI6OI8HtipiszSdh1F1N40AJIR
8AxYw1TKm04KboUegGHonDpyTaRqIT+r8+GUCT5czlXWQUShp6lBWX5rpszweeb3
TJyuOI64vBbyBAg9/uQ9uli0rvrrMntIiLRbTVhYJmGuc2gJgw0ZX/YMdMV7Haja
yBxmO4ZWx8ok5ve3304OrOvDPE5hrP0SrjA6OGJUAyG8rhl0upa2260Nk/AO/EfB
/WwiH9uYHjZyxwSwsdckz0NFY7b2CBzy5P6MEkH7QzR0u279Zm0jv7HpK+W7DMHx
BO+DlfXPoKX6zhouZdF6pSyj6iWy8sRJ6dS1dTY0MXxszbFHCdbNHDNSacD0+Wwl
m0jB3cBXhQI4oc8Usu4+igQqJrHvFuFpUNvbyCTj+ZWKT/TrT/keFvaF7qo8uxzG
GoxGnZ3klHiFFmt/2WEAUdeekdemZA4pguG7Czmbnq3/PLUr4M8mYsyylXuHLrqt
cahIaKqz2/F552BabOHTL2dELbqRQjKiBxbGRYl2m03qg0GZj0k=
=84/5
-----END PGP SIGNATURE-----

--kpZ0hmcZQtWVPaR8--
