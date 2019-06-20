Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6884E4C93C
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jun 2019 10:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfFTISQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 04:18:16 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11510 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfFTISQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 04:18:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0b41460000>; Thu, 20 Jun 2019 01:18:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 20 Jun 2019 01:18:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 20 Jun 2019 01:18:15 -0700
Received: from HQMAIL108.nvidia.com (172.18.146.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 08:18:15 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 20 Jun 2019 08:18:14 +0000
Received: from moonraker.nvidia.com (Not Verified[10.21.132.148]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0b41450004>; Thu, 20 Jun 2019 01:18:14 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 0/3] arm64: tegra: A few device-tree fixes
Date:   Thu, 20 Jun 2019 09:16:59 +0100
Message-ID: <20190620081702.17209-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561018694; bh=5y5q6aQHG7de4CaohilfekGf3nY2RQZaFWuKfcoI+08=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=kTcm7CAzgS+St/QoRCBvpEiVe738MfVBF08ymy5o362uwA/Q7mlyZllU6OjqJuk6q
         eafx55VzTXLCVmlo/t78DU2UHP56MX9JAi+9/u4c6kA5k1tTEGoXd/tMATz35rWK+U
         zpx3PGWig2TVwxBO1aVl84h/Qyth+xad6oR74fBzcW1q5SXmcszUzzocPB7JudRo8P
         xNNH31/y7wogmEly/F3JsA7aSdBNi7iQKjZcp/ZSByan70Bvvyk7+OCOuQ/LscZFaQ
         5stLjDfmyMWYNXdnNDNLbFBvSC3r+K74ipJKDp/tGezmJikwW9fU8zySh/Jq2bLTWr
         CXCW2933eRpyQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Here are a few device-tree fixes for Tegra210 GPU regulator and AGIC.

Jon Hunter (3):
  arm64: tegra: Fix AGIC register range
  arm64: tegra: Update Jetson TX1 GPU regulator timings
  arm64: tegra: Fix Jetson Nano GPU regulator

 .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  3 ++-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 21 +++++++++++--------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.17.1

