Return-Path: <linux-tegra+bounces-13280-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKsjC1EJxWnn5gQAu9opvQ
	(envelope-from <linux-tegra+bounces-13280-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 11:24:17 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF333342A
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 11:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5AD13303971D
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 10:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2084B3C1973;
	Thu, 26 Mar 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZFsNn48"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8383C1414;
	Thu, 26 Mar 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520523; cv=none; b=AiYVf1DsBe4GYcuwevrvrM+X6viatryYrqRYxH6ZYhYCey32hCPPT9jcqYjSBrLK/+53W43twI9fUZiAGQZ3gor59b0bgEAOfPumIqFnTOlip/tfPr97NKVeWqCfL4lTf0RsLjmxRpJbufYGcDwfLbaTI8AswZj+NHULRS+lk2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520523; c=relaxed/simple;
	bh=30tjvfOT+W9FwgjTzxB+nZb9EcsEOPVPQ+/3tMwv+rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VafQWLo6Q0ngAts6QH6LFoy5wz4xPobWVWiy2BFKqz0T+eim9dJeuuyR08fSpWIMo6/VxILoMIk2lWfa1qUYIi+iOKGBiUTo0PPE+WmGb3NvtQth1+EqDhXPLm0sebqscN7t9FODVpIylRRxOJvUh5ID7v9HKof9hRRj08uionc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZFsNn48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F83C2BC87;
	Thu, 26 Mar 2026 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520522;
	bh=30tjvfOT+W9FwgjTzxB+nZb9EcsEOPVPQ+/3tMwv+rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZFsNn48vkvKg1n0wVMoWFaPGPNpr2ACcq8iwv//Q9USbUNI4HfZ77J1yTRvAErza
	 oa0xBdZmiJ7Y+NcNXAbLB46CS7QXfhIiBVvInVz2yMHyFn/R/Lt7KNR0RQr0kzPG1b
	 aOtG/Vus2SOLSqYdt3DnsXg+HnmyJYUZk0hVaYomcZoicPdOaRKF88UjZ/VUTPDgeL
	 th1Kl/kpADLvNrsjA8ozKHiTyDacaUvMv0l6rY6lX20+nvslIfi4rkTBgzYF/To88a
	 5AKfopYU5lmoaZbtBXANvQISe1GAngbXef0LOqWtXotVALmqifshG8fy/CuvK513Mn
	 BJdctfgR3H0Ow==
Date: Thu, 26 Mar 2026 11:22:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chun Ng <chunn@nvidia.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, ankitag@nvidia.com
Subject: Re: [PATCH 3/4] dt-bindings: mailbox: tegra186-hsp: allow
 doorbell+shared or shared-only
Message-ID: <20260326-powerful-cunning-spider-dd31aa@quoll>
References: <20260325212628.1234082-1-chunn@nvidia.com>
 <20260325212628.1234082-4-chunn@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325212628.1234082-4-chunn@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,nvidia.com];
	TAGGED_FROM(0.00)[bounces-13280-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8EDF333342A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 09:26:27PM +0000, Chun Ng wrote:
> On Tegra238, hsp_top0 mailbox has doorbell plus shared0, while hsp_top1
> and aon_hsp mailboxes expose only a single shared interrupt (shared0 and
> shared1 respectively) with no doorbell.
> 
> Update the schema to support Tegra238 by adding an extra oneOf options for:

NAK, there is no Tegra238 in that file nor in youro diff. Just open it
and look around.

> - doorbell with one shared interrupt (shared0..shared15)
> - single shared interrupt only (no doorbell)
> 
> Signed-off-by: Chun Ng <chunn@nvidia.com>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> index f833b845de0d..274480a04c70 100644
> --- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> @@ -82,6 +82,13 @@ properties:
>        - items:
>            - const: doorbell
>  
> +      - items:
> +          - const: doorbell
> +          - pattern: "^shared([0-9]|1[0-5])$"

Here and...

> +
> +      - items:
> +          - pattern: "^shared([0-9]|1[0-5])$"

here: Commit msg says shared0, here you say up to shared15.

Best regards,
Krzysztof


