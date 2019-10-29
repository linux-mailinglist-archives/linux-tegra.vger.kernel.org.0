Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E840E896B
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Oct 2019 14:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfJ2NZk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Oct 2019 09:25:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33482 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbfJ2NZk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Oct 2019 09:25:40 -0400
Received: by mail-lj1-f193.google.com with SMTP id t5so7435358ljk.0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2019 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AyfFRUgpmb5UhgMMjiLBLZD3oIeC+XtwnmlqyRHc/Y8=;
        b=OgcQTSAcq4bN15zVhRZChpXBcD6wEgatgAcV99KqX5EDhZSiD/n0oLwnR1uXmsd4r6
         iQ85/aohIAluwG/AZg0SS6tO/TmTq6A8q2OaR2gh5zbPZMSUcDlxwwaaSt6fFKYJfQnV
         CBdE+ZGUgYayg3bdQSzP3qQf3VUfI0f1eRUc3TLRBFrqN7IDG1D6N+QoNKReY0bVXY1V
         IjpGgOHuufw8ZQ3NSBj1Z+1ilkfmdaQs+EpBOdKR30HIn+qd9IBS45WQEy5vp0bd+5Tx
         pKJw5UDRpSuYfaQmZE6gNSz9/Iw4pxDmGjYyBKRG3lOzqCJCqrgmtlTyfQOJqWRsrS+3
         famA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AyfFRUgpmb5UhgMMjiLBLZD3oIeC+XtwnmlqyRHc/Y8=;
        b=lQyuiNSdzw4PkCJDdFskX+Coam2b7fJhNjWF4gaxoHcJNiGHX1crbq49zKbbnSFUDU
         51Pj53xyyceTuFOEQIz9WQzv0w/P3NUYeRowtytUiIkvvPis2uxw5LYwD98TELLZBKfy
         b50VNYwhkZrUGzDYdCmFxJ1TVbbxe+dXKvj3Nmo4tU+q01IQLn7h135tlVOVPCXHivFM
         inGJidfBUiiFvzXo/m8N1JUTOAo4Ph/R+rQM4SYsRK9T3XAD9denPCATM3q0+6dzSSgm
         D6XCqnNhNHbU1uvNoYYysROYNZzoV0AOTcpGjyjofVGp8M9x1umEsaprKmclYwRLg4QS
         en4w==
X-Gm-Message-State: APjAAAUYbYH30LS/A1sKaQr4o6ltnnAvTmu9OyJ2jhyOqDhFwybXuRSS
        0S4yPefzsBtAbyyiJlXC66lG5ta4
X-Google-Smtp-Source: APXvYqwpQGy2/Kr5nCilq6slM0IZVduc2g7YFgBUjtBEJSZb+IPOIdn2e1U2KwiDhwDFIY0LcHLyYQ==
X-Received: by 2002:a05:651c:10e:: with SMTP id a14mr2659527ljb.177.1572355538010;
        Tue, 29 Oct 2019 06:25:38 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id v203sm8442282lfa.25.2019.10.29.06.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2019 06:25:37 -0700 (PDT)
Subject: Re: [PATCH v3] drm/tegra: Do not use ->load() and ->unload()
 callbacks
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20191028121610.3889207-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28aaf3c5-2e23-c947-9dd9-31571b5d5f1b@gmail.com>
Date:   Tue, 29 Oct 2019 16:25:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028121610.3889207-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.10.2019 15:16, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ->load() and ->unload() drivers are midlayers and should be avoided
> in modern drivers. Fix this by moving the code into the driver ->probe()
> and ->remove() implementations, respectively.
> 
> v2: kick out conflicting framebuffers before initializing fbdev
> v3: rebase onto drm/tegra/for-next
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 321 +++++++++++++++++-------------------
>  1 file changed, 154 insertions(+), 167 deletions(-)

Hello Thierry,

I tried a bit harder and managed to get simple-framebuffer working, the
bootloader's FB handover works fine for me before and after this patch.
Thanks!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
