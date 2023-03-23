Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479A46C6D49
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Mar 2023 17:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjCWQW1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Mar 2023 12:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCWQW1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Mar 2023 12:22:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175411BF3;
        Thu, 23 Mar 2023 09:22:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62514627D4;
        Thu, 23 Mar 2023 16:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C394C433D2;
        Thu, 23 Mar 2023 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679588544;
        bh=Sid02gzTwcBopRlR0kRgR8xjTonKSXZAexlKg5yW1wU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JNHSACK9OeqYjJGRSaeN94AHvKFYYciyM3CwnOOMo214VbKN1UcXyLTEA64oU5NDG
         51tBZfTJ0yap5J7cEQdirXYjXmUvOAK49PN2hgjLr8Ps8XMWXAk5IijjyV2fzchmXX
         WfHw0Tp2qLtr24zOcTcBxQlsxmnePwjfLdYW5Dss=
Date:   Thu, 23 Mar 2023 17:22:22 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Haotien Hsu <haotienh@nvidia.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH v4] usb: xhci: tegra: fix sleep in atomic call
Message-ID: <ZBx8vliqQVqdK/Pn@kroah.com>
References: <20230321072946.935211-1-haotienh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321072946.935211-1-haotienh@nvidia.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 21, 2023 at 03:29:46PM +0800, Haotien Hsu wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> When we set the OTG port to Host mode, we observed the following splat:

What "OTG" port?  That is not a USB thing anymore at all.  How is this
part of a xhci controller?

> [  167.057718] BUG: sleeping function called from invalid context at
> include/linux/sched/mm.h:229
> [  167.057872] Workqueue: events tegra_xusb_usb_phy_work
> [  167.057954] Call trace:
> [  167.057962]  dump_backtrace+0x0/0x210
> [  167.057996]  show_stack+0x30/0x50
> [  167.058020]  dump_stack_lvl+0x64/0x84
> [  167.058065]  dump_stack+0x14/0x34
> [  167.058100]  __might_resched+0x144/0x180
> [  167.058140]  __might_sleep+0x64/0xd0
> [  167.058171]  slab_pre_alloc_hook.constprop.0+0xa8/0x110
> [  167.058202]  __kmalloc_track_caller+0x74/0x2b0
> [  167.058233]  kvasprintf+0xa4/0x190
> [  167.058261]  kasprintf+0x58/0x90
> [  167.058285]  tegra_xusb_find_port_node.isra.0+0x58/0xd0
> [  167.058334]  tegra_xusb_find_port+0x38/0xa0
> [  167.058380]  tegra_xusb_padctl_get_usb3_companion+0x38/0xd0
> [  167.058430]  tegra_xhci_id_notify+0x8c/0x1e0
> [  167.058473]  notifier_call_chain+0x88/0x100
> [  167.058506]  atomic_notifier_call_chain+0x44/0x70
> [  167.058537]  tegra_xusb_usb_phy_work+0x60/0xd0
> [  167.058581]  process_one_work+0x1dc/0x4c0
> [  167.058618]  worker_thread+0x54/0x410
> [  167.058650]  kthread+0x188/0x1b0
> [  167.058672]  ret_from_fork+0x10/0x20
> 
> The function tegra_xusb_padctl_get_usb3_companion eventually calls
> tegra_xusb_find_port and this in turn calls kasprintf which might sleep
> and so cannot be called from an atomic context.
> 
> Fix this by moving the call to tegra_xusb_padctl_get_usb3_companion to
> the tegra_xhci_id_work function where it is really needed.
> 
> Fixes: f836e7843036 ("usb: xhci-tegra: Add OTG support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
> ---
> V3 -> V4: Remove copyright change from this patch
> V2 -> V3: Add version information
> V1 -> V2: Add "Fixes" and "Cc:" lines and update copyright years
> ---
>  drivers/usb/host/xhci-tegra.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 1ff22f675930..b40e897ec092 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1360,6 +1360,10 @@ static void tegra_xhci_id_work(struct work_struct *work)
>  
>  	mutex_unlock(&tegra->lock);
>  
> +	tegra->otg_usb3_port = tegra_xusb_padctl_get_usb3_companion(
> +							tegra->padctl,
> +							tegra->otg_usb2_port);
> +

You have 100 columns, please use them, ending a line with "(" is not
generally a good idea.

thanks,

greg k-h
