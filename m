Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E68C0137AA9
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgAKAgK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40250 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbgAKAgK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:10 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so3452085wrn.7
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IE/B8lJDJdDvcxuIuFq2qqc4guWFpnttAgVt4Kc0orQ=;
        b=fgXOdmpu5/W+zrykGfg/zMG2w+1t4ZsGYpSc43DU9XF2hUtwjVQ/MrEETqF9ut4EVh
         a1Y6G5Bp1xIz27IQtrot+lw6aC/bIs+LjCD9VE6CCgzw72gubLULWOj/+UQ8c5mwEVzQ
         zEvLm7QOTJWVBFw5p7GsvOpfbI7nnBSV2rYCwHT8bfHqiLwoe/u6AdHtmzP1RdfA0yd7
         uPcM+fD7wOK12tzm+cOGaSGcjkrdUvzRtTbWb7IJm44SeLxFfASno9xUBX5JUBv7PeRJ
         JZ2qjiEuTjOEOvbMACU3hgPLjCIzU9sgd5+Y2Q2aVcpPDvqM/lsErqZ1L8PeyomWrdL1
         inTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IE/B8lJDJdDvcxuIuFq2qqc4guWFpnttAgVt4Kc0orQ=;
        b=TZklB2Mjv9lJmAwMf4XVFRjylB1QIi77b79tUSR7zA5esFFRik7rqgFewgjfVrtdIc
         Am5WbEx510OEjIwJ526HzxFTNMcIf94HqiDtSHeJWpFZhSx8XXN3upHOpOSqR2LIaI3L
         R8KcJmFKtUAxoFyIXhDzJpCZsnF4lvnGSdKmf2cM1FSr1rSVt4vY8FlQrV2ZW6mGPo4V
         RanxIr7YOSFNuEZ7OWWfDhlrOoW+JhxTojJrlfNzKq5JU9UYmXO/dDSAkzWGi4UDVWqW
         Cvmtaeuiruk0oKTrFgjte10HH31o/3P1vIpFgwhjYjSFW9XsTGbT752hpOtybTkCa5z4
         6MNA==
X-Gm-Message-State: APjAAAV//dXsBl3DzSfSbPgad2TpkXuuj+hopCFh6QfF8L4hKbKG28Bz
        F3zXTg/hIOUWKSvVkvASAYc=
X-Google-Smtp-Source: APXvYqx1bEgH4MS9+ajTliW2gTn7GRE+wVeS+fhR65QJTy4NUZDj5C+TSmgPW7YHPTjB8V+pok9aFA==
X-Received: by 2002:a05:6000:1288:: with SMTP id f8mr5997069wrx.66.1578702968707;
        Fri, 10 Jan 2020 16:36:08 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id e8sm4250249wrt.7.2020.01.10.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/8] arm64: tegra: Device tree changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:52 +0100
Message-Id: <20200111003553.2411874-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm64-dt

for you to fetch changes up to f41f34ddcee679641ff7d177b37597844d82d634:

  arm64: tegra: Allow bootloader to configure Ethernet MAC on Jetson TX2 (2020-01-10 17:04:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.6-rc1

These patches do some cleanup to existing nodes, add the memory
subsystem on Tegra186 and Tegra194 as well as the FUSE and APB MISC
nodes on Tegra194. There are also a few additions to the Jetson Nano
device tree to enable additional features and the force recovery
button on the Jetson AGX Xavier now produces a key code that is
actually valid. Finally, an alias is added for the Ethernet card on
Jetson TX2 to allow firmware to find it and pass a MAC address via
device tree.

----------------------------------------------------------------
JC Kuo (1):
      arm64: tegra: Add fuse/apbmisc node on Tegra194

Peter Robinson (1):
      arm64: tegra: Allow bootloader to configure Ethernet MAC on Jetson TX2

Tamás Szűcs (2):
      arm64: tegra: Enable PWM fan on Jetson Nano
      arm64: tegra: Enable SDIO on Jetson Nano M.2 Key E

Thierry Reding (7):
      arm64: tegra: Let the EMC hardware use the EMC clock
      arm64: tegra: Rename EMC on Tegra132
      arm64: tegra: Add interrupt for memory controller on Tegra186
      arm64: tegra: Add external memory controller on Tegra186
      arm64: tegra: Add the memory subsystem on Tegra194
      arm64: tegra: Make XUSB node consistent with the rest
      arm64: tegra: Redefine force recovery key on Jetson AGX Xavier

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 34 +++++++---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  4 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 56 +++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 73 ++++++++++++++++++++++
 7 files changed, 164 insertions(+), 10 deletions(-)
