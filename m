Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDEC3020B8
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Jan 2021 04:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbhAYDPg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 Jan 2021 22:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbhAYDOq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 Jan 2021 22:14:46 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC94EC06174A
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:14:05 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id md11so7497395pjb.0
        for <linux-tegra@vger.kernel.org>; Sun, 24 Jan 2021 19:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fv/Vky7VFm1rltfdk/uW9VJjxFj6h7S+3peZRA6VmK4=;
        b=ONt2ctS2r6+gdTUGauF4KDHMMjNs4o1+EEOOKWV+b1aRsybyGD7LvWmgzB6RMbVZRU
         Liy7uBpfAvBSvQC4139zEHKth8hSk3A9duRcJedtQLzwB0kvwuprI5q3FCsWVwjqYbGH
         Sgudy/BHGhLiwAuK8CGrAUhJtJwUbcnoLY2TjDrBoSpZbqcDSTi6+Jw4XpqSj5ZNOrwX
         PQR/2kTs1O82swWCPcgVJSq3bzg1y2R3trldcKxpIkQ+hMkpdh6yhyh4l5EAqivwUVlB
         pIaV3A3caecW+YcKxf4HKxYUy6Qrqik0Ji3rximBJ5vKLG4ZQyTqZkyAWg+D1930Q8lg
         L7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fv/Vky7VFm1rltfdk/uW9VJjxFj6h7S+3peZRA6VmK4=;
        b=cgMphA7kMU2Zysm/4T7roTeQdi1k9nU1g4PmXlL+Xz5TrfxNkXlSdF3sQ05kePvk/g
         HyOvPnxeDlgQCew57kXZjUi6BsiFTMuQLJPp2uQR1TAZoEOcgzi7XGJ73S8vyAqO/2Di
         fgjXVaY01hiSPvyTbiMrndwNhvItR2I8ubFyfGSWDkMTqe3rkbhqGTUNPaNPFGglzo6O
         2jCCnk/msDAsqnufGU7pTzU8GKuMWkKmByjfXtNgesyZQcgxqY+HpaE/39YorXRvc1qM
         +2MM6jXl/QO3FiDv2maKC4Ul/jndzJMPMV+ZxqqahFNbAw6zl1XTQ58lY+sFhrRYhb2d
         jWpw==
X-Gm-Message-State: AOAM530WWduK8ozfxavE/NQKV8LZjaDGJe0STWg1fQVidMD9ObfP8Vtc
        AfyGRGAR52c1N+UnaK7BN+Vbrg==
X-Google-Smtp-Source: ABdhPJx4sy7iiTC8WR6f/YSHtq6fKmuH/YAA5pa1K04GTf1kXOR1QF1XbdaKvtqwkRuURwGS1g7aOQ==
X-Received: by 2002:a17:90a:4088:: with SMTP id l8mr1063445pjg.106.1611544445506;
        Sun, 24 Jan 2021 19:14:05 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id a21sm14746508pgd.57.2021.01.24.19.14.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jan 2021 19:14:04 -0800 (PST)
Date:   Mon, 25 Jan 2021 08:44:02 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] devfreq: tegra30: Migrate to dev_pm_opp_set_opp()
Message-ID: <20210125031402.aqiwhlsozvakehxd@vireshk-i7>
References: <cover.1611227342.git.viresh.kumar@linaro.org>
 <3345fd49f7987d022f4f61edb6c44f230f7354c4.1611227342.git.viresh.kumar@linaro.org>
 <71451eb2-46b2-1ea0-efcc-0811568159a4@gmail.com>
 <20210122062659.qss3hef4kltfgciu@vireshk-i7>
 <f33334e7-bd28-af82-b557-681a2b4132da@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f33334e7-bd28-af82-b557-681a2b4132da@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-01-21, 18:28, Dmitry Osipenko wrote:
> Either way will work, but maybe keeping the dev_pm_opp_set_bw() is a bit
> more straightforward variant for now since it will avoid the code's
> changes and it's probably a bit more obvious variant for the OPP users.

The problem is it creates unnecessary paths which we need to support. For
example, in case of bandwidth itself we may want to update regulator/pm
domain/required OPPs and this should all be done for everyone. I really do not
want to keep separate paths for such stuff, it makes it hard to maintain..

-- 
viresh
