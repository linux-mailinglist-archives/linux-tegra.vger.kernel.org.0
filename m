Return-Path: <linux-tegra+bounces-11901-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKKPDR4Ai2nJPAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11901-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Feb 2026 10:53:34 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9F81192CB
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Feb 2026 10:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A3F30B35F4
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Feb 2026 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4340E342532;
	Tue, 10 Feb 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Icqf5Huu"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097932B9B9
	for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716973; cv=none; b=talcvdOZXNfAoo52xO8E1ef2jUORE2g6O8FC0Z40BruvF0bOsEQ1+RclubQGqdCBX+sO1IPYu50LJ+k2hHb4P4cLGRAnK4cZZ9ttu1D2dLw38fqWPIo4zk+dEfFcncaMlpHwTnKUpIBHKxpunl9uD9tZyBd0Lto3i77UnGgEIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716973; c=relaxed/simple;
	bh=yCXs77136XUDSF5gi4NbN1ndGjnJitNQS1pBWK3ZSq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4IvGsbMNdlj1exZiMlwgOQC/LruLXjv80BnnOxb0rpjdeVE/rOKk7CejYJKKxkzb/pBsvqT7/dd3TavHCcSCmUWmfd384Icdmx4drrx1X6XYpXsISS+ckJ4X0I+CqhOA6tOr0Pf4GbfX2Rpds38H0lRI55GhQ2tWy3Qz/uQN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Icqf5Huu; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso834210e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 10 Feb 2026 01:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716968; x=1771321768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMvCNjWR7MERKti0fKDG3wrcg24MnDacQ8c/Hcdig+U=;
        b=Icqf5HuuxNR8bp23MQFC5h54wtFKg1OpAQsTa4QKxnVYQb8JRaHU5JPx1C+YAp96h4
         5oi/KWkaQ7kGqnOQAApVDoKqaDhCSeoMy+am/UVngEdqp7yhbDy2aXnu8BmS2c5Ogcdu
         swvfshwPhkL1btaDaRccwC3MuuHClVWIREmgjDt8+k2Tjl2+fZX1VYT3fTTfG61sxEFi
         W79nf+Q6C7u3ZYhpqYDX+sLtJsgVWIJwgfmv0/JLohoLk1wGYGf9NmZS8eRuKqebEMVl
         AqqVmzwyV3KKnUZOjVea1Fp+6MA7IoPMhkbqbBmiVrWKbcnowU/tLuGM+8pn85a0d453
         So7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716968; x=1771321768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMvCNjWR7MERKti0fKDG3wrcg24MnDacQ8c/Hcdig+U=;
        b=rtkQX4KyvZsvVV69HzuI3lWBhGS2xKETetiQ67KwYIL3QThjX5Nv+9IHD9++BAxlrD
         QKXaTMJkuRgIq3IH9WYumAlXwUUORFUUlUwuQAbnqtkIYFY28MWcMnxQMy9qHWNqe5HW
         1qeiG2FzRRVLIXZeEWS2nsU4P30uqsykbR87mv7AWscNGQhK8zU5pwzxpRVhXn1+TnYM
         Hv6ZucLLmyA5ZYH6f3hn/t+lCuN4ANmrYJ88fqwDWqHbvkkPyhngyigdM1QHajOZ+Jpr
         8VT5gT6EjluODX1LnQ5gv7Y1MNhs/q3mHnrxByXOiuC9LYJaeYoWh12iULe1yh9IKexP
         rnRw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ImzM/ieR47ybwFg/tpYARafgg+creF2LIvof5hFCcGrBJ8DXN+KPI7okPJ9I655E7e9KkSiORKH/Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVayJfRm8rsKqfUoa6rH82yvBq7nilS5+wHTrKU094/oropscy
	3ilgI1hjWOAE/SLLpOJ2EKoxSPY88U0kaWMrh+OGrhLeuiEIZSSYwtMT
X-Gm-Gg: AZuq6aKZs2mPYVcF9AiLpe7cvDTuIWSewxBCW6DF2yur6ZfvBsx9YIlAK3vpI5dCWcn
	Qn2E4+qhJDdhgRgeHqpVCoduI9HGynLUSjIgXGwVtHSVrdduUuX2h9zrl/YVOZrFuuDwNyTvqFO
	jlrSVrgbOpEZAuG3CIkHaGvxZe9E6zL8mZuDOFVw9s+5b1b7EwvnpolLCwiBpEHaiONUgp4ib1N
	2S3mDpzW2p4LFwySfFoUEaOnyVye16Ni7QbICvOUto4ocCC/+Spp40WnZ1b6o49lXsW5PVLVpEP
	Ur3np+vemv1kR+i7NlmjyPj6GbKeGQJfC3SgYKNj8yZ1mPDoGjuCG7TCq/qxKUbxnnmalJmqcd2
	M+ftHPEpM0lOV7V+qksawED6Y7mrV4i+45GLL7q1gMhk6N7Lesavf8P+4mwyyo8lu1Qmtoj+/Oh
	C0oHTUOeNAai6d
X-Received: by 2002:a05:6512:4010:b0:59e:3e8f:ccc3 with SMTP id 2adb3069b0e04-59e45153338mr4748050e87.32.1770716967558;
        Tue, 10 Feb 2026 01:49:27 -0800 (PST)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44e231d5sm3191691e87.81.2026.02.10.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:49:27 -0800 (PST)
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
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 HDMI port
Date: Tue, 10 Feb 2026 11:49:07 +0200
Message-ID: <20260210094908.14276-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210094908.14276-1-clamor95@gmail.com>
References: <20260210094908.14276-1-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11901-lists,linux-tegra=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F9F81192CB
X-Rspamd-Action: no action

Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
index f77197e4869f..f33b700bf0ee 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -82,6 +82,10 @@ properties:
     description: phandle of a display panel
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: connection to controller receiving HDMI signals
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
+    - nvidia,ddc-i2c-bus
+    - nvidia,hpd-gpio
+  - required:
+    - port
 
 examples:
   - |
-- 
2.51.0


