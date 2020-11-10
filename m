Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCAC2AE14C
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Nov 2020 22:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731722AbgKJVDA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Nov 2020 16:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730164AbgKJVDA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 16:03:00 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C375C0613D3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 13:03:00 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so6412274wru.6
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2020 13:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cl7mu1oJmxHryxTnp1BFFDbppYfx4b3GmLjMWirrXpA=;
        b=t0KEjfmxLppQcRxfnYEcNWIZBmLHP7HXMRFKhC00W8Hp2KWhozDeUsxelrXqVMzcQj
         KXlmUYDPtPDEwdE3/ExohP+t2Xww0n4xcP+FBpqavG04n6y5GiytgkVIG4n/EqJSONvf
         +m4TuIGfaeOetLwKfABy+Qp7zMYmclssGNjqBVoh+AsCJ2Dd4LnEe4EnARmZPrLESRds
         ZBTP2N7MC236DxwF6/J2KrS4Pr+VX8ALzm+efyx22XsYuS91JDGoRtTkwVrpLKd+C1MK
         ED4EYR5QKYe3n6p3p8i7rLWBGr4YqxonTyfAqxCtiQrBByo0eM9c4xp/kjNYVpX7x8tQ
         J0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cl7mu1oJmxHryxTnp1BFFDbppYfx4b3GmLjMWirrXpA=;
        b=HqUvUTLUxdFRDvLbC73X/0fVGuufZVgmn1OcpuXQQG2IoAb68JAuyyprH6B78/o4P/
         kXkG0YB08EcHANh7mEMl55NcX76WHhm+dyDTTknDFR4h85UmQQo0o8JDCP2phJ2d+Gju
         cR70Bi6Z6SZuraGzlmJtgTyp3OlkfjX41P3U8TGe3Jw6P9if8h8RBBP8m0lTsyRcXjyt
         V9wbLCJnItPsvJ+VhZARb4G3UroW6EtzChWyJ/lS2jdJ0Gh8xzb6v5iys6NmtP4cymwC
         njglgQrSgDGsPfrfrfjObl0bPapJSPkGOQ4U/P2Z38W6Ox1bKONinwqiL+msHLV87hU/
         d7Nw==
X-Gm-Message-State: AOAM5323raynHcQ9Ef5QUAwXJxeRWb8EYyAO3xXpPz4GX5UuJ2s4wjvm
        klLiFsRu3CE2L4KTwkjJlyc/Og==
X-Google-Smtp-Source: ABdhPJwIsCLVZUJBtrdWyW3Ob7YqHeqsWN46NIYBEC8Ip4Zj9vK+XjNlJtGBKT0A6Vdthxqmn7lVPQ==
X-Received: by 2002:adf:db4a:: with SMTP id f10mr11091524wrj.420.1605042178875;
        Tue, 10 Nov 2020 13:02:58 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p13sm18415385wrt.73.2020.11.10.13.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:02:58 -0800 (PST)
Date:   Tue, 10 Nov 2020 21:02:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 24/25] soc: tegra: fuse: speedo-tegra210: Remove a group
 of set but unused variables
Message-ID: <20201110210256.GK2063125@dell>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
 <20201103152838.1290217-25-lee.jones@linaro.org>
 <20201110194134.GB2375022@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110194134.GB2375022@ulmo>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 10 Nov 2020, Thierry Reding wrote:

> On Tue, Nov 03, 2020 at 03:28:37PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/soc/tegra/fuse/speedo-tegra210.c: In function ‘tegra210_init_speedo_data’:
> >  drivers/soc/tegra/fuse/speedo-tegra210.c:105:56: warning: variable ‘soc_iddq’ set but not used [-Wunused-but-set-variable]
> >  drivers/soc/tegra/fuse/speedo-tegra210.c:105:46: warning: variable ‘gpu_iddq’ set but not used [-Wunused-but-set-variable]
> >  drivers/soc/tegra/fuse/speedo-tegra210.c:105:36: warning: variable ‘cpu_iddq’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/soc/tegra/fuse/speedo-tegra210.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Sam as for the previous patch, I applied this and removed the register
> reads altogether, since there aren't any side-effects.

Perfect.  Thanks Thierry.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
