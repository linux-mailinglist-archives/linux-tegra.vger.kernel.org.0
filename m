Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 910E832939
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2019 09:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfFCHUm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 03:20:42 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14557 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCHUm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 03:20:42 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf4ca480000>; Mon, 03 Jun 2019 00:20:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Jun 2019 00:20:41 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Jun 2019 00:20:41 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Jun
 2019 07:20:40 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 6EC0840FC6; Mon,  3 Jun 2019 10:20:38 +0300 (EEST)
Date:   Mon, 3 Jun 2019 10:20:38 +0300
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Jon Hunter <jonathanh@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Message-ID: <20190603072038.GB29894@pdeschrijver-desktop.Nvidia.com>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
 <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
 <20190531102858.GA21355@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190531102858.GA21355@ulmo>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL108.nvidia.com (172.18.146.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559546440; bh=sIpzwEPaUIrtt8uotF4sQsXYS/qLmh8439n7BlRbcEU=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=o9/yoKCyUguYwntL/2Pt8BRjIY2CqPTUsnDMrLr/mPB/elEbiogXIrWMc3w9f2QmU
         6ojFgO8eNxNJXyxzx0Q1XIrApRqPBcLhluoMwqa/lJAsnANFiK0481/lOYFLjd8GE7
         j0TOevo4swx2aT2NmmKp73x67g/R+imkVrDRSjMcAE/Wds0UuA2qBMPl+icAjUMC9E
         M6r6I1Y5dzm2Af+f/vou0QRSxGZXUAtlbjpM9AqAUuoISQtOeDCfig3Ve0ZTz52otT
         AJGwdTH59llElTHWlgdwjxQMPCQFL8T7BrzVP13sfzllSttkUzXfr8ts0InU51g+P1
         3FR54c1C7JoBQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, May 31, 2019 at 12:28:58PM +0200, Thierry Reding wrote:
> On Fri, May 31, 2019 at 10:32:40AM +0100, Jon Hunter wrote:
> > 
> > 
> > On 29/05/2019 11:26, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > For interrupts that are not wakeup sources but that may end up getting
> > > mapped through the PMC as interrupt parent (this can happen for GPIOs),
> > > return early in order to avoid a subsequent crash from an out-of-bounds
> > > access to the register region.
> > 
> > Maybe worth clarifying here what you mean by 'not wakeup sources'
> > because the Tegra GPIO driver does have a set_wake() API to enable
> > wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
> > what level of suspend?
> 
> Wakeup sources in the context of PMC is always LP0 wakeup sources. At
> that point I don't think LIC is enabled anymore. So LIC is to wake up
> from LP1 (and perhaps LP2), while PMC wakeup sources need to be
> configured in order to wake up from LP0.
> 
> Adding Peter to confirm, I think he's more familiar with the power
> states on earlier chips than I am.

Yes. LIC is in a domain which is off during SC7 so it can't trigger a
wakeup.

Peter.
