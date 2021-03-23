Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C34346775
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Mar 2021 19:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhCWSVm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 23 Mar 2021 14:21:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231146AbhCWSVN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 14:21:13 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C9BF619C2;
        Tue, 23 Mar 2021 18:21:12 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lOleQ-003Mfl-52; Tue, 23 Mar 2021 18:21:10 +0000
Date:   Tue, 23 Mar 2021 18:21:09 +0000
Message-ID: <87h7l1k9yi.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: GTE - The hardware timestamping engine
In-Reply-To: <YFm9r/tFkzVlYDEp@orome.fritz.box>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
        <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
        <20210322060047.GA226745@sol>
        <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
        <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
        <YFm9r/tFkzVlYDEp@orome.fritz.box>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: thierry.reding@gmail.com, linus.walleij@linaro.org, dipenp@nvidia.com, warthog618@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, tglx@linutronix.de, arnd@arndb.de, richardcochran@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 23 Mar 2021 10:06:39 +0000,
Thierry Reding <thierry.reding@gmail.com> wrote:

[...]

> Obviously if we don't integrate this with IRQs directly, it becomes a
> bit more difficult to relate the captured timestamps to the events
> across subsystem boundaries. I'm not sure how this would be solved
> properly. If the events are sufficiently rare, and it's certain that
> none will be missed, then it should be possible to just pull a timestamp
> from the timestamp FIFO for each event.
> 
> All of that said, I wonder if perhaps hierarchical IRQ domains can
> somehow be used for this. We did something similar on Tegra not too long
> ago for wake events, which are basically IRQs exposed by a parent IRQ
> chip that allows waking up from system sleep. There are some
> similarities between that and GTE in that the wake events also map to a
> subset of GPIOs and IRQs and provide additional functionalities on top.
> 
> I managed to mess up the implementation and Marc stepped in to clean
> things up, so Cc'ing him since he's clearly more familiar with the topic
> than I am.

Sure, but I'm pretty clueless when it comes to what this GTE thing
does (it has a fast car ring to it, which isn't a selling point for
me... ;-).

If, as I understand it, it is supposed to collect timestamps on
signalling of IRQs, you could make it part of the kernel's view of the
interrupt path by "pushing" a domain on top of the IRQ stack,
triggering the configuration/timestamping of this interrupt.

What is completely unclear to me is how you extract information from
it. The IRQ doesn't really give you an interface to extract a lot of
information aside from an interrupt count and what is defined as the
interrupt state. A timestamp doesn't really count as state, so you'd
need to invent something new here.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
