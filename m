Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9581D63722
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jul 2019 15:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfGINkZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jul 2019 09:40:25 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41876 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfGINkY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Jul 2019 09:40:24 -0400
Received: by mail-qt1-f195.google.com with SMTP id d17so20217406qtj.8
        for <linux-tegra@vger.kernel.org>; Tue, 09 Jul 2019 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tv27Rfc5F1/22AUNBd83Muk5qt7AIozrFwrcdJ4deqI=;
        b=idwO+/1lpeDv2O8VT9JEBvK3sh4MMw6hYiAwtDt7soAYVZf6w7ZyCm35uLyCJc0D+Q
         9GjQHiWRgIa4sbjrKa1VgP7OckOBF4qUQSjMR7FBa2rcUCS0EkWLCaHElqiZaGKgaXZg
         hAMI+Y5lDT2mhxHxLNVIAHD4EQl5lp914nTZ3CdRTPUsSeNqunWaKUVjZ4XJ2qYayi6L
         do+ylBKh0OIaT1u03hQZHtvoClwkU34gwce7raEQX9jmsE8mZYy6JPRmx5vbhShqR+fd
         48tZc2Afv5h++CMCq8XyU/hYzTfWmaPNiqdl/wvwRmg3Po5WYTfm73IheQtUPbJI+6F4
         wxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tv27Rfc5F1/22AUNBd83Muk5qt7AIozrFwrcdJ4deqI=;
        b=cLts3sLjfFL+Wo0FeknXW+mnPsIm/Kb4G75RVKH4hZMIaFKOijs8q3loV17rcyNk6g
         SM0wVAYODHoSWYq3fQ4Xm6whIMW2PFXTdDiVlE3a01ZG4TZM46rtNXi3gOowmBKTdDz7
         cjP7xdLN0XrUCqVvMfirCOQGWevQADCKdf9OZjOsTlcBpMmzCrckdfWfTXWpF0WivWwC
         boE5+3yXf/dqvQI5jL988tVjb6xax1WNqnShguSKloGcFesynZQAPccGGB/Nb9i8qngm
         eYUX/rb2YFEzE1NcHitcLf+d5hEZ9ELsC5xTMvtlXPfSqUzVcvaOLYTvC7Nl3MAUILKb
         trVQ==
X-Gm-Message-State: APjAAAXoX19Ux60ruzfHoibOBm6012+7L97HYD1SnRjxKJgN6qSCSuKh
        /a+Yt8RezaZpeq49MzbTLEQ=
X-Google-Smtp-Source: APXvYqyqEPKTyK7MsdBTZXWVLR2v9cx+z96+o6uR4WVGZEPy3MHrbKX+InNCodsNZIL8lPzu8eIBjw==
X-Received: by 2002:aed:3f29:: with SMTP id p38mr18287931qtf.126.1562679623810;
        Tue, 09 Jul 2019 06:40:23 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id q2sm8537525qkc.118.2019.07.09.06.40.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:40:23 -0700 (PDT)
Subject: Re: [PATCH v5 05/12] drm/modes: Rewrite the command line parser
To:     Jon Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        dri-devel@lists.freedesktop.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.5190d070d1439d762d7ab273f4ae2573087fee20.1560783090.git-series.maxime.ripard@bootlin.com>
 <e32cd4009153b184103554009135c7bf7c9975d7.1560783090.git-series.maxime.ripard@bootlin.com>
 <e1fcea71-b551-274e-4ea0-178bb0d5f71c@gmail.com>
 <20190709124526.36szuriteq3jumhr@flea>
 <41d24675-10df-5531-f4ee-4d801e2e4faf@gmail.com>
 <918c4477-6d59-06a6-ead0-9b2fc3e1eb10@nvidia.com>
 <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <763b0a94-0b64-c4fa-00a4-dba6b4247c73@gmail.com>
Date:   Tue, 9 Jul 2019 16:40:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <fbf926f0-dc9f-af8f-5365-1a67af8d5b60@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.07.2019 16:28, Jon Hunter пишет:
> 
> On 09/07/2019 14:26, Jon Hunter wrote:
>>
>> On 09/07/2019 13:52, Dmitry Osipenko wrote:
>>> 09.07.2019 15:45, Maxime Ripard пишет:
>>>> Hi,
>>>>
>>>> On Fri, Jul 05, 2019 at 07:54:47PM +0300, Dmitry Osipenko wrote:
>>>>> 17.06.2019 17:51, Maxime Ripard пишет:
>>>>>> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>>>>
>>>>>> Rewrite the command line parser in order to get away from the state machine
>>>>>> parsing the video mode lines.
>>>>>>
>>>>>> Hopefully, this will allow to extend it more easily to support named modes
>>>>>> and / or properties set directly on the command line.
>>>>>>
>>>>>> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>>>>>> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/drm_modes.c | 325 +++++++++++++++++++++++--------------
>>>>>>  1 file changed, 210 insertions(+), 115 deletions(-)
>>>>>
>>>>> I have a Tegra device that uses a stock android bootloader which
>>>>> passes "video=tegrafb" in the kernels cmdline. That wasn't a problem
>>>>> before this patch, but now Tegra DRM driver fails to probe because
>>>>> the mode is 0x0:0 and hence framebuffer allocation fails. Is it a
>>>>> legit regression that should be fixed in upstream?
>>>>
>>>> Thierry indeed reported that issue, but the discussion pretty much
>>>> stalled since then.
>>
>> Yes Thierry is currently out and hence has not responded. I had been
>> planning to look at this this week and responded.
>>
>>> Sorry, this doesn't answer my question. Where it was reported?
>>
>> Same thread [0].
> 
> Correction, it was on patch 6/12 and not this one.

Thank you very much, Jon! So looks like this patch is simply broken because it silently
copies the "mode's name" and then drm_connector_get_cmdline_mode() doesn't even try to
validate the mode.
