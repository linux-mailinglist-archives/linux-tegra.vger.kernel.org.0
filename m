Return-Path: <linux-tegra+bounces-11475-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JLDKSxkcmnfjQAAu9opvQ
	(envelope-from <linux-tegra+bounces-11475-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 18:53:48 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C63566BC1E
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 18:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60F023102F13
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916E5371049;
	Thu, 22 Jan 2026 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGK/UDdA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FE5353EF2;
	Thu, 22 Jan 2026 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103160; cv=none; b=e7eYbPBNk57Ws+CslMaD82w82aKLtL4KD5gU3UcipCaUA+0uT0XFF9XpnEluzwbpROFrPOwGA4WHYwMJseqQxlvLPMntaXZicDB4n/MlSXflHC+mhcgej8Kmubznvg773QW3OokcllwsxnPbVJWk4G6oPoCnmLY3nHbMnjUnDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103160; c=relaxed/simple;
	bh=eN8J743evN9qhX8qEizF2GNsho1bSX2LeH2+rcsBo9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7vo66FWQvIU9nbZRcA9ld7t7KnhQcoN0cLB0Uj5dhBATGdKlEgzDsPstzdZ+RLQ9UuVd2krbJ81ijD+0CB0mWuHh/z4lGO3XULWDnYakofMo7sYwPwlSYKu70mCsLUwWz10yvWI5WSkqMgMFryKGs5EBdOKQvOGDx6gLZb4L78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGK/UDdA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E91C116C6;
	Thu, 22 Jan 2026 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103159;
	bh=eN8J743evN9qhX8qEizF2GNsho1bSX2LeH2+rcsBo9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGK/UDdAU+65/D8apvZ+leLeW8WjeNATEwq2XzTblFUKi99YY5E9GyeNhL14cSnl0
	 IWZ9MC3A++txkzdzsR09wts55/dwC1JVJqwzNCQD6pqLGfgER6VXX9slLe1f2grjnZ
	 SzpOJsbR4KzFkg9Ty02tr0ZK+JzIa1h/qbdnaFQdHFTy/OjSlIcjfnzDuAQ4wapz3w
	 /SLidYVy00rinShDEm6l0rn8HTowdvngzVWoxeWdEFr4AvGWwFMMLgU19XVV+bbzEP
	 L0rvm18jT+AGv9g9oYkWkDeBGv5GFE2acdLKu898wqhDxhyWcwri4YzJzct0XoCj5U
	 z9PRb4X14lFFg==
Date: Thu, 22 Jan 2026 18:32:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Message-ID: <aXJe_2JC7KgfBgLa@zenone.zhora.eu>
References: <20260121153012.92243-1-kkartik@nvidia.com>
 <20260121153012.92243-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121153012.92243-3-kkartik@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11475-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C63566BC1E
X-Rspamd-Action: no action

Hi Kartik,

> @@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
>   * @base_phys: physical base address of the I2C controller
>   * @cont_id: I2C controller ID, used for packet header
>   * @irq: IRQ number of transfer complete interrupt
> - * @variant: This represents the I2C controller variant.
>   * @msg_complete: transfer completion notifier
>   * @msg_buf_remaining: size of unsent data in the message buffer
>   * @msg_len: length of message in current transfer
> @@ -332,13 +333,12 @@ struct tegra_i2c_dev {
>  	bool atomic_mode;
>  	bool dma_mode;
>  	bool msg_read;
> -	enum tegra_i2c_variant variant;
>  };
>  
>  #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
> -		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
> +		     (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
>  #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
> -		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
> +		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
>  
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>  		       unsigned int reg)
> @@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
>  	.has_interface_timing_reg = false,
>  	.enable_hs_mode_support = false,
>  	.has_mutex = false,
> +	.variant = TEGRA_I2C_VARIANT_DEFAULT,
>  };

in v8 I made a question at this point, could you please answer?

Thanks,
Andi

