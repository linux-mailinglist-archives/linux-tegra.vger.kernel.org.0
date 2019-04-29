Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D396DC51
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfD2G4K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:10 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36143 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4K (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:10 -0400
Received: by mail-lj1-f194.google.com with SMTP id y8so1902147ljd.3
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+ZB1sFFo27zRZDgBBI31WcFFAlY9JKLINEYBzNw1uGk=;
        b=G3LmHlRhF3x6CMXyz+dXd4Po9lusBT4MIJ6vebJY++patQLWCP2Xg5F4wpDtoT9gqU
         QPxNWFF3IyhX1flXad5oKTkDdApIS1H53083TVSa4NwHa8w0iM+lQpnoiV9yXYmKO5sS
         /uVkX4ihs/BY5ozXUhAiKv7nQCNGjhoceQiNr61QYy7OYv3LfzpM9yd7sJSglfVCr/rN
         rnFvPP1/tt78KD0awCjxc7x4/2c6Ta8j2EFN7OQkddI5W8QW90IiBc4DQFe2F1OA8PIu
         IDigKJjU9zbPlTZi/8JHDxc0BDuuGEQn3hmjQun19ZJeNeBz2qjlpy/8jNjxbadbNnt9
         JEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+ZB1sFFo27zRZDgBBI31WcFFAlY9JKLINEYBzNw1uGk=;
        b=TH9t45jz63TRy7OH0ReyQDoWY/CLdMrTizEdNjSMlI40ejBzKFclG20rCJhWa/KKnl
         6wYTFFrnloZGnwgvDbj24SArVnDbfkPVlmXpvAPe3EgIVU3m9Gp6Axd3ISxWFGb18sgx
         /Psk0noi9oeojoaKxmydzxyDxU4lnHYks07uqcpKjb8dsC/X1gQmGDaeGN8rs1XpBzTN
         FrhSAMymtlDrnp0uyLipac6ocx9ydoFEH1GJ6m8FAhR4o6qR50+/VvadSbkg7t+Sy8rP
         JUnRySCDHe1TQbWR6OpDOQx5sSy/azLOWJpQ5siLkAnwtZ0Fi1JMvRk2iIXIXXvIL5dE
         EpAg==
X-Gm-Message-State: APjAAAXewlxtk4esFPDWGtKE6puU+QF0C6lQfM4FqwudvP440yKg1dbK
        03QRyL84MPg8QED4bU47ZroR1g==
X-Google-Smtp-Source: APXvYqzDCbmGxyphq6w/Zhz5tZSINI/L/+UQ/XkwPirfMMhNpOPCUDg9JBXun2jegTX1PBU22N3j0g==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr33820909ljj.54.1556520968555;
        Sun, 28 Apr 2019 23:56:08 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id z17sm6669536lja.26.2019.04.28.23.56.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:07 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:36:38 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/9] ARM: tegra: Default configuration updates for
 v5.2-rc1
Message-ID: <20190429063638.ar46f6wvqr5opyff@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-7-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:18PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm-defconfig
> 
> for you to fetch changes up to a6f3d883a6ef19feee1d80bfd90701627b01b98a:
> 
>   ARM: Enable Trusted Foundations for multiplatform ARM v7 (2019-04-17 16:36:34 +0200)
> 
> Note that this pulls in a stable tag from Tony that brings the multi_v7
> default configuratio up to date.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Default configuration updates for v5.2-rc1
> 
> Enable Trusted Foundations support in the default configurations for
> Tegra and multi-v7. This is necessary because the symbol is no longer
> selected by default.

Merged, thanks.


-Olof
