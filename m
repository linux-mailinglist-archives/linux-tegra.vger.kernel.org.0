Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106171A4755
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Apr 2020 16:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgDJOZK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Apr 2020 10:25:10 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46823 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgDJOZJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Apr 2020 10:25:09 -0400
Received: by mail-lj1-f196.google.com with SMTP id r7so2077112ljg.13;
        Fri, 10 Apr 2020 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ehD8KhbGw8RBYjKOC/7NdBUZTspDLoiPEM0cA7IzLg=;
        b=HVedsMouIpPMOaSrnhVBKi63szMGWlLxEa27tg43u0relHpAyYMi3dWhY1RHA8BDbb
         UZon6lQA99NPZtftBD02/JjDqZljY9DZAyM4jWOPdRxXkHmighbUucl0ny+7C9X8VJZ7
         tHxmfEYjdP2DjIXpRuYsLqto3FUkzwYjUvGroWFmgijlXbX0Gwp+WmWCz2nL1kUEGTBS
         wGdnRCkmLa2L10aid/ixr9N71D3OyiImoS9xn84fFOHGOiP8qx2JKiRgu44gTuYwD6+b
         JCjq+5Ys//9sf1zrnIrDA2p0JGLauesr5rKKg0ocyX0nRAnZh1rjGlVzMS2Ttm4K/rbw
         wvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ehD8KhbGw8RBYjKOC/7NdBUZTspDLoiPEM0cA7IzLg=;
        b=phY6UFSkpop5szVd79v6aEuhpJm94VZK89mQWyEf9oqmyDCXDevOLdwgLxAA7IAlhE
         ulHc+JcQdU4RoRPn4b76nLYyfbrluArWrappp9892jxjphnUGwHpeO513V4MsDZXw/CH
         gQ8mVhwdxU69Oit8qLw9Fj4GY1Gmi/WRakINin3ktWC3BtS+GWU4FfxQ9ui705dzz6kH
         mOXsSpVxFwyND9+Z5PIHRn2QSjjJp//Ngi1dooW+jiploNRmzzgCGJGPBTGB2ezkRBq8
         99zKXdxJQABJhQaeIIWikWw2zjl0s4VFxeZMA1NOD1X00lxMFVlBdlgh6DiFS/W5zFjQ
         qCoQ==
X-Gm-Message-State: AGi0Pub6/pCiYfHAApnhDtAuN1gaIKh9Qtepkf6+tACuPB0xM8hsm+pC
        UL3XKQG/ba/LZ2jjQdv39T4=
X-Google-Smtp-Source: APiQypIswk2UCbpggVuwhy5A//01Aw69rwyJgIWFTzqJMd7aT0+hrS4oHybBAqFTMhBEThRNArHOWg==
X-Received: by 2002:a2e:9c8:: with SMTP id 191mr3043405ljj.259.1586528707812;
        Fri, 10 Apr 2020 07:25:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c203sm1378946lfd.38.2020.04.10.07.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 07:25:07 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e015e35b-3f82-56e1-2d86-ebc467eb92f7@gmail.com>
Date:   Fri, 10 Apr 2020 17:25:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static int tegra210_emc_remove(struct platform_device *pdev)
> +{
> +	struct tegra210_emc *emc = platform_get_drvdata(pdev);
> +
> +	debugfs_remove_recursive(emc->debugfs.root);
> +	tegra210_clk_emc_detach(emc->clk);

It's great that you want to make this driver modular, but I don't think
that it's a good idea to suddenly rip off the EMC clock from the users.

It should be better to simply disallow unloading of this driver once
it's loaded.
