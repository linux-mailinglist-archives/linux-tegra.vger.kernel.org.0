Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABDE32379
	for <lists+linux-tegra@lfdr.de>; Sun,  2 Jun 2019 15:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFBNwH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 2 Jun 2019 09:52:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43628 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfFBNwE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 2 Jun 2019 09:52:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so175606ljv.10
        for <linux-tegra@vger.kernel.org>; Sun, 02 Jun 2019 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyUfE3HCHLjRLM9DWWhuPKiM2Ja5HdTmrq6DTMOqX24=;
        b=AuX28I3gLoY3HNsk9MDit29U1RHHQRLNbEbs1tCyXwUdFYbqEisfJP3M0rn50oamli
         LC8BqZJtcx4p0A8bQhvVh7sxBkAhj0vAbSDib/pMgadAQyjkxBEy9mjqP76qBIF23LT9
         0l5VQMVoU5RLSOx6kzEV/CHwz5XF0jMcAC0U3/igFSjz6zz9rULkKj4RWPwyyyEC9f93
         +uyY1oneLUtLHN4Falovg0gzgYaohlJQ9qmqg1kusjRM7d1i1CrI+WfmKPWZXzxqF+GT
         xnsaECCFiRygX6qqR2l8edgMMe52xvHUnBYI44xgiT6xs506QPZ/SLofO8ZANgY5QrZl
         3sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyUfE3HCHLjRLM9DWWhuPKiM2Ja5HdTmrq6DTMOqX24=;
        b=siiN+XSubJhN8Qc/9nRhFFZ7P9yQX8yNzy63tBGZDPQuWvKn5n/5q+ayWHTQG1y4qY
         od1IqMQVqVoK7OJwUy4HYAKgcjnDmRNF0ccpzshaCRunBioUqnoP8H7OIuOYylCy4VEk
         nHHuoiKDIAFpy3z/ll/lejG99/oLgdDMlkMbIno5rveFx+cYqiP+THRYQuc2QgNVh9kS
         w9u87Q5Dl9majZt562NGdJDxcgLM5wQBpiXZkIr8Y12RZ26DyE/ZaPJ0sDbgNoCab/RN
         MHKLN8xJ35rQZiivMLLhVBL3ae7pVxXNK2g0ynCjLhLe9jGb8VvClB5d915b4fBuMGHj
         hJNg==
X-Gm-Message-State: APjAAAVeswnOifzm3Mbrb9gxe/6nJqi0ALrmBQzbejJZPfyqTOIqRXlG
        cgk+SsdYBbL0U3ZKa4e0K0VEs4+JV1NVoELrLoRMfg==
X-Google-Smtp-Source: APXvYqw5tUx0mApKIJz+uww1Fj65ofep3jdE+mGrPIXd9bph8EemlhvdawhPNIs/inbQgkjnl+p0SCvle2OkoAaZgNs=
X-Received: by 2002:a2e:984a:: with SMTP id e10mr3538422ljj.113.1559483522555;
 Sun, 02 Jun 2019 06:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com> <20190529145322.20630-2-thierry.reding@gmail.com>
In-Reply-To: <20190529145322.20630-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 15:51:51 +0200
Message-ID: <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Hierarchical IRQ domains can be used to stack different IRQ controllers
> on top of each other. One specific use-case where this can be useful is
> if a power management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can be a
> parent to other interrupt controllers and program additional registers
> when an IRQ has its wake capability enabled or disabled.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> - add missing kerneldoc for new parent_domain field
> - keep IRQ_DOMAIN dependency for clarity

Actually I applied the patch, and dropped the two lines making
it possible to override .to_irq() for now, so I can illustrate my
idea on top. If I manage.

Yours,
Linus Walleij
