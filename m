Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8382E1AADFA
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 18:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415761AbgDOQYy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 12:24:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33060 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415759AbgDOQYw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 12:24:52 -0400
Received: by mail-ot1-f66.google.com with SMTP id j26so524770ots.0;
        Wed, 15 Apr 2020 09:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s8Zpy7lNG4jWfwpFYAsM0x9AqOkd/hZJ5LGUrbOO5n4=;
        b=BE+94SeQUvH/Qz75BFFvruM3orcKsJlGMfQFvE/MlY+vzJkHGRvVeX0J5EqGs2vsOy
         9wht7Xdm7GrnGlD/iSOG3sFcRhX/Cz19xOgAZlk7gZejcKTUxCQRJi8y2hJdPWS2p2tK
         my/lWYrMAEkOAlI4LkwM++A76QUvmnWLHh+qRo1QKk2tUvE51dBCHLLl2bPrpcPMVkBe
         I+geHB2yeaS9ABuAKFFS5tDMAkLufqG/xznkP9y85CA1sMd8tsLEmLOwAby8OEjRGhTh
         9WSzbxFkF1n/YTPN3LzhPj+7XrCzeQPvYHqm3dXlGRCBly3fYE1+9/c1949fYmYc7zIv
         n+yA==
X-Gm-Message-State: AGi0PuY9c+lCeHhfoy3QFSkjUC+PpCTfrlTht2893+ysPWh3uTb0imVr
        4rqfel3Dgu21tOBJDUlNMQ==
X-Google-Smtp-Source: APiQypJAsLyxcP4+sKsLlWhXU12d1z5YBzYdSqPCudaS6dtH2OtG+hAk5XL/zYYtRbtvjFPC3fUEYQ==
X-Received: by 2002:a9d:23e2:: with SMTP id t89mr2623676otb.316.1586967891178;
        Wed, 15 Apr 2020 09:24:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o204sm6413412oib.12.2020.04.15.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:24:50 -0700 (PDT)
Received: (nullmailer pid 1884 invoked by uid 1000);
        Wed, 15 Apr 2020 16:24:49 -0000
Date:   Wed, 15 Apr 2020 11:24:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/14] of: reserved-memory: Support lookup of regions
 by name
Message-ID: <20200415162449.GA1842@bogus>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409175238.3586487-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu,  9 Apr 2020 19:52:26 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add support for looking up memory regions by name. This looks up the
> given name in the newly introduced memory-region-names property and
> returns the memory region at the corresponding index in the memory-
> region(s) property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/of/of_reserved_mem.c    | 19 +++++++++++++++++++
>  include/linux/of_reserved_mem.h | 11 +++++++++++
>  2 files changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
