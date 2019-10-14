Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6BE6D5F2E
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 11:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfJNJmU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 05:42:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43131 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731018AbfJNJmT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 05:42:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so10069606pfo.10
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9EZ2CAYF/ruwxMS5yj+L97wNDpDK5XJtgLjNWSpbBxY=;
        b=euFtDA/oNmaP/TAaEVRPp2JDKqvUMYOnR/4UNQIbZYOgOa1MscDwuSmOL9k2QnofjW
         lEUn2a3PTDfGKRZEhYehvYM7/YS4qVIqs68jtGTnfRaNS1mrVRKwyGYLAYRZeR1FQ/1K
         sRka2BuUoBKOXBm5+OyafiUMomNpmJA4ptbB3AweEtEN2cmgERG6BK6YyXuZMVOc19u4
         Mk+yCo04nEfmghOcbljF6ynuYIHt22rKQ1jceCDv1JgTB6Y6r9zg5herRkzVLbgkEGGK
         MYSwBwjNt3UBz+9Qb28TW8jJPzXy2bSVRjyiH6dPmSSIuskrNaohwWqbD2wQ4nVPpdin
         x0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9EZ2CAYF/ruwxMS5yj+L97wNDpDK5XJtgLjNWSpbBxY=;
        b=ob/natGa5fnpFTVDLRg0+SwGs5rAOsql6J/mfPxHRosUTFKM02WqwSin6+XL1YnmDN
         DpJQw7i84VJe/hUhm6h/GO3r9IKmG5Y+G0qohX88sSnUFF37YfNl9DN+PYpThws8Fp94
         EZ++SPBr5IAsjgogzBWKUDs8rPHTNXaxQ+HeWOePwB0baMR/LI69zxhR+LB3011taHZI
         OAUBECt+7l+Gus20+BOld2EsULbsjkDRSeVKDA9B2P76n0kqaOimX5JqYXPATu7rSnWE
         5P9KBl8Qhg/TwEvTNfSpmUhLx1BSDpNJ92Q0ka9XTLpUR7jA22v1g1Y4Bnl/xlitPdMe
         R/FQ==
X-Gm-Message-State: APjAAAUHb9RcU383+SoCSn2A2TTI+NNdlC/WX8fMAhMtg5PJVu/dn4e8
        lHQqcNAYC35VAAdboSnd/datRw==
X-Google-Smtp-Source: APXvYqyfGD2Tc4/8+m1Jo0gdD4TWIoemKR+b0GJMSZ/HAQQguxnH5mnWPqKBVur/I0ISr8vxPVZEkA==
X-Received: by 2002:aa7:8d95:: with SMTP id i21mr17844198pfr.161.1571046138560;
        Mon, 14 Oct 2019 02:42:18 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id e192sm22566619pfh.83.2019.10.14.02.42.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 02:42:17 -0700 (PDT)
Date:   Mon, 14 Oct 2019 15:12:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>, mka@chromium.org,
        ulf.hansson@linaro.org, sfr@canb.auug.org.au, pavel@ucw.cz,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V7 5/7] cpufreq: Register notifiers with the PM QoS
 framework
Message-ID: <20191014094215.kb6q32chgb5sd2nb@vireshk-i7>
References: <5ad2624194baa2f53acc1f1e627eb7684c577a19.1562210705.git.viresh.kumar@linaro.org>
 <2c7a751a58adb4ce6f345dab9714b924504009b6.1562583394.git.viresh.kumar@linaro.org>
 <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c503a7-6136-a405-369c-596a680183f2@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-09-19, 23:12, Dmitry Osipenko wrote:
> This patch causes use-after-free on a cpufreq driver module reload. Please take a look, thanks in advance.
> 
> 
> [   87.952369] ==================================================================
> [   87.953259] BUG: KASAN: use-after-free in notifier_chain_register+0x4f/0x9c
> [   87.954031] Read of size 4 at addr e6abbd0c by task modprobe/243

Hi Dmitry,

I tried to reproduce it on my ubuntu on ARM64 setup and I couldn't hit
these issues on v5.4-rc1 with Kasan built in.

I then enabled Kasan (tried both inline and outline instrumentation)
but I couldn't get past the issues with module insertion. It fails
like this for me:

root@linaro-developer:~/work# insmod cpufreq-dt.ko 
[   72.985974] cpufreq_dt: Unknown symbol __asan_report_load1_noabort (err -2)
[   72.993164] cpufreq_dt: Unknown symbol __asan_report_load4_noabort (err -2)
[   73.000307] cpufreq_dt: Unknown symbol __asan_report_load8_noabort (err -2)
[   73.007451] cpufreq_dt: Unknown symbol __asan_report_store1_noabort (err -2)
[   73.014643] cpufreq_dt: Unknown symbol __asan_register_globals (err -2)
[   73.021409] cpufreq_dt: Unknown symbol __asan_unregister_globals (err -2)
[   73.028349] cpufreq_dt: Unknown symbol __asan_report_store8_noabort (err -2)
[   73.035543] cpufreq_dt: Unknown symbol __asan_report_store4_noabort (err -2)
insmod: ERROR: could not insert module cpufreq-dt.ko: Unknown symbol in module

I tried to search for these errors but couldn't find why I am getting
these and why the symbols are missing here. Can you suggest something
here ?

-- 
viresh
