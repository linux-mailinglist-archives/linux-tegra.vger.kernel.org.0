Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88562790F0
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2019 18:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbfG2Qdc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jul 2019 12:33:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36988 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729116AbfG2Qdb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jul 2019 12:33:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so27738735plr.4
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jul 2019 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OZSRVaoM+0+WmVEymEml5vQPpYtYXaF0mFy6wxL1q74=;
        b=mZGupuQMoQYHI+QnKYUZdMKrRhU3YvfrCNNs6q6RO4lI2b5TDHy+xIzq6HsrC0/IA+
         0EXUwzeCErYJ4pWYl5ih/unhL3xIc4hwKGc2lCX1jP190DhVD0a0eX/06alHjUbtVRWk
         HkCm0cSpCmBNddCI6mRINbdIO4KoWEKeV+gi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OZSRVaoM+0+WmVEymEml5vQPpYtYXaF0mFy6wxL1q74=;
        b=ikRMF1hDzV1x+RqNPGsQgaG9cZCUEObg8YmKui86B13S4PxAKl8xAEMvpYvUsQDsvZ
         6UAZr+myNtOvoXPhOvMpO3mEF7YKCgth+QdlbYMzvDrlhRNJ2Psibz3JTjOkjyK4dEdE
         Q6IYAjCKHs9dF4dD9D6GIAw8qhJphdPmbpjcxiLZKQpgcxKC1/oLAMDo7NBzHdqtE9yL
         2GTPsA7IVosVDAjUA6Qe8KeBiiEKyxjdDnmWOg47yLYxPOxg6gcAr0mpnNV0TEq2lGYN
         gbrV9Durjzuqp2ETFZ8c++vHpYLEE6k+xRk94738WwkaFYCTyKu7Z4tsLdVuV4NGUM0r
         914Q==
X-Gm-Message-State: APjAAAVbR1jKoRJLQ9coXLuAvWWFSAN7JODkyES03eE+d+yvfndsA1j1
        /r626VNcIX0WknLCsUNCN9ZJD7zTNE0=
X-Google-Smtp-Source: APXvYqzFZvyeg4iqQvDoi5IW5U+rEL+TBAqu8DV6miguhTKiPv/OQfHqkaRDVvNhv1RWGgk5GEEHnw==
X-Received: by 2002:a17:902:2889:: with SMTP id f9mr105224391plb.230.1564418010852;
        Mon, 29 Jul 2019 09:33:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id cx22sm51949300pjb.25.2019.07.29.09.33.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 09:33:30 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:33:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] ARM: tegra: Mark expected switch fall-through
Message-ID: <201907290933.7D54BDAB@keescook>
References: <20190728231526.GA22066@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728231526.GA22066@embeddedor>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Jul 28, 2019 at 06:15:26PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning:
> 
> arch/arm/mach-tegra/reset.c: In function 'tegra_cpu_reset_handler_enable':
> arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    tegra_cpu_reset_handler_set(reset_address);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-tegra/reset.c:74:2: note: here
>   case 0:
>   ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> index 5a67a71f80cc..76a65df42d10 100644
> --- a/arch/arm/mach-tegra/reset.c
> +++ b/arch/arm/mach-tegra/reset.c
> @@ -70,7 +70,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
>  	switch (err) {
>  	case -ENOSYS:
>  		tegra_cpu_reset_handler_set(reset_address);
> -		/* pass-through */
> +		/* fall through */
>  	case 0:
>  		is_enabled = true;
>  		break;
> -- 
> 2.22.0
> 

-- 
Kees Cook
