Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55714BECA
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 18:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgA1Rmu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 12:42:50 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44431 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgA1Rmu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 12:42:50 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so15566082ljj.11
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2020 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hJoKIthAQFgZ7VR2m6M6xS8oQ/leqVcDe3VXNddw08E=;
        b=Tpgv1oHC5fsFg38MGKhsMLe2NCpsEnmpQIhN8yMYDthBd1rlr4s7CzBSetMdZpdTCo
         oouNzsNas9HCdMpmfquipE7uaqZg+8zFXJYv0cAqpDxOuTsq5IkpUCTJ1D8oMvyBrqri
         x6T26ghLW7GgXqsD/zCx9q1rvA2DbVGx7L9qiRnG4E6lkdq1Glytx8VAzs/A1pAl2dLw
         pjg2rw1nTOdrqNHPYAvyiFoCO45A/QFvfxFKX3GrsOh7doA0nu50l27nVR10vvwf+Woz
         ouxslrwu0RuGfS/TjlvCWmbC/FhJeX9d834GZ3Ys9Vm8XTK24PLTDoPXM0Vh2e54debO
         C+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hJoKIthAQFgZ7VR2m6M6xS8oQ/leqVcDe3VXNddw08E=;
        b=Yl/ZiC2b9mX2dB/S2SkoYiiCaVvfsS8TCtcA1Tm821MoxTcVgbp8fgsIErme4br8jG
         iJItOkZ6d5AUDBKZBx1cjWjBAv9SPwNBZYrrIadXn2hPGQERumYLYehW6jSW13cY0SvP
         6rUkEJaybep34ZrOO9SMCv1CbFhRzqY/RouGH2LpG67V8OobDbNUjUaEYQCYkY9aQpdP
         ZmBMbhoJxwNSi3azQ/9cBDLD9PuvcpDleKkoB8sYj6tKUHlJsXWfRIdnqf4IJqk3pyu3
         3C4yj9v624jPJIoU6MFv3yqfhPIGT85O6d288h7/A9q2SfWgHLGlRYco1DX9ygSAuxM2
         tuug==
X-Gm-Message-State: APjAAAXqnSTOu7WWZ0g8Hb0m/hHRieaQiUl5LZ8Odd7DF3jxqlXi5qok
        9d3S8Vn9O+fjb9SO0AFOgXmgZJ4p
X-Google-Smtp-Source: APXvYqyu2ANQ51DyRAxl3hdd6sedoyacUos5bCBdEnZzcwVoSWTByw15S6I7Z2+SlhHytv14NvEF8Q==
X-Received: by 2002:a2e:7c08:: with SMTP id x8mr13801161ljc.185.1580233367895;
        Tue, 28 Jan 2020 09:42:47 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id f29sm4724370ljo.76.2020.01.28.09.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 09:42:47 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Mark Brown <broonie@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
Date:   Tue, 28 Jan 2020 20:42:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200128121315.GD4689@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2020 15:13, Mark Brown пишет:
> On Mon, Jan 27, 2020 at 10:20:25PM +0300, Dmitry Osipenko wrote:
>> 24.01.2020 19:50, Jon Hunter пишет:
> 
>>>                 .rates = SNDRV_PCM_RATE_8000_96000,
>>>                 .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>> -                          SNDRV_PCM_FMTBIT_S24_LE |
>>> +                          SNDRV_PCM_FMTBIT_S24_3LE |
> 
>> It should solve the problem in my particular case, but I'm not sure that
>> the solution is correct.
> 
> If the format implemented by the driver is S24_3LE the driver should
> advertise S24_3LE.

It should be S24_LE, but seems we still don't know for sure.

>> The v5.5 kernel is released now with the broken audio and apparently
>> getting 24bit to work won't be trivial (if possible at all). Ben, could
>> you please send a patch to fix v5.5 by removing the S24 support
>> advertisement from the driver?
> 
> Why is that the best fix rather than just advertising the format
> implemented by the driver?

The currently supported format that is known to work well is S16_LE.

I'm suggesting to drop the S24_LE and S32_LE that were added by the
applied patches simply because this series wasn't tested properly before
it was sent out and turned out that it doesn't work well.

> I really don't understand why this is all taking so long, this thread
> just seems to be going round in interminable circles long after it
> looked like the issue was understood.  I have to admit I've not read
> every single message in the thread but it's difficult to see why it
> doesn't seem to be making any progress.

Ben was trying to make a fix for the introduced problem, but it's not
easy as we see now.

Perhaps the best solution should be to revert all of the three applied
patches and try again later on, once all current problems will be resolved.
