Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C391024A8
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 13:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfKSMkJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 07:40:09 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:54179 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725280AbfKSMkJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 07:40:09 -0500
X-IronPort-AV: E=Sophos;i="5.68,322,1569276000"; 
   d="scan'208";a="412492065"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Nov 2019 13:40:06 +0100
Date:   Tue, 19 Nov 2019 13:40:06 +0100 (CET)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To:     Jani Nikula <jani.nikula@linux.intel.com>
cc:     Thierry Reding <thierry.reding@gmail.com>,
        zhengbin <zhengbin13@huawei.com>, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, treding@nvidia.com,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
In-Reply-To: <87tv70xevg.fsf@intel.com>
Message-ID: <alpine.DEB.2.21.1911191339500.2818@hadrien>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com> <20191118132357.GC2246533@ulmo> <87wobwxf95.fsf@intel.com> <87tv70xevg.fsf@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On Tue, 19 Nov 2019, Jani Nikula wrote:

> On Tue, 19 Nov 2019, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Mon, 18 Nov 2019, Thierry Reding <thierry.reding@gmail.com> wrote:
> >> On Mon, Nov 18, 2019 at 07:46:10PM +0800, zhengbin wrote:
> >>> zhengbin (2):
> >>>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
> >>>     tegra_bo_dumb_create
> >>>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create
> >>>
> >>>  drivers/gpu/drm/tegra/drm.c | 5 +----
> >>>  drivers/gpu/drm/tegra/gem.c | 5 +----
> >>>  2 files changed, 2 insertions(+), 8 deletions(-)
> >>
> >> As I explained in response to the same patches sent for other drivers
> >> already, I don't think this has any merit.
> >
> > I agree completely.
> >
> > Apparently there's a coccicheck flagging constructs like this; perhaps
> > that should be addressed. Julia?
> >
> > Things like:
> >
> > drivers/gpu/drm/tegra/gem.c:457:1-3: WARNING: PTR_ERR_OR_ZERO can be used
> >
> > leading to:
> >
> >  -	if (IS_ERR(bo))
> >  -		return PTR_ERR(bo);
> >  -
> >  -	return 0;
> >  +	return PTR_ERR_OR_ZERO(bo);
> >
> > I think we have consensus the error path and the happy day scenarios
> > should remain distinct. Moreover, I find PTR_ERR_OR_ZERO() causes me to
> > pause for a moment while the original is a crystal clear immediately.
>
> Re consensus, [1][2] and probably more. Per an email search, this pops
> up for the same stuff over and over again. Can we please just remove the
> cocci check?

OK.

julia

>
> BR,
> Jani.
>
>
> [1] http://mid.mail-archive.com/daade52d-0dfc-9365-b17c-02e7e785afad@ti.com
> [2] http://mid.mail-archive.com/20191118130022.GM4345@gilmour.lan
>
> --
> Jani Nikula, Intel Open Source Graphics Center
>
