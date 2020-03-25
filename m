Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D4F193224
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2020 21:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbgCYUsc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Mar 2020 16:48:32 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12391 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgCYUsc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Mar 2020 16:48:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e7bc3920000>; Wed, 25 Mar 2020 13:48:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 25 Mar 2020 13:48:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 25 Mar 2020 13:48:32 -0700
Received: from [10.26.72.231] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 20:48:31 +0000
Subject: Re: [PATCH 2/2] gpu: host1x: Use SMMU on Tegra124 and Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
 <20200325201604.833898-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c359bfdb-de7e-6c82-9a78-bd0ec4449172@nvidia.com>
Date:   Wed, 25 Mar 2020 20:48:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325201604.833898-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585169298; bh=nBGOaR7If9Bn7YgqQ050D8eG5NPGJikL7u6AsNJzHB8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=HYj+GP9mNAZMMCkf9YIendDldsmhH07AIr86eLhF7Lhvrqlt5XpYzES3q8GcaNfMf
         8DLmRocGS+rd9gITebUgv5WNbCBDo3bjYOZoxTjDZjHcnkIRHSQ588NDAbVlMduTGS
         /nDmp4a8HdYcrRMHevqjgG60wmviimg2pdD1+eQ0eS16gQRgvuh3fLDbzK1s5n6/8I
         1acKyb2jPQfVBUXSjuSQi3C5Q9Qpk63rZtq/Wd+JjJRhM+ACzdJPCrIwxfiWd0Hyzp
         UDSjpzF8rdonePRG6KzVc2V22jOrcH5hAce79Xltpth0PBk9/YIkOH4UvfzlFlrN11
         cArgjLnpAaeBw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/03/2020 20:16, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra124 and Tegra210 support addressing more than 32 bits of physical
> memory. However, since their host1x does not support the wide GATHER
> opcode, they should use the SMMU if at all possible to ensure that all
> the system memory can be used for command buffers, irrespective of
> whether or not the host1x firewall is enabled.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
