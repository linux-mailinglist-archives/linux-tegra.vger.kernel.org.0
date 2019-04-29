Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A034DC4E
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfD2G4E (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42831 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id r72so3939398ljb.9
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zHkG+SMOmuYh0x55+NYcKvwxOBL0m20KOTamUzT9OqQ=;
        b=ynD7xMn5g0D6hUEO2JO0mXGyxHe2akZfDjVXW1UAx+KmfJDVhJPd4MvNpLZXgO/432
         /39BoHrX9BSTrVZ/Ud9F+mLiKQKP9az+xZS42+4xNZBZjc9YNbF4VwcSTd+yKwb9fj71
         OeWcJuD8WsSkD0UVRod2ZK0wBJXZBbCPu3OhkuUjNuUF6CtViSqgkReg5XVzEOfjQMCx
         ou2XYkk9wZ1aL59jNYMSwOJNPZBiZTR+nZM8H3VqyD8ZjV/cQBkjPks00opB5q9PbVu8
         klRYd2Sbz0w6L/UBB2KdMwgAMaXqeAUzvqu+GwgTC4qeKlw6HWtk51+tXUnAZFomCxDW
         +smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zHkG+SMOmuYh0x55+NYcKvwxOBL0m20KOTamUzT9OqQ=;
        b=k4HLoavbUSecjQbpK63IVN014Op3ePj5O0LNWt9LBTbjpgOzllmHJEVwVb0gE5S7dw
         xGGbyO8Sh0egLq3HD1/RLOReWzh7sfWnoKW9GxEQ7oU+anIPTSmlzJmXhnsvk0MUDejD
         BBmjtCmygL71j9ZW2P/S92knf8XnHr5K/sKGiLybqq5otUDBzlQgW4hw1L7M95FxTCXe
         uKQffzeQ4qSFBlYKjExLh7JCLX3GbWBY4zZqrrfpy7/hURWP2FwhO9b3RjW7dPwGaf0f
         HC3NuRr1pTERmasyMoV5yL96XEJQvQWXB3BAWBEaGEFRAUaAde/hPZpeVno+RqcU/8Rc
         rRdg==
X-Gm-Message-State: APjAAAWn/PlBqVSF6HS/P2xp5ER3GomaOQvGng2wmk4Hozy8MKQIviE4
        2fNum8p+3VGpDKr8KFdksak4sg==
X-Google-Smtp-Source: APXvYqyOKPsWvGgxf79WkhSaHaQ3yvTiRInik4xrurTiZ4qZ1BgMv3rS0p9HnghDdt8izbS3Y+xhSA==
X-Received: by 2002:a2e:9546:: with SMTP id t6mr5441747ljh.51.1556520962083;
        Sun, 28 Apr 2019 23:56:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id j27sm7216436lfk.97.2019.04.28.23.56.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:00 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:34:59 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/9] firmware: tegra: Changes for v5.2-rc1
Message-ID: <20190429063459.jeeugziuwejjp5kt@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-3-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:14PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-firmware
> 
> for you to fetch changes up to 4cb5d9eca143f7fbf8cc457be19a91914f978a00:
> 
>   firmware: Move Trusted Foundations support (2019-04-17 16:43:03 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> firmware: tegra: Changes for v5.2-rc1
> 
> This set of changes includes improvements for Trusted Foundations and
> also moves the source files for this support into the standard location
> under drivers/firmware.
> 
> ----------------------------------------------------------------
> Dmitry Osipenko (7):
>       ARM: trusted_foundations: Support L2 cache maintenance
>       ARM: trusted_foundations: Make prepare_idle call to take mode argument
>       ARM: trusted_foundations: Provide information about whether firmware is registered
>       ARM: tegra: Set up L2 cache using Trusted Foundations firmware
>       ARM: tegra: Don't apply CPU erratas in insecure mode
>       ARM: tegra: Always boot CPU in ARM-mode
>       ARM: tegra: Add firmware calls required for suspend-resume on Tegra30
> 
> Thierry Reding (2):
>       ARM: tegra: Sort dependencies alphabetically
>       firmware: Move Trusted Foundations support

Merged, thanks.


-Olof
