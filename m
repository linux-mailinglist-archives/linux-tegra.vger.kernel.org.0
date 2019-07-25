Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0758274A22
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jul 2019 11:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390689AbfGYJl3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jul 2019 05:41:29 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:16225 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387533AbfGYJl3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jul 2019 05:41:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d3979450000>; Thu, 25 Jul 2019 02:41:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 25 Jul 2019 02:41:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 02:41:28 -0700
Received: from tbergstrom-lnx.Nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Thu, 25 Jul 2019 09:41:27 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 981E64286D; Thu, 25 Jul 2019 12:41:25 +0300 (EEST)
Date:   Thu, 25 Jul 2019 12:41:25 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Jon Hunter <jonathanh@nvidia.com>
CC:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
Message-ID: <20190725094125.GL12715@pdeschrijver-desktop.Nvidia.com>
References: <20190707230843.11224-1-digetx@gmail.com>
 <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564047685; bh=oPcjP0l90Xlbid52BTLH5HFuWayYMYluv+P4cZpz0BE=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=KT2ejeymvAUJefXKG+dCSv+tBemWustPybrYzvGkDRajoTPPzmtzjuQ6sinuPBhhw
         DrLfZ0M6Zl153mj3bu86R/oBeJ9sGBQJrCmJkHth/kZ6vXgjVD8h7efkZzoIvGfpP3
         Ng9tiKLuAGwZW0N4oBapHnWOtttLqwN2ZoD2q8/pgstBxfTAAPG/Qo6OR4OmyEETlD
         78xenL+GCaKbFWHAgObka/fYDc2/lDBZQ8R/R44UFoV1wG/mXGwImqRg3sYn0MhfI/
         FPUIOWzdvsgYLvZ7jNle/uO2t3GYg4/uda0Y2eUcYcTAyihpSOrCzUNKqLCUtMjUmf
         mp7LC7+DPmHIQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 18, 2019 at 10:45:31AM +0100, Jon Hunter wrote:
> 
> On 08/07/2019 00:08, Dmitry Osipenko wrote:
> > The PCLK clock is running off SCLK, which is a critical clock that is
> > very unlikely to randomly change its rate. It's also a bit clumsy (and
> > apparently incorrect) to query the clock's rate with interrupts being
> > disabled because clk_get_rate() takes a mutex and that's the case during
> > suspend/cpuidle entering. Lastly, it's better to always fully reprogram
> > PMC state because it's not obvious whether it could be changed after SC7.
> 
> I agree with the first part, but I would drop the last sentence because
> I see no evidence of this. Maybe Peter can confirm.
> 

SCLK and PCLK certainly can change rate at runtime, although the changes
for this haven't made it upstream yet. It's indeed not very obvious, but
certainly doable.

Peter.
