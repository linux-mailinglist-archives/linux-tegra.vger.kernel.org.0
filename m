Return-Path: <linux-tegra+bounces-11476-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nj2GsJqcmnckQAAu9opvQ
	(envelope-from <linux-tegra+bounces-11476-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 19:21:54 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E88D06C491
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 19:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50E733154A4B
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F15236075C;
	Thu, 22 Jan 2026 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2UlAbs/"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4161F583D;
	Thu, 22 Jan 2026 17:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103384; cv=none; b=Fv0h2tQK9YyZt6PCTaixDeKqlroJsdXkZKyEP55dCgtMrpBSKmds0a1wPL5H6h6GbBTAg2db87ksdAf2lPcxUzxgCDqXPbDyE8PZa53HXsp8BaxinR0F8E5jYXrXTz6Xlhk2mtjq7dnhmJ2T78lQoOqn2VUe7gMdF+mxMOyGN+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103384; c=relaxed/simple;
	bh=LWuS3t9H4s3n6SwgiZKmTr2O9DxNfnIGAD3zPijQ33Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MklYPjVzmeQuKwrL7uv2q8hl0cO/Ybj0T2l8NMrh3cJ5q/4gTV0zg7/Z3MNiuqbTt4eYx3G/B18VmgKCD8A57aQvCJM95nzKDpSm2UZFIYgdixQ0SCcMXn/uvaucDWGjEGuy0AHriTDAusNOUNo2hVz+kVTLe78poLToQ/TUTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2UlAbs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E08C16AAE;
	Thu, 22 Jan 2026 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103383;
	bh=LWuS3t9H4s3n6SwgiZKmTr2O9DxNfnIGAD3zPijQ33Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J2UlAbs/vbrkBlyTHAfoan1jPcOAJxwT4BQ6oTfUzQfCjFYnYuBOLhk45uDRuo3H/
	 AJ8YLsNqMPeQk6bxrBUW4PebRQqKIJGaBH3o3sVJ/wCleTmh3Xs3rYCTFcCTV0DjdL
	 lFfljb7U/kwXSMP8Jr+si3Cl0QrOaYVUt06WEriczzOsLxWottOB5M33ZaHWcmER1j
	 Mk4ThL/ejNwhMrlPiTqkuu5YaIQ2gd2Dv060RYhMQ27NGNiy7CnmBVzhiURLuxKoM4
	 Us6ZSRm/FeOLO4R3kRcxyGhfIE6bksw1Y7YGglSW0V6erdeJECMaqujSUGr8LSxRd/
	 1+7wE2rIsVeXQ==
Date: Thu, 22 Jan 2026 11:36:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 Brian Starkey <Brian.Starkey@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 linux-tegra@vger.kernel.org, John Stultz <jstultz@google.com>, 
 linaro-mm-sig@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "T . J . Mercier" <tjmercier@google.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260122161009.3865888-3-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-3-thierry.reding@kernel.org>
Message-Id: <176910338211.2903017.10944159060341564914.robh@kernel.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: tegra: Document memory
 regions
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,linaro.org,vger.kernel.org,linux-foundation.org,kvack.org,arm.com,lists.freedesktop.org,ffwll.ch,google.com,lists.linaro.org,collabora.com];
	TAGGED_FROM(0.00)[bounces-11476-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,nvidia.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E88D06C491
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 17:10:01 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the memory-region and memory-region-names properties to the bindings
> for the display controllers and the host1x engine found on various Tegra
> generations. These memory regions are used to access firmware-provided
> framebuffer memory as well as the video protection region.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra186-dc.yaml     | 10 ++++++++++
>  .../bindings/display/tegra/nvidia,tegra20-dc.yaml      | 10 +++++++++-
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  |  7 +++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: 'anyOf' conditional failed, one must be fixed:
	'maxitems' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names:items: {'enum': ['framebuffer', 'protected']} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml: properties:memory-region-names: Additional properties are not allowed ('maxitems' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260122161009.3865888-3-thierry.reding@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


