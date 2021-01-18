Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813502FA052
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 13:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391572AbhARMsd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 07:48:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388975AbhARMsB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 07:48:01 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A1BC061573
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 04:47:21 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id j67so2469250vkh.11
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 04:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b83F1B/qVW2V5ML+weocFQV9HBWi+FGn2tiA4+WY95g=;
        b=JIzaye8OLy57uPzFlpwaIvTQ0n5EhlhqPWsLXmmZuXzLj3MFi5nTnPIbqGxjfiJUwE
         EYOXXVZbs4UUl7EvUTgLNaY7I0KIiifJmW/Cl2ZEG9GWG17fBV+/cIH2buyjjrDCvOGT
         v6pDzHuLeJX86SdopnLzngsn6+8EmRr7xC7ok/up+2tebxYrkH7fgIqPInk+RM06/yN7
         sbryszEQiwuLQC27si31af2ky/xbchx9rVE2/epkZZUofXapn3bkxkDUVn8QPdX3dkgG
         AIzZOEfXvd1qdZBf4jWS+W7vguWpKJv8cF4tM4JPkuVFTJpZJJDu3fzR3MlhjwZAW3LH
         FA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b83F1B/qVW2V5ML+weocFQV9HBWi+FGn2tiA4+WY95g=;
        b=MYlf17AMJ3JlG14BEnA9svub3UMhHIbq8mzVjx1MF2DNXVFhTRGwlZlJWDXItLehgI
         XkSTQlexS0UoJR/kDBy1sarsargyD6AKj7PLYaKYKYIJDUnfoDktpRdC4ncoQl3AAeyH
         x0KQq0L31GFVGacl+Z4IBUIvzBkwL6B5Fvd/W5nrz0XJp5Lo4ZuQoWmaM+sPdqCgUYlZ
         su1MF2QWjnweKTYi9h+LoFtnCAnCMtH8YIP4IfENAy9lD76sJtPo3qyk/vMCIJIisict
         tTHhE5RO7BZ+G9gPuEN2UMQ2VHIj7Wz0NevNmCI6CLXe+PC0SjH6J3ZluJwnTGK2VJPj
         UP0Q==
X-Gm-Message-State: AOAM530FqfxxmFdB0XPOxF9ENZHGBQLghhdGxXaOl4c6V5dd3tTA3Apq
        QiuD4GWGvCTre90Hxj8i3lLaLiRWS0PHd6CkayYxJA==
X-Google-Smtp-Source: ABdhPJwv6E3z66cqB95O4c0V2uVDpQXhiPOpTXlNp8u1EQNaJMUuByE7k6gKfvyf/E25VneGlD54u9W7Zh6OW4OJh7Q=
X-Received: by 2002:a1f:dec2:: with SMTP id v185mr17551711vkg.8.1610974040303;
 Mon, 18 Jan 2021 04:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20210118011330.4145-1-digetx@gmail.com> <20210118011330.4145-2-digetx@gmail.com>
 <20210118072855.anncyl6z3e5uznvd@vireshk-i7> <CAPDyKFquCGUSTvcCpmN0vm1eGEz9B_hYSNm7wojhgwuXT=jkEQ@mail.gmail.com>
 <20210118110506.linvsoca7jbl42iq@vireshk-i7>
In-Reply-To: <20210118110506.linvsoca7jbl42iq@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 18 Jan 2021 13:46:43 +0100
Message-ID: <CAPDyKFr7SD_A9sKD2+90XfjP09T+PCLE=8qvn=M-yPEPXvBhsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: domains: Make set_performance_state() callback optional
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 18 Jan 2021 at 12:05, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-01-21, 11:59, Ulf Hansson wrote:
> > Good point! I certainly overlooked that when reviewing. We need to
> > reevaluate the new state when propagating to the parent(s).
> >
> > To me, it looks like when doing the propagation we must check if the
> > parent has the ->set_performance_state() callback assigned. If so, we
> > should call dev_pm_opp_xlate_performance_state(), but otherwise just
> > use the value of "state", when doing the reevaluation.
> >
> > Does it make sense?
>
> That will work but I am wondering if there is a way to avoid the
> unnecessary propagation if we can somehow find out if someone above in
> hierarchy supports pstates or not ?

You seem to be worried about latency/overhead while doing the
propagation upwards in the hierarchy. That seems like a reasonable
concern to me, especially as the genpd lock is taken at each level.

However, to mitigate this can be rather messy. In principle, we would
need to walk the hierarchy upwards, each time a new subdomain is added
in genpd_add_subdomain(). While doing this, we would also need to keep
track on what level we set to continue the propagation of the
performance states for. Even if this can be done in non-latency
sensitive paths, I don't think it's worth it because of complexity (I
haven't even thought of what happens when removing a subdomain).

So, maybe we should simply just stick to the existing code, forcing
the parent to have a ->set_performance() callback assigned if
propagation should continue?

Kind regards
Uffe
