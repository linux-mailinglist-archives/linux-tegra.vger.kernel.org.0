Return-Path: <linux-tegra+bounces-12108-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMTHHFRlnGmsFwQAu9opvQ
	(envelope-from <linux-tegra+bounces-12108-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:56 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285E178150
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C11C63022999
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 14:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3850A29B78B;
	Mon, 23 Feb 2026 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTay4Rpz"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1434A27FB18;
	Mon, 23 Feb 2026 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857218; cv=none; b=K0AHORvMPb28AJwCKsxZcUEBdjf8vPPfPoufNCzpERlGw8k7NgWUfH9YkZXbzzrtz34SKbVYMWLNT6yKl35M0G+ugJ6+WlQfLdIZ9tvLfM4ae8VcJUs1XkOBWrCOcyEprDv/gZzEss4EfujswNadx3yzgWJDqplnF2XXh/Rx/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857218; c=relaxed/simple;
	bh=TXE8D9RPrQ8KKV/nSzXY6h9Zw5x8EvO0QKjMfDIdkkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1x10HAROApUaQmXJbgpejzS9K7LLk2mxG+/pNQjjZG04W4ZnkJbeBXsdgpoMS1YZ86Mq31rP+fqypYHgMCzIpLNrGNcNJFxpL+heZJkmxLUZqjORl/VROgq7Bjvm/M+hn9v1ZGS9r+Yj1auE8rgtTJPTpFSQ4RRWpH+a/Jtkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTay4Rpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94511C116C6;
	Mon, 23 Feb 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857218;
	bh=TXE8D9RPrQ8KKV/nSzXY6h9Zw5x8EvO0QKjMfDIdkkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTay4Rpzd3KI6GrUBQCfj1SyrYMMYVC6ICpDMoG5Q1tXBa+S3JhBWF/E7fI7wnxJo
	 AS5LLDJtlzcxbj0ZQTveItbJgW7sTmZfSlhObNSrFFAe8jHdx5xZOFNlbWjZqgW5qb
	 5Jsre4eHCJao7i8FDi2Uib/CUD3lW10PzNS6n8euRabVRPjCDvovdCtmfPi6DZh4qD
	 HRVQ16qD4SsPqMpgTKcwQBfEe5V+h5vcoj6NH8I/N2F/WPbznU2s4JzEhht7j1tR80
	 WivQ0Q1hRzxR3/bCxCEbzWsxqLMIShMOxVMMhMJuupykVCY6/MyWc7UeOXUReFOAce
	 jvOZmwckiBerg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 10/10] arm64: tegra: Drop redundant clock and reset names for TSEC
Date: Mon, 23 Feb 2026 15:33:05 +0100
Message-ID: <20260223143305.3771383-11-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12108-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[3.63.154.160:email];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 9285E178150
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

The DT bindings don't allow the clock and reset names to be specified
since there is only a single entry for each.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 137aa8375257..5f5e5370d709 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -309,9 +309,7 @@ tsec@54500000 {
 			reg = <0x0 0x54500000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA210_CLK_TSECB>;
-			clock-names = "tsec";
 			resets = <&tegra_car 206>;
-			reset-names = "tsec";
 			status = "disabled";
 		};
 
-- 
2.52.0


