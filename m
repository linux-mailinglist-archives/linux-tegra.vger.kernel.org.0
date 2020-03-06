Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C95BD17BF17
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Mar 2020 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCFNiC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 6 Mar 2020 08:38:02 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40076 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgCFNiC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Mar 2020 08:38:02 -0500
Received: by mail-vk1-f194.google.com with SMTP id c129so597965vkh.7
        for <linux-tegra@vger.kernel.org>; Fri, 06 Mar 2020 05:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pRT33IXafqSAr33qlx5s+Y+vRzyqKbOBrTN3ps1thPQ=;
        b=o41Jqr5JyVJfTo5kWfFMhZB6OVZvxSSgEV43vr8hiKBBdUTzzbSHcILHK7E46FqCV1
         zGC+1sXbOK83HkqScxPrT6ygSj3chMcPk56a4HEO1Hp+bQXUDtH7V2yqvRnGeZW5pe9P
         jZW98ry2S97rX+M3h+lwfREUocO47zlFRvfuZAsA4yxvw+5elom8/uXei4G2XdQr9NTQ
         KXEg/Hceo7Z1r5ffwG0Aj+jD3m3pPpd818wWRijHKlVbTZn970ZtZdrv5e9UWWjnH9I5
         EMuEM90i5rNHhgH7P/cUgCRy/H0vpyq37zemCZXiDEbx1/fl29EQtXHEes0aFeL5V+MZ
         OW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pRT33IXafqSAr33qlx5s+Y+vRzyqKbOBrTN3ps1thPQ=;
        b=HofMxA7UKwPbK7LL20fAKieI95ZXR2yEXmR5CHjCzkQUT7NhBmZqZPqx5LIREBkmXs
         vRjVw0GAxjlYE3PE/3fuDfi3A5aHav1daSa/VkV5VJqmGa47M2NW6iRjIPacJbQO3Zxw
         K7PyErYuiss0H0QLOBY34Z4QPFvw2tya+Pm7tXiG/8Plkvsx7Fv1MGfLBWSpBxD9B21v
         IeZnvkdFPwbH2YCh5bxVNnm2qyBEBuqmP+mNdUYHYEazhimMXyc5veQf6bkCi3z1sPjs
         9xGNd8HLngdTJDp11yW1thFtwlQbFnPHzEHbMpxWj1EWHcZs9upeD9jaGzTmEjdEVeiH
         NMQA==
X-Gm-Message-State: ANhLgQ141OkTnYP/2+sw38NcS2D33tOTw3tnQgHrD9Lb9AEW7knEO4xF
        j5PWetM91gk9X05LWwPNR31FY5YKwlfq+rfLx+86uw==
X-Google-Smtp-Source: ADFU+vtBfU7t/GedoLeNXV1o80D5EdpGUw8N8UHHXFMxpqbi5jvG1O+FqFD5DalVaczgtf9BTkYBUVQZYJtuWD5NAnw=
X-Received: by 2002:a1f:78c5:: with SMTP id t188mr1669349vkc.43.1583501881058;
 Fri, 06 Mar 2020 05:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20200224231841.26550-1-digetx@gmail.com> <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org> <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
 <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
In-Reply-To: <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 6 Mar 2020 14:37:24 +0100
Message-ID: <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
To:     Dmitry Osipenko <digetx@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Billy Laws <blaws05@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Andrey Danin <danindrey@mail.ru>,
        Gilles Grandou <gilles@grandou.net>,
        Ryan Grachek <ryan@edited.us>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 4 Mar 2020 at 18:09, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 04.03.2020 19:36, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, 25 Feb 2020 at 01:20, Stephen Warren <swarren@wwwdotorg.org> wr=
ote:
> >>
> >> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
> >>> All NVIDIA Tegra devices use a special partition table format for the
> >>> internal storage partitioning. Most of Tegra devices have GPT partiti=
on
> >>> in addition to TegraPT, but some older Android consumer-grade devices=
 do
> >>> not or GPT is placed in a wrong sector, and thus, the TegraPT is need=
ed
> >>> in order to support these devices properly in the upstream kernel. Th=
is
> >>> patch adds support for NVIDIA Tegra Partition Table format that is us=
ed
> >>> at least by all NVIDIA Tegra20 and Tegra30 devices.
> >>
> >>> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.=
c
> >>
> >>> +static void __init tegra_boot_config_table_init(void)
> >>> +{
> >>> +     void __iomem *bct_base;
> >>> +     u16 pt_addr, pt_size;
> >>> +
> >>> +     bct_base =3D IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSE=
T;
> >>
> >> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
> >> Information Table) to a fixed location in IRAM, and there's some value
> >> in the BIT that points to where the BCT is in IRAM. In practice, it
> >> might work out that the BCT is always at the same place in IRAM, but
> >> this certainly isn't guaranteed. I think there's code in U-Boot which
> >> extracts the BCT location from the BIT? Yes, see
> >> arch/arm/mach-tegra/ap.c:get_odmdata().
> >
> > So, have you considered using the command line partition option,
> > rather than adding yet another partition scheme to the kernel?
> >
> > In principle, you would let the boot loader scan for the partitions,
> > likely from machine specific code in U-boot. Then you append these to
> > the kernel command line and let block/partitions/cmdline.c scan for
> > it.
>
> The bootloader is usually locked-down on a consumer Tegra machines (it's
> signed / encrypted).

Right, you are you talking about this from a developer point of view,
not from an end product user?

I mean, for sure you can upgrade the bootloader on Nvidia products? No, rea=
lly?

>
> Technically, it should be possible to chain-load some custom secondary
> bootloader instead of a kernel image, but this is not very practical
> because now:
>
> 1. There is a need to make a custom bootloader and it is quite a lot of
> work.
>
> 2. You'll have to tell everybody that a custom booloader may need to be
> used in order to get a working eMMC.

Yeah, I get the point. It's not an optimal situation, but I assume
it's about informing developers. They can cope with this, no?

>
> 3. NVIDIA's bootloader already passes a command line parameter to kernel
> for locating GPT entry, but this hack is not acceptable for the upstream
> kernel.

Well, I am just worried that we will end up with one partition format
per vendor/product, that wouldn't scale very well.

In any case, from mmc point of view I am less concerned, we can find a
way to support the needed bits. I just need to review the series more
carefully and provide some comments. :-)

However, before I do that, I would like to hear Jens opinion about
adding a new partition format, so I don't waste my time here.

Kind regards
Uffe
