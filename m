Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0931ED39A
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 17:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgFCPm6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 11:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgFCPm6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 11:42:58 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3862FC08C5C0
        for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2020 08:42:58 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id 1so1645474vsl.9
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2020 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+v4mUPWrEgtC6NRHUyR/xEDnM6YAcz7lXyI+WN23E04=;
        b=khLffvfzVOTkhZTg4LH+qEdUt73iWPRnL9GaoDNme5UbPkDVXCY5TqrzYGvhtcIoga
         cKEaaSukhEUrbDyPveKQNibicwL0vJI1sqkVdxs+iz+nSTyId8VO4WYcHwUJu5wOeIi/
         c8UVYg5uRcelc59CHgFsp5wPS5Q4t3aG+dXUOm+3JKQc8ZGIcJo8eQdYnFtyvqSvpMEc
         meiMqZLRqBZt5tPR/mAcgTkKvrNnL5gDlBwx4LvepacSHca14xeZxhAEHEdGCnw9Qc55
         +RLa6I2bbLDEWBZwsIct44sDCTTKbj2jrpCrRX4C1mOSEsPSDJUbuZV5LROQ/IcLK7Om
         Sp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+v4mUPWrEgtC6NRHUyR/xEDnM6YAcz7lXyI+WN23E04=;
        b=dQSaVm/bVZw2xT9FVRSGIUMTE7q6wqRG7siP0faQle3XgY1eXWhGBDzHFZZKhMEdiS
         oOx7ScuSbnl01yo5+RePgU3n9Vb9fp+l6WiUA4s2uQCMy5zj3C5HGo6OYadbnJu+RvUO
         aSzlJapP6No5iXoaDBp8hEvtVFJx7uD5DtEjPjuH+6mbpvjoQZ7xKTmd79x/1oozmCXG
         I2QIFD2u3dNHnO2J9OpvQKsYeK0XlGd4mfiAKAUuHPfmpoNZFPDGPokOrCOD1Wpd7RYN
         W8p5DVATfAgWzckBWVX5taZjLIwg63r6ogqc8stSPd6fZtaL6uUTEPiQUJg5o6Dy4uQN
         pqpQ==
X-Gm-Message-State: AOAM533kPBjXwCcqBE50AXkLZV8mYhP2efPBF48yY6SWRPv7XKog9U7s
        P8fqhDv6Y5+7XZpcOGMGKPs2L5yGL3LFIGrnuYsbVgqc
X-Google-Smtp-Source: ABdhPJw5n02lpBHKugUxtKm8DveNj4ZSMg6h12mYs3x3BR4r2dCSxt3GQS8NEU5HWJZuWnL499Nz8JoOwcgIKa+ySt4=
X-Received: by 2002:a05:6102:22ec:: with SMTP id b12mr18862vsh.138.1591198977515;
 Wed, 03 Jun 2020 08:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200603142002.3776672-1-thierry.reding@gmail.com>
In-Reply-To: <20200603142002.3776672-1-thierry.reding@gmail.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 3 Jun 2020 16:39:37 +0100
Message-ID: <CACvgo529m+fub=ZddGkjRXEY-7i3rRUs0EssYGf+DJgkcDm3Zg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: gr/gk20a: Use firmware version 0
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        ML nouveau <nouveau@lists.freedesktop.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 3 Jun 2020 at 15:20, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Tegra firmware doesn't actually use any version numbers and passing -1
> causes the existing firmware binaries not to be found. Use version 0 to
> find the correct files.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Fixes: ef16dc278ec2 ("drm/nouveau/gr/gf100-: select implementation
based on available FW")
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
