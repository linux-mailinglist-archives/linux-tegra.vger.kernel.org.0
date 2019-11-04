Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E6AEE3EA
	for <lists+linux-tegra@lfdr.de>; Mon,  4 Nov 2019 16:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbfKDPew (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 4 Nov 2019 10:34:52 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38280 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbfKDPew (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Nov 2019 10:34:52 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so12606215lfa.5
        for <linux-tegra@vger.kernel.org>; Mon, 04 Nov 2019 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0gabzbcN6HoP1fcW8rRQwTiWAfln2GdvFDb/MI3l/i0=;
        b=IOqYZNx/IPFHvHpYJ+rhC42LkAiWaAau9HFoFCT7ulY5F0hQusqkGJ4/veL0R/0xDV
         cqrC6MD0dvm+RoPAwWskx9cmzLr9hkN1n2tsqYyTUTn7muIgN/T5mWFi80JDYTArpH8w
         Nqp2eL/sovyZOvpy+//buIrfJE50L31shUhsr0PjpmV5rNNmBApBtmTfsKZ4cPsw9JDj
         AY/oSs0KTHlpgRI/3KX06+Zfad9gCZ1DIZOMGSTOdmspi51cIavvIg3C5+VJnHs4Kbh4
         Kq450queF//+T6VUcfbr9R6OMwtgyFmbkAfsF9C5ai1Yywm9t8ykFqX2Q3Tb/vUSNaAl
         sNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0gabzbcN6HoP1fcW8rRQwTiWAfln2GdvFDb/MI3l/i0=;
        b=coyAQZlelMBK7Xz5YCSLj1mN/eAhVpUh2lyKApnOth8giigsWQNYJNYksLI/DpRCxJ
         zAGllWBhFoyc8+zrtB85dlPeHkIjumn1rBc6lmb80cTuy0zXNbIU5Q4h7qkzS+8braBG
         WCUiXNTZU8JAx3WeT5JetD7vyWLZqt6tDZUep1zfZ0HHZ2BPaXGrEzZaxnfvyrcRZx8w
         aUVnTDgWdWTm2MCe6+3d0GLIEhfyccOWjw0GyHAXcVjTTkuormp+Cq6XZEJPcH5cLD/1
         NmqNhtCyUh/X1DS99BEQ2gKvtivOF5a69Tzx5oKTGrClqXBR3LAzh/Gq/sgzJ7Zu/gU6
         NjnA==
X-Gm-Message-State: APjAAAWKbys+FOk938zddAsviEHOxeWdAuKRKpvgEgoZ+kaacFPuTPvS
        E/64fObY2Z/cQQViar1tyJQ=
X-Google-Smtp-Source: APXvYqw/Hd3oe13Ml69hxm/kawRVKW8ejyKPwqDa5LTJm7HwGVnQEOY7hXlPSB525pBAlJDorSGHKg==
X-Received: by 2002:ac2:5df4:: with SMTP id z20mr16987159lfq.2.1572881689352;
        Mon, 04 Nov 2019 07:34:49 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id e14sm7517732ljb.75.2019.11.04.07.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2019 07:34:48 -0800 (PST)
Subject: Re: [GIT PULL 3/8] memory: tegra: Changes for v5.5-rc1
To:     Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
 <20191102144521.3863321-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2f1c8899-ffda-51f0-64f4-48aa23dc1823@gmail.com>
Date:   Mon, 4 Nov 2019 18:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191102144521.3863321-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.11.2019 17:45, Thierry Reding пишет:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> 
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory
> 
> for you to fetch changes up to 8b04225c4464422f185e62c2cedfb9e234423814:
> 
>   memory: tegra: Consolidate registers definition into common header (2019-11-01 10:57:37 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> memory: tegra: Changes for v5.5-rc1
> 
> This contains a couple of fixes and adds support for EMC frequency
> scaling on Tegra30.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (11):
>       clk: tegra: Add Tegra20/30 EMC clock implementation
>       memory: tegra: Don't set EMC rate to maximum on probe for Tegra20
>       memory: tegra: Adapt for Tegra20 clock driver changes
>       memory: tegra: Include io.h instead of iopoll.h
>       memory: tegra: Pre-configure debug register on Tegra20
>       memory: tegra: Print a brief info message about EMC timings
>       memory: tegra: Increase handshake timeout on Tegra20
>       memory: tegra: Do not handle error from wait_for_completion_timeout()
>       memory: tegra: Introduce Tegra30 EMC driver
>       memory: tegra: Ensure timing control debug features are disabled
>       memory: tegra: Consolidate registers definition into common header
> 
> Sowjanya Komatineni (1):
>       clk: Add API to get index of the clock parent

Hello Thierry,

I want to point out that it looks like this patch from Sowjanya
shouldn't belong to this pull request because it is unrelated to the
memory patches.

Also, this patch haven't got an ack from the clk maintainers yet and I
assume that it needs an ack.

I'm just wanting to get yours attention in a case if this patch was
added by mistake. If it was intentional, then perhaps it should be okay.

> Thierry Reding (3):
>       Merge branch 'for-5.5/clk'
>       memory: tegra: Set DMA mask based on supported address bits
>       memory: tegra: Add gr2d and gr3d to DRM IOMMU group
> 
>  drivers/clk/clk.c                   |   17 +
>  drivers/clk/tegra/Makefile          |    2 +
>  drivers/clk/tegra/clk-tegra20-emc.c |  293 +++++++++
>  drivers/clk/tegra/clk-tegra20.c     |   55 +-
>  drivers/clk/tegra/clk-tegra30.c     |   38 +-
>  drivers/clk/tegra/clk.h             |    3 +
>  drivers/memory/tegra/Kconfig        |   10 +
>  drivers/memory/tegra/Makefile       |    1 +
>  drivers/memory/tegra/mc.c           |   52 +-
>  drivers/memory/tegra/mc.h           |   74 ++-
>  drivers/memory/tegra/tegra114.c     |   10 +-
>  drivers/memory/tegra/tegra124.c     |   30 +-
>  drivers/memory/tegra/tegra20-emc.c  |  134 ++--
>  drivers/memory/tegra/tegra30-emc.c  | 1232 +++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra30.c      |   34 +-
>  include/linux/clk-provider.h        |    1 +
>  include/linux/clk/tegra.h           |   11 +
>  include/soc/tegra/mc.h              |    2 +-
>  18 files changed, 1797 insertions(+), 202 deletions(-)
>  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
>  create mode 100644 drivers/memory/tegra/tegra30-emc.c
> 

