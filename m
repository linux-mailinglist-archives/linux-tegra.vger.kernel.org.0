Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DA925AEFB
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Sep 2020 17:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgIBPcU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Sep 2020 11:32:20 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34491 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgIBPXZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Sep 2020 11:23:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id q21so5344446edv.1;
        Wed, 02 Sep 2020 08:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F44EDajBvPviYlEA0jAJJoSkCusNo9MYluuMOfOxWLU=;
        b=Vm4UBiiWc6r65Fr3S9oSwoS9IKRrKK9daTUdpL6677aYwKYInPwinNK5IOVv5BaUjM
         6xh4zzh+AHqtDa0j6UHvmU+CNK4EQfJKSGb8N2AGcNExHg33ql0wDJilNUDJcw0Ez8l/
         jhD2XNChZRLRiKtESXIA6SassQSpJpL3OAKD27c5NHXwVAJTuerXjrK3ARiPtXV80X9l
         xsPrtWAL53GfwHZDU1oaXXeZVnjPhPNea7iWMVPQjpNE9oFNF/+Hn8MxpjdlCPBmxsUq
         mcXr1zxShoxQGix5Mnt89ofdZZ30YVQrvtt6T0Nh9QxZTyK6mH6VxRwEFu6EmOrgxO8N
         AtGA==
X-Gm-Message-State: AOAM533U1vx96wxkSZCWIQDZI1tewE1Qqzvqq//jmpUlpVOFEYyDL6T3
        1v7oDzofLctLfE+ItgDyW/EQ//iaWvpdMQ==
X-Google-Smtp-Source: ABdhPJwcIaf0v6xkFM1k0x3N8F3tYYiXoNV0F88TN+IXKED6qPsMiiyEq9fRbbO3sWuXtKXA2Ml7vg==
X-Received: by 2002:aa7:c394:: with SMTP id k20mr537020edq.279.1599060188992;
        Wed, 02 Sep 2020 08:23:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
        by smtp.googlemail.com with ESMTPSA id v7sm5078926edd.48.2020.09.02.08.23.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 08:23:08 -0700 (PDT)
Date:   Wed, 2 Sep 2020 17:23:06 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] memory: tegra186-emc: Simplify with dev_err_probe()
Message-ID: <20200902152306.GB19659@kozik-lap>
References: <20200828153747.22358-1-krzk@kernel.org>
 <20200828153747.22358-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200828153747.22358-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 28, 2020 at 05:37:47PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/tegra/tegra186-emc.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied.

Best regards,
Krzysztof

