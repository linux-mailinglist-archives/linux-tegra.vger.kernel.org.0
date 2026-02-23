Return-Path: <linux-tegra+bounces-12107-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJkKK0NlnGmTFwQAu9opvQ
	(envelope-from <linux-tegra+bounces-12107-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:39 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB6178131
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46878304435C
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 14:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D179629DB64;
	Mon, 23 Feb 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kyk4dhQM"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15929B78B;
	Mon, 23 Feb 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857215; cv=none; b=s9lKSTRL/krwFfbL9dVG3Wi6CWss/e366bBQzr01NIHLx/y6uo3sHg1TtHI285S3vRFUWwBq7MUU0mxYUcAzM7Vbyz21/joSQdAfvLncGuVNcOcb9+LXHUrvhxmkwx1np3UdnjPJy63+aVONCx58Ez/QcNzvLtUgkMUzEECTxbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857215; c=relaxed/simple;
	bh=fiHAA7p6WEhcni8cbHddIT/6mebi9+z4ggrvNdekLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQIWsyayYZIDbao4k0QAYTDuvIYB5KxSe27AmuGeGwlGH8injsznSV6X/SRJEBYAy8evG2yTNl41Tm65dMk1QZmlnqulxDnXxA5RvIgqfGX1IYL0D25ZpcH05Mujt4aeTU6rBE97aFZn8qwcsyNoz+vpTbhbMJtAxGnd2rGiBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kyk4dhQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30E3C19423;
	Mon, 23 Feb 2026 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857215;
	bh=fiHAA7p6WEhcni8cbHddIT/6mebi9+z4ggrvNdekLo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kyk4dhQM5ZRi8zEc06NynLBPvdPHkxhftwXXc9MKZBJpRJ+82zwfXGCe2nyY8Wbr2
	 da0SNsA0h+o3FuLvmHmC2626ordP3BaiDk5VLKKcI0WDejrnG9zRhoSAFi83R2HuDL
	 n0xdysUMlMrm5XNH4OUs4MwpE68oNPR/xpzNSExmkfxIbl7PCsbjx/qgd1MaMJfEQh
	 UCa62YosAK8NSHpP/QGp7lFeMrvP+hnW/f0uiqRBasHf+cdcCIKeqZATUHkOcJEsor
	 /sIuWBuwoabsBVkATbkz0gJdnsscyXHuqXoZbDx0dbqaqOZMt//jkgM/zE4VycGvzF
	 Hq0Zam1SqYDdA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 09/10] arm64: tegra: Fix snps,blen properties
Date: Mon, 23 Feb 2026 15:33:04 +0100
Message-ID: <20260223143305.3771383-10-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223143305.3771383-1-thierry.reding@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12107-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.103.194.128:email,0.105.73.32:email];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 34CB6178131
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

The snps,blen property of stmmac-axi-config nodes needs to have 7
entries in total, with unsupported burst lengths listed as 0.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 13ec999e52ef..4ae3601734d0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -3621,7 +3621,7 @@ ethernet@6800000 {
 			snps,axi-config = <&mgbe0_axi_setup>;
 
 			mgbe0_axi_setup: stmmac-axi-config {
-				snps,blen = <256 128 64 32>;
+				snps,blen = <256 128 64 32 0 0 0>;
 				snps,rd_osr_lmt = <63>;
 				snps,wr_osr_lmt = <63>;
 			};
@@ -3663,7 +3663,7 @@ ethernet@6900000 {
 			snps,axi-config = <&mgbe1_axi_setup>;
 
 			mgbe1_axi_setup: stmmac-axi-config {
-				snps,blen = <256 128 64 32>;
+				snps,blen = <256 128 64 32 0 0 0>;
 				snps,rd_osr_lmt = <63>;
 				snps,wr_osr_lmt = <63>;
 			};
@@ -3705,7 +3705,7 @@ ethernet@6a00000 {
 			snps,axi-config = <&mgbe2_axi_setup>;
 
 			mgbe2_axi_setup: stmmac-axi-config {
-				snps,blen = <256 128 64 32>;
+				snps,blen = <256 128 64 32 0 0 0>;
 				snps,rd_osr_lmt = <63>;
 				snps,wr_osr_lmt = <63>;
 			};
-- 
2.52.0


