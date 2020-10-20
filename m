Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A172282FA4
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Oct 2020 06:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgJEEeh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Oct 2020 00:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgJEEeh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 00:34:37 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FAEC0613CE
        for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2020 21:34:37 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id y14so5183052pgf.12
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2020 21:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ER8SNkIBPUO1PeDrBI9sogZFaNg4g0CVTXD/yACbP1A=;
        b=uVF914RE8PZ+0g+2++oaI7xbK8lnE/K79gTtJ5mrBQ7lsDIKF2bikRJFghZqW+RY9m
         7owim99rGPKMMdXspkSHKrRZobVVU5UligXCkmPofpdtnIrbxJkpE/Ar5C/zRRLc3Eh7
         +1YMbuG2CaNmc1zVJDV7D4MgSyeYEo591bp55KQQzhgGwDEoJDEJJv74RR6qUwcCBl+g
         7Z1sm2ZgBnbRNNCiSRm8gmQmsmLVY5BSwP97XaPO8WsSZ44euDGEgKShq3dCkbRjL5fz
         gmTjAKXrfmz5zbLfpcMS1BwgwhaVvTvdLfdb1g3D+mDJWUc4bLWl4jefPdr5EpTMeXnw
         vRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ER8SNkIBPUO1PeDrBI9sogZFaNg4g0CVTXD/yACbP1A=;
        b=rjwsd+vZyiQQHHfWwBlTv4syJ0ooQgtXE6qfTt8lLoxXhGg49R+oLqhesF3fdDqUpc
         776SNTny7UXZKzS1Wul71dtPNrJtXtlPakMyvXNtOdxUbI2xJ0LSo+rPI711L4QCr7jB
         XwwPfMg/8LaIgMg1ZnXm8Gw9LPQrKK+A7GbqxFkFK21eZeuUbkeQUOVl6jehX7teCZ+f
         jR9yYXedG2+80ub0EcQ/41H1TWDrWVakf0yjcTLkuWG4Cwq6D5Bfs1vB+lOsHgAKd01t
         7gqVk+IudoTJfLinWEvvY7nxwDOegOwi2B/pWIcsZC/eUEmbHUGx6Y9V6avhTfCzwMZ9
         GQNg==
X-Gm-Message-State: AOAM533fdYSv9OVvpH3J9Z56zpiv0MKXF7W5FenXdyZg4LB3N7Cv1xB3
        VxbRIeZa6Tm6a7cFaipvEfBJCQ==
X-Google-Smtp-Source: ABdhPJzrKc1LvHWa06bmxAdSLSneIia0aUnXbwiPmahaJ6y/3sCPWUpdaV9xsfJiYpM4Voc+ai37Bg==
X-Received: by 2002:a63:f812:: with SMTP id n18mr12307150pgh.438.1601872476758;
        Sun, 04 Oct 2020 21:34:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id 17sm10507165pfi.55.2020.10.04.21.34.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 21:34:35 -0700 (PDT)
Date:   Mon, 5 Oct 2020 10:04:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net,
        thierry.reding@gmail.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, ksitaraman@nvidia.com,
        bbasu@nvidia.com
Subject: Re: [Patch 1/2] cpufreq: tegra194: get consistent cpuinfo_cur_freq
Message-ID: <20201005043433.hvyjmzafazg46kvv@vireshk-i7>
References: <1600276277-7290-1-git-send-email-sumitg@nvidia.com>
 <1600276277-7290-2-git-send-email-sumitg@nvidia.com>
 <81d2517d-6581-b491-c509-832fd1c0321e@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d2517d-6581-b491-c509-832fd1c0321e@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-09-20, 09:36, Jon Hunter wrote:
> Viresh, ideally we need to include this fix for v5.9. Do you need Sumit
> to resend with the Fixes tag or are you happy to add?

I understand that this fixes a patch which got merged recently, but I am not
sure if anything is broken badly right now, i.e. will make the hardware work
incorrectly.

Do we really need to get these in 5.9 ? As these are significant changes and may
cause more bugs. Won't getting them in 5.9-stable and 5.10-rc1 be enough ?

-- 
viresh
