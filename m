Return-Path: <linux-tegra+bounces-11452-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFMbNFFAcmnpfAAAu9opvQ
	(envelope-from <linux-tegra+bounces-11452-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 16:20:49 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C755689D8
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 16:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B039C301DAEA
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 15:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C550735F8BD;
	Thu, 22 Jan 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbOtJ5+D"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06335E552
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094714; cv=none; b=i5WHWZYaHev0+VMMUuF9ef2Spw6654VBy+n9K2IY48sq0l8g0ThvRCRL0Gl2ketaawmIMQvGAxR5iD4gsyOM4ls9PGI6tL0evsivKgxxQWPKQCFLy2CAODoBjhh6q7tANK1HXX42eunyQEepI2la6/94WbqcxeAxDemUAU5/+A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094714; c=relaxed/simple;
	bh=ZDy5yI9QqflnU3k5ABMZs1VkFVXrQ0H8SbViYLRUrYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=un/ox6pZEupOZFo7nANt/9VR5hKg7TvaNNhEUcL5sabjLczhCl/L+NoHJYUrJp+BxkOkfMhAW57K4tnD3Yb5SJn8ZivIKUcZEepcUx4iXZat+A8oAVZQCRlqUj9putQzfZLtqjQqSNR3Z9beN5Btbu0oeScMELLqh0vMA5Ay8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbOtJ5+D; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee974e230so10716565e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769094711; x=1769699511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6E8GtY3TTJfMWO98cB1PkgRGKTg/bOaROhT3qeSbC0=;
        b=ZbOtJ5+DkPcuFaJTGqhHzKVFgX89tDNzqdtGolLyHmtp14BN/4D6SNHNJ+4faJFnSh
         YY/zU9sx69bOEXixyiXonyNPUKr6UyoADzXOp0W74s4PUNrT5Ketppfgk5IqLZH/TLFW
         kAbp348jcmx19l16jV7TCAfvSly/ihOILNDxSFONjdW2FQs5kZPBQLL/Tlalw+qadvNU
         twkEsUQ6RI8aZ9zrJ0TrVTJEthGaXF8YQRfOPGPyFiPUWmM6ayID2hgX+1yeVHjwL3We
         MQmh6gYJL0b6DXZPpBACsc07oEBK3N9K4gB6YzeN6jPdjrkzaQOmvT4TjQWcQk2HxxMP
         HGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094711; x=1769699511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6E8GtY3TTJfMWO98cB1PkgRGKTg/bOaROhT3qeSbC0=;
        b=i9hTb8kI3mDRGTOSasUx3mI5nOWm9DPwaeUkUJHp1tPM3GERI/tlWDaS/QFua5oypc
         pz+Dcdl4xaUaKubWEMPIN4m9RD/kPvK+mKARFN9tDXF6lBvJXkuHranTExQEZo0zfOgA
         +SY80TBHG/HzNeTLpom2Qob48dWtIE4AvpToHWe3hWfIHLr1a8c+bfiqmUHSo5mvtr88
         4pAO0c3+q+L5L7W2G5FBKHTHa6wD3jhKmc4FRxz2pKZ27QhGAIcCxDFRa6sA1CfcY2MC
         bLFPTL352qxFcMFrNTGssdtAxpBbdA97/bUk5N9fGU9A2rA9UpAhHiw5m3J7LYRQ8hb5
         JxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzTJUq5lyZ7TvIozdw6UsuLNMcz+JRWbsd7iJp8PHx2N+/YQSQ0/OrQtN4uYYy7atC/69O6zw2M09UQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01k53dqFYWwoCVR+Q/jjO2P0jsb3f2nCqkXmR9b8F3ePlz52P
	rp4TPd7UFIprvHKz/3YV92FJEYexHQPwi9R4i6RZcKE71ZqwNFgayAte6lOliA==
X-Gm-Gg: AZuq6aK+8oe+rSKA3Pwm3Eb9m90/lW3LuvTmnjOZRPI4PzLp/cOGmpjVUee/n7QgNaZ
	Bqx38hzYTbYtRqBVQhPyVYS3zFmkWXP1uIs08R1EY6VwUsgB64srYrJuHRUtHsSnTENYNKjGHIL
	v/c9neMPzrN9I0vUDTSbjTh3ZxuLKrUZXeHBeUI+qj8tQYkZLqdV4ELBZ8qR7JdnokJU2Y+6NPn
	jUjY7HYeaWWE2/DJSlHbRJFjaxI9Q09z5yNEZyz7u4ETKM4iU73EbAxGn3xn8F3hesOZcYmdtE8
	br/ER3lqsyJhZZn4rZK1YoN3qc4uyVVFea0Eboc627/EwBK7tJyJRXYIDx9lNyYDehec87YAkND
	e0Nu9UmhHccjhaN7ji3e2dnRjVNIQ5pFRB0LJ5cKHz4YVsbYdA+lW4lACu6eT++Hf2WWGSYW2ie
	G8
X-Received: by 2002:a05:600c:868f:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-4803e7e853cmr95861425e9.23.1769094710557;
        Thu, 22 Jan 2026 07:11:50 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b4e6sm74861705e9.7.2026.01.22.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:11:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb: phy: tegra: add support for HSIC mode
Date: Thu, 22 Jan 2026 17:11:23 +0200
Message-ID: <20260122151125.7367-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11452-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,nvidia.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C755689D8
X-Rspamd-Action: no action

Add support for HSIC mode into phy driver. HSIC mode is supported by
second USB controller in Tegra SoC and is used for connecting modem.
Linux kernel has support for HSIC mode in the controller driver itself
(Chipidea driver) but USB PHY part was missing until now.

Tested on LG Optimus Vu smartphone with Infineon/Comneon modem on usb2
line.

---
Changes in v2:
- initialized err in tegra_usb_phy_power functions
- rebased on top of 6.18

Changes in v3:
- initialized err in tegra_usb_phy_power_off function
---

Svyatoslav Ryhel (2):
  usb: phy: tegra: use phy type directly
  usb: phy: tegra: add HSIC support

 drivers/usb/phy/phy-tegra-usb.c   | 300 +++++++++++++++++++++++++++---
 include/linux/usb/tegra_usb_phy.h |   7 +-
 2 files changed, 276 insertions(+), 31 deletions(-)

-- 
2.51.0


