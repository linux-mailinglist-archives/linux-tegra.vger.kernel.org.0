Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CE7215FA1
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jul 2020 21:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgGFTs0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jul 2020 15:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgGFTsZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jul 2020 15:48:25 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA97C061755
        for <linux-tegra@vger.kernel.org>; Mon,  6 Jul 2020 12:48:25 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a1so43961250ejg.12
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2020 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YiVQYTeR00kdkiAP00ba8sgK5Uq0NAd0zKABEWPojKM=;
        b=drNwUNLSjS7/isCIPlxoDaFF9fdK6tlGZ7Mr4te88Ikrk1HieK/EIS7AtAdCCsRb1J
         cAjkZdQdbGmVsHWcS/XR60Mtn+aTSK3qkc7HrXBbjgzdXuXHrkVp3GPfQXfDy2XXOZYX
         lV6bbhf22VeE2O8vOKXF1u8Hn41sllTs8ebfKKfMMLXGBrdvEsgSS04Ni9YZUh8hGAz+
         U5XkY6WSLnATCbq2a4IfPieg4bTC+r01W2NuoRwvfyGv114T/4ttf3DfzeWV8bLRL3x5
         4bI7cvbM/idZ17oxS2Nqp67UPrO4DAcFk5c21pgYbM8CK9t3qRd6XS2vgegIifVC9X/C
         OMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YiVQYTeR00kdkiAP00ba8sgK5Uq0NAd0zKABEWPojKM=;
        b=Lhs2+u+CjcfBMae2BbduR4kIJMGRYPIZwSkvsn0SfXhyGzdl4zpW1AZK+OwTUikt6F
         SCRsg62A/xVG9RsZkyjtvvmt94qmU6z3cCcfRLpyVSXDjeuJtN3smqV3VMgiuDgrw8dO
         Z94UqhovT+lJrI7NVUC1v3GfA+hiP25rJL9jAGpiKGeMk3xhasBEKghU/6XCyauC74mw
         kGEF5AfHCdZKjv8+b32IdgJQYqiNwxoIWA/zVBxa0SWBV9JkObB5/9b37nBCk1hNQhsU
         8TJIAmExW+wwwV5X+8hXQMwsLqHtfF3Aisa+h28oKJIK7jmZ87dmYiwx0iBSvGD21eXm
         TcOw==
X-Gm-Message-State: AOAM531M1JF/gPENUQEQrsQs7eXxq0FFci7w0vCItEOJs9oIk8BlF6rL
        EDJxf2UdIXN1WBcexKVw/ZwFptJ7+Sc27UcUlUg=
X-Google-Smtp-Source: ABdhPJxxVfbxxeFXHDDyP5rrbkxp/8VCaOqFk4Gwu2I37GoUkoHnka9AXLRRr3c0BPKkmwyZQUybBppljiZtShK/wZM=
X-Received: by 2002:a17:906:fac3:: with SMTP id lu3mr38129383ejb.374.1594064904257;
 Mon, 06 Jul 2020 12:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
 <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
In-Reply-To: <dda406a7-8199-f2ad-b64a-35791aa1033b@wwwdotorg.org>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 6 Jul 2020 15:48:12 -0400
Message-ID: <CAMdYzYpkg9SqcJyDMA0rm9kp-1whT2KQ7+YoebwDHCQpZy2hiA@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org, Simon Glass <sjg@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 6, 2020 at 1:04 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
>
> On 7/3/20 6:32 AM, Peter Geis wrote:
> > Good Morning,
> >
> > I am attempting to expand on the work for chainloading U-Boot on the
> > nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> > I have so far been unsuccessful at getting any output from U-Boot
> > through this method.
>
> I assume that fastboot executes the loaded code on the main CPU not on
> the boot CPU (AVP). U-Boot SPL on Tegra30 expects to start running on
> the AVP though; you would have to disable SPL to make this all work, and
> perhaps fix U-Boot to work without SPL present. I'm not sure what, if
> any, changes would be required to support that.
>
> For background, see:
> https://http.download.nvidia.com/tegra-public-appnotes/index.html

Apologies for the resend, I realized I didn't reply to the list.

I admit I'm still extremely new to U-Boot, but this is the way I
understand the boot flow.
ROM does extremely low level init, then loads U-boot SPL.
U-Boot SPL does basic init, ram, cpu and required peripherals, then
loads U-Boot.bin.
U-Boot.bin is U-Boot proper, with the full interface.

By loading U-Boot.bin as the nyan instructions indicated, I'm
bypassing the SPL code as if it was already complete.
The issue I have is I'm not sure what modifications were done to the
T124 code to allow nyan to do this.
I've compared the nyan configs to the cardhu configs and I don't see
anything that sticks out to me.
I've also dug through the nyan git log and I don't see anything that
was specifically changed to allow chainloading on T124.

I also am unsure of where fastboot is loading the kernel in order to
set the text base correctly.
