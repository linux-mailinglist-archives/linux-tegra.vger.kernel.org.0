Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7127054FB7
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbfFYNEx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:04:53 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37524 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfFYNEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:04:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id d11so12588288lfb.4
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QvCzs2OEz28t37MaYhx6njYcchjdmn9fO6I52zy4pLQ=;
        b=pUzsJ95bnukiZaC6ETnrYJf0XDBNJQSFx43LsEpntqF/4fSmvl88ibd9V1fH/bsI4S
         ubo1bYawtjEFz+Vx3LLmcuIBGsIg3YzjeRtVxiqWa5TuJHjtDn4qZ/qPs/AmmshSIj2+
         Z0ARoAdD+eg8FzBQ/E8i9LIiS3rAzJpRzM5JvK0jY/+04L47WkIVkB9e0iiAY0foky89
         3p7xcVYAY2zPg7fBD8at7Q/VvOtTO9dnE11L0gtu76CpSpTxSWFLtQDw8YxgHOV0LuYh
         0wl6v032yVspjaEiYk2GjtlVjQR7z8e8dVihupDYaZ02Lo7T7uzUb6rKHj8rPSLQWcHd
         IxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QvCzs2OEz28t37MaYhx6njYcchjdmn9fO6I52zy4pLQ=;
        b=ggmX59a89aTLzV3yH39BQZxW9qLv1rhBpcGIbVN6rBTPgSfcWkSOVIelRX/iTyeV3A
         W8ATbgTywinZAKSdnWS9JXHseBLFscY+bJwopnInujIZvVA9ZRuOtChg7JBWww/L/ao2
         LNFmJGr9ie1uOnWcBHxggV6u/YmUsbPc2new9u+O1+cxmm8S92UBciadpcY2u0TN7SiT
         R0wRi3EiK63dHqIaDeCcCgu0bpM5NYOwKX+AHyW/L/WEJasZ1hhxl1Qo3TKkcTYLK6AY
         zHtNVDCMiRPNSaYlg3JbGzy5fBwJFDkNHBkPtCwqW4em36duSxFDlWvz+ncNsfjO1E3W
         mqRA==
X-Gm-Message-State: APjAAAXMMrVHFxsYITgCN5ZM9EIN+De/GUsvlpD6BBRQzhBzdnj2iYs9
        8Pfl/P0Wl7ky51KXXtFx0uBK1g==
X-Google-Smtp-Source: APXvYqzk6gFyl/+6p+l3Zvw1nCvlVtLXhDzbDr8R9gC/2x2W7zJUNcB/bh1iPz7b10i641kGXmCGzw==
X-Received: by 2002:ac2:43b7:: with SMTP id t23mr30136867lfl.110.1561467891248;
        Tue, 25 Jun 2019 06:04:51 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id y18sm2262581ljh.1.2019.06.25.06.04.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 06:04:49 -0700 (PDT)
Date:   Tue, 25 Jun 2019 05:42:24 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 2/5] memory: tegra: Changes for v5.3-rc1
Message-ID: <20190625124224.dyccwpfgv2b3b4vo@localhost>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
 <20190621150206.19037-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621150206.19037-2-thierry.reding@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 05:02:03PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-memory
> 
> for you to fetch changes up to 76ce48bdb303afa6e33cfbadca9d6bee23a4f559:
> 
>   memory: tegra: Fix -Wunused-const-variable (2019-06-14 18:02:02 +0200)


Merged, thanks!


-Olof
