Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F1D1440AB
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Jan 2020 16:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgAUPlF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Jan 2020 10:41:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:34022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729134AbgAUPlE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Jan 2020 10:41:04 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EED8622314;
        Tue, 21 Jan 2020 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579621264;
        bh=xtAA8JLKZxKLNCT5HJ4l/7Is0LVHRkLVFznF3Lm6c6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MsLcjvNrhNneHT6h/NsGU0L2bu3iTSaeR2GK+srNwZAjTe/vmdzu9A7c3b8P+zOwA
         Pkj67J2Wj+3qXsvKNFRpqLY/uNAx6z1akEv13ooAGf2jxjwt7uJbVyvzllB/TlEDBd
         wQV+BKE5xihmFONQS0o/BaYy1qMNZeJLiQrngu2s=
Date:   Tue, 21 Jan 2020 16:41:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Jiri Slaby <jslaby@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jeff Brasen <jbrasen@nvidia.com>
Subject: Re: [PATCH] serial: 8250_tegra: Create Tegra specific 8250 driver
Message-ID: <20200121154102.GA588392@kroah.com>
References: <20200120160149.29072-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120160149.29072-1-jonathanh@nvidia.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 20, 2020 at 04:01:49PM +0000, Jon Hunter wrote:
> diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> index f16824bbb573..432b47647677 100644
> --- a/drivers/tty/serial/8250/Kconfig
> +++ b/drivers/tty/serial/8250/Kconfig
> @@ -500,6 +500,15 @@ config SERIAL_8250_PXA
>  	  applicable to both devicetree and legacy boards, and early console is
>  	  part of its support.
>  
> +config SERIAL_8250_TEGRA
> +	tristate "8250 support for Tegra serial ports"
> +	default SERIAL_8250
> +	depends on SERIAL_8250
> +	depends on ARCH_TEGRA

No COMPILE_TEST support so we can make sure we don't break the thing
somehow?

thanks,

greg k-h
