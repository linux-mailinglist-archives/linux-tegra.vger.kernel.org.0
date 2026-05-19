Return-Path: <linux-tegra+bounces-14559-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLpQFIGDDGrIigUAu9opvQ
	(envelope-from <linux-tegra+bounces-14559-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 17:36:33 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6953581903
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 17:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BFBA316F6BF
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 15:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9080A379C31;
	Tue, 19 May 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwVnXFU0"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA423EA974;
	Tue, 19 May 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204232; cv=none; b=fb++FhlZUVn/GqM+3O/dYZ2ItvSc+cjbEcfaDxkzABfGdTjlC1froqLsuJ/Eux82mUgyb2c1K2QNizOUyCcF6sgbO7hBVNvjmBERSiQyogYlp4OwcnrDzCj17XA3/vh41xTM2X0OJJPcp4wpiZrYrcLFDQe02enZJx2p5pkN4Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204232; c=relaxed/simple;
	bh=EcYgGA7+qxpGDVJn+BOWyz9F6ILNNr7DE0ak3LTgO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/ATJq1PsiRP/i+uRNTlQuY+Uk8Mh/MHXzWIGs7JvEjnQLo0lDHcdK5Ca3ccWWFk5O5gP7txTvNoftz01rdQqTcgov4S1ZKGHijNRUFhIpNHx4x1sKxSmdNwm67iSSnt+BswjZ6FBgB2wmdSCpwQKFzgRc3cSOUNxmhPoSLfgNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwVnXFU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD92C2BCB3;
	Tue, 19 May 2026 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204232;
	bh=EcYgGA7+qxpGDVJn+BOWyz9F6ILNNr7DE0ak3LTgO3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uwVnXFU0sfkq9f5+QC+fiz9RkLgBmIu78FNEThTdjkRihuLffFJD+bjCOtRBBF4Tu
	 qxYaQo0oLYzphwHooYty8/w2PUsj1WdRBUvmEBBXfjxLnmEAB9EK1Ic3faW9h1aInA
	 SFvHAdif9+B8ooFvTohsIEQxdi1UFiZdejEOiL2KpBp42+qJuTVxndR19UVRpKEMpC
	 5SYqYaNnlO9Oh2WR6rmfXVCkGzupA4IdHJiCa/suAhYyKPzFRRrJ6xT7kxBTCOpEgc
	 ZKQNncFlTuZXJlLCvCu4UUILTCsK57QB7AA8xF8XkmIzWOdVh1K+1oWeimhB7aboX4
	 roEEhF26lB/YQ==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Date: Tue, 19 May 2026 16:22:58 +0100
Message-ID: <177919957385.1012282.14787407041669291032.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14559-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm64.dev:url]
X-Rspamd-Queue-Id: A6953581903
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 13 May 2026 20:57:39 -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table:
> 1) Introduction of new gather items and RISCV usage
>   https://patch.msgid.link/r/0-v2-b5156f657dc1+25f-iommu_riscv_inv_jgg@nvidia.com
> 2) Remove SMMUv3 struct arm_smmu_cmdq_ent
> 3) Organize the SMMUv3 invalidation flow so iommupt can use it
> 4) Use the generic iommu page table for SMMUv3
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/9] iommu/arm-smmu-v3: Add struct arm_smmu_cmd to represent the HW format command
      https://git.kernel.org/iommu/c/bf00a29234a4
[2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq selection functions
      https://git.kernel.org/iommu/c/f59c5b6858d8
[3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq submission functions
      https://git.kernel.org/iommu/c/d455e3a7bf0a
[4/9] iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds to struct arm_smmu_cmd
      https://git.kernel.org/iommu/c/27e02ca61552
[5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from arm_smmu_cmdq_build_cmd()
      https://git.kernel.org/iommu/c/c5758947cb7b
[6/9] iommu/arm-smmu-v3: Directly encode simple commands
      https://git.kernel.org/iommu/c/6e771be45e8a
[7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
      https://git.kernel.org/iommu/c/2eedb906f9c6
[8/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
      https://git.kernel.org/iommu/c/c3f84707ad4f
[9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
      https://git.kernel.org/iommu/c/be0d0b858861

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

