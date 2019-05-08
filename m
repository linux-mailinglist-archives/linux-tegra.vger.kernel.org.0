Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A45178AD
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 13:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbfEHLqh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 07:46:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42583 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbfEHLqg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 07:46:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id l2so26806754wrb.9
        for <linux-tegra@vger.kernel.org>; Wed, 08 May 2019 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lK+3d8MZJN2On8NKOvom0NUSbRl8X6Lpwh3/QgozcSY=;
        b=y0v+w5FIAHTdurnw1cu21WfiHPivffquh0+KrSW6le6nkERrm9NKmrnahP31aohamW
         neHYaTTGIIkmExwmWa+gD3umpWWkchdDSiQy6jOovdx05tUeolkyyQeTVkoR0FNkZ0hH
         PmsZenZyFUPQmT+DXEK/Flf9HkeSOUOKEoGkbmzVU0dlDgCUJ8w8dO9ZzwOeAHJV3lXM
         g8siYiM9erVdB3N0YSEWiyQRV2g0kCgOyLkCkVY12E9Eh+1YfGJQuKUDI7J+isUY7rwW
         PXapOmShKa6kW6agO8zYODBXVUpVAz+pOjy6T5HNDQ7oY9UitqRg6lVidYZULsged7R3
         YQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lK+3d8MZJN2On8NKOvom0NUSbRl8X6Lpwh3/QgozcSY=;
        b=lfuVeZ1xRJPg8VnDIlDg7wzGxcMya6qqE3uwYC9MUD6FX5bsHZ9ofU8CnOWq+MEgkL
         aD/J68uQXpLLd3swDdJWKDXQDNoY1yYJ2wRk3Q12k1g/FbXJNz3UEV033ZB49ZCuABSu
         b2rZOarA+rwwiES4fuiZsFS7wAATFMH3HkTa0BOwlUHvR8KewCKaCS5IsFO1+tXp5akd
         S9TpBe9WheLmmbGrXmCNkwls4/9vwK3w75GKnp3LhMx1zyjC9ydxtpE+qBFSEe7+gOsM
         i4cKBma8iJ8d91Ns/lbxL3k3lHk6fXDHkGHe0YPvkg0REk9K0WthtF1Rc9ecckwK54St
         lKbg==
X-Gm-Message-State: APjAAAWe7mWQNDfxMqqWoYQ6zjwvpH6AwaApK8cz/r2JCLtAc+DWx0kL
        rLwltuexygxx1ZOWtSJK7PKHpA==
X-Google-Smtp-Source: APXvYqxKVFGte1Ew/V9TgW7FVFiVCw5/xNDNFvhTQ0pVkzuMo+L/aM3TAKIf67yeB5PnQmk8Wjjc0w==
X-Received: by 2002:adf:fa03:: with SMTP id m3mr4846442wrr.323.1557315995272;
        Wed, 08 May 2019 04:46:35 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id a125sm3450734wmc.47.2019.05.08.04.46.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:46:34 -0700 (PDT)
Date:   Wed, 8 May 2019 12:46:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mallikarjun Kasoju <mkasoju@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: mfd: max77620: Add
 system-power-controller property
Message-ID: <20190508114633.GI31645@dell>
References: <20190505154325.30026-1-digetx@gmail.com>
 <20190505154325.30026-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190505154325.30026-3-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 05 May 2019, Dmitry Osipenko wrote:

> Document new generic property that designates the PMIC as the system's
> power controller.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
