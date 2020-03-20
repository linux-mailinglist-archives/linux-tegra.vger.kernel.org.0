Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E35718CFD8
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2020 15:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgCTOS2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Mar 2020 10:18:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45348 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCTOS2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Mar 2020 10:18:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id v4so985508lfo.12
        for <linux-tegra@vger.kernel.org>; Fri, 20 Mar 2020 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=chBLQap+SYKGNzmXvbmb0fKi1zu9d0mpFF2vjia6tcw=;
        b=rYopsrW6ZFC37xZcQOcJGUhPe4rKJbBymWCv2GsSPgbw6Ied2jFWyDidXBfoxhQnj/
         UKU1jHx/MFO+8W+xnDgYChSkdE75tKHwc9u80yFKiNibb4lRXSdUKIVTjGXLayxE4xxf
         CjvYGNqBI8O+Sqw4gDelB5iEw9S11oWZ/K7xtGGWnmaHnrwiwCMD/2hAzTIKpZAA4XoM
         XZ4PVoEWfilijfs+LFvpkRm0yBAyBV9KMUjnoil9+vWLXqYmDvDlTtf9VDSAeVv2XNGK
         2hztDnyBo3PFMNFng1YZGc7alJ3NeYJ2O4+l/x/QeyYjT0FCBiG6ebuTtBHxW1gpHr7V
         z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=chBLQap+SYKGNzmXvbmb0fKi1zu9d0mpFF2vjia6tcw=;
        b=EP4CJHJMfdhncMpB1/iG+yk3EvF4NZr7YqVvhNgsmoOoz3HbicnPcBIl+sJNouV3xV
         4Q5DEpOXGmTXJTxb1B01G8jM9hA7I5If+kX3Us48xQfIbf+1PL0oNlGcB9lEfQxGY9Kl
         pxlhI8uv8UfR6whKzYcyLjjcPYOMFqDBsRkIX58MINSDRuWf+JEXlSgA7SuXuPOjjfHZ
         tu1qtqv7TvPTxjdqbR2jwZ9I/0oB4mYFtEIe4VhV+Go7u55umLaJk/sfeOMe7OFLa552
         l9+avWhycKEEsOOC+LuGxktm0mpfRIunk3I0//ecvRj7uq6YLjoLYm48vb851QBJj6Cw
         8v8w==
X-Gm-Message-State: ANhLgQ0jBbJH8cea5jBlZCgyLfuoILt05DSOIdXJ0/AEgh3h11H0SVfJ
        tggsyNr7k+75z7eNUPuWKuWRhHcz
X-Google-Smtp-Source: ADFU+vsHb0FtO1zHy7j0zMSFIunLOXaJMhsTtAXAzU+h1Lch1pchWCJKq24Yu8lGWtxmhLFpren//w==
X-Received: by 2002:a19:c1d2:: with SMTP id r201mr5453386lff.13.1584713906485;
        Fri, 20 Mar 2020 07:18:26 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id u7sm3252010lfl.81.2020.03.20.07.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 07:18:25 -0700 (PDT)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Mark Brown <broonie@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
 <20200130131039.GC6682@sirena.org.uk>
 <1df9cc13ea636502ac09191523ff0669@codethink.co.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e28e72e7-c4c0-952a-29b7-fb49462708f1@gmail.com>
Date:   Fri, 20 Mar 2020 17:18:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1df9cc13ea636502ac09191523ff0669@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

19.03.2020 18:32, Ben Dooks пишет:
...
> Hmm, I may have accidentally deleted those.
> 
> I will look to see if I can re-form the series and re-send in the next
> couple of weeks. I've got no access currently to the machine and having
> to deal with working from home for the next month or so.

Great, looking forward to the new version :)
