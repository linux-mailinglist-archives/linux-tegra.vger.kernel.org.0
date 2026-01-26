Return-Path: <linux-tegra+bounces-11625-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EmJNorPd2mxlQEAu9opvQ
	(envelope-from <linux-tegra+bounces-11625-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 21:33:14 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D428D19C
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 21:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B315D3013A80
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 20:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AB22D46A2;
	Mon, 26 Jan 2026 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxbBfoj4"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6B2BEFEE
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 20:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769459591; cv=none; b=RkvemhHLKoBLGmq8B1XSerVD6LGy4k0LIRg5f14tCffCaiQQVhdloF4NRQOOCF3AJ1yUo8TxSPt8plyR2BdWo11c89SFzd8aNTjnyqDVJsMywYCtn72AKIeXBS6DNkaNJX6HfTd5qcyt+yuTK0cdfCoX9TEraKaIEGeqXAggRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769459591; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajHeqS6IWdgW244dA63RPlkXNRQq2Wg+VQGZ66XboGxORPAEcRdbbcj7g0L1P1t5E/V3YJrXYk6OJ57WbXQSspKYilwVIIRvClOeUrDb3fMSt1wXC/yneUPbhn2CwNRVVdnz08FAaT2SDSgCx1wyg77XqSzME2zLz0b10poYlKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxbBfoj4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7650555a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769459589; x=1770064389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=mxbBfoj4HYaPioD2zylAUYmVEzvd0jZFZ1dx793UMbqKyso1q3Otc/bm/29CUS6iuU
         2dnumHVPXNZ1v3ZXyzdiu13M0d8qPBtcZv13N5oPZksFmUNOWpDnVKo41fBQdJFp4bbP
         tOJO39FpaRqCPt1xKATlohvrFgtF4yFSvOJtAFoIh1uu/OL1rgklR2UN7HFCfN3FllrP
         0DihluXkFuyKiPYv2fiIsB1Lrp84mFr6fbpKMsYwqNZwBId74P6JGNxbSZzyu18Jf4WA
         dF5oKVF9MnY1/CszZ6jSYVBGLU2BTkYz+Zhtx+vmW9oXwXgZeH2hbcEDwxJEfihDV0Le
         NmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769459589; x=1770064389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=NBxCZPltRQsEhpnanqke5kEongu1dKn/5nC0tuf0W7VwdOZQY625WOiKvTp+uG3WP3
         0YQ+CNTcWaweIs5I8A2fqPwSMMUPBne064KHRBYDih5tN8LSZFuWXGqmVhe2mpr7Wbtd
         zwQOWY4h+DYgrmEHRP6r5yI/ni6RkANqkxnXDds9o+fwpQQ/9MLt4Ey/sKkz2PEwsjAF
         6cQdXkAdC//C9KjogOSKQVwRJ9S5N4acOQLecd4USUXjInLkOkSkWFidt9yJou9mrqkE
         QJQQ3t0sUPqj/zB7OllL7Nk7q3HIfsk3OTDn/MbwNZ9oVoV3YnHE7FiWBkDk6K9yLxy/
         eq8w==
X-Forwarded-Encrypted: i=1; AJvYcCVFCwYr93MaysR8Pov25lXG6GiOntR3JHTVCeCCjaaLVNHGxwxfZJswx0sAVC3BbPAAY3tWFme0H7HDYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPlBCEdL8+TZYaqQAHb1zVihY/QbCBmRliSempshFwo3Lu6P8
	O4ilTV2H9JxIG6LVPJccpmkie7pVguV9Tpw1lc2alrW7G8j2cXDjNV27pAjlzA==
X-Gm-Gg: AZuq6aILdSvJm1AkbZpH/KMayyCP+ilImORRMLtxM4EGtA/RRlCEmWeQaZHy7TsGr2b
	v8IXk2UdYa2QM270i7GleFai2xu5NrL2irXR+YoPGmDOYNI87Lykd9uAlEP9CUGTpmOBjtGbsaT
	Dpyfxz12ONuXFVdrPazkMMcIQmPO1IWs5Tprz7l+Ao0zF5ImsRvrdoC21lzDYY91MYOT5x4pvA+
	qHyhR8/vMUaQMg0JdECGvCrct7xRNNCGOhb7B5k5qSBe238Oq2DF44lqiVOu48oICLAQKKm6D7E
	bVQ4y3AldHBKQPMx1CNRjWSv5rMls8bwsMYiqG2lOKJS6qR+nSOd0eRxwu/Uj1q2QhNfS8kd85R
	2d87Q7vS0fnM12m8yojs/Za8Z/jteTPjvpPV+wLtfHEBlUFN1OKpjkJX77t6vdB6/orbofvTYDp
	mc
X-Received: by 2002:a05:600c:4689:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-4805d0690c7mr104124775e9.35.1769453909695;
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c3732dsm7296265e9.11.2026.01.26.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Mon, 26 Jan 2026 20:58:17 +0200
Message-ID: <20260126185818.78003-1-clamor95@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,baylibre.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11625-lists,linux-tegra=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 14D428D19C
X-Rspamd-Action: no action

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0


