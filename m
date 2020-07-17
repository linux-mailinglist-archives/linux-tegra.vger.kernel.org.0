Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE96E223700
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgGQI3s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 04:29:48 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4498 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGQI3r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 04:29:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1161070000>; Fri, 17 Jul 2020 01:27:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 17 Jul 2020 01:29:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 01:29:47 -0700
Received: from [10.26.72.76] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 08:29:44 +0000
Subject: Re: [tegra:for-5.9/firmware 4/5] include/linux/string.h:296:30:
 warning: '__builtin_strncat' output truncated before terminating nul copying
 as many bytes from a string as its length
To:     kernel test robot <lkp@intel.com>
CC:     <kbuild-all@lists.01.org>, <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
References: <202007150509.YYGFya5r%lkp@intel.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9ffe6869-7bfc-4d40-6761-09706d7da4eb@nvidia.com>
Date:   Fri, 17 Jul 2020 09:29:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202007150509.YYGFya5r%lkp@intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594974471; bh=iqVBCm+ikKDvVBvsbsTHNploh7OxD4AOLqBTXcYhR70=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=h/yGTcYEEa40o5EWE6+KNdFfOJnFCl0eEkOMdUYNy8ypwhHRsIbC6hzhWoQZIzOb8
         TSaI/6K+21/Bn6XpAk4uAcrAdGnqLlr89rNc3bviI9B2N8b5+gal3w2wjxbZQ6zy/F
         T3SdQIlPqGPb/xJ3cga3TSTj1HBkKsWs0B1xofN6h7NCJvn2uk5CVhyYNWnqLiW3zs
         Jpmmkcz3PO2t3u8BYgk4pMG4+N/6n9+beNNIeg3hoo2DLR+kGGI0OroCvrDXwUsjb4
         hzKtHzN8D6IF00LnSFRQvzWqj0qMow7fNACV0+Sitj1oimtaHVK1pCkrPL2JjI9SBX
         VM1Yt1iPzKFOQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 14/07/2020 22:28, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-5.9/firmware
> head:   4e87189912bd2167998d82c95bb68f73185069e2
> commit: 5e37b9c137ee5a3a9dc2815ca51f71746c2609a6 [4/5] firmware: tegra: Add support for in-band debug
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5e37b9c137ee5a3a9dc2815ca51f71746c2609a6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/bitmap.h:9,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/rcupdate.h:31,
>                     from include/linux/rculist.h:11,
>                     from include/linux/dcache.h:7,
>                     from include/linux/fs.h:8,
>                     from include/linux/debugfs.h:15,
>                     from drivers/firmware/tegra/bpmp-debugfs.c:5:
>    In function 'strncat',
>        inlined from 'bpmp_populate_debugfs_inband' at drivers/firmware/tegra/bpmp-debugfs.c:422:4:
>>> include/linux/string.h:296:30: warning: '__builtin_strncat' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]


I took a look at this and see what the above is warning about and if
this is something we need to address.

When I implemented the above, I did take care to ensure that we would
not overflow the buffer and ensure that the string is null terminated.
If you look at the code, following the call to strncat, there is a
subsequent call to strcat which will add the null character. Before any
of these calls are made, the code does check to ensure that the strings
written to the buffer can fit and there is room for the null character.

We could update this code to address the above warning, but at the same
time I don't believe it is necessary.

Cheers
Jon

-- 
nvpublic
