Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17E21D528B
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgEOOxV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:21 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16949C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u188so2999123wmu.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=daJIaHtEcsY5ucOdxwXsEadgUyi229pnexQf+rQw1kE=;
        b=rof2rvoEmfhNVAMRabYVfiC8mwUFzqLo5XQZtVhYYWCKa/rBWl7+ZOstKaX7aFhIH8
         oX0eGFuJwSbvNCBu0hqD6E73YM3PtnJnKuwFSfpDzWoKZO/GZeiiV8Qa/lLkWSDB5bx7
         +RpmDU2DWyvQ9sPZj1QdeqP/l9r8Yi0EB9/vwxzHUjDDa9EmphcFZLFzC4wvT6qJ+l11
         +Cqk6fu7yF1aVMQaAHLbOHeBrfG68BDXE5kU/fHSSVIVNUBNUHBdpCEYewBDNsLydZzV
         ug82ZL3wDDhQZHZtQSv1ueQeEY2Zz6nyNsd2UvCN8OBrGPZLTyA4KELT9NW4qdcB8CvR
         wlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=daJIaHtEcsY5ucOdxwXsEadgUyi229pnexQf+rQw1kE=;
        b=M2Os5ZrCoYAFS3O58aGbCihd4g94Wn6LYXi/4xVo68fbHqfnmrCRvY1QyK+TkdOevG
         DvhAFJn46G7iPMsuVZgWoRnvUujwnorYmTQVe13K9HFS81RBw0gHwlt5yrGoMJ/zF1Fm
         LiT6Kg7YpSFKhFDvp8EUqBGZfCr8j2d3JF97uxC2FPJwvKm3sluLX9sM/rEtnFtZAdB9
         kswITmRwtRSvEp0rj/hWwjw8UEkn60f2MR+Dh9sPg49r3HjRPp1ZFoOG4ZQ3SO8cQvva
         9AFYRa2p8DePPGXo0AC1L8HhCQ6V8oPIfYUc/Gq+EXTZM3tV+cPhZSG5xx4MYPZZUl1g
         Gt4A==
X-Gm-Message-State: AOAM533/FdieiPVE4N7uTTGnkGooPkWLUZE3Lo1A2Oz3/fJZuChY2eyD
        2kYPrgzG5V766BjBdOSoBbM=
X-Google-Smtp-Source: ABdhPJzxsM3zV+aHCxZa6T3PLyBezMGeRRfXMUDrHsSap/mVYjf8XlvDByTCRNAGgCaH20BksqoXog==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr4548864wmb.85.1589554399790;
        Fri, 15 May 2020 07:53:19 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id x17sm3903589wrp.71.2020.05.15.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 02/11] cpuidle: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:02 +0200
Message-Id: <20200515145311.1580134-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-cpuidle

for you to fetch changes up to fafd62e7688096dcfe4107d7a2f6c7c6eb6045de:

  cpuidle: tegra: Support CPU cluster power-down state on Tegra30 (2020-05-06 18:42:55 +0200)

Thanks,
Thierry

----------------------------------------------------------------
cpuidle: Changes for v5.8-rc1

These changes add support for cluster power-down on Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (4):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend
      ARM: tegra: Initialize r0 register for firmware wake-up
      ARM: tegra: Do not fully reinitialize L2 on resume
      cpuidle: tegra: Support CPU cluster power-down state on Tegra30

Thierry Reding (3):
      firmware: tegra: Make BPMP a regular driver
      Merge branch 'for-5.8/firmware' into for-5.8/arm/core
      Merge branch 'for-5.8/arm/core' into for-5.8/cpuidle

 arch/arm/mach-tegra/pm.c                     |  4 ++++
 arch/arm/mach-tegra/reset-handler.S          |  7 ++++++-
 drivers/cpuidle/cpuidle-tegra.c              |  1 -
 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 6 files changed, 33 insertions(+), 10 deletions(-)
