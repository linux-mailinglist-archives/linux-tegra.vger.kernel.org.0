Return-Path: <linux-tegra+bounces-6204-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54628A9FDCB
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Apr 2025 01:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2B51A875B5
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Apr 2025 23:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF13211491;
	Mon, 28 Apr 2025 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Um23Bc4m"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4781DF988;
	Mon, 28 Apr 2025 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883270; cv=none; b=OK6sQqH9lnMY1mYpwmp7F2P7n8eZljB2fOvC0wXJkPK9Ex1iT27zQChF48sjfSBLwPZRCi2AcAz7tnBL+OS6HJvPFbHVmy7TAbna36oJ6n9122g0ahGG/to1MWrgjeuhBvyA+a9zLbCqExo2cn9n3Zp7WGPvlnZyG0ag9Pl+3qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883270; c=relaxed/simple;
	bh=R3ouIl/VZaTIzsxRQARD82utq+24mV2Fl+0Qm8daJt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNXs1JQaWcNptflflzDlD1R9HQedr9rL+3PFe/tBMW+NwseV1ThE0CGx53Dt8shjfJUCbMErjRGjQtHI85yZgGRm9ItMZNKHCqsBxobulKkVD8skAtVsPxOwMck6MP8eJmAu+fZFBDKlPxNpNPzby99+y2EkqgWaSJ0pAr91G4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um23Bc4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C63C4CEED;
	Mon, 28 Apr 2025 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745883270;
	bh=R3ouIl/VZaTIzsxRQARD82utq+24mV2Fl+0Qm8daJt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Um23Bc4mR6gnTUpoi3x5ciimc/jrfd9g0mM4eOhPscs2RkmdghYaGrRPY+GfecpdD
	 4P297ENelgDBFGFaxXKVslmEmO0AJPn48Onjse3vTWGKX9d3MWGRBgFFDNI70XhlYp
	 VjuxjW3fdmKdUNisSYfmBs3NvEGkfPQVR0uXm2Bk+7kz0JLCh8VwfWD7luA2L60VqG
	 9pQL52kBpk+YpbsBOLGqXfjCNzb9PlZWovc0tLmrJlgsxY05IwQHkPQAbiPm1JN4a+
	 skEc2D5YfUkybUZQCVdMUStL5v4ejNNRvQ4gPuW//WjIP/x9PtfO535LkKbIi/Ejth
	 i56wo9bOoG73Q==
Date: Tue, 29 Apr 2025 01:34:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, wsa@kernel.org, linux-i2c@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Message-ID: <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>
References: <20250424053320.19211-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424053320.19211-1-akhilrajeev@nvidia.com>

Hi Akhil,

On Thu, Apr 24, 2025 at 11:03:20AM +0530, Akhil R wrote:
> For SMBUS block read, do not continue to read if the message length
> passed from the device is '0' or greater than the maximum allowed bytes.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> v1->v2: Add check for the maximum data as well.
> 
>  drivers/i2c/busses/i2c-tegra.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 87976e99e6d0..049b4d154c23 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
>  			if (ret)
>  				break;
> +
> +			/* Validate message length before proceeding */
> +			if (msgs[i].buf[0] == 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX)
> +				break;
> +

I agree with Thierry, this check is driver independent and it
should be done in the library. Anyway, for now, I'm going to take
this as this check is now left to the drivers and it would be
huge to shift it somewhere else.

Before I merge, I want to know if you have you seen any failure
here? What is the reason you are sending it?

Thanks,
Andi

>  			/* Set the msg length from first byte */
>  			msgs[i].len += msgs[i].buf[0];
>  			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
> -- 
> 2.43.2
> 

