Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4F52A8C7D
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Nov 2020 03:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgKFCQI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Nov 2020 21:16:08 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12505 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgKFCQI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 21:16:08 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa4b1ea0000>; Thu, 05 Nov 2020 18:16:10 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 02:16:08 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 02:16:07 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/4] Add AHCI support for Tegra186
Date:   Thu, 5 Nov 2020 18:16:04 -0800
Message-ID: <1604628968-1501-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604628970; bh=zD66V8wW3uz/Ur3S9TeficBHrXtG1p0uq70Rmiku/fI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=VvmE6rdmSyQ2X93l6U8BFP62+eitvoLNlpxyLJL4VQjg96NR38Q41UwVrIcmjTtZX
         3FNpGKIeHBqCNqiJgjkKkE7gJQxl1gV8HIS98mQrfUn0DbS9WBftg0dNM/zMXyaVc6
         +Zj2ui3MffUMycAc5cZCYIT/YuNORbOkQFQi68zcoHDC/nPPGsjHu1YgyWWAMjDdW3
         lh8Wogz0O+NqyL2K/shoMY0M1sVYtzOWN6/bMV9rdROr0hRlw4AZx5vzOvx3YKiX7V
         nLOq5tXIVWWvM2pBs0HwJo1u7lqWj3wUnndt/IdCQ+IralLHORpOJHGA+TcEQZwaw6
         rnhfFXsZ2xE6g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds support for AHCI-compliant SATA to Tegra186 SoC.

This series includes patches for
- Converting text based dt-binding document to YAML.
- Adding dt-bindings for Tegra186.
- Enabling AHCI-compliance SATA for Jetson TX2.
- Adding Tegra186 support to Tegra AHCI driver.

Sowjanya Komatineni (4):
  dt-bindings: ata: tegra: Convert binding documentation to YAML
  dt-binding: ata: tegra: Add dt-binding documentation for Tegra186
  arm64: tegra: Enable AHCI on Jetson TX2
  ata: ahci_tegra: Add AHCI support for Tegra186

 .../devicetree/bindings/ata/nvidia,tegra-ahci.yaml | 199 +++++++++++++++++++++
 .../bindings/ata/nvidia,tegra124-ahci.txt          |  44 -----
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  28 +++
 drivers/ata/ahci_tegra.c                           |  60 +++++--
 5 files changed, 278 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml
 delete mode 100644 Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt

-- 
2.7.4

