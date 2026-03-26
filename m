Return-Path: <linux-tegra+bounces-13296-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONTdAeEtxWnb7gQAu9opvQ
	(envelope-from <linux-tegra+bounces-13296-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 14:00:17 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7B335A05
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 14:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 116DB3116F8C
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Mar 2026 12:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233E2269CE6;
	Thu, 26 Mar 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocl1oRtd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF423D2AB;
	Thu, 26 Mar 2026 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529533; cv=none; b=GXUf23QfCmxC7ib/wzJjnqREOkMiRN50TBnPkjKrphfodAL+SYyOxbQ7GfFgyjiWq+GsNYEDlN3m5sQyJ40o0OygoflmYiE8AKdrS5Qf88zdgk58YyAjhWkJ+jVI8izQcf0kebgHqgGJsOi3Fo8xxt1EI4OQdgJp+1qnEeYZdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529533; c=relaxed/simple;
	bh=DRCQnnvJqKguX1Qk+NH8PGbOpH/goqBVZcNSBiZzI5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bkc38odgHv4BP7vGuPN0RPRhdDdLfb4hVnxISpWJR9eY6pDA2GopDOaX6SmEwNX3i26ZfWCCgca2dNtwUlhjfBKE9yR1F/DHm1ci9lb8nRr+KTsq3oaygK+VTcxHhEznJtyy9nss1LyCI+IZl7F1VVL3AI53Fxfw7qTkGgZKafY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocl1oRtd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AD8C2BC87;
	Thu, 26 Mar 2026 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774529532;
	bh=DRCQnnvJqKguX1Qk+NH8PGbOpH/goqBVZcNSBiZzI5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ocl1oRtdBDxteXhwpkJHfKwaWe+ewIQjxw6LbG0kjSTkpDsiZQomtCfUBANztxmFI
	 m0ZUtae/Sr8/8PDu8Anu71CLgg7g414G9tJzgCr+eDuV3P2RNSrw1xnuVsKPVbvm62
	 Nc0QIwI+dhP1OmT23FibPlg7Dd7jxssoKA56li5jqFJjRctYIMFK1rZa1pvxogeG9Y
	 i4+GAQMyIvu/XKJpbcroZCX392I9nR57FeN8RYd7hkMRm+alyl66cgvf1T1B6wJFXW
	 UPQMCvdAnFoNrk/Yb1dJHpzypEq3T1GvEGhGVOz3d7Af3jZVkNi6Rz+weIuAR1NgoW
	 jnHRMjqBHGkhw==
From: Thomas Gleixner <tglx@kernel.org>
To: Tsai Sung-Fu <danielsftsai@google.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Radu Rendec <rrendec@redhat.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Krishna
 Chaitanya
 Chundru <quic_krichai@quicinc.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Masney <bmasney@redhat.com>, Eric
 Chanudet <echanude@redhat.com>, Alessandro Carminati
 <acarmina@redhat.com>, Jared Kangas <jkangas@redhat.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] PCI: dwc: Enable MSI affinity support
In-Reply-To: <CAK7fddBV6HHR-MTkRqH2gK=Ga16H6jjX0PsSaPUv-Cfef-WUbA@mail.gmail.com>
References: <20251128212055.1409093-1-rrendec@redhat.com>
 <20251128212055.1409093-4-rrendec@redhat.com>
 <4e5b349c-6599-4871-9e3b-e10352ae0ca0@nvidia.com>
 <a8d841e870d6dbbabef7eadb774f2a58a96c57c7.camel@redhat.com>
 <cfe44924-3419-4f31-8ab3-87b769d21a5b@nvidia.com>
 <96c9d483f67be02fa1dba736fea465216d0c3269.camel@redhat.com>
 <87sebsdcte.ffs@tglx> <255713ca-bf91-4f7e-8df2-33b7b614a1bb@nvidia.com>
 <221f6dadb6d8ce06f30a24baaa2777e90d75b130.camel@redhat.com>
 <87h5s7bb5s.ffs@tglx> <87ecnbb2mn.ffs@tglx>
 <b5e33957-1b8d-436b-888e-2b6f13d30782@nvidia.com>
 <CAK7fddBV6HHR-MTkRqH2gK=Ga16H6jjX0PsSaPUv-Cfef-WUbA@mail.gmail.com>
Date: Thu, 26 Mar 2026 13:52:08 +0100
Message-ID: <87341meosn.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,quicinc.com,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13296-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DA7B335A05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26 2026 at 11:48, Tsai Sung-Fu wrote:

Please do not top post and trim your replies as documented.

> Do we have plan to land this feature upstream ?

# cd linux
# git log v6.19.. drivers/pci/controller/dwc/pcie-designware-host.c

Thanks,

        tglx

