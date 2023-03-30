Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC566D0572
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Mar 2023 14:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbjC3M4I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Mar 2023 08:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjC3M4H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 08:56:07 -0400
X-Greylist: delayed 288 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Mar 2023 05:56:03 PDT
Received: from 189.cn (ptr.189.cn [183.61.185.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 81AFE9EE0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 05:56:03 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.41:36838.2030003269
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 42AF21002D0;
        Thu, 30 Mar 2023 20:51:09 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id 707a019a36a149f39a2400387eff1434 for tzimmermann@suse.de;
        Thu, 30 Mar 2023 20:51:11 CST
X-Transaction-ID: 707a019a36a149f39a2400387eff1434
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
Date:   Thu, 30 Mar 2023 20:51:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [1/7] drm/tegra: Include <linux/of.h>
To:     Thomas Zimmermann <tzimmermann@suse.de>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230330083607.12834-2-tzimmermann@suse.de>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230330083607.12834-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn 
<mailto:suijingfeng@loongson.cn>>


On 2023/3/30 16:36, Thomas Zimmermann wrote:
> Include <linux/of.h> to get the contained declarations. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tegra/output.c | 2 ++
>   drivers/gpu/drm/tegra/rgb.c    | 1 +
>   2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index a8925dcd7edd..d31c87f48da0 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -4,6 +4,8 @@
>    * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>    */
>   
> +#include <linux/of.h>
> +
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index ff8fce36d2aa..3f060282cd8d 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/of.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge_connector.h>
