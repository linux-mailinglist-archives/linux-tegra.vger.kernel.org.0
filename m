Return-Path: <linux-tegra+bounces-13790-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALu/FuUy4mkZ3QAAu9opvQ
	(envelope-from <linux-tegra+bounces-13790-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 15:17:25 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3641B88B
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A3C530DA308
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 13:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE043A9D8B;
	Fri, 17 Apr 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVbqZkQE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B41EB5C2;
	Fri, 17 Apr 2026 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431760; cv=none; b=FOy2kq784lwCloYQHh4/BqyPhK+jr4yVfH3UxfyQLGQvYm9sQle1hGybY/omp1Oz4CG/mMU6VA1feGUa47+P6LyThIdI5qGukc24qVeeVMqqWF0AWtxkaEHnAlMv71YQ+1u11CUuOIM6wH4Cm2LOCmx6/lPtBa07LUAvhV2XM04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431760; c=relaxed/simple;
	bh=3t8CdW+2lbkqrvxvlVhufeih1j58VNK7Gp9uCsojClc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQh8SBWm5qj6hB1DOw6WgSgFvq2JQywG67cmmUjQgQNdri2CpAXUNjA2FTgBfIYKjlUpTAtXiUs2WkIUYdX+PUNOaQHkrmE2YiBJkEyn/plfbJpiBne/UG1Ph2Rv5kTlnzGMjAXqD54fAmqYbbZ6qT6467t9wrAIefM4M7rqVZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVbqZkQE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266BEC19425;
	Fri, 17 Apr 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431759;
	bh=3t8CdW+2lbkqrvxvlVhufeih1j58VNK7Gp9uCsojClc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVbqZkQEN53h7akJNXk0j+ukEncZxIVmMr39H0JMt4EnZrnvgAvMcWbdTPE8sEgCo
	 VVg4LEWgAVvd09IV4ADTUmZMGVCuDxQkefWwciaRfMQlRtgGtDOY5SIWgAtDf90SMN
	 4UYl0y9UVy2CWHtZ+COl6V07Ob4WBKZ0DYfpVLo/5yM84Gs67gklmCinv6Qu9m7VgP
	 2knHhAT4cUe7cVDLyhcxCov0g15C0s30is4RkHhmRbQyyesFNKD0RlQD+0lZeDD71p
	 EASAEbI4aTmaf+cJunQsXB4ZESNHabuvmWqb35FM78tS1pEKAhTM2AKT/nuyzs0+tP
	 rLZZGIKztzPsg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Documentation: ABI: Take over as contact for sysfs-driver-tegra-fuse
Date: Fri, 17 Apr 2026 15:15:47 +0200
Message-ID: <20260417131549.3154534-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417131549.3154534-1-thierry.reding@kernel.org>
References: <20260417131549.3154534-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13790-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D5B3641B88B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while ago, so I'll be taking over as contact
for this ABI documentation.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/ABI/testing/sysfs-driver-tegra-fuse | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-tegra-fuse b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
index b8936fad2ccf..47d5513100f6 100644
--- a/Documentation/ABI/testing/sysfs-driver-tegra-fuse
+++ b/Documentation/ABI/testing/sysfs-driver-tegra-fuse
@@ -1,6 +1,6 @@
 What:		/sys/devices/*/<our-device>/fuse
 Date:		February 2014
-Contact:	Peter De Schrijver <pdeschrijver@nvidia.com>
+Contact:	Thierry Reding <thierry.reding@kernel.org>
 Description:	read-only access to the efuses on Tegra20, Tegra30, Tegra114
 		and Tegra124 SoC's from NVIDIA. The efuses contain write once
 		data programmed at the factory. The data is laid out in 32bit
-- 
2.52.0


