Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD92134655
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jan 2020 16:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgAHPfr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jan 2020 10:35:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38863 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgAHPfr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Jan 2020 10:35:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id d7so3967441otf.5
        for <linux-tegra@vger.kernel.org>; Wed, 08 Jan 2020 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ueE/KSkeZUf0uuD6X6xsibeFYXRrmenwa9AZKB89yAg=;
        b=U75+I0Aeb7PNnyC9jfRWvluQ6Z7GNsj9XzQtClRF0pz0Uo29Z9TaokKPITsOu1Sv+j
         szCWQeqDn+ejWy7AL20/lfxFOR8pX1r6o9FVvI8axL/iRqY7rWbytrwd0cT3gGhaYMMk
         YmbY8vi5GcInRuayWO0i1JY13DtM343DKR0ZxR4/2W41xOqoBCbLziHHlK097Dg3AAmX
         mnIQaQsqbZ+u3OXSuTapH4ym9QRgXfjWptgHI7vJ/Xd6a2N2cwzA+sJzQKIHiarYjWmI
         6vUZ5TmHi0jnmuCQOnDh7/YVQGdQBaeLfbblxSG63yJjecTwS9/YTU57BaROt6NdBNYL
         ks4w==
X-Gm-Message-State: APjAAAW30f01Zdoms1sjaCZYm9VqFhIebpg2t92QV1Efad7joxDfAOBx
        CX8zLPfAgMfMHMyr7EHO/bJP2ig=
X-Google-Smtp-Source: APXvYqzwhej/eE1QqZI1cICgj1rZMhPSqtU9u1lTY2O5qZhTIcQV+JVBEQO1oBI9IXrp/Xnnpu6B7Q==
X-Received: by 2002:a05:6830:22c6:: with SMTP id q6mr4853238otc.244.1578497746255;
        Wed, 08 Jan 2020 07:35:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n2sm1161975oia.58.2020.01.08.07.35.44
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:35:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 09:35:44 -0600
Date:   Wed, 8 Jan 2020 09:35:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: memory-controller: Convert Tegra124 EMC
 to json-schema
Message-ID: <20200108153544.GA18410@bogus>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
 <20191222113921.1469372-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222113921.1469372-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 22 Dec 2019 12:39:16 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the device tree bindings for the Tegra124 EMC controller to the
> DT schema format using json-schema. While at it, clean up the binding a
> little bit by removing any mention of how RAM code and clock frequency
> are represented in unit-addresses (which they aren't) and by adding the
> EMC clock without which the EMC controller can't change the frequency at
> which the external memory is clocked. While this is technically an ABI
> break (the clock was not required before), this should be fine because
> there isn't much that the EMC driver can do without access to the EMC
> clock.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra124-emc.txt                   | 374 -------------
>  .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
>  2 files changed, 528 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
