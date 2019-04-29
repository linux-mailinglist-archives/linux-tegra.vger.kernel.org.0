Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA56DC52
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Apr 2019 08:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfD2G4M (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 02:56:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46507 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2G4M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 02:56:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id k18so6929163lfj.13
        for <linux-tegra@vger.kernel.org>; Sun, 28 Apr 2019 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/RDzQlkBTEqOpH90yxgTGof1Un7bQfe8w9/CRuMdT+I=;
        b=exBRdwcbSzKYCFcHweKcVA/huFqeLe9UQWVdGvrgfxmislKrzVDXm1d+E0/Ikxegui
         VJSgXBu3v/pdjfaCpmuXH8hvxrjnAVegGO+aGmU9IWrvkAlTq40zQJAB9ch1DsTe8Ars
         5M34M9OeclpXuWdskb7t9PhGibeLr/+etjd7sn2W6Ig81ZrzV+vcmVrrCzZjfbFvtZUt
         GUvcI/Me3cAO/sO/coXiqKg+N67XNXdL3sDVkAWDB/BnBGpyodkRmEO6VCoAYAUPzAUJ
         Tnr0NwDYdGZOamopxLHNowycRPBgBm5jouBX0ZNQ1v+XX0WdLyaHcLs/AELQ86pJyWXn
         AWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/RDzQlkBTEqOpH90yxgTGof1Un7bQfe8w9/CRuMdT+I=;
        b=HtvLVIxhCDK0AY/q3siXaIJ/giWQ+b7qdZm8cF5T1/pVammIbHABYuchsNKmNCS3RB
         jqFTF+ff+c5D6XBzAuACTkeE+r4akXOM6jwYoPD0kD6KQgpOLSmsyPy8l8sTADpNYuNH
         xyGhWAZMziLaw6kZIm7al8whqmQk4i7+wNHwH1BAy4aWBNsQxu6JeWtXKY7VfCw3Vf/P
         +jQQhmczYHaYU7G5Z16/Xdh3q77ghxhwMxEBrZTwa94GFsVi3XNRqx28qr2hY3e8MALI
         cKcPX+0mj/m5HdTzagPD5CPgT8KtvHwhHKheXRJoq90NfTeuSlRZWt3axCPdyryjx1o5
         NY1g==
X-Gm-Message-State: APjAAAW1ELlsC3oZQH6qclY5IefCQII9JzLbamRvPuf/GotdTD2CWbWS
        B9Tk4sN+4fune+Ubm5BtzMbiLw==
X-Google-Smtp-Source: APXvYqwlpThgXrnAVkvf1o+jKXzUAuh3CfFPGnuljcqlvZ7oWL6vWIlJ95cNEi6F7SvXamvlqkJKjA==
X-Received: by 2002:ac2:5c09:: with SMTP id r9mr9199030lfp.104.1556520970730;
        Sun, 28 Apr 2019 23:56:10 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id v26sm6700529lja.60.2019.04.28.23.56.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 23:56:09 -0700 (PDT)
Date:   Sun, 28 Apr 2019 23:37:12 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 9/9] arm64: tegra: Default configuration updates for
 v5.2-rc1
Message-ID: <20190429063712.dqk443wbv5jkzmqy@localhost>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
 <20190418150721.8828-9-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190418150721.8828-9-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 18, 2019 at 05:07:20PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-defconfig
> 
> for you to fetch changes up to bd9ae25314f275cea87a20db11756f32ed88dc15:
> 
>   arm64: defconfig: Add PWM Fan support (2019-04-03 18:41:07 +0200)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> arm64: tegra: Default configuration updates for v5.2-rc1
> 
> These patches enable PWM fan and Tegra HDA support in the 64-bit ARM
> default configuration, so that these features are enabled by default.

Merged, thanks.


-Olof
