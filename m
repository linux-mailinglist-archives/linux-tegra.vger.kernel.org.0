Return-Path: <linux-tegra+bounces-12099-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EwECi1lnGkoFgQAu9opvQ
	(envelope-from <linux-tegra+bounces-12099-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:17 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B71780C0
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B46A3045258
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 14:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC25299922;
	Mon, 23 Feb 2026 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTN00XYz"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D10230BD5;
	Mon, 23 Feb 2026 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857194; cv=none; b=aSDn7vF0ZCHY0DzQ7byKZdZFWhEHMaXaPIT6ZYQ44+Ik919qb7f6TAdhSVEk/mOvr08TA7PnQcgiRWCWLdmP7MKl2XfYWBVpkcmRvS8gWoo2lNttZCtJYw/WgIFFb35am9aCWxd0KSmdjMBDOAazaUFDMGkmJqV/KrXPgRAd/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857194; c=relaxed/simple;
	bh=Q0FH397Urfh6xopj0at+Jh0Bj2tII/FPxDR9SkcM+54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/QH1oha7Hev4QJW13z3pBRNCS4h/xO59fCyYPHQ+3trUT6DR4CH/12etrtHtv2RPn30O/69UoENziV2r6arqiCSljgIyWyhMUBPfxQBf/C0WWBwb455xDN0hExxEC+pv4QFzzNVbY+WdkpDMzJ4XBnft0d4HPbAQHheFDESeTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTN00XYz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668E0C116C6;
	Mon, 23 Feb 2026 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857193;
	bh=Q0FH397Urfh6xopj0at+Jh0Bj2tII/FPxDR9SkcM+54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GTN00XYz6h+wTFeDv1on53bUkqYp38H5NstW7PDfefSyYFnRwShVbelloZ8YOUyyP
	 jp4EtT57mePHGTpJjA29ZCkXJIRctx4c20zqLPRSIqNjraDivgdgVxrgp7s/cjFKKX
	 qR3Uf9zDq5eDcE3DzcKWr9BJls4lDGZcH7MYzYnU17AzG3hk6uVdD0i60naViyBNcZ
	 E6Ztvw21bFwHMso9nMflWY55giQkdVeYrMgmpj5Ni7+hwdw2Elg3rrk+1ke8a+0npu
	 CuSPj761zUOZxD9624wRCHx3MNhkFixX9+K4oNCrZWF+UqG5TWtZfTuQ537jTGQcTf
	 cmGwrBX7RgZdw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/10] dt-bindings: phy: tegra-xusb: Document Type C support
Date: Mon, 23 Feb 2026 15:32:56 +0100
Message-ID: <20260223143305.3771383-2-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12099-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: DC3B71780C0
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

Each XUSB PHY can be hooked up to a Type C controller via a port
property, so document this in the bindings accordingly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- make one of port or connector a dependency of usb-role-switch

 .../phy/nvidia,tegra194-xusb-padctl.yaml      | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
index 6e3398399628..d8de900a4fce 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
@@ -230,6 +230,10 @@ properties:
           connector:
             type: object
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
           mode:
             description: A string that determines the mode in which to
               run the port.
@@ -256,7 +260,12 @@ properties:
               voltage.
 
         dependencies:
-          usb-role-switch: [ connector ]
+          usb-role-switch:
+            oneOf:
+              - required:
+                  - connector
+              - required:
+                  - port
 
       usb2-1:
         type: object
@@ -268,6 +277,10 @@ properties:
           connector:
             type: object
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
           mode:
             description: A string that determines the mode in which to
               run the port.
@@ -306,6 +319,10 @@ properties:
           connector:
             type: object
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
           mode:
             description: A string that determines the mode in which to
               run the port.
@@ -344,6 +361,10 @@ properties:
           connector:
             type: object
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
           mode:
             description: A string that determines the mode in which to
               run the port.
@@ -405,6 +426,10 @@ properties:
             description: A phandle to the regulator supplying the VBUS
               voltage.
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
       usb3-1:
         type: object
         additionalProperties: false
@@ -438,6 +463,10 @@ properties:
             description: A phandle to the regulator supplying the VBUS
               voltage.
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
       usb3-2:
         type: object
         additionalProperties: false
@@ -471,6 +500,10 @@ properties:
             description: A phandle to the regulator supplying the VBUS
               voltage.
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
       usb3-3:
         type: object
         additionalProperties: false
@@ -504,6 +537,10 @@ properties:
             description: A phandle to the regulator supplying the VBUS
               voltage.
 
+          port:
+            description: connection to a USB Type C controller
+            $ref: /schemas/graph.yaml#/properties/port
+
 additionalProperties: false
 
 required:
-- 
2.52.0


