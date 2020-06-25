Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B9E20A861
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 00:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404332AbgFYWry (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 18:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403795AbgFYWrx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 18:47:53 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC35CC08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 15:47:52 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u25so4121784lfm.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 15:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C4vrGywFSXvGLVoOss5hU28tEX4KZdVDOtq3n+dB2dc=;
        b=TSe5FwAqquY2gAjRl1KrSZ7igP7mNtiIVOuWjnXnZZMPF0k5TjmHtZn24t5OZuAaJ/
         vGKqZKRgtyDjOPot8FJx4LAIm4xyu5/8eMsB2Up2pE5w+cSnBCXgmZWPNp0JatBduk6d
         skpVkVQ5eQY75vrblIsNa7imNRJYpUj3vFvsR4YSKUsRT/hfcI5PrFb3avOV3gm5lop5
         AknFehxKoAgiP5TRSB4+P/+Uo7J8k0xMfc9wg6jsTse3bF1a7+cskhSNFHMIgObPwnhV
         IQRpTzg8wMWAELa9uap3hvagGROhGpeYCkSQOYUoe/s7nBsubteAvy4+pLmcIRNpxMnV
         xIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C4vrGywFSXvGLVoOss5hU28tEX4KZdVDOtq3n+dB2dc=;
        b=Su8HZkLvhbiJ91DRg6WAAb91wJ+yES7Au5xKr/YZg5PnIo98sgY9CwkS+r6j5DW8cc
         81sycvyphn/7Lra3coaZp9IemI33hTp9gyjb3GtupFoHBq7UT28UehWxsYf5sylo4LMa
         dhXUw6Nqxy/Hug/wYr6ZdtkoslRBXzyXtRZ9jZb58iC+VZIHd0fLeeGDBwlsqfXJl4Qv
         94miwaaiogWN5EppPanBEpnWunOKR3BqyoRcCBXreGFW9o4d2OWJqG8l7hnPwMcjcO75
         v8E768xsBtNQdkf9Qnr/lray1e5hyHRK0NZUAJV/+72Zw5xXcaPsOlrCzZ6/B+C+WIzq
         zPNw==
X-Gm-Message-State: AOAM5310ZKEEwsPigsYrFsQdAO9/f/fViu62ppPAa/yESzYXWXfkn08t
        n0snzPcrq5qpvE84bSrJk48=
X-Google-Smtp-Source: ABdhPJyQAh4jIqAraYem2WT7HVJwLp3BcQAOVVikYwcjix7YREyqGXMA62a1zb8hkoobWlBfBqeHKg==
X-Received: by 2002:a19:ccc5:: with SMTP id c188mr145881lfg.163.1593125269067;
        Thu, 25 Jun 2020 15:47:49 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id f12sm5052806ljk.44.2020.06.25.15.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 15:47:48 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
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
Message-ID: <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
Date:   Fri, 26 Jun 2020 01:47:46 +0300
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
> ### DRM_TEGRA_CHANNEL_MAP
> 
> Make memory accessible by the engine while executing work on the channel.
> 
> ```
> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
> 
> struct drm_tegra_channel_map {
>         /*
>          * [in] ID of the channel for which to map memory to.
>          */
>         __u32 channel_id;
>         /*
>          * [in] GEM handle of the memory to map.
>          */
>         __u32 handle;
> 
>         /*
>          * [in] Offset in GEM handle of the memory area to map.
>          *
>          * Must be aligned by 4K.
>          */
>         __u64 offset;

Could you please give a use-case example for this partial mapping?

I vaguely recalling that maybe it was me who suggested this in the past..

I kinda see that this could be useful for a case where userspace
allocates a large chunk of memory and then performs sub-allocations in
the userspace driver. But do we have a real-world example for this right
now?

Please see more below.

>         /*
>          * [in] Length of memory area to map in bytes.
>          *
>          * Must be aligned by 4K.
>          */
>         __u64 length;
> 
>         /*
>          * [out] IOVA of mapped memory. Userspace can use this IOVA
>          *   directly to refer to the memory to skip using relocations.
>          *   Only available if hardware memory isolation is enabled.
>          *
>          *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>          */
>         __u64 iova;
> 
>         /*
>          * [out] ID corresponding to the mapped memory to be used for
>          *   relocations or unmapping.
>          */
>         __u32 mapping_id;
>         /*
>          * [in] Flags.
>          */
>         __u32 flags;
> 
>         __u32 reserved[6];
> };

It looks to me that we actually need a bit different thing here.

This MAP IOCTL maps a portion of a GEM and then returns the mapping_id.
And I think we need something more flexible that will allow us to use
GEM handles for the relocation IDs, which should fit nicely with the
DMA-reservations.

What about an IOCTL that wraps GEM into another GEM? We could wrap a
portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP IOCTL.

It could be something like this:

### DRM_TEGRA_BO_WRAP

struct drm_tegra_wrap_bo {
	__u32 bo_handle_wrapped; // out
	__u32 bo_handle;         // in
	__u64 offset;
	__u64 length;
};

### DRM_TEGRA_CHANNEL_MAP

struct drm_tegra_channel_map {
        __u32 channels_mask;
	__u32 mapping_id;
        __u32 bo_handle;
        __u32 flags;
        __u64 iova;
};

===

This allows multiple mapping_ids to have the same backing GEM, so the
mapping_id could be resolved into a BO during of job's submission for
the DMA-reservations handling.

Also:

  1. Maybe the WRAP IOCTL could be a generic GEM IOCTL?

  2. I guess we could start easy without the WRAP IOCTL and
     add it later on once there will be a real-world need.
