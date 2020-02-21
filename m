Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF91F168101
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 15:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgBUO6x (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 09:58:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42818 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgBUO6w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 09:58:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id k11so2394657wrd.9
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oEykVJQOde/kw8FuzYyK6TbVeNPZu6MWcUJ10Pto0IA=;
        b=ipb0gqKpnH8eZQgist6/WhFHScfIIDaUKF+YlbE6HPBeFQIemlkloXs81cSL1ZN4iZ
         mTkfja6gIWCuppriqnMHuyB1am2J5DJYqQlrQ1HcbraCInK3TJESZy+li98cpiIEKEbP
         3Urd/YdG2Xo4GXDBzarxrAO+CgdH44P3OeR2Ff8gfoGNyJLRPZKeC9J39b41W1GJ9uWk
         18JrOBUtIvKTSGblB/mw1Bylv5ErmL/bxLhSrf/Gz2BXKca9J1xPWNFtivCbmdMWUIQa
         GhPNOirMvH/3Y5kPYR2jHURDfNOSD70w79VpYYODoogSQAGDhzrHoFKgeyu9jtA33sBK
         aZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oEykVJQOde/kw8FuzYyK6TbVeNPZu6MWcUJ10Pto0IA=;
        b=p0pXUS7iQ64jpqZ7L2PeSeTiJBzgdf1cMCmqLzMjhslFAVK+jZ5xORD4TTZbayNkNb
         PhF46Cm6vcIcBa4JCkLnbrvMt4SAtn/lGpkTOGdqzpRNXJv7nWCWSiDxZ7tnGAkgZVh2
         65942u2acGuU2Nh5CVrdJ0WEPQ52mKRSU5+33ignmbglM7SaASp+q0SkgRHMvSsRsM8Q
         Qb0hDTFGfiPyPtREnniW+/xQFI6bYrEyNVMIKt9O9gCMnsM64EaBPDD8YZnCt6N1Sbtq
         4oLCLXeqcDUwDfxlPDOKgopiB/3zTeXLvIEDoHYhKyarlejyeIhe0VxgHPazbo7fUggA
         AG/Q==
X-Gm-Message-State: APjAAAU5aN4tExdXDndU96/pRLEqLSD8/eHXdTTZ7vVfytNl8BAyMaWe
        SjxwgwMHQFxb53N6RbEAP1uI+w==
X-Google-Smtp-Source: APXvYqw5xErxKhMBv5gx7PiJTT4buaJCBAgeciEkFL3HX/fDBfWZq5ZsZ5zArg6gc4dn9bxvuaNzFQ==
X-Received: by 2002:adf:b352:: with SMTP id k18mr48018831wrd.242.1582297130530;
        Fri, 21 Feb 2020 06:58:50 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id b21sm4153587wmd.37.2020.02.21.06.58.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 06:58:49 -0800 (PST)
Date:   Fri, 21 Feb 2020 15:58:47 +0100
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
Subject: Re: [PATCH v9 03/17] ARM: tegra: Remove pen-locking from
 cpuidle-tegra20
Message-ID: <20200221145847.GH10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-4-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:20AM +0300, Dmitry Osipenko wrote:
> Pen-locking is meant to block CPU0 if CPU1 wakes up during of entering
> into LP2 because of some interrupt firing up, preventing unnecessary LP2
> enter that will be resumed immediately. Apparently this case doesn't
> happen often in practice, I checked how often it takes place and found
> that after ~20 hours of browsing web, managing email, watching videos and
> idling (15+ hours) there is only a dozen of early LP2 entering abortions
> and they all happened while device was idling. Thus let's remove the
> pen-locking and make LP2 entering uninterruptible, simplifying code quite
> a lot. This will also become very handy for the upcoming unified cpuidle
> driver, allowing to have a common LP2 code-path across of different
> hardware generations.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
