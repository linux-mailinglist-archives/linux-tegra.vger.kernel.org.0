Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C379454FB8
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbfFYNEz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:04:55 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38090 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNEz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:55 -0400
Received: by mail-lf1-f68.google.com with SMTP id b11so12603107lfa.5
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cRndysC5tZBwFl1f51hr7VpFZZmzCH8o6oYJsfMs3yM=;
        b=m/WFRcuzZS1tmQ2AlO3ZtNKIqnr3peZuVx2Zsq0lPk54gEi5XqvwYxYeenErV3qhq2
         V/0qaYt8UpgHxoDJpssiHf317HfeQkK57mIpDEtAlECMzgyixx3RxT4/faN6AbIfous/
         qoNN4AA53zaTgW85dwVSeziSVKDk2pvM/jBgkKErxYoMgS/OxAgcvB9AtOwHWa2PJRRX
         Jn5M0IiV64bvUNlV7hY7vrTo7/GtLozFQgUnYuCA9uP0SIvWmxzUR6vv+btFTDIOAPve
         KIjnijpV+8Uh4Fa3KLUtPOyP4kOVWb5Z46S/2D7kGNOx0t90U58Z/IXo50mhiK9Qr5m1
         pitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cRndysC5tZBwFl1f51hr7VpFZZmzCH8o6oYJsfMs3yM=;
        b=X/bwx1qQCP98g/+xPzHYsJDB2h4NxRqGLNkaldRNiqQuvUDI5tLDZ2oSngkRhBHIOJ
         8YyBDbkcia7fZ9U5cC0bSaHNSVQc/Z9gnnv+N/E9CBoBLxMksjPQ3Fj82AhuKemIHmbo
         SMpvSc12T8KxEeF8dW3llqaovKoC99aAmUMoQ7RkP9X2Kbq2Ih16XNkQ006Jh1JEDZd5
         HEs3Qmh/S0WS/sgiebCxD9IJke0aIrPqyRZWbmLBfOaPVloOI2SIf/DCpmeGgNqhmJX2
         jti/3JqicAgqV8Pa4ptFl+xzujJaBCe3mp8mZMtaSvvhkHe80UKETqMPiAFP2rPExGqC
         xZ7g==
X-Gm-Message-State: APjAAAWxxarq7YqLgnjtJstCFzkAzke2d5BKzgeJjtVKJpqcHn3WXL2h
        HKy3PNYYQa/IsaJdDkYmKpTzkg==
X-Google-Smtp-Source: APXvYqxVRFXZOg5NJcS8n3nsGzOKj7lGN8mtDF0G03/3n+ULiO9n9AbAungimeAWmCUuN0od22Liaw==
X-Received: by 2002:a19:a550:: with SMTP id o77mr25719076lfe.81.1561467893537;
        Tue, 25 Jun 2019 06:04:53 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id s1sm2249465ljd.83.2019.06.25.06.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:52 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:42:56 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/5] soc: tegra: Changes for v5.3-rc1
Message-ID: <20190625124256.qrkwa3gghnfi45yh@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
 <20190621150206.19037-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-3-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:04PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-soc
> 
> for you to fetch changes up to 7ac13f6dcbd59b8f99395588cd7ef31f7e3bd3c6:
> 
>   soc/tegra: Select pinctrl for Tegra194 (2019-06-13 10:44:08 +0200)

Merged, thanks!


-Olof
