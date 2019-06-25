Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A354FB3
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfFYNEi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:04:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40876 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNEi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so16168931ljh.7
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2zOQyrtvUDW6ArA1LQxPYYIsqo2yCVY1e6qoWCiPcR0=;
        b=rxOgYOaTGquyezcJBBosGht0L/NnpgjymTC8JWIQdpVPywMvS8we0LMxfazo50IJn4
         szISpl7g6iP6lD2PtiYn+EWisK5SnEjFEVfvWvpu7kpzF9pPohr8qwKgKtTGf+SnRRQ7
         Cc8rSibRS5++TSHPHm2tzcvXiZ5TaOpX9PHAydfSlbneSXFYt+Qyd8+yChkXWWIgwWON
         nvetE6DfPb7kMfC0Ic0GJa7bRLcTnj0drJR8A3RUA32hXMgnJE0B7jAkdduIVO/FQ4cN
         hhsS7n1gp65+gbCvFNSPXnnn2iVxp1nNnBRy2oLmi41SKcG7aiAccCkd4yvEIZzSqicr
         f5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2zOQyrtvUDW6ArA1LQxPYYIsqo2yCVY1e6qoWCiPcR0=;
        b=rvcId/xKJjCtZ5BAttZv19oyk/QRlCSEd1DKvTqOnGAej3CjB1tVs5XPnYeKm2LF2I
         1PBN6QgTwuU0ymj4dgDSMnCMjeMS84pim43SqsBQCxvbSKN1WHSoPZiJ8N5bB6tssoHF
         bb7l7+NbtFN4SC+x26ywrnViuP6lXQqFVFID3Ph+5Twgh1KSTj+Omep9PAYt8Uyi/y2W
         sAwS2zga6IzdfVZHgQ6IYrkxt4LYwpEF5l9mXPfDw8U2CsCm1snbk1a8YLbiIsvk29AV
         DiNgbaMacL29eGwATq5+9wt1Kzwgv6ObZKNAH9UoXn5Qtr+ORwVYCLz+oJ1CmEivDjRe
         pOSg==
X-Gm-Message-State: APjAAAXJBoqS+VEfvesOna7nrewztEophYBHm67A6MUlQR1+1RlTR6kY
        halk47JfHGbwqQUhfeYVSiCHvg==
X-Google-Smtp-Source: APXvYqwL0bsvvDeXmDKk7Ob5p085vp/omAFpfgiZ4BKegUVhss7kIN4gFC7dOwWgQrl3DtxhtsBI9Q==
X-Received: by 2002:a2e:860d:: with SMTP id a13mr69632728lji.215.1561467876538;
        Tue, 25 Jun 2019 06:04:36 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 2sm2226094lju.52.2019.06.25.06.04.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:35 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:20:09 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Default configuration changes for
 v5.3-rc1
Message-ID: <20190625122009.f7px5fojvmql5vbc@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
 <20190621150206.19037-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-5-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:06PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-arm64-defconfig
> 
> for you to fetch changes up to 01d6fb565b4a7858af1699727f25da2279d75deb:
> 
>   arm64: defconfig: Add Tegra194 PCIe driver (2019-06-20 13:02:27 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Default configuration changes for v5.3-rc1
> 
> This enables the INA3221 power monitoring driver that is used on many of
> the Jetson boards as well as Tegra194 PCIe support.
> 
> ----------------------------------------------------------------
> Nicolin Chen (1):
>       arm64: defconfig: Add HWMON INA3221 support
> 
> Vidya Sagar (1):
>       arm64: defconfig: Add Tegra194 PCIe driver

Merged, thanks!


-Olof
