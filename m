Return-Path: <linux-tegra+bounces-368-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C3881DC97
	for <lists+linux-tegra@lfdr.de>; Sun, 24 Dec 2023 22:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47AC81F21697
	for <lists+linux-tegra@lfdr.de>; Sun, 24 Dec 2023 21:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19005EAFD;
	Sun, 24 Dec 2023 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lpeOmy6f"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47CFC11
	for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 21:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-35ffc781b3bso58525ab.1
        for <linux-tegra@vger.kernel.org>; Sun, 24 Dec 2023 13:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703453815; x=1704058615; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Os/oPiSZBtjIUvvwHAsDtB34DNNtYdnH9WgDGcFTsds=;
        b=lpeOmy6fVte6owUnWSfD/fUM9I0bR5k1938WxLeIibW0a3Rybp3wq+x3++mro9kkiF
         bg5a7xrpzWEeFvYsu2gQh13pNDeaBnVoejjFdf07B8ppfHU85oB0MuXlZYm1tJo2XV4H
         dco2tXX5yKWfojlyFuN+TiUmDiLBg2Y9wtIDvQFYKLauqqhZ3hBOqrw/IOSepv6BnTr/
         /fCJLw2blyW0X/Jy8AJx7NbKM2jPXYmLM4S4XkeAVsWKdW2TtVjIy9Ti+8IAxqMq2xZ5
         t6qjgYMnzPgjK4ddbEWSCGzz7DnDvJvNOZbFASGhEUDoAFOCna7qO3ci7l5dwhljMeoU
         /bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703453815; x=1704058615;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Os/oPiSZBtjIUvvwHAsDtB34DNNtYdnH9WgDGcFTsds=;
        b=RzNd38W9yK/nDNxNWd9kdttOsLzGv0WO1ngtI+WYjKTJimiqvmRmJsRXbsfiqNZCr7
         kRWtEdEkBi7fkHvrUF1MhzKXfMR0K+oAGvXdpL/sHI9A6Pfo8f+WRFtvU+P+3caQH7Ej
         a7oaPPVI7O7jUAUK7c1HkT1sF2SrkKHSw+tWJV/8wguRDS0JlbKzvrEKWCqH5f7bwA+R
         ZgTpaT6pS97Q0hgUywM/Jm/0g6NeIGeoNosQInsSWhwFAIPAvGL0RrcFOmrxd/AEb8T/
         aCdFmcOJMxN/WKr12DDMDa+CJWybKDMRPiY06xSBFx48/bmq0pWtgKcNQRKnjiIs9jFW
         ELKQ==
X-Gm-Message-State: AOJu0YxPrKQosTFiL3Ax5z3zdW2YldilGQc+oho5Hn8eLTt8JPcRAjuw
	p7EPIo0FyUi8j7IJRAyhHlSbzSdRagLn
X-Google-Smtp-Source: AGHT+IH2zcpLJWPKD+BeBsfBapGRJ4delpEMsonOf6psnFmaNZJ7wb6YGlKK2PGLdTvnRk1ktYgw3w==
X-Received: by 2002:a92:ca8b:0:b0:35f:65d8:dd50 with SMTP id t11-20020a92ca8b000000b0035f65d8dd50mr389199ilo.18.1703453814883;
        Sun, 24 Dec 2023 13:36:54 -0800 (PST)
Received: from [2620:0:1008:15:c723:e11e:854b:ac88] ([2620:0:1008:15:c723:e11e:854b:ac88])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001d0ce267eaesm6915344plr.250.2023.12.24.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 13:36:54 -0800 (PST)
Date: Sun, 24 Dec 2023 13:36:53 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
    asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
    cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
    dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 04/10] iommu/io-pgtable-dart: use page allocation
 function provided by iommu-pages.h
In-Reply-To: <20231130201504.2322355-5-pasha.tatashin@soleen.com>
Message-ID: <0db8fdb5-26ee-5069-30d2-118595516926@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-5-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> Convert iommu/io-pgtable-dart.c to use the new page allocation functions
> provided in iommu-pages.h.
> 

... and remove unnecessary struct io_pgtable_cfg formal to 
__dart_alloc_pages() while there :)

> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Reviewed-by: Janne Grunau <j@jannau.net>

Acked-by: David Rientjes <rientjes@google.com>

