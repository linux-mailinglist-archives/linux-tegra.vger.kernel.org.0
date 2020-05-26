Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF9351AADF2
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 18:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415736AbgDOQXi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 12:23:38 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:32925 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1415722AbgDOQXf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 12:23:35 -0400
Received: by mail-ot1-f67.google.com with SMTP id j26so520670ots.0;
        Wed, 15 Apr 2020 09:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dqCaYkT8OVNprkSigyoCp2ZPVsKvgzd87cPbi/J2G4k=;
        b=J2yU4MShL4rNveeXHKhsgxS4XF3cTPNhFRp7fkE8TUtdTc3C1YpK1NKSR9xvshvUee
         Nh3X00x4rbiYuXrTQHbrnCA3cBtUklpt4xe1UuJODyQrIco0CzHmQOGBSbAijIpIlk+4
         0XGS40R5HD3Vvw3B5iH7pDaVwIbKt5BNg8Z5yRNME0ZyW3Fz6BeJNbLEL83OOCbocS/6
         UYycztJwUiH/IyEwLLrNkYRu3IdvylzoMTr2O1fngXL58VaN1DYWCOECsummNq+J4YGH
         xIoZaBUJ7puf8QdbPw9zxjuhNWjHmuUIN1vVoocXX2MWuKSuvKg72MaM0SW8zEOyCp4J
         1IPQ==
X-Gm-Message-State: AGi0Pub4tQjttzItimEiIOv7+BeaBsf/MAmxk86L9zrrxjR5eCZFcIrf
        9I1NVZkIR8VBl7s2L4t3MA==
X-Google-Smtp-Source: APiQypKR1UuoH9e32fZQ9cndTzQaO9IUxQZvKDBEkzyNV7mi2Ii3pK0yWsxcv3mWaq3m8wipHNp1MQ==
X-Received: by 2002:a9d:1b4b:: with SMTP id l69mr13808068otl.179.1586967813963;
        Wed, 15 Apr 2020 09:23:33 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 186sm6865669ooi.30.2020.04.15.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:23:33 -0700 (PDT)
Received: (nullmailer pid 32365 invoked by uid 1000);
        Wed, 15 Apr 2020 16:23:32 -0000
Date:   Wed, 15 Apr 2020 11:23:32 -0500
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
Subject: Re: [PATCH v6 01/14] dt-bindings: reserved-memory: Introduce
 memory-region-names
Message-ID: <20200415162332.GA32297@bogus>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409175238.3586487-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu,  9 Apr 2020 19:52:25 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to make the reserved-memory bindings more consistent with other
> existing bindings, add a memory-region-names property that contains an
> array of strings that name the entries of the memory-region property and
> allows these regions to be looked up by name.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v6:
> - drop addition of memory-regions alias
> 
>  .../devicetree/bindings/reserved-memory/reserved-memory.txt     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
