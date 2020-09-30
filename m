Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FDC27F52C
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Oct 2020 00:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbgI3Wcw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Sep 2020 18:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbgI3Wcw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 18:32:52 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBEAC0613D1
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2020 15:32:52 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p15so5126068ejm.7
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2020 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e6O73OjsDxvOW+WlmK+Heyu52Yeg2Jcu5CCnSK4DBT0=;
        b=dhje9PS0dPsa5SE9icH+VbXOR2J377+pA6AR6uz7LR2jewZZUPNCxEx6w+qeI+oGkb
         pgU/Vb4RuH9x1o/7GsN/aY+anl8p5kSPJtUaM9a0o94wriLqJ2cGZs+wE5676T0ulPf8
         BXwGd6kMl1uNGRSkEODujQFaabYaR/jyu8XLHnpac3gWWKX1su6fID3NwUeJ94ZoqRVv
         1ucqZJMZRb6Oj2TB/uYmuKSarxmrBRQcFAT7o55E1FLn+lf28LlGLiTYQjqrHlvaDdBx
         eImGrKIKL1bPXTyJB7fx4FhTJ14CiYHzHY+NRMHqOzFuH8/U8OBCntm0+2fpTUpt9kIU
         gr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e6O73OjsDxvOW+WlmK+Heyu52Yeg2Jcu5CCnSK4DBT0=;
        b=qoETM8+8Z+fIOGRIE19Su1Yfb/AUjN+z9KB4g+NEKu1b+D6vRjHyDm66kPSVcFx29R
         L6sqI1y4oeSK29jELDtHYEhrLMCiB3F1VbUizZcGytxxn6g/p7NdNoG1k0bul+MvR4+w
         5aIT2w1L/1OA2odagmKqVQHjLxT+1sxcwBvl6eZf/uKZGY5sFwmjyWdF/s6HVJW+ZPGa
         WkNWRM6xb/KUIkH887eF6U0EAVYk4Id3jCrbpU9aKVlsD8Iia5hxprZSBGpELUKduKO1
         5zA3XcWK/cRi6f3oupv50Hb5UzTchDtRyB5hyySPY4OlfFu7RADOAF6GNfJTNHuK8fiX
         9mRw==
X-Gm-Message-State: AOAM530XjIzmIPOF94IcyrnzpwjHVaimoJjNsgZx5czJsg7IDkm4TCcK
        BKul5rnbiKVfS1ow0ABYvuRPf5qYnWmLwbpd7iLe7g==
X-Google-Smtp-Source: ABdhPJwuv3/9oLHPCAAThwJbncDoDe0+vEaaHx0SqrZ12nS/jDEjdx91TQe9PImrenr/WKrUFEJBbbgzZucV8QwN8uw=
X-Received: by 2002:a17:907:94cf:: with SMTP id dn15mr5256195ejc.114.1601505170533;
 Wed, 30 Sep 2020 15:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200930210824.GA12277@embeddedor> <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
 <20200930213634.GA12855@embeddedor>
In-Reply-To: <20200930213634.GA12855@embeddedor>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 1 Oct 2020 00:32:24 +0200
Message-ID: <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 11:30 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> On Wed, Sep 30, 2020 at 11:10:43PM +0200, Jann Horn wrote:
> > On Wed, Sep 30, 2020 at 11:02 PM Gustavo A. R. Silva
> > <gustavoars@kernel.org> wrote:
> > > There is a regular need in the kernel to provide a way to declare hav=
ing
> > > a dynamically sized set of trailing elements in a structure. Kernel c=
ode
> > > should always use =E2=80=9Cflexible array members=E2=80=9D[1] for the=
se cases. The older
> > > style of one-element or zero-length arrays should no longer be used[2=
].
> >
> > But this is not such a case, right? Isn't this a true fixed-size
> > array? It sounds like you're just changing it because it
> > pattern-matched on "array of length 1 at the end of a struct".
>
> Yeah; I should have changed that 'dynamically' part of the text above
> a bit. However, as I commented in the text below, in the case that more
> CS IDs are needed (let's wait for the maintainers to comment on this...)
> in the future, this change makes the code more maintainable, as for
> the allocation part, the developer would only have to update the CS_N
> macro to the number of CS IDs that are needed.

But in that case, shouldn't you change it to "int cs[CS_N]" and get
rid of the struct_size() stuff?
