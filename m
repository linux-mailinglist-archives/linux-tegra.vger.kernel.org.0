Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6737A80F0
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2019 13:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDLMS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 07:12:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727768AbfIDLMS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 4 Sep 2019 07:12:18 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8589C2339E
        for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2019 11:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567595537;
        bh=33tbfCPtauBzuO4BVabEs4rjRs4cHUDtbZTvvQi8PjQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ombVC2GgGsUtf17NPNaHa4qqyfMRBEFbTsfFos3gmPaRfSfAdi4M9cPfgf450V/W0
         jctxkNbn3MQBedxJD2g9c21GVhlHNK9psFyq5PR0JoDaHFq1b6RkBGA2rk5u2b0cz2
         B7fKJDhihbKEjZvmeLpo46eGo35CgVGmL9TD8dwU=
Received: by mail-qt1-f170.google.com with SMTP id r5so18612100qtd.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2019 04:12:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVL9o9XAw/M0Icp7tsxTaUj5Wr9zGeTERJ0YCNHJtW2IeAk0hZZ
        8e6zX26ISHlWOR1fKFXQ416fMkRbIOzEuHWZl/8=
X-Google-Smtp-Source: APXvYqwlLuJ5kHD0QTumP8CBJ71CaOyMu0UExNxb7rBZVBwXBUyGWQ49ej1R9dzWm4vHEZYFGVWtg9XJN9Ci5wU/ie0=
X-Received: by 2002:ac8:549:: with SMTP id c9mr38178094qth.223.1567595536724;
 Wed, 04 Sep 2019 04:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190830102347.7639-1-thierry.reding@gmail.com>
In-Reply-To: <20190830102347.7639-1-thierry.reding@gmail.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Wed, 4 Sep 2019 07:12:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5LXaffgEym087S6jeOjVz4n67b61Dz9e=ObMP88yQUTg@mail.gmail.com>
Message-ID: <CA+5PVA5LXaffgEym087S6jeOjVz4n67b61Dz9e=ObMP88yQUTg@mail.gmail.com>
Subject: Re: [PATCH] nvidia: Add XUSB firmware for Tegra186
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

On Fri, Aug 30, 2019 at 6:23 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Add a firmware file for the XUSB controller found on Tegra186.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  WHENCE                   |   3 +++
>  nvidia/tegra186/xusb.bin | Bin 0 -> 124416 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 nvidia/tegra186/xusb.bin

Applied and pushed out.

josh
