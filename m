Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130BA1683BC
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 17:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgBUQjT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 11:39:19 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43685 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgBUQjT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 11:39:19 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so2744803wrq.10
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QjTyTbipJt5dMzjmIdDzAUN6hlDcjLhrXHCIzO32swU=;
        b=SSPNOfzSs9LjzxjHRN7eg6XW28B3PaBN5bgPA5Pv+CJIpiaCw80cexZogBaEx3obvN
         Ix0ERJnECtRHuNfPwlx6Lqof4XhKpEwuOHyRdRmIVnf7ZqdlIK1jfwPHdAT73zKnA5fi
         kK/1cC+5JpjWdCIdTTlqpzlxmkDHIGh2dzLdC8QPIVCzYGhU2nT1VHomXeumu3Wb3ldU
         mRQQWNmx8eHKBsy06cTVsIEsbt2keYOVa//zUotuolDVnG8sU22Am2VY12s1ikLBsBfI
         Cb3dt2g/O+rXt5rYn1rjSUfI7pyblpgOCKc1/TCrfotm2O39qxxGXqCUmdXUXeENv93g
         RcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QjTyTbipJt5dMzjmIdDzAUN6hlDcjLhrXHCIzO32swU=;
        b=F0EEQTttgxD4ps7NC2qwJE49uVPK7f9iWRUxUYlaJs5bdgf5G4QbZllOm1zrmvxDLw
         F73GawVDUZYy0PN4up4OrjYMYA285Gp2sJEMYvkN7fnzps2ZEx1U8LaZjzP3ck836NRe
         5iI6lDRd/ClSEtGaYZ+AIr9REVfXklh0Usk+D4C594P2xECeCRnjjomhMus/90zWSYWI
         2zMMUIdYjq/vIX+VSBK5ABOzrjr2WfhymtJztmUeP8dVYtWGXpFWSvisKHFJjR+KVC+e
         trV7Xja0bn9jE36fziOZr3U9wzG+zCgk3bdRU/rjzw+PJw0TOw2yepDHTVWF/fEu60ba
         vokw==
X-Gm-Message-State: APjAAAX9qx0c7Ll5TbqGWj0j44uGO/7gkeZg/Ro5J/ciW2tfG22uniwL
        oEBUCRtOJ/8fFJ5u7UeDW3n4aQ==
X-Google-Smtp-Source: APXvYqyhVFhFBPSqnFo56LCyr1nJlT2hcmUgR2c5NunDYfi/Fc9CnjlmGN7Mc7+ge8fiAVpk5qDoGw==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr47981280wro.375.1582303156945;
        Fri, 21 Feb 2020 08:39:16 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id t9sm4805226wrv.63.2020.02.21.08.39.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 08:39:16 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:39:13 +0100
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
Subject: Re: [PATCH v9 15/17] cpuidle: tegra: Disable CC6 state if LP2
 unavailable
Message-ID: <20200221163913.GT10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200212235134.12638-16-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:32AM +0300, Dmitry Osipenko wrote:
> LP2 suspending could be unavailable, for example if it is disabled in a
> device-tree. CC6 cpuidle state won't work in that case.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
