Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6F91FBE46
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 20:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgFPSjY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 14:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgFPSjX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 14:39:23 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1E1C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 11:39:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y11so24852007ljm.9
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MtGWOM3LwYRZSC8oT5V9UrxzaPqB0NOi8RwnQtCKVwE=;
        b=cvKlOlmY6qFhTxuhAy0TjCnE6xwoCKTVh05op9/hfNItaT3sl5Sm3QrNl+17SADbLD
         ppRXMV4o4SoyjpR90s6ELR2lwX6Y9n7LH7DFGidth5GXxI3YMO5LFlBEA0ysOP/vm4et
         cuwgd//3Pz76jcOhrwGZ+wdrUFPVZ7h5OTQkELv/VMgbvrAqveFXMbw4HMULJH6dfxvq
         XWvESMU+JeDaXEwz8nC0avgaBuMjS8bEECiihia1Je4FxcQotXN6D9kyooSqoL2Obzkh
         4y4TnOfBYxpfLyo3zOOl0u9YKdKvOqkt5XMqTlwNkF/tNKpC46HT/CxWuM+v0stkubus
         q/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MtGWOM3LwYRZSC8oT5V9UrxzaPqB0NOi8RwnQtCKVwE=;
        b=tu41jJ6IY4bU/BfuxTAz3/LTXIuC6aZEIkA6n1E4vtOrZEgEvXwpy5/nBsoRpKirA9
         pcVxTOX8RoHuNOwd8oXcsu6RN+CMmKt10xaOly1aGzXjVAP71vXtHo16W7wzftreKFby
         FUghpz8MJknhZpl3+Iid1ylbBA53woO7yMyzou1A9ZU85hvQNsrjjGohJosb6dyNjR/+
         i38aYxDr0E0qVnHBwGpmRM0JlNAAT2u2BkvtGrKdHgqD3so5Z327poR0nJ/6VIb3hRmv
         TnDVw0jhHeMQ8cyjohYW0zuhijuDc0e9QKKW1/ne+lAypHo1MebrSj34jmYSJD/clCgS
         CuCQ==
X-Gm-Message-State: AOAM532AHGNzna8gWyOQRhgcN+SnhqAT2T3hepMmBet7xlPVF3O78MAZ
        WrW5bf9aRSBDD/nfMTH1s/fyyBkm
X-Google-Smtp-Source: ABdhPJxs8SFnjcPDXMrqy2pH8GtPbofGwiJAWirkfhiJpSSdN+3fxOuyDCOYl4VDYiQdFb0KBrbR6w==
X-Received: by 2002:a05:651c:384:: with SMTP id e4mr2071108ljp.410.1592332760882;
        Tue, 16 Jun 2020 11:39:20 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id e16sm248119lfj.44.2020.06.16.11.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 11:39:20 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Add zpos property for cursor planes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Daniel Stone <daniel@fooishbar.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200616181449.3147258-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8e45b425-b667-433e-2074-7a058329f5c2@gmail.com>
Date:   Tue, 16 Jun 2020 21:39:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616181449.3147258-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.06.2020 21:14, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> 
> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> 
> v3: do not hardcode zpos for overlay planes used as cursor (Dmitry)
> v2: hardcode cursor plane zpos to 255 instead of 0 (Ville)
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..04d6848d19fc 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>  
>  	return &plane->base;
>  }
> 

Looks nice, thanks! Since you dropped all other zpos changes for other
planes and given that the other planes have 255 for the max zpos, what
about to set the cursor's zpos to 256?
