Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81823020A9
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Jan 2021 04:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbhAYDIf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 Jan 2021 22:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbhAYDIe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Jan 2021 22:08:34 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0843EC061573
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:07:54 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id 31so6697412plb.10
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=u8+YbkbccOnTqbWHKnDyaMuyym5pEv5IG+EImU42D6M=;
        b=MJy6OqiaaLqTicZSQyhluQpXvA0EVEL681DUoeBYtHv7G3AVEEeDpKIhkdZLMMKvuU
         1QH4rMwBnUZnRgpvGKKVleRTyzdI4+BsusreYgtgBupeL6Bo0otwlK51fYQWYBAxpDdH
         NI5fXAjrYMAVyFltVblQkcpfbiBTJomT05odfRQxEuyTu+kY99Twaam1l4m/vSxAO/WL
         CMS9fH3sZ2XVYbZmgkmLrOzEVZ+FZX4m8c34hLjaMb2XV1Tz+HxNb6qJtwP5fCgVxwtb
         isVgmExJEyCZTHyTE+Uvq8OXKxn42vzX0v+rsIFL5X9rUGKbrjXEH4tlnh9V29kbWFT3
         Zvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=u8+YbkbccOnTqbWHKnDyaMuyym5pEv5IG+EImU42D6M=;
        b=BpTZq4rugPT/gIx7t+KOJDnDcHe4quf4V1x2mc4y94lfCTe9nMJRcKvhU/PnONEaCK
         s+I40XmETOlq2ZmrOR/70RMw5+pmsU3rqDTSemK201zkY6DkEvg+iFl1MnW0liOFwz9a
         hdbeKEAWw3WjqYmCADbAh/odEJSMci2PdrLoyC9qcX5GAf97gdCsL1t5NJczLHjzQbRV
         3OHyPonv4mf33Qyk0foiC+jNyMOAJq0jc9Hb6Du3h/WRCltR1tE8L1GDmgr/kx75ynkm
         m0Hp3cZjC8QU/e0AvyDhm5AcpAhS5SBZNSDiLAQ16pM/3tM6A3HFRViV8UULEFRrS1TT
         /w6Q==
X-Gm-Message-State: AOAM531kotYGOPhuSUWi3mHM04itjYASIqIDiNygrkJ8hUj1K1kUk8+6
        I79lFqgLYgZnv3pgZsJeDrRJLg==
X-Google-Smtp-Source: ABdhPJznGhbmqZqh5TnNgZUZ5C8Qkle96KENqXu8ahyIxfYvxvKFOOt/YTH0Tf8L7qqK0ZJZEnm2KQ==
X-Received: by 2002:a17:902:e541:b029:df:df4f:2921 with SMTP id n1-20020a170902e541b02900dfdf4f2921mr6555444plf.52.1611544073448;
        Sun, 24 Jan 2021 19:07:53 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id b14sm17415811pju.14.2021.01.24.19.07.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jan 2021 19:07:52 -0800 (PST)
Date:   Mon, 25 Jan 2021 08:37:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH v3] soc/tegra: Add devm_tegra_core_dev_init_opp_table()
Message-ID: <20210125030750.735minp7toxortm4@vireshk-i7>
References: <20210121190117.25235-1-digetx@gmail.com>
 <20210122063537.7yd7ww47gl2rdsdu@vireshk-i7>
 <60cfafdf-4615-5a41-103d-96c35ba1fa8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60cfafdf-4615-5a41-103d-96c35ba1fa8c@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-01-21, 17:41, Dmitry Osipenko wrote:
> 22.01.2021 09:35, Viresh Kumar пишет:
> > On 21-01-21, 22:01, Dmitry Osipenko wrote:
> >> Add common helper which initializes OPP table for Tegra SoC core devices.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> >> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> >> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> >> [tested on some other non-upstreamed-yet T20/30/114 devices as well]
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>
> >> Changelog:
> >>
> >> v3: - This patch is factored out from [1] to ease merging of the patches
> >>       that will use the new helper. The goal is to get this new helper
> >>       into 5.12, this should remove dependency on this patch for a several
> >>       patchsets of a different subsystems (DRM, media, memory, etc) that
> >>       will target 5.13.
> >>
> >>       @Thierry/Jon, please review and apply this patch for 5.12!
> > 
> > This is not how stuff works in kernel Dmitry, every commit in the
> > kernel tree should build(at least)/boot fine. Your patch can only be
> > applied once your base tree has all the patches on which your work is
> > based of, otherwise this will lead to build failure (stuff like git
> > bisect breaks with that). It would be better if you take this patch in
> > 5.13, or after 5.12-rc2 once all other stuff lands.
> > 
> 
> OMG, I completely missed that the devm series from Yangtao Li isn't
> merged yet.
> 
> Viresh / Yangtao, will be it be okay if I'll collect all the
> prerequisite devm patches from Yangtao + add this patch into a single
> series that could be merged via the OPP tree for 5.12?
> 
> Of course Thierry or Jon will need to give the ack for the Tegra changes
> in that case.

I haven't heard back from Yangtao since his last post, not sure what's going on.
It is normally better if he keeps posting his series, unless he is busy and will
not be able to do it.

-- 
viresh
