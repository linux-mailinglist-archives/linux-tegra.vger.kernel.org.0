Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE3DC50
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbfD2G4I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46504 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id k18so6929022lfj.13
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4mJuDcpfepZhdd0xXkv6pACsvlnlYj5A7NA/7mxDxm0=;
        b=NftWDlALhXj/F0Bg56VKdMCnOkuUCO6POKgXWowMqwY3ADOmgjhp8Vh0/YYx6NZVYy
         uxZhiBRUg7Ft1mJAbGv6qOiWRmBn1wRrervyreMNx4WUM+7N5uoc9wTy2Cdat6oZPMD0
         uEMmsqtpVWBIfkkwNmfUOB1Zvt8shVhBQtMezxxzH9XhuoNFP4wvZoTM5TMreISSA+Yc
         PX/Atc8XHYSbPSobfr9xWpFm8PjimXcYY0Gb8c1D5xzPU3RbJBOd4yc4gaHg1QrodpVf
         ZjUUAguCdGCwUDlM+la8baP4uhhw4RFRJ8s9PXw0YC73vSTM7B1hVJQy2vNybKS0SmXB
         hCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4mJuDcpfepZhdd0xXkv6pACsvlnlYj5A7NA/7mxDxm0=;
        b=Ft2tPtOL64R2C1P9osCpkBHYQtCPoh5T5JybgtnImgbUScK59t+hHFcswgu8HtBIHl
         DfWrenEkhLJ3ZbvIGN5bBQuU7J1xl8wBhJvrMtkZMmrqa9gUUQQtUFQvtLvufqhVB+i3
         EWUFHp3QuMxpQIhL9lP2J+yLeCJTL0rjMGn7Z606PPDf03FcKqI6+y9dw08EkTlbwyKc
         M7C+h2ommNso6OHIcppmu/imEtYSdluKlGchNURbWTz/ZbVyNtSBVajW0ysorW2WMOgj
         TFd2lxB/QJl7OxcsqHSsOUJ5NCaJD22i1fSMqj+DCjZTcMX4TjgyhEhvQLP6UNe2BlEv
         wS5A==
X-Gm-Message-State: APjAAAXeUv4c2nVqmiNXpBgPB83fjkdDr8EionD1nGtLQAImeUwKb2e0
        RVQKtCZlYa0El70XT9owr5wU9dkvU52t7A==
X-Google-Smtp-Source: APXvYqzM/HIK4eVjzhz66TxyGrY4HHjDn2A4Evju4tAuiySmQ6okiW/9tTDobRW97icb6nMrOlWxHA==
X-Received: by 2002:a19:751a:: with SMTP id y26mr10591370lfe.47.1556520966194;
        Sun, 28 Apr 2019 23:56:06 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id f15sm7176192lfa.89.2019.04.28.23.56.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:05 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:35:54 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/9] ARM: tegra: Core changes for v5.2-rc1
Message-ID: <20190429063554.mqpd7lkncguqrv3h@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-5-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:16PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm-soc
> 
> for you to fetch changes up to 36841ba2796324507452f9854bf08b2c65836cce:
> 
>   ARM: tegra: cpuidle: Handle tick broadcasting within cpuidle core on Tegra20/30 (2019-04-18 11:32:57 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Core changes for v5.2-rc1
> 
> One of these patches enables PM by default on 32-bit ARM, following the
> same default that we already have on 64-bit ARM. The other patch fixes a
> cosmetic issue in the cpuidle driver for Tegra20 and Tegra30.

Merged, thanks.


-Olof
