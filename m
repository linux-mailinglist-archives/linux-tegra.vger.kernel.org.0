Return-Path: <linux-tegra+bounces-14022-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH1oL1SE8GlwUQEAu9opvQ
	(envelope-from <linux-tegra+bounces-14022-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 11:56:36 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F576481FDE
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 11:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E59F3234FCB
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 09:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731502E2EEE;
	Tue, 28 Apr 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="munTD3bq"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA9C26F289
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367761; cv=none; b=AYdtZPf93JF+93Y/zxxLeQ5e7ds/dysH3ZOBswA+yCpVzhrIh6WMntTjo5yO724RYq/EZQgMkcJyOzCiNuizFtJj7C/232BTi8pmCy7EhqDG1JreNRyyC3XvhifP987qix+vPPiZRCooKI/Psm+dGQ66mbGlHC2A2yKIP0EvXoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367761; c=relaxed/simple;
	bh=KBLKYRFZhDEbPXC6YzQIdR3J0xUT2y0Qz9qzcN8YkKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N34cy32Fc6f2HtDYqH2dy2Y+a9up7Z/P0+O7fDpuvcVjyiZSKMBEqvRIvw91PLtSxO96Azk5/kQzkWDNnuFThsObcOjamC67kJKOurHOu+Dp1JoqrKMqC9P0otbkuVW0JuwbpAnRpKRxGplWP9uARvS/6+JK6HTGYFKpVF2ecgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=munTD3bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5483C2BCB7
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367760;
	bh=KBLKYRFZhDEbPXC6YzQIdR3J0xUT2y0Qz9qzcN8YkKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=munTD3bqpqbu1ph1Z7xEQGItd0gQWtmDrUhY7I92gNCcqZeRh1bK40xSCEuGns8kx
	 lonTezLebAV12gdCh9hkQjxabHF+uvL7R9jx+78l1niznFJ6khS40fQUpThJAzSaEN
	 QKTbeNWJ+GdBMd5bICj4cspBuDDsW3jtCu9X87XhS7nq3rE5Oq1T0Ob8y1xmMLEken
	 NaWPZfOgpxipGokAici7JMPt1Mqg/cJ5b1wcfrU6OkY2mhcmTQMk/U29I2bvqum/5d
	 pUQPKoyhIduyfRhr9dbjkUM3LDZ8SefVB5u6S53rV7Nc4Kp7EygrE2gQjnQTtUIB6N
	 USlQN+qkQ5cPw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dea72099eso12525245e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 02:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v1iaeLrWTNYeJD+PY8t7COMP1Jn0isGeW6XeyG3uuzREQibkqa4xeLq51C4ttqKsa42FeFIHAqHEffw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBtR7otsPrvjSSWJwMT1eqESINiNsXTjoQsbwwRPEyC9gGozk
	nqS8TVrg4o4ZqRJbMyCp2tCcnvlrSlTF3hSfLMTDWh5/09VxSaoRu9/f/uDsoRmPkYxeEwyZ/95
	mFjrZ46y/NSWPqUvcr9QI33HqhcS7bFc=
X-Received: by 2002:a05:6512:3b82:b0:5a4:4ea:9977 with SMTP id
 2adb3069b0e04-5a74660380dmr920030e87.8.1777367759619; Tue, 28 Apr 2026
 02:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com> <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:15:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=kzz=ahDXd6H7-DV2-HfGMnty467zEkzGLbcEjaE_99w@mail.gmail.com>
X-Gm-Features: AVHnY4JksbqS1Q0pqN7DxqriD1H4C_6mQwAPiRs9WfxUS5DXblhxmH9rWEvRfZc
Message-ID: <CAD++jL=kzz=ahDXd6H7-DV2-HfGMnty467zEkzGLbcEjaE_99w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: nvidia,tegra234: Correctly use additionalProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2F576481FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14022-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid]

On Fri, Apr 10, 2026 at 1:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

