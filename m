Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1712FFAA
	for <lists+linux-tegra@lfdr.de>; Sat,  4 Jan 2020 01:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgADAhM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Jan 2020 19:37:12 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34148 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgADAhM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Jan 2020 19:37:12 -0500
Received: by mail-lj1-f195.google.com with SMTP id z22so40616811ljg.1;
        Fri, 03 Jan 2020 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ts+SjzC4Gm6lvTOxTySTq7TEeSE+o11aKR5We09tXnU=;
        b=cYJl/4rk1daPvvXESQWI91tjOBG8icZXyT/9Igjz8/1LNO0cfsQ7JkprURrKb5YZvx
         BzLzdLAO8LyKI1nxuKVpam8W8OH2I7iVRG6AVVBnzSpFkhzHEnHOM5jOTqjRcii6cXVs
         n4hFUGBUh0LQ+by8rhvJYvPXO4IOK5Puu2jF21IXaPzAYRKmxfyK3bEPWgLrsuhM7JJ3
         tS2oMh2J6zzz9QbUuuCpTZkwCOI/GNPPICX5jGXhSJhOvnGaJ+mTxgBixkabiHjZFVcD
         cj+d5Hk5sMjw0f89K9X6u2ynFxLC60GJlMkcp84B6BRkeaZ5xxbZc1GDpHvTlkmmjWBo
         eN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ts+SjzC4Gm6lvTOxTySTq7TEeSE+o11aKR5We09tXnU=;
        b=iFxzDEc1DSTZmdUsf9j4FPx8sF+rXgcItO1e/9hIz1vtqIWlbRpVXFOrOESs8hWGwM
         02wH10m8crN3JL8kcXfZcFknUAYaK0eXKTvci1HyrX45bOwibjZHRbnKmUYEvTGt7DI5
         TwfxDE6h75mQAFosbIHg+AVyXtEDse7QaXsMWUJV6BrU7q4ns7ffOYxc0IkfMRx6NZxY
         78ppNNQTCEhTJJa6JY61n4JYthT0+CoL1w+Cd4FE1wGNtWXFeS5UP8mnhz1i9QYQzMn0
         8OxfIUSfAj8dlPSfxJkN2XG+onbjJMfhzPUnlgVbOey78dqtpmu7iVc0K/KXmrbrdjHJ
         9s5A==
X-Gm-Message-State: APjAAAUjUEWY20AcaLYBuaqdVpLVDNb9x1MSx8F5X9/v+Eef+ffzU4z0
        6yXc1vCra9Ml/PWRZwj5d6/uj6HV
X-Google-Smtp-Source: APXvYqw37Yl+OJvyHeQCjkpKB57wlb+8t1Igv6CyhuOjhC+4QP9VjjhZxbbwzeyWhmg1GJpHRz5cTg==
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr47757459ljk.51.1578098230268;
        Fri, 03 Jan 2020 16:37:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id p26sm25418791lfh.64.2020.01.03.16.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2020 16:37:09 -0800 (PST)
Subject: Re: [PATCH v1] ASoC: rt5640: Fix NULL dereference on module unload
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <bardliao@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20191229150454.2127-1-digetx@gmail.com>
 <20191231001719.GC3897@sirena.org.uk>
 <03ccf221-697e-bc34-f4ba-bf191aecd675@gmail.com>
 <20200103005424.GF3897@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <059becd2-4a91-23b3-59e1-0c4b0f3c0844@gmail.com>
Date:   Sat, 4 Jan 2020 03:37:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200103005424.GF3897@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.01.2020 03:54, Mark Brown пишет:
> On Thu, Jan 02, 2020 at 06:57:14PM +0300, Dmitry Osipenko wrote:
>> 31.12.2019 03:17, Mark Brown пишет:
> 
>>> Please think hard before including complete backtraces in upstream
>>> reports, they are very large and contain almost no useful information
>>> relative to their size so often obscure the relevant content in your
>>> message. If part of the backtrace is usefully illustrative then it's
>>> usually better to pull out the relevant sections.
> 
>> Yeah, perhaps it's not really useful to have backtrace in the commit's
>> description for the case of this patch in particular. But in general it
>> is very useful to have backtraces somewhere near the patch such that
>> online search engines, like google, could pick it up. I'll move the
>> backtrace below --- in v2, thanks.
> 
> Right, this is more directed at just pasting in the entire
> backtrace (which can be huge with lots of generic bits before the
> small number that are relevant) but some edited highlights can
> definitely be helpful for search engines and for explaining the
> problem.  I'll modify what I'm saying there to clarify this.

Thank you for the clarification.
