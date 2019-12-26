Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39A7812ADE2
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Dec 2019 19:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLZSRR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 Dec 2019 13:17:17 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:39578 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfLZSRR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Dec 2019 13:17:17 -0500
Received: by mail-il1-f193.google.com with SMTP id x5so20723877ila.6;
        Thu, 26 Dec 2019 10:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=idn95+ZWYyG6h7W6CvDgqkHcYG/FW+FnbauTlYb4rps=;
        b=tftqvR8ZQtUu0Ku0OdIAmaMG5N2Glnd50NJwAz//9ITL4p0B+XOtTuLwIJdAp9onkL
         uPPB2Jlv8N7Vc3J+gExBsBKKqDm/jCmMlBDjj3fv1yYQr1ko83A/RagxVqAr4x6ZgD7Y
         ljHquMHfiph0Cx0xSYkvOKD7TUrhSUXDBuH9Ub3JCqvCTtq0U3Mkl09DrekzYRhn36tT
         9YJn79fcB6gD0Hr9CMZvnwTsRekgiGEN2UkefaDROtxVd26oKo+QExaEwAg5FKg6KcTY
         r0VMbxpMkBrLxP4E08n6EIqH+YK8LiNnAuhpInZ7VYW4HBeKFZhkdkE+4q4kKqUxzH6W
         xjww==
X-Gm-Message-State: APjAAAWWiwRvyKRhc6MyTIQm8kgLSak6/YEnytbtKd5/eEEkX6L8z7tX
        ocQiT0723kfEP77b4zS1og==
X-Google-Smtp-Source: APXvYqw/PMXhHNGBXaITaVAZELOintjsvcqn9FlYkKK3CE5GzqNsYCUJc5zUMO2uAWvI+atZKwyq9w==
X-Received: by 2002:a92:b06:: with SMTP id b6mr38749968ilf.127.1577384236575;
        Thu, 26 Dec 2019 10:17:16 -0800 (PST)
Received: from localhost ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k17sm8813834ioh.64.2019.12.26.10.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 10:17:16 -0800 (PST)
Date:   Thu, 26 Dec 2019 11:17:15 -0700
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
Subject: Re: [PATCH v5 07/19] dt-bindings: soc: tegra-pmc: Add id for Tegra
 PMC 32KHz blink clock
Message-ID: <20191226181715.GA12506@bogus>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-8-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576880825-15010-8-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 20 Dec 2019 14:26:53 -0800, Sowjanya Komatineni wrote:
> Tegra PMC has blink functionality that allows 32KHz clock out to
> blink pin of the Tegra.
> 
> This patch adds id for this blink clock to use for enabling or
> disabling blink output through device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/soc/tegra-pmc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
