Return-Path: <linux-tegra+bounces-12106-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDreKk1lnGmsFwQAu9opvQ
	(envelope-from <linux-tegra+bounces-12106-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:49 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F28E9178140
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 15:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEB4A3013700
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 14:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ABC299922;
	Mon, 23 Feb 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1lFWBEo"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE127FB18;
	Mon, 23 Feb 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857213; cv=none; b=Usb4OM6UOg6BsivCJXDxg5EDHXmExBb6x+dgYU951hYH+gPFeTzPH+Ax09CKa8tbGX8jRm15JabatrZFfrdlscjxh5WAa5WMml6PKwAqmTFV3VkbiNc5a+EqHcTRih+JLNT8OmTSivQdBqiUly3xy0zwvQsYT+d9oOK0WBkHyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857213; c=relaxed/simple;
	bh=SCd2PdWqmoSRUceewBFV2KibBPAiNgsFHQx4MPUVckI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jd9dIyN9pEFS5NH/ls+vCiPQTE8ECLJjkNGp/InRKRfmSuhYZGNK20NCJWXTEUtkagcUiyMInBgU4C7NroHPDM059144dCTsUnvi8MkQg4qcJj/QhzkzKZUApboW/93e8MavpCkwL7f4iToPnSesJubXJtyULnX2VpQW79AfDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1lFWBEo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4526CC116C6;
	Mon, 23 Feb 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857212;
	bh=SCd2PdWqmoSRUceewBFV2KibBPAiNgsFHQx4MPUVckI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1lFWBEoWWS4EoBpjbHBlZSz2uXWOFkljHQSaFQqBfdGH9JDiHMSiT2zkVpVKccaK
	 vc8+twEXRsbgxpkDWhq6LPFfBx+XdApFe4t6HontcQRwMGU+x0RLylvhEYiEWQuNUL
	 C7DR2zIhxvILITkSdsn7WKPCxV+msSM9gWud/twixBU8ZMKRxFuAnDaUzwKDPZ5GlS
	 sUWUEIZx88AiK+GIBuaER5W2of1hWWPUPpf7K+uxCWVophx2NlujJeibS5MRJL/8aa
	 L7RtsUhS23TKyukvdLuJvAxRegBlWVyHUrXXR6f9lvcB04lLa9YoSHbc6atG4omi/A
	 e9LO+PMCRDdQg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 08/10] dt-bindings: memory: tegra210: Mark EMC as cooling device
Date: Mon, 23 Feb 2026 15:33:03 +0100
Message-ID: <20260223143305.3771383-9-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12106-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: F28E9178140
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

The external memory controller found on Tegra210 can use throttling of
the EMC frequency in order to reduce the memory chip temperature. Mark
the memory controller as a cooling device to take advantage of this
functionality.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/memory-controllers/nvidia,tegra210-emc.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
index 4e4fb4acd7f9..7a653a011f03 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -52,6 +52,9 @@ properties:
       Should contain freqs and voltages and opp-supported-hw property, which
       is a bitfield indicating SoC speedo ID mask.
 
+allOf:
+  - $ref: /schemas/thermal/thermal-cooling-devices.yaml
+
 required:
   - compatible
   - reg
@@ -59,7 +62,7 @@ required:
   - clock-names
   - nvidia,memory-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -90,4 +93,5 @@ examples:
         operating-points-v2 = <&dvfs_opp_table>;
 
         #interconnect-cells = <0>;
+        #cooling-cells = <2>;
     };
-- 
2.52.0


