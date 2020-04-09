Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1041A37AC
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2020 18:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgDIQCF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Apr 2020 12:02:05 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:11890 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgDIQCF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Apr 2020 12:02:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8f46f00000>; Thu, 09 Apr 2020 09:01:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Apr 2020 09:02:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Apr 2020 09:02:05 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 16:02:05 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr 2020
 16:02:04 +0000
Subject: Re: [PATCH] gpu: host1x: Detach driver on unregister
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20200408173802.3077833-1-thierry.reding@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <a1223208-9571-317f-364d-f1101c4be174@nvidia.com>
Date:   Thu, 9 Apr 2020 09:02:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200408173802.3077833-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586448112; bh=K7R7BJDDILGadIEZGJYsYX5tOd8edcitytPLfwZ96fk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=JSm1W7mkfQw34UMTiupHgRm+75BOOOog++QSS+ylBdW5dZqxvjCmhY3TFRQ/cdhhb
         A3nuWC7pVxEvLBRzP5YaSkGm3qThUoWUGSjY5tZUvTdRDp1kqXeZf+s0l5whpQcc66
         vXVm+R4z5ZfssTwjb7gqSuwFQvL0PVW+P3Fhr5UfV/AI3R2rE/gvbYQrA+zS+DqUB9
         DEo9bpAzdizE5BhdqnjA996GEuF5GEypuDEggr31z0Wo48di20E7sBmK4YNsyXXt4i
         V0MIA+lcdWl0yS1aZ5EhVKTJDjW2TUUdpIcHtsNjrdwalDFFfMrtqJiLCleFE4QZ4U
         UdgbFNzBYMT3g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 4/8/20 10:38 AM, Thierry Reding wrote:
> From: Thierry Reding<treding@nvidia.com>
>
> Currently when a host1x device driver is unregistered, it is not
> detached from the host1x controller, which means that the device
> will stay around and when the driver is registered again, it may
> bind to the old, stale device rather than the new one that was
> created from scratch upon driver registration. This in turn can
> cause various weird crashes within the driver core because it is
> confronted with a device that was already deleted.
>
> Fix this by detaching the driver from the host1x controller when
> it is unregistered. This ensures that the deleted device also is
> no longer present in the device list that drivers will bind to.
>
> Reported-by: Sowjanya Komatineni<skomatineni@nvidia.com>
> Signed-off-by: Thierry Reding<treding@nvidia.com>
> ---

Tested-by: Sowjanya Komatineni <skomatineni@nvidia.com>


