Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7458721487F
	for <lists+linux-tegra@lfdr.de>; Sat,  4 Jul 2020 21:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDTxO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 4 Jul 2020 15:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGDTxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Jul 2020 15:53:13 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EA7C061794
        for <linux-tegra@vger.kernel.org>; Sat,  4 Jul 2020 12:53:13 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 95so18260318otw.10
        for <linux-tegra@vger.kernel.org>; Sat, 04 Jul 2020 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V6q05LE5Or16Ss3HHXDjEXqLBa/QiAddaBTVLYaa0Fw=;
        b=UPoSQOtNbxrciTv8rJD27C5ruAJZhQNb5IPuGFCg+rOBp9Vnxb4r1lqzoXjhP//3O3
         Lp8j0CNA1i78ZQxPIG4flQBGMgT+YzTzxJCfBnnoXziZ0anVFYjoSmg72ZK69CyKC8Sr
         XfF00pAde8WyNg3nnvnqYAYbit9W9oTR6tIxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V6q05LE5Or16Ss3HHXDjEXqLBa/QiAddaBTVLYaa0Fw=;
        b=CNIH+bnu5JEM5SVwCALaHEc1kAb7DwWDMKI278O8aSRe+eozUX7pl06lV9firhgLd2
         SzM6dkip+lH+1kKjfkvZ1OaKcofqgkT5ZcnfIXBU1IFbaetsYb/DnMnK0hmaHNQN6yV5
         B/uWiai7dxTL0AHBF+UH6uCSUpjAutI1/ByajC6NpI9kPOLnY2RdZ4Yw32f2mvqke3qK
         pjA6tGpMDbSide8vWqQ0NTLVzc7TzLCjE9PJ62u3WQvI8rsJxjwI/eepFOZI48VxNUGI
         b0prIPQqbp2ozKvYWG9ZpW9+kInMuzqpOFdEuXsBUdc46BXQfs396nlD8IIKmnAn8Nmz
         ECXw==
X-Gm-Message-State: AOAM531DoIQ6MdJR2eTNLUhN8/wr+Zt7mPdPld55eCOz0mxhzQCc7CN/
        ufQxhnhf3whn9o71d7fKZUulAtYsXsUULGqpL6Cszg==
X-Google-Smtp-Source: ABdhPJyvZ8Miw3kSFUIYYq4jlYsBIh2prdkbOD6HRdPr9Vj2yIwsRJYGXqzhYkmSEqEPGJPPOn1g1fX8TWt8UUGzzos=
X-Received: by 2002:a9d:1e9:: with SMTP id e96mr14319746ote.48.1593892391923;
 Sat, 04 Jul 2020 12:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
In-Reply-To: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
From:   Simon Glass <sjg@chromium.org>
Date:   Sat, 4 Jul 2020 13:53:00 -0600
Message-ID: <CAPnjgZ2NxmsXUSNQtaLFxp3Qnx2O1ZqtQGQ5-9-z6vbb8ykW0g@mail.gmail.com>
Subject: Re: Chainloading U-Boot from Fastboot on Tegra30
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org,
        Stephen Warren <swarren@wwwdotorg.org>,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Peter,

On Fri, 3 Jul 2020 at 06:33, Peter Geis <pgwipeout@gmail.com> wrote:
>
> Good Morning,
>
> I am attempting to expand on the work for chainloading U-Boot on the
> nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
> I have so far been unsuccessful at getting any output from U-Boot
> through this method.
>
> I'm building the cardhu board with tweaks for Ouya's specifications
> similar to my work for the linux kernel.
> I build the image using mkbootimg --kernel u-boot.bin --ramdisk
> /dev/null --output u-boot-android.bin.
> I then fastboot boot u-boot-android.bin.
>
> I've tried tweaking the text base and tried both standard debug and
> low level debug.
>
> Do you think you could give me some insight into where I'm going wrong?

Is it possible that fastboot expects a relocatable image? If you set
up the debug UART very early you might be able to output a character
in start.S ?

BTW does U-Boot have support for the fastboot protocol? Perhaps you
could just use U-Boot?

Regards,
Simon
