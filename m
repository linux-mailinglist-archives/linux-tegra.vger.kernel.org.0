Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4811535F5
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgBERLa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:11:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35462 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBERLa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:11:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so3757039wmb.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c3yHxHXOFvWJiYAgSKuZerQDF45N4Lz8/Qbl2P6sbW0=;
        b=qwjJhJxVvKxtdGtAoKzW+6g8gLPLQUt2TmhsLh3m3WlQhgLL3c+UjLqKaXByqQcO7U
         92hS5deCJj20Xq7Ortj92OD0nAhXwiTCuOqY66A0MgTtBJjGAwmUG3NSoCOqk+mjzuIU
         h68/CnUa7KWfEBD3H6jz2GNmPV3mOlLJ5c7D/Jt3OhylUpeFbDzIhreyC9gbAyspJI68
         nMsWtXU9OZUIkNrtKx7+JXrpYZh2EfVD9PL86HS61GZg5TRVecFPZ54U71oKOcVlfzcT
         OWURlxN6Am/cODdLRpB3ZJar3i/3Lovfk4CnvVpgzU9gjjNfnU3WUv6PyjjcyR5CAOp8
         yJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c3yHxHXOFvWJiYAgSKuZerQDF45N4Lz8/Qbl2P6sbW0=;
        b=A+ja2aunj75DFwMQlnv9reMnCijKXr/obfnFNmXxEk8k+PkbRqcydr9H1FRVwH5sah
         D8AGgpRO4AHbXFR66NTBTAut75G9JSytrmzzRsXdoNMtN8iiMe6CcqTr1ofNPZO9stUV
         ueXKZxSLOouqiKRI3gOklRX5zPNSclUq8SKiOdeAMQjVxC6gmmQpmz0XjxPhz7ZO0R0V
         9l3zjT8eluJMOyyGQIYp2wchqLykO+UysGJm1opCR1xLdMT/MalBxvcIS/Md7MIa1KHe
         XzRKyP30txbC6E8SJTpDQ1V2rsftlA5rNHB9tgiCBis1crh8qpKi2q7k6lLywIo0j/5l
         TUyA==
X-Gm-Message-State: APjAAAWxpRgoWp2vZeOO9kNmxskcjFs1wwAGKbyximL1OQ0gopwwJtcA
        EKW/GHEdhSjFJO1wHK7D+BmWsNPw
X-Google-Smtp-Source: APXvYqyt5fWl1XC4rlumOaIwAet+nh2GPYJgXARxM9v4x72ycfukvTE+TpaVODQpw1Q/vdWL2JmF3w==
X-Received: by 2002:a1c:a752:: with SMTP id q79mr6356428wme.64.1580922687811;
        Wed, 05 Feb 2020 09:11:27 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d22sm218322wmd.39.2020.02.05.09.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:11:27 -0800 (PST)
Subject: Re: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e6520041-f760-a74b-0250-1108e61b899c@gmail.com>
Date:   Wed, 5 Feb 2020 20:11:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
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
> Hi,
> 
> this contains a couple of fixes for a DMA API performance regression
> that was introduced in v5.5 for older Tegra devices. Patches 1 and 2
> will likely have to be backported to v5.5.
> 
> Thierry
> 
> Thierry Reding (3):
>   drm/tegra: Relax IOMMU usage criteria on old Tegra
>   drm/tegra: Reuse IOVA mapping where possible
>   gpu: host1x: Set DMA direction only for DMA-mapped buffer objects
> 
>  drivers/gpu/drm/tegra/drm.c   | 49 +++++++++++++++++++++++------------
>  drivers/gpu/drm/tegra/gem.c   | 10 ++++++-
>  drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++--------------
>  drivers/gpu/host1x/job.c      | 34 +++++++++++++++++++++---
>  4 files changed, 96 insertions(+), 41 deletions(-)

Works on Tegra20 and Tegra30, thank you very much :)
