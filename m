Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11DB8130577
	for <lists+linux-tegra@lfdr.de>; Sun,  5 Jan 2020 02:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgAEBsn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 4 Jan 2020 20:48:43 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43867 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgAEBsn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Jan 2020 20:48:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so47443316ljm.10
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jan 2020 17:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YYag+Bc8AuQ7klC6LwKp3Hqd/h8+XJbeqg437KyxSlA=;
        b=u8C5/gnQacpAqtDL/CmqTIYYzjgQHBG0/50u/4qrhiaFI6jaqtiZim+Cm8sK6HtLYn
         cx6aggoW001ADqCIW1ikAc3NdzHazWvQkCiI1W+FjL0kSmQDpwChCekTYrZpEqCivhz1
         +stTvqeCxVdwRi/QdJJiSw1YwPQprgTL1zbIewtrJDU9VUOlFtlqLCVhe1zGXCON3pEI
         Ufr2CZ7/yeqohf/PVG2yrzCKD5lWl04tWqDkUzQx4+qSLu8fCrM/H1QYPDIT6LcIGKT6
         XwLonkvX2jonmgz49vG+TOiLCMIMML+0orlspr8sQJIcvV2wdvFRo5naJuWg/L+37tqn
         voSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YYag+Bc8AuQ7klC6LwKp3Hqd/h8+XJbeqg437KyxSlA=;
        b=h+ry1bEtApi/243ts919h8X9ys6qKiKg6U+mj7xnpeiA3E88lW/WFvnFAhLrRy2L6l
         DA8wJzPbiHZ+hvf5fnODwDx1l6wwspH6IC6qzvHGpzVqjfPYl9kypn22EQXc9VHMlRpV
         X64scWLZMtHLn5kHp2sDuo8PYMehcVelSz/ilA1nB+rimYprWzQtbpSi0j1nQlvX/vlw
         78s7EYQww0zYuEhT5n3dyiSHZCqk1dADgPNo9oAZaz6qAcYW+Y+YRcYOQb6wjlh3g6XD
         qJVYUJp+9AbQ+OOKb0cVCO76cHRB2ibImcsp6W7pa2NuuODSeOursfQw0Ox+yB+a/67z
         noeA==
X-Gm-Message-State: APjAAAWTUmlpCoexY7WZnFt9grPuBKkBKtSuwOV7brdsfx+hDNXTC6jK
        sxxQgQ+siS/xs4CrAyXJ0ug=
X-Google-Smtp-Source: APXvYqzc/NcJedpT9MyHDjIJJxCle4dtSZ4sBeS25vT4lpq+Siy29EZNy3T13RozFRPJ8GprmHgUaA==
X-Received: by 2002:a2e:5304:: with SMTP id h4mr58319418ljb.75.1578188921055;
        Sat, 04 Jan 2020 17:48:41 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t27sm27192468ljd.26.2020.01.04.17.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2020 17:48:40 -0800 (PST)
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-kernel@lists.codethink.co.uk,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
Date:   Sun, 5 Jan 2020 04:48:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.01.2020 03:04, Ben Dooks пишет:
> [snip]
> 
> I've just gone through testing.
> 
> Some simple data tests show 16 and 32-bits work.
> 
> The 24 bit case seems to be weird, it looks like the 24-bit expects
> 24 bit samples in 32 bit words. I can't see any packing options to
> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
> (which is a shame)
> 
> My preference is to remove the 24-bit support and keep the 32 bit in.
> 

Interesting.. Jon, could you please confirm that 24bit format isn't
usable on T30?
