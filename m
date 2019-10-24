Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A226E3AC1
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 20:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440070AbfJXSPp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 14:15:45 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:61446 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440069AbfJXSPp (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 14:15:45 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 46zb314n99zGW;
        Thu, 24 Oct 2019 20:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1571940815; bh=WfK3oNRN9I+lZk7Ynfr6EoWEBKeS93r2cKUaykOWzBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JpDoSLD8LF+A5WvE5GU8PBfT5AWzy3mrbMKuYNder3zSLAG0B792FthNpp2u8qoZh
         PfomgVRwejEceNosl+4/BZDARKQ58nb7Cb6XY8NicA4yuQK+tBH0RH+I2AB8mge4Lx
         c8k39GgeRU1qt4cgJv0ef4OBnHXK+AeCWJ+3TVVKWFe9cCn4vFqNxMZiLaD1W+vWcV
         x944X9iu5IEcOIWGGJU7wByPyfGiZje1W+Ad0XrvsNr48y30n80JT5wxCmDQ80Mof5
         7R5TZ32qJzQgB4Sti+0ovOemOvFVLi4EX170UUcqibdYGR0/7Q86tUlZE571gy8h2x
         TxazcwXei+0lQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Thu, 24 Oct 2019 20:15:39 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload()
 callbacks
Message-ID: <20191024181539.GA31268@qmqm.qmqm.pl>
References: <20191024173137.290420-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024173137.290420-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 24, 2019 at 07:31:37PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ->load() and ->unload() drivers are midlayers and should be avoided
> in modern drivers. Fix this by moving the code into the driver ->probe()
> and ->remove() implementations, respectively.
> 
> v2: kick out conflicting framebuffers before initializing fbdev
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Micha³, Dmitry,
> 
> do you guys have a way of testing that the removal of the conflicting
> framebuffer actually works?
[...]

I might be able to check during the weekend. Is this patch alone enough
for v5.3?

Best Regards,
Micha³ Miros³aw
