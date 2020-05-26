Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144EC1CE2AD
	for <lists+linux-tegra@lfdr.de>; Mon, 11 May 2020 20:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731188AbgEKS1k (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 May 2020 14:27:40 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43149 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731176AbgEKS1j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 May 2020 14:27:39 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so15937987oih.10;
        Mon, 11 May 2020 11:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8UqBS1lQR2q+XxDhxu6aNZ/bIhX5PHWACaiv6Dgd2LQ=;
        b=YbHcgpDdJs5V45uRHYQDmKiW9LuZ5J7XKTLr5zolG5vbG2mWZISHY5pWw19EI8FoSP
         X4Lj0qzDBC9iUdWNDJFeOkpHI461f8sH/BFvYefyz7xQLIw4czlvWNmVk2gA7/1U12kv
         6oezpghRUpL/1ANP1hHbO09D8EqJoATZ9JWxZynjELgdg+7IbaEmZLde7bfS4Y8tHpzB
         j5tW4PZ/kRTYv0trpgddIF90EvCwqGJp08YD4fHtTJD/QkRD63aaxP/NaQMVg22ki/Zi
         L6mwP74FOcxAp2lM769MC/WWq6E51/f3u+fXXdMXsmCNQFRG8Oz5bTzLqq9SWhB0NQQF
         qO4Q==
X-Gm-Message-State: AGi0PubTgzysPV3v8gJN0rTW4BdPaLyKIdo5dMgg8v1+ouZSp6Flpke3
        i3ryUmxs6B7u28IAwJGnNA==
X-Google-Smtp-Source: APiQypK6P/hEdy6mo2ATCuUvZ14EVXN/An88waBSg+NBZOfZZiZiojO0qq3eBtkwOGsdP9sQoPEKeg==
X-Received: by 2002:aca:4ac3:: with SMTP id x186mr11881071oia.81.1589221658261;
        Mon, 11 May 2020 11:27:38 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v27sm2942183oov.14.2020.05.11.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:27:37 -0700 (PDT)
Received: (nullmailer pid 18590 invoked by uid 1000);
        Mon, 11 May 2020 17:17:43 -0000
Date:   Mon, 11 May 2020 12:17:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] memory: tegra: EMC scaling is not a clock provider
Message-ID: <20200511171743.GA16850@bogus>
References: <20200506123236.7463-1-geert+renesas@glider.be>
 <20200507200718.GD2981633@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507200718.GD2981633@ulmo>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 07, 2020 at 10:07:18PM +0200, Thierry Reding wrote:
> On Wed, May 06, 2020 at 02:32:34PM +0200, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > The Tegra EMC scaling support code is not a clock provider, but merely a
> > clock consumer, and thus does not need to include
> > <linux/clk-provider.h>.
> > 
> > However, drivers/memory/tegra/tegra210-emc-table.c relies on
> > tegra210-emc.h to include <linux/of.h> through <linux/clk-provider.h>.
> > Hence the first patch makes <linux/of_reserved_mem.h> self-contained
> > first.
> > 
> > Thanks for your comments!
> > 
> > Geert Uytterhoeven (2):
> >   of: Make <linux/of_reserved_mem.h> self-contained
> >   memory: tegra: Drop <linux/clk-provider.h>
> > 
> >  drivers/memory/tegra/tegra210-emc-core.c | 1 -
> >  drivers/memory/tegra/tegra210-emc.h      | 1 -
> >  include/linux/of_reserved_mem.h          | 1 +
> >  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> Ah... I should've read the cover letter first. Looks like I need to take
> that first patch through the Tegra tree as well to avoid introducing the
> build error in the second patch.
> 
> Rob, do you mind if I pick up patch 1 of this into the same OF branch
> that I already carry the memory-region-names patches on?

No, it's fine.

Acked-by: Rob Herring <robh@kernel.org>
