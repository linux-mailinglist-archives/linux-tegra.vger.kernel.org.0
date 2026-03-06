Return-Path: <linux-tegra+bounces-12588-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL9aDRwfqmlLLgEAu9opvQ
	(envelope-from <linux-tegra+bounces-12588-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 06 Mar 2026 01:26:04 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81319219C6F
	for <lists+linux-tegra@lfdr.de>; Fri, 06 Mar 2026 01:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA32A30166C9
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Mar 2026 00:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAC52BE655;
	Fri,  6 Mar 2026 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8RdX9m2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3461D5AD4;
	Fri,  6 Mar 2026 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756761; cv=none; b=s4l8sJs/sxYj9jjOyZhLj1cDAsYZZdGmkc5tYn/CPLhKtWLfyG99YuHul5PsB+gTDLMD+fDG/LTgJdC7x4EN00wL5HcPuzKIYsaEPMPtbVsY3jxupA1vMJDS4UngZXSCrx2a3BHPkBYveG0xIKRxTcT/z+tV8ekZoiyA36pcsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756761; c=relaxed/simple;
	bh=hLTjbohcX++HuCEe9TQZXe9wa3AMHRKt2yzOkZFpv8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2y4+3pPj2RpgTvIYHaQaSmNXZik9oeqj9DyEoTsPArt+QvQeJG+OtQhsukyhVrSexeKiVgOTGAxtzPbWk3ztrp5c+5IrOTnmSW0gkVH1cbvo9rERdfUbJSxowH6aLN7DBoANqXfH6fwREU/X/r5MAkGv5oM2foJbsBdT1TZrJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8RdX9m2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00425C116C6;
	Fri,  6 Mar 2026 00:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756760;
	bh=hLTjbohcX++HuCEe9TQZXe9wa3AMHRKt2yzOkZFpv8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8RdX9m2Ekitru0dDoa+cBiXDJ2M3GzOax5u4yzy3az5gQ3viwL+WrvVwahmYwCMy
	 VM+UT07M9HhkapIcB6gRRGrWyFA64kYj0+bw9cBeeI1e2RKM2/nkhCVu3SPus5I3Yy
	 X81F17FxWVve0Cmb1C0raoRS2Nc5oce3iOheKDDyqgXfw/RowyK8tHYRkVu3/NVAi/
	 wxszKC0dHbrVdTxbgMvf54qdUdh2FZzsQG2XBdt2vZEtBC1fXZP6wLIsZh9c5g2cpg
	 1vtiyncvGYANo8VYo/sdJIPp9Yarm9cYHV0Ak5U4JHP9vr6+alBGjuOykc607eS4YD
	 6+vZnMxVxGK7Q==
Date: Thu, 5 Mar 2026 18:25:59 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 07/10] dt-bindings: memory: Add Tegra210 memory
 controller bindings
Message-ID: <20260306002559.GA848291-robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-8-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-8-thierry.reding@kernel.org>
X-Rspamd-Queue-Id: 81319219C6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12588-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:33:02PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the bindings for the memory controller found on Tegra210 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop unneeded node alias
> 
>  .../nvidia,tegra210-mc.yaml                   | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> new file mode 100644
> index 000000000000..7f003fc422ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-mc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-mc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra210 SoC Memory Controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  The NVIDIA Tegra210 SoC features a 64 bit memory controller that is split into two 32 bit
> +  channels to support LPDDR3 and LPDDR4 with x16 subpartitions. The MC handles memory requests for
> +  34-bit virtual addresses from internal clients and arbitrates among them to allocate memory
> +  bandwidth.
> +
> +  Up to 8 GiB of physical memory can be supported. Security features such as encryption of traffic
> +  to and from DRAM via general security apertures are available for video and other secure
> +  applications.

Wrap lines at 80.

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

