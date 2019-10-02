Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3963FC87CC
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfJBMDw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 08:03:52 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36571 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBMDw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 08:03:52 -0400
Received: by mail-qt1-f193.google.com with SMTP id o12so25973488qtf.3
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oDZ8+Bsxe1uSPUQgIM5DKtueBXSk7P+qyEEIvaLE4+w=;
        b=iQBALYfYw0JDGJZ2KFBuHWN8SAIq8p/1IKD8P/kx84TYZKZbOkki79y/ralD5mJa0a
         STuuPEZSFaKzJESteXnXrpXI6EVomcD9i7MoaeXSYciRYhbVWAtsvKWymGFbxjzUtlmw
         emo17dlR0/jd3yKN4GAob09FJE9BFuK//KUJ0QEU7DZqrKDXv8pnFpPEw0BYherEDPov
         xTnNu4UpCsywBn1Yqj0v3cJYblCQyDDGsgpSq0SqlSg7148uWrxSUcmvd8LewnR8XjUD
         u57tdjsn7tWasX6znOEnlT+iCvaLb90rZC6klGqTi3dwM3tikPSf8oMX2Jx7sqRgSf/M
         OS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oDZ8+Bsxe1uSPUQgIM5DKtueBXSk7P+qyEEIvaLE4+w=;
        b=L7GaN6T5KwLf7jX8kgR4aRoYxFaNByEJqZFBjVIuUnCTzNyjZH5hgftqsb4DCqPvTi
         VktEgNMZmYixvVr70sxlPTg3rEzkyksAVEOEio5/ugJfYwsfhHHd/OTk3VeArxZV1hp9
         adgXduBDsObrjyCE66AOaM2gIIP95DjjWKTIp5r9EJ4lfSQh8uVhbpGpYOTCuzLGatjn
         3YuRmrLvx2Ex9eQyYFmo1HNom/8pAlH08wK57NsCS3D7YGJFkR4eHb8cqmcbkR1gou5T
         6FTJaLi5+kYQmLRtjDHQ8JZu2CIW9nT+vGk1UVjUBleqKDEdj12MTldyVu0NX2MjobWn
         VBtw==
X-Gm-Message-State: APjAAAXvT4BYysmkZaJsGigOr4BAFlvG/EPEGehdw+JvIVLqvOqlPU+Y
        /UN2+eUZVlufjS5Uky3Vpg0kB5Z/2TIgmUXkrmw=
X-Google-Smtp-Source: APXvYqzqHZ71CvP2qyuQpIx4/NE/CtdHrFkWRPRm+Jp3t752DHXZU7UH+JgOteNSYRYB4jIDxZDheCDUguIm4sEc+YM=
X-Received: by 2002:ac8:3021:: with SMTP id f30mr3552762qte.193.1570017830851;
 Wed, 02 Oct 2019 05:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014153.29831-1-pgwipeout@gmail.com> <20191002014153.29831-4-pgwipeout@gmail.com>
 <20191002110914.GK3716706@ulmo>
In-Reply-To: <20191002110914.GK3716706@ulmo>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 2 Oct 2019 08:03:34 -0400
Message-ID: <CAMdYzYqzhp0BaRLMbcY6i_D5kQc2QxnsT+n=MJuAzL5zxjvA9Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] usb: chipidea: tegra: add dr_mode checking to tegra-udc
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 7:09 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Oct 01, 2019 at 09:41:51PM -0400, Peter Geis wrote:
> > As the tegra-udc driver does not yet support all modes, add dr_mode
> > checking capability.
> > Warn about invalid configurations and explicitly assign dr_mode before
> > handing off to the chipidea core driver.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > index 0c9911d44ee5..29415c3a2f48 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> > @@ -25,7 +25,7 @@ struct tegra_udc_soc_info {
> >  };
> >
> >  static const struct tegra_udc_soc_info tegra_udc_soc_info = {
> > -     .flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
> > +     .flags = CI_HDRC_REQUIRES_ALIGNED_DMA | CI_HDRC_TEGRA_HOST,
>
> This seems to be not at all related to the rest of this patch. Also, I
> think this patch makes sense standalone, so it may be worth sending it
> out separately, perhaps marked for integration into stable branches if
> you think it worth it.
>
> Thierry

Considering I wrote this because host mode caused me issues, I'll
split this out as a separate patch.

>
> >  };
> >
> >  static const struct of_device_id tegra_udc_of_match[] = {
> > @@ -63,6 +63,28 @@ static int tegra_udc_probe(struct platform_device *pdev)
> >               return -EINVAL;
> >       }
> >
> > +     /* check the dual mode and warn about bad configurations */
> > +     switch (usb_get_dr_mode(&pdev->dev)) {
> > +     case USB_DR_MODE_HOST:
> > +             dev_dbg(&pdev->dev, "dr_mode is set to host\n");
> > +             udc->data.dr_mode = USB_DR_MODE_HOST;
> > +             break;
> > +
> > +     case USB_DR_MODE_UNKNOWN:
> > +             dev_warn(&pdev->dev, "dr_mode is unset or unknown, setting host mode\n");
> > +             udc->data.dr_mode = USB_DR_MODE_HOST;
> > +             break;
> > +
> > +     case USB_DR_MODE_PERIPHERAL:
> > +             dev_dbg(&pdev->dev, "dr_mode is set to peripheral\n");
> > +             udc->data.dr_mode = USB_DR_MODE_PERIPHERAL;
> > +             break;
> > +
> > +     case USB_DR_MODE_OTG:
> > +             dev_err(&pdev->dev, "dr_mode is otg, tegra-udc does not support otg at this time\n");
> > +             return -EINVAL;
> > +     }
> > +
> >       udc->phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
> >       if (IS_ERR(udc->phy)) {
> >               err = PTR_ERR(udc->phy);
> > --
> > 2.17.1
> >
