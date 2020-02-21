Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5388916817B
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 16:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgBUPZV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 10:25:21 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44676 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgBUPZU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 10:25:20 -0500
Received: by mail-wr1-f66.google.com with SMTP id m16so2479863wrx.11
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ssZD75jnMR4hkpMZQUIaBV1XsPq4KUUD/45GvDXOh8w=;
        b=yX6oeuzDqFoZotjwwRgZd5CJF3eHAtckqPKNrFkSSKUDFAL1TVu9g61iJVR0q4hHyW
         epgF3jHjPOWQNa6WvdAnZZrzQtDlOrSuHdhobX7Y+3sUBfCK6GPrx8vuaWJLi+JUh1S0
         RYm49beZQuMWbbzg/5bWn2uN27+wBKRv7RcXThQR+Pr3swRb9hG3E88MOMckycX14led
         z8lJSPmTA4LPMZU/rdFJe2feUGN5EEDV/mzy+5itKq0TRuiTl1vYk3LqW1WGKJLXG2QK
         gghGgkMqjtPYzdu8l4TDJUuLl+UNj5SpAJKfdbg838eN9hE58QjK/EsTpkej5LXnFk95
         m5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ssZD75jnMR4hkpMZQUIaBV1XsPq4KUUD/45GvDXOh8w=;
        b=gLPgTGhTheKivM3DE0ozq+Ylulj26xajIvDdsy6VcYJNmcWQ8Oe8+ojIjOcqvTR8H0
         4e/jPAJDhC8NPHlUTZPoe2IAexWDhSYFoCEOlrdpplmgk+D6UtK9HnFUloulFi+lkUkZ
         8HmZsGwkL8UfSfzNDE6/RtiB0xMYrZsms0RDdwYgQ0UFddu3vWuil3/aH7OAyvvvVkeC
         vTPdTCF4RafY3tZh3jCXC7eHSKtioh+4dr/8hui/oh8RwmSQN/+3Z9DOpXiMrRKV3ChR
         QqGJPNBOQkec4KZNgw8UbA7lJOEMPgwIt4nZsOxMptY5X5EK7HZKZYS2E8AkAhakXxmV
         +9bg==
X-Gm-Message-State: APjAAAW5Gggh3p4iwKvRWchcJgVGAfRJrJbUX4G53AGw67BuJIdBMWtV
        jSwmsf94l4R3H6JMUWfTAFx8PA==
X-Google-Smtp-Source: APXvYqw8hWuDjGFL1KGZLrxDnhUgXxseZzDmu9i2/+jn5uput9GGc8z+ISI5Gbt27cwRskGJrGca9Q==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr46836567wrt.88.1582298718203;
        Fri, 21 Feb 2020 07:25:18 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id t187sm4488863wmt.25.2020.02.21.07.25.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:25:17 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:25:15 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 10/17] arm: tegra20: cpuidle: Make abort_flag atomic
Message-ID: <20200221152515.GM10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-11-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:27AM +0300, Dmitry Osipenko wrote:
> Replace memory accessors with atomic API just to make code consistent
> with the abort_barrier. The new variant may be even more correct now since
> atomic_read() will prevent compiler from generating wrong things like
> carrying abort_flag value in a register instead of re-fetching it from
> memory.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
