Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B91207DBA
	for <lists+linux-tegra@lfdr.de>; Wed, 24 Jun 2020 22:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388984AbgFXUzb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 16:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387735AbgFXUzb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 16:55:31 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1E6C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 13:55:29 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c21so2027833lfb.3
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uljzMwIMUdV28HeqfJEN+MMwQIO6SPsln7k0ye+kk70=;
        b=ELvHL0QiC5+98ZO5ErWB1f/+OHtBcdQkeit5tV37WfkqwXE+TZZMZQwj7rj+VSUoif
         RNJaiGITgpf0DYbqKzwEwDj634NRbTOaQkGOlLBLlUj/zBAhmEW1kZOazWDJTmQSTb6X
         eTsivmS2y1EMGJ9slMmGcCpAjlqpBVg7v6w0T/KtFTUgon0eB2BcyKRDbeBKBchIa4g1
         JA4E8vVhPpOe90OnRN1Pm8ApLoHSRYd531YWRgCE3B9LgBSJVAfLGYwBSdg9JaUUBbrh
         EN2YK/sf4Px+8zNkFiO995SQvbQFOQCvyHQ2sr2IMPbNulkmAZ0gqQEAL6qFLDWFuJC6
         1zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uljzMwIMUdV28HeqfJEN+MMwQIO6SPsln7k0ye+kk70=;
        b=d8Qe7MWRizePGcgwO31DN6jBcxILUf6aezesEjTjDkOunOsdC+ol9Z78h4VcAlbftb
         eUTypVl0oU8+8WQuxWBMgSWKmXM0uS3rCXxYyB5qK9JUpHj9FyZGFH2N/I3B0Gn8eC/I
         kuApViMogMrLpceHIEceko526g13QxitA7X+wok6Gnkd90Ozcl2KH8SLZoR2ultRY5Fr
         bNexznabozXae4TsnxoIbqEXotEZAV0dDaBAjEUnq83eLvqRvQ2uxaRf9vZ+yafspr8f
         K9CAX6txuww78R7/l0oABGQPpDM2ANAeLXpbRviYfDlJ2kDA/Yjaj/Mns70OFyGc3PY/
         7BHw==
X-Gm-Message-State: AOAM533jMESFeutqSAaK4H6V9GUY9F+TT8NgyRaVMk8+wZluEgHgDaY4
        XDyhyLBMya+KPx6H8+/1xkk=
X-Google-Smtp-Source: ABdhPJzVWOdfyF0uWQM9JarZS964cWaAihuCUlSNH9CqRhSfPvlGgScpS3MEYjHjidLShJmjibfLcw==
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr16783760lfn.182.1593032127070;
        Wed, 24 Jun 2020 13:55:27 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id g7sm3477478lfe.62.2020.06.24.13.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 13:55:26 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <867dea06-8741-82e8-3e26-9a017ad9057a@gmail.com>
Date:   Wed, 24 Jun 2020 23:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
...
> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> Not sure if they are still needed.

Hello Mikko!

A quick comment for the starter. Switching away from the Tegra-specific
GEM IOCTLs to the dma-buf heaps is a such radical change! But I like it!

Previously I was curious about whether we could have multiple CMA
regions (one shared/reusable and other private, for example) for the
Tegra DRM driver and at a quick glance the dma-buf heaps could be a nice
solution that avoids re-inventing a driver-specific things for that.

I'm instantly foreseeing these types of heaps:

1. Large reusable CMA heap.
2. Smaller non-reusable common CMA that could be used when allocation
from a reusable CMA fails. Or vice versa, when we want to reduce the
chance to block for a long time on allocation, for example.
3. Sparse (system) memory heap.

It's the first time I'm looking at the dma-buf heaps and it sounds like
a very nice idea to utilize them!

The https://lkml.org/lkml/2019/11/18/787 says that the system-contiguous
and carveout heaps we not added because they were not needed, but they
will be needed for the Tegra20 drivers and for the case where IOMMU is
disabled. It shouldn't be difficult to add these types of heaps.

I'll continue to examine the dma-buf heaps in a more details.
