Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B28DC4F
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfD2G4G (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37258 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id h126so7091051lfh.4
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PlFBUhtDp3twaleN7AWp9dOy5vz82QcC368RhcPcaTw=;
        b=ELa7wCsH0JiOJ8MNnzzRVR0XvEYizCyh14cP6/0xPDz4VHKAGiJOhbQpMJdm5eVp1c
         MD2+6a7mZHFtY7Aib719TrMURvySUrAICTZ7QoYErOZQ2tzzLES3/AHkafdSxgkScJTv
         miUpUPq74edJltb+FPI2bPr2hNqY+PeW/x2RDeykMTgJOpCsFX1rmjXZkSPXBiYM/LaA
         5cJFy2mh0e0R5J4m7H7mk06soVNc8rySKXd2r8Sju7JAXIkyMwpk4RaRZBQRUVl3qaGx
         ycMkS9JQDEd68qLbk5QQKPzvNq65LnPko9jnNH38xlBmu8PRVyzwRjPLb9ZorYe6KbJl
         JLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PlFBUhtDp3twaleN7AWp9dOy5vz82QcC368RhcPcaTw=;
        b=ImDakq/Lo6aEgSRH9oV3YVIVwMahVMTBQC2Kcs6EQVWLbrcr5kUcMES341he8mEdQf
         F41GGj0Ypz2AsTvAM1ulipTypbefO2lQ2J0I4j5FqvRp6J+bB2c6VcdH8ZiN8ptZvDsa
         r1PJK0L+AA68s0TK9C54DrtAdqnPC0Chbi5V/WdAh6b4ZGgXlQotf3wt1F/2EyIr8eAD
         6a4rLlmDsdaciJTK0AEUgHhqzNXoDns8ElW0gl73vaoTjLtcK3ccGlhXSzdimb84N7WD
         l3h3disnQhbPjvDYW5cozGQ+cXfDHLPielBBIcyzQQuHK57aPvxVNsl62kOx/mhmOiGj
         KxOw==
X-Gm-Message-State: APjAAAXhIccR20yFhfgwIL+I/rotKBxjs+FMlTWqbO2Uo1Nnw30LUC3+
        ZqaROR8HkmV1jp3pL4x41aeO1w==
X-Google-Smtp-Source: APXvYqy/UqLsEM8v9JREyKlmu+5MRUOCdqwm/iq2NOkFHI/BWUxtIeR/THPLu890su3J5nANjyBPgw==
X-Received: by 2002:a19:4f19:: with SMTP id d25mr22056399lfb.124.1556520964244;
        Sun, 28 Apr 2019 23:56:04 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id c17sm5060681lff.84.2019.04.28.23.56.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:03 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:35:24 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/9] memory: tegra: Changes for v5.2-rc1
Message-ID: <20190429063524.leg3na2mcbxxz5qy@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-4-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:15PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-memory
> 
> for you to fetch changes up to 67a8d5b0fadfd931f7e6a78e9ee7b2792a7114aa:
> 
>   memory: tegra: Fix a typos for "fdcdwr2" mc client (2019-04-18 11:51:17 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> memory: tegra: Changes for v5.2-rc1
> 
> These are a set of fixes for various issues related to the Tegra memory
> controller.

Merged, thanks.


-Olof
