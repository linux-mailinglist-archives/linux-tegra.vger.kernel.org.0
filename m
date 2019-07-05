Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C1260AA6
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2019 18:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbfGEQyx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 5 Jul 2019 12:54:53 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39956 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGEQyw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 5 Jul 2019 12:54:52 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so11747472qtn.7
        for <linux-tegra@vger.kernel.org>; Fri, 05 Jul 2019 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gVPnDnYZIHg//fCau2o8X4/K+TkzQ4pu97pN0qPOjGg=;
        b=HY56gVx7oYeo0j0mareMfs9VBJfGLP1hIK9Q60/d1GdKv4q9A1GXOvqhWDPtHVO/W2
         /RrvX+8ogGJW2cVFPm+P/kHWgENedo6lC9zreAKSr8Ebj5Okw/toxcTlYybpCAVpVggY
         Ip9S74TJKgeTQg3t3NZ6aivdmCoYpD9pf+nRdt/9ymUwMsyvPkLWNCT3j6pbiKJiCiRE
         rxBc2kr/h+OimDF6NV6XMm70Ssvt0Mc2OZGHNFKyI2VkfLy2uHq6aftTSrPpJdRHEkKV
         G/RvfewoG1Xa501uHcagNIYd6AoVUykWpLjzNiWnNYgG9vbEJet3gRUTqjXKCVTLPDyP
         qxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gVPnDnYZIHg//fCau2o8X4/K+TkzQ4pu97pN0qPOjGg=;
        b=o33iyzmQVq3woGZ4ftyjiQHHSQsWKV6oSs7CLuVGVJPyWKQ9sz7YsDyIqpl3g+yHdP
         8dYgnPkyQXgg+STO8qHISsZnZS2Hb2BtriMFiZ5VcZdhrhOSL7nITBek+gbT9FI17qfC
         /w1dFPJsPQB4SFKB5MbcViy7bVsfkTonOC0+WLIVvYi99L1r8CYOkTl2kNGHdQuxIxhn
         M/V14eSflDEhayEIYjfeslYu9B+yN8AsgkcbS/iA4CMGtqAe87k9P50Wl0Gn+WbpTxsj
         jpITMbq9yfY+M7NJ7IEFPfsYhisH8jYNx6DJCLE+2wPeu0BoFax6vPA9rl+7haKLHqiZ
         0SSA==
X-Gm-Message-State: APjAAAVCMrltHpevQQnBIWUrfGOg2e4Vu0hinkTmlJqQYty1hVi57llQ
        kNzJf8/9YY+ZBgvokNYxgLxkcar4
X-Google-Smtp-Source: APXvYqyL6Xp5wtUUYgejlpY+FF1T5AudwMjEl5B2aZN7563Grs7uqoz24OrXOya0O3591bdnHreMrw==
X-Received: by 2002:ac8:1a8d:: with SMTP id x13mr3595792qtj.114.1562345691667;
        Fri, 05 Jul 2019 09:54:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id r14sm4233105qke.47.2019.07.05.09.54.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 09:54:50 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
Date:   Fri, 5 Jul 2019 19:54:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.06.2019 17:51, Maxime Ripard пишет:
> From: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> Rewrite the command line parser in order to get away from the state machine
> parsing the video mode lines.
> 
> Hopefully, this will allow to extend it more easily to support named modes
> and / or properties set directly on the command line.
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 325 +++++++++++++++++++++++--------------
>  1 file changed, 210 insertions(+), 115 deletions(-)

Hello,

I have a Tegra device that uses a stock android bootloader which passes "video=tegrafb" in
the kernels cmdline. That wasn't a problem before this patch, but now Tegra DRM driver
fails to probe because the mode is 0x0:0 and hence framebuffer allocation fails. Is it a
legit regression that should be fixed in upstream?
