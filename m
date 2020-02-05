Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4195F1535F6
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgBERLg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:11:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36172 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBERLf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:11:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so3700406wru.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xcrHDAezSaTXU9W0CiG8B79nhRicq7n5xdAIP7nXKmc=;
        b=IuDQ8sm2ZLcPoza2tVFcOfFt6nFJhGJerML1eDTgjQgcs7cn8iXtizKtqOCERM5pCP
         N73C4kgDl9s+t6CMD5VWfBAj212FEMtyaN0WA5/E8J9Z9D60o6SkpYZGfFGKTXgMHiQg
         0n0Zey6kQBJ2+qSIR1RkAOlPTvYQCxGu3fkqbskDL+SoOZoZimgPwxUcNQxcO2cGqaFg
         sojMh9akGHrC1Kr80JOcc3Bt2hsyvmTA9PEIBkcp58UmK+lmH4TAhvtS+IRJwf+FRARX
         kSVphT6IiRNtQq/W2tUqah+nhhdD81ccj9qvWQ+y6+SVHw8jKmZkgID6LAqjLulYlrSo
         7ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xcrHDAezSaTXU9W0CiG8B79nhRicq7n5xdAIP7nXKmc=;
        b=h9mIoFl/DIkNqsEbTwiZMPEfBW7IwAN5uOIhGUMQMqwLo4Odar1peVXv4wAAk1//nE
         Y1BSzJ0J0PMxAnGX5sDIkoaAI85CONN6lU2Q8dXvS3NHZT75sn1aVSzVhsMNRZjyZxB6
         +dvzBDpPWiTNS0tncRXpqF3CTyQdrxLIpvZP5shRVCZwkZCVf16tBPgyHq35L+KYqUFC
         KB/lV2+vtfpLSWnKvWseQ2rrM4TUsVCHjY4QXZ5q9dH8FhuMxZDTJGkX6UrEHWjM4aRa
         1M4ijJzRPDj6RtsKWsewYxPlmT7oCPuenrp/pwEdQt1vpeW1YuVy/AP3B/5yFRvZtBaZ
         sqRA==
X-Gm-Message-State: APjAAAW1IevlXX53FrVlYKRpVSr96j9kgcMCUt+Z9onRKU9GF6H3nQbG
        xOWS/pDwBDaU6G4yOHdvX88=
X-Google-Smtp-Source: APXvYqxQIGvcAQBR135Kh2tZ/tyHP6cP9ISDXOJJKhVvMoJ3x4d19nmSKRseWEEmuMOJqwR/5sdBXA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr31421393wru.57.1580922693067;
        Wed, 05 Feb 2020 09:11:33 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id s139sm222055wme.35.2020.02.05.09.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:11:32 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20898e15-5120-c7cb-4234-18dce8c317f3@gmail.com>
Date:   Wed, 5 Feb 2020 20:11:31 +0300
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
> ---
>  drivers/gpu/drm/tegra/drm.c | 49 ++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 17 deletions(-)

Tested-by: Dmitry Osipenko <digetx@gmail.com>
