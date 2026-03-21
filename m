Return-Path: <linux-tegra+bounces-13017-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM0qG993vml3QQMAu9opvQ
	(envelope-from <linux-tegra+bounces-13017-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 11:50:07 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F18E92E4D68
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 11:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41AF300A3A8
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 10:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A8C36895D;
	Sat, 21 Mar 2026 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuNwiB8E"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02055366577;
	Sat, 21 Mar 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090205; cv=none; b=cBwmSsn+zzMyj+6O+LmX6h4T2fkDl1VbanLHFXuUT5smcbC+Zg9XLMPdkdlQBeneTKw2KgbRu1KIsaRaJcM5CS074bz5CkibNbiMHgz7IWuK4y50+GcwSSyvtj1nqL+5GqvEhm5RjSI7OWsnXbmsY/BYvt36RDq9xx4v8B5kNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090205; c=relaxed/simple;
	bh=AO0KXc1B73yLc2gKqAGDHWQACi0oa2VE2UxYV1exQ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P92gfD6TPXhmNOEvA98d4MZY/YIemmJgjaJtkjVgNt9B8xCUTcq+w6ZwWYR7zPJ5zo/HfT0sNoscYkulyO02/aOST+rKelNVQ/zf2LMpcCZoTEoQVjZmNiaLDeB1+ePV8lugX/9HWF4Zdmrt3FQij7uJCvfAVbMkrSTgqzND/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuNwiB8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12EFC19421;
	Sat, 21 Mar 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774090204;
	bh=AO0KXc1B73yLc2gKqAGDHWQACi0oa2VE2UxYV1exQ6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuNwiB8EZe1aK5MHf8w8/SFuzfQMl7N7ITPp2l/Yrs9vtuh9I18lSEzjQWhPKyqLO
	 xNSBNmGRcpS0jMD74XoIBUtETBBHkXgngBtEOIyEiHlEKi3Yvj0ppOkCCmvEdI+IVx
	 Kk0nIhYiGg/eI3BxEtV/zD1Rpw/cbNuExQJfnGPDFqfLGTyJrZgnAHFF0feGmxRflU
	 XTgXC79NB2ieH2/0UZgjCmEOFGf4mIwkgBciWOhyHCQOLslDlfcycmUIHskhbgEe2b
	 0PqUeoflX5XToUueAedSIz7H6ffILViPzp19fB73v74KtHyR79jwk0BrJcI2mBj6Kn
	 F7k1MdI0hBnbQ==
Date: Sat, 21 Mar 2026 11:50:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: fuse: Document compatible string for
 Tegra264 FUSE
Message-ID: <20260321-invisible-brainy-bullmastiff-03efe7@quoll>
References: <20260320233822.2578569-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320233822.2578569-1-thierry.reding@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13017-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F18E92E4D68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 12:38:21AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This hardware block is mostly the same as the one found on earlier
> generations. However, the exact register regions that can be accessed
> differ, so a new compatible string is required.

New compatible string is always needed.

Confusing commit msg, same comments as for other patchset.

Best regards,
Krzysztof


