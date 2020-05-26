Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E091C5AB5
	for <lists+linux-tegra@lfdr.de>; Tue,  5 May 2020 17:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbgEEPLm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 5 May 2020 11:11:42 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:2490 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729359AbgEEPLl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 5 May 2020 11:11:41 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49GjqZ4kvgz8r;
        Tue,  5 May 2020 17:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588691499; bh=69YTMc1MT+A51zlzuZgEqvLApEm0SUOq8lZn3zUGa1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ch3UdGqN0/ZNnxEIoAdn1qKmaKIi19O8LiOzfkzYLvn4N9JBmC1/WgmbXS9f+rXhY
         hcvAONABtpJL06SefZFiR6dlapNx4l0Ex7I/iBH8dYxZSdjiypnpM6rju/B1F7scKV
         3gowWo4YCh8U64WW8y0eoI4RMaGyUu1+JiIXeMSQKuIEhi5oJAJZw894VM/B4Dd3Fe
         AtKmRkMRLmSIkBKi19ajuzEb9BH83KjzvDUKEmi7Bihze21QH9QkbqNlQJF0+vbLx8
         Xd6hYZoj41Pwxcp7/81xc+Dyav4CftyztWsag+lmxrkLcyaAH9X4lp1MctIUX5+cwY
         JqDN2BXXiUCWA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 5 May 2020 17:11:36 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Pedro =?iso-8859-2?Q?=C2ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7
 devices
Message-ID: <20200505151136.GA26776@qmqm.qmqm.pl>
References: <20200505022517.30523-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200505022517.30523-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 05, 2020 at 05:25:11AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This series introduces upstream kernel support for Acer Iconia Tab A500
> and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
> in advance.
> 
> Changelog:
> 
> v7: - This version brings support for a Nexus 7 variant that uses Ti PMIC
>       instead of the Maxim PMIC. Previously we assumed that variant with
>       the Ti PMIC doesn't exist in a wild, but turned out that it was a
>       wrong assumption. In a result the device-trees are separated into
>       more DTSI pieces, which combined together form the final device-tree.
>       Thanks to Zack Pearsall for testing the Ti version!
[...]

Hi Dmitry!

This Ti-based (PM269) version might be very similar to Asus TF300T I have.
I'll have a look on your DT during the weekend.

Best Regards,
Micha� Miros�aw
