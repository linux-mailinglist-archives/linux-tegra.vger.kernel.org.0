Return-Path: <linux-tegra+bounces-12088-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEcuONf5m2l5+gMAu9opvQ
	(envelope-from <linux-tegra+bounces-12088-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 07:55:19 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2B9172675
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 07:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFCD9300A319
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Feb 2026 06:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B843491D0;
	Mon, 23 Feb 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOyPxJ74"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E888A3446B7
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829715; cv=none; b=cb/viM10IfW/RCDsoUyb7Oazi+IoqPthCbJIMr0E1vRHD3o/3/xn6LrvQ/ToTJ6YjRXucvFx+dKx+zTGsHGAIN/UnFeDVa8ZAlels1YeuDatXcsLnTeus+U5gRJVnzMiPr+8RQP/oCtBxZ5k1ZvFGc9f5MzsI7wVl2YBCaCRea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829715; c=relaxed/simple;
	bh=SPf/7oKhywmYy+f5Av2C+F11RjwUS8kq4GQYjSKixqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGLxgYET+w6FnixyugZpbAjO7tybjCJ3dXp25VfFZbMVCdP1iZcmZSmXVW9QmV88E7r/J2rd29w55tVqa42zF8XzrW4W7VRuGV17haIWXEPp8Y9Vuei7TES+P4XO2MklgHyzfEp/IzZD/w33DLYa7gtfILt5K/3WR9H9QoSRYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOyPxJ74; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso3874010e87.2
        for <linux-tegra@vger.kernel.org>; Sun, 22 Feb 2026 22:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771829712; x=1772434512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+Y6ydg7opucreYTF6TTLBCsji184axNL5GpZ3ETSys=;
        b=EOyPxJ74JOq2O+vq7hv6ES/dX8XvmSlPO81ZEupfg0E7tgvvidLM2xGR8lCILirIuf
         D7P7HhwdCE3HxY7OweliXSlXvx6Sqyu6vJJBVppzaYb8/KaxwXS6LU67NV1WNplYtSA8
         b7oDSWIjaocLJIM4/3lpX/IS3z/WXNmQJV5eN/aenbCR8hlz57TErWA5XzvxtjrsziV9
         Oy4BDbMGOpg+Le9Ogq9nRC+duD+6UQZEL53CICRZn7IzHrI+T5PuB8oo18ugeNGwxORP
         Y4sPLhD9Iof5YPlsc2uz6nS+k1RnCkQ6JI38dQTAS2avVXEsfSxdXv0IBs/+7ESR1THL
         kD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829712; x=1772434512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+Y6ydg7opucreYTF6TTLBCsji184axNL5GpZ3ETSys=;
        b=kon/C0dGIYwnDwyHRn/CTIntSvBBqbUiCcUyTmnTwnHAUM+3wq4bmgcVGYSCYiQMBZ
         i6C3hDDM2qCXBtnqe6AxOVhUuIPa0ZTC8hBokajMzcKyfSOSthyK8BGCMUL5ggo1IAYL
         t/nGpcuYlGcPvQbiOIk2Cb02e8pt0EuHw/YdcdjgyJwTbnZkbKtkfnXssHwwUNlrxgdk
         iEPxUvBdi5BmilDpgDcXYodHsFBKkTAiocGuDjxqOLe8HraIprVeMofFz7p15CetGTOb
         /1D1gTqg+2Sgm9YE1q7hEz8bRyElD0cQkSgAMlmvayVvmUV6YnTYS/2aYk/cTfbXaFC5
         sYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynrYwt0lsQL+bBopiRLxqGwkaT59kXy4aNsvKXagx3ttJgv0fFK/fThgpcQChsUcMjbh7iOhbQdji2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPHNYBGVw/0ACCmG8PEeztKGwL8Ds32mpUjIoQSDohi8AjeJl
	yNmT3qiu3Q3NUuJeTjwzI5dt4PUgmfF4zbY2irULQQXi91bXQQwXzVfX
X-Gm-Gg: AZuq6aK0Vg5z4CmDO0j0C7Z7qHz8iCLDS5Hlzjr9b2MUInVlCCysrbR3+DAMv8kR0/i
	A653LRFTCQnmsS6JOl6ThXRkEfTOboWamxr+BORwy3aZtFj44JpSviplHKr704/3NqGgqNM9poQ
	QeD/VEWrfR1JGhQZeVlFRKj5He3tUG8uXlb2nKns46o2vBxbHD1hv44Aw3ExvpTc4w1B3t08KmX
	AbLXbYXsOPKcCZbvxU/O1oN31DJxmh5CHIzBdFEnnKvrb5VUtd7dtBU1d+HUFzgenqNba8eveYi
	8UcG4QDdIdYmXs43ZMUI0PzdTnyxmXyOQPWX1kVA5mKF5lW0I7fed7guR+HguC9yM/RVgzqD9pM
	eqfNJz6AaG4ki1Hv4GYDc057Liq8olmKEeGwjedxXaTbF8u5YIiMMrj5kiJ/X0cRSX18LFssYKT
	YN9VPjN9u2ygnN
X-Received: by 2002:a05:6512:3053:b0:59e:6006:62bf with SMTP id 2adb3069b0e04-5a0ed8a6736mr2448098e87.37.1771829711746;
        Sun, 22 Feb 2026 22:55:11 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c60bsm1373802e87.84.2026.02.22.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:55:11 -0800 (PST)
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
Subject: [PATCH v2 0/2] ARM: tegra: document Tegra20 HDMI port
Date: Mon, 23 Feb 2026 08:54:58 +0200
Message-ID: <20260223065500.13357-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12088-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B2B9172675
X-Rspamd-Action: no action

Document port which can be used in the HDMI to model it using OF
graph.

---
Changes in v2:
- fixed intendation
- adjusted port description
---

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 HDMI port
  ARM: tegra: transformers: add connector node

 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 13 ++++++++++--
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.51.0


