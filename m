Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79FCC5D249
	for <lists+linux-tegra@lfdr.de>; Tue,  2 Jul 2019 17:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfGBPDB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 2 Jul 2019 11:03:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40931 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfGBPDB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Jul 2019 11:03:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id a21so17223090ljh.7
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jul 2019 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=N4YjsFV9crE16P/whir3LLsiCLSACcNeCH21Ew4SWXw=;
        b=qN5ne6hQAT1xscrfrUiTTlfixayyjQ9wWLZgGDVNWADVMJC6x1Z7RCuqqtzDRZZBNL
         UPDDkbKcY8asgM6NdhydTqCvSaEq4rDRi4TIw2MKw/5anB/QKcKMs39YHb6YzYRb89ap
         87a9sF2wKHiTsa0mFz2EaG4g0FWo7E7jN+QlxjrCy7MEZX2qiEQpQwUPzvcMa5ORb65z
         dJKm7flLSSygUFdFir7cxGPfPLC2lfZCjyYwQnnlBR5ubqBra8516Q+21mvtXQABKK5f
         POUIWWSuTMdSihMrgfTNVl5k1V2L+DRJo9TqAZZyvbZHXYi5Ibor6yrWtKyqYIGo05vI
         1FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=N4YjsFV9crE16P/whir3LLsiCLSACcNeCH21Ew4SWXw=;
        b=ocBjO2GJdBT27TZSpNyfuHbEwDEmm+HilMy18QNPNZT8GT1GZbHYb10yq291XMmPGv
         z9AN21NpQHzssKuVGEXLVasdJAleo2b1JaekGZ0UOFV2b/M2ODXW+xEeB/sPpB2GRIGj
         g3lJJxgAWvIvgUq/wRf1e12hBuAnpp0nxZyN+XT6Qdh9MV0pmjabVcEQ2h9KTxwTwtKy
         XjZ5bTDtSYuOiL9XPFiW1/GWGEU8fzJRtVtROqSUFv5oeRQ2rPXLH28DSD2+5WwZsknP
         Uwmq17Km9ObljMRZloPdPzgR2wq4PFrjnPZt8Rx5PAoCmVwZQPOGOyNEz9JBUH9gOQ+x
         GaHw==
X-Gm-Message-State: APjAAAXdeHRrF1KwRO4HFaMKgqbu0AII1s7Ng7hk5D0xOj58i1ivkWML
        CBVtoKwgzgllt1q+F8x75OXMeGcU4mBO9znDp733TcXmxTo=
X-Google-Smtp-Source: APXvYqycPyA7FLUElGp5sZGrpUT6refgiORITWHXYzF6OK4/fvpzuy6pjjzwrBmUB/O2l2nW4ZLFmV5ryqqpXZuqUs8=
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr17452620lje.7.1562079779070;
 Tue, 02 Jul 2019 08:02:59 -0700 (PDT)
MIME-Version: 1.0
From:   Aaron Kling <webgeek1234@gmail.com>
Date:   Tue, 2 Jul 2019 10:02:44 -0500
Message-ID: <CALHNRZ8F1++RK_VgnvfGTBkPLSAK24r4o2epY0x_ok2UgsqOQg@mail.gmail.com>
Subject: Fbdev onTegra 4
To:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All,

I am a developer for the LineageOS Android Project, mainly for the
Nvidia Shield devices, but more generally for all Tegra devices from
t114 up. I've been working on transitioning to using
android-mainline-tracking for roth (Shield Portable) and dalmore (11
inch developer tablet variant), but am having troubles with fbdev, it
won't display anything at all. Android recoveries use fbdev for
display. But fbdev has been broken on at least these devices, if not
all t114 since 4.0. I was in contact with Alexandre Corbout when he
was working on Linux for the Portable. He had to revert a commit [1]
to make fbdev work on kernel version 4.0, and never got around to
figuring out what the real problem was. Fbcon and grate both work as
expected, it's only fbdev with issues. Can anyone shed light on what
the issue might be and how to fix it?

Thanks,
Aaron Kling

[1] https://github.com/linux-shield/kernel/commit/27b6232fbd38419cde0f89ef37f9eead8fbb915b
