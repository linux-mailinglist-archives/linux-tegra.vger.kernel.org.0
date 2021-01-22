Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6956E2FFCE6
	for <lists+linux-tegra@lfdr.de>; Fri, 22 Jan 2021 07:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbhAVGgY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 Jan 2021 01:36:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbhAVGgV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 01:36:21 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1740DC061756
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 22:35:41 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id lw17so5944021pjb.0
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 22:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HPyaonqF0tGLyXo/u2EMILf4fitFyye50DOEUQlkLEk=;
        b=JnCSEXTgBNJufHKaw/ohOzw/Yt/PcsJ1NnhY9hJygd43XzW03hVyeSa0sssRTqwTlJ
         XzhhUFW+OOzJx5SH+CKGpam/bzFvl3E1oKZM5nJnEvDh/BbdRccaKgrPE1awHYa+KW3K
         8hVP6I+V8GDWeiCA76AxzDp3NtyhtBFpgp+Skm3IAyy5ssIEYMmy2EFm7ABqx6bxbFZG
         NTTD8WGcXzUNcDQz7rPbj+GiZuCS3YKkoBtUolVruaDlRD6rqMZPOp5R/ea3hibW4dMQ
         /5RiGji5VnOtiQOvi+rAtg2QlVvZ/xlbTdZut+Q+KId+Bt8Dw8UyhHkyHD8/z3BXZIfN
         IpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPyaonqF0tGLyXo/u2EMILf4fitFyye50DOEUQlkLEk=;
        b=LLuLu/87mlmXgJjf1Hzm6QJNJ2Zelcg5Q3huIlK4KmgKQVUprfdXUMPe+LFXXPuRbp
         E6AWHJ9m1SMvbJdtrRWG0kGtekKbmciU3Xf3z85eDhEnjVLRvKLpD2rnzWM4nFUdqqNE
         FzqEiz2htYLVaaXZHq6wjSP1aRRi/8Z/cS66SLM4zSDggNyicxZR5jbL/bZBKwmcH6Kd
         Mi4APEZfBNxSpSZP0CSchUXsBswtQo9xjnDPpXViWyVjtSqUNynX1J4FAtPagfzv+igT
         Rdtxi7V0iKzOd3Npz/v28x3Geb/CgCJ5Xab63BnAy8eRtG8oqQ5jsepos64/SmSeDGbn
         Q+dw==
X-Gm-Message-State: AOAM531uLtBS8ZkKHmPCQhQ+nQrUJus6NAZVuVP/4utA5LwlQ3LBTCr/
        LbjBRTVSISjt8RIQc3/LB3sqkg==
X-Google-Smtp-Source: ABdhPJwvyfYhpRzdFl4PQlADwxIgc5snRZ0sIzTp+rK1IKPS7NKetqrwH/8HilFnHr0ln6fVhIuNgw==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id h7mr3590825pjs.200.1611297340455;
        Thu, 21 Jan 2021 22:35:40 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id 16sm7901894pjc.28.2021.01.21.22.35.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 22:35:39 -0800 (PST)
Date:   Fri, 22 Jan 2021 12:05:37 +0530
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
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3] soc/tegra: Add devm_tegra_core_dev_init_opp_table()
Message-ID: <20210122063537.7yd7ww47gl2rdsdu@vireshk-i7>
References: <20210121190117.25235-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190117.25235-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-01-21, 22:01, Dmitry Osipenko wrote:
> Add common helper which initializes OPP table for Tegra SoC core devices.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> [tested on some other non-upstreamed-yet T20/30/114 devices as well]
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Changelog:
> 
> v3: - This patch is factored out from [1] to ease merging of the patches
>       that will use the new helper. The goal is to get this new helper
>       into 5.12, this should remove dependency on this patch for a several
>       patchsets of a different subsystems (DRM, media, memory, etc) that
>       will target 5.13.
> 
>       @Thierry/Jon, please review and apply this patch for 5.12!

This is not how stuff works in kernel Dmitry, every commit in the
kernel tree should build(at least)/boot fine. Your patch can only be
applied once your base tree has all the patches on which your work is
based of, otherwise this will lead to build failure (stuff like git
bisect breaks with that). It would be better if you take this patch in
5.13, or after 5.12-rc2 once all other stuff lands.

-- 
viresh
