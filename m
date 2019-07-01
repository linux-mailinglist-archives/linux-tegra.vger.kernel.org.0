Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7554102DF
	for <lists+linux-tegra@lfdr.de>; Wed,  1 May 2019 00:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfD3Wxw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Apr 2019 18:53:52 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36024 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfD3Wxw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Apr 2019 18:53:52 -0400
Received: by mail-ot1-f65.google.com with SMTP id b18so4499619otq.3;
        Tue, 30 Apr 2019 15:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hKiey70LO2aPy29X2HHhJKQjoC6uafr27EEww9xTnQQ=;
        b=DPITdYUFSqnw/Dl3BEW508tAtkf5oA/tAfmdGsVLXYJUz544/ycUMJFqpXiqxRMy+v
         vWHuumRNx8r0qX/dlwgQmDRWlhBW20dDqDjvQNjRwMHK/aZKifqw79GccClsbxtuwWlx
         LO4DP47uklPzXZ2trRVJI4Aa8TMHtQoQXfO232t0hVG69XROa7HBDTQbc4Gd1G16Ko34
         Qy+yHZaYHkL5izZ3FJ/d/PzggiQZjTU2juJpC6QgsAN3bgRGapqr1Qv9xq6sfJB7uDy5
         j/Zp57rhF7lbCaifETblYxKZZiKLR+/UBrwK0gDZ5V1JJ9m3aTtvAGbYYAwnNMMxR1rj
         XZKg==
X-Gm-Message-State: APjAAAVx1sh70oDc3+6w3Zr67SltcTpdDag3vnKyvVyMQdAe77LpFaa4
        oTnh9ivM52EYrJ4qsw+EaA==
X-Google-Smtp-Source: APXvYqwm8s9yTTWau00rsSlH1LATdDmLgmJDFQHW/dPJ230jgkEmBEBx3+IKMZBTGjR7pxAEoeLC0g==
X-Received: by 2002:a9d:73cb:: with SMTP id m11mr13838348otk.223.1556664831165;
        Tue, 30 Apr 2019 15:53:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d63sm16464627oia.55.2019.04.30.15.53.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 15:53:50 -0700 (PDT)
Date:   Tue, 30 Apr 2019 17:53:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mallikarjun Kasoju <mkasoju@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: mfd: max77620: Add compatible for
 Maxim 77663
Message-ID: <20190430225349.GA15733@bogus>
References: <20190424224900.8018-1-digetx@gmail.com>
 <20190424224900.8018-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424224900.8018-5-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 25, 2019 at 01:48:58AM +0300, Dmitry Osipenko wrote:
> Maxim 77663 has a few minor differences in regards to hardware interface
> and available capabilities by comparing it with 77620 and 20024 models,
> hence re-use 77620 device-tree binding for the 77663.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77620.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 9c16d51cc15b..9058499051e0 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -4,7 +4,8 @@ Required properties:
>  -------------------
>  - compatible: Must be one of
>  		"maxim,max77620"
> -		"maxim,max20024".
> +		"maxim,max20024"
> +		"maxim,max77663".

Drop the period so we don't have to remove it on the next addition.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

>  - reg: I2C device address.
>  
>  Optional properties:
> @@ -105,6 +106,7 @@ Optional properties:
>  Here supported time periods by device in microseconds are as follows:
>  MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds.
>  MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
> +MAX77663 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
>  
>  -maxim,power-ok-control: configure map power ok bit
>  			1: Enables POK(Power OK) to control nRST_IO and GPIO1
> -- 
> 2.21.0
> 
