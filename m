Return-Path: <linux-tegra+bounces-11467-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL8NOIlScmnpfAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11467-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:33 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D39B6A1B6
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B2503010D9D
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 16:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EDF3D9028;
	Thu, 22 Jan 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbN8XEHw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAE3D809C;
	Thu, 22 Jan 2026 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098236; cv=none; b=NPLLBm3mZmK+Dp8DhjyEh9XS9INOp3Aq0JUb6pzzGVz8wxV4bGiv6G9POOOakfhPeuUTUkooaJWf8SemYTSJ4/o2XY11yIf91pF8vr+HdfBjU9EHftG3cNv03NQ+ED015UcLstl7+tSHUH1zt92npSOEAhZmdmlwAvc+B77vIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098236; c=relaxed/simple;
	bh=m7OZFi6NVZYBpVcc9Brq/11LIbbM8dBnjfFzHERIm1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEEWTgIGo5qj8XV52yfNNjWzxESqO+RARDBY2w6qVmiKwIBIDEsQOSmKLuD8p1ZbL+tMbK1/B/S60GkGAxVUCeVx3RNy6UOOjFe15HOfiyIeCFu1rWuhSzwH+YIDtN0YdVWBos6mexC/fCrXWzTBA+F0SFNWJCUGvla59vgQVt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbN8XEHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6A8C116C6;
	Thu, 22 Jan 2026 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098236;
	bh=m7OZFi6NVZYBpVcc9Brq/11LIbbM8dBnjfFzHERIm1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbN8XEHw72VeMDyuWqKNlM0ZYRmW15E1SiTonTzrWsxolsQ4dOtRG3H0Q3oacARgr
	 bFDLpvE2ygRw/Mc8R87hyuIfTIxn1xu+KLATFEaXyv/4z55VOSKFNmREjuqTs/Dahk
	 dms0BlkPbL7CRlYKFiXkoU+2PR/GQZAeGtTSc1buSKNKtiqa9ZLm0maslOdswqYrOD
	 LWMOZiXZUHJO6QgvKrYMXChxOf3/BcNGcRUs1mpia0ZOOhyeg2g9FEUC4mL2X6HSeh
	 SlkxzQvkwdEx0CMkjHOLPZZq7ivthjMo060+NWqljOZURFE4k2TgKhQFGXTFzt6kCN
	 KnKc6oBQtrc1g==
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
Subject: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on Tegra234
Date: Thu, 22 Jan 2026 17:10:06 +0100
Message-ID: <20260122161009.3865888-8-thierry.reding@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-11467-lists,linux-tegra=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 7D39B6A1B6
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

This node contains two sets of properties, one for the case where the
VPR is resizable (in which case the VPR region will be dynamically
allocated at boot time) and another case where the VPR is fixed in size
and initialized by early firmware.

The firmware running on the device is responsible for updating the node
with the real physical address for the fixed VPR case and remove the
properties needed only for resizable VPR. Similarly, if the VPR is
resizable, the firmware should remove the "reg" property since it is no
longer needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 850c473235e3..62a5dfde9e38 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -29,6 +29,40 @@ aliases {
 		i2c8 = &dp_aux_ch3_i2c;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vpr: video-protection-region@0 {
+			compatible = "nvidia,tegra-video-protection-region";
+			status = "disabled";
+			no-map;
+
+			/*
+			 * Two variants exist for this. For fixed VPR, the
+			 * firmware is supposed to update the "reg" property
+			 * with the fixed memory region configured as VPR.
+			 *
+			 * For resizable VPR we don't care about the exact
+			 * address and instead want a reserved region to be
+			 * allocated with a certain size and alignment at
+			 * boot time.
+			 *
+			 * The firmware is responsible for removing the
+			 * unused set of properties.
+			 */
+
+			/* fixed VPR */
+			reg = <0x0 0x0 0x0 0x0>;
+
+			/* resizable VPR */
+			size = <0x0 0x70000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	bus@0 {
 		compatible = "simple-bus";
 
-- 
2.52.0


