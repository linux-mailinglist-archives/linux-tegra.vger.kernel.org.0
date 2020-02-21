Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B42B16814D
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 16:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgBUPSI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 10:18:08 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37434 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgBUPSI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 10:18:08 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so2476727wru.4
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Xs/pMjB7/UAvSRgUz3vf1voZfhwMsJXveHYGhWrFdvo=;
        b=NO1zhZOhc4ARAQOoDIEF4wqjZjFyeXwv4Q9EpWeiulrTX4z0YI9oOGa++ikmL9YdJJ
         O/9SNaMQxkwKlI8g9bQJjhf3ES/rFORqa2ih6KaT2njQrNKM5UjaNb4oInmF3p3T2f1I
         /ySfV94lkY+9aK2rOyZ0Ap8BG9NmrFYTrL6mBxH8ch7Wx+HMUWNEAZnt0fCL0oAXdLCD
         /E7fqFePw81uyJWTQ/sYKovEFEvmo5LJZC8nEGn/T0hSrQ7JqX0rlEHkqedBdm7AT5YO
         qFQjtb2TPO667cv6xQ+/akFDyilzU4b4EZXUuknHiN0Ha3iG2wPqQQvCVzd4KZ1LDRjZ
         YINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Xs/pMjB7/UAvSRgUz3vf1voZfhwMsJXveHYGhWrFdvo=;
        b=F+iauDHcyH5uTc42PwXMcQUoXtNVbtk2sVV/SedLD/6x6E1Qz1TbIusKD7ofYGKqCL
         1jAUZjQPIzivU8G1BmCDcmnkg65G2RfXdpTEhtFSvtSFLtW0Ma4vpMPDEO3m4RG+vlni
         VbxeEz3+rQWQ40xITQVvRUwpKqdQKhvOWpZE8ipt8gn08qX6AtOsy6v/27PLqAeE+b3o
         4IE36HyBS72JtstimBmZPSjVORRRuskOedM3NH0Ssrf3Ud/FxukEN5CFrUhn57jYg1YP
         mXkwqjBXRCt3hvBFEs4TOTPG0rYVLqWGX6Jv7wJ0BZ0onR9wLfOl11kdLdHJlidRhNZS
         U9IQ==
X-Gm-Message-State: APjAAAWgrQGUx200nytl0cgGIla8GaF3Phk/SSLcTN1wLoae40H0Nl2Y
        NNDdxO2cy86LfHhxtgeTQm9Gew==
X-Google-Smtp-Source: APXvYqwsPdNWWNY83b7chQBTdWo7WqG2J+ICUWV8+47fBy1kGKEOcw6OoXUj2py6PednFjj5sxl96w==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr48640392wrn.283.1582298285067;
        Fri, 21 Feb 2020 07:18:05 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id s15sm4277441wrp.4.2020.02.21.07.18.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:18:04 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:18:02 +0100
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
Subject: Re: [PATCH v9 06/17] ARM: tegra: Expose PM functions required for
 new cpuidle driver
Message-ID: <20200221151802.GK10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-7-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200212235134.12638-7-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:23AM +0300, Dmitry Osipenko wrote:
> The upcoming unified CPUIDLE driver will be added to the drivers/cpuidle/
> directory and it will require all these exposed Tegra PM-core functions.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Jasper Korten <jja2000@gmail.com>
> Tested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

[ ... ]


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
