Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A201184D18
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgCMQ7G (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38550 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id t13so4716620wmi.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pl3mvQUZlYeLm1+9mgGrbjOiFn06n8Rmi/zI05KnQ6c=;
        b=aKUCCumZnOm/aOCa1h+Bu2EL821dLnsht0b922Vfoip5qX6Z5JPEHlIl8ibmvo3/Xx
         tp8f0d7WGTvmSZC1ztxXf/WWYbpv6CXcgbMIB+ysQWJBv1pJYnx6d3NONoOpkjY8m202
         RZx+dZwSdJ8GT+DjnRUYvaL8DJ3vN8A0cXaIzL+kRoJZmsDzIghLoxdFtfGGQHw4m/mz
         Ncs2X0DymxvJXcELii9hyH+2XIFBhgzlJg4eUVD2FCsbHRtQ8MDlh09UQ3xZLLnhJNqn
         D3EJXmOjPQ82HO5h7PwdkapiTd7LLLFdHtGkz1o173WSuqIjkvAwVL9zUFp+6ySbhTcx
         0e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pl3mvQUZlYeLm1+9mgGrbjOiFn06n8Rmi/zI05KnQ6c=;
        b=Wv9zoK1jXgx+krpchgpfVCbuqXg47IMEoOcwsBf2FjD+eAst7vZ6112W17gDanw6jz
         gq5zyHy3xkOt+8EHS3lIspX77A08Q9mIKSh5BfO3ak+NIr8X3/D4dKfpKDY1s1xnQ919
         4/h3d2umt8EqVUw5iUQDEq+oAvav4v1YHgZIw7HKreqvkGrl2hsUfJW2YldR/56BM5l4
         FdWLwqDvg3T9/oaQ6OJR0J6tbHWgVCHOpXuAj11yc35GPaK6kqaegcL0nAikJajO06VQ
         0kXZraT1BETaxA6LpcIbbBTlwvGdKxO01N/jZIcPME0tUzofA5fBOclZ3xb42LTgF8uf
         IoNQ==
X-Gm-Message-State: ANhLgQ3cAsK/xzANfa5XmJSwIyc+WNSwZd74re5A5xXIWRcUDqg4VyXe
        EEDYrtqe/y5AZzBdW3EMZUA=
X-Google-Smtp-Source: ADFU+vubdaUjSrckubQn283ZoaceATczfJE+/H8q4lZRJsVazTtdHkVB7euKf6/lnLil+u8FJlutow==
X-Received: by 2002:a1c:41d4:: with SMTP id o203mr11378963wma.1.1584118743682;
        Fri, 13 Mar 2020 09:59:03 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id m11sm33643370wrn.92.2020.03.13.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 05/10] ARM: tegra: Core changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:43 +0100
Message-Id: <20200313165848.2915133-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm-core

for you to fetch changes up to 650a941c341b880dae451e36dd8e47f3762a3909:

  ARM: tegra: cpuidle: Remove unnecessary memory barrier (2020-03-13 11:23:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.7-rc1

These patches a preparatory work to move the CPU idle drivers into
drivers/cpuidle.

----------------------------------------------------------------
Dmitry Osipenko (11):
      ARM: tegra: Compile sleep-tegra20/30.S unconditionally
      ARM: tegra: Add tegra_pm_park_secondary_cpu()
      ARM: tegra: Remove pen-locking from cpuidle-tegra20
      ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
      ARM: tegra: Propagate error from tegra_idle_lp2_last()
      ARM: tegra: Expose PM functions required for new cpuidle driver
      ARM: tegra: Rename some of the newly exposed PM functions
      ARM: tegra: Make outer_disable() open-coded
      ARM: tegra: cpuidle: Handle case where secondary CPU hangs on entering LP2
      ARM: tegra: cpuidle: Make abort_flag atomic
      ARM: tegra: cpuidle: Remove unnecessary memory barrier

 arch/arm/mach-tegra/Makefile                     |   6 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c           |   9 +-
 arch/arm/mach-tegra/cpuidle-tegra20.c            | 111 ++++++++-------
 arch/arm/mach-tegra/cpuidle-tegra30.c            |  27 ++--
 arch/arm/mach-tegra/irq.c                        |   3 +-
 arch/arm/mach-tegra/pm.c                         |  54 ++++---
 arch/arm/mach-tegra/pm.h                         |   4 -
 arch/arm/mach-tegra/reset-handler.S              |  11 --
 arch/arm/mach-tegra/reset.h                      |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S              | 170 -----------------------
 arch/arm/mach-tegra/sleep-tegra30.S              |   6 +-
 arch/arm/mach-tegra/sleep.h                      |  15 --
 arch/arm/mach-tegra/tegra.c                      |   1 -
 {arch/arm/mach-tegra => include/soc/tegra}/irq.h |   8 +-
 include/soc/tegra/pm.h                           |  31 +++++
 15 files changed, 150 insertions(+), 315 deletions(-)
 rename {arch/arm/mach-tegra => include/soc/tegra}/irq.h (59%)
