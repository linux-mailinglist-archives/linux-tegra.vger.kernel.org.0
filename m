Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 704894D86F5
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Mar 2022 15:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiCNOdp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Mar 2022 10:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiCNOdo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Mar 2022 10:33:44 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E828932ED9
        for <linux-tegra@vger.kernel.org>; Mon, 14 Mar 2022 07:32:33 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2dc242a79beso165362847b3.8
        for <linux-tegra@vger.kernel.org>; Mon, 14 Mar 2022 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9RB3c+6E1iaZmcllyzPO9tW2v+xcuDh9lXJfmhX4wpM=;
        b=LeGuYouBKMGj9xSTMEyIMw/4kXhe3dVE85e4RbEfM3BfLpUnwXJLJIFBQ8ePacgEuu
         fN2lDYJCJu7NCqNSzTXX0RQtBvLEbsP329oD5r9GA8v1killY1BOD4MDcXPbJp/thFmw
         RFiB+Y/cn+AxJy9hE+2ouHB19GaID5B3TJ8r9VyDu6V50YzD3gg5hnVUTrpfFXdxCXLi
         X7hXzD5+0xceP+LfOR9MA4BTpUTqvtqsTMkIjP3s/0ycsbP2H2tpapMAYbK3B6pibv/O
         3Bgg7Wmh2XptJ/MK25iEo8GfS/t3PyTEu1KTRT7vjywDa1uT3KVZR1KCugfneSkHbQ7n
         MPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9RB3c+6E1iaZmcllyzPO9tW2v+xcuDh9lXJfmhX4wpM=;
        b=g1gfmJalIbW2aKvgc0f5JDPlyiS7DcrAT/L5Xps8Q/lwsyb2guaUHwwabuLDRy/LC9
         39ZpaGzBfoxC4+EsWpRuD0gFZ1X9RkY86g1tOVYq6ycE26mJq4zSimSReqX7E+nkoRWy
         drHQWHe96nEFmNNQ2hXFBub3FZmXfcNFEjzPSsQdZTrI9U9XKXEjEn7h9B7y9iMKLCwv
         5kfDO2b12dsj4lb+htwFlFIFksfiAceVUHMo6MFEIdgfufICFV5lcwKF6rDU8UfQTcD6
         gZQ9q4/1FU006TOykYmiFS1cnceJNWkzrLd7p65nOL6/6WZx7QKZLLfo6V9ZGIO7r11Y
         0EHg==
X-Gm-Message-State: AOAM530KxP2INdg1Clgsz57ql0q/9E7yAGq3TuE58IloFKUwaE3FXHxL
        RmY9uwGHsoC8723WpQvlknQcMX1vyCxrwtH18/S65w==
X-Google-Smtp-Source: ABdhPJxux7+upU3PjgLsBl4Bp9EglwkuntvBclKRfPrKEh0eH2UrhcoTX7EKC/yMVa/XNH2i8eefouAkVav6EyslkVM=
X-Received: by 2002:a81:4ed5:0:b0:2dc:e57:e5f2 with SMTP id
 c204-20020a814ed5000000b002dc0e57e5f2mr19128109ywb.199.1647268352833; Mon, 14
 Mar 2022 07:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220314112731.785042288@linuxfoundation.org> <0ac87017-362d-33e2-eace-3407e0891a94@nvidia.com>
 <Yi9LlP+x2swdsrbE@kroah.com>
In-Reply-To: <Yi9LlP+x2swdsrbE@kroah.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 14 Mar 2022 20:02:21 +0530
Message-ID: <CA+G9fYuwyUPMBRuBL10Z0r1MRt0sZ-MqvC6ySHBtpqdSp8UcDQ@mail.gmail.com>
Subject: Re: [PATCH 4.19 00/30] 4.19.235-rc1 review
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
        patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
        f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
        slade@sladewatkins.com,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        kvmarm@lists.cs.columbia.edu, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> > > or in the git tree and branch at:
> > >     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.19.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> > > -------------
> > > Pseudo-Shortlog of commits:
> >
> > ...
> >
> > > James Morse <james.morse@arm.com>
> > >      KVM: arm64: Reset PMC_EL0 to avoid a panic() on systems with no =
PMU
> >
> >
> > The above is causing the following build error for ARM64 ...
> >
> > arch/arm64/kvm/sys_regs.c: In function =E2=80=98reset_pmcr=E2=80=99:
> > arch/arm64/kvm/sys_regs.c:624:3: error: implicit declaration of functio=
n =E2=80=98vcpu_sys_reg=E2=80=99 [-Werror=3Dimplicit-function-declaration]
> >    vcpu_sys_reg(vcpu, PMCR_EL0) =3D 0;
> >    ^~~~~~~~~~~~
> > arch/arm64/kvm/sys_regs.c:624:32: error: lvalue required as left operan=
d of assignment
> >    vcpu_sys_reg(vcpu, PMCR_EL0) =3D 0;
> >
>
> Is this also broken in Linus's tree?

nope.
It is also only on 4.19.

--
Linaro LKFT
https://lkft.linaro.org
