Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0443D63393D
	for <lists+linux-tegra@lfdr.de>; Tue, 22 Nov 2022 11:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbiKVKAK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 22 Nov 2022 05:00:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiKVKAH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Nov 2022 05:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522A72B608
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669111145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+n97TWPMmTpOHxpEDX+bK+QZWALEwPXfVhrMNtePxVw=;
        b=G+F5M4+eCLF1aprCMOUnheFsATz6rysNMZYSxpqmDUV3JA/RBRO2GoTZuJTl5F4mMX8pkE
        H1wI5EIHKykHCePafWgQOqPqgqP3Lz+Waaq64K/YFj09OkVN7T+bCFm3APJwTxQ3DNKbN0
        9AbaZ0gWcPvLh+s23A3pG74oPdyaEu8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-c4Go81j8OMaXewor0apPfw-1; Tue, 22 Nov 2022 04:59:04 -0500
X-MC-Unique: c4Go81j8OMaXewor0apPfw-1
Received: by mail-qt1-f198.google.com with SMTP id n12-20020ac85a0c000000b003a5849497f9so14330571qta.20
        for <linux-tegra@vger.kernel.org>; Tue, 22 Nov 2022 01:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+n97TWPMmTpOHxpEDX+bK+QZWALEwPXfVhrMNtePxVw=;
        b=r2t5e0//ofE2Zdh8DdI6sDnpfKq6uyaCKW9TxWBtyyFnsQDycYSEBXnbOfAEyffJ+T
         H3mNhpNbT/TZQgcmD1tMcFDUdVlsvUu2YfXi991hyZxhrYMzu6Uwb2b8KzgrkZsiggO2
         s0jP0m7vFBLHxA+TQ3fXxtobZ+zhQ6iqI/bSDsBEHLqu40hC+OQXP5XjGHIjx5gapB8n
         tSLk5GI5uRRZi/1JueE2zsYDyleOz5pvHQeOVBeH17pkXX6lTgRgE/2+ejg0aV7lLtj7
         5gfnoNsVoMOteKslmKFUfKL77/RMPowF+NsLmzUzSoB85HgHbtF9BQAEt9AiuRO0QnvK
         jwdg==
X-Gm-Message-State: ANoB5pmT83FEuD3Xd5LPGBj860ikru0RY2pDD+GNkysTvWES3jrsQxwh
        Ph9bfEWAqB4PZBRP/4Uowxttpip6LkGikO0nx0+R7OemQt5zLRKLARrreC2aS9dODnl8/QGjxWF
        ckFRia/lAYErkrAqFc6YTqns=
X-Received: by 2002:ae9:ee07:0:b0:6fa:77c0:ea01 with SMTP id i7-20020ae9ee07000000b006fa77c0ea01mr3960529qkg.537.1669111143909;
        Tue, 22 Nov 2022 01:59:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67RIyRfhtCfrG5gOk0IZav/Pfo+93799eU5K3Fx7SVa60dtAwRShZMpWIwhasEPG2xtZDWsA==
X-Received: by 2002:ae9:ee07:0:b0:6fa:77c0:ea01 with SMTP id i7-20020ae9ee07000000b006fa77c0ea01mr3960518qkg.537.1669111143662;
        Tue, 22 Nov 2022 01:59:03 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-120-203.dyn.eolo.it. [146.241.120.203])
        by smtp.gmail.com with ESMTPSA id s21-20020a05620a29d500b006ed30a8fb21sm9911641qkp.76.2022.11.22.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 01:59:03 -0800 (PST)
Message-ID: <ebd282a59fa5d8db5a2deb1232dfad3807f06970.camel@redhat.com>
Subject: Re: [PATCH 2/2] net: stmmac: tegra: Add MGBE support
From:   Paolo Abeni <pabeni@redhat.com>
To:     Revanth Kumar Uppala <ruppala@nvidia.com>, f.fainelli@gmail.com
Cc:     andrew@lunn.ch, davem@davemloft.net, edumazet@google.com,
        jonathanh@nvidia.com, kuba@kernel.org, linux-tegra@vger.kernel.org,
        linux@armlinux.org.uk, netdev@vger.kernel.org, olteanv@gmail.com,
        thierry.reding@gmail.com, vbhadram@nvidia.com,
        Thierry Reding <treding@nvidia.com>
Date:   Tue, 22 Nov 2022 10:58:58 +0100
In-Reply-To: <20221118075744.49442-2-ruppala@nvidia.com>
References: <20221118075744.49442-1-ruppala@nvidia.com>
         <20221118075744.49442-2-ruppala@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

On Fri, 2022-11-18 at 13:27 +0530, Revanth Kumar Uppala wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 31ff35174034..e9f61bdaf7c4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -235,6 +235,12 @@ config DWMAC_INTEL_PLAT
>  	  the stmmac device driver. This driver is used for the Intel Keem Bay
>  	  SoC.
>  
> +config DWMAC_TEGRA
> +	tristate "NVIDIA Tegra MGBE support"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	help
> +	  Support for the MGBE controller found on Tegra SoCs.

Minor nit: checkpatch is complaining for a more descriptive config
option text.

> +static int tegra_mgbe_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct stmmac_resources res;
> +	struct tegra_mgbe *mgbe;
> +	int irq, err, i;
> +	u32 value;
> +
> +	mgbe = devm_kzalloc(&pdev->dev, sizeof(*mgbe), GFP_KERNEL);
> +	if (!mgbe)
> +		return -ENOMEM;
> +
> +	mgbe->dev = &pdev->dev;
> +
> +	memset(&res, 0, sizeof(res));
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	mgbe->hv = devm_platform_ioremap_resource_byname(pdev, "hypervisor");
> +	if (IS_ERR(mgbe->hv))
> +		return PTR_ERR(mgbe->hv);
> +
> +	mgbe->regs = devm_platform_ioremap_resource_byname(pdev, "mac");
> +	if (IS_ERR(mgbe->regs))
> +		return PTR_ERR(mgbe->regs);
> +
> +	mgbe->xpcs = devm_platform_ioremap_resource_byname(pdev, "xpcs");
> +	if (IS_ERR(mgbe->xpcs))
> +		return PTR_ERR(mgbe->xpcs);
> +
> +	res.addr = mgbe->regs;
> +	res.irq = irq;
> +
> +	mgbe->clks = devm_kzalloc(&pdev->dev, sizeof(*mgbe->clks), GFP_KERNEL);
> +	if (!mgbe->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i <  ARRAY_SIZE(mgbe_clks); i++)
> +		mgbe->clks[i].id = mgbe_clks[i];
> +
> +	err = devm_clk_bulk_get(mgbe->dev, ARRAY_SIZE(mgbe_clks), mgbe->clks);
> +	if (err < 0)
> +		return err;
> +
> +	err = clk_bulk_prepare_enable(ARRAY_SIZE(mgbe_clks), mgbe->clks);
> +	if (err < 0)
> +		return err;
> +
> +	/* Perform MAC reset */
> +	mgbe->rst_mac = devm_reset_control_get(&pdev->dev, "mac");
> +	if (IS_ERR(mgbe->rst_mac)) {
> +		err = PTR_ERR(mgbe->rst_mac);

This triggers a clang warning:

../drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c:283:6: warning: variable 'plat' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

I guess you have to init plat to NULL and explcitly check for NULL
values under the 'remove' label.

Cheers,

Paolo

