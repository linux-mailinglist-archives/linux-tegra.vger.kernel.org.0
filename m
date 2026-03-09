Return-Path: <linux-tegra+bounces-12655-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNXUEXl8rmnoFAIAu9opvQ
	(envelope-from <linux-tegra+bounces-12655-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 08:53:29 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66E23513E
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 08:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E15D03006232
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Mar 2026 07:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F89B36AB5F;
	Mon,  9 Mar 2026 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8JZtw2L"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96CC36896D
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042796; cv=none; b=WQJ7BTKKRwvuTOnoMNx6gwAb8pWOSpVHLs++Png+bGpp1nLPUF/bbfAp70DHD7dX2SJF6NejIuCcrKMc88LdaV71dz5vSB1vvWkcFq4Cm1CIsCbmmODyC6ibVJ2q4sE+6G/y8j6uws1dQ7EAFAQrTItqgQ0CFdNcjAL0YLJOfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042796; c=relaxed/simple;
	bh=BfCGLduhY9yG7QLq78Hh4dR6ZPzK4zm1QeyS8EzRSxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXKh3dWw9R34kaDMTo+Zqs5Pzs3/yJfJ/EkP3b6UR5wP6x3twi+WEzF/+ZJWOBEolMjDwr2SutmRwuKvOmA6u/2M7IEgEkk35nHZsFuLNwzElq7Ik4rBtBwZyHvPr6wd4nGi7vqdw+kLnIrVfPmReGA0qnbgU5c1au6upK71zDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8JZtw2L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso113377295e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773042793; x=1773647593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
        b=I8JZtw2LZx739So3eBhwattFpRcM/xJeGX48zSgjcbsJ4loHtVOdhw27bOASyxg/QK
         iTJElJGMR++V4iLgpAZWCW/zXomiigO0SZ8/gMRcK8oxmgIf0kgU+KWmHwsqwJOhUmNl
         uYkLaZOJ+Bh6Xdp/V43EUH3/gjJev5BuQpLdOQoJxvIAbaQ3Iwl4rcpMfLenllXtPM6A
         FPYLJqp57ywk/1NyJWBqqIcyxgN7q46YmJOJZYHa8v5TSQ5Gh6n1zA6og5FF05Ilypsk
         Y2Cf9+Yfc3sAIpH0jsOktB6KCkSTyfEje314ySJM314l/v5k5CrskOmae8XN/rjuXdZ7
         4ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042793; x=1773647593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4/vo+yztL0AmH8P24goXzbtezovr3DoQGmWB3EtlnhE=;
        b=bPRICZw+lKaL+9d1W9cUaU48fmjZ/ednJ/FxWbLjuxM882ryaofMVJWexHwbFJRSBs
         xjR8eNLlzQQkwZL6W85gZN1q2xam4rs8wgXXAFvTZsYJ9IzaiohDT0P8Hg0rkqXPkX/l
         x1QxVw6u6Ank8TQMERUlSF8BjJjEmnaTKhB5xuXedwQHLBne9W0mT2OAdMEsDDlQdx1U
         qdVPIQeKoR9DpnNJvK0xIiEqbMhuBI0NnYrmsceSFQFIYwzvgS1jU1MDCgU/O1m+hHus
         B8XZMurDTygqLiEYMx+LLdsY21DuWvhj1gIAw2olYpsTWsnecq8AJ2EXYTqGWNzDQJtH
         v+pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuS0ahCY/o3XnI0Epq+JaMMiWiZQiaEwo+Q/QAh40ESsY0/dnZpTZUB0CsLu1RwdJEAvKTZrxVE1FrRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YylzCTlq7Ar/T6NfYw7ZU0cBEoTb/Dg8dybJ9hNqHtiMlBMxBxG
	+Pz5ev0gAfNT+EPq9R0rDoQsNAj5PK3dYHrbDhY9pgVwEihQ73+1YyWY
X-Gm-Gg: ATEYQzxvARR/xxINlENXHAPJArLZft/rZmB+Ot1RpTS/1ebqDst9aFegXgOJaQu86BE
	PhdLCM+jGEfdIUGIgmR9asSdQID0g+4cvTYBkqlqOe3rzWbF4JGHT3g6kV59cWfoR2QQWcP5oIJ
	FaEXfcb+GFqtDnm41drVTpj1vzQKTBKxFoFYTYjDIZD3e3cvacF2d/4XpFOVq+yPtUxur3H8QI8
	cb0AlwANkH5IcAE6BdWP9j75QUrjb7sAj8KbKGfiszFS+0EOD+4Hf2VHz30TulobONBkedYB42u
	w7wshrN7Akw/hD1a/FDqZ9m9LowvmKwTwY6Zv2VBmxr2+lAreZr0br+FeDqLVnuyohuosTZfpcB
	N4eipieaTFCw/Qx+Az0Mr4IwGPtwzq8VN4JjB9QQaxT/TbMMBKkPVfRxUCjhfcr1J0lTRFdd+Ir
	xHn4kZVrhxzusXbmjtAVMC138=
X-Received: by 2002:a05:600c:3f06:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-4853e0094c8mr13491155e9.9.1773042792676;
        Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbd87sm97799975e9.16.2026.03.09.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:53:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] drm/tegra: dsi: re-add clear enable register if DSI was powered by bootloader
Date: Mon,  9 Mar 2026 09:52:48 +0200
Message-ID: <20260309075248.47730-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260309075248.47730-1-clamor95@gmail.com>
References: <20260309075248.47730-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F66E23513E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,tecnico.ulisboa.pt];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12655-lists,linux-tegra=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.981];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Original commit b22fd0b9639e ("drm/tegra: dsi: Clear enable register if
powered by bootloader") was added to address the issue of DSI being in an
unknown state after the bootloader, ensuring correct panel configuration.
This worked fairly well under the assumption that the bootloader had set
up DSI; however, in cases where it did not, the device would hang because
a DSI read was called before the DSI hardware was ready.

Removing this workaround results in the issue described in the original
fix: the panel initialization sequence fails and the panel gets stuck in
an undefined state. This is especially noticeable with command mode panels

In order to properly address this issue, the original workaround is
restored and placed after the DSI hardware is prepared for R/W operations.
This fixes behavior for both cases: where DSI is set by the bootloader and
where DSI is untouched.

I have tested this change on Tegra20 (Motorola Atrix 4G),
Tegra114 (NVIDIA Tegra Note 7 and ASUS Transformer Pad TF701T), and
Tegra124 (Xiaomi Mi Pad) with U-Boot, using both bootloader-initialized
DSI and untouched DSI.

Fixes: b22fd0b9639e ("drm/tegra: dsi: Clear enable register if powered by bootloader")
Fixes: 660b299bed2a ("Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index fbab10bc5c41..e7fdd8c7ac12 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -936,6 +936,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
+
+	if (value & DSI_POWER_CONTROL_ENABLE)
+		tegra_dsi_disable(dsi);
+
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.51.0


