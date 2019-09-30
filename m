Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7F5C26CF
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 22:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfI3Ukq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 16:40:46 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:43267 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfI3Ukq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 16:40:46 -0400
Received: by mail-lj1-f177.google.com with SMTP id n14so10904544ljj.10
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9is1ys1x52iJbNDva1qPb/Gr2FIs+PaAPbRbWWXxwDM=;
        b=Im1u419RSOqa+i+J/+j2q0/rXEYyBidaPXzBg19eU6N1XAYAvxvActp9r640D8uUF0
         TX44ih67VUhkDExNv5RC1bi5AvuKjcdAOQPGOj3sYpYI2KfiRF+wiHG01nhFSfLaMjzI
         UFvItw2zAnWGcbjkBtvFE3rw33Du9WiDue4fNOdAb/xnsvmUQanOQxBaYvPn+UhHU8PE
         CN/kkbSAPP23M7d4fZYY6Q2VAE61qbODRT9U+eYB6bOIbl9wmo4C9I89i4kMMA+e4Gah
         oHB+qt9SDLD5R0h6NeIh1zrDjRJiUvwXyrT/lAgMP96yI7IFJNqfGUpIf8ZXpMVSZ1Ag
         /IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9is1ys1x52iJbNDva1qPb/Gr2FIs+PaAPbRbWWXxwDM=;
        b=tRnyOLDiIxphrSiMKojz6oZ0hoBEA3A16gF5RkDeDT7Z3lh7Iqbhr/e+rQSJEYF2sj
         3xHU/NllV6xO+5GwgSPCi9lBkmFL3JYqFJbVbIe43h1ishyLozsqpcG+bFY+XNBZAdup
         W679qxw/luLLznc8QXHUbd9TenpIsv+jW3/j1RWJ+GnLVURggjA98XDPITdK+mxeNZZU
         BBYF6Rmz/UCx+y0rhY2hDxtfJ1KG0wwj1seDTwOj5yQdG/M89zafTqU5yfiTi4g3AJoG
         chkZuUG6FwHkfa2YA6AcIK+rxsqxmbvldcmR5sE8ffivtm6EQOmCbZfSdR2aZPs6f3TM
         DcUQ==
X-Gm-Message-State: APjAAAVuiGLj6MX6vxA5SnAfNsBXN1dG6/iUmWjdsKhZzO6oNtc7I41N
        pGcOfeMgBmcXPsNcWvC2qiRWYTd5
X-Google-Smtp-Source: APXvYqw4WGFQHJHgAqpyU8HsCqXkFDppTPAi4SWix19L+eFHCFTt0jrQiAD2kWfwtDRltKjqaftYzg==
X-Received: by 2002:a2e:1614:: with SMTP id w20mr12936674ljd.159.1569865339078;
        Mon, 30 Sep 2019 10:42:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id g10sm3337993lfb.76.2019.09.30.10.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 10:42:18 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Geis <pgwipeout@gmail.com>, Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
 <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
Date:   Mon, 30 Sep 2019 20:42:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2019 18:54, Peter Geis пишет:
> Dmitry,
> 
> As far as I can tell the cpuidle drivers work perfectly, but I don't
> have full power management yet on either my T20 device nor my T30
> device.
> They aren't the cause of this though.
> 
> I've been sticking to the mainline release code since 5.3 landed, as
> something was merged into linux-next that breaks brcm4329/brcm4330
> firmware loading.
> 
> Jumping to linux-next to test your driver just revealed the behavior.
> 
> On my T20 device I haven't encountered issues, but that operates
> almost exclusively in gadget mode.
> On my T30 device tegra-udc is misbehaving, especially on linux-next.
> 
> By removing the hardcoded LL_DEBUG config and moving to a command line
> earlycon statement, I seem to be making progress in capturing what's
> going on.
> With the following actions, I got a panic crash dump:
> phy set to peripheral, boot with tegra-ehci in host mode, usb hub plugged in.
> Booted successfully, hub enumerated, passed data through attached
> ethernet device.
> Unbind the tegra-ehci driver, bind the tegra-udc driver.
> Hub enumerates, as well as attached ethernet device, but writes to the
> device throw constant errors.

Is the host mode working properly when booting with the tegra-udc as a
primary driver?

> Unbind the tegra-udc driver, produces the following panic:

Looks like it is a CI driver bug, perhaps timer's tear down isn't
performed correctly. Maybe it is related to the errors you're seeing and
something getting stuck with the offending timer being active during of
the driver's unbinding..

Probably Peter Chen could help with that.

[snip]
