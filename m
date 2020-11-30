Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA9C2C884A
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Nov 2020 16:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgK3PiK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Nov 2020 10:38:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:43516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728156AbgK3PiI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Nov 2020 10:38:08 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9140020725;
        Mon, 30 Nov 2020 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606750647;
        bh=17KfgSyzR01zJgRuyyJ5oyibbOOrqhUpARQ2iG03vzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJNutTENGTfuQZKw+RIkJji45vVDS0Hs2s8Pj9ywQt1eR04niSRjPljQh+4gAV2r9
         6HAB/eBcla8On1Epw0kdke1h56rbDGFn7QSaGzP9OIVZpJwakNOxhw/NZU+pXhSDfn
         t5E8q4ZfpimAViGKrVNf0/MSERKyv2wEwK8yngnA=
Date:   Mon, 30 Nov 2020 21:07:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     kishon@ti.com, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        nkristam@nvidia.com
Subject: Re: [PATCH v1] phy: tegra: xusb: Fix usb_phy device driver field
Message-ID: <20201130153722.GU8403@vkoul-mobl>
References: <20201117083803.185209-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117083803.185209-1-jckuo@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-11-20, 16:38, JC Kuo wrote:
> In commit "phy: tegra: xusb: Add usb-phy support", an OTG capable PHY
> device, such as phy-usb2.0 device of Jetson-TX1 platform, will be
> bound to the tegra-xusb-padctl driver by the following line in
> tegra_xusb_setup_usb_role_switch().
> 
> 	port->usb_phy.dev->driver = port->padctl->dev->driver;
> 
> With this, dev_pm_ops set of tegra-xusb-padctl driver will be invoked
> for the OTG capable PHY incorrectly as below logs show.
> 
> This commit fixes the issue by assigning an empty driver to it.

Applied, thanks

-- 
~Vinod
