Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B5A1C733F
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 16:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgEFOrN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 10:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729164AbgEFOrN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 May 2020 10:47:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202C8C061A10
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 07:47:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so2992401wmc.5
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2020 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=GCrHnOXne5LQYzx7qf0NksizLMHmLnAy47QVPvHQx6Y=;
        b=aQ8oRcJtVr1zvX95yYSbWP2oNTN5fvt0CC45Cl7XST4LmLLIUB0Z5rH+qEGbVSq8uN
         HrnvEE797zkZYYvYvQAxdEDEoWA6HB0AQHlI6Y2QsuJ4QFfIHzE40Qv/JrzKq7GRnkRO
         lTSt9sDho5oc0qjvX2JGIvh7fsU8XfakYdWizNHOJeahQZkyDfsaIn2FqBT0vMCiSCHG
         Z764PkLLvz1Zt4RrV2Sge3Oq7EhCEJ47VED4tH7CdYQtGLEQW1PisQAcIdHR8ayn4ZDo
         OEYvf6/dT8FRbonulUDI+aPa6PU9B4SNuzdva6MC75yTL6iHx4DRj4DeS4ALwIJ7vnZH
         A+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=GCrHnOXne5LQYzx7qf0NksizLMHmLnAy47QVPvHQx6Y=;
        b=mSQeGwVqBi6HSki3KdCBxn/w0k1FTpOWkj6BXtIyrN4Q6c26N2UZ2SL3QF7UktD6KL
         sy51hDsS7GWi8J+SkPioqBouO9KJbXVva7H8apIEgc8KuNfUs4i3+4vtZSC7S5Qkk5fG
         h/AOcwMPywl4K6ozZMBaTYkfeGsU8RnQ0Jcu1KKD+WHHIGedAKK3KFkBCJrXt+hp825c
         8+0Pznz5o5fligIzC8YFbYFZaUclpUgC3Q8u45YYxwdyE2XTBdcSCL21Qkf5Bt9rArna
         JoK5pmL1S+uIL4R/PbppKbmqhW39RtnywJUreEp9m3RBvl7OEbmU4U9H7Qv1LdN3xM+E
         VinA==
X-Gm-Message-State: AGi0Pubjm52TCeatemjU5GK54SHEhIY5HLeTb4ZX+yJbd7cAAVQaY3iH
        krhHH0+wx56qMZ7I0zcL4JJnu8ldceU=
X-Google-Smtp-Source: APiQypJUCJR76CQmyVGoW6s3CFc3WW+P6Hh7M9OerXMmN1I0H8y+YBedIb2KvnRIymXqkCvI/lNSlQ==
X-Received: by 2002:a1c:7f91:: with SMTP id a139mr4594836wmd.164.1588776431739;
        Wed, 06 May 2020 07:47:11 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id c19sm3185436wrb.89.2020.05.06.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 07:47:10 -0700 (PDT)
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com> <1jzhalffhh.fsf@starbuckisacylon.baylibre.com> <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
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
In-reply-to: <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
Date:   Wed, 06 May 2020 16:47:09 +0200
Message-ID: <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar@nvidia.com> wrote:

>>>
>>> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>>>
>>>                           *************
>>> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>>>                           *           *
>>> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>>>                           *    XBAR   *
>>> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>>>                           *           *
>>> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>>>                           *           *
>>>                           *           * <----DAI<4>-----> MIXER
>>>                           *           *
>>>                           *           * <----DAI<N>-----> ...
>>>                           *************
>>>
>>>
>>> Follow up queries
>>> =================
>>> Based on the above experience I do have few follow up queries and request
>>> for your inputs on this.
>>>
>>>   a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>>>      program required switch in XBAR.
>> My 2 cents:
>
>> DPCM should activate any BE which has:
>> * a valid DAPM path from the current FE
>> * a valid BE stream (ex: can handle the stream direction)
>
> Yes, this is taken care.
>>
>> AFAIK, you can use any combination of DAPM elements to model your
>> components, including the XBAR. Then, it is the job of the card driver to
>> link the DAPM widgets of the different components together and bring the
>> system to life.
>
> XBAR currently exports all routing widgets which can be used to
> interconnect multiple components and thus implements Mux widgets. Fixing
> the routing paths in driver would limit anyone to try a different
> combination as per the need, unless driver is modified.

I did not mean that you should restrict the routing ability of your SoC,
quite the opposite actually.

You should just expose it correctly

From the diagram above, each comp (ASMAIFs, BE even the XBAR) should
export AIF_IN/AIF_OUT widgets. Think of those as the interfaces of your
components.

The connections between those interfaces are fixed, the
represent what the HW is (IOW, the wires). They could possibly be
described in DT (audio-routing prop)

The XBAR should implement the N to M MUX and export all the necessary
kcontrols to act it. The routing magic happens in this component.
There is no limit to the flexibility this provides, unless you set one
;)

> Device tree (DT)
> can be one of the solutions here, but currently static paths can only be
> added AFAIK. Even if this is extended to include routes with Mux widgets,
> still it won't give the real flexibility.
> I cannot re-use a component for a
> different routing path, unless DT is modified again.

If you implement the XBAR capability in the comp, not a use case, there
is no reason to change it.

DT describes the HW, changing it to describe a use case means something
is wrong, usually.

>
> Hence a Mux widget with user space control could offer required
> flexibility.

Exactly, your XBAR comp should provide the widget(s) and related
kcontrol(s).

>>
>> If your XBAR is widgets are not provided by a component which also
>> provides a dai_link in the sound card, you'll need to add the component
>> to the auxiliary device list of the card for the widget to be available
>> in the card.
>
> I registered XBAR device as a component having a dummy DAI just to allow
> routing paths to be available

From you description, you XBAR should not have DAIs, just DAPM widgets
and kcontrols

> for the given sound card. Are you suggesting
> I can register XBAR as an auxiliary device so that all the routing paths
> are available?

Precisely.
I have been using the same method on Amlogic cards.

