Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06C678B9CE
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Aug 2023 22:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjH1Uyc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Aug 2023 16:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbjH1UyG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Aug 2023 16:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B937011A
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693256001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qzw/wSjdBQfPlF1y1vWCr8uR+Xbcc5Ojc8ATgenlbFw=;
        b=M0FHN3D7l8ynHyniTatW4TxRpBL+UCo9G3jNOLLE/IQ+3qt6kFG1Cqud2BfzY/9mi9tZiQ
        Pv4VmsWXO6vb27JBt9gG3qrHMo99Oz/LsrNsmDECLjeWCnPf6NDlohnKdBVINH3mDKqfHJ
        Ypk0FaKlh4gUWAsbamiRZ8ouIebxHqI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-GZSTm8GIOu-VvXB3twmB0w-1; Mon, 28 Aug 2023 16:53:19 -0400
X-MC-Unique: GZSTm8GIOu-VvXB3twmB0w-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-411fc812914so40714131cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 28 Aug 2023 13:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255999; x=1693860799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzw/wSjdBQfPlF1y1vWCr8uR+Xbcc5Ojc8ATgenlbFw=;
        b=lKUk5V19oPu6uBmwFgJqpNQCQCcSs8CpIFbAG1SWUu3gyMibQKrXoqRSnyL0j+RGq9
         e/WL8AQX960t9t7M3xgKOPmCF+Oat+N+Q/VgwaaQmFwfk8zwfejSbJ7Oc3JTnOtjF/mD
         RbHJjQUPQDGGRIpyCje6jcBu2c34pfErbfR3rY3/qnsQy7MjO5CTGMkidMKthiX6RWlF
         k1MDa/+VOq2yFZfME2aq1WcQd65u9C4pTI05adiVb6EAXgd+EX5czmD/xN2LDbXzlObw
         oqihqvKmVBzSFyHLGPhSoLPhcW/taKeRcYMLsEYojtYFbGTHtwzTBKS17MZluEw4uYz1
         rAIA==
X-Gm-Message-State: AOJu0YwwLdaPSk8KAvTTHdUIvF0TKre6AQ6jr+Z4oQ1bK6cCRjRcgado
        pQOvlPvH0eJKn8IlCK+H1GdMS1ttVZ7LOYlN0TIkryhQH+aoFNidHyCHnxaFsCzQ+aWRtbsbMLg
        bHtP0LEltZZ6gy/1Hqwejx3E=
X-Received: by 2002:a05:622a:13cc:b0:407:fb08:c44c with SMTP id p12-20020a05622a13cc00b00407fb08c44cmr31265805qtk.47.1693255998871;
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1P7U6WABsjNUNOIrt30Nh8s3ysfvweacBVh9WudC6nYyRn08u0phTJIzmGkwySv3sSUL+sw==
X-Received: by 2002:a05:622a:13cc:b0:407:fb08:c44c with SMTP id p12-20020a05622a13cc00b00407fb08c44cmr31265764qtk.47.1693255998660;
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z21-20020ac84555000000b0040ff0590fd2sm2553633qtn.87.2023.08.28.13.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:53:18 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:53:16 -0700
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
Subject: Re: [PATCH v7 14/24] iommu/msm: Implement an IDENTITY domain
Message-ID: <37fnmzxe5cqs57gei3i6irsnnybzkbkdjf3nhertw55bb4ke6w@un2o657nczbc>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <14-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:28PM -0300, Jason Gunthorpe wrote:
> What msm does during msm_iommu_set_platform_dma() is actually putting the
> iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
> compiled on ARM64 either. Most likely it is fine to support dma-iommu.c
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

