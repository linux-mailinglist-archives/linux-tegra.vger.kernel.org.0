Return-Path: <linux-tegra+bounces-1591-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D38A3916
	for <lists+linux-tegra@lfdr.de>; Sat, 13 Apr 2024 02:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F641F221F8
	for <lists+linux-tegra@lfdr.de>; Sat, 13 Apr 2024 00:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A4A367;
	Sat, 13 Apr 2024 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="o3JhPfkN"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F317C6B
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967928; cv=none; b=kSxulUzu2pYYAnOm4QZ/H+TnxXZ5Hmu2GRQBu+vgeOzNkjHglSWURdahS7ChAkLmBKNqXNjPrZdCeKZonNrlrFz/K5/NuIcU4KdPmRdEnu4HPPElFVa/zMn1S6/HLr1h/kwtp0OnwqHR1DDaqlKR7Jl8yuS249uXY97+HaoNFTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967928; c=relaxed/simple;
	bh=M3Sws9Xq1UzqxeHQp2ggqKkuvHy+mXvA6zrymX1lBx0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LyQHFt2EkG/FOmJKvzHQEmsL5uW4gX+YiU8z1POb1ZUgEmD5a1YWqBWUBfRPdyjh/sD4KCPJnRG7sE05iFefMYX0DKme75mt39TrX22Fco//slk3cniXSHO4b07V/+msrp9thQE2PMAN0c1ygsjDA9xndBCovNOrvuUMmQePACA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=o3JhPfkN; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78ebcfcd3abso93281885a.1
        for <linux-tegra@vger.kernel.org>; Fri, 12 Apr 2024 17:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967925; x=1713572725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxPD9e5Q1st8MCbV2NGQC2VF5/nUXXzMpKHuTELQ6SM=;
        b=o3JhPfkN60GZkJ+A2dN9FdRjc6N/ygABBTSuD7TdhZsIOxsFZqKRXBeRJti0RWPPlh
         yM1dfdkRETLGaqn9J+sWb/PGthUYX8ryhpTjFbB43XXY46OMsBNnwaQMaG5XmQFhzYl9
         r3ZB6IX3R6hsPPmhBIR/YVVNaHxx3ImMTrS3a+6lE9ZuvSZww1JoN17Tlw9AQS7gdl/Z
         plc75xfaOvrZa6brUtaKa3kDv9uNfcG8hCczNuKXRUBS+BdOlOQQw8c1dnMVW+bRJNvh
         RZK1bMmpDnru1i66thQplnxRvdsr04uwjx605hH3wG5ZjCeNYyHDAvbyXnxA8NpLK01B
         JfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967925; x=1713572725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxPD9e5Q1st8MCbV2NGQC2VF5/nUXXzMpKHuTELQ6SM=;
        b=aNHDXZxkZxNwVfFLkqs7uI66+n8dFWtSAkvfEuJ9DCSX8CUUd6p+6hrCUkTG3zP++e
         JV6+AslJBDdo5CKsKRxWTFkcuTmGKE166ZpL5Xt5GNGSzQX+QQMvfDhBSeBiVqOiofwi
         wXYMfWnq1zfkW/oZgs+EIbUgH5gn8Ga1LgzOshtGZI5n2Y8j1HByA7INFmv9wl2zGoZI
         9nxFe5L5SZT8yLz2XBlnIbGtovUjWh+aQHTaikabnSC/DQbqPgW1Jv7trK1+QYE0kAyi
         9gqZdyy9cZhCDCkQ/EInpTrQ5nV+RGPoiRvg7wmkiURcu2lPcWfZy+/+Qkfp4ABRnw2E
         RgPw==
X-Forwarded-Encrypted: i=1; AJvYcCVap5dzkax6xFOjH2WYTIG1EGcNxPdkzkJ4zHKgQhscec1wRu55fVKdrJvus92JYTuBWV8SpF4Uq0hMOlUebc1dga6I++Yjc/HSj9k=
X-Gm-Message-State: AOJu0YwSi25BdiV1WTa09H451sOe0On0gM1RsLgW7pkw5oLvI/h3w6+V
	NBLeUWHtqFrmlgVcM6xkEyHdIH7hbIeab7Y2RaSugDKRhrNTeKwvszysa3NqtnM=
X-Google-Smtp-Source: AGHT+IF7Vr8g4aGey5MWA+q3W7MDwSCWGzrkZkaE7zDxFxXJB774VSRb4A04gmHX15xeQKDoOQC1aA==
X-Received: by 2002:a05:620a:c90:b0:78d:39ef:c1e4 with SMTP id q16-20020a05620a0c9000b0078d39efc1e4mr4239836qki.24.1712967925336;
        Fri, 12 Apr 2024 17:25:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 00/11] IOMMU memory observability
Date: Sat, 13 Apr 2024 00:25:11 +0000
Message-ID: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

----------------------------------------------------------------------
Changelog
----------------------------------------------------------------------
v6:
- Added Acked-bys
- fixed minor spelling error
- Synced with Linus master branch (8f2c057754b25075aa3da132cd4fd4478cdab854)

----------------------------------------------------------------------
Description
----------------------------------------------------------------------
IOMMU subsystem may contain state that is in gigabytes. Majority of that
state is iommu page tables. Yet, there is currently, no way to observe
how much memory is actually used by the iommu subsystem.

This patch series solves this problem by adding both observability to
all pages that are allocated by IOMMU, and also accountability, so
admins can limit the amount if via cgroups.

The system-wide observability is using /proc/meminfo:
SecPageTables:    438176 kB

Contains IOMMU and KVM memory.

Per-node observability:
/sys/devices/system/node/nodeN/meminfo
Node N SecPageTables:    422204 kB

Contains IOMMU and KVM memory in the given NUMA node.

Per-node IOMMU only observability:
/sys/devices/system/node/nodeN/vmstat
nr_iommu_pages 105555

Contains number of pages IOMMU allocated in the given node.

Accountability: using sec_pagetables cgroup-v2 memory.stat entry.

With the change, iova_stress[1] stops as limit is reached:

$ ./iova_stress
iova space:     0T      free memory:   497G
iova space:     1T      free memory:   495G
iova space:     2T      free memory:   493G
iova space:     3T      free memory:   491G

stops as limit is reached.

This series encorporates suggestions that came from the discussion
at LPC [2].
----------------------------------------------------------------------
[1] https://github.com/soleen/iova_stress
[2] https://lpc.events/event/17/contributions/1466
----------------------------------------------------------------------
Previous versions
v1: https://lore.kernel.org/all/20231128204938.1453583-1-pasha.tatashin@soleen.com
v2: https://lore.kernel.org/linux-mm/20231130201504.2322355-1-pasha.tatashin@soleen.com
v3: https://lore.kernel.org/all/20231226200205.562565-1-pasha.tatashin@soleen.com
v4: https://lore.kernel.org/all/20240207174102.1486130-1-pasha.tatashin@soleen.com
v5: https://lore.kernel.org/all/20240222173942.1481394-1-pasha.tatashin@soleen.com
----------------------------------------------------------------------

Pasha Tatashin (11):
  iommu/vt-d: add wrapper functions for page allocations
  iommu/dma: use iommu_put_pages_list() to releae freelist
  iommu/amd: use page allocation function provided by iommu-pages.h
  iommu/io-pgtable-arm: use page allocation function provided by
    iommu-pages.h
  iommu/io-pgtable-dart: use page allocation function provided by
    iommu-pages.h
  iommu/exynos: use page allocation function provided by iommu-pages.h
  iommu/rockchip: use page allocation function provided by iommu-pages.h
  iommu/sun50i: use page allocation function provided by iommu-pages.h
  iommu/tegra-smmu: use page allocation function provided by
    iommu-pages.h
  iommu: observability of the IOMMU allocations
  iommu: account IOMMU allocated memory

 Documentation/admin-guide/cgroup-v2.rst |   2 +-
 Documentation/filesystems/proc.rst      |   4 +-
 drivers/iommu/amd/amd_iommu.h           |   8 -
 drivers/iommu/amd/init.c                |  91 ++++++------
 drivers/iommu/amd/io_pgtable.c          |  13 +-
 drivers/iommu/amd/io_pgtable_v2.c       |  18 +--
 drivers/iommu/amd/iommu.c               |  11 +-
 drivers/iommu/dma-iommu.c               |   7 +-
 drivers/iommu/exynos-iommu.c            |  14 +-
 drivers/iommu/intel/dmar.c              |  16 +-
 drivers/iommu/intel/iommu.c             |  47 ++----
 drivers/iommu/intel/iommu.h             |   2 -
 drivers/iommu/intel/irq_remapping.c     |  16 +-
 drivers/iommu/intel/pasid.c             |  18 +--
 drivers/iommu/intel/svm.c               |  11 +-
 drivers/iommu/io-pgtable-arm.c          |  15 +-
 drivers/iommu/io-pgtable-dart.c         |  37 ++---
 drivers/iommu/iommu-pages.h             | 186 ++++++++++++++++++++++++
 drivers/iommu/rockchip-iommu.c          |  14 +-
 drivers/iommu/sun50i-iommu.c            |   7 +-
 drivers/iommu/tegra-smmu.c              |  18 ++-
 include/linux/mmzone.h                  |   5 +-
 mm/vmstat.c                             |   3 +
 23 files changed, 359 insertions(+), 204 deletions(-)
 create mode 100644 drivers/iommu/iommu-pages.h

-- 
2.44.0.683.g7961c838ac-goog


