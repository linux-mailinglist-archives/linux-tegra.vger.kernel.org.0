Return-Path: <linux-tegra+bounces-12089-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGz4Od/5m2l5+gMAu9opvQ
	(envelope-from <linux-tegra+bounces-12089-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 07:55:27 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDBD17269C
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 07:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BFED3018E05
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 06:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F381634A3C5;
	Mon, 23 Feb 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSHbhvtP"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4009346E64
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829715; cv=none; b=LBq+My41qh7JZYxUQ2yWkmww1HT2fYYy1b7Ghm3sDy8WfWlJVM3z+GWNi7db8ofgcgKtAkyOzYcjPuPgQYQ4xSitRekrkz7+/UjMNEzJi9c4SUXPUxyyxJ5ftf0h60pxP+O5KUnDsx43EXJ53KSmt79adcxvDesSl3No7QTDoAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829715; c=relaxed/simple;
	bh=YS2+TKjPgkdQVfiiuYhz37N1nBBatkKGgp81DMRMxUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB2UBO1GQh3KLX+dwItzGFMX61h4AaJrYwbsPHYTCf4V0PUG7WEqAeyKhlxXc+vrbjSifBG7Sp7dCx5F/BvRNEFE9P/8DgF2Milu2Ynm4In/itvQbgR9etNAUTP2i3I+/ahb5XhOymbp8fS2tZWoe3hzcEG3wPI4o3b7THOoSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSHbhvtP; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59e64657f0cso4336638e87.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829713; x=1772434513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doVbZE++VdGK8RGQd9Rvpkfk97KFPksDed8hWboToR4=;
        b=FSHbhvtPeGv6o9smuytbjZFa7OQCGLxmKPR6NUvQuuKvt+BM8Qg0NvfLZMTTQxZ5tm
         pg4DexMDHkBCOfDEh/f1olVI9t7xesnbmZ1d3ci5DtHuhPFI/sxrOSMzEqvWhdn89cBQ
         XcVaYyMrxtvgtCkxtR3oeA82dvYDGVBtvlmpA+gEmdtvh4u4qbj+hc0eMvS2MhsYKFwx
         YpBj03KYoK2JKvJCVg1zMDPasVUj1bV9D0pV5eSriQ1vmBiRS94tsl6e9yDZOYWc8OL3
         6lYhaM43tejwYi++YU1UTipdkrWYuKPpBId1LX86SCbWHu4TG8AR8+2FDCDVbct80kOY
         s3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829713; x=1772434513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=doVbZE++VdGK8RGQd9Rvpkfk97KFPksDed8hWboToR4=;
        b=Bae4pAnc5IX0LffH689CMc2/cvSZ1X0LJxfOVop0ij9QyZSBW6RH6h9Dw4QvlXmgWk
         xN28lZHQgpY1i01SoSmwcQHU8X/5iILdoAHO1AaZd1jX8Jc0ChBaB7SSv5GFmGiKP8FM
         9hYBAVOKnQkAlpB//DcJVPIcZRKKQNRytgovT7u9XxD0KdTp7G5aWI1GvBgiPZnotasS
         /Ro9afS4jkF7jnVjV2uvC8TRkwKeig6bLZAWaCjJjwKMCqAnYPIJ67A0XB1p1rKbOq3Y
         PPl7jYtFpBRs4dXJU0A+wftuowKdVy51HgVL47YQsg06Rt3gPEuL8LW0cn1EHiaqN10u
         ZPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZsCy7k7UTEuNrjfASj9UjISu3/yQmZR5YOPZFowCcAUjGcYMwbS15PLNp6RmJ4ZB0V1HcgnOdUd3lmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzGxLJmvxo2/SN34+jGWE4B7sBLdS6QBvWFXRRqSroeXsTncd
	U66ie9lJYtkzHYQBOl/UhIFlwCQXLn7xYrymRnouQnvAmD4bwr/8CG2B
X-Gm-Gg: AZuq6aKWDsdkKmdJCvY2i86sZhzX8schU9RxxiAG6gTMp97HVnM9c9F+C/hYkOD+X2e
	lFggPgbLTBCcBemLNOUDXFWRam9xWMrJwXxC311LIH8CPiijU9yDeU3PzQ6I3/EC5mdg6yK8gNt
	7841lEJTwvQKMe6dO+L2v4gRf0eYOCw6yGJg6Lb7GwyldvbAeY1LH1YCVt6pO549jQcFEQSyBUV
	6OkIHHtDDi2lHVCANydsM5VeHB5qUaiBfx1l7+G3O9WKQ62hXDBhQmKRYSbjDY+waVHHDUXmKaF
	8uCciTgvbKY8psgfQw+xfoDJXjiYJXreb+KilmgfRil4JRyRnR37lq8Cje65VvDYQfNf6HHIVYk
	VYW/5l+7DGvvfqBlexap/sZC7dipecQVIIMBup17DB9iqIbqQRgzy47QLR2/WyELUpiUyFOvADF
	02e/8LyWhIhdjHtVSiVp3vcWA=
X-Received: by 2002:a05:6512:3f12:b0:59e:5d0a:a29a with SMTP id 2adb3069b0e04-5a0ed87faa9mr2440297e87.7.1771829712813;
        Sun, 22 Feb 2026 22:55:12 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:55:12 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: tegra: document Tegra20 HDMI port
Date: Mon, 23 Feb 2026 08:54:59 +0200
Message-ID: <20260223065500.13357-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223065500.13357-1-clamor95@gmail.com>
References: <20260223065500.13357-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12089-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DDBD17269C
X-Rspamd-Action: no action

Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
index f77197e4869f..b4bf2662780b 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -82,6 +82,10 @@ properties:
     description: phandle of a display panel
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: HDMI output port for connection to HDMI connector or bridge
+    $ref: /schemas/graph.yaml#/properties/port
+
   "#sound-dai-cells":
     const: 0
 
@@ -97,8 +101,13 @@ required:
   - reset-names
   - pll-supply
   - vdd-supply
-  - nvidia,ddc-i2c-bus
-  - nvidia,hpd-gpio
+
+anyOf:
+  - required:
+      - nvidia,ddc-i2c-bus
+      - nvidia,hpd-gpio
+  - required:
+      - port
 
 examples:
   - |
-- 
2.51.0


