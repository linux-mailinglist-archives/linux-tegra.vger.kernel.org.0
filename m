Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9494C1ABFC4
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 13:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506530AbgDPLjm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 07:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505923AbgDPK7n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 06:59:43 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495C5C02C444
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 03:59:43 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id a10so2637008uad.7
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/NQn3x2dQrPgmua+MkXZ2CPgsicQ89yPGaFimgDCmY=;
        b=H1PRjyupkz+ecVblYlD5uZ6r4HV5zKCOh+pkNDaV9amQ+qoxu3nkqACQli5ciwIiPE
         RZYTRcRro5ZMqNbQf4/M1vESYaAobmD4nNuC0g72XoFTuHA9BzE6oyn5+UZPvtNAlJEW
         ie/Lt169KGZ57WHaUv2tfQZD62uiHLfBim1YFbVgseXfc9JvQkfriTgSS7/0211ybdZR
         vY785wUltPwG3+Y3GOoKYBsPOR6lhKm25CiMM1z+OitCgs5fCmLii0es72sWXK7AhmWu
         v4PzLn8cVZR22flguxUivk/kqmXVeFMLyegDsuJNhiW5y+CWuztKa+zfIYH2w41QuLYZ
         TDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/NQn3x2dQrPgmua+MkXZ2CPgsicQ89yPGaFimgDCmY=;
        b=CpXduoTqsevUF2tDw34LqN5rAKWldBTPeai6iAE4t6P1yjQiLnUt3/xChRV6vBqKCz
         oHFMgWt+Shy+P8ItuW6+lFmv3ZMjcAO7ASYMSrXggX/aLB0R4pD6ILOyFqp9Fa30cjmw
         uo+ou8cxTTLY+ceoP4aQdg1xz01Ix85cNzqiQ0OmywW6LQFL/FTOxRODSqUBEpl27PjS
         iklmNysaZnhXKG0PPBzOo/uAvR08MPtofSuwFKxTFMN+VUUwAipCTo42Q1cNWEAgWejD
         MAmwbXi30w5vUuI+8kE21VkHtSm0pFpzt8d8V0oghASbj79CU6keNX71TGD40bfEUVBY
         ta2w==
X-Gm-Message-State: AGi0PuZArm7N0GzlctJ7eKxsDPqm9bNBae7CwlFqu9G1W8kshFHivQ7T
        H/Qg2C8swHmBTTjMBbfxThOc7HHKq/eeQIXNopQkvg==
X-Google-Smtp-Source: APiQypIheC8zF+5u1sxqSHfIaGuYjJzSfh8tnXKmJeq8phNdy3w/AXb9wUOkMUHaVScHJYnzRhCpI5N5eo01eUkNqKU=
X-Received: by 2002:ab0:2ea:: with SMTP id 97mr8516870uah.129.1587034782283;
 Thu, 16 Apr 2020 03:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <1583886030-11339-1-git-send-email-skomatineni@nvidia.com> <CA+G9fYvreAv5HmZg0O4VvLvf_PYSvzD1rp08XONNQGExctgQ0Q@mail.gmail.com>
In-Reply-To: <CA+G9fYvreAv5HmZg0O4VvLvf_PYSvzD1rp08XONNQGExctgQ0Q@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 16 Apr 2020 12:59:06 +0200
Message-ID: <CAPDyKFpZEiqTdD6O-y6Sw7ifXF__MHAv0zKT=RFKs+Fmvr-K_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        "(Exiting) Baolin Wang" <baolin.wang@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bradley Bolen <bradleybolen@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Aniruddha Tvs Rao <anrao@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 15 Apr 2020 at 19:55, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Fri, 13 Mar 2020 at 06:41, Sowjanya Komatineni
> <skomatineni@nvidia.com> wrote:
> >
> > Tegra host supports HW busy detection and timeouts based on the
> > count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
> > timeout it supports is 11s in finite busy wait mode.
> >
> > Some operations like SLEEP_AWAKE, ERASE and flush cache through
> > SWITCH commands take longer than 11s and Tegra host supports
> > infinite HW busy wait mode where HW waits forever till the card
> > is busy without HW timeout.
> >
> > This patch implements Tegra specific set_timeout sdhci_ops to allow
> > switching between finite and infinite HW busy detection wait modes
> > based on the device command expected operation time.
> >
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  drivers/mmc/host/sdhci-tegra.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> > index a25c3a4..fa8f6a4 100644
> > --- a/drivers/mmc/host/sdhci-tegra.c
> > +++ b/drivers/mmc/host/sdhci-tegra.c
> > @@ -45,6 +45,7 @@
> >  #define SDHCI_TEGRA_CAP_OVERRIDES_DQS_TRIM_SHIFT       8
> >
> >  #define SDHCI_TEGRA_VENDOR_MISC_CTRL                   0x120
> > +#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT            BIT(0)
> >  #define SDHCI_MISC_CTRL_ENABLE_SDR104                  0x8
>
> >  #define SDHCI_MISC_CTRL_ENABLE_SDR50                   0x10
> >  #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300          0x20
> > @@ -1227,6 +1228,34 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
> >         return 0;
> >  }
> >
> > +static void tegra_sdhci_set_timeout(struct sdhci_host *host,
> > +                                   struct mmc_command *cmd)
> > +{
> > +       u32 val;
> > +
> > +       /*
> > +        * HW busy detection timeout is based on programmed data timeout
> > +        * counter and maximum supported timeout is 11s which may not be
> > +        * enough for long operations like cache flush, sleep awake, erase.
> > +        *
> > +        * ERASE_TIMEOUT_LIMIT bit of VENDOR_MISC_CTRL register allows
> > +        * host controller to wait for busy state until the card is busy
> > +        * without HW timeout.
> > +        *
> > +        * So, use infinite busy wait mode for operations that may take
> > +        * more than maximum HW busy timeout of 11s otherwise use finite
> > +        * busy wait mode.
> > +        */
> > +       val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
> > +       if (cmd && cmd->busy_timeout >= 11 * HZ)
> > +               val |= SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
> > +       else
> > +               val &= ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
> > +       sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_MISC_CTRL);
> > +
> > +       __sdhci_set_timeout(host, cmd);
>
> kernel build on arm and arm64 architecture failed on stable-rc 4.19
> (arm), 5.4 (arm64) and 5.5 (arm64)
>
> drivers/mmc/host/sdhci-tegra.c: In function 'tegra_sdhci_set_timeout':
> drivers/mmc/host/sdhci-tegra.c:1256:2: error: implicit declaration of
> function '__sdhci_set_timeout'; did you mean
> 'tegra_sdhci_set_timeout'? [-Werror=implicit-function-declaration]
>   __sdhci_set_timeout(host, cmd);
>   ^~~~~~~~~~~~~~~~~~~
>   tegra_sdhci_set_timeout
>
> Full build log,
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5.5/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/83/consoleText
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5.4/DISTRO=lkft,MACHINE=juno,label=docker-lkft/158/consoleText
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-4.19/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/511/consoleText
>
> - Naresh

Thanks for reporting! What a mess.

It turns out that the commit that was queued for stable that is
causing the above errors, also requires another commit.

The commit that was queued:
5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout callback")

The additional commit needed (which was added in v5.6-rc1):
7d76ed77cfbd ("mmc: sdhci: Refactor sdhci_set_timeout()")

However, the above commit needs a manual backport (quite trivial, but
still) for the relevant stable kernels, to allow it to solve the build
problems.

Greg, Sasha - I suggest you to drop the offending commit from the
stable kernels, for now. I think it's better to let Sowjanya deal with
the backports, then send them in small series instead.

Kind regards
Uffe
