Return-Path: <linux-tegra+bounces-11387-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMHUMv2YcGlyYgAAu9opvQ
	(envelope-from <linux-tegra+bounces-11387-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 10:14:37 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBE542B1
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 10:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C767F56A74E
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Jan 2026 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613533A9610;
	Wed, 21 Jan 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS8ZuEUA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E8C346779;
	Wed, 21 Jan 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986261; cv=none; b=IGiEvk8nwn1JQlr8ElPoNvK3e1cP5AsVdLijsd9I7QtKApQ9PdtZwKuwjz/cZkhl+tmuHrtyoDauSqJQhHBY99iJv7Flf1iPFDmOC6eWTNmeaI5CRRJertBJo7dyKgJP+T0svFx8uqFWXfXQlLG0PaD/Ut2Gzob29EZifpvV7eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986261; c=relaxed/simple;
	bh=5O4ClepjVfcNoXhtsuI3nm+2MeA1MFDG8noJUn6bFTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svsSjJTZzIaYYUT/pni0CrX5dDi1IctnYxwrabcLquDG1hZyU/T8FHZH2zcZHaZFUnlsTJ9AyDMl+2fJRTeuHF/C2dE7BUM+ZukBWFdwCD/1zbzEXGFk8Wh5V+Y2Ec/lHmV2M8EmFbpxYNJzsiwCUFIW6cChvY4udNlZHVGWzTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS8ZuEUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFA6C2BCF6;
	Wed, 21 Jan 2026 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986260;
	bh=5O4ClepjVfcNoXhtsuI3nm+2MeA1MFDG8noJUn6bFTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IS8ZuEUA4f68lsPegVyrcCo67STGJ39yhZJEEAYssAturDm/xyWiKqDixtSuDqQ+6
	 oYf96zsQR+2rtSvjwJUFo7tj2K62KVCJ4583GJNr22LvCFHmd/ouspZcz92k4N297x
	 qq2fagLxjRLi2yDu0xZA21R4UwE72JBxYLrY+nUEpmtY8XiMLvjmSxr6FBZHNiUuiw
	 MMWUvyKrHdL3viPFZoyI/NP9oLcXp1qgNClBod4q39kcNF0Q7hhqSai9mhmKqcxhuO
	 qUc0kgiKts8PXrxIPAv5jWo58M1ltFEG9dFfYMm9LfNhCbgIJm7GE1DncdMBXCYPcA
	 euOvMiPUaV4MQ==
Date: Wed, 21 Jan 2026 10:04:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] Add I2C support for Tegra410
Message-ID: <aXCWCYR-DRF9urhl@zenone.zhora.eu>
References: <20260113165929.43888-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113165929.43888-1-kkartik@nvidia.com>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11387-lists,linux-tegra=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,zenone.zhora.eu:mid]
X-Rspamd-Queue-Id: 67BBE542B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Jan 13, 2026 at 10:29:25PM +0530, Kartik Rajput wrote:
> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
> controllers are feature-equivalent to Tegra264; only the register
> offsets differ.
> 
> Kartik Rajput (4):
>   i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
>   i2c: tegra: Move variant to tegra_i2c_hw_feature
>   i2c: tegra: Add logic to support different register offsets
>   i2c: tegra: Add support for Tegra410

Can I have someone from nVidia acking on this series? Laxman?
Dmitry?

Thanks,
Andi

