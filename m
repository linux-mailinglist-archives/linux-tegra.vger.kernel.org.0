Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B374D213A20
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Jul 2020 14:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgGCMdL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Jul 2020 08:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgGCMdK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Jul 2020 08:33:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6562BC08C5C1
        for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2020 05:33:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l12so33995658ejn.10
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2020 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vO1JhBUVVjDbzs5o7D5U4bbhrQhWb6ACxIC98OLE58I=;
        b=UQ5CH4vaG/wouRT3lLGqhgyvCO0iGsFjZCXrR7Fx0Tk1fUZmxt8PXRRDMRxp2Re0AM
         R2mCRB3OiN6zQGjkoJZFMx+x3zXjo3pdr0ryUpNrQ9qJ7V4jEPROvlF0yQbc8uEBXmwe
         0t3RkorJmld1cG6ELBRU8kY4TPdwSvZw45Ct0Mk5UFP1ZU4kPPhxElh8NyiQbUrtzwcD
         eEu1+la+DADS74S2g3kE3iCMCM7VE7b6cFOom8PqbGuNwTy5Ki+T5FlUzGeiBVt66Gq/
         WLCuj3w7H3Wrjj4KJ7bFWjkVdbQajnXI3BiGtAZHKWAQ3tt4C+1qCqg0YYVg68SMLjqf
         ZG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vO1JhBUVVjDbzs5o7D5U4bbhrQhWb6ACxIC98OLE58I=;
        b=CyvkLabEasxWs41RNnk3BzXpm9rwWZ3V1KDuDTdhvee3HFjH3lsBqH5PkilNI1gddr
         2OlonLoSuchEN24VuSqZN4anFjXhA6Rqr8ETuYaYTSGfeCG1xijotU+Z6qjko4STeK2M
         7P1TU0OrRM/tlS0oZjLbHDYyOfxkyyd1qyHB2EvqIcP2bDKUSykNcUR+C/lFpYXxTezq
         57D1BbxrZWE1G/OD1wad4XMVQsC3zKmzNBtkQbCUoltsBK8COCNOcQ/kFav97V0Zt7D3
         mHLuodgZDKMIQoDGqzE9fQHBOGfRPuXp42tKxC46+WEQN9IxxG88qTJh0Wn+/qqGwwxV
         dUWA==
X-Gm-Message-State: AOAM532ueByh1PhdtnxJ4Y/58TGFH4Wfo1FVsgcZ7SuVBj2zQpKiY4K4
        CR7JagS4ETKJKH4KiZLBMh0GnYqNhCNIuuyzIac=
X-Google-Smtp-Source: ABdhPJz6gPLBwHzDmsOW6jumB7vAiI9CTJrAaOZTtKrqEk2kfMVMt87LAWkzQsp6mvJWMF1VFoVmyJ6JI/24vd5tX/k=
X-Received: by 2002:a17:907:2170:: with SMTP id rl16mr33646572ejb.422.1593779588838;
 Fri, 03 Jul 2020 05:33:08 -0700 (PDT)
MIME-Version: 1.0
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Fri, 3 Jul 2020 08:32:57 -0400
Message-ID: <CAMdYzYo1je6cjSEm4i0pbNYfq1L549--n_SZDq19Xy35_y4Kkw@mail.gmail.com>
Subject: Chainloading U-Boot from Fastboot on Tegra30
To:     U-Boot Mailing List <u-boot@lists.denx.de>,
        linux-tegra@vger.kernel.org
Cc:     Stephen Warren <swarren@wwwdotorg.org>, sjg@chromium.org,
        Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Good Morning,

I am attempting to expand on the work for chainloading U-Boot on the
nyan-big in order to chainload U-Boot on the Ouya Tegra30 device from fastboot.
I have so far been unsuccessful at getting any output from U-Boot
through this method.

I'm building the cardhu board with tweaks for Ouya's specifications
similar to my work for the linux kernel.
I build the image using mkbootimg --kernel u-boot.bin --ramdisk
/dev/null --output u-boot-android.bin.
I then fastboot boot u-boot-android.bin.

I've tried tweaking the text base and tried both standard debug and
low level debug.

Do you think you could give me some insight into where I'm going wrong?

Thank you,
Peter Geis
