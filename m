Return-Path: <linux-tegra+bounces-4283-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFC19EB5B3
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2024 17:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C716D18850E3
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2024 16:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDC51C1F15;
	Tue, 10 Dec 2024 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FraOQ7la"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED41BD9DD
	for <linux-tegra@vger.kernel.org>; Tue, 10 Dec 2024 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733847019; cv=none; b=CC5BfyESGPaCCrtmitU9i0KFKEQvOgyE7KD61exvkMY6ATvTMBIyWDDW7M9OItApAP53I/cyiZgTZfMcGVC84sHuxmllaWFIPdsypzTRE5ndcBFSDrehKrgLgI6L3+f+FC4FtPN3rC3Bp6SoMV4sULAQ11mYYK961wDuSejCtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733847019; c=relaxed/simple;
	bh=BbxjbBE9EY/vTzfnxGy/h8oVMvXpnYp8R9PBrp8qVko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDqQo7h9va3sXVIvNKKycYoorRYpCKCBDcjdQg+KBbt9Ia7fyT2Xx0iHa85k5BqE+ZjJFJCtfjCwmpN9vjwJr+rOGOGyXiT9xGhDjTlvRAy0ldvJKnjSZbMmY+mpqX7nzIZEW9Wc0ngdKH88079U67Z/8QoPLJPE+vcnXMHTh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FraOQ7la; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e398273d6ffso4295830276.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Dec 2024 08:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733847016; x=1734451816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxEsjJZdgUz/mL0/yG8G0yeVvzImsKQynZFt9bIQYPM=;
        b=FraOQ7laT/TqYRDWq59VNLs0tldsdbBMXjb7Z0zqiBAggjFavwBgbc+Z/pPAqIsi7A
         RaQGZN49rIqoqAW53pcuW07d9R1Z5+xRKzDWIXWU54d39l0a2quJu8gqbTbzIpNM9hD3
         HGabXji93PLhoIlkSTBq26L/rFchiAMQ2KvGqYcef1+oT2ULi0fbaTyTS0Q2AeRIuU+e
         +bSyPv4KvY5yhxXhlG0TQy01W/VpKqnSl1DRUWr3DOjBdU8yK4UaLXIb7H/IGdpuTCnz
         Xhzc0sAja/VmZPPYVaZHScD58LUTAonLFJ91GbwKtTPBcq8KzK2up9rMoW3pAsrXjXPx
         Rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847016; x=1734451816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxEsjJZdgUz/mL0/yG8G0yeVvzImsKQynZFt9bIQYPM=;
        b=bF9xIGg6dveqhVmFptiK2KExQCmvqtRtBzpCjg87+ZBx9p0lWQxE4PM7g4Gr/wPELf
         /GbV+5ZVFiHrGQGTRU4WmxVBT5fNzpzvdC+lXjm+8rO5Wq5Ne5UT7cq1Kz5Mn643ofHh
         ei5DA1HJhisqmQ+ccFqTmJF6SSwQM6nZaeRMpBAFDUCX7euzj8v2OpAfdOLkDykiALu+
         D9qdT14NZjoyOjNQ0YkknRQhKNV1PMDf8oQiwuCe4I6dMK6417LNegq/9/mac1UPGzA8
         r+fE2yFmhH/e5LyUd16ZMh0FDfZtiOcIgDd86sqt1dy74ykG9HbudBdi7QRtB35bi2FD
         5Xag==
X-Forwarded-Encrypted: i=1; AJvYcCWnofVE82nm9lwYnF03YI8VxDL8hfOShPsxTFQinHWuBsCwYEFQtg5HauDhRF5BkO7zD7ybGTKsELhfOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKRz5XsyILyHrGpdmywVzc4iO/9rrsXZXMNSvhKUzZme4YKUHW
	GtSJKsu1C88e5FE/g6rpz2DkCRY94YsAGvIjsgGTtmxnKAQJhZvT5wUmJreN0Vml7usI/BfsqnA
	pzxhhRXWbXrTzQiFc/i1BqNbpO+2QAIfhsX7KHw==
X-Gm-Gg: ASbGncuH2UEQOrH6zPT2VdIH2thl46xQFijsz+EgnLZqwQAy/LTiFhRH7DpQd+4WIID
	JmiVi6NWMVjKvSWF2B4Mr5oSNvEhTCh69L/jA
X-Google-Smtp-Source: AGHT+IFNDYQwgGxPY21TM51+IaEJVIKNukjD//zZqKizVHjoXfP5g2KINmrq5zBjn12o/Cd1twqkaondPOWReLN4iBs=
X-Received: by 2002:a05:6902:240b:b0:e39:9b9f:7f87 with SMTP id
 3f1490d57ef6-e3a59b27141mr4893458276.29.1733847016550; Tue, 10 Dec 2024
 08:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209101009.22710-1-pshete@nvidia.com>
In-Reply-To: <20241209101009.22710-1-pshete@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 17:09:40 +0100
Message-ID: <CAPDyKFpmTs7ZqK0ZCDB6tuaUi6gXdTxOkidVpAz8JpgWO4SK3Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-tegra: Remove SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC
 quirk
To: Prathamesh Shete <pshete@nvidia.com>
Cc: adrian.hunter@intel.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, anrao@nvidia.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 11:10, Prathamesh Shete <pshete@nvidia.com> wrote:
>
> Value 0 in ADMA length decsriptor is interpretated as 65536 on new Tegra
> chips, remove SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC quirk to make sure
> max ADMA2 length is 65536
>
> Fixes: 4346b7c7941d ("mmc: tegra: Add Tegra186 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 1ad0a6b3a2eb..7b6b82bec855 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1525,7 +1525,6 @@ static const struct sdhci_pltfm_data sdhci_tegra186_pdata = {
>         .quirks = SDHCI_QUIRK_BROKEN_TIMEOUT_VAL |
>                   SDHCI_QUIRK_SINGLE_POWER_WRITE |
>                   SDHCI_QUIRK_NO_HISPD_BIT |
> -                 SDHCI_QUIRK_BROKEN_ADMA_ZEROLEN_DESC |
>                   SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
>         .quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
>                    SDHCI_QUIRK2_ISSUE_CMD_DAT_RESET_TOGETHER,
> --
> 2.17.1
>

