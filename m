Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4187626D6CE
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Sep 2020 10:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgIQIg3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Sep 2020 04:36:29 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3474 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIQIg2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 04:36:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f631ffd0000>; Thu, 17 Sep 2020 01:36:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 17 Sep 2020 01:36:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 17 Sep 2020 01:36:26 -0700
Received: from [10.26.74.242] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Sep
 2020 08:36:23 +0000
Subject: Re: [Patch 1/2] cpufreq: tegra194: get consistent cpuinfo_cur_freq
To:     Sumit Gupta <sumitg@nvidia.com>, <viresh.kumar@linaro.org>,
        <rjw@rjwysocki.net>, <thierry.reding@gmail.com>,
        <linux-pm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <ksitaraman@nvidia.com>, <bbasu@nvidia.com>
References: <1600276277-7290-1-git-send-email-sumitg@nvidia.com>
 <1600276277-7290-2-git-send-email-sumitg@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <81d2517d-6581-b491-c509-832fd1c0321e@nvidia.com>
Date:   Thu, 17 Sep 2020 09:36:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600276277-7290-2-git-send-email-sumitg@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600331773; bh=gtGu9UUsd//x7NyTheFLNifE/O+n3VvopAXmwSrwqbM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=iGivtR7ZwTdYMlg8h794S9mC5vPM3vQlLlftl3mo5bKRbxp7IqdTcW0q0N6AJIvJX
         CZKARUptLgKBFmlySS9fTJCLezQxnSSSRaXc5BGjePPRMYyCdTTeS/oKMy/zo6KV+w
         nDtMzVR/rRCDxaO7kCEaDo5/AoGZU3cuihyrIqbRniIAOi9k6sn3ZJh/yMJxacuvL9
         jF+FQmvsfEwBhHsuJhz5SFoulhVJYXbGkzhwIOkbqP0x4BfeKFGS6/3uz54n0z+x15
         ciyXj2dm3zPtRWKun+h5bnZsPLnWWMgb0IHayhJfVDm31eFpO9fgAysDj33mHlDWSr
         oCp1yQEaHQ6ag==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 16/09/2020 18:11, Sumit Gupta wrote:
> Frequency returned by 'cpuinfo_cur_freq' using counters is not fixed
> and keeps changing slightly. This change returns a consistent value
> from freq_table. If the reconstructed frequency has acceptable delta
> from the last written value, then return the frequency corresponding
> to the last written ndiv value from freq_table. Otherwise, print a
> warning and return the reconstructed freq.

We should include the Fixes tag here ...

Fixes: df320f89359c ("cpufreq: Add Tegra194 cpufreq driver")

> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Viresh, ideally we need to include this fix for v5.9. Do you need Sumit
to resend with the Fixes tag or are you happy to add?

Thanks
Jon

-- 
nvpublic
