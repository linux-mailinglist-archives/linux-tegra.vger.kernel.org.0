Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CD9586FD
	for <lists+linux-tegra@lfdr.de>; Thu, 27 Jun 2019 18:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfF0Q0J (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 27 Jun 2019 12:26:09 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33126 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfF0Q0I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Jun 2019 12:26:08 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so2020025lfe.0
        for <linux-tegra@vger.kernel.org>; Thu, 27 Jun 2019 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9RRMDm00p9AJVdFcHrfeUH7UMA7Myos4ORq1dN0RjbM=;
        b=gaKEOSGiWwLZ3KPNv4G3TGQzDHLXQtNfe54AlgbSKN1ik0ggWcCbxmtl37nBHB6EeS
         c9rqKO1wDxaWBHYCScqLI/6D6i2loQXfo9w06QCxLXIb9V9P4nNp4dUcMDeYLpBlyf8T
         znR7X3qvG4hAK/3sNmZILIXc3J6kAv7xXuYYC+jKoxx2qWwnEydZEyLgUPr2C7Ae5XFX
         UlYzjXlGuSA4zh2/4C8TcfnhtzE6RenQx+mSxLV194hTU7L04etMrs3pxG4DG3QLgXQc
         vVmscEsFCEYoMp3jIjrMLx6QFIXxiTc8VBNbZUToq3RHUuG/UqQ/VfpJ5iq/jTMZc9E0
         jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9RRMDm00p9AJVdFcHrfeUH7UMA7Myos4ORq1dN0RjbM=;
        b=N/LtZN9UuCV+pyU8WH6OBZYxLc//RCjuPMplOxzj7rakPm/IhxAsVu9oeMhrnRmi7T
         YRdzxZ7keH8eZV6YqFIubVyGZL6bvH1s9udWa7PgNH4x4GCmR8B7s6ey8FveyYa6pAvg
         9w1pt9gLZlGmoRnsmWZO5rqKT4kv+C76ddXRiVDS6e93xLO6AIZh6fxkW8ErIeoF0Q+B
         eRwjzDg74Nmv2ZMKhxKkiHuyYlMIXPfHu7cd+fG98GPy5W2v2qjKtg9IN0FUdnaG3Pzj
         eubAM8+7uCDHstpTX0vkkW4YiSYR0F+cvCMLFdStZybgjK0tsWPBeQQrrfaWWlabjEeR
         ww4w==
X-Gm-Message-State: APjAAAWi4c5+4Xogp3kelYvSosR2gKymkn7YAE4LWAUYSGQbFc+UwiBo
        9LLuGJXzkmbHiaIzr8bDCfcj8/HA9rjI/x7mkANZ2ClDnA8=
X-Google-Smtp-Source: APXvYqyTl3tFgPOvf0mzEQrfvC/KAMaf6z9PDn6A4m2Us0uL3kh2uRdxdZjJI8AUObAJ6tPtR9okP4jozgaGcXhkCRg=
X-Received: by 2002:a19:7616:: with SMTP id c22mr2561517lff.115.1561652766589;
 Thu, 27 Jun 2019 09:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190626134258.26991-1-jonathanh@nvidia.com>
In-Reply-To: <20190626134258.26991-1-jonathanh@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 17:25:54 +0100
Message-ID: <CACRpkdZrdzs8TfESG4GJ-Tn0oZ4FoE90zrR3oO3KgdQBDLeASA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Clean-up debugfs initialisation
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 26, 2019 at 2:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:

> The function tegra_gpio_debuginit() just calls debugfs_create_file()
> and given that there is already a stub function implemented for
> debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
> no need for the function tegra_gpio_debuginit() and so remove it.
>
> Finally, use a space and not a tab between the #ifdef and
> CONFIG_DEBUG_FS.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Patch applied with Bartosz review tag.

Yours,
Linus Walleij
