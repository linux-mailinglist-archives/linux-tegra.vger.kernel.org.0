Return-Path: <linux-tegra+bounces-1022-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7FC862305
	for <lists+linux-tegra@lfdr.de>; Sat, 24 Feb 2024 07:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D379B1F2327B
	for <lists+linux-tegra@lfdr.de>; Sat, 24 Feb 2024 06:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A547410A35;
	Sat, 24 Feb 2024 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcEHuA5i"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EB11864C
	for <linux-tegra@vger.kernel.org>; Sat, 24 Feb 2024 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757685; cv=none; b=nvkLWfJrX35h5HwUWb0DSgs/CpQYFnsS07vtOUCROBV/G6HscfsjpRLloIKcPrtgvsd9anQPaSYtRpxpT5+fvMXLewFXxQcDphcIuxrimsjEqA+b5w1xoyCpA0SSFcB7Ea2VZkdUbwYIPZglpXzaFQtWR4JanSD6zl6x+xMTeps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757685; c=relaxed/simple;
	bh=CvKJcI2GoHpQh51Boj5towsTve0nBMUjEP2Ds5TPKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXCB3B8s5zVpEdldUu95c1x6mJkRf4fTofNhK80gxvRxRZ2oQMeqN7Fg7GsBA3CLIDO1/PzVlzvfJR/u4zM9eXOtG7IYnnl4FuQDDpMEv+hT7wJQQIvGtoiIIzhz/+CtEoGxBwcFe3vnNVpCT5h10pjqIUk0x2r4wctrcIAACGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcEHuA5i; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so1033014b6e.3
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 22:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757682; x=1709362482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=zcEHuA5ieTQVMJ6agMa6/2TcsjVF8fVNFX+Hqf2W3u4U6pHUOOVSJpAXqKq7TvzEiG
         usW1ZEIIt5i33Yq+41VNqErHaiih6BZy06YiAZYPPsr16SouDr/8xf2ga0MtdDazVvQv
         QjFdgHzzXjarBsv87MZm1jryZj9/+Ogefz7/+F7UqufJHeVTGuAmdngyO1SGZ6igjmld
         3zwvAn+kjjvo0IB8J0kl/DDXfMcjSsyXwXr3iTWEuxTL/SCeuL47sJLjMKHPXvGT7Wff
         kS5i4b5D1P7ThgQb4xEa00s4SDYzkQ8f7lgbEMFaRIGbG+UG1itNErFjRmyaE13Lydcj
         XLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757682; x=1709362482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrRq1/AvWfoH6zIGVeIk1jFST0MUBywtAymy8iGNyNo=;
        b=BdpV6M4ipr0R9eu4UBanltibg7hsS6cE99ma8Z/mFsaT7Oinac43shYxQrvUX0Y159
         xVbcbhWkgYpey3kOBwfGMd3ebERtsNp9GeWt0FlWSST51WfBamC12007CCejBfeJGVEd
         ubR7ntl7r9oJ6PHpSzHFD5+NEbRibes4Wa4h1UDcGZGZ8JSrQMf0xoCg+oqI1U2nNC6Y
         fEIAJLGT6vGfmnkHti1NW7mPG2o93j0P9XgIWiMU+WkAiU8zbXMFNtVDGxp8jUAd3E2X
         pX49h8HrTIA/gtQ6Je3Sq/90JMPW7iwBqUzE/Zd0HAVuVMp+VkOmcDiasxImRCOjoBbp
         dA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaydCVgZSOS/mxqcpTsWTAFNmYtcCPQ0Aqb1e5xMY9272PNXVmJcVtq4rrJlVvz7R8/Qnup6AnG3aezO+eR4P31liHrCdZYAUYFj0=
X-Gm-Message-State: AOJu0YyeLsq1laVevOQ6tgrhC/pfyn4wQ6qQ37IGXNUpgiPKA88uBbbG
	6ck/YkjducueeZmcBpN5pQJxLHH7Bv3PVbk+/YECJ5iDeg7gA6xyWHJPfuxtcw==
X-Google-Smtp-Source: AGHT+IFibM5pzclLgfVnWQ4q04YXZMJ7dUMTwZy1iwdyXNkxIyosF3kkQlye3pmzcpuyS0AlJbR0Dw==
X-Received: by 2002:a05:6808:2a8d:b0:3c1:823c:b1bd with SMTP id fc13-20020a0568082a8d00b003c1823cb1bdmr1832555oib.45.1708757682265;
        Fri, 23 Feb 2024 22:54:42 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:08 +0530
Subject: [PATCH v8 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-2-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CvKJcI2GoHpQh51Boj5towsTve0nBMUjEP2Ds5TPKjI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKWG4loyEX1PEXJOdKId2sdqeLbJUkwZLok2
 Moo1uGlljqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlgAKCRBVnxHm/pHO
 9brkCACCV3ENWKeo83c0pKegS+iCQkTVUm7uxJuMA4icLm9vKffetGG+G1medZQ6vUtnp+xYgM8
 jtr/r51Dpdvf/+tKOfvW4IfFsHykbamiHO0EN5/hNph48t8h4ieskst7PY1fFBtS4np9OCr4uok
 2H1aAYLQ7au5Qj39kSKXI1o1cG5U7d/0Y+Y7Ybq9nXIAJxMG4KlVOd5yQBd3U8HhJ9kkQ8mK6S5
 V2pdxgQ4+hLFmuLuSKFaHvhqXoBqmlzWvOkfrjprSZcR8R9suy6B2U9nEIDPsEj8y+xWBmaOevz
 tv7BLVrXYcdUd9VpmP7rtLOYndcgCDhDE45aRvv3dp1KZXTa
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d305f9b4cdfe..2b11290aab4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


