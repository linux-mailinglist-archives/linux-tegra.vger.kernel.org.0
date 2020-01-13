Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03A6139C25
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jan 2020 23:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgAMWFW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jan 2020 17:05:22 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34130 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgAMWFV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jan 2020 17:05:21 -0500
Received: by mail-oi1-f193.google.com with SMTP id l136so9896871oig.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2020 14:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TPVDmHPgyswCSzHUpaO4xXgku0uEWmnDxxOITskBC8M=;
        b=jSUadn4eCaXSUu9Ir1HgZTfcwm9ejyoavRUFtcr0bKniX3pbzvfU1WXecHeWxA40pC
         0vC+jT3r3hODgdw3tSgjQZ4Dbbr8LJDhnPPuyuohJuvz7gx/e1kXT31rGz8MdlINoik0
         otojwdTdnzvbX7GcBgeXRESxR59Y2J+P5Wcrzx4q8Rw5PLDOH8DQHROuFhf5FJlXLJI7
         UfKFYg2O6SJbwQTkJjaoB2xrOu+ve6Xy/10nMLgcSdjJPs3ouHRDTEVvlcIcunUMOt3i
         gFAqCSaEvj5AVODfHUijTi53PnNAgsKWvbWX61HHxe2PHpwl18q3ycMYfiwbOTVwtv1H
         Bv1g==
X-Gm-Message-State: APjAAAWa+z41GlPDGi3kcQLdHH614BK+vzSo2E+boCtEsGmCbgLOy81y
        pODBiWLjBx/oZAeQIEI+4zsNVq8=
X-Google-Smtp-Source: APXvYqwkYHHpLAG3VG3R28c0jHOgrQf/SZjKUu/Ix8LUc9h4o5pk6ccovfFeaQ7gVz3sZfqmT+Db8g==
X-Received: by 2002:a54:4396:: with SMTP id u22mr14733464oiv.128.1578953120731;
        Mon, 13 Jan 2020 14:05:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i2sm4580482oth.39.2020.01.13.14.05.20
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:05:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:03:18 -0600
Date:   Mon, 13 Jan 2020 16:03:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     skomatineni@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, digetx@gmail.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/21] dt-bindings: clock: tegra: Add DT id for OSC
 clock
Message-ID: <20200113220318.GA1891@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 7 Jan 2020 20:24:57 -0800, Sowjanya Komatineni wrote:
> OSC is one of the parent for Tegra clocks clk_out_1, clk_out_2, and
> clk_out_3.
> 
> This patch adds DT id for OSC clock to allow parent configuration
> through device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 2 +-
>  include/dt-bindings/clock/tegra124-car-common.h | 2 +-
>  include/dt-bindings/clock/tegra210-car.h        | 2 +-
>  include/dt-bindings/clock/tegra30-car.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
