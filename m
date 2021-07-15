Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6143CA16C
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Jul 2021 17:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhGOP3T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 15 Jul 2021 11:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhGOP3S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Jul 2021 11:29:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D1AC06175F
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 08:26:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f30so4004174lfv.10
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jul 2021 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pwgJCon9nCgOfdweHqPCtSYWnR/Tmiv3AEfGAwUX/Ig=;
        b=B/FYL1vrHNRhRSchZNW254RE0VbNaFwkL9dpxD3oO73ZK9097d/OivNvrj94PdEseF
         UQUcVN6YKvSDmktIqfeBtC+DXITe/7E5EwwqNlhHFmZ7ta32Y5hG0KQ8q49vsTMyRBs6
         zXZeQEyZIOm2oY9TjcH9ZyRB+xiIrc0rJyKFh9EyrnYkfXTMzM0l/Exg8QKVHX4Uxt7c
         th3o+wfDy5PaY8jWM8iWmTNSgSDaslScphQusFPZmI8TU6l565BRFLxQX0l5xJsx2lSq
         EUsgGPbGas4InfIV+ThTh2pE/Xg8/ejBtoutfhJIw6+LcwGpBIWIWv1Hc4ccoQSbXc0Y
         Xk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pwgJCon9nCgOfdweHqPCtSYWnR/Tmiv3AEfGAwUX/Ig=;
        b=EXfnFDOkLoRZ1wob2WYDuWrphxNX4dr1+gchEaZx7zbZRKt92RCH2BhhzfBBSycC2E
         kks00P7A02FBmmvh2HU2N81U1Y/AK6nlG2AYNUapMLTIoxetJEvXgO6R0UgNa2+D9WJw
         EjTiWup8ylKwkjTDH2MhqwswYJEXdOQGXfdYxlKkUOx6ri2WDcjb75FLrJ3iFuPqmseE
         BP5bzMxCJnjMNlyminaJKvswPe8XiHHy6Ou3g+uLbHUVmR+qWcf3tzpJy3krfX9THEKU
         VyU19QYa8WqYMCRA+QJ7XkZt+ge/mjGF8jxLbM/fOGAtFLC67waHLQ0ClRk9XmOFt4iX
         3e3A==
X-Gm-Message-State: AOAM532tYBtba4XCdfbVt183UPSOT7dWlxy5M/yqqTJFqJU/wKDd/93W
        x9yOmg+xLTgMG9XWptLjO7U=
X-Google-Smtp-Source: ABdhPJwYzpMZuuHfEVQVi0dDR1Lf3mUn0GL9YiaenC6oCVG07jEOp5GTB0SYlVfputOkkkjLSMdijQ==
X-Received: by 2002:a19:5f43:: with SMTP id a3mr3868266lfj.504.1626362783717;
        Thu, 15 Jul 2021 08:26:23 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.googlemail.com with ESMTPSA id r7sm436354lfr.242.2021.07.15.08.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 08:26:22 -0700 (PDT)
Subject: Re: [PATCH v8 01/14] gpu: host1x: Add DMA fence implementation
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <20210709193146.2859516-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f7d06cec-c930-ba7c-2393-975e2e69e5fd@gmail.com>
Date:   Thu, 15 Jul 2021 18:26:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.07.2021 22:31, Thierry Reding пишет:
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> new file mode 100644
> index 000000000000..06c6b86237bd
> --- /dev/null
> +++ b/drivers/gpu/host1x/fence.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Syncpoint dma_fence implementation
> + *
> + * Copyright (c) 2020, NVIDIA Corporation.
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/slab.h>
> +#include <linux/sync_file.h>
> +
> +#include "fence.h"
> +#include "intr.h"
> +#include "syncpt.h"
> +
> +DEFINE_SPINLOCK(lock);

*static*
