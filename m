Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 233E6139CAB
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jan 2020 23:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgAMWfP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jan 2020 17:35:15 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34006 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728961AbgAMWfP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jan 2020 17:35:15 -0500
Received: by mail-ot1-f67.google.com with SMTP id a15so10632359otf.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2020 14:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2aqbv7Gs5aPw45r0A4Glmj6TozevE0VvRNxou586VsA=;
        b=duU/9pRWwi55I9jkZPQ6WVK7GKFLaMBixZexAMaiTeVdPDiGj9zqNiPmpmShP9astt
         mIjjLbvaNIywOK7PYlHJjEuPDgfzKesuLfZ4TfjlEXPKv6HetHM8m421w74Tg8SFj7co
         E+GEWuYGhuFcgL6xM5ixC6fzGL6vWE1Ap3JPFyamxaxcbElGuDwgx8kJvj3zEdSbWtrw
         su3rrCNu575jq2e04Fa6VYBKfBt5WZCHL0C733leK20XdqWL6BEmRou2LL7dQpYEqWpn
         6ZugVWU+9w2cWHIZzneFOQU+wrJsLbTCxDQXGOv7WlNsO39K3dGpdTyfZgWY5ddkFAQe
         YXZA==
X-Gm-Message-State: APjAAAVBWcOtP2KwKJqOOYE6Jp/Bg1d4jXTXuTge+5vWS04v2cb1zqVr
        qoQfIj88yqoIcEscJSYmIsqdm1U=
X-Google-Smtp-Source: APXvYqzS+vbmRJ+4fTnSVxPQgpAT44me5UG223kU591yAsp7PbzFpRWwzoIieShSKQZaQiEpiwxXdw==
X-Received: by 2002:a9d:708f:: with SMTP id l15mr15498112otj.229.1578954914157;
        Mon, 13 Jan 2020 14:35:14 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v23sm3796664otj.61.2020.01.13.14.35.13
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:35:13 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:30:11 -0600
Date:   Mon, 13 Jan 2020 16:30:11 -0600
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
Subject: Re: [PATCH v7 06/21] dt-bindings: tegra: Convert Tegra PMC bindings
 to YAML
Message-ID: <20200113223011.GA18406@bogus>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578457515-3477-7-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 7 Jan 2020 20:25:00 -0800, Sowjanya Komatineni wrote:
> This patch converts text based Tegra PMC bindings document to YAML
> schema for performing dt validation.
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ------------------
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 340 +++++++++++++++++++++
>  2 files changed, 340 insertions(+), 300 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
