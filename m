Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664F9134774
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jan 2020 17:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgAHQPs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jan 2020 11:15:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40800 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgAHQPs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Jan 2020 11:15:48 -0500
Received: by mail-ot1-f67.google.com with SMTP id w21so4095942otj.7
        for <linux-tegra@vger.kernel.org>; Wed, 08 Jan 2020 08:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0DnqajaRB9CjW+Edkai5OQTOGJN4IE2DCdpMlqf4PPI=;
        b=hfe0ED5nfPUryBD1fUhnrfB4kfNE1sRHGRElYhjrKebXrmqd1ZGY150oCQdA71nz8A
         3/nXCCM80hLVccYXWtl2s5i+mxDDwkIGRBDDWcMY81edAVnI/zMjb268RoeFnQTuIcEC
         Vh/0IBBFq9ZjlA0eHowqAcR3xsoOVDZBN6SbzfOiJoyoyTwAOq9vcxPyZcfgcQhj+UJk
         dh0tIWDneO1HoooQnZWzs1QKt5rVJYkoSFIwiziDoMpYp/UThGLoK820HWtien8AwnJ+
         EutpzMxbrD5ECIQ3sSrPWSz/tyBNX/HqkUA53H/3eGSbSP65r3rx7khOCcRg21zRDHe2
         8BWg==
X-Gm-Message-State: APjAAAWHTRZUDkxU5yph0322KSYdu58qHyWF++99MtQv4XZ8pc+KkQzu
        JIte00L3VEgVAeKJXE+ETbr1AQ8=
X-Google-Smtp-Source: APXvYqz1EgFblx5EV9a9dStfF6hgLsUR4hhOUI+CPavgPPsUynqy5UjRoxf/UQr0E7umuYe76cLBQw==
X-Received: by 2002:a9d:4b05:: with SMTP id q5mr4450632otf.174.1578500146904;
        Wed, 08 Jan 2020 08:15:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v26sm1203189oic.32.2020.01.08.08.15.46
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:15:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:15:45 -0600
Date:   Wed, 8 Jan 2020 10:15:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/13] dt-bindings: memory: Add Tegra194 memory
 controller header
Message-ID: <20200108161545.GA10129@bogus>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
 <20191222141035.1649937-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222141035.1649937-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 22 Dec 2019 15:10:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This header contains definitions for the memory controller found on
> NVIDIA Tegra194 SoCs, such as the stream IDs used for the ARM SMMU and
> the IDs used to identify the various memory clients.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra194-mc.h | 410 +++++++++++++++++++++++
>  1 file changed, 410 insertions(+)
>  create mode 100644 include/dt-bindings/memory/tegra194-mc.h
> 

Acked-by: Rob Herring <robh@kernel.org>
