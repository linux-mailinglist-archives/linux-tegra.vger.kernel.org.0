Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04DCDC4D
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfD2G4C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45612 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id t11so6943893lfl.12
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tEqn3gRq2iO0WysQSnGCYtPoRZRfZMB5vNk6Yq3+80w=;
        b=BGxG3j68eApzoCjluXLFyQAi5/m++6x/05Ydcsv+UJ5iTN1+2LZ0oLNxPrBUIk0az1
         3UYX3lytlc6hwoTY4SIGmMf96JrI9SZw1nptdPxqyoPJh25q0bdfa1dux/mCqtD5L+iL
         G2uH8A5AGT9i7Q0F2xCldADXEo/j4Raq5mZQeREzkASQuo/uU8LveIjFSWCMmNkB6mjE
         +qcw6YEBf2FcHQaRCv6RQL8kTdXrhEdTzUFA4g+Sq87mQZEKpDJM6nsvZn9huqx33XSk
         lPu/fIdvLeAihmdGnsEoHi+3ynQOYr4PstL7u7NFGTFbjNdmFqAE9i5bUCx9BB1iqCYe
         haVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tEqn3gRq2iO0WysQSnGCYtPoRZRfZMB5vNk6Yq3+80w=;
        b=iilfg2HNSEAJS596/gMSYL5OItczSzlILL5PmYB9ePSWetLYdXGoQ2ZKuKHk6CYIFN
         U5B5YzSP25ks/nqBfl8zv6qPeeLnZcyxeIf8lw1RXRm/mhOAjcrQP9L7JfJz9E4/vkNw
         2HcJgdEu/lJU5nXgG4jJfSrCUJ7FguLn8YvjGm5yNVM+I8ddjYtUV7e+2bdTJ6AMPT+N
         BVVBlh50groF+aPYbUR9HN3yu126Blthhxx69bjX8N4jTEf1cmqRnw9LjiksC1pq2Jlw
         96e4jR6r6DOrUVLLAiWQCeR3BQL05T1cllNdfdbaaWlsVYamj2qs3fsD/gorULZacEU7
         cwkQ==
X-Gm-Message-State: APjAAAVmnimTFgyoa4ILh/KF1QaDGXLROA4xCkQaRrXnUiY4Aks2zAN9
        eWT72PEfOyqFQigebvPxxNkjhQ==
X-Google-Smtp-Source: APXvYqyONLz+ydzq1gx8gj0kiLL8dzPC3QxRWmG34/CqoH+UtHcoGz8en1hNvHGNII55RpeOByukFw==
X-Received: by 2002:ac2:5582:: with SMTP id v2mr6583575lfg.19.1556520959851;
        Sun, 28 Apr 2019 23:55:59 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id f25sm7181226lfc.46.2019.04.28.23.55.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:55:58 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:34:19 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/9] soc/tegra: Changes for v5.2-rc1
Message-ID: <20190429063419.b2tihej6inebdpu3@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-2-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:13PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-soc
> 
> for you to fetch changes up to 6ac2a01de1700c1b6d889f02f61c4c9602573a8d:
> 
>   soc/tegra: pmc: Move powergate initialisation to probe (2019-04-17 10:32:33 +0200)
> 
> Note that this pulls in a stable branch from Philipp for the core
> acquire/release protocol changes to the reset framework.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> soc/tegra: Changes for v5.2-rc1
> 
> Besides a couple of fixes to better cope with deferred probing, this set
> of patches also implements the acquire/release protocol for resets used
> during powergate operations. This is necessary to allow these resets to
> be temporarily shared with other devices that may also need to control
> these resets.

Merged, thanks.


-Olof
