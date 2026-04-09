Return-Path: <linux-tegra+bounces-13644-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMZ3LNSi12kUQQgAu9opvQ
	(envelope-from <linux-tegra+bounces-13644-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 15:00:04 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7183CAB35
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 15:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57439300617B
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2026 12:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B46D37C901;
	Thu,  9 Apr 2026 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Iwe9vtEW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A723C7E13
	for <linux-tegra@vger.kernel.org>; Thu,  9 Apr 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739593; cv=none; b=Cb8ayUDJPFQTDpZ9UBZtPTN6Xrg2VTE0DFTXARNJ1vP6RWEXmnst/XYCAxST+RQ8yXw8pDqcHZN8FJavGpRLfDTYt+ALeW8CkO6o3OwXiTxH4sdoaixcmWo4UQRzs7oO6KPumKwGUEEq1CK9Qeyx9K4eSj5OwFP7eL1if5gcEEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739593; c=relaxed/simple;
	bh=4mjSmwYwqDeDBCI+476/c2pzTgbI2J4XyUIYa4sKdpM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tUtS1dv8VnfEtIzN5lKjH4HbRmRg0PhUHJJz+iqTd52AZCMj3MlYvid9jHRyqQ1OpE+sazqYeI3diPSMiS7CRSeREB5wsu81yPnYGwT/VhR5lxBfA8Ji7z2U+V9nMpuwg0XdSiz+ID3TGs92bcmgwKct16rdWL4W4ROdMFaKoc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Iwe9vtEW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666172F9D;
	Thu,  9 Apr 2026 05:59:45 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB5493F641;
	Thu,  9 Apr 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775739591; bh=4mjSmwYwqDeDBCI+476/c2pzTgbI2J4XyUIYa4sKdpM=;
	h=From:To:Cc:Subject:Date:From;
	b=Iwe9vtEW7HobOS2KwDIt3cBb2OtwY9vxZbC1qoQ4p7XN7Qj5Ao79kXlkge11T6gvS
	 jEUxIyqe4PxpTe7cVzH1llCYf05pDE6FnPZ3OVeFH6nTu557m88YtRi2gWt/Zb7MxN
	 iEiiT0t192qabsf/oUGP6K0ty0xTzVrBrcvHYqCs=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2] iommu: Ensure .iotlb_sync is called correctly
Date: Thu,  9 Apr 2026 13:59:41 +0100
Message-Id: <3eed961d41d3a81460031dee9f1db066f1d2e111.1775739433.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[robin.murphy@arm.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13644-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_RCPT(0.00)[linux-tegra,kernel];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,arm.com:dkim,arm.com:email,arm.com:mid,armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F7183CAB35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many drivers have no reason to use the iotlb_gather mechanism, but do
still depend on .iotlb_sync being called to properly complete an unmap.
Missing or incomplete TLB maintenance at this point can then wreak all
kinds of havoc, particularly in strict DMA mode where IOVAs may be
reused right away, if DMA traffic for a subsequent new mapping hits a
stale TLB entry and goes to the wrong physical address.

Since the core code is now relying on the gather to detect when there
is legitimately something to sync, it should also take care of encoding
a successful unmap when the driver does not touch the gather itself.

Fixes: 90c5def10bea ("iommu: Do not call drivers for empty gathers")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/r/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
v2: Add tags, clarify implications in commit message [rmk]

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


