Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2344B12547D
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 22:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfLRVTG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 16:19:06 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46693 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfLRVTG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 16:19:06 -0500
Received: by mail-ot1-f68.google.com with SMTP id c22so4149023otj.13;
        Wed, 18 Dec 2019 13:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6i3yUht6VZmzoNOaX8eJ66QZuEfJp5v9+9UU4ybVpg=;
        b=BPiuavSXWe2kkeIpA4Bc5/BUB8/HWp4zgbdZeJ6ffG45ttU+s13h1uuN1CzL6eCXqm
         2cvPxG9WYeHjs538jQqoCKlVRowPfOxPLi/FwWYX17voSYOer0+LwHZbzeFMHx9j9dIn
         cKLUmsA7RwE5eaohUG8uxMkfZIpDE9RS3hghUa0wvK1+l2oo33Knha5HhTpMKJZoRDlr
         xJzuVGu1z2eoZeYZ+i40BSqeGRypZ6UtNosbeD+ZN0SfVcPVqtuSTkVJWw9/AY3CfL14
         74d9F/vuw2/RvDRnc52w8iCRJA71oBzwRdRlf+P+WRFh7j7SYTMLtT3cmOIgVFEOhuF1
         aLfg==
X-Gm-Message-State: APjAAAU7RO2nqtdgyo7BmaKWgKGtEwwA8zLNGIj8l4XfOIk8eVDHjJX0
        H4Rnftsuk03YEgRhoJVJ5A==
X-Google-Smtp-Source: APXvYqzcLzQJCSqsqQnYBN6UNLLQYWI1bzp7P0CM3jCsgq3QyEd+dWVqTYn65T8XaPEUnMSXxRmxFQ==
X-Received: by 2002:a05:6830:22ee:: with SMTP id t14mr4677757otc.236.1576703945628;
        Wed, 18 Dec 2019 13:19:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z21sm1231040oto.52.2019.12.18.13.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 13:19:04 -0800 (PST)
Date:   Wed, 18 Dec 2019 15:19:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     skomatineni@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com,
        gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/19] dt-bindings: clock: tegra: Change CLK_M_DIV to
 OSC_DIV clocks
Message-ID: <20191218211904.GA5303@bogus>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
 <1576613046-17159-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576613046-17159-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 17 Dec 2019 12:03:48 -0800, Sowjanya Komatineni wrote:
> Tegra has no CLK_M_DIV2 and CLK_M_DIV4 clocks and instead it has
> OSC_DIV2 and OSC_DIV4 clocks from OSC pads.
> 
> This patch changes CLK_M_DIV2 and CLK_M_DIV4 clock ids to OSC_DIV2
> and OSC_DIV4 clock ids for Tegra30 through Tegra210.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h        | 4 ++--
>  include/dt-bindings/clock/tegra124-car-common.h | 4 ++--
>  include/dt-bindings/clock/tegra210-car.h        | 4 ++--
>  include/dt-bindings/clock/tegra30-car.h         | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
