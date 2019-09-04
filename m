Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4316EA80E9
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2019 13:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfIDLJp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 07:09:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:42380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfIDLJo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 4 Sep 2019 07:09:44 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A5D823401
        for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2019 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567595384;
        bh=DzQKxLORn+Jt8Aq0TaNyDJKRmsMviAB2cwb0xAErGbA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eDoByzLQaEiQ08MFWtZ3bmt5Tx/HTv2UebI2FEQ/ZNtgBN/AO4xjJ2EijtjCs6pkZ
         FwxA6nsasuDp1LWb0i9li46Aq8J3KMEEptsg82SRSgDyzY7a9GQ51nk2GuYI0i4S8T
         5LYX++9PD6eXCmrtVUS1cVqBX3PypIfPCnPWZa4A=
Received: by mail-qk1-f179.google.com with SMTP id s14so19187828qkm.4
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2019 04:09:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVB206CX+ZwPl5llwSRIwQ3HErsAcD23HOLj7kMhAdFcMUj7kLp
        Z5qiVcwDmSIui2xv+slG2SAGHF1CWHj4osOkeRM=
X-Google-Smtp-Source: APXvYqzHRfroOS8xe/+GT3G6Hb3zd6gggzPc4S7drpP8AUowyFghsdips0s/fyD1pDhn2I3X9dLacb9WpkKhQcKaiSA=
X-Received: by 2002:ae9:ee1a:: with SMTP id i26mr11714380qkg.112.1567595383237;
 Wed, 04 Sep 2019 04:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190830103350.8273-1-thierry.reding@gmail.com>
In-Reply-To: <20190830103350.8273-1-thierry.reding@gmail.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Wed, 4 Sep 2019 07:09:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5wrqQ=9TgGgGtnjNyxdbCJ_HP9C+27WzOKt7OYbk5yAw@mail.gmail.com>
Message-ID: <CA+5PVA5wrqQ=9TgGgGtnjNyxdbCJ_HP9C+27WzOKt7OYbk5yAw@mail.gmail.com>
Subject: Re: [PATCH] Add symlinks for Tegra VIC firmware binaries
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        Takashi Iwai <tiwai@suse.de>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Aug 30, 2019 at 6:33 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Create additional symlinks for these firmware binaries so that the Linux
> drivers can refer to them by a more consistent name.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Takashi,
>
> I've noticed that the current Link: mechanism completely ignores the
> target part of the link. Was this intended to allow creating symlinks
> dynamically when copying the firmware, rather than just copying any
> existing symlinks themselves?
>
> Thierry
>
>  WHENCE                  | 5 +++++
>  nvidia/tegra124/vic.bin | 1 +
>  nvidia/tegra186/vic.bin | 1 +
>  nvidia/tegra210/vic.bin | 1 +
>  4 files changed, 8 insertions(+)
>  create mode 120000 nvidia/tegra124/vic.bin
>  create mode 120000 nvidia/tegra186/vic.bin
>  create mode 120000 nvidia/tegra210/vic.bin

Applied and pushed out.

josh

>
> diff --git a/WHENCE b/WHENCE
> index 20eb4b8c718c..e7b8e40ab190 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3694,8 +3694,13 @@ Licence: Redistributable. See LICENCE.nvidia for details
>  Driver: tegra-vic -- NVIDIA Tegra VIC driver
>
>  File: nvidia/tegra124/vic03_ucode.bin
> +Link: nvidia/tegra124/vic.bin -> vic03_ucode.bin
> +
>  File: nvidia/tegra210/vic04_ucode.bin
> +Link: nvidia/tegra210/vic.bin -> vic03_ucode.bin
> +
>  File: nvidia/tegra186/vic04_ucode.bin
> +Link: nvidia/tegra186/vic.bin -> vic04_ucode.bin
>
>  Licence: Redistributable. See LICENCE.nvidia for details
>
> diff --git a/nvidia/tegra124/vic.bin b/nvidia/tegra124/vic.bin
> new file mode 120000
> index 000000000000..968fcd4c9163
> --- /dev/null
> +++ b/nvidia/tegra124/vic.bin
> @@ -0,0 +1 @@
> +vic03_ucode.bin
> \ No newline at end of file
> diff --git a/nvidia/tegra186/vic.bin b/nvidia/tegra186/vic.bin
> new file mode 120000
> index 000000000000..d785732ba125
> --- /dev/null
> +++ b/nvidia/tegra186/vic.bin
> @@ -0,0 +1 @@
> +vic04_ucode.bin
> \ No newline at end of file
> diff --git a/nvidia/tegra210/vic.bin b/nvidia/tegra210/vic.bin
> new file mode 120000
> index 000000000000..d785732ba125
> --- /dev/null
> +++ b/nvidia/tegra210/vic.bin
> @@ -0,0 +1 @@
> +vic04_ucode.bin
> \ No newline at end of file
> --
> 2.22.0
>
