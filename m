Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17F02930F8
	for <lists+linux-tegra@lfdr.de>; Tue, 20 Oct 2020 00:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387926AbgJSWLz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 19 Oct 2020 18:11:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39259 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387925AbgJSWLz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Oct 2020 18:11:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id f10so1336526otb.6;
        Mon, 19 Oct 2020 15:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pMuRP7PwPZH/1QCeF9m+2AemyNEiW+4ppV1kMNUMQ/U=;
        b=Q9Tanuu4tWT/WQga0H49YzbLwLEqnk5ucqg4UldWcCW5hbE/wHsnDeeCmeZCRnK45v
         WyrPDqU3J6rOOs2DV7OeP7/noGoOLPz2XhMVmYVRWavsfNDyfvqZlZwKVwgQQkqQgQ+B
         o2/vVPNtx1dZamnlEESiTG2VbuqW3jGH6EovS57rDUm0cbsbfh18+llR1Buzq0UPhK4P
         efN6ttn8jZQ1L2ErWaxOZCPDNv7b/jqlV75dMR4xAfc+yfr5/qgHOZQaWHvwM3WwaPc5
         5q0odMQeYNyhrV803sWkYoxu+teJ8BEafZlJ+nz3PiSrs1UVAKPlIR7pD3Zam5ifAuGZ
         9UlQ==
X-Gm-Message-State: AOAM532Re0dfzU313lyTbdj7rpSC9UwcbZWRZJbHU+E1D+D7w2uuB8rI
        l8KmHixHL8SPS6BY7fJANQ==
X-Google-Smtp-Source: ABdhPJzhOnt38ZSjVsNhD0vUKJmX6whzxZHUESJU7+2jyu5TxMgWUSeRU0XkpNHzJSgKNWCPDJJCEg==
X-Received: by 2002:a05:6830:1c32:: with SMTP id f18mr1413460ote.276.1603145514519;
        Mon, 19 Oct 2020 15:11:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h6sm266576otr.28.2020.10.19.15.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:11:53 -0700 (PDT)
Received: (nullmailer pid 3689734 invoked by uid 1000);
        Mon, 19 Oct 2020 22:11:53 -0000
Date:   Mon, 19 Oct 2020 17:11:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
        perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com,
        rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com,
        nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com
Subject: Re: [PATCH v4 09/15] ASoC: dt-bindings: audio-graph: Convert
 bindings to json-schema
Message-ID: <20201019221153.GB3679866@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-10-git-send-email-spujar@nvidia.com>
 <87o8kz9blh.wl-kuninori.morimoto.gx@renesas.com>
 <2c9abfd5-f7eb-0b8d-f45f-9f56f37881b5@nvidia.com>
 <87v9f6hlvb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9f6hlvb.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 19, 2020 at 01:41:40PM +0900, Kuninori Morimoto wrote:
> 
> Hi Sameer
> 
> > >> Convert device tree bindings of audio graph card to YAML format. Also
> > >> expose some common definitions which can be used by similar graph based
> > >> audio sound cards.
> > >> 
> > >> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > >> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >> ---
> > > I'm posting this patch to Rob & DT ML.
> > > Not yet accepted, though..
> > 
> > Thanks for letting me know. I guess below is your patch,
> > http://patchwork.ozlabs.org/project/devicetree-bindings/patch/877dtlvsxk.wl-kuninori.morimoto.gx@renesas.com/
> > Do you have plans to resend this or send next revision?
> > 
> > I can drop my patch once yours is merged and refer the same for Tegra
> > audio graph card.
> 
> I'm waiting response from Rob now.
> It is merge window now. I will re-post it without his response
> if -rc1 was released.

Sorry, fell off my radar. Now replied.

Rob
