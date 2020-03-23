Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5D419006E
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Mar 2020 22:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgCWVf1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Mar 2020 17:35:27 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:14178 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgCWVf1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Mar 2020 17:35:27 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 48mSNB3H8BzWS;
        Mon, 23 Mar 2020 22:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1584999324; bh=pV85d3OblMJ7RfsZIWWNkfwMsTCzcwys5+ldfE8oyZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fv7ozbGfqk4BAVi284jvwufI0hVjijArO/XOUuhWlDD89PPjHCarTiS4+vK1mLWmF
         DVrJtYAOhraUK5SWlXX3puKkx7cHu9Izmlao4fdzra6GVS4GRsOt2PtTR9LBtUeuew
         ISMmmXeSeKf+pTj3r3pby2kz6gewBNTXjM+g72iTo3c+cQs2JdYYSDjU7N7mT4mzt8
         gYfJddytE23BcOX0fnhr2zdaDfp5E7D9lwz0M4MYIh/ZxqHo2ixHNnfkY+tI06YcS6
         CbjH7zDW0pQXVzQZ3yGdyqN0HUQc7h5dEw5eUDAbbIa4/zfuuWUSXQ6CVwyT8vS0oo
         xwY0W70E5c50g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 23 Mar 2020 22:35:20 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Billy Laws <blaws05@gmail.com>, linux-tegra@vger.kernel.org,
        linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>,
        Gilles Grandou <gilles@grandou.net>,
        Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/10] partitions: Introduce NVIDIA Tegra Partition
 Table
Message-ID: <20200323213520.GA16587@qmqm.qmqm.pl>
References: <20200323163431.7678-1-digetx@gmail.com>
 <20200323163431.7678-4-digetx@gmail.com>
 <20200323191748.GB30585@qmqm.qmqm.pl>
 <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67140755-c829-5c58-3fbf-efd496e225df@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 23, 2020 at 10:59:52PM +0300, Dmitry Osipenko wrote:
> 23.03.2020 22:17, Michał Mirosław пишет:
> > On Mon, Mar 23, 2020 at 07:34:24PM +0300, Dmitry Osipenko wrote:
> >> All NVIDIA Tegra devices use a special partition table format for the
> >> internal storage partitioning. Most of Tegra devices have GPT partition
> >> in addition to TegraPT, but some older Android consumer-grade devices do
> >> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
> >> in order to support these devices properly in the upstream kernel. This
> >> patch adds support for NVIDIA Tegra Partition Table format that is used
> >> at least by all NVIDIA Tegra20 and Tegra30 devices.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  arch/arm/mach-tegra/tegra.c   |  54 ++++
> > [...]
> > 
> > Please split off this part and make the information available to
> > userspace (pt_addr + pt_size) if found. This would make it easier
> > to support use the partition table later in initrd instead.
> 
> Please clarify what do you mean by "use the partition table later in
> initrd instead".

Configure device-mapper to span eMMC boot+data partitions and then ask
(modified) kpartx to partition the resulting device. All before rootfs
is mounted and switched to in initrd.

Best Regards
Michał Mirosław
