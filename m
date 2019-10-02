Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53B6CC87B7
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 14:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfJBMCi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 08:02:38 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45631 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfJBMCi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 08:02:38 -0400
Received: by mail-qt1-f194.google.com with SMTP id c21so25888126qtj.12
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=63GhVpwgQZB46rq4XKUOiuZAKGE9kqkywfzipCaqgsU=;
        b=ZQ8fRcoAXsauj8+u0USlSlHOsxrHuwgWWvhawBOBO5PAB6lEMoCYXTOV4BqY9zL/ih
         KwutmU7jq2xaU4Eu2hPirbqZUB+JRcWQg9/0XfV4Zfk9XAE6rsDDwR0rQUfvr50w5c+B
         3yiqwZpRfZnOL7yNDjIMB4XjdZun2opMjf6zB/rwQ0r/qmw8MScdxYkp1ebSHb7dEQg7
         ukdyypiEpJ4Bb5HpqXAD2BsHtyIxga56krPW1cIlt7R83FzstHFQTM+LL0wv0z/+dCNi
         yLh+GnErmbB76qRBJX3vAU33OQLemhChqlYjeswbsnn55mp0OE0FTqTcC2gqA7uAbFaj
         TAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=63GhVpwgQZB46rq4XKUOiuZAKGE9kqkywfzipCaqgsU=;
        b=eEbOXrHTL7KFJluto7DAHASskfrn43210G7avrubsRPj3crwbPAH4ZSneQR2ksqn0K
         JxMHRT32kiehsA+m7enK46VTKh0WBz+ec6RbWg/9fiXN7xsSibsQAtnU/udHkfQY4j4R
         alLZd/Mnt0hBmbievBTyEYE5M16n1HITL86m3VW34stm86lT8O2juwZ78RqdDpIpc+Xs
         F2J5O/u6Km9pzVAeAQD5THfAiFuvcEe2I4kkm6VggPgO0HKN738YtKUNNhKfvfR75H1G
         4aakrAG6m9gQKOUdXBfkjI9rE6tzrWoQg3cpPeD9RyTggXKqK4niUuLOdfx8yJN2AIuv
         AvRw==
X-Gm-Message-State: APjAAAW3PErVpJGGYxwEguF0QKG/n6Xts/BswV508YOmQTIBL1DVNkue
        fO38EjSbzaUvBEBg1FeyeZzbcyvwjFx/rnMX4bfxt23zAkE=
X-Google-Smtp-Source: APXvYqyafUVqQus4G0qnKMkBDYEhufgQ5qNGE5tjwEjs+wrpd1K8uixhBrcwtQIU7VwSl0HW/+hDbOl94GhTcbR1byA=
X-Received: by 2002:a0c:eb89:: with SMTP id x9mr2583080qvo.18.1570017757247;
 Wed, 02 Oct 2019 05:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014153.29831-1-pgwipeout@gmail.com> <20191002014153.29831-2-pgwipeout@gmail.com>
 <20191002111052.GM3716706@ulmo>
In-Reply-To: <20191002111052.GM3716706@ulmo>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 2 Oct 2019 08:02:21 -0400
Message-ID: <CAMdYzYp0ovnnQ5x=3UVU8mSL7P4U5PBpar7Ln6X9JGe2m125Lg@mail.gmail.com>
Subject: Re: [PATCH 1/5] usb: chipidea: tegra: add tegra specific flags for
 host mode
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 7:10 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Oct 01, 2019 at 09:41:49PM -0400, Peter Geis wrote:
> > Tegra controllers require special handlers for aligned dma, as generic
> > helpers do not exist yet. Add a flag to set for Tegra devices to permit
> > these handlers.
> > Also, some Tegra controllers require a double reset, set from the device
> > tree. Add a flag for this as well.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  include/linux/usb/chipidea.h | 2 ++
> >  1 file changed, 2 insertions(+)
>
> I think it's best to introduce these flags with the same patches that
> add support for the features that they control. That way it becomes much
> clearer what they're used for.
>
> Thierry

Understood, I'll rework the patch layout.

>
> >
> > diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> > index edd89b7c8f18..88cc13fe582f 100644
> > --- a/include/linux/usb/chipidea.h
> > +++ b/include/linux/usb/chipidea.h
> > @@ -62,6 +62,8 @@ struct ci_hdrc_platform_data {
> >  #define CI_HDRC_REQUIRES_ALIGNED_DMA BIT(13)
> >  #define CI_HDRC_IMX_IS_HSIC          BIT(14)
> >  #define CI_HDRC_PMQOS                        BIT(15)
> > +#define CI_HDRC_TEGRA_HOST           BIT(16)
> > +#define CI_HDRC_TEGRA_DOUBLE_RESET   BIT(17)
> >       enum usb_dr_mode        dr_mode;
> >  #define CI_HDRC_CONTROLLER_RESET_EVENT               0
> >  #define CI_HDRC_CONTROLLER_STOPPED_EVENT     1
> > --
> > 2.17.1
> >
