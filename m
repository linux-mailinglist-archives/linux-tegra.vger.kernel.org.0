Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC11D54F23
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 14:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731640AbfFYMp3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 08:45:29 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45325 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbfFYMp3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 08:45:29 -0400
Received: by mail-lf1-f67.google.com with SMTP id u10so12490818lfm.12
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXP4JRJ2rx8WTx/IvB7mQlU4cL4GwpdkUXm1s9F/K8M=;
        b=JvFEoAV7t7A7Gd3chCUpGUWBoH7VZKOdGjwQL1PXHfW/MZ0/GEKzYw3Y49Q+vUBt8x
         RE0UIWrmCQ9HAV5ULaYw6u9jSS4VW3F/LtboJjVX5rVH6Yf8LAsc8uq3RuuPRIRPOOIu
         hGIkyrJLzyB4lGOvU8MWIr0aE6gpNpDoiu8sc/syl0UFPFNpROK0ZDbUfGBRSqWpQslR
         gA2a1r9kJqxMrBFpNwiFaKEZWXUf4mPYNmqzhQpIjGoDqHMnGeFaLDgz6X30EKKWIIwy
         n41PsDmCKGdzDa/2f4JFV2q9WeAEKgPxdwmyaTlXBsIcFW/nX6kwM05fTp9We0hOmo/P
         dREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXP4JRJ2rx8WTx/IvB7mQlU4cL4GwpdkUXm1s9F/K8M=;
        b=hxajy5u/CbJB/iG/wytr+EvOTweoiHDpam/hEPrPEARLegR6xm8GzyWwyTVlM0Ojgv
         DmUCOgdO+Vl+z+Xtc1sA42DIggscX0Sjs93StlLy/E9a7vEFBNUVF+OvbjYcmPV/pAsy
         t8vWkV0b0fGyJ4GUg2geSk3V80/HmHlnc/WRt8ZVMuom9si0VHZ04UTg/bUIzIhlCmgy
         Y9rbsGNw5u3h1IWjH/Yo6Wv8Pz00Fevz7ddg6nPs5u5rs6mI1rpxtfyTyK+xNXMWrQpp
         QRmptjzVz9WSuf+2luJCQsjN+5Pgu0/QEQVtwLZdiYa1HGRfezy1dlIArYXuXvt2n29q
         8MFA==
X-Gm-Message-State: APjAAAXE50fKTjqahycJBLYIQUsWkT+FMgzjux1g+CtI7G9WfHqC5HBb
        OlDmM/ucMr/RbUXY+iiwp0jh8MVTN3akEziJrtXJMw==
X-Google-Smtp-Source: APXvYqxLapz1FuSnPhrExtNmolE9CysKVN2/5nODi0MRw3m7iwOde5NUq7AMikl8LpOek82orn2zUlstqHlNhkuQdEA=
X-Received: by 2002:a19:7616:: with SMTP id c22mr25050223lff.115.1561466727514;
 Tue, 25 Jun 2019 05:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190618155047.16894-1-gregkh@linuxfoundation.org> <20190618155047.16894-2-gregkh@linuxfoundation.org>
In-Reply-To: <20190618155047.16894-2-gregkh@linuxfoundation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:45:16 +0200
Message-ID: <CACRpkdYjsQbG_ZQXs2d089_bCbd0DBHKJBj0pa09AgpGMiWR4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: tegra: no need to cast away return value of debugfs_create_file()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 18, 2019 at 5:51 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> It is fine to ignore the return value (and encouraged), so need to cast
> away the return value, you will not get a build warning at all.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Patch applied, fixing wording and stacking up the ACKs.

Yours,
Linus Walleij
