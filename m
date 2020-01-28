Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA2E14BED6
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 18:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgA1RpQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 12:45:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38931 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgA1RpP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 12:45:15 -0500
Received: by mail-lj1-f193.google.com with SMTP id o11so15620370ljc.6
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2020 09:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=icILle18HVOYU+uj4/uNvBEQiUod1fP5bgB83wQWJnk=;
        b=tyRM2jJRNkoAJxaVoib7+S23mzDrbW7WsPPee7HvUcnnl0hiXgmLER8SlROe/QlR6J
         2+TRk8bvgmrE2VX08bGujTS2e1zNcWXH6I+1Tu1Is8KQJwpMTwnx+xCRHEbfn1nhPDqx
         jGseFjhe9JIen0SYm9WAPw1/BbptnRodHR783nrlnEI1Fu/1K4QYZyqvcxaQWhR0Pn11
         f8x28Ifsvexy0mIxRxvxmSPizllL8TCn8bi6INbMdWp5dc8ohIXXUUW6v2vbizmOeFrG
         Q+A9y69XXiqCrK8927L7XKpZr97uorA7/Sp0XnDOh8Wq54jyWALuseqex8B4UXWRxQq4
         m9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=icILle18HVOYU+uj4/uNvBEQiUod1fP5bgB83wQWJnk=;
        b=YWV+6fNYXctNQ9/ZP1wJ9OhIOVDELlmQNezEzH1X2mafJiyhLE+g92rMZFM3+RZfD8
         7wrux/ek903y0VEu7DBPcHdWqBA6r+55yt2S1IEub8GDbKaqdHhBXOzDWbL1O5toXOcv
         HER8aoDjt/eS5dpBRzSHteunY+PekQ0nCEQAd7yk7AhvC+Qz+83i8U0OscM/e3EBQPiJ
         s89yLN4Ubi6bRQtzWr0FVOyeJEdInicCcs397busI4Z3WoSf3hDGgRnElHBmP5PJeB3B
         309EiwQT+/U3r6iqelhgJ0HEwU/I1P4IB9N1AqVo8ytjVtI4CRasC3OIJGuHtm68z5dR
         pt+g==
X-Gm-Message-State: APjAAAWAEh4GpR/bcOB2Fsx30epiO4AjZeiucupmb/Gq9ivCfUcNxDuX
        Qnq8dEUK5iGDdP6ztY9a8GfqzwFr
X-Google-Smtp-Source: APXvYqz6tGItOVEzQ/02MHrmG4vWp62+B1xQn16Kd/IMfQjApCRvrnge+3eMOmx1l8H2wUO4buAm7Q==
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr8257219lja.131.1580233513348;
        Tue, 28 Jan 2020 09:45:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id c8sm10104395lfm.65.2020.01.28.09.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 09:45:12 -0800 (PST)
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        linux-tegra@vger.kernel.org
References: <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
 <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
 <20200128152632.GF4689@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9ed4d18-94f6-06e0-d7b7-cbbcbee058b0@gmail.com>
Date:   Tue, 28 Jan 2020 20:45:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200128152632.GF4689@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.01.2020 18:26, Mark Brown пишет:
> On Tue, Jan 28, 2020 at 01:19:17PM +0000, Jon Hunter wrote:
>> On 28/01/2020 08:59, Ben Dooks wrote:
>>> On 27/01/2020 19:23, Dmitry Osipenko wrote:
>>>> 27.01.2020 22:20, Dmitry Osipenko пишет:
>>>> I also suspect that s32 may need some extra patches and thus could be
>>>> worthwhile to stop advertising it as well.
> 
>>> As far as I am aware that works and we can hit the audio rates for it.
> 
>> I ran a test on Tegra124 Jetson-TK1 and 24-bit playback seems to work as
>> Ben has indicated. So I don't think it is broken.
> 
>> Can you try Ben's testcase on Tegra30 (ie. generate a tone using sox and
>> use aplay to play)?
> 
> Another test application that's quite useful for this sort of stuff is
> speaker-test, it generates audio data directly in arbatrary formats and
> it's part of alsa-utils so if you've got aplay and friends you may
> already have it already installed.

I tried speaker-test and it doesn't support S24_LE:

# speaker-test -h

speaker-test 1.1.9

Usage: speaker-test [OPTION]...
-h,--help       help
-D,--device     playback device
-r,--rate       stream rate in Hz
-c,--channels   count of channels in stream
-f,--frequency  sine wave frequency in Hz
-F,--format     sample format
-b,--buffer     ring buffer size in us
-p,--period     period size in us
-P,--nperiods   number of periods
-t,--test       pink=use pink noise, sine=use sine wave, wav=WAV file
-l,--nloops     specify number of loops to test, 0 = infinite
-s,--speaker    single speaker test. Values 1=Left, 2=right, etc
-w,--wavfile    Use the given WAV file as a test sound
-W,--wavdir     Specify the directory containing WAV files
-m,--chmap      Specify the channel map to override
-X,--force-frequency    force frequencies outside the 30-8000hz range
-S,--scale      Scale of generated test tones in percent (default=80)

Recognized sample formats are: S8 S16_LE S16_BE FLOAT_LE S24_3LE S24_3BE
S32_LE S32_BE
