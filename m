Return-Path: <linux-tegra+bounces-5340-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E230BA450DC
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Feb 2025 00:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8535219C2212
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2025 23:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62520212D83;
	Tue, 25 Feb 2025 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BdTVLRx2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0530151991;
	Tue, 25 Feb 2025 23:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740525533; cv=none; b=UjVY1yZnX7Eh4LMlZbV0x/VKl/5Zqnuo4kpDQE9BPUjtj2f8mKSddjvIeNXujF74PsTvWejplMyIXGA8D2z2D2R4XyYjRbNl8jKIekIHArS/VqNK0RNXMH05kdTMahVKwCANf5UkXctckdzkCp7y36vnnWvnQfljTG3FtS+ygd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740525533; c=relaxed/simple;
	bh=76Jhh4fUvVx9+AeTNo/sVtcgC9p+Mf69ylluqkqvljo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYoR5rNWbNAihxJ1LyZiumkw1cQxCFZMaf2kp2ZbmVJIM9XTdR63wlu8V6waB1RJZ9uCC6a5/bT1OTBoFPbqCkqXU5RAF39NVhU+TpIwfRjJI5bNBnU9ik8eGNcNh2IMXCmFMUFk5rYFL/okbWQJge62GSHxQy6g+6IRuyHMEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BdTVLRx2; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMZ9QH005739;
	Tue, 25 Feb 2025 23:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=76Jhh
	4fUvVx9+AeTNo/sVtcgC9p+Mf69ylluqkqvljo=; b=BdTVLRx21vS0X4QPrpmQP
	gxjS/9u6fRZyE4Byg4vfc4YlNFidlfoumJZju1fkuHNLLO1iNYkhNTapIuB3JcVC
	GZN2FE1YB22Hc23UTdd/dG47rPfuY63dJZCC/MdwcDraA5OJByued2JFhClzIA7X
	3P3yeS68ikYiu72KvZOPVLT5WJJhbwMhTZbIXCD7FYTlg85nwpyp+1N09tE3w6zU
	Gz63B0fW+JuC1Dk6yyikq1T5EzOkevrpRXRXA7RJnfN/W+SgwWC1YGNDE42HtdBG
	Ictnn31S+NQnM/Y+yhjWFsUKT8/cl0DLh2J/jtJERBVvv/2Xsc588act3B6Tkdyc
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse81tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 23:17:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLIQm2025216;
	Tue, 25 Feb 2025 23:17:48 GMT
Received: from alaljime-e5-test-20240903-1847.osdevelopmeniad.oraclevcn.com (alaljime-e5-test-20240903-1847.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.206])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44y51gg9ht-1;
	Tue, 25 Feb 2025 23:17:48 +0000
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: jgg@nvidia.com
Cc: alim.akhtar@samsung.com, alyssa@rosenzweig.io, aou@eecs.berkeley.edu,
        asahi@lists.linux.dev, bagasdotme@gmail.com, baolu.lu@linux.intel.com,
        dwmw2@infradead.org, heiko@sntech.de, iommu@lists.linux.dev,
        jernej.skrabec@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
        jroedel@suse.de, krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, m.szyprowski@samsung.com,
        marcan@marcan.st, palmer@dabbelt.com, pasha.tatashin@soleen.com,
        patches@lists.linux.dev, paul.walmsley@sifive.com, rientjes@google.com,
        robin.murphy@arm.com, samuel@sholland.org,
        suravee.suthikulpanit@amd.com, sven@svenpeter.dev,
        thierry.reding@gmail.com, tjeznach@rivosinc.com, vdumpa@nvidia.com,
        wens@csie.org, will@kernel.org, willy@infradead.org
Subject: Re: [PATCH v3 00/23] iommu: Further abstract iommu-pages
Date: Tue, 25 Feb 2025 23:17:47 +0000
Message-ID: <20250225231747.15277-1-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=987
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250137
X-Proofpoint-GUID: Xr02HcGTinEg17mYvbDuWPbxj8NLDu8q
X-Proofpoint-ORIG-GUID: Xr02HcGTinEg17mYvbDuWPbxj8NLDu8q

>Improve the API to work directly on sizes instead of order, the drivers
> generally have HW specs and code paths that already have specific sizes.
> Pass those sizes down into the allocator to remove some boiler plate
> get_order() in drivers. This is cleanup to be ready for a possible sub
> page allocator some day.
>
> This is on github: https://github.com/jgunthorpe/linux/commits/iommu_pages
>
> v3:

Tested v3 on AMD Zen4 bare metal host, using v1/v2 page table formats. Ran host
kernel with iommu.passthrough=0. Launched KVM guest with large memory (512+ G)
and 16 VFs. No errors or warnings found.

Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>


