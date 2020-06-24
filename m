Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2594209666
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 00:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732876AbgFXWdj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 18:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732806AbgFXWdi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 18:33:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB91C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 15:33:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y11so4332963ljm.9
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 15:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KG/mtrHm+0RJMw8Yne2fGydoF9Khahv7CPZC8cAGmJk=;
        b=PQ940pdtwXI16vAQiMnbXtkU3DDWwoh8QOJobJW0fcqFkudVeHYwFgEgyfFy2Y+EBQ
         t2FZUUKyLVBc0ZMfdSOa4GBQaejbvJjyEO/4dm0AUpl6qXk58WpBDYZhScOMBOp0c2mV
         oeaJKk6HmF+rhF3LA+B+jEbQnzAFsgdyaS9rqKzM1bK+3t23ES4yCoy2rMwCrBtm7Nrx
         1cgtjXllfrklEzkFCCdPh9rcZwix1pBZWhQDMQtqrCWK5je9KSTMdbgS0+ngtXoFUP/Y
         yRqkfTvoZHlfs7m1v7dn3j6qmTQRz+vcDOQelkCq262B/cWV5GeDhKpKg6Z1Fqhdbdt6
         8pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KG/mtrHm+0RJMw8Yne2fGydoF9Khahv7CPZC8cAGmJk=;
        b=mkmi3+KMvpGIK7JAxdxbM6bvG5IWyFo0sCLGvsOJPVWG5t1vsyBOFRoioR8TXnq/jr
         5QGl+EI7xJepz5Sj9Ek17Nh70ptwq/mORs1Mx09uS2J4QX1nX8f5UjoPcTHs0cJFhi77
         J+pgH6wwLAQMxVdq6XiU0T3c7iAzp/jah0uJrFpvyxgt6sOpZKsepCFHzj3+sYDkiuPW
         lnmsRQE0YCSZmLxLfGljMkp66fm6ThbH0NmsXOhyty5rUCXJYAe39C+XDUzgscpgzH6X
         xxCkG/05pPo8FBu/3VxMobE7Tt/HLw15GZUmstoMUJKJlM1j7xVU5xZxh2twi1n1SexT
         kZ+Q==
X-Gm-Message-State: AOAM530DdtE7Uq0c/cxRzC9ALEaPj4YxEOVCJ4Ju7RGtCQKfGATiuQit
        Q/sqPMrJ4uoXl8HeVIWiCnE=
X-Google-Smtp-Source: ABdhPJwOvQQdr68T7at/qhl/lY1nDcuRmy9lba8xr/rhBX2NEXtzS8DdzNoFTwT892Lv7brlCDQfAA==
X-Received: by 2002:a2e:b541:: with SMTP id a1mr2747460ljn.4.1593038016740;
        Wed, 24 Jun 2020 15:33:36 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id p15sm4470433ljn.53.2020.06.24.15.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 15:33:36 -0700 (PDT)
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
Message-ID: <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
Date:   Thu, 25 Jun 2020 01:33:34 +0300
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
> struct drm_tegra_submit_relocation {
>         /* [in] Index of GATHER or GATHER_UPTR command in commands. */
>         __u32 gather_command_index;
> 
>         /*
>          * [in] Mapping handle (obtained through CHANNEL_MAP) of the memory
>          *   the address of which will be patched in.
>          */
>         __u32 mapping_id;
> 
>         /*
>          * [in] Offset in the gather that will be patched.
>          */
>         __u64 gather_offset;
> 
>         /*
>          * [in] Offset in target buffer whose paddr/IOVA will be written
>          *   to the gather.
>          */
>         __u64 target_offset;
> 
>         /*
>          * [in] Number of bits the resulting address will be logically
>          *   shifted right before writing to gather.
>          */
>         __u32 shift;
> 
>         __u32 reserved[1];
> };

We will also need read/write direction flag here for the
DMA-reservations set up, it will be used for the implicit BO fencing by
the job's scheduler.
