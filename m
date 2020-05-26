Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E021C608C
	for <lists+linux-tegra@lfdr.de>; Tue,  5 May 2020 21:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgEES76 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 May 2020 14:59:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40278 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgEES76 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 May 2020 14:59:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id i27so2598818ota.7;
        Tue, 05 May 2020 11:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dyq9mrLIg56VCBL+2zAISaEQ9imS4CMmiuffnUM6wnM=;
        b=r7vSjhg0qGye5YUkNs5JFj/UwLR6NTJ7L2ci+H4v5dBr2mpYwRNBfIYq8W54pNF3AS
         hl8jHgPojxUB4vHrhfcu5AtNpAVKnmbkwm1h9FltO7Kdep8lTyYoTucTd7bIFMe3cz52
         Z8bmgQk9HhrJ+QNY10sigF3ZQcsThAKUQa2Agbsb+OHG46LMSF09vkrQAziBifQVkPFC
         YcIJkDuFHbtonDyIi0CQrpsCJySZXb4uwSlzBUsuLc9ixhZppOSVcOztYpp9IR/czLXR
         4dwCh/zRhLEHlkrzZjAfE96CZcS84ET+3QSRW33BK0mlvFVSmYamYA/BgGHVgPmYzst8
         NLtA==
X-Gm-Message-State: AGi0PuZ4CAG1tEOQbI9UMyKqJAKo/Q81C4/evkim4Eermu/eDhrIWQ2C
        h6pm6PTT4EfY8Fj8T6Uow+Qk/f0=
X-Google-Smtp-Source: APiQypJB3l17s1k8pOxERL4EQWyrzfLLgdkc4mgGcqAFGDVuy3Hc+dm2BZpJ7th3DoZKbdYSOcVR+g==
X-Received: by 2002:a9d:2030:: with SMTP id n45mr3068366ota.99.1588705195598;
        Tue, 05 May 2020 11:59:55 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n132sm780007oig.49.2020.05.05.11.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 11:59:55 -0700 (PDT)
Received: (nullmailer pid 6166 invoked by uid 1000);
        Tue, 05 May 2020 18:59:53 -0000
Date:   Tue, 5 May 2020 13:59:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Pedro =?iso-8859-1?Q?=C2ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
Message-ID: <20200505185953.GA6104@bogus>
References: <20200505022517.30523-1-digetx@gmail.com>
 <20200505022517.30523-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505022517.30523-6-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue,  5 May 2020 05:25:16 +0300, Dmitry Osipenko wrote:
> Add a binding for the Tegra30-based ASUS Google Nexus 7 tablet device.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
