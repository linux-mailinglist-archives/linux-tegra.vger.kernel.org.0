Return-Path: <linux-tegra+bounces-13016-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD2yN8l3vml3QQMAu9opvQ
	(envelope-from <linux-tegra+bounces-13016-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 11:49:45 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A9F2E4D5F
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 11:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C086300AB31
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 10:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78A936829D;
	Sat, 21 Mar 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUDz4DoZ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525515E97;
	Sat, 21 Mar 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090151; cv=none; b=Vnc4ouOiMZBX3uXX31zpuLKaoQLu08Xv/1gi9sRxsaKtZYROHf06BE0naNMNfbzJCfQ/5bIIOmHRD2y37A1687a91Z5eED1JS+VJLnKojliZBzK1+wAuz2hCv5uOoibBAEC+wcSiEdqs8RREu0tzEB2VT2PKs9lJ9PuzqTi/4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090151; c=relaxed/simple;
	bh=FhGiOF6whwwsYnNrKia+Zt7oCETPpSLFlOjuEIshJ6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW9DHTQkv3j/+0hbvZAL17b+9NO3UoYqcSAqFym/EsH+J7eNDLBHpMWo75sVJi/OBKFAetd5+JNktj3EUcj7//lflVlQNEVD582lC9zjIBWwcELKA+ONlEpmmesZDWpaoO6qT0xlhqW0tp9efXKx8efWn2xEEU5riFvuYxXgPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUDz4DoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A61C2BC87;
	Sat, 21 Mar 2026 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774090151;
	bh=FhGiOF6whwwsYnNrKia+Zt7oCETPpSLFlOjuEIshJ6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUDz4DoZS7r0+NTBMyKkV42GeJkPW0jjktHmJ9FwC4n96dnaFpuJ5aVxyk/SJ3OMa
	 Q7yHxN/xoRbj0AuKAg+/5J7oSI+GiYqpZ0hoJ5BiW9TEuFvUPhNUr1GSiEdUwy2oKS
	 OWqRlTN4nAObnb/Zk5LzDcNepVX8OVQB3veLustsjK5IXuOTNUIs7gGndoiKrIJfsY
	 /77bng+wBNwGO+CiW0M+x1zAZP+d5hsWxcKOAY2ZBb6uQN2qbTJ6KtHO4UK5SplJRY
	 rB8aKK0JIurCKK/ScJA1oBziYIKEAkmYoXiSB3R30c+FPSKZPSe98ngjumJuPd6LEQ
	 03C1z7Yd9oXGw==
Date: Sat, 21 Mar 2026 11:49:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: Document Tegra194 and Tegra264
 controllers
Message-ID: <20260321-lurking-courageous-centipede-5e82cb@quoll>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320234056.2579010-1-thierry.reding@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13016-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 46A9F2E4D5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 12:40:55AM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PWM controller found on Tegra264 is largely compatible with the one
> on prior generations, but it comes with some extra features, hence a new
> compatible string is needed.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Where is the driver patch? Why this is not being part of driver
submission (see also submitting bindings DT in description how patches
should be sent)?

Best regards,
Krzysztof


