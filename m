Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85026D95AB
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 17:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404983AbfJPPd4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 11:33:56 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45997 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfJPPdz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 11:33:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id q64so24470269ljb.12
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HD7cxLp0NK/qYesJFUJ+z6fk+ZOrRl+xLhixqrzwrzE=;
        b=KTPkMoRR1wmuigRJb21l9Ved9LD0Q3iXgrv9FGT6upyD/FgjEIYc3qA4Z8fPYEuMR0
         PtF6UfHQo9La3A+tJ43xU4SijMrcdZi3uQeF6i2JSyu0zLJnt0QaPCrUIiXXcJnO4rIJ
         bjhy+0QCyNLjEX4OSi6FG7rPF9xMssbXq6Ei8rzKOcZrU+7QI8DFzSwejM28OWEjeAiJ
         D2DlPDOXJXjlcUxLSlr/w6gtENVay8ar8jOZsbuBqldqD0ezq2GdwZZV51fLQFtGMzA7
         g3+X5GhKsJbSMPWNhjZ1SOjoTDaSAugPWYFp708r6A2WyT34H3BwbmNN2wGooW+Z0pjH
         VlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HD7cxLp0NK/qYesJFUJ+z6fk+ZOrRl+xLhixqrzwrzE=;
        b=mo1rnvNN+DiBCAlBi3VxqKRN6aDolYP7F5xwWUTM3Ssk3O5uRzy88NysERi4Z21dgQ
         2XWWOV5p0R9bq1ke/Q4jBD5Qq7p/BwWPN/VNVQzB/g5a9I1PfxxvTfGOvgV55U94FmpK
         Jz5P19ARe7ThRIccBGVdgkM+6f40rb/G5AZZwns6oGrGRuO1g1ZAcfC7xlLJYQpy1El3
         5Y23QXvFMWzX/E8Eexjx/HO34dy6j1aQ3NrnCZJQQDoZWv5+7sHDLByicjZKReWVMUUp
         rAQqIJyPWycHpWKRRzpLRE+46w/T+GB+LQjBoMBWE66LwRuyMXj7C1jAxJRjFgL2iZBz
         7ACw==
X-Gm-Message-State: APjAAAXqQBRt9mt1PpkH56i62AC55gr167FbW+CINBicSxH2+lxZVd9d
        TXDWHverw66wOmadfZbefmKeuivF
X-Google-Smtp-Source: APXvYqy4KnubgOVWU5lDmJemo48WpbRW/GWI64D7DlGIlHy9vL/+N8yyJucnACMI+HYhydi7tlULfg==
X-Received: by 2002:a05:651c:150:: with SMTP id c16mr1448621ljd.222.1571240032366;
        Wed, 16 Oct 2019 08:33:52 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id h5sm7700986ljf.83.2019.10.16.08.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 08:33:51 -0700 (PDT)
Subject: Re: [PATCH 10/14] drm/tegra: Move IOMMU group into host1x client
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20191014125049.425101-1-thierry.reding@gmail.com>
 <20191014125049.425101-11-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ef11047c-3235-1b8b-d1b0-80d368099e05@gmail.com>
Date:   Wed, 16 Oct 2019 18:33:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014125049.425101-11-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.10.2019 15:50, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Handling of the IOMMU group attachment is common to all clients, so move
> the group into the client to simplify code.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   |  9 ++++-----
>  drivers/gpu/drm/tegra/dc.h   |  2 --
>  drivers/gpu/drm/tegra/drm.c  | 22 +++++++++++-----------
>  drivers/gpu/drm/tegra/drm.h  |  6 ++----
>  drivers/gpu/drm/tegra/gr2d.c | 10 ++++------
>  drivers/gpu/drm/tegra/gr3d.c | 10 ++++------
>  drivers/gpu/drm/tegra/vic.c  | 10 ++++------
>  include/linux/host1x.h       |  2 ++
>  8 files changed, 31 insertions(+), 40 deletions(-)

Hello Thierry,

Is there any chance that you could pick up these patches [0] and rebase
yours series on top of them?

[0] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=115608
