Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4213CC601
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Oct 2019 00:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbfJDWn5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 18:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:48608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728023AbfJDWn5 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 4 Oct 2019 18:43:57 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 479B820873
        for <linux-tegra@vger.kernel.org>; Fri,  4 Oct 2019 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570229037;
        bh=9DltmXaeb5wm6mzgPJs+9U3WuF+V/fGhPq4TCIrvKYI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qUTp6aECF0kxmRPTF8nbqMmvVxbOAJBTVGHhjWQBCRReOsEo7DV7QE+edI/jqbPRs
         mC29jfDfLV02j0diw02R1TgUeCv7UpUHUphf/bKwpT30v+J7A9JBntARPD/bP2Wdf6
         aDizU9ZKjO7lhvL146BNU6YDyRQibHq2uw2MHsfg=
Received: by mail-qt1-f182.google.com with SMTP id c21so10699519qtj.12
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 15:43:57 -0700 (PDT)
X-Gm-Message-State: APjAAAXdapKkWtb236VvLsclOxNx4fPGMDbBbB0mxSdBac/6Yy04a4MS
        XOpdOYmImgEWG45SclC1XAmS0FbAtPWlfPEnQyQ=
X-Google-Smtp-Source: APXvYqw4+DrQ20h4g03YSf2zB17R4oqkn2iEaJNdabjnNRBld0xMzzHt1hLL/XY5RKnjrX0hRE8LHq48yOhnpDCzLPM=
X-Received: by 2002:a0c:8828:: with SMTP id 37mr16864264qvl.44.1570229036432;
 Fri, 04 Oct 2019 15:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190930111907.1575496-1-thierry.reding@gmail.com>
In-Reply-To: <20190930111907.1575496-1-thierry.reding@gmail.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Fri, 4 Oct 2019 18:43:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7YufwXi7rSNa2P4y_8z2bryS4wEg-GBeD3=5Gom-t=Hw@mail.gmail.com>
Message-ID: <CA+5PVA7YufwXi7rSNa2P4y_8z2bryS4wEg-GBeD3=5Gom-t=Hw@mail.gmail.com>
Subject: Re: [PATCH] nvidia: Add XUSB firmware for Tegra194
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

On Mon, Sep 30, 2019 at 7:19 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Add a firmware file for the XUSB controller found on Tegra194. This is
> version 60.06 of the Tegra194 XUSB firmware.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  WHENCE                   |   3 +++
>  nvidia/tegra194/xusb.bin | Bin 0 -> 124928 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 nvidia/tegra194/xusb.bin

Applied and pushed out.

josh
