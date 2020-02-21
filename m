Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF5C3168152
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 16:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgBUPTN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 10:19:13 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37644 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgBUPTN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 10:19:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id a6so2307242wme.2
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 07:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dqRN5JnylZlOIhmcUvlHlHU5JfWxa8b0P/KSIbNjcJw=;
        b=ejobHK3HArHP4+VU9/1HAMXd5OLvKLZKaL077zxwvjPgRgUBjiwoXrjSUi8FM/i+8j
         n+ol+pyz19sWozO+t+HxZN7RU7itxFj/+w1Kv3btrPB6VaaMYB4pnThKsP0nUIL5VKoN
         dwzSTXWovyXnprPWjnUV+cOz+Q1azVM/rhOaE6JcVC1XSrRF/xcij05MSWcRTFSyStLh
         vvMx/ACoHqZNZIEAqHhlQ/IGB8AywmGlnERw8Kpn0FpyhMK0C49kf1+hrOR0QxL4HFGZ
         fzXKYCiEhHGgmwXcRdvclhQVUdfQkL38Y69Kxx6P6sEsdptwj1YzJjYxFm3SoygjZ7hF
         3ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dqRN5JnylZlOIhmcUvlHlHU5JfWxa8b0P/KSIbNjcJw=;
        b=RTLfBYkj1JsWd1rblPS9JUegWRex+oPC2I6Iq1CneLj0cUa32c3PCGbWYiG3Whe3kW
         8jshhptRrdyooL6A/kX36Er/YKjoPRIunwXkymdrcRMKXxaRrfuCH7Z6b/W4MUKkz37+
         qfxQvbKoak6QcJMDglA6wPljszTO67DFo5Spy0uP4XLWmZatykRvoITN6QgbViEAqE02
         7RGfh6BKv6gsNpKTKcHd++SQIKfVeSKgS0/pvJmXfAUOEne5q/s8GG7zxY8IdRfWgYaO
         7bUViR5pw3ZJaEHcmyRe0nNzems9hdwIFLwBCTUOJOeFMqcJyFWE8sLIFj8vTf1V1zPh
         qTwg==
X-Gm-Message-State: APjAAAUFQ6m1i746eb453DUx/hz3TuBsTeCYL/arQmMI2EsvlqQvTwfq
        o6eh1t+M1oBaC6tH19JQy/QiNg==
X-Google-Smtp-Source: APXvYqxJQI0S7WJHvnKNjlhDcKi5YluzuVk533v/JaF4deHL+JBVtIEaZNODmPDqJ2qVY230dCy/1A==
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr4456954wmb.162.1582298351209;
        Fri, 21 Feb 2020 07:19:11 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id a16sm4341203wrt.30.2020.02.21.07.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:19:10 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:19:08 +0100
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
Subject: Re: [PATCH v9 07/17] ARM: tegra: Rename some of the newly exposed PM
 functions
Message-ID: <20200221151908.GL10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-8-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:24AM +0300, Dmitry Osipenko wrote:
> Rename some of the recently exposed PM functions, prefixing them with
> "tegra_pm_" in order to make the naming of the PM functions consistent.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
