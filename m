Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C6054E49
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 14:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbfFYMFJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 08:05:09 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:33854 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfFYMFJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 08:05:09 -0400
Received: by mail-lf1-f45.google.com with SMTP id y198so12454272lfa.1
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qadH5+nzVEx4R5Bge758kjMglsEaEQxb20mDYvAc9Nk=;
        b=Tgl5EWorIElxYCJ8/Z9ivZktrSnJJ9N/vunRcYwNXCtLgahHZTs7/x44sG1HbPcfga
         iwqZTghzJbk+gQDBc5hw3cOCnFcQFap4WAKDZyfPMqPK5Pt3UDhReUBlmqLPtWA0c0uF
         cWVapDa+6FNYGnXNW9O3y3SC58SZVIDMUAJiiE/Oj+OxlMZ/HZZCqRezINhI7m/1A4M7
         d1zcWuWS2e69tOqhO6nFBBZsQcJjDbjEUEe8uNTlAUo2g+qAdxC9b755jL/VX+9tdSlD
         Qa7AJbs9/tIfKtRNTIFgRFQIff1mMyufZiNUrUxeBhUZxgXj9lmVITqJy+S/eplm8nqU
         euWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qadH5+nzVEx4R5Bge758kjMglsEaEQxb20mDYvAc9Nk=;
        b=IQmUjNvfRQ+EKsfF+WDJbyJWwigT6xH8dTp54K12YY5J1ImyHZUVjvL9LGEwnF7zoa
         9tnJ+D29GTXtnzUA0V4pr4qvwXYbyMXHUtSo8nYhJetmWa83hi7tu9OE8QvZHQfQfXyZ
         fBAEQE4/CWZIi6IongdSDAQ+jgmVf4Kh3u9wuuORDGO0uAzTSepbwy7c76hHlmzD36IL
         8afrbNjOL0NlK9Qft9NxrT2kK7VRUI0f0sN+urdc/3kOYq8OoSuWGpo3IJg7TbQj9p8H
         quJN1SVBZfkbM5AxKGZ2qkvJH4H3mivM550eit/YCCfEAS42FwZmsIRk1u694VJATISw
         U7oQ==
X-Gm-Message-State: APjAAAXEBa7u8FrGwXGmujFff401f2PhpTPyvUfDc6mBr3ZYB+Jyd6YP
        LYLHoS4+385FimyQU62ovPheRw==
X-Google-Smtp-Source: APXvYqynz7kF7NDtkWFbRgZ9ZjI/KLxYVS4SqQXrVIvQYmQdRjihLKqNmSWqzhP/EmodnaevJXzc7w==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr45327556lfq.136.1561464307675;
        Tue, 25 Jun 2019 05:05:07 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id i2sm2224801ljc.96.2019.06.25.05.05.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:05:06 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:49:25 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/5] arm64: tegra: Device tree changes for v5.3-rc1
Message-ID: <20190625114925.qqei4zi2gy3p5rpu@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
 <20190621150206.19037-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-4-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:05PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-arm64-dt
> 
> for you to fetch changes up to a586c88eab65619f3654194dc90d46c98e712af2:
> 
>   arm64: tegra: Enable PCIe slots in P2972-0000 board (2019-06-21 16:06:00 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v5.3-rc1
> 
> This contains the bulk of the Tegra changes this cycle. It has a bunch
> of improvements across almost all boards. These are mostly small and not
> too exciting additions.
> 
> Most notably perhaps is the continuation of Jetson Nano support, which
> is now mostly on feature parity with Jetson TX1.
> 
> ----------------------------------------------------------------
> Jon Hunter (3):
>       arm64: tegra: Fix AGIC register range
>       arm64: tegra: Update Jetson TX1 GPU regulator timings
>       arm64: tegra: Fix Jetson Nano GPU regulator
> 
> Joseph Lo (1):
>       arm64: tegra: Add CPU cache topology for Tegra186
> 
> Manikanta Maddireddy (1):
>       arm64: tegra: Add PEX DPD states as pinctrl properties
> 
> Nicolin Chen (1):
>       arm64: tegra: Add INA3221 channel info for Jetson TX2
> 
> Sameer Pujar (2):
>       arm64: tegra: Add ACONNECT, ADMA and AGIC nodes
>       arm64: tegra: Enable ACONNECT, ADMA and AGIC
> 
> Thierry Reding (18):
>       arm64: tegra: Use TEGRA186_ prefix for GPIOs
>       dt-bindings: tegra186-gpio: Remove unused definitions
>       arm64: tegra: Clarify that P2771 is the Jetson TX2 Developer Kit
>       arm64: tegra: Clarify that P3310 is the Jetson TX2
>       arm64: tegra: Clarify that P2888 is the Jetson AGX Xavier

Thanks for this one. The numerical-to-product mapping is quite opaque.

Merged,


-Olof
