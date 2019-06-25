Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB67654FB6
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfFYNEv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:04:51 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39902 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNEv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id p24so12568578lfo.6
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQzUmO/yDPryTDEQ3h0y0bVtCB5daoADnlN5nOVyMMw=;
        b=bCVsNv5e5J0DQJ40FfhYgOy1q/MUPEySUEeS5QAfqvrjKk8oYduCz04Ybw4a98kb4+
         B5+uNxPXPMIBXiMt1QHCdzWTWU3xBt8fCvoHdq1tIZC81NjKz45z5HDISjNES/iifk6m
         WdK/ZgVvTaPD6pcuTj+2erFj5czL3+47idB8l/yj0oYjS9WBr3IzocTXD+txtszGqwRz
         jpDmmB3MVfA7LxBay9O6BiXVY/GM5CnMJpOEqsOM0RQMIxW5vSpaLr6i/6Oz2B62W8bh
         OuAD0JpmjoE1BkoVe7B9Yb5L5y+VpWCZs/yrhC9i3dAAJB7y7PnCD2XD3m+FDtONiI6o
         UfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQzUmO/yDPryTDEQ3h0y0bVtCB5daoADnlN5nOVyMMw=;
        b=q6fvBnW833zEn0bLBA008WWNW7XX0/D4qB0a4Yd52OP2GBA0jstDuSIpLk/5uLi2Uv
         nIgslB2UANLIk945RsAkONIookQ3AdmmfgwtSeOjdGcMywDPtZSLw+49ocfPZgQ6D55S
         boVpgwuZhd24fSKY44eCHuVuxkX553N0HC/PFxm95hh1FK17VZYbUvda6bS51JH7D1au
         AX9Sg8n1+J59bMAP5bBzmQd+TPtkcpuUyUHWBLTBwE1caHEXRyyYuctXXaWAU6cbRn8W
         I1lDj+DG8i13fuvIuFzv1v8R4KeTR8L8ENeaG4eRGKtgmmSd0XCdZgt/VAnvu3eGMrbA
         ZYQQ==
X-Gm-Message-State: APjAAAVbe/HGLwBrcJPKkJOlTAkIXmj2xsp6HXQdpPftvkwJV0J7MBMt
        k4HbA7MeM/lBNKfMuzxWus5WGw==
X-Google-Smtp-Source: APXvYqyI2hHLxBxby5RkiQn4JKsfR70VLafaWYQ4ovy6vtoE2UUiMLjtC3JanTeQ1zrv8W6cfAK8dA==
X-Received: by 2002:a19:7f17:: with SMTP id a23mr38316385lfd.49.1561467888965;
        Tue, 25 Jun 2019 06:04:48 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id b25sm1941545lff.42.2019.06.25.06.04.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:48 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:42:00 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/5] firmware: tegra: Changes for v5.3-rc1
Message-ID: <20190625124200.toijgcugdtxheaxd@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:02PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-firmware
> 
> for you to fetch changes up to 61ed7ef952fc482ec8d4a966ed0d1e32df276c59:
> 
>   firmware: tegra: Early resume BPMP (2019-06-14 17:45:17 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> firmware: tegra: Changes for v5.3-rc1
> 
> This contains a single, simple change that resumes the BPMP driver early
> so that it is available when the various consumers want to enable their
> clocks.

Merged, thanks.


-Olof
