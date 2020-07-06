Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AF7215D4B
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Jul 2020 19:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbgGFRhM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 Jul 2020 13:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729669AbgGFRhL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Jul 2020 13:37:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A867C08C5DF
        for <linux-tegra@vger.kernel.org>; Mon,  6 Jul 2020 10:37:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e8so12165396ljb.0
        for <linux-tegra@vger.kernel.org>; Mon, 06 Jul 2020 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sz11DYsL5zwVjqYhEKLPrxOF4tzgDMf1vz98/XjZCxY=;
        b=tLMYUVfHZtxO9KgWzxxOdD9mlQ3dFXlKr7srKRmLWLyKcglJiohqNiQztHYlHwWNUo
         iP0ZMLRORAtfja/bxFn0wg13a/z0XXiAoY7sxH9g5CvV5ifmaV+6HUOxwMqyNNBa7OXd
         Pk33QdLTy8IiiwRldr6OC7wSgyp7WcbNDd5KR/Do8+xNqy7KOuO660gFYGVH1OA3SxJL
         oqVXNWDxaJEO55b67x+Q5VVrZm/aaObRxxyZ6nahPibVE/3egwpX0Puzu7/MWuFuWzgr
         XtoIxoCAaZ1i2RBQeSzE6JIqCvmWPnrlM3qNEX5tILBOkQd00yt52r8ovQGzGTUUPPbi
         nqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sz11DYsL5zwVjqYhEKLPrxOF4tzgDMf1vz98/XjZCxY=;
        b=XGAZj58YFEmjVZ3kcdSefofDp+3e9CXTmfQwtDUg/A1ba91Gig/LsrDvJfgUnwS4D8
         yVQNDKeDkjINf+w5LDJQ9S0dHNMdeqLWHF/XOgFmpJzt3uqw0Xb8jzlbm/hwAzAWjuTJ
         RvWwucFiMJ/m6H/VGf0UmRzKnLkzal0Yu0YDHkHQ4TWTIdtxmEXTp+4U5zoDCrFJ6RMg
         jXfqOtoPxiqGh2SKsUUhPc+1MLZhOTtRk08jTuMz/DwkRmk37PFWcC/EeAvotaoCEZT1
         8CnaZE0U0vri6ENpXGjArYCNy8tS6vXWT0yQNciUsYTBMjotGD3onvXSJm2yYgF4DcJz
         4LuA==
X-Gm-Message-State: AOAM531l7VNHvgzscWPIJKE9sevqZzz69bCcKzPr2AuEctn036shhIGc
        G+9T8VybUijZyuniputTVU+E/Uhp8wxI6LruRBJ1UA==
X-Google-Smtp-Source: ABdhPJzFmLIfcVR5FzO4+AEovpNtwMZuiGYvPgfuVk+fhy5MWgeKKsdNiLip/9aWdgIrjSmnfdgotnU2gIr3mk7bFbw=
X-Received: by 2002:a2e:7401:: with SMTP id p1mr4753087ljc.366.1594057029609;
 Mon, 06 Jul 2020 10:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com> <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
In-Reply-To: <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 6 Jul 2020 23:06:58 +0530
Message-ID: <CA+G9fYvEqr8Wdi6vCTyAFT8eq3yL53E+WW4_Tzeea_HMKSOjQA@mail.gmail.com>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
To:     Dave Jiang <dave.jiang@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> Arnd,
> I'm looking at the pl001_dma_probe(), I think we could make it more robust if it
> uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I
> suppose looking at the comment header for dma_request_chan() it does say return
> chan ptr or error ptr. Sorry I missed that.
>
>
> Vinod,
> It looks like the only fix for dmaengine for the patch is where Arnd pointed out
> as far as I can tell after auditing it. Let me know how you want to handle this.
> Thanks!

This proposed fix patch applied on top of linux next ( 20200706 tag )
and boot test PASS.

The reported problem got fixed.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

>
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 0d6529eff66f..48e159e83cf5 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -852,7 +852,7 @@ struct dma_chan *dma_request_chan(struct device *dev, const
> char *name)
>          mutex_lock(&dma_list_mutex);
>          if (list_empty(&dma_device_list)) {
>                  mutex_unlock(&dma_list_mutex);
> -               return NULL;
> +               return ERR_PTR(-ENODEV);
>          }
>
>          list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {

ref:
https://lkft.validation.linaro.org/scheduler/job/1542630#L510

-- 
Linaro LKFT
https://lkft.linaro.org
