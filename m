Return-Path: <linux-tegra+bounces-13012-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDx7H+PbvWmuCwMAu9opvQ
	(envelope-from <linux-tegra+bounces-13012-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 00:44:35 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0342E2559
	for <lists+linux-tegra@lfdr.de>; Sat, 21 Mar 2026 00:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0994300DE39
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 23:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F083D7D99;
	Fri, 20 Mar 2026 23:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQ3yelM8"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF23A3835;
	Fri, 20 Mar 2026 23:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050212; cv=none; b=R5vlHUe9D47NBhdypZZVL0v9iv8iJEioi4mTwRpgkziajerUU1fcQyaTMOaNDMfDslHnu1I/2YU/SCC8wpb7sfJFogtw3ZRoAA9HLv19v0tL/6BTZiavywG7d0Re4Kojg+mrdYw6QYNhZwXr6GMnHZ5+uIKnmManWtrV8wC2LKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050212; c=relaxed/simple;
	bh=OgxtOs+jWVf9lCYzsNg+BlX1lIqL8iG3bhT2eBw7ubo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kE5OfPkLe4C5jzuTPuxfAHATpuvSBrxCXJKSBxxaq0+ufAxbQQIe606mPbCkDCWx+0ILFa3egofofCIm2j26gl3zy2hIqn1GeKOwg/fLBLCq9SXHcx8PdphWYpsvOS3lllmoot0BwZpb17YMeEnF/FLNAnDDYJ9poQhI7Ll+uUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQ3yelM8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3601BC4CEF7;
	Fri, 20 Mar 2026 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774050211;
	bh=OgxtOs+jWVf9lCYzsNg+BlX1lIqL8iG3bhT2eBw7ubo=;
	h=From:To:Cc:Subject:Date:From;
	b=UQ3yelM86aG9AOcXFs9TJ7SIf7LfQ68wry7JWlcHS5m8lnc3uPXFzQpaUlW9AQBXS
	 StkFjVWLf9pioao77TJ8TlOIUNErZRMXTIDrI22I5vn86sQKxOpXOXzZw/e7z81wPd
	 q/6KmnOtnxMR5vs2nqvQL4Y/jMe/QJRI7T89qEW8aVRB3bd8IZ7qQX5rB5qarpUZ+d
	 E5c1oSPMYJKMfIrrfg68CHVDqJGBZVBPu3ju0Ky5CR9oGi3twPjcGZ9o/uW227FDKZ
	 moqTL4IAPK7c7KsvnUQGOPf8iL3Uu0OjDYC8RT2GDyM1IuIoM/gokebGEgQ5fW2ii6
	 +X5XSR0tnfmBw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit
Date: Sat, 21 Mar 2026 00:43:28 +0100
Message-ID: <20260320234329.2579213-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	TAGGED_FROM(0.00)[bounces-13012-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: CA0342E2559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

The Jetson AGX Thor Developer Kit uses the same module (P3834) as the
P3971 reference platform but a slightly different carrier board (P4071).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 50a31dba7bec..df257102bfa0 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -268,5 +268,10 @@ properties:
           - const: nvidia,p3971-0089+p3834-0008
           - const: nvidia,p3834-0008
           - const: nvidia,tegra264
+      - description: Jetson AGX Thor Developer Kit
+        items:
+          - const: nvidia,p4071-0000+p3834-0008
+          - const: nvidia,p3834-0008
+          - const: nvidia,tegra264
 
 additionalProperties: true
-- 
2.52.0


