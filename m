Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6A602FE932
	for <lists+linux-tegra@lfdr.de>; Thu, 21 Jan 2021 12:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbhAULro (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 21 Jan 2021 06:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbhAULVU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 06:21:20 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F35FC061575
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 03:20:03 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id n7so1173761pgg.2
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UlV9SkLktbmadacAKGgdNG9Y2QsM6fa71yNEW4spCec=;
        b=dV21di/SIMnV6UG3syoEA4dXCTmipisQDkMW2ufldO2KP0jSQItvJ3YkLtmXk/+JhE
         7hmZ57fpHjt97X8PR5gXKmU1bgQz8d9clCagTI0XMnZpqP7mbO2Zh9iAagmu72olXVXj
         CpvgynAYjmFNlOtru+P+SYxpt+iir3lFG9dv6lysvnZP2hLf/APuNd8AjgmKHKz2BNET
         Q/B3hhhnbz+8xj6PhO4etIkonSNJevSre91l8KyekoUNJ+w0l4BvS0UDAMyBit0BFHnd
         2TjKMVh5o1fOz3r3E2jv7XYpty6AqtiuILOhk63BTwf28a0P+EHbNvdsGS3BPWyxJAU3
         Rplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UlV9SkLktbmadacAKGgdNG9Y2QsM6fa71yNEW4spCec=;
        b=BTpL6fEU2nUcKMw67a/Dsh+FFMH9lfdlBPVAVovqk5pfZSLuobkXfJ9jgZDhJXcI5E
         FCnVFCWxkBfl1mqlU4CEIhYI6qylwyD6L3NVfr1GITvQWTXcIA2QjEeckvct9EVlLY4L
         1+UCu3zWAu9Zm8vPAPVqkM0GCQVVeyk1Gv6jokGiLsU/uUS1bv8uCWW32gD9bm0qOoRA
         0ayRM5MO6mNGDuPTkAPha1E0QxMGdVWxLVwtxeBLFRYOOpS/pIYEi1f1HnfbyG52Xm5I
         va4l3xWzS1wX+m3Sk4O1nCymKX+RgAVELXgRMP+zNJjg/vhqwWVZh7Oisqi2dr3prxfV
         JONw==
X-Gm-Message-State: AOAM5302xK+aDwExy6kn8YXfux3fNKPANFsqCT8OjOAsETtedQ7CXr5Q
        uLwMZCQkj6aX5UeYZ67pi9XkPg==
X-Google-Smtp-Source: ABdhPJyWSSNOh5sgHtD8hlBg7objnemuBrANhZgMxnAG9UmzBJYI+f5LE6kZ+jLn7AkBm1SA7BUzng==
X-Received: by 2002:a63:455c:: with SMTP id u28mr506335pgk.142.1611228002718;
        Thu, 21 Jan 2021 03:20:02 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id gk2sm5831650pjb.6.2021.01.21.03.20.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2021 03:20:01 -0800 (PST)
Date:   Thu, 21 Jan 2021 16:50:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 05/12] opp: Add dev_pm_opp_set_voltage()
Message-ID: <20210121112000.rn6uvfsmgy2wyxwh@vireshk-i7>
References: <20210118005524.27787-1-digetx@gmail.com>
 <20210118005524.27787-6-digetx@gmail.com>
 <20210118095256.tr2qgnrmokkc6ngf@vireshk-i7>
 <a48dca91-4264-e153-cefa-ccbcca1b1d9d@gmail.com>
 <16c7e096-5efd-2d0c-a2ac-c11133c29c30@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16c7e096-5efd-2d0c-a2ac-c11133c29c30@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-01-21, 00:57, Dmitry Osipenko wrote:
> 18.01.2021 22:14, Dmitry Osipenko пишет:
> > Sounds like it could be a lot of code moving and some extra complexity
> > will be added to the code. If nobody will ever need the universal
> > dev_pm_opp_set_opp(), then it could become a wasted effort. I'd choose
> > the easiest path, i.e. to defer the dev_pm_opp_set_opp() implementation
> > until somebody will really need it.
> > 
> > But if it looks to you that it won't be a too much effort, then I'll
> > appreciate if you could type the patch.

Yes.
 
> Let's start with dev_pm_opp_set_voltage() for now. It shouldn't be a
> problem at all to upgrade it to dev_pm_opp_set_opp() later on.
> 
> I'll make a v4 with the dev_pm_opp_set_voltage(), please let me know if
> you have objections or more suggestions!

Sorry about this, I have been working on this stuff for last 2 days. I
didn't reply earlier as I thought I would be able to finish this
earlier. Once you see the patches you will see it was a significant
change :)

I have cc'd you to the relevant patches now. Please see if they work
fine for you or not.

-- 
viresh
