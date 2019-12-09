Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D5E11776D
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 21:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLIUcE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 15:32:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33536 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfLIUcE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 15:32:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id 21so17247315ljr.0;
        Mon, 09 Dec 2019 12:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7izI5yySW8HJDMLC7WRv/sy3ibH99uzphJXtJkJddJQ=;
        b=XnoB37SZ0a/YxpyqAi9dQGwkTb0afAZoZxp1yOZoPehpJzvD0R8gCMMhe3Fl24vHgF
         UOcSqopMJwFKgkiAL6lSqyUShBFC3Ux4Q+ZjsAW9dEyeiurg1bY+1jf2AgNE8hIVosZy
         BunkJgj/TaQvjFwcpiKmchdtn88nYXylH01axcN+lAmU7onGGYXAklcwQWjmKXmFnZqj
         eIiE4bwUxWeFgCimel2+Iu0VH3rKcgg8RegRyu8FpaPV/ptkIu+Y00kCC/xU2C7Q2kbI
         bybns2WZRfdVw6aReHfKMrw8Bn82yY86eRLYRaEqiaCf0aXiLQUU8E3Oqdmhp92qwWOj
         K7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7izI5yySW8HJDMLC7WRv/sy3ibH99uzphJXtJkJddJQ=;
        b=Uq8nKqO1a7OmwNK0DSxoEeVNVa1xvMoiZy6Pf/N611TV/Pzd22fXvf4eCOvDLS9HjJ
         cXXnR1Ly0n7Pp7lCeZfeleQAUNu1DyPFqSCX8UAN6yrSMl/ODc2W1EFd5VKmDjJtFhWv
         q+ic92m/kXl1qEKMVgLmhswwiubJsqPqgRLVPVs7xweCh4i+ZV5m8hZM6Mq+RzsTzo7T
         kGc26I2ET9/4OiWavOrUHtwzJFNFnpt8Udf6CxG97BuMnAOu9CUhUJNkgBEI2k0h0fzo
         eYwsNe7eig4jllqwyU1oUA8y14oeDuHldNZkfE85CLPLXbR3U3gx6i+cxLrDncsNzLDu
         Fkfg==
X-Gm-Message-State: APjAAAXLkwYNkZrDVV0hszdRvRlRdzJRraTmZd5Aduh6BPinDJYBueS2
        nSFVpzySL7UezXjpDSavXaE=
X-Google-Smtp-Source: APXvYqw6Z3Y4rpulNU8ccGeKOMeq0qRcIep/L2gJzf/UAE2VbwUX37q+bKKC5bmFhvBRfIijYPPyHQ==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr16426695ljk.249.1575923521486;
        Mon, 09 Dec 2019 12:32:01 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id z9sm475423ljm.40.2019.12.09.12.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2019 12:32:00 -0800 (PST)
Subject: Re: [PATCH v3 09/15] ASoC: tegra: Add fallback for audio mclk
To:     Mark Brown <broonie@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com,
        pgaikwad@nvidia.com, mturquette@baylibre.com,
        horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com,
        krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com,
        josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        alexios.zavras@intel.com, alsa-devel@alsa-project.org
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
Date:   Mon, 9 Dec 2019 23:31:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191209164027.GG5483@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.12.2019 19:40, Mark Brown пишет:
> On Thu, Dec 05, 2019 at 06:48:49PM -0800, Sowjanya Komatineni wrote:
>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
>> are moved to Tegra PMC driver with pmc as clock provider and using pmc
>> clock ids.
>>
>> New device tree uses clk_out_1 from pmc clock provider.
>>
>> So, this patch adds fallback to extern1 in case of retrieving mclk fails
>> to be backward compatible of new device tree with older kernels.
>>
>> Cc: stable@vger.kernel.org
> 
> Why would this need to be a stable fix?  Presumably people with stable
> kernels are using the old device tree anyway?
> 

Presumably, yes.

At least Rob Herring is asking to maintain backwards compatibility
because some ditros are using newer device-trees with stable kernels.
I'm personally also tending to use the newer DTB with older kernel
version whenever there is a need to check something using stable kernel.
Perhaps losing sound is not very important, but will be nicer if that
doesn't happen.
