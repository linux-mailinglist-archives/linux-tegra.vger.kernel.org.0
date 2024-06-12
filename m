Return-Path: <linux-tegra+bounces-2649-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B966904EA2
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Jun 2024 10:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06284288050
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Jun 2024 08:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2802E16D9A1;
	Wed, 12 Jun 2024 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNnLwaE0"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133A18E02;
	Wed, 12 Jun 2024 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182635; cv=none; b=K6tAEa2OpWRQxGe6VfxfwbSYzKgrAU1Z3gbbluI2VWTNoLCTlni8vfyZxBxZyc71ENF+GftVf6vbt1/rNNbntBhs56y14cFpvc7HXcglGO0T0CijowsN1qmVolax2fBTeyGhFfekxPDaXdOFBKU8fG7IEiBoq7i454awl5BIbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182635; c=relaxed/simple;
	bh=c6XO0O2U1ow9a5pfqe8WHJT77dxA0rr79i1urRf+6Ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sE3Li6lDU2CthEHydJfmwqgrF8BIbgOmQt9bjzlnnPl6dhaQKvtsQcc894SPegqI7deM4eZChFAyvCAeaMvnapBi2XwRv+U2gLyFRbHv6VbHHFQOFQjMQH5hgqRSOqOweAqGRoTpu80wuKuEXK96Faf2Mi0Y+Iw5EUO6mOYdsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNnLwaE0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718182633; x=1749718633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6XO0O2U1ow9a5pfqe8WHJT77dxA0rr79i1urRf+6Ws=;
  b=jNnLwaE0c9bHPdw2iRPxtSK/qhEpqpSVj/F2gQR7e3uH1Isl+ECEKZ3O
   27kHQCTwuaXU9tbvgAQAf2+4FXb2mnY5bF5DpFNLjKn4xjFHDCRaWnn3e
   RNhYebWzvbd9++zp+86BSsaDCRcE21L/1aq7IouW//C9i6qWlYKfR9S2Q
   0EueOtve57bEvSkEYPBpuk7guBDc0Ax3mo+7bi320SJlgskAplpRtH3lu
   DMkofUMpCfX48WbL00PeZOkAdZRGsoso7bey71z8ObP4R8Cpl4v7AScaa
   rMoe7gMc5Ao5XCbQ+qkIQcvL4uRGzWniwXzW9+WG/RGEYnmSA6a/+ngiJ
   A==;
X-CSE-ConnectionGUID: rNx7nqlGQWOklk4A9np1/g==
X-CSE-MsgGUID: bOPRJo9kTK+Hdkg9ZFJbyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18792110"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="18792110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:57:12 -0700
X-CSE-ConnectionGUID: uX6gUWwrQMyze5tBaayxVw==
X-CSE-MsgGUID: oxm1CwNsTc6+4iD1L7z6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39582791"
Received: from unknown (HELO localhost) ([10.245.247.204])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:57:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Robert Richter <rric@kernel.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 2/3] PCI: Use resource_set_{range,size}() helpers
Date: Wed, 12 Jun 2024 11:56:28 +0300
Message-Id: <20240612085629.5015-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612085629.5015-1-ilpo.jarvinen@linux.intel.com>
References: <20240612085629.5015-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert open-coded resource size calculations to use
resource_set_{range,size}() helpers.

While at it, use SZ_* for size parameter where appropriate which makes
the intent of code more obvious.

Also, cast sizes to resource_size_t, not u64.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/pci-tegra.c       |  2 +-
 drivers/pci/controller/pci-thunder-pem.c |  4 +--
 drivers/pci/ecam.c                       |  2 +-
 drivers/pci/iov.c                        |  6 ++--
 drivers/pci/pci.c                        |  3 +-
 drivers/pci/quirks.c                     | 20 ++++++--------
 drivers/pci/setup-bus.c                  | 35 ++++++++++--------------
 drivers/pci/setup-res.c                  |  7 ++---
 8 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 038d974a318e..2ce55ed1cd8b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1460,7 +1460,7 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
 	pcie->cs = *res;
 
 	/* constrain configuration space to 4 KiB */
-	pcie->cs.end = pcie->cs.start + SZ_4K - 1;
+	resource_set_size(&pcie->cs, SZ_4K);
 
 	pcie->cfg = devm_ioremap_resource(dev, &pcie->cs);
 	if (IS_ERR(pcie->cfg)) {
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 06a9855cb431..f1bd5de67997 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -400,9 +400,9 @@ static int thunder_pem_acpi_init(struct pci_config_window *cfg)
 		 * Reserve 64K size PEM specific resources. The full 16M range
 		 * size is required for thunder_pem_init() call.
 		 */
-		res_pem->end = res_pem->start + SZ_64K - 1;
+		resource_set_size(res_pem, SZ_64K);
 		thunder_pem_reserve_range(dev, root->segment, res_pem);
-		res_pem->end = res_pem->start + SZ_16M - 1;
+		resource_set_size(res_pem, SZ_16M);
 
 		/* Reserve PCI configuration space as well. */
 		thunder_pem_reserve_range(dev, root->segment, &cfg->res);
diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
index 1c40d2506aef..260b7de2dbd5 100644
--- a/drivers/pci/ecam.c
+++ b/drivers/pci/ecam.c
@@ -55,7 +55,7 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
 	bus_range_max = resource_size(cfgres) >> bus_shift;
 	if (bus_range > bus_range_max) {
 		bus_range = bus_range_max;
-		cfg->busr.end = busr->start + bus_range - 1;
+		resource_set_size(&cfg->busr, bus_range);
 		dev_warn(dev, "ECAM area %pR can only accommodate %pR (reduced from %pR desired)\n",
 			 cfgres, &cfg->busr, busr);
 	}
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index aaa33e8dc4c9..4be402fe9ab9 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -327,8 +327,8 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
 		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
-		virtfn->resource[i].start = res->start + size * id;
-		virtfn->resource[i].end = virtfn->resource[i].start + size - 1;
+		resource_set_range(&virtfn->resource[i],
+				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
 		BUG_ON(rc);
 	}
@@ -804,7 +804,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 			goto failed;
 		}
 		iov->barsz[i] = resource_size(res);
-		res->end = res->start + resource_size(res) * total - 1;
+		resource_set_size(res, resource_size(res) * total);
 		pci_info(dev, "%s %pR: contains BAR %d for %d VFs\n",
 			 res_name, res, i, total);
 		i += bar64;
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 59e0949fb079..afcd8e49e82c 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6559,8 +6559,7 @@ static void pci_request_resource_alignment(struct pci_dev *dev, int bar,
 	} else {
 		r->flags &= ~IORESOURCE_SIZEALIGN;
 		r->flags |= IORESOURCE_STARTALIGN;
-		r->start = align;
-		r->end = r->start + size - 1;
+		resource_set_range(r, align, size);
 	}
 	r->flags |= IORESOURCE_UNSET;
 }
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 568410e64ce6..bde0f5388d06 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -29,6 +29,7 @@
 #include <linux/nvme.h>
 #include <linux/platform_data/x86/apple.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 #include <linux/suspend.h>
 #include <linux/switchtec.h>
 #include "pci.h"
@@ -573,8 +574,7 @@ static void quirk_extend_bar_to_page(struct pci_dev *dev)
 		const char *r_name = pci_resource_name(dev, i);
 
 		if (r->flags & IORESOURCE_MEM && resource_size(r) < PAGE_SIZE) {
-			r->end = PAGE_SIZE - 1;
-			r->start = 0;
+			resource_set_range(r, 0, PAGE_SIZE);
 			r->flags |= IORESOURCE_UNSET;
 			pci_info(dev, "%s %pR: expanded to page size\n",
 				 r_name, r);
@@ -593,8 +593,7 @@ static void quirk_s3_64M(struct pci_dev *dev)
 
 	if ((r->start & 0x3ffffff) || r->end != r->start + 0x3ffffff) {
 		r->flags |= IORESOURCE_UNSET;
-		r->start = 0;
-		r->end = 0x3ffffff;
+		resource_set_range(r, 0, SZ_64M);
 	}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_S3,	PCI_DEVICE_ID_S3_868,		quirk_s3_64M);
@@ -1329,8 +1328,7 @@ static void quirk_dunord(struct pci_dev *dev)
 	struct resource *r = &dev->resource[1];
 
 	r->flags |= IORESOURCE_UNSET;
-	r->start = 0;
-	r->end = 0xffffff;
+	resource_set_range(r, 0, SZ_16M);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_DUNORD,	PCI_DEVICE_ID_DUNORD_I3000,	quirk_dunord);
 
@@ -2327,8 +2325,7 @@ static void quirk_tc86c001_ide(struct pci_dev *dev)
 
 	if (r->start & 0x8) {
 		r->flags |= IORESOURCE_UNSET;
-		r->start = 0;
-		r->end = 0xf;
+		resource_set_range(r, 0, SZ_16);
 	}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_TOSHIBA_2,
@@ -2356,8 +2353,7 @@ static void quirk_plx_pci9050(struct pci_dev *dev)
 			pci_info(dev, "Re-allocating PLX PCI 9050 BAR %u to length 256 to avoid bit 7 bug\n",
 				 bar);
 			r->flags |= IORESOURCE_UNSET;
-			r->start = 0;
-			r->end = 0xff;
+			resource_set_range(r, 0, SZ_256);
 		}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_9050,
@@ -3509,13 +3505,13 @@ static void quirk_intel_ntb(struct pci_dev *dev)
 	if (rc)
 		return;
 
-	dev->resource[2].end = dev->resource[2].start + ((u64) 1 << val) - 1;
+	resource_set_size(&dev->resource[2], (resource_size_t)1 << val);
 
 	rc = pci_read_config_byte(dev, 0x00D1, &val);
 	if (rc)
 		return;
 
-	dev->resource[4].end = dev->resource[4].start + ((u64) 1 << val) - 1;
+	resource_set_size(&dev->resource[4], (resource_size_t)1 << val);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0e08, quirk_intel_ntb);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0e0d, quirk_intel_ntb);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 909e6a7c3cc3..004405edf290 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -243,8 +243,7 @@ static void reassign_resources_sorted(struct list_head *realloc_head,
 		add_size = add_res->add_size;
 		align = add_res->min_align;
 		if (!resource_size(res)) {
-			res->start = align;
-			res->end = res->start + add_size - 1;
+			resource_set_range(res, align, add_size);
 			if (pci_assign_resource(add_res->dev, idx))
 				reset_resource(res);
 		} else {
@@ -937,8 +936,7 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 		return;
 	}
 
-	b_res->start = min_align;
-	b_res->end = b_res->start + size0 - 1;
+	resource_set_range(b_res, min_align, size0);
 	b_res->flags |= IORESOURCE_STARTALIGN;
 	if (bus->self && size1 > size0 && realloc_head) {
 		add_to_list(realloc_head, bus->self, b_res, size1-size0,
@@ -1127,8 +1125,7 @@ static void pci_bus_size_cardbus(struct pci_bus *bus,
 	 * Reserve some resources for CardBus.  We reserve a fixed amount
 	 * of bus space for CardBus bridges.
 	 */
-	b_res->start = pci_cardbus_io_size;
-	b_res->end = b_res->start + pci_cardbus_io_size - 1;
+	resource_set_range(b_res, pci_cardbus_io_size, pci_cardbus_io_size);
 	b_res->flags |= IORESOURCE_IO | IORESOURCE_STARTALIGN;
 	if (realloc_head) {
 		b_res->end -= pci_cardbus_io_size;
@@ -1140,8 +1137,7 @@ static void pci_bus_size_cardbus(struct pci_bus *bus,
 	b_res = &bridge->resource[PCI_CB_BRIDGE_IO_1_WINDOW];
 	if (b_res->parent)
 		goto handle_b_res_2;
-	b_res->start = pci_cardbus_io_size;
-	b_res->end = b_res->start + pci_cardbus_io_size - 1;
+	resource_set_range(b_res, pci_cardbus_io_size, pci_cardbus_io_size);
 	b_res->flags |= IORESOURCE_IO | IORESOURCE_STARTALIGN;
 	if (realloc_head) {
 		b_res->end -= pci_cardbus_io_size;
@@ -1174,8 +1170,8 @@ static void pci_bus_size_cardbus(struct pci_bus *bus,
 	 * Otherwise, allocate one region of twice the size.
 	 */
 	if (ctrl & PCI_CB_BRIDGE_CTL_PREFETCH_MEM0) {
-		b_res->start = pci_cardbus_mem_size;
-		b_res->end = b_res->start + pci_cardbus_mem_size - 1;
+		resource_set_range(b_res, pci_cardbus_mem_size,
+				   pci_cardbus_mem_size);
 		b_res->flags |= IORESOURCE_MEM | IORESOURCE_PREFETCH |
 				    IORESOURCE_STARTALIGN;
 		if (realloc_head) {
@@ -1192,8 +1188,7 @@ static void pci_bus_size_cardbus(struct pci_bus *bus,
 	b_res = &bridge->resource[PCI_CB_BRIDGE_MEM_1_WINDOW];
 	if (b_res->parent)
 		goto handle_done;
-	b_res->start = pci_cardbus_mem_size;
-	b_res->end = b_res->start + b_res_3_size - 1;
+	resource_set_range(b_res, pci_cardbus_mem_size, b_res_3_size);
 	b_res->flags |= IORESOURCE_MEM | IORESOURCE_STARTALIGN;
 	if (realloc_head) {
 		b_res->end -= b_res_3_size;
@@ -1772,7 +1767,7 @@ static void adjust_bridge_window(struct pci_dev *bridge, struct resource *res,
 		return;
 	}
 
-	res->end = res->start + new_size - 1;
+	resource_set_size(res, new_size);
 
 	/* If the resource is part of the add_list, remove it now */
 	if (add_list)
@@ -1935,8 +1930,8 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 		 * what is available).
 		 */
 		align = pci_resource_alignment(dev, res);
-		io.end = align ? io.start + ALIGN_DOWN(io_per_b, align) - 1
-			       : io.start + io_per_b - 1;
+		resource_set_size(&io, align ? ALIGN_DOWN(io_per_b, align)
+					     : io_per_b);
 
 		/*
 		 * The x_per_b holds the extra resource space that can be
@@ -1948,15 +1943,15 @@ static void pci_bus_distribute_available_resources(struct pci_bus *bus,
 
 		res = &dev->resource[PCI_BRIDGE_MEM_WINDOW];
 		align = pci_resource_alignment(dev, res);
-		mmio.end = align ? mmio.start + ALIGN_DOWN(mmio_per_b, align) - 1
-				 : mmio.start + mmio_per_b - 1;
+		resource_set_size(&mmio, align ? ALIGN_DOWN(mmio_per_b, align)
+					       : mmio_per_b);
 		mmio.start -= resource_size(res);
 
 		res = &dev->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
 		align = pci_resource_alignment(dev, res);
-		mmio_pref.end = align ? mmio_pref.start +
-					ALIGN_DOWN(mmio_pref_per_b, align) - 1
-				      : mmio_pref.start + mmio_pref_per_b - 1;
+		resource_set_size(&mmio_pref,
+				  align ? ALIGN_DOWN(mmio_pref_per_b, align)
+					: mmio_pref_per_b);
 		mmio_pref.start -= resource_size(res);
 
 		pci_bus_distribute_available_resources(b, add_list, io, mmio,
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6d933ddfd46..ca14576bf2bf 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -211,8 +211,7 @@ static int pci_revert_fw_address(struct resource *res, struct pci_dev *dev,
 
 	start = res->start;
 	end = res->end;
-	res->start = fw_addr;
-	res->end = res->start + size - 1;
+	resource_set_range(res, fw_addr, size);
 	res->flags &= ~IORESOURCE_UNSET;
 
 	root = pci_find_parent_resource(dev, res);
@@ -463,7 +462,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 	if (ret)
 		return ret;
 
-	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
+	resource_set_size(res, pci_rebar_size_to_bytes(size));
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
@@ -475,7 +474,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 error_resize:
 	pci_rebar_set_size(dev, resno, old);
-	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
+	resource_set_size(res, pci_rebar_size_to_bytes(old));
 	return ret;
 }
 EXPORT_SYMBOL(pci_resize_resource);
-- 
2.39.2


