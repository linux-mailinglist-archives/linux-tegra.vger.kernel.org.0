Return-Path: <linux-tegra+bounces-13841-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCxNFEtl52nx7gEAu9opvQ
	(envelope-from <linux-tegra+bounces-13841-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2026 13:53:47 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD5A43A4F0
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2026 13:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 986C83009FA8
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2026 11:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E1537E2E8;
	Tue, 21 Apr 2026 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnBlCt4Z"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F137881D
	for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772210; cv=none; b=mH2eXCfkI9FHNweZcObJ9buq55JY6xM3HytXIPsnmN7OixaSBz51fEYeAMYk6/4KM38IvYnKN106MdI1sAeb4meyWWBZWWv6jCXds2Yoa1Jxdnsp+HFRJmQE/TDPA6bDbUKcOuirsGIup9nevoZhb5XyQqkBm/eYL7ZrfqxmkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772210; c=relaxed/simple;
	bh=Cm0rUJBs8nzZ7M9T+A4E3JiYdq9Yfxltq88+2GfeWuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxS0XcIOi1W/uWxRifHmGJwvgy3Qz1rzxQL8vvel9z1nxBQGNW0UKqx19hn1yGwOS3Zk8fQ5T0TSvNrAC/OvCizTJHl0aaK/nH7wioFY4B42KPs+eR4bHu8g5sBB77oAGhav9U30I6SykJNYgaOVnsPc4M/jcG7wuH5pD6Qb+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnBlCt4Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776772207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/NV8ykGGMcTaxZaQ2zUVOv41TqUrDMHc9m56orvpcOA=;
	b=RnBlCt4ZxIxCvf6ccNH/ZmbQ3VUb7VE8+Pvl00WVCUnm2mRDhdwVUUtJFBlmDNbn3xvzUb
	eUTMvQVXRkfykoPQvX/oi5+FqBbCOutpPVh4c3Yk8DFO2INJlCsDrfxCXo1JYYTZDh8Qzr
	TzAW/UXOdEx2CXGJywRklTV2WRQx0g8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-abVUpCZENIOyEYY_k6aGBQ-1; Tue,
 21 Apr 2026 07:50:05 -0400
X-MC-Unique: abVUpCZENIOyEYY_k6aGBQ-1
X-Mimecast-MFC-AGG-ID: abVUpCZENIOyEYY_k6aGBQ_1776772204
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3993C195608F;
	Tue, 21 Apr 2026 11:50:04 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.140])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23708195608E;
	Tue, 21 Apr 2026 11:50:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 21 Apr 2026 13:49:59 +0200
Message-ID: <20260421114959.202327-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13841-lists,linux-tegra=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-tegra];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AD5A43A4F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier series of mine
       to ease reviewing

 arch/arm/mach-tegra/reset.h | 2 +-
 arch/arm/mach-tegra/sleep.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.h b/arch/arm/mach-tegra/reset.h
index 51265592cb1ae..92a89713d5e57 100644
--- a/arch/arm/mach-tegra/reset.h
+++ b/arch/arm/mach-tegra/reset.h
@@ -21,7 +21,7 @@
 
 #define RESET_DATA(x)	((TEGRA_RESET_##x)*4)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include "irammap.h"
 
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 4718a3cb45a16..e332d261c1dbd 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -38,7 +38,7 @@
 #define TEGRA_FLUSH_CACHE_LOUIS	0
 #define TEGRA_FLUSH_CACHE_ALL	1
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 /* waits until the microsecond counter (base) is > rn */
 .macro wait_until, rn, base, tmp
 	add	\rn, \rn, #1
-- 
2.53.0


