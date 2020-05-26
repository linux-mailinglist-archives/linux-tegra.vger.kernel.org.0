Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368661C6FA9
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgEFLwA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 07:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726778AbgEFLv7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 07:51:59 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362CBC061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 04:51:58 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g12so2295837wmh.3
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2020 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=XBB+wIQ1zosOEyZvUXCM3lOhjUniZxLo8oqY31+qJpE=;
        b=E17m3b/g5zV4eYdkmltAKLSJ1i4A2fJqd/ngHggp+2V7nFIM8XkHPRivmN/+W3cpQe
         tZVuTJiGLPtSQPKaRYm3WHdquhC60DjHC7oyZ6sPj9oCXoWmayMiIwyCwF9PMpQbuzLs
         CqZFz4Km8f2kYkl5DCk/PStAaytK2uaI0jSwfc11bv+d9MrCRH3pAO6Jp6iKy0SM2gJ4
         YOaNhZbEoGTnboj5PPCUp7LfhoWtioG5DX1KLx7eVPPwt1Fp7axkek6HSyrxGIWSyVus
         hHopPI99mbqnVAJ+44ylzldfc9iqFzzIFHNirirt9gB7dGuq7H63BI1/4mdT6SIJt++3
         Hmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=XBB+wIQ1zosOEyZvUXCM3lOhjUniZxLo8oqY31+qJpE=;
        b=cHnSIhcszDKGD1hrBnHuZuVDlPv5cSR7agpXvt/I7+s3/hn+qMUEPLG3QBMwM2/3yV
         UE1aublZai0CV2DdyzPCBk7FeqJjH5uArpSyuPKEoLJIdCzXbVNbDglMWONFu+AT2p5s
         C51IGzolBwL9Igk7ZDMZgz9m49A+nLn4uwTfQY8EtTMF/OgLEee1IBas77q9QcivGEhg
         99piETVdLx0eNArejtJgoex29VuptCLS7tM1vI/aXFRwRbOZlEb3e3KTya9kC3iQg6uJ
         7HVZx+5eDYEaOPG/1BVfbJ42mHAQZWgQ3sqYGxjPQzUplycNiAFn4WdYK0420ekDKwpG
         WfFw==
X-Gm-Message-State: AGi0Puafy+AEPcQpmoqQ/+Uoi17Il1XTuCLEwNO7ENIAHzXejps8ClR4
        F9iPxG3Krn0sm8miKlYMuxlbmg==
X-Google-Smtp-Source: APiQypJYPcTh+DtH5BqedeYpWvgWCBS2f6MPqH4pLuBqKuAFbyeb/wh4FxRArj1tPcWJin+/LHBMSg==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr1482386wmu.77.1588765916800;
        Wed, 06 May 2020 04:51:56 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id w18sm2167174wrn.55.2020.05.06.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 04:51:56 -0700 (PDT)
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Cc:     nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
        swarren@nvidia.com, linux-kernel@vger.kernel.org,
        nwartikar@nvidia.com, lgirdwood@gmail.com, jonathanh@nvidia.com,
        viswanathl@nvidia.com, sharadg@nvidia.com,
        thierry.reding@gmail.com, atalambedu@nvidia.com,
        linux-tegra@vger.kernel.org, digetx@gmail.com,
        rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [RFC] DPCM for Tegra
In-reply-to: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
Date:   Wed, 06 May 2020 13:51:54 +0200
Message-ID: <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu 30 Apr 2020 at 14:41, Sameer Pujar <spujar@nvidia.com> wrote:

> At a high level Tegra Audio HW is depicted as below.
>
> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>
>                          *************
> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>                          *           *
> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>                          *    XBAR   *
> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>                          *           *
> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>                          *           *
>                          *           * <----DAI<4>-----> MIXER
>                          *           *
>                          *           * <----DAI<N>-----> ...
>                          *************
>

>
>
> Follow up queries
> =================
> Based on the above experience I do have few follow up queries and request
> for your inputs on this.
>
>  a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>     program required switch in XBAR.

My 2 cents:
DPCM should activate any BE which has:
* a valid DAPM path from the current FE
* a valid BE stream (ex: can handle the stream direction)

AFAIK, you can use any combination of DAPM elements to model your
components, including the XBAR. Then, it is the job of the card driver to
link the DAPM widgets of the different components together and bring the
system to life.

If your XBAR is widgets are not provided by a component which also
provides a dai_link in the sound card, you'll need to add the component
to the auxiliary device list of the card for the widget to be available
in the card.

>
>     This is needed for following reasons:
>
>     - For an open platform like Jetson, we want to give maximum flexibility
>       for a user to customize their audio paths. Number of connected
>       components and order of these can vary depending on a use case.
>
>     - Allow re-use of audio components across multiple use cases.
>       For example, number of SFC instances are lesser than PCM playback or
>       capture devices.
>
>  b) I have modelled SFC and MIXER as backends. Is this allowed?
>
>     This was done to include SFC or MIXER HW components as part of the
>     sound card and use like below in one of the audio use cases.
>  
>     ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
>     ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

What your are trying to achieve here is DAI chaining. From the DAPM
perspective, it is alright. Unfortunately this kind of chaining are
not supported (not yet, at least) from the dai_link perspective, even
with DPCM.


From the DPCM perspective, I think your patch does the following:

ADMAIF1(FE) ---> SFC(BE1)
            |--> I2S(BE2)
ADMAIF2(FE) ---> SFC(BE1)
            |--> I2S(BE2)

Your DAIs are not chained, but put in parallel. Maybe all your DAI
callbacks are called in a way that is convinient enough for your
use cases, but it is not what you intended.

For the example, the rate passed to 'I2S(BE2)' in hw_params() will
be the one provided by the 'ADMAIF', not the output rate of the 'SFC'.

>
>     I used following workaround to connect multiple BE components.
>     With this I can see PCM callbacks happen for all BE DAIs along the DAPM
>     path. The obective was to connect multiple components together and (a)
>     was used to connect one component to another. Each "-->" here connects
>     two components and it is a switch in XBAR. 
>
>     ---
>       sound/soc/soc-pcm.c | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>       diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>       index e256d43..ee7af55 100644
>       --- a/sound/soc/soc-pcm.c
>       +++ b/sound/soc/soc-pcm.c
>       @@ -1494,7 +1494,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
>  
>  	  /* get number of valid DAI paths and their widgets */
>  	  paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
>       -			dpcm_end_walk_at_be);
>       +			NULL);
>  
>  	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
>  			stream ? "capture" : "playback");
>     -- 
>
>  c) Hostless mode did NOT work:
>      - Following audio path was intended to be tested:
>        I2S1 --> SFC --> I2S2
>
>      - [3] offers two options:
>          * CODEC<->CODEC: If I were to use a separate DAI link for each BE to BE
>            connection, then it will result in a similar design what we have
>            currently.
>
>          * Hostless: I did not come across references for this.
>            (Any references in this regard will be helpful)
>
>
> May be the current Tegra ASoC design is more suitable for component model as you
> had previously mentioned. I wanted to understand if above, especially (a) and (b),
> are acceptable in this regard or if there are better options to interconnect
> multiple ASoC components.
>
> Looking forward for your feedback.
>
> Thanks,
> Sameer.
>
> References
> ==========
> [0] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=159664&archive=both&state=*
> [1] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar@nvidia.com/
> [2] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-4-git-send-email-spujar@nvidia.com/
> [3] https://www.kernel.org/doc/html/v5.6/sound/soc/dpcm.html

