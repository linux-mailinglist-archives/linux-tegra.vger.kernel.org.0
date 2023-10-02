Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC6F7B5C70
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Oct 2023 23:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjJBVWS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Oct 2023 17:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjJBVWR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Oct 2023 17:22:17 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBB193
        for <linux-tegra@vger.kernel.org>; Mon,  2 Oct 2023 14:22:11 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59bc956b029so3159907b3.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Oct 2023 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696281731; x=1696886531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KY1yTwg5kkSQ1PPrVUqg1E2GU9pyZpek6FOp/omImxs=;
        b=q2hBlSiJrDNQkVauwy0wB4QkDvoV+H+DHWWFoSIVDYx8vEKNBW/lOJvVOzFjDLI3xT
         UQG6jqG5g0TlM+jxvf1nTkWrU0EI3xheRqnJ16aeH7ek+BkIVfehv4qRlnrjLmd60dew
         r+ktPMtHk7KvcHVuZtEHM7VW8whCqz1rnC/m+f21r4mrPOnU9wRyab+JYPat1ihkVijE
         NAdgDlOgAqK/gheHlNM57/A7oj+7QksFb/ztAmoX0HdkYLhTYySACMeoYVFkU4cPtB0P
         RhVOBTYvj1Vrb/XTcnPh/ahk1PK7bS0PM+zUXiztQU4MWDi7dGFdQcHtGth7n7u2M4HG
         QpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696281731; x=1696886531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KY1yTwg5kkSQ1PPrVUqg1E2GU9pyZpek6FOp/omImxs=;
        b=PF9h5kjXsbpBDa2IIlprcfhdzpT78IE57kKe6v3VqT1QZ9c12tN5vMX7+oHq8Qqqck
         Z3mO9qyq8zhh7jbIxo0D6je07agqZG3Y9ECUOBGXf+YdnqJtRstXKg+FoDHWvBeMOGYO
         0Fn8u42zLtpDgXOYXA6cjhpBQJc8BUe51dOjstpzdOPGtG+YSMDzaUEaYBnb8S6Jmm3c
         o68+9TvcV4vmvQ7AO2iYP+jg0A7GrVAUY57C2FmYbPW/JPok1q/NTOfLnTPm6VMKCkKi
         Lpky9mcCquarzujHjxjDeOL7iDHJZY8wSnUJXPCAsqJXE46WHWDXDk8CnFsZeyptQVLh
         nfOg==
X-Gm-Message-State: AOJu0Yxp4kynHK4oAhxfdZAgblDZ5s2GDqS1xPyiPqElPWWsfF+CP+Rd
        8gamOcMeWZlcFaj2LYwnnsgGwU5tkZLmtj/CIPcKWXFWPzThEPoyJTY=
X-Google-Smtp-Source: AGHT+IFaRCfqm0SlfcT/sMeXMK7dbF3zxTUUIPxu3awMhgeV/37hJ6olOIew2lBKO7L65qL9ql+xhT0CDDmED9Aaft4=
X-Received: by 2002:a0d:c906:0:b0:595:9135:83c7 with SMTP id
 l6-20020a0dc906000000b00595913583c7mr11373199ywd.47.1696281730897; Mon, 02
 Oct 2023 14:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com> <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 3 Oct 2023 00:21:59 +0300
Message-ID: <CAA8EJprz7VVmBG68U9zLuqPd0UdSRHYoLDJSP6tCj6H6qanuTQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
To:     Jason Gunthorpe <jgg@nvidia.com>, Rob Clark <robdclark@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 13 Sept 2023 at 16:45, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> At this point every iommu driver will cause a default_domain to be
> selected, so we can finally remove this gap from the core code.
>
> The following table explains what each driver supports and what the
> resulting default_domain will be:
>
>                                         ops->defaut_domain
>                     IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
> amd/iommu.c             Y       Y                       N/A             either
> apple-dart.c            Y       Y                       N/A             either
> arm-smmu.c              Y       Y                       IDENTITY        either
> qcom_iommu.c            G       Y                       IDENTITY        either
> arm-smmu-v3.c           Y       Y                       N/A             either
> exynos-iommu.c          G       Y                       IDENTITY        either
> fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
> intel/iommu.c           Y       Y                       N/A             either
> ipmmu-vmsa.c            G       Y                       IDENTITY        either
> msm_iommu.c             G                               IDENTITY        N/A

Unfortunately this patch breaks msm_iommu platforms. This driver
doesn't select ARM_DMA_USE_IOMMU, so iommu_get_default_domain_type()
returns 0, bus_iommu_probe() fails with -ENODEV.
If I make MSM_IOMMU select ARM_DMA_USE_IOMMU, then GPU probing fails
with -EBUSY.

> mtk_iommu.c             G       Y                       IDENTITY        either
> mtk_iommu_v1.c          G                               IDENTITY        N/A
> omap-iommu.c            G                               IDENTITY        N/A
> rockchip-iommu.c        G       Y                       IDENTITY        either
> s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
> sprd-iommu.c                    Y                       N/A             DMA
> sun50i-iommu.c          G       Y                       IDENTITY        either
> tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
> virtio-iommu.c          Y       Y                       N/A             either
> spapr                                   Y       Y       N/A             N/A     PLATFORM
>  * G means ops->identity_domain is used
>  * N/A means the driver will not compile in this configuration
>
> ARM32 drivers select an IDENTITY default domain through either the
> ops->identity_domain or directly requesting an IDENTIY domain through
> alloc_domain().
>
> In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
> forces an IDENTITY domain.
>
> S390 uses a PLATFORM domain to represent when the dma_ops are set to the
> s390 iommu code.
>
> fsl_pamu uses an PLATFORM domain.
>
> POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.
>
> The x86 drivers continue unchanged.
>
> After this patch group->default_domain is only NULL for a short period
> during bus iommu probing while all the groups are constituted. Otherwise
> it is always !NULL.
>
> This completes changing the iommu subsystem driver contract to a system
> where the current iommu_domain always represents some form of translation
> and the driver is continuously asserting a definable translation mode.
>
> It resolves the confusion that the original ops->detach_dev() caused
> around what translation, exactly, is the IOMMU performing after
> detach. There were at least three different answers to that question in
> the tree, they are all now clearly named with domain types.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 42a4585dd76da6..cfb597751f5bad 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1865,7 +1865,6 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
>  static int iommu_get_default_domain_type(struct iommu_group *group,
>                                          int target_type)
>  {
> -       const struct iommu_ops *ops = group_iommu_ops(group);
>         struct device *untrusted = NULL;
>         struct group_device *gdev;
>         int driver_type = 0;
> @@ -1876,11 +1875,13 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
>          * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
>          * identity_domain and it will automatically become their default
>          * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> -        * Override the selection to IDENTITY if we are sure the driver supports
> -        * it.
> +        * Override the selection to IDENTITY.
>          */
> -       if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain)
> +       if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> +               static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> +                               IS_ENABLED(CONFIG_IOMMU_DMA)));
>                 driver_type = IOMMU_DOMAIN_IDENTITY;
> +       }
>
>         for_each_group_device(group, gdev) {
>                 driver_type = iommu_get_def_domain_type(group, gdev->dev,
> @@ -3016,18 +3017,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
>         if (req_type < 0)
>                 return -EINVAL;
>
> -       /*
> -        * There are still some drivers which don't support default domains, so
> -        * we ignore the failure and leave group->default_domain NULL.
> -        */
>         dom = iommu_group_alloc_default_domain(group, req_type);
> -       if (!dom) {
> -               /* Once in default_domain mode we never leave */
> -               if (group->default_domain)
> -                       return -ENODEV;
> -               group->default_domain = NULL;
> -               return 0;
> -       }
> +       if (!dom)
> +               return -ENODEV;
>
>         if (group->default_domain == dom)
>                 return 0;
> --
> 2.42.0
>


-- 
With best wishes
Dmitry
