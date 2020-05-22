Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215A31DE8F2
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 16:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgEVO3B (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 10:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgEVO3B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 10:29:01 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5A2C061A0E
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:59 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id x20so13221019ejb.11
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yhDyyGIK852ZcV9cF3CJIrqL1AAvlaguqb4kRBecU0=;
        b=tsapIh29wQPr65wVhWHMcEL9iTrKSePjEa3828dghEM1UPB43L/NM8JY0fRbqfRjeo
         63sYE+9tcxkUBOO7NjFIAbvRRBa4WPQiz17JRj++8oV7iXLZrS91HJ46CJ33VfqoefAi
         qADPb2wfO6qANRH3pwSI2FB7Y8YcU37X8UbWUwO92ogusUOkImnrh2RXuDLI5FBjl4sY
         ERNYuloCP/RPy4FYvq2LLa6pdstEtsMWhuTgsLcfN1eSlllgM8tuPWdRzq7Ckssr36YA
         nr8Qoij+364igxpNz6+BtR2tQ2QNNJkkUTa+L4GpppZvSjY8q8sRggK2++aOFD4t6jqP
         jZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yhDyyGIK852ZcV9cF3CJIrqL1AAvlaguqb4kRBecU0=;
        b=BX6S+BYl/aUSY6VElsogTHo7+PWOocV2dFzM3Zrtrr3kJAk4na2QpMZ07FsHNVrWLE
         6gN+jniOM4TD5SFadIuEfQIy7YjX75WY3NCpNvrSPa1414liVjISqKZVMomEn28igyDk
         wH1uVsf4w2vGGOiYys8EYlbrIvcnBV2ijMzR2kc0NMtQRWXUabL0HroZiOaaE8Aof+iI
         Jt+ab6L0KgHVS9b+SGo3GwZDtMAENsYy4OYBvqptimAnwyT246AlBl0dtld9fBlvBJ/E
         /bYDscfwgvj8sduvBXV3oQKQzxGjc+jgj8hAzzJJc3YQKE4ypcG/+sPgPx6rxtgeAk7M
         +R1g==
X-Gm-Message-State: AOAM532ckKlmBsFskJ+jKejt+5jWQZJKuO2nlH3QubjplL0tJEwfYrfO
        ha3bPzXdoNJZ7b/HO71METo=
X-Google-Smtp-Source: ABdhPJyI67fZVtsaB0pNl/umXx3NPSZKJsGS6VM5z5c9WsRc3vS4rXJtCSMRHpmN/iiyngYCVm3EwA==
X-Received: by 2002:a17:906:407:: with SMTP id d7mr8278768eja.46.1590157738306;
        Fri, 22 May 2020 07:28:58 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id x1sm7996111ejn.57.2020.05.22.07.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:28:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Date:   Fri, 22 May 2020 16:28:46 +0200
Message-Id: <20200522142846.2376224-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-12-thierry.reding@gmail.com>
References: <20200515145311.1580134-12-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm64-dt-v2

for you to fetch changes up to 358a6777f5dd293bc3c075af6fc8c0dd18774c96:

  arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1 (2020-05-22 14:56:54 +0200)

This is a slightly rebased version of the prior pull request which has
the commit log cleaned up as I mentioned earlier. I've also included a
patch to enable resume from suspend via the PMIC on Jetson TX1 and
Jetson Nano, which will help us to test suspend/resume in our test
system in a unified way.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.8-rc1

This contains a couple of fixes for minor issues, enables XUDC support
on Tegra194, and enables EMC frequency scaling and video capture on
Tegra210.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
      arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier
      arm64: tegra: Make the RTC a wakeup source on Jetson Nano and TX1

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

Thierry Reding (4):
      Merge branch 'for-5.8/dt-bindings' into for-5.8/arm64/dt
      arm64: tegra: Hook up EMC cooling device
      arm64: tegra: Enable VI I2C on Jetson Nano
      arm64: tegra: Make the RTC a wakeup source on Jetson TX2

Vidya Sagar (1):
      arm64: tegra: Fix flag for 64-bit resources in 'ranges' property

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     |  2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  3 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  5 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 30 ++++++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  3 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 10 +++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  7 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 89 ++++++++++++++++++++--
 include/dt-bindings/clock/tegra210-car.h           |  2 +-
 9 files changed, 131 insertions(+), 20 deletions(-)
