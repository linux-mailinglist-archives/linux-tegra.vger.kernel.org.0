Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81D67AFF01
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Sep 2023 10:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjI0Iyb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 Sep 2023 04:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjI0Iy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Sep 2023 04:54:29 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E712FB3
        for <linux-tegra@vger.kernel.org>; Wed, 27 Sep 2023 01:54:27 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59f630612a4so92901597b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Sep 2023 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804867; x=1696409667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUQWHokI0/PP3Pa9y7+XUP51eu78u0wG0BZdJCTqPvM=;
        b=yLZDXl/E3IZ/hHX381j+AS8ds+gxMHPH71lGfZzfAE+QCdFOe+TPJlb/VaEMKlonH9
         G/Tful4Z/Q72D9SoaZvcoAV+SYqo+do04lTZq8FEiRg86eSvMHY8E6hv2iZvdcbPxjXB
         5waBqcxWyJhV79JuFdKmKO9RI86y6aO5LZY7XjA5/AiNB1RtyYnAXKNhnPnztF3DfpZ+
         ABsn1PdZxID9HEUhcRwTR4U7BRkRz6teQYnrPJH2tRvuHwL1ucv9XGIeTCxELGE/BKgU
         aEB382eFrXrbycguNLwakQzTNhLq/5EBY+PFMD/YzxaCXueW5i2mbS3rn2bnqBxDfMI7
         MmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804867; x=1696409667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUQWHokI0/PP3Pa9y7+XUP51eu78u0wG0BZdJCTqPvM=;
        b=mwUhurI/fcuXYDO7aAvJcjBX7G3x9KFumEIi6hgEmo0qqQ/VTX7inKlCcfkBTOs+V7
         66a+5vnHazADq2xzrYXsX9myvFc9K4eYp0ZOJsEk+ij048ngwr8nq28xk/eJm4X6EIAE
         yl2pe8hPWgN114/w0HEENgpaZ5S4iOnoVfv0MAQoN1+gfoV7Gzqy+cUcgX7k1rmDBqjb
         1sr/73JG8TWjNI7OS6rN8vyl6En7M/+rdlxtQVgvoEfh32C+8HMzkEIJiQ2HnnIP4C0r
         e7VkaRYAUhJTq0hONHchzOkcFZcnYxEI8MxeP2leHnYBkG0Q/uQVxlomMbyZstVdcq4c
         I1Pg==
X-Gm-Message-State: AOJu0YzoaF4sTK2G0hRtnQwXy3zgAtnTyco96H6WDJq7tgvPmwUckjws
        oBCV3nprVVQmhYBm0MuWWaOzJH9B6+XqAwQ3yHOSZw==
X-Google-Smtp-Source: AGHT+IH8Va/N+/AVkQsfeoRifmdhTAO1hd0KT2hbbCj2lB2xc8n5r1zjH+27Pilr4ZSMZryb7OVBP5dRyrmgdeHesAY=
X-Received: by 2002:a81:488a:0:b0:56c:f0c7:7d72 with SMTP id
 v132-20020a81488a000000b0056cf0c77d72mr1315032ywa.4.1695804867167; Wed, 27
 Sep 2023 01:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <0cf720bf-ae4b-5780-bda4-5c9bbb2d1d67@nvidia.com>
 <20230714113547.15384-1-pshete@nvidia.com> <20230925183049.10a40546@booty>
In-Reply-To: <20230925183049.10a40546@booty>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:54:15 +0200
Message-ID: <CACRpkdbZ0cxA_y=6j_QQpF1SQ1q4hw-qUyeOnEK-+cLBd=gjCg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: tegra: Add support to display pin function
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 25, 2023 at 6:30=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> The symptom is that i2c3 is not working anymore, the I2C lines being
> always high. No other known issues at the moment.

Hm....

>> +     {"nvidia,function",             TEGRA_PINCONF_PARAM_FUNCTION},
>
> FYI, I reduced your patch to only this line plus the one in the
> pinctrl-tegra.h and the problem appears as well.

I think there is a conflict now, that the pinconf is "stealing" the functio=
n
assignment from the pinmux call.

It's just a debugprint, I will revert the patch, Luca can investigate and y=
ou
can test a new patch then we will merge that.

Yours,
Linus Walleij
