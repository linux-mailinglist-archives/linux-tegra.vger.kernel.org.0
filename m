Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B762E12FF9B
	for <lists+linux-tegra@lfdr.de>; Sat,  4 Jan 2020 01:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgADAdp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Jan 2020 19:33:45 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34668 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgADAdo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Jan 2020 19:33:44 -0500
Received: by mail-io1-f68.google.com with SMTP id z193so43103728iof.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jan 2020 16:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jtU2GwA92LWxQFkeCrbjyJNc+9eRgZ+rt7rVVu7gPA=;
        b=uUOWS08EmUFwbxOtc+ycxYFsKvBgwnRfJwWVSZgocYvJ2DrWIvgH3dfRBQa7d7NP/B
         yVdcv0cqlY63PZXDS57ghanXsEAD7HNaDE+hku/Bzz0NhgBocMx0p5nvB/0pYoRVoEw8
         rH2EKFOgD1EJgavHMVJCHPMHbpj57CYt6pS5wezWw9WQy6e++N39QcpJvNpL4enBV7KJ
         N1K3vcNVLa1VQ+zMMTp8iEWmsgMiEjeKw6BjWqW1botff92g0vg7MElwRYvGQEKdsEgh
         TVDLObknh6minIzZ1e8p4xL1wJoJDVNjPu/rUTphE0//rZXEy1JxJKTFf024TvzFfzIV
         KZQA==
X-Gm-Message-State: APjAAAWPTRGjXABQOqZdzTLZiNWGpFPzq6/4G8ORWqT0Miz0cPpXm7HI
        Al/8aYQlYJW0O3RrbH7rZYLiaGI=
X-Google-Smtp-Source: APXvYqyqn9nhvbWAsC8ST/tDkr2ZRUZqQ29oBUm69+eZrcoEn4MRT9pOL4YbcNXxXxdYTp2S1IALJw==
X-Received: by 2002:a05:6638:3:: with SMTP id z3mr71961132jao.65.1578098023919;
        Fri, 03 Jan 2020 16:33:43 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z21sm15303594ioj.21.2020.01.03.16.33.42
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:33:43 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a53
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:33:41 -0700
Date:   Fri, 3 Jan 2020 17:33:41 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/16] dt-binding: usb: ci-hdrc-usb2: Document NVIDIA
 Tegra support
Message-ID: <20200104003341.GA5889@bogus>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228203358.23490-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 28 Dec 2019 23:33:43 +0300, Dmitry Osipenko wrote:
> NVIDIA Tegra SoCs use ChipIdea silicon IP for the USB controllers.
> 
> Acked-by: Peter Chen <peter.chen@nxp.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
