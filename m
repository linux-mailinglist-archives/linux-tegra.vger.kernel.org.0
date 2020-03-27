Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE43195588
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgC0Koj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:44:39 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36500 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgC0Koi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:44:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id s1so7423401lfd.3
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtlB69zsXQ3jZC3Ou4ODecutdMyciF2dIlXSJMt4Mfg=;
        b=g6zO4fwl4il+1ngGF+DwBd1vdVdf7kaSs5lwCr+GzM1DLm2kDPzSp0moLsXpg7coL0
         d8SpMq8pvZZGpYmcWO4qlED2aKQO2pYleVNFzi8/je6zi6l2968WMcYlGHR8k3SzsnMc
         emO1/ar+R2eVf0+co9Ady4ysnQn2nreGIXOPH/Q6bsVJ2z2+UeLauhB52ob/x/Z6JHtO
         Wb6+4/rxfLNFQUaGqD7ZUv+cKm6pE0J1rQ2Xmpc1q356r+nW6oXEqaBvg05CK8Wu+MJS
         kZTLa46dy6Co5v207HMmgVStBaNiMmhemnZ0R8Xib3M+WaWMWXW+klGjJGrEbK1unoEV
         H6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtlB69zsXQ3jZC3Ou4ODecutdMyciF2dIlXSJMt4Mfg=;
        b=AoDmtNAIuWpUeHWKEtnT2GFNBqN08iex+CUK1pi3XhSiHS2BsoCsBRxGxKRwABiDnD
         n4R47mC6S8LqcuPC98lJmdG/uSxkhtrlJVH/i226V0d1aYpwgCb3xgljUeTIEREJkzcN
         eTzbNdslb9nA1lfVWKv/HFEyjWYTA9QuWND9vgtdmLL93/oGX9LAuit7HHd7Ob3Rox49
         F+vcu2KtnipJxZ5G3qL4YsFa6uokD96kdkIPJxhWMJDxaGSDsTC747buu4Pyc2ucqnKR
         nvLrquuHRg4Cup/IOpe0kuvXjjJhb6s08EFWm+6dfa51BcsHLwiFd0MKApeu22zM1tBz
         nPAg==
X-Gm-Message-State: AGi0PubgDE6KuHSG66w4lcbf6Eme+pP2voWAXVw+x7vtng3wAq1i1jmr
        n/wSAZBPuRk3E2EVk8hoNd0RPvAesDKMxqHbwyIN3z8OXn0=
X-Google-Smtp-Source: APiQypLg4J2wxtQtpU6V+oVRQ2MpdJ8cSTbdUaBYm7lcPMJnY84ukdy6OsUxN/Xk1eIyvSI4nSkEv3qVaOSGuyWOS80=
X-Received: by 2002:a05:6512:6c4:: with SMTP id u4mr2047706lff.89.1585305876327;
 Fri, 27 Mar 2020 03:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-8-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-8-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:44:25 +0100
Message-ID: <CACRpkdZFn+mMMdJ7VNDNJotgKuiyF-Nw4oiJtxqSU1Pvm5t9Bw@mail.gmail.com>
Subject: Re: [PATCH 7/9] pinctrl: tegra: Do not add default pin range on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> On Tegra194, almost all of the pin control programming happens in early
> boot firmware, so there is no use in having a pin range defined for all
> the pins.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij
