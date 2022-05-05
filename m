Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F29A51BB15
	for <lists+linux-tegra@lfdr.de>; Thu,  5 May 2022 10:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346800AbiEEI6Z (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 May 2022 04:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239748AbiEEI6Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 04:58:24 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B989C4AE08
        for <linux-tegra@vger.kernel.org>; Thu,  5 May 2022 01:54:44 -0700 (PDT)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9E167240011;
        Thu,  5 May 2022 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651740883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kj3YlCjZMvArMJaP6966bgZkOlV2DXn+GS4eOfKGNB4=;
        b=gk5w3+eE9Ar1lTChNnBMc/c3dusihT0nb6P/J2RJo1wtdpe9INd1jVfjkOMFZTH4+nV1CI
        dawvUSBQzl01kMLsShijKJnWjriCsdsur7dQV0zq5Ydl8f5YfMioIL+iAvyBwEEtqBXIyL
        l0j6NT0y61D3a8H/bYfk78X/3Nl+y2hVURbCZIPJma+YDAUlfszA/idPE/kEF+kLPKqyi2
        NIFMPRf0COx4cUSojSbc+C2HsoQurw4RWT1Ss6jt6kb1oKhDu65No8yNu0wXV2fQZhud5n
        F/a9i8BZBgaJ5pbf3q3SvxsFoBZaRSuXU1KVEk40wrbJL84yNn2dN6nhbVvatQ==
Date:   Thu, 5 May 2022 10:54:39 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     linux-tegra@vger.kernel.org
Cc:     thierry.reding@gmail.com, dmitry.osipenko@collabora.com,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: Tegra20 parallel video capture driver
Message-ID: <20220505105439.107b6fca@melee>
In-Reply-To: <20220429184931.69591698@melee>
References: <20220429184931.69591698@melee>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

Il giorno Fri, 29 Apr 2022 18:49:31 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> ha scritto:

> Hello,
> 
> I am working to implement a driver for the Tegra20 camera
> interface (VI) and have it merged in mainline Linux. I have already
> done part of the work, but now I'm facing some difficulties,
> especially with respect to interaction with the syncpt feature of
> host1x. I have a few questions that hopefully someone here can reply
> to, but first let me lay some background.
> 
> First, the good news.
> 
> A good thing is I have an old reference image using a vendor kernel
> based on 3.1 which works and I can capture video from a parallel smart
> sensor in YUV. This is on a custom hardware.
> 
> Second, there is a (staging) video capture driver in mainline [0], but
> the huge delta between 3.1 and mainline makes the two drivers not
> trivial to compare.
> 
> Now to the bad news.
> 
> First, that the mainline driver only implements CSI input for
> tegra210 and I only have a parallel camera and a tegra20. The
> tegra20 documentation I have does not document parallel parallel video
> at all.
> 
> Second, the VI is heavily based on the host1x peripheral, and
> especially the Synchronization Point (syncpt) feature. Syncpts are
> also barely documented and I don't have any previous experience with
> this kind of device. And the syncpt (and perhaps host1x too)
> implementation in the vendor kernel vs mainline is very different.
> 
> And here's my status.
> 
> The mainline staging driver is already structured to support different
> SoCs, so I added tegra20 there, initially as a copy of tegra210. I did
> the same to add VIP (parallel input) support in addition to CSI. Then
> I filled the gaps as far as I could and now I have register access in
> the mainline driver that produces pretty much the same writes as the
> vendor kernel does, but it does so using the same driver structure
> that is in mainline, quite cleanly.
> 
> Now I am stuck at trying to understand how to make syncpt code work.
> As said the syncpt APIs are very different from what I see in the old
> vendor kernel. Thus I cannot try to do make the mainline driver behave
> like the old one. Moreover the mainline driver does many more calls to
> syncpt code than the old one does.
> 
> And finally here are some questions.
> 
> 1. Is there any good documentation on host1x, especially syncpt?
> 
> 2. Is the VIP (parallel input) section of VI (video capture) for
>    Tegra20 documented anywhere?
> 
> 3. The old driver accesses the syncpt using fixed IDs from #defines
> (15 for VI, 16 for CSI), while the mainline driver uses IDs obtained
> at runtime from host1x_syncpt_request(). Is it correct that one can
> use any of the 32 available syncpts, and the old driver using fixed
>    values is just an implementation choice?
> 
> 4. I am currently working on a version of
> tegra_channel_capture_frame() [1] for tegra20 VIP and other code
> involving syncpt. The mainline driver calls many different
> host1x_syncpt_*() functions, while the old driver does call very few
> of them. Can anybody clarify the meaning of the various syncpt calls?
> 
> 5. In tegra_channel_capture_frame() the call to host1x_syncpt_wait()
>    always returns -EAGAIN. Where would you start to investigate the
>    reason of this timeout?
> 
> I think it is enough for today, thank you in advance for any feedback!
> 
> [0]
> https://elixir.bootlin.com/linux/latest/source/drivers/staging/media/tegra-video
> 
> [1]
> https://elixir.bootlin.com/linux/v5.17.5/source/drivers/staging/media/tegra-video/tegra210.c#L325

Should it be any helpful, here is a reference to the old driver in the
vendor 3.1 branch that I am using as a reference:

https://github.com/SKIDATA/linux/blob/l4t-3.1.y/drivers/media/video/tegra_v4l2_camera.c

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
