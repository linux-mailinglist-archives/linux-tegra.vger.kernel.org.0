Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F157D20F377
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 13:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732929AbgF3LQT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 07:16:19 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15471 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgF3LQS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 07:16:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb1ef50000>; Tue, 30 Jun 2020 04:16:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 04:16:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 30 Jun 2020 04:16:18 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:16:17 +0000
Subject: Re: [PATCH 53/73] arm64: tegra: Remove simple regulators bus
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-54-thierry.reding@gmail.com>
 <fe583ea8-6a66-f78e-b926-5d0ed775361f@nvidia.com>
Message-ID: <608faebb-3497-baac-354a-25261915af73@nvidia.com>
Date:   Tue, 30 Jun 2020 12:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <fe583ea8-6a66-f78e-b926-5d0ed775361f@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593515765; bh=0rXFV8O50PNRKVw7XY9WHMsvmVX2dwY0kYwRHD9kJ/8=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=kh+E/A3IBuMJvgoNtK6+UHsd8YIr7qVEgIP4wppgCkKFpIPflemGGZEDWYoRAWfXq
         4Honv9XAZpKCUl/GMOPaqRRv0O7iYiXnepibD4GNdOmJ2K1RnBoEJeCDOhZPe3wYS4
         tZ4j3Wg/bnNcCgJVSkVq2lIu8deZc0xn5Hvpe8Giy5YY62M1f2JHb91TRct3+yD3BU
         akbIsOz0O4Tc9ND+6chb30mxonhh3RPQ9pKi1eqB4DuvMXERih1TqeOLbuW1WkEGZj
         9TXYWBANAURZ/+D1Qwx8iE5B72qi0NjyHXSYxhvTe7dVbJ1z+qBWn7zBeCkrEmlL+J
         slOF1Z06EHN2Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/06/2020 12:11, Jon Hunter wrote:
> 
> On 16/06/2020 14:52, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The standard way to do this is to list out the regulators at the top-
>> level. Adopt the standard way to fix validation.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  .../arm64/boot/dts/nvidia/tegra132-norrin.dts | 247 ++++++------
>>  .../boot/dts/nvidia/tegra186-p2771-0000.dts   |  81 ++--
>>  .../arm64/boot/dts/nvidia/tegra186-p3310.dtsi |  60 ++-
>>  .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  96 ++---
>>  .../arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  23 +-
>>  .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 274 +++++++------
>>  .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 361 ++++++++----------
>>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 177 ++++-----
>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 137 +++----
>>  9 files changed, 671 insertions(+), 785 deletions(-)
> 
> 
> After this patch is applied I see the following build breakage ...
> 
>   DTC     arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1646.23-1656.4: ERROR
> (phandle_references): /regulator@1: Reference to non-existent node or
> label "pmic"
> 
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1658.30-1670.4: ERROR
> (phandle_references): /regulator@2: Reference to non-existent node or
> label "pmic"
> 
> arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi:1705.29-1715.4: ERROR
> (phandle_references): /regulator@6: Reference to non-existent node or
> label "pmic"


Actually it might not be this patch. However, I noticed that builds were
getting skipped when bisecting other issues. So we may need to ensure
all of these build OK.

Jon

-- 
nvpublic
