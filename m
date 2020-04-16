Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A06B1AD1C6
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 23:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgDPVPj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 17:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728976AbgDPVPi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 17:15:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB22AC061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 14:15:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r7so9374492ljg.13
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jSBs/T90dOJCpky6qdYZXn6KBXVKIT11SUHs83vt+Vo=;
        b=onXnSEjMI9WjFRYvFbt3eT/2a0jSap3HpX0s3nmxW7DMwa6jnOXHccjzGBA2c8Q+uU
         Fa1xiLUiSHJVDZKQ0+PPmiiHkJMysyGYeWEtkPDh1k5CQzM6jvK/GxhmnkxjlJWb44JY
         lT1fePiuw1hLLR/O49CloRWyU7wogGM9XT5ilDARM177CHi8aTUfQKpqQt51bNILcV+N
         GpBjMtnYJc67sShFjkUSkz8f64KEaMt9K1/hfYtcWepOy8Df+DUiNxVUSJLK4zr/SmTv
         WG9IyBsodWK43tl8te8yAZ1Nrmf+LNdXIOyEJkLUYWEcJOEyX8QpBoGMDLTT5usT4R0M
         dj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jSBs/T90dOJCpky6qdYZXn6KBXVKIT11SUHs83vt+Vo=;
        b=EYkKRFYa/iluOENKL57goGEIDuXJUKnF76aYlxjmf51UVSywHB/Td0NJJPo3EGXX2N
         +ov1Cllrbmymz3yNfeiSvNpE44c13OBBB/v53CFfu/Q60gw6p9p8IAXF6hQjSuF13kjY
         iRxmTGACb5O0q0skXc+fQiGwFG44W9c+cQsVTpp7/AQJskTp4geOGeEjim/HSENiJgKF
         71e2LGBtkyJT6YeEfODRBGndS5vHoqJsP8sVNxxZpXmUafTxkvfHVdZhArkBWT1gYvu5
         rdb0Xutcn0dlMlxWeNGSwQ0mmk0UnXr6sIkb+TBZYq3EHcqIteNeMxO8pt+7jdgX1Pno
         u8oQ==
X-Gm-Message-State: AGi0PuamPpTIK0Ir+tp5qsp+KYZen3ZhWXl08bAVSGlUGj66a1kQroGA
        cqIy0mTJi9G3GGv0Fp1GAjjSZdav
X-Google-Smtp-Source: APiQypJ39BDu0skpY5uo+qDKfkzWqqaEPWpqB+fHJ6Ay3NgDNLeoyTltY8ziyuE3r5E+NvHOH1YGOA==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr43329ljj.145.1587071735735;
        Thu, 16 Apr 2020 14:15:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k18sm20331341lfg.81.2020.04.16.14.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 14:15:34 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/tegra: output: rgb: Support LVDS encoder
 bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-3-digetx@gmail.com>
 <20200416174112.GS4796@pendragon.ideasonboard.com>
 <6275bcd3-c0b2-4c1c-1817-9e713d3747c7@gmail.com>
 <7cf27640-4fdc-8617-01cb-85f4c5847bb8@gmail.com>
 <20200416205012.GA28162@pendragon.ideasonboard.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fbafa641-f2ed-22b5-eaeb-bd2726b53d0a@gmail.com>
Date:   Fri, 17 Apr 2020 00:15:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416205012.GA28162@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.04.2020 23:50, Laurent Pinchart пишет:
> Hi Dmitry,
> 
> On Thu, Apr 16, 2020 at 11:21:40PM +0300, Dmitry Osipenko wrote:
>> 16.04.2020 21:52, Dmitry Osipenko пишет:
>> ...
>>>> May I also recommend switching to the DRM panel bridge helper ? It will
>>>> simplify the code.
>>>
>>> Could you please clarify what is the "DRM panel bridge helper"?
>>>
>>> I think we won't need any additional helpers after switching to the
>>> bridge connector helper, no?
>>
>> Actually, I now see that the panel needs to be manually attached to the
>> connector.
> 
> The DRM panel bridge helper creates a bridge from a panel (with
> devm_drm_panel_bridge_add()). You can then attach that bridge to the
> chain, like any other bridge, and the enable/disable operations will be
> called automatically without any need to call the panel enable/disable
> manually as done currently.
> 
>> Still it's not apparent to me how to get panel out of the bridge. It
>> looks like there is no such "panel helper" for the bridge API or I just
>> can't find it.
> 
> You don't need to get a panel out of the bridge. You should get the
> bridge as done today,

You mean "get the panel", correct?

> and wrap it in a bridge with
> devm_drm_panel_bridge_add().
> 

The lvds-codec already wraps panel into the bridge using
devm_drm_panel_bridge_add() and chains it for us, please see
lvds_codec_probe() / lvds_codec_attach().

Does it mean that lvds-codec is not supporting the new model?

Everything works nicely using the old model, where bridge creates
connector and attaches panel to it for us.

[I'm still not sure what is the point to use the new model in a case of
a simple chain of bridges]

Using the new model, the connector isn't created by the bridge, so I
need to duplicate that creation effort in the driver. Once the bridge
connector is manually created, I need to attach panel to this connector,
but panel is reachable only via the remote bridge (which wraps the panel).

driver connector -> LVDS bridge -> panel bridge -> panel
