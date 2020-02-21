Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF89168218
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Feb 2020 16:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgBUPoP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Feb 2020 10:44:15 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55164 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbgBUPoP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Feb 2020 10:44:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id n3so2252440wmk.4
        for <linux-tegra@vger.kernel.org>; Fri, 21 Feb 2020 07:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2hlS8uh302ck8d7C7CZX+ehT/azcPcgkvr5+mGQ69YQ=;
        b=a5RX33mAffMVrIDgMTaztmSD+eWGJlZaEKzfTDHcULYB45n9pX1a0hDlHVLSjVHi92
         BcnwA1WjQbsvMjRZZzg4lIOlJ6HJEtNbk4WGnIm7tZwTUOVgjaKk8EQibqLXzfBCqo/c
         0I6id7eHku1rJ7heOghiXletnT0STJwoD7225/TjDKZhiUe/zfag5sAJ1N27HjL37VXJ
         Aoise+ais0A3HJZ3uJsHnV6BXq7FcL3ru+KDeIq2Do+xrbDfI0/X+I8P8dNRhdOMaX8z
         99/sR1guvCs2DtPptnkbZ/5jyF+sjSr+X0/VjiORi4xOYUK4IEJY8AVcHBpZyuRD6dHw
         1JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2hlS8uh302ck8d7C7CZX+ehT/azcPcgkvr5+mGQ69YQ=;
        b=C5nlTzf1tP43LPTbpFNuXVvAmM/2PP6WXB9ROWJiONol785Ovu7Ccc8yFecIo4NNek
         m5QJa7+RAPchCl/nzNw84mzhzxQNmRcixZ7uZN/L84JbM3kgROCEBfPG7vuwx7oZt9H7
         f5MBIxYWmpzHzBxjw9ndkU6CxpNyOo29gs4v+IFcEg38TU8SoVH4NAYFkZ6AQ6zbrFM1
         wTZvyTKO1o5rHlWK+auJrgnHQhkOBtRFssTal/sCWMdY+A1uHEERnYix3hzW5FrSpWAx
         bYk6R0hXP8FI0jVTnRFfYuUNFK1joAmd4Ax6M0QQ7J5EtXTkxMkps7YsttifyB7osMQ8
         PY4g==
X-Gm-Message-State: APjAAAX4wOy8qVXGirSm11QFyMfPjTTOsVCZcuXF49KOFZHyxx4K25Hs
        SIy1J971BjQbJfuiIR+LJ0ceuw==
X-Google-Smtp-Source: APXvYqw3MpYXm74zDyUvYS1IEClp/DjjD7sjq6g9gEA1iHcMzwd87lVu7ETDNrlzQjko/voWzgE8Ew==
X-Received: by 2002:a05:600c:290e:: with SMTP id i14mr4539761wmd.139.1582299852664;
        Fri, 21 Feb 2020 07:44:12 -0800 (PST)
Received: from linaro.org ([2a01:e34:ed2f:f020:903b:a048:f296:e3ae])
        by smtp.gmail.com with ESMTPSA id s15sm4362854wrp.4.2020.02.21.07.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 07:44:11 -0800 (PST)
Date:   Fri, 21 Feb 2020 16:44:09 +0100
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
Subject: Re: [PATCH v9 12/17] cpuidle: Refactor and move out NVIDIA Tegra20
 driver into drivers/cpuidle
Message-ID: <20200221154409.GP10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200212235134.12638-13-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 13, 2020 at 02:51:29AM +0300, Dmitry Osipenko wrote:
> The driver's code is refactored in a way that will make it easy to
> support Tegra30/114/124 SoCs by this unified driver later on. The
> current functionality is equal to the old Tegra20 driver, only the
> code's structure changed a tad. This is also a proper platform driver
> now.
> 
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/Makefile          |   3 -
>  arch/arm/mach-tegra/cpuidle-tegra20.c | 216 --------------------
>  arch/arm/mach-tegra/cpuidle.c         |  14 +-
>  arch/arm/mach-tegra/cpuidle.h         |   4 -
>  drivers/cpuidle/Kconfig.arm           |   8 +
>  drivers/cpuidle/Makefile              |   1 +
>  drivers/cpuidle/cpuidle-tegra.c       | 277 ++++++++++++++++++++++++++

Is it possible to use -M option here to make the review easier?

