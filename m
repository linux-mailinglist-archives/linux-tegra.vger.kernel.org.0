Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DCA1CD2E0
	for <lists+linux-tegra@lfdr.de>; Mon, 11 May 2020 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEKHlY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 May 2020 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgEKHlY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 May 2020 03:41:24 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72DC061A0C
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2020 00:41:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z72so8345861wmc.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2020 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hseT4o3e+iJvKvlfPpNLzXEPteR4GO6bBd3Kzf2HHZM=;
        b=ZEwp7zsvc6V/NaIZ350pitGQRs0EMYP8K6a8+IIsELLZ5AAzsHB965S9ZDCWNaBym7
         5XimvrLLj3O6IYOPThMbNl+vsJeoxSHtkg9a7L7brMoaPPIE+obGgZRFUILa5sHqPCaj
         /jQ7/bLYVucXsb/mw/GQMCjzy0T/LtXC2C4n6QYiKkAz2Cdk7nEYEX3O/u9fqwMKRz/t
         3Kxr/WZw5aFxC+9CmrXKhv9AguMA/PVIGdSWh8lG7dOZ4fHttZW9BdpR2NjP6bP1Wlij
         TcZENsfPqxRIXZ0PsT5O3xTRsqA4+zpH2SRfzop9QS8dU00cSN8SS7ts7PHaWglWD9wu
         BMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hseT4o3e+iJvKvlfPpNLzXEPteR4GO6bBd3Kzf2HHZM=;
        b=X7ghoGF71lKBXYCo5KrqCjpA89OdZLGD0PZaij7rW1cCN+aEBI4RDc8zyqrSdMg/vD
         XuNdoET9+9H2/8z1DdFtc8k6/fk7QOo2wvqQHh6LxPMlTu961GxzM0XEzgHMtzy56CBf
         1GGvTe5rNRs1+MNEHtyFxLFvzzQnQDUWs0OlS5kZvYgZaOAmIK3CNGJ54KHHaRkTNnnh
         jST9tZU2He8yEVliBJJU36a1Sw5VUAWv7VIAX/lf/I5UjZiR+wyHUMrCPI8ru9Tpdj3n
         6gCoIm76288fUEZ+vAr82VeOk9EPLr73f2r6ZNY+DgQygiWibDhPyxgAwwicvnd4jqBw
         mA1Q==
X-Gm-Message-State: AGi0PuYEafEgajrlW+Fr8XgIziqn+Xs4hhphp1LXxA8UlvKam94tZ4S1
        thfHrBPA6XpMVnAsksEli9JRkw==
X-Google-Smtp-Source: APiQypKV+Y/OjUeg8G20v03d/FoUTGa1xDhXfJWs1qQga0pjoK9gYLJRg52leg1oMHXQf3UY3BC8EQ==
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr30057659wmh.39.1589182882327;
        Mon, 11 May 2020 00:41:22 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id y70sm26799304wmc.36.2020.05.11.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 00:41:21 -0700 (PDT)
Date:   Mon, 11 May 2020 08:41:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: max77620: Use single-byte writes on MAX77620
Message-ID: <20200511074120.GB3548@dell>
References: <20200417170913.2552327-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417170913.2552327-1-thierry.reding@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 17 Apr 2020, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> The MAX77620 doesn't support bulk writes, so make sure the regmap code
> breaks bulk writes into multiple single-byte writes.
> 
> Note that this is mostly cosmetic because currently only the RTC sub-
> driver uses bulk writes and the RTC driver ends up using a different
> regmap on the MAX77620 anyway. However, it seems like a good idea to
> make this change now in order to avoid running into issues if bulk
> writes are ever used by other sub-drivers sometime down the road.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/mfd/max77620.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
