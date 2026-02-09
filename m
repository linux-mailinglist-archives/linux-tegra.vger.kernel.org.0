Return-Path: <linux-tegra+bounces-11884-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDI0Jg/eiWnGCwAAu9opvQ
	(envelope-from <linux-tegra+bounces-11884-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Feb 2026 14:15:59 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23510F808
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Feb 2026 14:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F16C3028825
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Feb 2026 13:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEB4377559;
	Mon,  9 Feb 2026 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgjH1jNQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0C377571
	for <linux-tegra@vger.kernel.org>; Mon,  9 Feb 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642876; cv=none; b=PtQA3/BDkufEmFvaaIGzgwuJs46KNbiofxlUP8yADdFcUmX0h6UdwZq+LJAjF86l3/cJb5VXKgte56r52QcPsIZP6kEL/ynq/gLa/H9N6yKW//qwwso8u/eu7j/jViVKGJTogIzYJAZ0aFygkdyYLTr8mBG2fHCbXswH+p4P+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642876; c=relaxed/simple;
	bh=BsCyYY706eP9kibwFEw5teWvvr/D7HjWBFdh5Dsrp0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MdjM+CHCeu2O+0v6UOUbkwOeobx1azZQNwyK+iQuMk3oHuqTgkQW1gJ4xoFmcl6o2QsCEfzvOgMzujdHi2DEH8aOehHHL0xhcHFIQm2pZnPTOhzHz+xKcqrxQFzmEWko+Q39ssJ28Lji5DMfEEOBxjrb20yNhe53MnCDTzwuLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgjH1jNQ; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-38316d0c26eso25712211fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Feb 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770642874; x=1771247674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoPSheucwNdJ0J9aHupvUSWIaFIaKnYUl6Un356KuXI=;
        b=JgjH1jNQnPiNbYKS/ksIUt3FkeHXhEfn0JCASBuctD2odZ8izupOXuNyZ8WW8B3ujU
         ZkH+OGppkxKSVgu0zfd1VLmqVCULFWQc1C3HxyAwFyqdL5/0OgKZ2uJcghH4H7Ar/r6V
         RQ3WI6TLJLZjgYcBoNQ4OyS+R5mOiqb3FjoQK24Bk6AxWohR6/Fa4mb4XtZr2WSvw1Hj
         epJg6db2tEeVzavZOcvX1gHrAfI6rimS9vby9KsZmdoPGbkMTAbfrEOXVbc25YycAENx
         m4TFO9iBjNSHldJmwdVmEerhs5MVWmzFqJPago0d7UQxnJd3ZSouIAAgzUg5D7C1nNV6
         NMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642874; x=1771247674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoPSheucwNdJ0J9aHupvUSWIaFIaKnYUl6Un356KuXI=;
        b=YMGUAVBkY27s4T9RjILhN8rXuSoXNo66MpiaNMsvpo6598I35JsU87f36Lme/YjHtL
         gqB8dKd5LF9fOzn3rwCqyfIZj68PT4wQ2RJcJfWzUv8nqYhm5jONPEXYQOvUtsydCAmX
         /ofbMDvcnk6xJ4eqUtNARI4IKp17Gl0s31TO2e6d2RjWCEycRYkJnES85l7rs7lOkXdv
         HNn4Ee2Cpx1IlVVRxpcuMPyeH1Fxa5FafdAXDIDbo8TZ9dHTcOYHoRQKnR5o4SbZoecY
         RL1PnQFL9PPFoOp8tIqQZe2OykSOiHh19zoYxtUjGIuco/4ehsNMcltSpq0hB3YyPl5m
         gScA==
X-Forwarded-Encrypted: i=1; AJvYcCVl1tIvYVasr/Fsi7rQVXJCPq7DUWGNCAd/cyRlsHwv+IYxgDNdcTnxF50+P3CMVtzSO8OdV0dr821fYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPHUxybzlAYRa6zkO9yJlqR0raaEw1UXb8Fa9zUg8KB7THo3L
	D9nKF3kwC1n0BkTnZwSbqAfAPer395ORnbe/YtKncjlYfNb8sUEnUwGFbWvThZvB
X-Gm-Gg: AZuq6aLf0A++i/vo3L9a0fdr/GWCWoqaCeDQg0HlpeHHzrSmb3QH5WaGrd0wHPMJM2I
	c96P75ckMfhCIDkDQOBEjMcWxsiKPPeL+D13A14o6o7IKOBE4M65YVNg2lqp7QRCRKvluaEP884
	dJ6PS4VPaAI9j2/+AYJDVWLdI9QKuvBmi+H5vD03b0GrEI9v0Oc4Cs9+NkF9gL/ag7pwiTl4j7c
	Qu3TJa7IDs7qH7/MlTY1OXLluHsfB0VTrIEz1gxO/u98GnJD65pcyFmdlyFoOuFJXYTzPteNCnN
	PHhLqqLYJxF+OEeBWErHtMbztEsuxr596w+umvMSR5noiC+AUaXDF8SxZSADhoLM31ewsW0v6ms
	/Ui64tX5l37EsbT8gknuKvZ35pw2jWrojkR6dtSFmIAHgg6YtX5dpd3JlESFRIiUd9R+EGtgH91
	9ELUegLOHtCYqsfZUJWdUj7z0DQm9YVNKyfjZM9wmUeKpIfdiFSowYc0MSvbOmD2HWmg/2Dd5Sa
	8tPVznmiIJ0GsA=
X-Received: by 2002:a05:651c:b22:b0:386:1ce2:1198 with SMTP id 38308e7fff4ca-386b5110ee8mr29967281fa.31.1770642873785;
        Mon, 09 Feb 2026 05:14:33 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.73])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63e8483sm27212191fa.34.2026.02.09.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:14:33 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH] gpu: host1x: Fix passing zero to ERR_PTR in host1x_iommu_attach()
Date: Mon,  9 Feb 2026 16:14:26 +0300
Message-ID: <20260209131426.37611-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11884-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alperyasinak1@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E23510F808
X-Rspamd-Action: no action

When iommu_attach_group() returns -ENODEV, the code sets err to 0 but
still falls through to the error path, returning ERR_PTR(0).

Returning ERR_PTR(0) evaluates to NULL and breaks the ERR_PTR/IS_ERR
contract, causing the error to be silently ignored and potentially
leading to NULL pointer dereferences by callers.

Fix this by returning NULL when err is zero, and ERR_PTR(err) only
for actual error codes.

This issue was reported by the Smatch static analyzer.

Fixes: 06867a362de0 ("gpu: host1x: Set DMA mask based on IOMMU setup")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/gpu/host1x/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3f475f0e6545..46a570b861ac 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -450,7 +450,7 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	iommu_group_put(host->group);
 	host->group = NULL;
 
-	return ERR_PTR(err);
+	return err ? ERR_PTR(err) : NULL;
 }
 
 static int host1x_iommu_init(struct host1x *host)
-- 
2.43.0


