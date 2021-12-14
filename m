Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDB8474500
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Dec 2021 15:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhLNO3X (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Dec 2021 09:29:23 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:59504 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhLNO3W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 09:29:22 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 49FAE1F37C;
        Tue, 14 Dec 2021 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639492161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d7lElfo1JjyiNkLK1DnhHBlqCrDDlV8cw/kEYhI1B1A=;
        b=Pbun/mO06fvHw/NWhoynPH31hikjiBUqyWTxNgjEjHR6IJNup+qaZA0ANgWYKpXzsOr5Bb
        lfJqINzXsJX4gvTyFBE0umjlS4ZgQB4VTeW0CldgCJAq8rROqzD0WVpX6r1wQvyOoZsB4o
        BdHb8Tuvt/n4SB8aB/JEvp5xGy442iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639492161;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d7lElfo1JjyiNkLK1DnhHBlqCrDDlV8cw/kEYhI1B1A=;
        b=gtETqHrKV7YpLtr/1U4uCNbTSv2pHg8jKMFX60xBvwf7pUT37DoMXroXPoahzFLzNQhaWj
        pl+azC0GRCd44lAg==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 2EE0DA3B88;
        Tue, 14 Dec 2021 14:29:21 +0000 (UTC)
Date:   Tue, 14 Dec 2021 15:29:21 +0100
Message-ID: <s5hv8zr9s5a.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com,
        broonie@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        perex@perex.cz, jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Mohan Kumar <mkumard@nvidia.com>, robh+dt@kernel.org
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
In-Reply-To: <0761f6f2-27f8-4e1a-fabc-9d319f465a9e@gmail.com>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
        <1638858770-22594-2-git-send-email-spujar@nvidia.com>
        <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
        <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
        <56bb43b6-8d72-b1de-4402-a2cb31707bd9@gmail.com>
        <4855e9c4-e4c2-528b-c9ad-2be7209dc62a@nvidia.com>
        <5d441571-c1c2-5433-729f-86d6396c2853@gmail.com>
        <f32cde65-63dc-67f8-ded8-b58ea5e89f4e@nvidia.com>
        <95cc7efa-251c-690b-9afa-53ee9e052c34@gmail.com>
        <148fba18-5d14-d342-0eb9-4ff224cc58ad@nvidia.com>
        <3b0de739-7866-3886-be9c-a853c746f8b7@gmail.com>
        <73d04377-9898-930b-09db-bb6c4b3eb90a@nvidia.com>
        <ad388f5e-6f60-cf78-8510-87aec8524e33@gmail.com>
        <50bf5a83-051e-8c12-6502-aabd8edd0a72@nvidia.com>
        <7230ad0b-2b04-4f1b-b616-b7d98789ded0@gmail.com>
        <48f891bc-d8f6-2634-6dd1-6ea4f14ae6a3@nvidia.com>
        <0761f6f2-27f8-4e1a-fabc-9d319f465a9e@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 14 Dec 2021 14:56:12 +0100,
Dmitry Osipenko wrote:
> 
> 14.12.2021 10:22, Sameer Pujar пишет:
> ...
> >>> How the reset behavior is different? At this point when HDA driver is
> >>> loaded the HW is already reset during display ungate. What matters,
> >>> during HDA driver load, is whether the HW is in predictable state or not
> >>> and the answer is yes. So I am not sure what problem you are referring
> >>> to. Question is, if BPMP already ensures this, then why driver needs to
> >>> take care of it.
> >> 1. Enable display
> >> 2. Play audio over HDMI
> > 
> >> 3. HDA hardware now is in dirty state
> > 
> > Why this would be a dirty state? It is rather a functional state. Isn't
> > it? Power-domain is ON while all this happens.
> 
> In general state should be a functional, but we shouldn't assume that.
> There is always a possibility for a subtle bug in a driver that may put
> h/w into a bad state. Full hardware reset is encouraged by users.
> 
> > Another point is, with present logic the reset is not applied for every
> > runtime PM resume of HDA device, which is confusing. It depends on the
> > state of 'chip->running' flag and I don't see this getting cleared
> > anywhere. Would you say subsequent HDA playback happen under a dirty state?
> 
> This is a good point. There should be another potential problem in the
> HDA driver for newer SoCs because apparently we don't re-initialize HDA
> controller properly after runtime PM resume.
> 
> See hda_tegra_first_init() that is invoked only during driver probe, it
> configures FPCI_DBG_CFG_2 register on T194, which isn't done by
> hda_tegra_init(), and thus, this register may be  in reset state after
> resume from RPM suspend. It should be a bug in the HDA driver that needs
> to be fixed.
> 
> On older SoCs: HDA resides in the APB power domain which could be
> disabled only across system suspend/resume. HDA is only clock-gated
> during runtime PM suspend.
> 
> On newer SoCs: HDA power state could be lost after RPM suspend/resume,
> depending on the state of display. I'm wondering whether HDMI playback
> works after DPMS on T194+, I assume this case was never tested properly.
> 
> It looks like it should be safe to reset HDA on runtime PM resume
> regardless of the chip->running, and thus, we could remove that check
> and reset HDA unconditionally. Will great if you could check/test and
> improve this in the driver.
> 
> I'm also wondering whether snd_power_change_state() should be moved into
> RPM callbacks and whether this function does anything practically useful
> on Tegra at all.

This call is mostly for ALSA core stuff, and not necessarily
reflecting the exact device power state.  The major role is for
controlling / blocking the device accesses at the system
suspend/resume, so it's correct to set only in the system
suspend/resume callbacks, not in runtime PM.


Takashi
