Return-Path: <linux-tegra+bounces-13612-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPaCD6Np1mnIEwgAu9opvQ
	(envelope-from <linux-tegra+bounces-13612-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 16:43:47 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 955A93BDCEA
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 16:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBBE3009B36
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 14:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C72D38736D;
	Wed,  8 Apr 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IC4CxZIR"
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5303D34A8
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659274; cv=none; b=NEh6EiaeK4RTG4Kv4CW1KRl2I6tGogbBMPzX5tKPu+vwqBQoy8uSaP6ldMvgeh0R2ZsKUhtyI+IVm14vrOzErhMVE0Yqwq1LZMAxJscyVMCZakgd06sB6TKq6pNWKW9uz/y8k5KtaiX34g6MQeMwemmB/Wf03yl6CLYzqA4LbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659274; c=relaxed/simple;
	bh=y05l+7axM5lCe8iitjpmvxxTZNxo3J5J7EUoq+IaEg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SPCLEAR0CSepBFW9MD2cyOyv3ZWmAg+o4P14u6YMDc+Q5WSOGXykzWT3fphrnsePxnXl1b/5p3vtZP6HrKdUq1CKiBZuBs9r99go8ikIG1qRJ/ZE/jCfcf6OE8gbDHs+guK7LiWS3uL2RovD/H3iDFV5lpxCZ+dlYeqm70ZAU2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IC4CxZIR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82768288E;
	Wed,  8 Apr 2026 07:41:05 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD8B03F632;
	Wed,  8 Apr 2026 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775659271; bh=y05l+7axM5lCe8iitjpmvxxTZNxo3J5J7EUoq+IaEg8=;
	h=From:To:Cc:Subject:Date:From;
	b=IC4CxZIRyZWtlUKqlotiuifBR1pcqv6qRTnrwVIyVNt3PqcPG0zZnCcji9G1Ermvt
	 OmfN+3/TvkBsOb2d302p7sZxTMAc43FuEuC8aMAR4PqibA0yetDjSfxY61hAJmuX+z
	 UtqyQbArhyVxC9ec/h/04T4lGkBbU+6F5FM79oY4=
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Cc: jgg@nvidia.com,
	linux@armlinux.org.uk,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] iommu: Ensure .iotlb_sync is called correctly
Date: Wed,  8 Apr 2026 15:40:57 +0100
Message-Id: <8982e3412563cf91e106d59228dfb6115024c75e.1775659257.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13612-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 955A93BDCEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many drivers have no reason to use the iotlb_gather mechanism, but do
still depend on .iotlb_sync being called to properly complete an unmap.
Since the core code is now relying on the gather to detect when there
is legitimately something to sync, it should also take care of encoding
a successful unmap when the driver does not touch the gather itself.

Fixes: 90c5def10bea ("iommu: Do not call drivers for empty gathers")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/r/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 50718ab810a4..ee83850c7060 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2717,6 +2717,12 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 
 		pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
 			 iova, unmapped_page);
+		/*
+		 * If the driver itself isn't using the gather, make sure
+		 * it looks non-empty so iotlb_sync will still be called.
+		 */
+		if (iotlb_gather->start >= iotlb_gather->end)
+			iommu_iotlb_gather_add_range(iotlb_gather, iova, size);
 
 		iova += unmapped_page;
 		unmapped += unmapped_page;
-- 
2.39.2.101.g768bb238c484.dirty


