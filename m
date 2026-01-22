Return-Path: <linux-tegra+bounces-11468-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLszKIxScmnpfAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11468-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:36 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9856A1C4
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4E130A23D9
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 16:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204083D904B;
	Thu, 22 Jan 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXNZYYif"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F553D903D;
	Thu, 22 Jan 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098240; cv=none; b=omZH66REvlpZLXyrrHAvLykbUIpWHlQ7ikSU7tkH9A9/KeVAHQECqvpryLWH8e8cu51140YWpiOBN6019277/sZ6RzE4BYXJPuqWgloxuwHJVcTxQRCuDKsnnDRoK0oRO+UQrpyKL3hDLOKZft7Nqbkh0fJNdCid7XRZE59nI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098240; c=relaxed/simple;
	bh=lNdb2W7doKmrgjPjgeTtoM+R64zDLdfcfrtXbX1koE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4Ntzxr5wu/AS7V0xT5NFmCtRzc60zdD52zdLhh+NFbVbCajn3Fg3ZD8Xit9DZ8yAx/WbVp1Gicht7sMxpZni3dy2EjjMgBBSFjlolSErCQagLKwr5/Nc5XogOzLsLapgPeswqnOqyq5PvPWtBWq8+2yFBAMaYgLHV4Gvpa0BIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXNZYYif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD1DC116D0;
	Thu, 22 Jan 2026 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098238;
	bh=lNdb2W7doKmrgjPjgeTtoM+R64zDLdfcfrtXbX1koE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZXNZYYifm9VfYi+kclez8EXzUF8ZUAOh0AcT+MNc0D0RXJqfYWLhzByjq5MlhFmtd
	 sRi82Cb1e2BEjdoX46KkmpvNQlwDNUbBT6soROJTmNcTVp6R5V6mnZ8R+wCv2EWXX/
	 Kje8r41oR9ZvA5l07jd8nek36Ds7WLXFX5eopUTuk+FBIjaeG+nnDGS7sPlx3YOwBd
	 H9BaINgwXQO+IksIcJQf2upD/v8eG5jRlow2zE4OaI8yOpyAYyXLx9L5hrUxwWtr57
	 Vu5Fk8cQFq/REpI7FBn2B1cZSt5DkI1BTUqr1097jyARnhabib/vLus1qLBadiD8Gs
	 8QvTL4WtyNSuw==
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
Subject: [PATCH v2 08/10] arm64: tegra: Add GPU node on Tegra234
Date: Thu, 22 Jan 2026 17:10:07 +0100
Message-ID: <20260122161009.3865888-9-thierry.reding@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-11468-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[2.98.90.0:email,1.3.102.64:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,141e0000:email]
X-Rspamd-Queue-Id: ED9856A1C4
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 62a5dfde9e38..5f67d9b57226 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5317,6 +5317,23 @@ pcie-ep@141e0000 {
 		};
 	};
 
+	gpu@17000000 {
+		compatible = "nvidia,ga10b";
+		reg = <0x0 0x17000000 0x0 0x1000000>,
+		      <0x0 0x18000000 0x0 0x1000000>;
+		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "nonstall", "stall0", "stall1", "stall2";
+		power-domains = <&bpmp TEGRA234_POWER_DOMAIN_GPU>;
+		clocks = <&bpmp TEGRA234_CLK_GPUSYS>,
+			 <&bpmp TEGRA234_CLK_GPC0CLK>,
+			 <&bpmp TEGRA234_CLK_GPC1CLK>;
+		clock-names = "sys", "gpc0", "gpc1";
+		resets = <&bpmp TEGRA234_RESET_GPU>;
+	};
+
 	sram@40000000 {
 		compatible = "nvidia,tegra234-sysram", "mmio-sram";
 		reg = <0x0 0x40000000 0x0 0x80000>;
-- 
2.52.0


