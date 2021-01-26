Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF6304670
	for <lists+linux-tegra@lfdr.de>; Tue, 26 Jan 2021 19:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731762AbhAZRXO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 26 Jan 2021 12:23:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:47520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389777AbhAZIXf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 Jan 2021 03:23:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A07422B3B;
        Tue, 26 Jan 2021 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611649375;
        bh=72qZ8gbvg9oeqxzqvko3njlFMuFWEA/eHkwzkMYw3QI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xBcUTk64UXDBz0H7S2BoGSY22BL6SZ1hMgbMnYm/VIaCkDYljw0Dfqj/AMU8GJRFP
         rwPYUFbnYhSL27Bdh9uYWGkLWKijSfgPfJQyOCwXrdhzWAxQjOQWMYj19DRpVbOeDm
         Lj2wEuu3mZNHnY63nzCU7KFyyW/u1Dui2KlXPrmA=
Date:   Tue, 26 Jan 2021 09:22:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com
Subject: Re: [PATCH v2 0/2] of: property: Add fw_devlink support for more
 props
Message-ID: <YA/RXVNiO8Hj3d5c@kroah.com>
References: <20210121225712.1118239-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121225712.1118239-1-saravanak@google.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 21, 2021 at 02:57:10PM -0800, Saravana Kannan wrote:
> Sending again because I messed up the To/Cc for the coverletter.
> 
> This series combines two patches [1] [2] that'd conflict.
> 
> Greg,
> 
> Can you please pull this into driver-core-next?

Now queued up, thanks.

greg k-h
