Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5383320F36E
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 13:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732884AbgF3LLT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 07:11:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15217 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgF3LLS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 07:11:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb1dc80000>; Tue, 30 Jun 2020 04:11:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 04:11:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 04:11:16 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:11:15 +0000
Subject: Re: [PATCH 53/73] arm64: tegra: Remove simple regulators bus
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-54-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fe583ea8-6a66-f78e-b926-5d0ed775361f@nvidia.com>
Date:   Tue, 30 Jun 2020 12:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616135238.3001888-54-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593515464; bh=QnjS7APqAxwWCHZIKKrbOzEUWbVA8ZM7trd1Q4f+R74=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=kyDns/WXDXC24OD5rYUfU0XGKROQpSVheKUpJ60bzeYRPDFcK8CHfO43859NnpIpQ
         r64CQi37WaKrpz3A/R83tJ/mg6kbaNFlZ6gxLMWgo8PJwVpp5i0lwDOUGoV6EJdYCn
         1V2klpQnNncOiHeyZYX2RaZAVLF4B+76YnpYFK7rhWULpgp31LfCgbkX7y6c2Z/0/2
         dCviK+xJSbt4zEDWboGatYA59dD/6GHAsm3Srw89tu47jbvKteWdoMC2XtBfiItIcl
         NT8R+Sn2nS/YDTeEnRDrBodIv83PWxNgcx9Hlk6RMUrkMA9rTGOZU3Z6DY/RDQw/lT
         fwdXgLaF3UOZg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/06/2020 14:52, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The standard way to do this is to list out the regulators at the top-
> level. Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 247 ++++++------
>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  81 ++--
>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  60 ++-
>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  96 ++---
>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  23 +-
>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 274 +++++++------
>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 361 ++++++++----------
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 177 ++++-----
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 137 +++----
>  9 files changed, 671 insertions(+), 785 deletions(-)


After this patch is applied I see the following build breakage ...

  DTC     arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb
arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1646.23-1656.4: ERROR
(phandle_references): /regulator@1: Reference to non-existent node or
label "pmic"

arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1658.30-1670.4: ERROR
(phandle_references): /regulator@2: Reference to non-existent node or
label "pmic"

arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1705.29-1715.4: ERROR
(phandle_references): /regulator@6: Reference to non-existent node or
label "pmic"

Jon

-- 
nvpublic
