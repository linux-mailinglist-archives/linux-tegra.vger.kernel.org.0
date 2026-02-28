Return-Path: <linux-tegra+bounces-12264-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD+DAxVio2myBQUAu9opvQ
	(envelope-from <linux-tegra+bounces-12264-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Feb 2026 22:45:57 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49C1C93CC
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Feb 2026 22:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F92315CF35
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Feb 2026 20:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A169526A1AC;
	Sat, 28 Feb 2026 20:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3BkAUAi"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43851DF261
	for <linux-tegra@vger.kernel.org>; Sat, 28 Feb 2026 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772310021; cv=none; b=TNB7Wej1zBDCt1sflPuJANIjrWZEWLr4630ceBOTkO+x4h2tSNqm1quw8iIRZYgkLrZC8LOHwoNS3v8MUnZTCXRbpCuLUfHMSMU7rZ/er5Htc0J6Q553iNy3PLrU+e9Q9yiOcLNlaApGK4ac5zlXnHRka3RsFbx1yn5ONwvnXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772310021; c=relaxed/simple;
	bh=9DspbaeTdsFF+yDLB+2+iwzjjkL6dh10LFUGIq+AQJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UkC3zj6OE9oQgbPTfLIrMCYiJKQ5TWb4lYbCAMs7TBZyUv0wyEf+38w/4PVniDzZv+siu8fQxCn2IvxGLMmc+aVJ1XLXZGLoA5HmNBjeCVzlvg3wrnYYvKTyRA90UvxgQqP/Y/4Px4d0OThhGVEhDmoCrjHCW62yRLWb6CKQong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3BkAUAi; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-35448ca4689so261162a91.0
        for <linux-tegra@vger.kernel.org>; Sat, 28 Feb 2026 12:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772310017; x=1772914817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkJv43NJSF2MCPVDTNMcORvT8LoE/dCFArhJg80QedY=;
        b=Z3BkAUAiw9eIij1Z2DdaXGdLF371Tq5B5/LRnja7Y053Cp2oiIjaVb2XbeGtBLl0KC
         qw+B2wydztX1MNS2cm4VwFWEVvNlR34E1E+fyH2tLpiSj8grxA/s3gjLpy0WlmwaYapx
         7fkF4nm31DekxfuYb2fflWraUHdPGOStuyaNAHGJCFzxGOob5GahDl7/awnvQTwtgg5y
         OydcI2k6Tawj4WlFO1vzHBqvkIz6zD3jYytH12QWh0QlRyex5i2SINkc7dJDKWreu63i
         GTkQVBIxy5dGDSn2W7VQS6aBv3P4oOda56fCkH/AWYZQfSG0jn5nK2gBRa9jBR/iXWsD
         icnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772310017; x=1772914817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkJv43NJSF2MCPVDTNMcORvT8LoE/dCFArhJg80QedY=;
        b=rCjUpQx0Iim3ISwxUqSnv98NDSi363g15xmFC303yPtIXh5k/AOz3NO8xpdizYlW+d
         Az/wnd0P9uCVgsMsj62fuK6VWRapWHi+IezZ0ZJvUkgYMFtucMDLOrkueh7KSk9SO48W
         IgoF1On8q9erRN8aXYqlbg13ZwHkXjyGjT4GGwxcDXLZKUUlRJqxt01LXEkV5ghqLMUL
         +HJaMO0lLoiFJ2y+y8aBY5EDJGu5tQLgDaVa9y+oCsNqyIMqgnfkxplXE0imBCTGO5Iu
         5qPOR/Lk5C5b+1iFcvCT2IdP4Ei7ysoAkMPQ5+9hME/8b3khFGoIQX1OjqtAOHXsNBFu
         Q6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVszZ93s4HXJSrjpAK7erwKVPa2RHO2JIA1zDBeP5JP5E/3zK+jgPpz5vxeROX2mUkAtjTj0TA67viNEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZOn282BN1hhqcdVwxab6CbNzTD/BzFA/qtzSQITLj1aua5Mk
	eCdIEBTd1qTwJcugmJ5sio/k/yd/haoyorvCoujZHwrYZifEHe730xfc
X-Gm-Gg: ATEYQzxk60zpLJkB86NH9mL6YJDlcLhuIRWR3tD45JVRlM/USgXwHql7HNfUNFisxO5
	ln3I4v3cUW6UFlNOQOzF+eiT8cnf4SS2XJb/NfPXFGeX+Zss4rLP/KS5YaP92Ti7OdQl0+H67MZ
	0LuzvmXhHpCbDm29LV6VwbNxOGEIwZPzjBJyIahy5HbeKJh4SrjbWvqJ9uEN3y1asbM0ena5LWX
	x50j/fLLqMuQlN2jd/vJE41KJWd4BPmx38nB2lERGHwKdgLdWv6UXdU3NeJ3brcHt3FjRfrkgu/
	NyL78OQBwGoJcBJ7Va2v9N/dHn8WCTheO4y79fhRTKLYRFJfLmu6tVSs64TAEOfDlkNNebXTXeI
	Y95aY64sm8yJa5Z5alYtiAursQaxCFk0i8JToXqbhLW3y8bWJ3FL9iLCvQqB9pvh+Isrm76KsPg
	kZXmDs0iwE+9mvecZkm4kQZxVM+aR7yUhBu+ayEYKv9vdletNEskFdCmbzRtESiUrD/Nb1p3KY4
	MVbalFp5045XUc=
X-Received: by 2002:a17:903:32c5:b0:2ad:f7a4:afaa with SMTP id d9443c01a7336-2ae2e3ede74mr59503405ad.2.1772310016999;
        Sat, 28 Feb 2026 12:20:16 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:37d3:368b:370c:c273])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1fa8sm94994545ad.26.2026.02.28.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 12:20:16 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] staging: nvec: kbd: use -EINVAL instead of -1
Date: Sun,  1 Mar 2026 01:50:08 +0530
Message-Id: <20260228202008.40063-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.launchpad.net,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12264-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D49C1C93CC
X-Rspamd-Action: no action

Return proper error code -EINVAL instead of -1 when
the event type or code is not supported.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f151..5f742c8b32cc 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -92,10 +92,10 @@ static int nvec_kbd_event(struct input_dev *dev, unsigned int type,
 		return 0;
 
 	if (type != EV_LED)
-		return -1;
+		return -EINVAL;
 
 	if (code != LED_CAPSL)
-		return -1;
+		return -EINVAL;
 
 	buf[2] = !!value;
 	nvec_write_async(nvec, buf, sizeof(buf));
-- 
2.34.1


