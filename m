Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D648DC39B
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Oct 2019 13:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408458AbfJRLFW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Oct 2019 07:05:22 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38014 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfJRLFW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Oct 2019 07:05:22 -0400
Received: by mail-lf1-f65.google.com with SMTP id q28so1120002lfa.5
        for <linux-tegra@vger.kernel.org>; Fri, 18 Oct 2019 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1Cn1hU5yCQ6xCe+ib7juhWIPuz2TbnyYwQLFnP7/FrE=;
        b=uFvxikpwj0BfMnSMrfrpscUXZtvf3lZAVCwfcvTLR8I2RgM43KRZ81TAIIEstqBXiM
         sFViuhGSc07KyRVpATVY2KZjc1N7dAb9NZDlq85pgcvc03huskAxyUD1UVbw1IlEbJ6B
         vLc2b6xTsZ/GdmG7aaANosTxvWBIWH43mqvxEtqjQYAGZCBMRhfIJsDsDL0w3cBwj6rC
         6vO0tH5PDAjBtgdBrzrZC98hBeZratEi8uHAx0dEg2gRefgOCBh+bzEEvupzvF2SuG6q
         Bid6bKU7z3e2WHHFkBG/oHYklh/ABqeVooVxYcG+EwzSS2WhTtcFnENOmb+4px799AKW
         U+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1Cn1hU5yCQ6xCe+ib7juhWIPuz2TbnyYwQLFnP7/FrE=;
        b=sihTZTid5f8+9lVz1znDXbJ/hMs0u9VY03g2bm4sP6GlCqrqxBwdSiYXlXMo0pfpH/
         waTBEKKivP96/m0GCL6h2Zzm7dbsVeKeNUmvTfhsHjmY1qbdmfXfHizmObr2n2mVxeZ0
         jTKQySQJFWY4ITg2OjuEhDa+0XiuuEF+bbwbxvdJVeffJIXra5ZHgM7DMtXTuPix1aoz
         V2p8UMln+qXckNQ1fbp7mAbvd4TDpROo7ZXrQ6Kjd/fRdkcmvU7f3UV8L1ydM49HS6Cg
         Qb4AHT5IVnZheLaUDdTHEPUtW+ud5q3TpgTFVDGjNWywL9c6AGLrCQvZoT8y6nXnrbuU
         GArw==
X-Gm-Message-State: APjAAAVdqlScLBIoeymCqAOKmN+NkB4BfDQd8XcjQcISRsBL/zeHIdFb
        4YSRRr4eXchKzTMutu/X6A4=
X-Google-Smtp-Source: APXvYqzVpdRJAYbdEU1nQWgzPyhExNcqFHwC05v2PtU2LxoNPX7L1BbH614yQC4uFDjd+cpsjQ6qKA==
X-Received: by 2002:a19:22d3:: with SMTP id i202mr5636924lfi.69.1571396718903;
        Fri, 18 Oct 2019 04:05:18 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id i17sm3227263lfj.35.2019.10.18.04.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 04:05:18 -0700 (PDT)
Subject: Re: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191014125049.425101-1-thierry.reding@gmail.com>
 <20191014125049.425101-11-thierry.reding@gmail.com>
 <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Message-ID: <f65853be-6a65-3c78-e832-df650bf10a55@gmail.com>
Date:   Fri, 18 Oct 2019 14:05:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.10.2019 18:33, Dmitry Osipenko пишет:
> 14.10.2019 15:50, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Handling of the IOMMU group attachment is common to all clients, so move
>> the group into the client to simplify code.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c   |  9 ++++-----
>>  drivers/gpu/drm/tegra/dc.h   |  2 --
>>  drivers/gpu/drm/tegra/drm.c  | 22 +++++++++++-----------
>>  drivers/gpu/drm/tegra/drm.h  |  6 ++----
>>  drivers/gpu/drm/tegra/gr2d.c | 10 ++++------
>>  drivers/gpu/drm/tegra/gr3d.c | 10 ++++------
>>  drivers/gpu/drm/tegra/vic.c  | 10 ++++------
>>  include/linux/host1x.h       |  2 ++
>>  8 files changed, 31 insertions(+), 40 deletions(-)
> 
> Hello Thierry,
> 
> Is there any chance that you could pick up these patches [0] and rebase
> yours series on top of them?
> 
> [0] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=115608
> 

I want to clarify that the reason of my request is that "Fix 2d and 3d
clients detaching from IOMMU domain" patch won't be backportable if I'll
rebase my patches on top this series and it looks to me that it won't be
the least to fix the bug.
