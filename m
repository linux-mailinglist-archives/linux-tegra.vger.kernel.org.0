Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51FF75B817
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Jul 2023 21:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjGTTfw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jul 2023 15:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjGTTfq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jul 2023 15:35:46 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D102711
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jul 2023 12:35:39 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-cb4de3bd997so3458757276.1
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jul 2023 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689881738; x=1690486538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLn5dsVpXlnKJaX4b9fHndbyG5UJobtzyGKE/RdETxQ=;
        b=HSzRyFd+T9iT484cMpQnV0UnWkozan4g5bl17x81nWnNZP/LKwSEA0U2Nve193/1IY
         0td5zx+LDDtCTle/A2p4NWE1gyjM4o/ajhursuoAZsuKlw6u2Fbtw2dVpfxrRaiz9YRi
         9uzSvCfjIQ1bptK6r5/eoOmOTHICTZ4iW2Z6H1TWQ6EQPKa1DeewV8YRlsNVEp0UZ6Wp
         5x7pjY60WW8gweeaEHQJOFcrOhSbbCNkAfANi1Q89R1lfv8nn3iWBOkZbehKiTnQvvsE
         1ZHxyoa1CWMFQPOWzKLSEI3EtOe9F+B3Qgf4ckaal2VF6PBP0GS+ZC9fiSsMG7CBAegd
         YZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881738; x=1690486538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLn5dsVpXlnKJaX4b9fHndbyG5UJobtzyGKE/RdETxQ=;
        b=BHZj5TDxwEmwG6Awry6lKQ5ZDo9EaSJmIcZG+9vhDOO+oocKfSguDGVz+cMYbbP2un
         JFd3reCJ1Up4rUG+4lDCVT8edk1Xsf1ZH5lE67KKMkpwc/f6mvr1cXku7a7v5EpUBf5x
         cQ+jf1nnZKWANa7mF8i3/+Zv6An9YjzQYLHuSzGJUSo7xERSagmqQxRezxj67eTnSe0L
         Z0kVKnD8fCZBx5SyZ1M6RnhWucTx5AQUYy1e1dVPICKhDCjuy3DtXlRkIo0OB/0ZhWHw
         7LBWCiAfqcK5+6iN940HNkPJfiy3M2Tk1YfuTqqxCoK77VyDcFWSFZzQxvULTmiUWX4x
         RGMg==
X-Gm-Message-State: ABy/qLYJPdQBNgFB6gCFO+ahiBVQxOks7xM2v9sqR2k8ttd7pC+1wiiV
        UBvjxfd11pj1uIGARxAG4GFxIg7UH/L0MGK/0+oC7w==
X-Google-Smtp-Source: APBJJlEF2Q8RnAcTxqqb4EB2R0YvMEksKg+9xKZqVAQwIKbzhF7Oy4vgFMck9eBd+GfQMudZe0U0YpuOj10I2jSpYak=
X-Received: by 2002:a25:ce06:0:b0:cb7:a41e:be58 with SMTP id
 x6-20020a25ce06000000b00cb7a41ebe58mr7207974ybe.23.1689881738636; Thu, 20 Jul
 2023 12:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <0cf720bf-ae4b-5780-bda4-5c9bbb2d1d67@nvidia.com> <20230714113547.15384-1-pshete@nvidia.com>
In-Reply-To: <20230714113547.15384-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:35:27 +0200
Message-ID: <CACRpkdYuj35gM0sAoXgNAEVg6GdmV2cvksqqQLL22MH+HnF_yQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: tegra: Add support to display pin function
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 14, 2023 at 1:36=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The current function for a given pin is not displayed via the debugfs.
> Add support to display the current function that is set for each pin.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Patch applied.

Yours,
Linus Walleij
