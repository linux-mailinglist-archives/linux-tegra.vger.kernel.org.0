Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3449F20F37A
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 13:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732932AbgF3LRD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 07:17:03 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15521 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgF3LRD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 07:17:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb1f210000>; Tue, 30 Jun 2020 04:16:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 04:17:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 04:17:02 -0700
Received: from [10.26.75.203] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:17:01 +0000
Subject: Re: [PATCH 52/73] arm64: tegra: Remove simple clocks bus
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-53-thierry.reding@gmail.com>
 <46e907c8-6fd5-73ff-9ca4-bcf3ee19d716@nvidia.com>
Message-ID: <c090f7f3-a3ae-07e9-1ce3-f5340347ae92@nvidia.com>
Date:   Tue, 30 Jun 2020 12:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <46e907c8-6fd5-73ff-9ca4-bcf3ee19d716@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593515809; bh=jG8XVhuYlyONDA2BW/GFIcFIEej2tjkHvWH6/6UYya4=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Qo3MxLupW98BJDO8WQD+226Fhf0rFl5oXKnk3wnStQSCnFAZbta04OLjsxLAvUPqj
         u/gNdeDRYiZiX9ttlUbmgzwlzPYUcyISzxFlwDrig9iDjw9cO/4/CzZ+F/7zZ8F1Ns
         GYWfUPakd9kMJyVpPB1hZbEugc1ke/bITXoD2hppqdQfNwB0OL9L8bAw2q/hhZdOhP
         I3CvuhCqNTZbaq/b4XKt0cPwT9Fs+YipbA0p7IB/FJ/hfUa3b7m60tDbNCB7Q2RPkM
         k0E2YZAQqfYX3GpEyR/tC5J8YluM/s++f9YSrY2y/5qOc9Z90dYjwgHBq7TmvC/Fxq
         u9U7Oj+v26I8A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/06/2020 12:13, Jon Hunter wrote:
> 
> On 16/06/2020 14:52, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The standard way to do this is to list out the clocks at the top-level.
>> Adopt the standard way to fix validation.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts    | 15 ++++-----------
>>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi    | 15 ++++-----------
>>  arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi    | 15 ++++-----------
>>  arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi    | 15 ++++-----------
>>  .../arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 15 ++++-----------
>>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts     | 15 ++++-----------
>>  6 files changed, 24 insertions(+), 66 deletions(-)
> 
> After applying this patch I see the following build breakage ...
> 
>   DTC     arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb
> arch/arm64/boot/dts/nvidia/tegra132.dtsi:649.15-682.4: ERROR
> (phandle_references): /usb@70090000: Reference to non-existent node or
> label "vdd_3v3_lp0"
> 
>   also defined at
> arch/arm64/boot/dts/nvidia/tegra132-norrin.dts:895.15-909.4
> arch/arm64/boot/dts/nvidia/tegra132.dtsi:649.15-682.4: ERROR
> (phandle_references): /usb@70090000: Reference to non-existent node or
> label "vdd_3v3_lp0"
> 
>   also defined at
> arch/arm64/boot/dts/nvidia/tegra132-norrin.dts:895.15-909.4
> arch/arm64/boot/dts/nvidia/tegra132.dtsi:684.26-812.4: ERROR
> (phandle_references): /padctl@7009f000: Reference to non-existent node
> or label "vdd_3v3_lp0"


Same here is might not be this patch, but somewhere during this series I
see a few build breakages.

Jon

-- 
nvpublic
