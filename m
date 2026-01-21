Return-Path: <linux-tegra+bounces-11386-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOIAKneXcGlyYgAAu9opvQ
	(envelope-from <linux-tegra+bounces-11386-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 10:08:07 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54A54157
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 10:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72BFF582FFD
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 09:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4232C3D5228;
	Wed, 21 Jan 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+asFUC3"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E003B95EB;
	Wed, 21 Jan 2026 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986019; cv=none; b=irfQUiO9q5bCY6O4fNeEPsKMkWJjOjw2AcmgcAr/lvEWTK8K2Qms7+AZ89M+pG5z2IogzyPU73kBU5YN/3q81B27kkVVRWc0HVaOmQ9z/VdJilRyNlwfU3iRLX1wCZH8rrTzq4GqEpyZTVCnrEcJHjUdNHsxd7pwiUho2ztWYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986019; c=relaxed/simple;
	bh=JAW2fEYXBUCsTB1KxCsBLBKLlM3zjAOGpg6CKOf4Va8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EijD75xZkWBENhZ+joLRKM6zI3Rsc+s04I8HhVkP8iGWIeJfFB+upU+OR1/b8h1uiZCP6aXF3pQ/U52Dj/s7n6IIfdmG9UKmVR1Fp2N83pykxToe3NqIaKEQcbh11AvvgLLcv5Yqzns5SU8vo9vDXe0Rt9aOW6X7jvauMFDu66M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+asFUC3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DC9C116D0;
	Wed, 21 Jan 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986018;
	bh=JAW2fEYXBUCsTB1KxCsBLBKLlM3zjAOGpg6CKOf4Va8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+asFUC3ghlGJYu7Ow6+v40dz//cjTiBsyCwYwKubCuQbt4uNdQbai5z8NuARhy8Y
	 ah9m9fDTvNygQzddK17FwPUfCC8yimhw9hNap7pacA2UurlDp42Uo3FyT5B7fJ1Mbu
	 v7nGeWrAnvnSBccWo3nih4M56RI4lp8HL9cziifVfvM+cYPvEujSLNkroZeHnqL3Ar
	 iMyTigaRXOtibG+zIo8aECRq8y7yqhGyya14K6jv64nEvOdXOA6Q8g0bnii4CSNpKH
	 7RowFckkMKurc3nkd19tTUlKr75bs3ICUxiRy+GkGAVpSRpeohIdTEeWZJGfzrUfgI
	 f2sFjXy+aRqfQ==
Date: Wed, 21 Jan 2026 10:00:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/4] i2c: tegra: Introduce tegra_i2c_variant to
 identify DVC and VI
Message-ID: <aXCVSqvkK5PW55t9@zenone.zhora.eu>
References: <20260113165929.43888-1-kkartik@nvidia.com>
 <20260113165929.43888-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113165929.43888-2-kkartik@nvidia.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11386-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 5A54A54157
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kartik,

...

> @@ -323,12 +334,13 @@ struct tegra_i2c_dev {
>  	bool atomic_mode;
>  	bool dma_mode;
>  	bool msg_read;
> -	bool is_dvc;
> -	bool is_vi;
> +	enum tegra_i2c_variant variant;

why do we need this extra step in this patch and we don't add
"variant" directly in tegra_i2c_dev->hw?

Andi

>  };

