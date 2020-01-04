Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9D61304DB
	for <lists+linux-tegra@lfdr.de>; Sat,  4 Jan 2020 23:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgADWEr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 4 Jan 2020 17:04:47 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:36985 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADWEr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Jan 2020 17:04:47 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so14457700ioc.4
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jan 2020 14:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P9KYy5rXT1YHxu2ntjIRtLSaQMqlhK4uAwxwZ9CTSeA=;
        b=M4ojvpJsWZdwC+JXKZGu7dpF7tG1Qlu7PoSXP0bUc8liKQxSUMohy1DszZoCSGZ+DG
         Jv8UpXC/Ot4TgemiYwFvpJZveElUpOqka/n8PzyVGKQhFRlSjg8aPDHMDTjLoOK6R6wr
         asNBJv/zApBOxByKNvHbVvHpCFUbSg8x6lXPYpWKZiZF3TIvfHgsZrIhRhOvYL6peGJ7
         Otx463NGyvyR5YrPT42CKhASR+h6wpwXE5KNWYci8PjXQWl3p6/8CKHRNI8aGbSQ3Diz
         Hf+OWCVEa7FBnt2c1JxNBexxFbF7Y38keIYhDWvKIKUIyYDfBEmAi81VtmWnKHA6c9nr
         hS3w==
X-Gm-Message-State: APjAAAWDG3MRBgd7za4jLb8fYpDKUF5rh7UkTu1QVsnd7oUyHOAKhUue
        L+ONR188Nup8+KFdYoqyG30uEr8=
X-Google-Smtp-Source: APXvYqxPQLdU0GnVUEH3Br5+9UZpU0vgtuWMn8+W9lXHcEuY4b8VtbjuXwSarOsupHVuf8PjQ/ZQuQ==
X-Received: by 2002:a02:780f:: with SMTP id p15mr74044319jac.91.1578175486046;
        Sat, 04 Jan 2020 14:04:46 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id c3sm15911323ioc.63.2020.01.04.14.04.44
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 14:04:45 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 15:04:42 -0700
Date:   Sat, 4 Jan 2020 15:04:42 -0700
From:   Rob Herring <robh@kernel.org>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        andrew.murray@arm.com, kishon@ti.com,
        gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, vidyas@nvidia.com,
        sagar.tv@gmail.com
Subject: Re: [PATCH V2 2/5] dt-bindings: PCI: tegra: Add DT support for PCIe
 EP nodes in Tegra194
Message-ID: <20200104220442.GA11478@bogus>
References: <20200103124404.20662-1-vidyas@nvidia.com>
 <20200103124404.20662-3-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103124404.20662-3-vidyas@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 3 Jan 2020 18:14:01 +0530, Vidya Sagar wrote:
> Add support for PCIe controllers that can operate in endpoint mode
> in Tegra194.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V2:
> * Addressed Thierry's review comments
> * Merged EP specific information from tegra194-pcie-ep.txt to tegra194-pcie.txt itself
> * Started using the standard 'reset-gpios' for PERST GPIO
> * Added 'nvidia,refclk-select-gpios' to enable REFCLK signals
> 
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 125 ++++++++++++++----
>  1 file changed, 99 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
