Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D95A415363E
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgBERTs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:19:48 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54402 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgBERTs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:19:48 -0500
Received: by mail-wm1-f68.google.com with SMTP id g1so3334616wmh.4
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ex6QL9IQc00cprlqfypdFG6mGmc5LLHkyyGwInJDeD8=;
        b=tU+0v+ngKvKZCtJJ84RqD1ZU0TiVG0jGJ71neqmfpgeoJ0YN80Lc5FBdK0eSwi3oBQ
         Vg//7UrZQPfezFrZherus6aXORrEYtZdxaGPA3rC/nfu2TGbpyKRLYDQHBkqItVR44u8
         jZ642auf1Ky5UKCmq8aLsChuWS7V7HcClwjubEUNr1gWgS/pgZi6KZ2akNLqqNxMjgzv
         k6yOxG3d81RnKTge1wido5OWuGVc95DCSxFTzKU+IiQkbHWncxAPGkHlzJGzu241hpN1
         W++xNpV35OAqfR2ra1xaz0xpJ8Mf/vOMt++Vcvh4jw9oyulv/avCGniYcevqVPVy6pvL
         GIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ex6QL9IQc00cprlqfypdFG6mGmc5LLHkyyGwInJDeD8=;
        b=InTSP2MOuMbhlgUtt/23GJv9C0wyCqqlbHaww9s1G/gppGwJcEvsxNnVlVHKwYqELv
         Jvwi0CTr7QR2l55g4g88M4txwNLXizdyE4gWPXcfBtkux6hqxVxXOUvrW6xtXp5cjG9H
         KrwBktBjQzD4Ah0maEuBvZ1KNKxSOxcwR/aTmogC/WRh3js4DdV+PWxlAYD9QiDLQ/wq
         79g6dO7BoOL3nffYQgET7rS+s0nSFIW9eN7Aio+Z/tl6xa+ePiA9DnkN+Rg+fPq1sj2C
         WqDaOI2lYjNO3b2STe2RR2BvJtit76apVZ3SzusJcYJzlHHGwa9ppfJntvXKh+hpFhpz
         /xHQ==
X-Gm-Message-State: APjAAAUxkFWjjNvsrqEV5VY3Zdnc4DRdAe5L4TbM/9uWgsEV+1LqVbtT
        qO1b08zrt4r/BzlRoU9vBEE=
X-Google-Smtp-Source: APXvYqzaveCUjjthPP/xQP9AvaAIXBz0NzCkUGwSTDItKsIpucKUoHbQX87edIKQiToXexncNFfIrQ==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr6593360wmi.17.1580923185855;
        Wed, 05 Feb 2020 09:19:45 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y12sm291334wmj.6.2020.02.05.09.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:19:45 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9cb5fc84-f03a-53d9-578d-a4c1589c1009@gmail.com>
Date:   Wed, 5 Feb 2020 20:19:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Older Tegra devices only allow addressing 32 bits of memory, so whether
> or not the host1x is attached to an IOMMU doesn't matter. host1x IOMMU
> attachment is only needed on devices that can address memory beyond the
> 32-bit boundary and where the host1x doesn't support the wide GATHER
> opcode that allows it to access buffers at higher addresses.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This needs a stable tag:

Cc: <stable@vger.kernel.org> # v5.5

> ---
>  drivers/gpu/drm/tegra/drm.c | 49 ++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 17 deletions(-)

Otherwise,

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
