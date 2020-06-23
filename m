Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23679204C85
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Jun 2020 10:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731687AbgFWIgr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Jun 2020 04:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731567AbgFWIgr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Jun 2020 04:36:47 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34B2C061573;
        Tue, 23 Jun 2020 01:36:46 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l12so20736479ejn.10;
        Tue, 23 Jun 2020 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tCkxmZXZV/eyODmdSeVONBl/q1+N9efm5UtdLsYtJP4=;
        b=NnvdwoHcyxLJJcfVjcCLbA0S7HobmcCx2tZHRQiBLUpurcGVZwsh9cVfDLMDFRoYPO
         ZxK4yj382K2nmJlgx9tLpTCPNmZJRoxgBBEuaqaNOjN0P0uho6V1JUZqoHZW9odVbpRO
         RbP4gchi9KqlnNI68ld56gvPqcHi2r2/AoLvokIHSmGNYv/VL+CRm+fuFVHtBEf5q0lB
         A5dowZimBpBxXtHyFw7ws+AtlhxbuQ4kveLx/tyQnW+y5cMJDrmraCIZH7NMUoUATs5K
         1aaCSA1nVfPPxgG871oyy07f2gaZmgYMLnFaD3z21fk8ucnNpopE+n7o8fn/5aQmbedQ
         aMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tCkxmZXZV/eyODmdSeVONBl/q1+N9efm5UtdLsYtJP4=;
        b=izMdgWd4Ts2QH2eoOvBLi8FC7TrsoheKE6qVm31bz54UHlnVjT7qz7TC/WOpZ6i5Z6
         WVLCCYCCWjYZelkiY0LZ70gvjWrN3BvocmGGUa06o6l6yBXRi4sN5F6q50SPqu1vFgK+
         0OqyxzAOHcYOyVtTuOLefzIfZX0wgv1N3e+2J9++Czed3StjX93VpQgzn9E5hthTRxch
         B9BhQeQJysZ5JxNFlnmrY6xewOJ3KqMOJiTFtAG5R3Ect6qQapjJfv7wb5ECfmMLYOyO
         gSt4kpUqW6yqfTZqHSiwSTwTROgHupDKWRYKXX2qEcfqDdnVoSYoAd1GqOmldm8sT6YT
         UGug==
X-Gm-Message-State: AOAM530iaskduEnzdMmFMMi9wFzV0AZpQ/pDdFDGSHXWLWrr3JQBXhBS
        4AEi1qzfHywiM+mWUT0e3C0=
X-Google-Smtp-Source: ABdhPJz53FA+UCKcfl1GaH7jbkbLk5oygevgxleyHGSM7PkNphCrHa20Vwg450DfpoOgMhD3nH8t3A==
X-Received: by 2002:a17:906:455:: with SMTP id e21mr8427290eja.550.1592901405582;
        Tue, 23 Jun 2020 01:36:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m26sm3022529ejn.122.2020.06.23.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:36:44 -0700 (PDT)
Date:   Tue, 23 Jun 2020 10:36:43 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     snikam@nvidia.com, mperttunen@nvidia.com, bhuntsman@nvidia.com,
        will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
        praithatha@nvidia.com, talho@nvidia.com,
        iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
        linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        bbiswas@nvidia.com
Subject: Re: [PATCH v6 3/4] iommu/arm-smmu: Add global/context fault
 implementation hooks
Message-ID: <20200623083643.GB4098287@ulmo>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-4-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <20200604234414.21912-4-vdumpa@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2020 at 04:44:13PM -0700, Krishna Reddy wrote:
> Add global/context fault hooks to allow NVIDIA SMMU implementation
> handle faults across multiple SMMUs.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>  drivers/iommu/arm-smmu-nvidia.c | 100 ++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.c        |  11 +++-
>  drivers/iommu/arm-smmu.h        |   3 +
>  3 files changed, 112 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iommu/arm-smmu-nvidia.c b/drivers/iommu/arm-smmu-nvi=
dia.c
> index dafc293a45217..5999b6a770992 100644
> --- a/drivers/iommu/arm-smmu-nvidia.c
> +++ b/drivers/iommu/arm-smmu-nvidia.c
> @@ -117,6 +117,104 @@ static int nsmmu_reset(struct arm_smmu_device *smmu)
>  	return 0;
>  }
> =20
> +static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct arm_smmu_domain, domain);
> +}
> +
> +static irqreturn_t nsmmu_global_fault_inst(int irq,
> +					       struct arm_smmu_device *smmu,
> +					       int inst)
> +{
> +	u32 gfsr, gfsynr0, gfsynr1, gfsynr2;
> +
> +	gfsr =3D readl_relaxed(nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
> +	gfsynr0 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR0);
> +	gfsynr1 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR1);
> +	gfsynr2 =3D readl_relaxed(nsmmu_page(smmu, inst, 0) +
> +				ARM_SMMU_GR0_sGFSYNR2);
> +
> +	if (!gfsr)
> +		return IRQ_NONE;
> +
> +	dev_err_ratelimited(smmu->dev,
> +		"Unexpected global fault, this could be serious\n");
> +	dev_err_ratelimited(smmu->dev,
> +		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
> +		gfsr, gfsynr0, gfsynr1, gfsynr2);
> +
> +	writel_relaxed(gfsr, nsmmu_page(smmu, inst, 0) + ARM_SMMU_GR0_sGFSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nsmmu_global_fault(int irq, void *dev)
> +{
> +	int inst;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
> +		irq_ret =3D nsmmu_global_fault_inst(irq, smmu, inst);
> +		if (irq_ret =3D=3D IRQ_HANDLED)
> +			return irq_ret;
> +	}
> +
> +	return irq_ret;
> +}
> +
> +static irqreturn_t nsmmu_context_fault_bank(int irq,
> +					    struct arm_smmu_device *smmu,
> +					    int idx, int inst)
> +{
> +	u32 fsr, fsynr, cbfrsynra;
> +	unsigned long iova;
> +
> +	fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> +	if (!(fsr & ARM_SMMU_FSR_FAULT))
> +		return IRQ_NONE;
> +
> +	fsynr =3D readl_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			      ARM_SMMU_CB_FSYNR0);
> +	iova =3D readq_relaxed(nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			     ARM_SMMU_CB_FAR);
> +	cbfrsynra =3D readl_relaxed(nsmmu_page(smmu, inst, 1) +
> +				  ARM_SMMU_GR1_CBFRSYNRA(idx));
> +
> +	dev_err_ratelimited(smmu->dev,
> +	"Unhandled context fault: fsr=3D0x%x, iova=3D0x%08lx, fsynr=3D0x%x, cbf=
rsynra=3D0x%x, cb=3D%d\n",
> +			    fsr, iova, fsynr, cbfrsynra, idx);
> +
> +	writel_relaxed(fsr, nsmmu_page(smmu, inst, smmu->numpage + idx) +
> +			    ARM_SMMU_CB_FSR);
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t nsmmu_context_fault(int irq, void *dev)
> +{
> +	int inst, idx;
> +	irqreturn_t irq_ret =3D IRQ_NONE;
> +	struct iommu_domain *domain =3D dev;
> +	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
> +
> +	for (inst =3D 0; inst < to_nvidia_smmu(smmu)->num_inst; inst++) {
> +		/* Interrupt line shared between all context faults.
> +		 * Check for faults across all contexts.
> +		 */
> +		for (idx =3D 0; idx < smmu->num_context_banks; idx++) {
> +			irq_ret =3D nsmmu_context_fault_bank(irq, smmu,
> +							   idx, inst);
> +
> +			if (irq_ret =3D=3D IRQ_HANDLED)
> +				return irq_ret;
> +		}
> +	}
> +
> +	return irq_ret;
> +}
> +
>  static const struct arm_smmu_impl nvidia_smmu_impl =3D {
>  	.read_reg =3D nsmmu_read_reg,
>  	.write_reg =3D nsmmu_write_reg,
> @@ -124,6 +222,8 @@ static const struct arm_smmu_impl nvidia_smmu_impl =
=3D {
>  	.write_reg64 =3D nsmmu_write_reg64,
>  	.reset =3D nsmmu_reset,
>  	.tlb_sync =3D nsmmu_tlb_sync,
> +	.global_fault =3D nsmmu_global_fault,
> +	.context_fault =3D nsmmu_context_fault,
>  };
> =20
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *sm=
mu)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 243bc4cb2705b..d720e1e191176 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -673,6 +673,7 @@ static int arm_smmu_init_domain_context(struct iommu_=
domain *domain,
>  	enum io_pgtable_fmt fmt;
>  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>  	struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
> +	irqreturn_t (*context_fault)(int irq, void *dev);
> =20
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -835,7 +836,9 @@ static int arm_smmu_init_domain_context(struct iommu_=
domain *domain,
>  	 * handler seeing a half-initialised domain state.
>  	 */
>  	irq =3D smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
> -	ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
> +	context_fault =3D (smmu->impl && smmu->impl->context_fault) ?
> +			 smmu->impl->context_fault : arm_smmu_context_fault;

A simpler way might have been to assign arm_smmu_context_fault to all
implementations. That way we wouldn't have to perform this check here
and instead just always using smmu->impl->context_fault.

> +	ret =3D devm_request_irq(smmu->dev, irq, context_fault,
>  			       IRQF_SHARED, "arm-smmu-context-fault", domain);
>  	if (ret < 0) {
>  		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
> @@ -2107,6 +2110,7 @@ static int arm_smmu_device_probe(struct platform_de=
vice *pdev)
>  	struct arm_smmu_device *smmu;
>  	struct device *dev =3D &pdev->dev;
>  	int num_irqs, i, err;
> +	irqreturn_t (*global_fault)(int irq, void *dev);
> =20
>  	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu) {
> @@ -2193,9 +2197,12 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  		smmu->num_context_irqs =3D smmu->num_context_banks;
>  	}
> =20
> +	global_fault =3D (smmu->impl && smmu->impl->global_fault) ?
> +			smmu->impl->global_fault : arm_smmu_global_fault;
> +

Same as above.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7xvxoACgkQ3SOs138+
s6GqYBAAoTf7KJPieWVcbFJf7WZ37Spi4ElW5TCTmB8w+7Ta0O+QvYzjA6sgPAVH
eRvzY8htDuI8uKWAu4cimQHsyl/oYAXTtEUK15DJVHY9h+VGxtj1hibG+xF2mHMP
5C3ILKj3aG0eHzC4ZuBHjLWerXQca5kIL0RinVwoycUpuofZ89B+Za2S3IfzECoI
HKRB5t5Ewlj2Zj7wbdEzk3ZE55DnN/+ccHlsunrbfdtgqOy9r/tJzXRh0es6fq9E
LvGVgBxEyqWZHqlLgNL/CtJ20N1l/TX35ykmBDAgLlWociDGn192g81igC6/7lm8
3uYQtopzIUyT4BVhJWZafi07qbkQLTa3mFEkfAly525CLAEmoCflS0DfwNKXXW5n
pzxfG61PJwOuEwWoPNmiVixMa4D7akYEk+/XHVxLQ/y/sD4xgWY6atec8SNmMHWj
jTBjqVz/ErxmRXJLpFb42SVdOvo8dDxSypjmiqyAT+MaqhQfRNhRjl/9R1Vz445M
gaogqT8/MNliChyUUBegQsLjvJl6EmeCZnDXWkP5LwCRVML0Nbi9f7uGbtEAt6lP
ImxHKoBo5BQlRjsorsMCWt/KC4w35cxI/SoOSclTJO/T1/nGs0ja2WUUDgU+M8Q7
7PSOGYFJqtG6/lhnqTXl15SvfmUIYrAUxMy1yKbZP1xmOoLPn+c=
=iggw
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
