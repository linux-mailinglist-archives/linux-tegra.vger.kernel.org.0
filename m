Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039AB22B22E
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Jul 2020 17:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgGWPJo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Jul 2020 11:09:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726894AbgGWPJo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jul 2020 11:09:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C48820771;
        Thu, 23 Jul 2020 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595516983;
        bh=teC3dGC99OxdwvHAe8GtHtNZ4hOO7NgZK6TcDdn31xM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LrAQnjA0Sp65bh4VCob4yLvZVzlbZwjyPMBZDMxzK/m15ftz4So9AQxl2fil8gBgQ
         ctdoYj9jcekqFB+6XytWekiIq+xxjJ0daUKvCaxqPzL5zdm5H+PM2Xepa+aJxLTayl
         CbpJcMQN7+2Vo74zslFsVsrWY+4VNA84G5VN3BCw=
Date:   Thu, 23 Jul 2020 17:09:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        ac100@lists.launchpad.net
Subject: Re: [PATCH] change slave occurence to secondary everywhere
Message-ID: <20200723150947.GB2694233@kroah.com>
References: <20200723145811.21109-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723145811.21109-1-bharadwaj.rohit8@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 23, 2020 at 08:28:11PM +0530, Rohit K Bharadwaj wrote:
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>

I can't take patches without any changelog text :(

