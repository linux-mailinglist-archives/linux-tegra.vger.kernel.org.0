Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 628A5B47C5
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 08:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391452AbfIQG5N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 02:57:13 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16389 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391378AbfIQG5N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 02:57:13 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8083ce0000>; Mon, 16 Sep 2019 23:57:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 16 Sep 2019 23:57:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 16 Sep 2019 23:57:12 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:12 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:12 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Sep 2019 06:57:12 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d8083c60003>; Mon, 16 Sep 2019 23:57:11 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [PATCH 0/3] Jetson-TX2 USB host support
Date:   Tue, 17 Sep 2019 12:26:42 +0530
Message-ID: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568703438; bh=87owLsTtGM4hroXlsN8YY9oyoE5Gyp6EGc3qnUuIxuE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=mJIiWrKAOBLwAmdubikQsTLqaN2wXNTR0RgyuD1eSjElcw8b0yqTD/0AhpmENlJ1+
         Baq+kfWdNCGVT4C4lFNxc9KDR0H4kPNXcP6HtyLFWJA5J9mOXXuBCg1VhocN5ASkCQ
         mOmI+3RQPBes705eMOqFcD9qmmnNVi68awb3h6gRDzb7F5nMECT0Teu0VNnONHcm23
         XmXewbAA7B0dMrms+fHdFwZWzEEi1Wi9F47myypERJO83ucvg5j3nSaFZlyG3ZbQob
         8MbNRp4ToT3hR8GCZycli1nE/Mtkecvc2uf0ccAFB2HGnTcqGVYQ0Yg3XTkHevI/i9
         mi25mzKbwHwTw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch series enable USB host driver on Jetson-TX2 platform.

Patch 1 is to enable dependent padctl driver.
Patch 2&3 to enable USB host driver on jetson-TX2.

Nagarjuna Kristam (3):
  arm64: tegra: Enable padctl driver for Jetson-TX2
  arm64: tegra: Add SMMU for USB host on Tegra186
  arm64: tegra: Enable USB host on Jetson-TX2

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4

