Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7853478B912
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Aug 2023 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjH1UIR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Aug 2023 16:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbjH1UIO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Aug 2023 16:08:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EE4C5
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693253252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
        b=YGOnYDIW+yI7I2EMs9J510zzvl/tghf/dHYsnvpwX8lEdtyp9baXzbsb2Ccnoeg8pd0KxG
        x4n0fKQGVAa9UWncbnBSc2cbn3A4m7fh/ZGXy/m3gPLEfr/pXBwnRm3fEVH6XhLZ5hVUQp
        xinP2Tng5hEq+WgHpcyuTZ6CHxlYtSQ=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-BrH1cPVUNXqMAz6tojwQew-1; Mon, 28 Aug 2023 16:07:30 -0400
X-MC-Unique: BrH1cPVUNXqMAz6tojwQew-1
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-44d4b7993c3so1569883137.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693253250; x=1693858050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
        b=JvFb8bNbS0VeQbCeMO42IRrnUC7zm+RF/xmO/xes/AohsAdr8WUWkFbjx6e7TNAp7c
         Vlsx3d8Bma54pZa1kyOm0lXmQ2zl/woIAE76QNg5kk2Q8Rl+ndZlFagNEPzqPWWDyzns
         ybMh+P2S0gvt0vtdvom5LtZA6F7urRlriKyJ1kgSReoxhs/eMMktLLW6TSRJ2Y/wvhMY
         pCn9RMXQWynPqqhwcI6C4O+q8dLJYgL7XCXN5e6ZTNdiEwrsxGg15g5saSWIoEt2c7Iu
         iMNECAzXmrqt0/ncVibfSz/HnSrpWvr38MD2lG/+XOeYPF1XZ83+C64IneXZm9oW9URv
         1UvA==
X-Gm-Message-State: AOJu0YxFQY9kCsfkDM5n4JlYhVi6kMrxmx9rRLVuVEjASGgBBQJ3QTdy
        FhDEL9akDEoBaHOIRLJdQKT8aI8tPWufHBfqE9N/6uxQRzkpZtig8bNsZlhJwO0dcBfBla8wv4E
        EA8vKTMJ6Bxp4X9HypoWqOBg=
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899816vst.3.1693253250444;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvQrHN5P8TUioFwnH2DuKJFINn3O8GiLCiK+L04RR+CJ1jziXQavUqdv+merrihDaRe7h1tw==
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899781vst.3.1693253250162;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id y3-20020a37e303000000b0076c8fd39407sm2344737qki.113.2023.08.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:07:29 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:07:28 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
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
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 09/24] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <qovs7txfhvtbfvc6un6albkxy6x6ytmnowqcgh6wt2fgbmvhto@2unjmfnnbqfh>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:23PM -0300, Jason Gunthorpe wrote:
> Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
> same stuff, the way they relate to the IOMMU core is quiet different.
> 
> dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
> IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
> becomes the default_domain for the group.
> 
> ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
> allocates an UNMANAGED domain and operates it just like an external
> driver. In this case group->default_domain is NULL.
> 
> If the driver provides a global static identity_domain then automatically
> use it as the default_domain when in ARM_DMA_USE_IOMMU mode.
> 
> This allows drivers that implemented default_domain == NULL as an IDENTITY
> translation to trivially get a properly labeled non-NULL default_domain on
> ARM32 configs.
> 
> With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
> device the normal detach_domain flow will restore the IDENTITY domain as
> the default domain. Overall this makes attach_dev() of the IDENTITY domain
> called in the same places as detach_dev().
> 
> This effectively migrates these drivers to default_domain mode. For
> drivers that support ARM64 they will gain support for the IDENTITY
> translation mode for the dma_api and behave in a uniform way.
> 
> Drivers use this by setting ops->identity_domain to a static singleton
> iommu_domain that implements the identity attach. If the core detects
> ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
> during probe.
> 
> Drivers can continue to prevent the use of DMA translation by returning
> IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
> IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.
> 
> This allows removing the set_platform_dma_ops() from every remaining
> driver.
> 
> Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
> is set an existing global static identity domain. mkt_v1 does not support
> IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
> is safe.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c          | 21 ++++++++++++++++++++-
>  drivers/iommu/mtk_iommu_v1.c   | 12 ------------
>  drivers/iommu/rockchip-iommu.c | 10 ----------
>  3 files changed, 20 insertions(+), 23 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

