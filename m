Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E37D7C6A4
	for <lists+linux-tegra@lfdr.de>; Wed, 31 Jul 2019 17:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfGaPci (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 31 Jul 2019 11:32:38 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:40539 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfGaPch (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Jul 2019 11:32:37 -0400
Received: by mail-wm1-f42.google.com with SMTP id v19so60260958wmj.5
        for <linux-tegra@vger.kernel.org>; Wed, 31 Jul 2019 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=f/hNdz0qX9ihYQK8skLrxEItTeCBiCN+CMcmJWDZmZ8=;
        b=aF22qCf2+80nfULt45GEqs6RMQa7hWf/lxvZC8YZQyD1qUazIqf48Mb4Da7QzAaQCI
         Wts4VUoSHfVqp9yjTdbtGMLJavglnjyumhxEsIhFyAtts0kGh/6m9YtXjs/lryMsQFfH
         8QSzz5KwKVOuFd8FSIY0R417Lvq5kDRr1QAVO+NYoKExLx9wXxqdRcJmovRjfPY2fW96
         9R3LstiXLKMtZ60NZKY4Sy+JPNtZ6GpKp5BqLseM76Q4vDfdW4bdDWIL9kpVaBDMtbIX
         ze5jBIrokDIh7PqkyKmSrRg5ZYC/H2bsZoKA2DQj57NLAiybqDpzIHHBNBIxmvqEHRQp
         j0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=f/hNdz0qX9ihYQK8skLrxEItTeCBiCN+CMcmJWDZmZ8=;
        b=YaOTkWIUgrOxdYH6DdPWXb0UloIT/NHJeC+GDWwbvqu2mivDRdzYTRj83zwzjEbxBr
         5/z6bIVNVnjmIugtQKss62v/VrWsRPGBT/v8UBkiLwVilTMAc1CwMcs3fg7J/RRNdBVG
         fcz8vrBX9w+Hp3HAo8lfiE73LZk8gEL0VQGASU9zfviWs5EjvbGwiX6ZYqyMkVNe8B2/
         lEUiWB/eqCvibTm+Zf4NURSNxBgL5l3qZGZz9gomWN6/2Y72xSfc7+NUWGqSUiTQKV1X
         pJa7fOme9ngBXCQzdmkhOAeS5EJVLbFsv2HAafOaWvYjy2c6Mgmty1De55c4MBOGXP+4
         mXWg==
X-Gm-Message-State: APjAAAVfiGTen3haJn6ICBYpwjegOXcaAf9cA59RC9cuLlO+PZDDljwr
        nLeX/8CwjiZvOvdnzJTdRtgrIQ==
X-Google-Smtp-Source: APXvYqxaviW4fEOrpmx/4Evy7yl+eOLL4PdevLrhHZKw3/QB5/lABaiB1v26yFpmsB6ArUS1wMPchg==
X-Received: by 2002:a7b:ce8a:: with SMTP id q10mr105816482wmj.109.1564587154590;
        Wed, 31 Jul 2019 08:32:34 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r123sm61555981wme.7.2019.07.31.08.32.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:32:33 -0700 (PDT)
Subject: Re: Review required [Was: Associate ddc adapters with connectors]
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Huang Rui <ray.huang@amd.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <20190726183520.GA22572@ravnborg.org> <20190726185538.GD14981@ravnborg.org>
 <6560f93c-a48f-2a8c-afeb-d5e8e200480d@baylibre.com>
 <20190731104007.GA23138@ravnborg.org>
 <959cf323-c6b9-895b-592c-81c52aacae6e@collabora.com>
 <ce68a0df-1719-7b53-b0ed-89caa9afc4a0@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
Date:   Wed, 31 Jul 2019 17:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ce68a0df-1719-7b53-b0ed-89caa9afc4a0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Andrzej,

On 31/07/2019 16:22, Neil Armstrong wrote:
> On 31/07/2019 15:10, Andrzej Pietrasiewicz wrote:
>> W dniu 31.07.2019 o 12:40, Sam Ravnborg pisze:
>>> Hi Neil.
>>>
>>> On Wed, Jul 31, 2019 at 10:00:14AM +0200, Neil Armstrong wrote:
>>>> Hi Sam,
>>>>
>>>> On 26/07/2019 20:55, Sam Ravnborg wrote:
>>>>> Hi all.
>>>>>
>>>>> Andrzej have done a good job following up on feedback and this series is
>>>>> now ready.
>>>>>
>>>>> We need ack on the patches touching the individual drivers before we can
>>>>> proceed.
>>>>> Please check your drivers and get back.
>>>>
>>>> I can apply all core and maintainer-acked patches for now :
>>>> 1, 2, 7, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23
>>>>
>>>> and Andrzej can resend not applied patches with Yours and Emil's Reviewed-by,
>>>> so we can wait a few more days to apply them.
>>>
>>> Sounds like a good plan.
>>> Thanks for thaking care of this.
>>
>> When is it good time to resend patches 3, 4, 5, 6, 8, 9, 12, 13, 14, 15, 24 as a
>> new series?
> 
> I'll ping you when everything is applied, build-tested and pushed on drm-misc-next

I pushed 1, 2, 7, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23 :
bed7a2182de6 drm/radeon: Provide ddc symlink in connector sysfs directory
5b50fa2b35a4 drm/amdgpu: Provide ddc symlink in connector sysfs directory
cfb444552926 drm/bridge: ti-tfp410: Provide ddc symlink in connector sysfs directory
9ebc4d2140ad drm/bridge: dw-hdmi: Provide ddc symlink in connector sysfs directory
a4f9087e85de drm/bridge: dumb-vga-dac: Provide ddc symlink in connector sysfs directory
350fd554ee44 drm/ast: Provide ddc symlink in connector sysfs directory
9572ae176a10 drm/mgag200: Provide ddc symlink in connector sysfs directory
7058e76682d7 drm: sti: Provide ddc symlink in hdmi connector sysfs directory
2ae7eb372ed4 drm/imx: imx-tve: Provide ddc symlink in connector's sysfs
be0ec35940bc drm/imx: imx-ldb: Provide ddc symlink in connector's sysfs
1e8f17855ff8 drm/sun4i: hdmi: Provide ddc symlink in sun4i hdmi connector sysfs directory
100163df4203 drm: Add drm_connector_init() variant with ddc
e1a29c6c5955 drm: Add ddc link in sysfs created by drm_connector

Neil

> 
> Neil
> 
>>
>> Andrzej
> 

