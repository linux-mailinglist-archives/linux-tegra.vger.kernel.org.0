Return-Path: <linux-tegra+bounces-14028-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CSaAFrW8GkSZQEAu9opvQ
	(envelope-from <linux-tegra+bounces-14028-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 17:46:34 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84683488285
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 17:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4B15301387E
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 15:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A893C1400;
	Tue, 28 Apr 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQ/1NifX"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70D3BED06
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391189; cv=none; b=hxt66bVtBRyo+imon7x4pQOqVjQMWhhr5UyJ3a6LBAhJNwWsGWaFUZGR6ThyGvrVNMgg4pZ39FuxjMmMYGNgXcKhVKZxYfJ1uMi65gcQh4HkAQMWkiGqdJDLgiQE/mc9TNdf+pJXAEyCv1Ed7h9/8M5CuEB1Z7ZQDTZXm3OgQeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391189; c=relaxed/simple;
	bh=3l8/jYpkdXsG6SyQfIwBjPSuCSBodHOhQRlhk1OXomI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2cj05WnsC8liHnh70QAIVaUNLWg3ALXSEQLh9FN1xH6570/ZIKHLw6MxSFknEx5JFZ0g45tLCqDeF8hQYzYK50P5Va5Gih0mEoSFsoyHISTlA9lzTYJEsiI/YgS1GK6YH+SWV5tziEpiqfdFerDtkk6jCmOWY9oXKcNfMnMYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQ/1NifX; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6948ed7139eso4299387eaf.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391187; x=1777995987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=YQ/1NifXnKX9yYa8C++SynfY1Nc8m4i7AYYpWVjCisCva3JEoi4K7KKrQfBrcLbkdd
         UtvxSNMd8D0w8Hkdb+uOpb/cVp3I2IqbYt1I3RSk+iZBdZyw03PubgZI5yEZlV4LVAEZ
         ZT2CglgU/PpczihWir8Fm6aDEDJdTz7lsV2MTvgC/IBpRI911zle42bRJtkXs6uOS/ln
         8Rv2/paXIr+pHEvY13HdKw9TztMNGGseywWzZrcQNi6oMtCQ0npj0+6ecGgS+IG5r/03
         1908YbEjeSxqatfxuLTi8hBoiT+u/tPjbZoAEaOOeVbgYnuVibz0zosHXtYfFOSfxngG
         /vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391187; x=1777995987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9WYxtMVhrcTFANW9nJ4oPBcCFr6W4sm1HRZsTUDwQ8=;
        b=PL4DrrAgzfEtD/Io5nJuPWF58GPaKQ/X/ALRR5WpFttz8x8xl1hSrTBIQ/7Pob3q3p
         nFfzXZi3+BmZ5k7Ig9hlT0Xa3jla1SzSiwbDqJbE51SYzbHx7IYqOkW+p5BE1xK5Wc1Q
         80P3wE1qAW75+cX5IElf4ycs58S8a+xLJyf/vmjrJ7RSPW1kyRqfmiCLnCyRlLHVZkxZ
         pHE2cfTX4qmlKS/1TYuAaCPri7zZkYzPzHymhn0XoGdAaTZjSHOmaxx65xrVzz+Ly3XI
         ZwkUwkrc7afRIC7kVfFYKuFfX8xFmZ5vECppRCEqXLVjnuFH7gXBQpJL+PElvFIGZkag
         BUiw==
X-Forwarded-Encrypted: i=1; AFNElJ/nli2jl/GoPt8OYEZOgLLiHTJnTctuwLCVAigGwyq/VJbCXcz5Acp659Qw/hM56g49nvqmYQ4l2dFQ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwThD3dgW9WzGJvKqjTmx+0ZtkdFRM9MjDHtb2f617wnK4cMyjN
	oJ6v/NodtXP1On1naidQpQDBmoQC6AurUKPQDzDGHtFAK/2U8avMY4w=
X-Gm-Gg: AeBDiesVQe/SLj7Chj6CRDAx/4DIzsjhAkeH/btoXkMCOCUSbFx7+dPi3UZ4JbHUH8z
	wyXlraAa6D4m8+NtkN4EYMTqCURJwcjX5/n53NJ7GUhV4qECWgleOuNnXvn3tWoEMdgjBt6SWk3
	bwPbNmfZhzO7H6qSgQQdUzQE20BpXvlsy6v7HCA4bjxd6pLc3CcUQwvRktvuOLnjRGWc193ZeLv
	ykyAfcJy8OlJXCjRZeb1VOH4FAWFDn77lAmUXH5WDa+6V4DadMTTjI9Vdqd3SGKaSA78HbDmgmC
	NyI5mmy1Cu5l1ABCEeQMZblrhN56bxwyzsp1wFZjGnKauYu9fif2VTjaKb63bVFh09gbOoHzud6
	cFHqW7qA/LAYoyrsA6gI91j6PZlS5QgkUKr3TJ6w9xSpF6/eiyFtgxcRxosGHWoa1y86B1Gdiap
	Dt+claWDrttdpT53bDjPwi+FRynqbC10dbCsINROS4z0lvlxI/Sq5DE3B2Ez/76V+JIIW84OmNo
	Q5pObpB+6WXcDl5xPpYyX7WZCw=
X-Received: by 2002:a05:6820:612:b0:694:9e64:6785 with SMTP id 006d021491bc7-6965ca7355fmr2030129eaf.21.1777391186824;
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6965ba3686bsm1710931eaf.9.2026.04.28.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:46:26 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: Fix function argument alignment
Date: Tue, 28 Apr 2026 10:40:22 -0500
Message-ID: <20260428154022.6997-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84683488285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nvidia.com,bootlin.com,linuxfoundation.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-14028-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marchanna111@gmail.com,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Separate long function calls into multiple lines to comply with kernel formatting style.

This fixes the following checkpatch warnings:

CHECK: Alignment should match open parenthesis

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..eb1fc5b7e2cd 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -552,7 +552,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1),
+				 base + chan->start_offset);
 		break;
 	/* RAW8 */
 	case V4L2_PIX_FMT_SRGGB8:
@@ -565,7 +566,8 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_SGBRG10:
 	case V4L2_PIX_FMT_SBGGR10:
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
-		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2),
+				 base + chan->start_offset);
 		break;
 	}
 }
-- 
2.43.0


