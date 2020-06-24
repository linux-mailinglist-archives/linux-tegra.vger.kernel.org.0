Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CBA2096EF
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 01:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgFXXL1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 19:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFXXLZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 19:11:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23606C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:11:25 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so4443233ljn.4
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kQmsX+Vdu4EGjgpq9cDms5n1A/lNINB8dDevHiC6RUc=;
        b=R3nn64625vGAvKs8myny0FeOmYfpHqyUgCNpz4U6IKt+y6CBLtC3ILmpYuwRFoJaCK
         1PgHnuIZKMIQ5MtmPZve3jAN/HuN9zv4tytQDv01QjvwIqqxR4vcKmh1yBdM/4LkYOcv
         6DK00bPnyU0JXCGMzIrwux0mx4p0PpdjfLnmij3iIqyHlDOiZf1wOgaZbwV6P1EKKV27
         vzyycqOiXKZ5CjbdHoiItnwWgFA5BlIocqiZeVEPkCjJNpuYlpm5kAZPylszSh/qzeVw
         qpUg2NkEJoCyCyDgDukoh6JSt456S1p52rd2sXIgnDZvB2PgIwc0+sjI83GmGYkPjeFo
         rATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kQmsX+Vdu4EGjgpq9cDms5n1A/lNINB8dDevHiC6RUc=;
        b=YKAlYwqJIeltIUBswdS1Dy+Nd4UP3x0aC/cHvd6E4rR9isSXDV3Hc2n5fY9aCz8OGu
         g7mjQ94AZz9YwWUvC7JrFem5+Gd36l/AVjx6MjrztR8WJJ+9HkA2TeXhI32xfbQEz9v5
         Ftejo19LOVGCynyvDaGQci/VSfEQvu2eZg7UgslrsE96Ty7uKFG5otBsB/kPrq3+5TTu
         n5Xr4qbJDVU1Jwo12UpyddXmJ8cqlNwSSWFu2ST+kpyqUmRexeFk3RIZKlKgaMcuo2Y7
         vnVAgI6oCntAKSw2n1Ptd0VZZlURqpMu6K0VtRO1Ui/Gw09fBQKrMD2VlA7DuPR2OzTX
         iR6Q==
X-Gm-Message-State: AOAM531n9OAo+kSmqzPzAENAA8kjJK+EkjBzom/dSng+uk7vOlPoCuYD
        /s188Rr6rj/68KQWirsHKDw=
X-Google-Smtp-Source: ABdhPJx65Uh8f3Z67/X/cBG/G6Xck+3qZo/ZVAUh9OU7HjeHp8x2TAATFJzkz7GLbKKfCdHgVB+eHg==
X-Received: by 2002:a2e:890a:: with SMTP id d10mr14729658lji.327.1593040283614;
        Wed, 24 Jun 2020 16:11:23 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id d2sm5561521lfq.79.2020.06.24.16.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 16:11:22 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
Date:   Thu, 25 Jun 2020 02:11:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> /* Command is an opcode gather from a GEM handle */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
> /* Command is an opcode gather from a user pointer */
> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1

I'm a bit dubious about whether we really need to retain the non-UPTR
variant. The memory-copying overhead is negligible because cmdstream's
data usually is hot in CPU's cache

IIRC, the most (if not all) of the modern DRM drivers drivers use the
usrptr-only for the cmdstream.

At least there is no any real-world userspace example today that could
benefit from a non-UPTR variant.

I'm suggesting to leave out the non-UPTR gather variant for now, keeping
it in mind as a potential future extension of the submission UAPI. Any
objections?
