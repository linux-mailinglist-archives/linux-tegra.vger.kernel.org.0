Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31AF163636
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jul 2019 14:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfGIMwV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jul 2019 08:52:21 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38037 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfGIMwV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Jul 2019 08:52:21 -0400
Received: by mail-qk1-f196.google.com with SMTP id a27so15893547qkk.5
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jul 2019 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z8kNI881bPk48iQ1KRVTl0sXKkuyk/dxjSsIQFxaR8o=;
        b=E0e0ZIuEOatfHsh7mOJFiZl1I6rwVWxMVBR7/NP4v7/YzUMirQOcByvAHvg2T0kjXl
         VwE1HxqsblS7HwY/UtGp0m//pupC6TMCRZl2XI5xNvQGm/UfVz+R5OfvODRwLcV/HPTw
         3tnkuXGYjq6WfNB2kWqDnKnu0h8haGjl68eaL3kClCGwtKbPo24PYO7rnnjyVZV98G6G
         0Dom35EfORV1x1R7hGcOUM9gqD8MbpqncHi9NaLUSwTA1fuWVEZWf0Jpohz97vFKcnuQ
         Ra6z0d5JvZ4w8tRlVNDfByvvbYbnrxRDJb2DFj5K2FdzU+7DKeSL98HEk0MRjHWo9JEd
         68lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z8kNI881bPk48iQ1KRVTl0sXKkuyk/dxjSsIQFxaR8o=;
        b=XYzXHgNTMcInHlTi/OL1erYL6zBpNPL7C+FL+2HMF1kyZWvRhtqXgxQ5Fzk+Me2hJI
         dBdRt1c3fyn2LbMcKM7sfGV1W6rsFJY78YEhXV3bp8TXd+gcC5zsdkUxUQK/Ier6M0Nl
         OLGNPqLow+Rzkk0+TnhtuP6qmoD1vsw8YjXN/HMEVy6KjA9NfgZ08Qe/P36XspfU3FBb
         iFhURfiL5Z+CCUQ25we78/MFCEAZZOitjO1h/65UXW+OkAhQyyA9FKosP1UHyPWB1MBY
         gG+YZBjI3V33Spud/KM7bhwSNfz+lmqyXcBRM0dzu+WGGL08iewlEumHUWsv/vA4JiAm
         GIPg==
X-Gm-Message-State: APjAAAXopSu6NCFQQ6mQvXRbJsiLjfVfXUCKNtA0CPmn2WcVk3VzzSQH
        3hxaziGEqc/in6o8eBlEw5o=
X-Google-Smtp-Source: APXvYqyHA5/Lol3yKNF2g17z/amMymzBG8mlvk2cI4jGu5NI2rCkAbu+/C+mLJhVZoKdUzWek1dpbA==
X-Received: by 2002:a37:a7d2:: with SMTP id q201mr18019316qke.150.1562676740061;
        Tue, 09 Jul 2019 05:52:20 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id t6sm8836329qkh.129.2019.07.09.05.52.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 05:52:17 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, eben@raspberrypi.org,
        dri-devel@lists.freedesktop.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
Date:   Tue, 9 Jul 2019 15:52:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709124526.36szuriteq3jumhr@flea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.07.2019 15:45, Maxime Ripard пишет:
> Hi,
> 
> On Fri, Jul 05, 2019 at 07:54:47PM +0300, Dmitry Osipenko wrote:
>> 17.06.2019 17:51, Maxime Ripard пишет:
>>> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>
>>> Rewrite the command line parser in order to get away from the state machine
>>> parsing the video mode lines.
>>>
>>> Hopefully, this will allow to extend it more easily to support named modes
>>> and / or properties set directly on the command line.
>>>
>>> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>> ---
>>>  drivers/gpu/drm/drm_modes.c | 325 +++++++++++++++++++++++--------------
>>>  1 file changed, 210 insertions(+), 115 deletions(-)
>>
>> I have a Tegra device that uses a stock android bootloader which
>> passes "video=tegrafb" in the kernels cmdline. That wasn't a problem
>> before this patch, but now Tegra DRM driver fails to probe because
>> the mode is 0x0:0 and hence framebuffer allocation fails. Is it a
>> legit regression that should be fixed in upstream?
> 
> Thierry indeed reported that issue, but the discussion pretty much
> stalled since then.

Sorry, this doesn't answer my question. Where it was reported?

If it's a valid regression (my device is broken), then the patch should either be fixed or
reverted.
