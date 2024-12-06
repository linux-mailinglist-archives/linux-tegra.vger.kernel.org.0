Return-Path: <linux-tegra+bounces-4260-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5F9E6ED3
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Dec 2024 14:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60A4618813C6
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Dec 2024 13:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEF2206F0F;
	Fri,  6 Dec 2024 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A7jWFS5K"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8AA1FC11F
	for <linux-tegra@vger.kernel.org>; Fri,  6 Dec 2024 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490087; cv=none; b=nYzGh+SQnvdmm0/u5UDJ0wXjsKSH2betEBylu9E/PfJ2aAhDGRg16An+dp9AHUGirXZJS7B0R1gmKGBgthFY4bkuQdrpNIdQiOabMbN9kMKNd+kZOw3r9xGl2SxQ+wL/1b0uFPPALJJoC41y0NCcepjmlZuA3ESpPCpp0WyUEAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490087; c=relaxed/simple;
	bh=D8bEeGyz4QZP8CsYCUeuDe0nvmoNecFz+IoyrmadWVY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5T4Qo+a93NqwiTnAT39/+v8WOEKNzE8DEsppqdEH4ZAUFSo2NM1c36Sp1/4uwXEWfa5qRSV6hQPlXfyvvPpB/U19TF7C3BToheh0hYOjzaDFarTIdzH9gHdM4jWuwDepdNf+Xxb+Cfm9z4hiuaZWMFDLZOpCpVa2R/tP0oik+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A7jWFS5K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733490084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Hw9dbolckMZ4ZjGpjFqfab8MUH1pQKI6bTRKNfiZCIg=;
	b=A7jWFS5Klmrbhg+5lSuj6tc7/ft1MnZMvS/VSndBEs/xmNhww3jexRjyqds0sDQPuQBiiV
	k/H53kgdPk+9mLLPVzgs2kKS14ZfaVwshceTD4xFP19y48j5G67Htj4HAKCI8CsYo/qADt
	DhrAB3xV+UVFuSXLpxLLi40SqHkmYMM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-ewdG_bfvM0KR18XlPDJv2g-1; Fri,
 06 Dec 2024 08:01:20 -0500
X-MC-Unique: ewdG_bfvM0KR18XlPDJv2g-1
X-Mimecast-MFC-AGG-ID: ewdG_bfvM0KR18XlPDJv2g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21F9A1955D4B;
	Fri,  6 Dec 2024 13:01:18 +0000 (UTC)
Received: from localhost (unknown [10.22.64.148])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C15519560A2;
	Fri,  6 Dec 2024 13:01:16 +0000 (UTC)
Date: Fri, 6 Dec 2024 10:01:14 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH v2] iommu/tegra241-cmdqv: do not use smp_processor_id in
 preemptible context
Message-ID: <Z1L1mja3nXzsJ0Pk@uudg.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

During boot some of the calls to tegra241_cmdqv_get_cmdq() will happen
in preemptible context. As this function calls smp_processor_id(), if
CONFIG_DEBUG_PREEMPT is enabled, these calls will trigger a series of
"BUG: using smp_processor_id() in preemptible" backtraces.

As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
CPU number as a factor to balance out traffic on cmdq usage, it is safe
to use raw_smp_processor_id() here.

v2: Sebastian helped identify that the problem was not exclusive to kernels
    with PREEMPT_RT enabled. The delta between v1 and v2 is the description.

Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index fcd13d301fff6..3ea4369e838fe 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -339,7 +339,7 @@ tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu,
 	 * one CPU at a time can enter the process, while the others
 	 * will be spinning at the same lock.
 	 */
-	lidx = smp_processor_id() % cmdqv->num_lvcmdqs_per_vintf;
+	lidx = raw_smp_processor_id() % cmdqv->num_lvcmdqs_per_vintf;
 	vcmdq = vintf->lvcmdqs[lidx];
 	if (!vcmdq || !READ_ONCE(vcmdq->enabled))
 		return NULL;
-- 
2.47.0


