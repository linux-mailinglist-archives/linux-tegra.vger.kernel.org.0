Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04393184D14
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgCMQ65 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:58:57 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:38239 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ65 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:58:57 -0400
Received: by mail-wr1-f41.google.com with SMTP id x11so8267976wrv.5
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SasAQUXkfroYsOYpPXJJCL2Y1hUNoc4M6M8VYYK0keI=;
        b=gWa1uZa2BFVfX9rodYZOIjCoKFUb9fp5qZkMsAaV4QGa08HvkgVLCO6cBXU1UsJKgN
         sV/Bdg7GpHYHtaMnNnODPUFgJmZ7Uy8N6PfaMMIRteWIn4HWlwM1oxyw9SCk3ZmlLSP3
         am9eD7ZDyTiber1Jf0OSh7XlciTCxnQ8LXNTWVnSC8sJCiB4T0Z7Xm85zygVIgrTM0hw
         Mfd4KkK0E79rQIFFKNGcNljHjHyTKgjFdJdAEF9kHXSnji1B6T4JY6epYQn0B8nioCs3
         gLMSV0bsFlv9ZU+SXcRPbx0ylFCA3dvS8QPz5yeHnu0lfuBk7a8l7YxaF4M2okqLv6HM
         JKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SasAQUXkfroYsOYpPXJJCL2Y1hUNoc4M6M8VYYK0keI=;
        b=CeSEEsSj+yfO2YbEbwsH+lFNIcMzEb1aFLv+KHo3877odwggTIsi87ghdvs+WycQIE
         9PMt3+PdrQ17Ojz15VbgtIxlNJ3JDyxtMtHCwDVV3JCCqKqr7zyYaRLA3Ros28oG4kfv
         CCWzb9gMyBRHB5l7fKaRIuYBJazKY4TaLrLuMjGlgV3lCbBmpiMB/j+3SouPmUTbM4y2
         y+3sHumhZ5jUj2Kue/E6eLeb4cyy2dtnZAZSxQiPISppiQlO96r3pkriCOOGwygiI5BK
         sWCaKrWdXSsDVV2nGev/I6nJ3d+5henNxO6W4WpJWuDww+N98HlhTGYIy+p+OrE3AM6q
         JLZA==
X-Gm-Message-State: ANhLgQ1eTrZH44XOMVJrYPIaOadqtlCPYm7Nkisko3R14va20F7E3HW4
        D1iqkk1lWcF2B1HsjLLkCLQ=
X-Google-Smtp-Source: ADFU+vucg0CqsQ16ZoemjPuQ4xlKbLeo4LxUNxUVpcATUZFISeJiloFJIyIvK7pkhBWDbxKUy6WPqQ==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr19615631wrq.251.1584118735140;
        Fri, 13 Mar 2020 09:58:55 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id v8sm77801355wrw.2.2020.03.13.09.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:58:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 01/10] dt-bindings: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:39 +0100
Message-Id: <20200313165848.2915133-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-dt-bindings

for you to fetch changes up to eba512375e6bc297c674353841523feba03cf712:

  dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding (2020-03-13 09:15:11 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.7-rc1

New IDs are added for clocks that are controlled by the PMC. This
replaces older IDs that were erroneously provided by the clock and reset
controller.

This also adds device tree bindings for XUSB pad controller support on
Tegra194 as well as USB role switching on NVIDIA Tegra SoCs.

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra: Add Tegra194 support

Nagarjuna Kristam (2):
      dt-bindings: phy: tegra-xusb: Add usb-role-switch
      dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |  24 ++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 +++++++++++
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 9 files changed, 596 insertions(+), 304 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
