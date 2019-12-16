Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 264C6120225
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Dec 2019 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLPKRz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Dec 2019 05:17:55 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43045 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfLPKRy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Dec 2019 05:17:54 -0500
Received: by mail-vk1-f196.google.com with SMTP id h13so1445708vkn.10
        for <linux-tegra@vger.kernel.org>; Mon, 16 Dec 2019 02:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AOrRGrYeMpcGDIgKay64sJNHoHbNZIw/AFzVsWWLyTE=;
        b=qtBcC+HessrBSNKGnT3Ic5MPcGBY6OqtxpSAvBK+VBoUCTVclzq2hzsdYK7t5a9r/e
         sfaSuJlhpU4qdcgojOMEEwiBk13gHSnMWCKiOQNW5bC3lvH+Kcc41xezaheZNiC0eGgh
         udMTj1FM2+iQsoe0M9cjgceit8EyXeAhJ8ZftkUAqdFeg0x7QTyEZcu1cFgRWK14TNHj
         SUWJBJMwiIpOJxn3zMe5l9HxkoxI14PaXYC5uwLALAxVmLpHqWazRg8BzpOg7rqSE/sa
         fSw+XfWlw7TQiII6B7nnzlc+kVMUZVaxcC7/DX1GkvVb9J5D1IiKduXEmpVfXy9oZTWn
         QolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AOrRGrYeMpcGDIgKay64sJNHoHbNZIw/AFzVsWWLyTE=;
        b=ewloTHh8SGuWnyuf8RQlNQwmIZ5AfLyXReOlOOUNh2/2JbdKQ2GMcpJRd5XxKfUUpW
         9DFTHOS8dkk9qE975Anj628MDEo0w6tmuepnWCITLlxStnAwo8RX+LyvH06+oyEmJ6Qz
         nUH7fB3bvee9YIob6kHR4QdYjnglk4WQTMDkO7fELkkPqSdPY8pA4M7zyjTqi5XC9PRr
         sfCoQXUmzbKMA3eG/XhF/p8u3OY6hyvnKEjUU6Zw7T2dwfz1nGnMmpLC2uRFSAnKwJT1
         /aBVT/D5/FRcAwgutYfD7m6BO0On7pX8Vn8aWoStSDLYW/K4/gQmZ7gDuZW/eYVhjOop
         +Q4w==
X-Gm-Message-State: APjAAAWm0jTrTmxVZtsMT+kqcIDRhoNo3KIL2GEoFMnFQIDhrZ1nH36H
        2l9qgrHE+Paux8UvMcb3jojA3aoI/CPCt18QXlakGA==
X-Google-Smtp-Source: APXvYqxCx6HhLM26TS3E4JRNImvo+kMd2y4pcmiYvk8HdZpUpy9CgOrzfuVd2/yJnMmLV/V25/CbhW9/vub9nN5lQf8=
X-Received: by 2002:a1f:fe4e:: with SMTP id l75mr23856887vki.18.1576491474088;
 Mon, 16 Dec 2019 02:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20191213130034.219227-1-thierry.reding@gmail.com>
In-Reply-To: <20191213130034.219227-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 11:17:43 +0100
Message-ID: <CACRpkdYV4ruWvRSKtOyL5fiFmCA_fsHG98BDkEVBxdR14VNxPQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Allow building on Tegra194-only configurations
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Dec 13, 2019 at 2:00 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The driver is compatible with both Tegra186 and Tegra194, but currently
> it cannot be selected if only Tegra194 support is enabled. Allow builds
> with only Tegra194 support enabled to select this driver.
>
> While at it, select this driver by default on Tegra194 builds because it
> is an essential part of the system.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes, it seems like it should be -rc material.

Yours,
Linus Walleij
