Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61D3CC602
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Oct 2019 00:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfJDWoj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 18:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728023AbfJDWoj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 4 Oct 2019 18:44:39 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99C38222C0
        for <linux-tegra@vger.kernel.org>; Fri,  4 Oct 2019 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570229078;
        bh=nZAHy2llIPMTGmsJ6yxJNu4iVcywsInR04NMtwk50v4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J6dorogGYPDlq/nF5TVR9lIOfEuTgqAqswSj6mosMSGYY6DTG7FHKjaFeKYN27cQo
         hzeOKqhCJeYTpW2c66cSseT5+g0Xpg+I6JlDWbaTzz4MXKMDD1703aYJdBPFAWcTW7
         +zYT9VqHMb9TOm9TqLyhRxDjhes4ttxr3DV4K3z8=
Received: by mail-qk1-f178.google.com with SMTP id u186so7330219qkc.5
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 15:44:38 -0700 (PDT)
X-Gm-Message-State: APjAAAWaGS0DqN0LIQF6bqvhO3HGkzc91sZHStwX6dgPfjid0ag8KV0X
        bR5OwMUsWYaPMXMpPyj/1SQIHUO9gc6NGxelMvM=
X-Google-Smtp-Source: APXvYqzYv5TKxTpZnudfn97cZqR9CvJAzOXQaePcEsi8P0PSbY3gyurHP2++YA0TCRQBz8PVqWA/c6YITHcodQ1/jv0=
X-Received: by 2002:a37:5943:: with SMTP id n64mr12117101qkb.95.1570229077752;
 Fri, 04 Oct 2019 15:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190930112307.1576028-1-thierry.reding@gmail.com>
In-Reply-To: <20190930112307.1576028-1-thierry.reding@gmail.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Fri, 4 Oct 2019 18:44:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA78mbBs20hrvaniAZEtpK6iCt6n5bnshWW0YBC0CcQTsw@mail.gmail.com>
Message-ID: <CA+5PVA78mbBs20hrvaniAZEtpK6iCt6n5bnshWW0YBC0CcQTsw@mail.gmail.com>
Subject: Re: [PATCH] nvidia: Update Tegra210 XUSB firmware to v50.24
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        WK Tsai <wtsai@nvidia.com>, Jui Chang Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 30, 2019 at 7:23 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> This version of the Tegra210 XUSB firmware contains a number of fixes to
> improve compatibility with various devices.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  WHENCE                   |   2 +-
>  nvidia/tegra210/xusb.bin | Bin 132608 -> 124416 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

Applied and pushed out.

josh
