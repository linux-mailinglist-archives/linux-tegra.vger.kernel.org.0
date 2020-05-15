Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172C81D5295
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEOOxi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726513AbgEOOxi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:38 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C713C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:38 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y3so3934413wrt.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tj3Ug969GMfKE+qJfwXifWzO5/OE6vledFrhyfcDys=;
        b=odH/pqbUAl1+wpC3oAZ81PV0VmhkR7TIrE/kyrr0Thrf8rcRZooBzK97YrIbCE8mlA
         JK8hfXseYHaj/XfA466c6gnQwR+jNTdmDq8nny9UkdtKhE5M2jf8swR0wE88BUhxLe2E
         JMLNU+wDU7e7Jvde4Cz1zxhA5ixhQzC0AnTKSYjcGg5rUOC0yG0inf9Mr4zCYlETibxm
         YpawCAJABwfU6jIZUiH20x22ws7JV5DOWqrIFS1Uqbl+eWdwk6MJp7BhDfhbL/i4LM1M
         xlK5uL3Ix9RGFLdHj3spNI9XRxQ/AUzgUYNzypeINCGcwylLQ8b8ndgQMN6Q66MMw6sF
         /3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tj3Ug969GMfKE+qJfwXifWzO5/OE6vledFrhyfcDys=;
        b=ftX7kbAfp8C6hneTUWk/rvRnmIz9Yfbq5CDIQUI51MMrL72tC1iX4jrT6/JzO+KBRO
         ydzd0OctlQ8oxWQJEEfZutATFBB6siGI7Vps+CGVWjjj+PzQebqRB4xc6G5jb1q76wZ8
         uJI+7/NMfjllAjFELNyjUMTnllrGVLUG1EfW8K4Soe1itgjjQmGRg0e7+A5jFhk0eSJC
         XWLVetdM10p0F625mlrcXsz2e/52F6UPloE9O5Nq4HOwdUa91cHd472GJgrP806VzgFV
         jCwMjzZZ2s718Edye4Ub09OUpjIOiqQ8c5y3G49YHLXw0K7tPYs+5MrGnj3cr+u/8Wbg
         GWAg==
X-Gm-Message-State: AOAM5306ZfxURlg3UUUeJvQ6zu7B/MjQDskGI/CGyfBFtT0/TQKtGqxV
        wBM+Tsg6k8jTCgM73ZcPnCI=
X-Google-Smtp-Source: ABdhPJwugX/x8QHpbNS8RLSTyUTVjrLazOvxPlzKNa0Gz5tzcuxwGCdxU9D2N7f3IWMT5Ne5WrdSRg==
X-Received: by 2002:adf:e751:: with SMTP id c17mr4912427wrn.351.1589554416787;
        Fri, 15 May 2020 07:53:36 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id 5sm4093690wmd.19.2020.05.15.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:11 +0200
Message-Id: <20200515145311.1580134-12-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm64-dt

for you to fetch changes up to 74265112c60be0209817c682ba68661c05da1d38:

  arm64: tegra: Enable VI I2C on Jetson Nano (2020-05-15 16:28:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.8-rc1

This contains a couple of fixes for minor issues, enables XUDC support
on Tegra194, and enables EMC frequency scaling and video capture on
Tegra210.

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
      arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier

Joseph Lo (1):
      arm64: tegra: Add external memory controller node for Tegra210

Nagarjuna Kristam (1):
      arm64: tegra: Add XUDC node on Tegra194

Rob Herring (1):
      arm64: tegra: Kill off "simple-panel" compatibles

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      arm64: tegra: Fix SOR powergate clocks and reset
      arm64: tegra: Add reset-cells to memory controller
      arm64: tegra: Add Tegra VI CSI support in device tree

Thierry Reding (3):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/arm64/dt
      arm64: tegra: Hook up EMC cooling device
      arm64: tegra: Enable VI I2C on Jetson Nano

Vidya Sagar (1):
      arm64: tegra: Fix flag for 64-bit resources in 'ranges' property

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  5 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 30 ++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 10 +++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  4 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 89 ++++++++++++++++++++--
 include/dt-bindings/clock/tegra210-car.h           |  2 +-
 7 files changed, 125 insertions(+), 17 deletions(-)
