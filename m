Return-Path: <linux-tegra+bounces-12104-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCGuJkhlnGmsFwQAu9opvQ
	(envelope-from <linux-tegra+bounces-12104-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:44 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E461B178139
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9217D301CC5F
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 14:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFC829ACDB;
	Mon, 23 Feb 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzG5zw5Z"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D2222585;
	Mon, 23 Feb 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857207; cv=none; b=MVoFM2KGfC60bpRNcZBWifZD36JWrKPsgmSUr5GhkEy3/q7evvmfM8Kyx6vlzmHBRRvroLcpM05+WZiD8r5kCoPPYn1E2oYyYkZTM6b1VY/WDyY3RqtO0mCwpGCWbsj7W4qxDKNVlJnQR5G6fafpy+TWmiPMSrKxK+JWEQ1OLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857207; c=relaxed/simple;
	bh=DYP+svTxzjqzMUJliWZ3Xn80kpHLYq8kjDQCxTDzEBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oP2eupSNYacAedkLiZw1COjTYY5zvDnAUOXp5d+cOul6KlRXSaKqRoyu/11o38udhI1TbJHxFxaxGGVXpwtWYFx3cUP17E30mveeyfgCGeAYgQfRD2EgNckiTIlwZ92KGMP8sI5wME4i4R5QsqJ7PW9fbskIxzXwzPR75zqnhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzG5zw5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C6BC116D0;
	Mon, 23 Feb 2026 14:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857207;
	bh=DYP+svTxzjqzMUJliWZ3Xn80kpHLYq8kjDQCxTDzEBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzG5zw5ZGKZVlnNATOGh14fM0ppFuh5xlgiAnB82TcV2VdDkHcZzWdu9XXraEGKAP
	 sE/3GMkijtifecPQY+Lx6oY4wCpbEXjhKnS/RIQlxgkKhvvK8LU9QSAHnyHYCYbI0T
	 5AFvxul6vi2NzLVacNDYXC5DFttK1xUEvj9Jh/NslGcsB5dY5bedn0EcNDDBtHpys4
	 iQ7hLpRbpf3/iDGXd/CM2KunaWeZxoKCuxo6wBiaYdK0VW0Tz7OdUZb6KynptdOPUH
	 oaaUbmJV36yv/vtsYS6ZHhZWzevqZDw5eXY+lw4ny6o0fyLzrqOLTOvRy97wO/teCb
	 AxlovCEU0KXgQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 06/10] dt-bindings: phy: tegra: Document Tegra210 USB PHY
Date: Mon, 23 Feb 2026 15:33:01 +0100
Message-ID: <20260223143305.3771383-7-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12104-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: E461B178139
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

Add a compatible string for the USB PHY found on Tegra210 SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
index d61585c96e31..a37e8322dc50 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - nvidia,tegra210-usb-phy
               - nvidia,tegra124-usb-phy
               - nvidia,tegra114-usb-phy
           - enum:
-- 
2.52.0


