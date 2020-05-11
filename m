Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCDE1CDA9D
	for <lists+linux-tegra@lfdr.de>; Mon, 11 May 2020 15:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgEKNAq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 May 2020 09:00:46 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17033 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbgEKNAq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 May 2020 09:00:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb94bf70005>; Mon, 11 May 2020 05:58:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 11 May 2020 06:00:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 11 May 2020 06:00:46 -0700
Received: from [10.26.74.25] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 13:00:44 +0000
Subject: Re: [GIT PULL] arm64: tegra: Default configuration fixes for v5.7-rc4
To:     Thierry Reding <thierry.reding@gmail.com>, <arm@kernel.org>,
        <soc@kernel.org>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200430105700.167199-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <384ae777-3e3c-8244-0645-13d9c7a8eb37@nvidia.com>
Date:   Mon, 11 May 2020 14:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430105700.167199-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589201911; bh=oPxaLJJLXpOzcbjWYs7b5HPDSqzPDCu4tyqmLQjNRvU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=NMDHjwc+JHurWicn7HXc6nMWUcIgvO7OqXqcZiRmDku1eAOjUrHhjt5VpXiSgBfHa
         SgjawDFB98k6jf+fz8oDHaxsdatYqz4v5LnfaChL4EwPiVkH3YBQ1xl8VEpJMIXA+c
         oDpHheAoPRJhTg8dJhWvKcPhhEL3A2ZFk/r7pnZmc7BWuuS9lBmMs4BlFskZDXi2/W
         hcm9LAHuvgYurmjlwuyeqbSUj41aLJKtqWJoi0MaXr4jCo8abVmigYpx1YZ4OyajMG
         KT49JTsfVblD/ibYhNCLy0ZgWqLsmWZFV59F1Z6Z2O1G8MiZbKhyfPUSmNK2dgRZ7y
         RTOOP8hiNdt3g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 30/04/2020 11:57, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:
> 
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm64-defconfig-fixes
> 
> for you to fetch changes up to 90670f0ef690f9c8712f236e8cf14c156c9a6365:
> 
>   arm64: defconfig: Re-enable Tegra PCIe host driver (2020-04-14 16:15:00 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Default configuration fixes
> 
> This contains a single fix to reenable the Tegra194 PCIe host support by
> default that was inadvertently dropped as a result of the host/endpoint
> mode support that was added in v5.7-rc1.
> 
> ----------------------------------------------------------------
> Jon Hunter (1):
>       arm64: defconfig: Re-enable Tegra PCIe host driver
> 
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Please can you pick this up for v5.7 fixes?

Thanks!
Jon

-- 
nvpublic
