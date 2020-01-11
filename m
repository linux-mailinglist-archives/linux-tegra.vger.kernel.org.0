Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5A7137B6F
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 05:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbgAKE4o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 23:56:44 -0500
Received: from mail-pj1-f73.google.com ([209.85.216.73]:39082 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728328AbgAKE4o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 23:56:44 -0500
Received: by mail-pj1-f73.google.com with SMTP id c67so2633739pje.4
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 20:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RjLzBv4qlo+z7GYjo6uSKDnHrbZe99ibYMQ8E0CYwHw=;
        b=K0QbsSu9JkSBJauq5SjLqo6PxvRTkqJsdB2vro3IKA1ZG8/ckNrvFMDL0SFIQB58t7
         5LDzHFXI7cdYhOTuNUneLFBT83kHI5SmNQ2M9LjhLBuZBpvhRuKFUya/sSZ4OGyqVzo4
         O3eJr0WcfVpg0aDjqZDBEJgLpPAEdVA72EmoflXIRUCp+ryA6TbEDWt9XCO847V5v01P
         Jpzbdu/r+e7UAo4Id9d+rEHxJsJFS5Q4Zlzo/3P8VxNlUWQ5JVgXzswIWioMcVm0ep06
         oexphr6+T1IfwVGVCHIA5cUeqr+EH9BGhFdiIrNcnxWzZ9bAEi6HkhDfCul0USbieNL0
         5Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RjLzBv4qlo+z7GYjo6uSKDnHrbZe99ibYMQ8E0CYwHw=;
        b=QLo+OTqcs3V4ik7Hz0p2laFA2EsnF1CtUc9utdORgiE+IXTWXQiPNBriQF7HVD7LVy
         P2gBOh3AaIQjlPDec2wnoPOEa+tk5jS67Uc2EUja6hE/lkonHCVpmHzAmHsd5grdLFjs
         8pVzMeSub+TbgxZf2qDP18Y3DdyAZ7klRP0eeHo7FhzOmxIupXXG1VvLTuB0zt2jGFRe
         bYier+bMz6Jl/aUgVPoRpTfEfNQfSt4ulvPjp4EABBCYYpgjkI6aDOoHWr6rymErg+zj
         FkNC+4aF4Yf9BN8LFBuSCZ3fOYQq6SPZESnrDk2393+l+xBeiLk6y4WHtCnRV4UiGqBU
         eLoA==
X-Gm-Message-State: APjAAAWr9GQmafQBiLxR6oDnZqHqHiNEEthwwmM1I+Lyn9y2uiWtazcO
        SjslP5us5CKs6Mk7DQVCWolm+tAYZ+CNRNw=
X-Google-Smtp-Source: APXvYqzKmsGlqJpeihD7vxzuMcgio6xYtq4QElmTQfynt8iK9bmE01b6bbQij88VWMmN1+xvy6ZrRXWGp8DXKA8=
X-Received: by 2002:a63:8041:: with SMTP id j62mr8822576pgd.41.1578718603417;
 Fri, 10 Jan 2020 20:56:43 -0800 (PST)
Date:   Fri, 10 Jan 2020 20:56:39 -0800
In-Reply-To: <20191209150748.2471814-1-thierry.reding@gmail.com>
Message-Id: <20200111045639.210486-1-saravanak@google.com>
Mime-Version: 1.0
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
From:   Saravana Kannan <saravanak@google.com>
To:     thierry.reding@gmail.com
Cc:     iommu@lists.linux-foundation.org, joro@8bytes.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        robin.murphy@arm.com, will@kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

I happened upon this thread while looking into another thread [1].

> From: Thierry Reding <treding@nvidia.com>
> 
> On some platforms, the firmware will setup hardware to read from a given
> region of memory. One such example is a display controller that is
> scanning out a splash screen from physical memory.
> 
> During Linux' boot process, the ARM SMMU will configure all contexts to
> fault by default. This means that memory accesses that happen by an SMMU
> master before its driver has had a chance to properly set up the IOMMU
> will cause a fault. This is especially annoying for something like the
> display controller scanning out a splash screen because the faults will
> result in the display controller getting bogus data (all-ones on Tegra)
> and since it repeatedly scans that framebuffer, it will keep triggering
> such faults and spam the boot log with them.

While I'm not an expert on IOMMUs, I have a decent high level
understanding of the problem you are trying to solve.

> In order to work around such problems, scan the device tree for IOMMU
> masters and set up a special identity domain that will map 1:1 all of
> the reserved regions associated with them. This happens before the SMMU
> is enabled, so that the mappings are already set up before translations
> begin.

I'm not sure if this RFC will solve the splash screen issue across SoCs
([1] seems to have a different issue and might not have memory-regions).

> One thing that was pointed out earlier, and which I don't have a good
> idea on how to solve it, is that the early identity domain is not
> discarded. The assumption is that the standard direct mappings code of
> the IOMMU framework will replace the early identity domain once devices
> are properly attached to domains, but we don't have a good point in time
> when it would be safe to remove the early identity domain.

You are in luck! I added sync_state() driver callbacks [2] exactly for
cases like this. Heck, I even listed IOMMUs as an example use case. :)
sync_state() works even with modules if one enables of_devlink [3] kernel
parameter (which already supports iommus DT bindings). I'd be happy to
answer any question you have on sync_state() and of_devlink.

> One option that I can think of would be to create an early identity
> domain for each master and inherit it when that master is attached to
> the domain later on, but that seems rather complicated from an book-
> keeping point of view and tricky because we need to be careful not to
> map regions twice, etc.
> 
> Any good ideas on how to solve this? It'd also be interesting to see if
> there's a more generic way of doing this. I know that something like
> this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> because translations are only enabled when the devices are attached to a
> domain.

Good foresight. As [1] shows, identity mapping doesn't solve it in a
generic way.

How about actually reading the current settings/mappings and just
inheriting that instead of always doing a 1:1 identity mapping? And then
those "inherited" mappings can be dropped when you get a sync_state().
What's wrong with that option?

Cheers,
Saravana

[1] https://lore.kernel.org/linux-arm-msm/20200108091641.GA15147@willie-the-truck/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/driver-model/driver.rst#n172
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n3239
