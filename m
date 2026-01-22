Return-Path: <linux-tegra+bounces-11469-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJjAKpBScmnpfAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11469-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:40 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082396A1DA
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7EBD303A276
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 16:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552341E7660;
	Thu, 22 Jan 2026 16:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTGUpU3Z"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E33D903D;
	Thu, 22 Jan 2026 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098244; cv=none; b=T6vaex23JmrkdlINT2ZQPeNxOvUh06pRWF7VTFPfQi0qb4dkGZ0V5DnMyfn23HqbLnZe2Ond5D57zWqTW+J27usw5CYvTcaAjPChOafmkk31CPbF7DyzhUkanMk6ESWlPcaBJa88ifBs5K4VzJyXauBOBwknqYuxsRd9V3UW6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098244; c=relaxed/simple;
	bh=03W+miu9snDAt7mFvXpzGvadHlBQWH/FakrfAMWKksA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGWJBqzb8mqivkVrcF4CmgtWzGOJ17p0m81+72VaN2a0lkmrSx8wFeSfwABYwrQs8sIT9E1gFMCaMMeYsUs+/C0fwUP+FWZVEpzkocMxtPwWn+No+Xw+giwtyBU0V/bmKRtp1hYdmfKUbMLcj4J8KObjFgi+59ipKPoWJa4r0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTGUpU3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0395BC2BCAF;
	Thu, 22 Jan 2026 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098241;
	bh=03W+miu9snDAt7mFvXpzGvadHlBQWH/FakrfAMWKksA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uTGUpU3ZmFiFvnjDXKELVR1KdEj2L7iy6TSUNG9eYUXeIteqryu0VBNTFn9B3W1a6
	 hjZGmjAuLTXkBVKn+uWqQfrFkscEMjBipQgzR0Ic/gDLWHXfwb7GtnI5Yp13zlzMtJ
	 i5uKRoBz8IAsSCEkbnweSF+AcfjkxnaOA0Z/KKTuAfgiYJs/Azupp1VUfCSl7txw8T
	 BfIVNQerwdBwKwDYx1V85Fps4MFUwOcOWC94GZit9kYDF+vW1CpUAMjkmdn29+RyHP
	 6NnTuC97wKAoi5VkqI6OFrEpyv3EcC7sGn1pL4QV+e7KOvNG3Kj0tftF19Jw8DTjTT
	 xvpJA4fIdhQdQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH v2 09/10] arm64: tegra: Hook up VPR to host1x
Date: Thu, 22 Jan 2026 17:10:08 +0100
Message-ID: <20260122161009.3865888-10-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122161009.3865888-1-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11469-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.234.17.224:email,nvidia.com:email,0.236.52.192:email]
X-Rspamd-Queue-Id: 082396A1DA
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

The host1x needs access to the VPR region, so make sure to reference it
via the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 5f67d9b57226..cfffa4f2f196 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -4474,6 +4474,9 @@ vic@15340000 {
 				interconnect-names = "dma-mem", "write";
 				iommus = <&smmu_niso1 TEGRA234_SID_VIC>;
 				dma-coherent;
+
+				memory-region = <&vpr>;
+				memory-region-names = "protected";
 			};
 
 			nvdec@15480000 {
@@ -4492,6 +4495,9 @@ nvdec@15480000 {
 				iommus = <&smmu_niso1 TEGRA234_SID_NVDEC>;
 				dma-coherent;
 
+				memory-region = <&vpr>;
+				memory-region-names = "protected";
+
 				nvidia,memory-controller = <&mc>;
 
 				/*
-- 
2.52.0


