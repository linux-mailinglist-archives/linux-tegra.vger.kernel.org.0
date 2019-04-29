Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E33DC4C
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfD2G4A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34095 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2Gz7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:55:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id h5so7112974lfm.1
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gPQsQl5DbplSfFbVdX++VLIXgPaDaUws6vt+OIBgHr8=;
        b=J9UjhjCryUvkYkVVI9jh94+PMtfqn4jL4SZaQSY/grUol0iDd105j9M7rqaSzO3DbV
         WSivbp1Ahv/UbhX+9M19V+C6q3WtmWkKv6h8uBa19K00tK21Kbf9d3BEytdoagUbQDgM
         MdFcaRrfseo19+m18603YTLph2aWtgZiU5v8SbTIdh6AdWbihGMVe6VyjgEE7A7b0Tqr
         2Bf2YAmCkn20ogCigG1dukQzzMiCqtU7rbvJSwDEu2vPYUOQxBcS55YYJN7C+Sgnwa2H
         FZQxowNJPDnIwCUf04c3IgZQyzwoGB2Hxb2XelowuhE8quzt+v3LXFiDfMOK+dgd81F9
         q/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gPQsQl5DbplSfFbVdX++VLIXgPaDaUws6vt+OIBgHr8=;
        b=Gzf8n5dZ2S3NOu3hXGK6TVdIr41iBLPJy3sPQKXWLm6G3966oZLETZLcaUmoieXRwh
         umemqxV69a0hUyjzTMmpqysPN0PBfR0T/6JwgkCEFOdswysIpOHNGuCoJuIKYElq6shA
         a/YiIlL6DJG1ur2mJjFgc62yCUk9QxcvwI4CsNELAgrW4Vtwx49Y32KTRNMhEUy5Hk3F
         ClDytoFO2cEeaPowQDY3d4fM+kKFxdf7uYhpRh7sl1izJALN1oVAsO0N//VTxSQaAXtM
         X95tFH6YVJexce1zSkKpE/+2zDzmzuSjtnKNi+KFw53YI0zgF4ya5F81Svre87ji2M/k
         aGtA==
X-Gm-Message-State: APjAAAUDOSIOP4bMSzk+4YmkNJ6/Wnfyzw/K2FR9QviXAeIxsLk8c2bA
        Rey3Kb7f8vyTmvEBCg4GAztBdHSDARl2Jg==
X-Google-Smtp-Source: APXvYqx4JKo/xgBS0TsZVz9djajHWTq3Fd0rpbr2pkvA+KKO4jlEJz6bJ4UfAf8XCKaUM7NuZaPD4Q==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr31377407lfm.160.1556520957500;
        Sun, 28 Apr 2019 23:55:57 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id b78sm7163487lfg.38.2019.04.28.23.55.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:56 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:33:35 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/9] bus/tegra: Changes for v5.2-rc1
Message-ID: <20190429063335.a2llr3ud2qnp66ol@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-1-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:12PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-bus
> 
> for you to fetch changes up to 1427736e64c3a8b513cd984332f596055a7ca196:
> 
>   bus: tegra-aconnect: add system sleep callbacks (2019-03-28 17:26:14 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> bus/tegra: Changes for v5.2-rc1
> 
> This pair of patches adds support for system sleep to the ACONNECT bus
> found on Tegra SoCs.

Merged, thanks.


-Olof
