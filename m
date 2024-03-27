Return-Path: <linux-tegra+bounces-1332-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6534588D680
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Mar 2024 07:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891B51C241B6
	for <lists+linux-tegra@lfdr.de>; Wed, 27 Mar 2024 06:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A40623748;
	Wed, 27 Mar 2024 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdl+8d8b"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2423922F0F
	for <linux-tegra@vger.kernel.org>; Wed, 27 Mar 2024 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521429; cv=none; b=fWxH7eLIQtlj3RzyJ87MjvXObP/9jllXQyjEe2PyhTUsjXrQekStbtMW1pLyzQlPXw5RKbByQyrYwPdnnKBzTZSwyKWaLWBrQptlGnKA6q20K4b4BihU7WTZHAOy3pawC4+bVeBds47FVPE1RiM5qB9PfbM4Q4Dn+UObdSDe+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521429; c=relaxed/simple;
	bh=11bvpB29WOEPsNZgWi/F9cZ0k6NdPLVZ7xUwINuLjH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muxVj1wf9re7+DEMhrncuNeLhz91wd32Q/6zIqGk1+qopmSWOZF1lwnNQulrhKhlhLtj+8nTkMzPco6XFpAtxKgBvOtvDrmXNl299KXM6wAZEHzQE4FlGp7l0tBskrAQWIlKCZ9lmHHjjnBpuH4p7Xek73PmCYJIoGK+GQy8dcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdl+8d8b; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e0ae065d24so28197365ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521425; x=1712126225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSuAzm3XlMTAAcdumCZGFConMRf5KMVdOQSvok+2c9Q=;
        b=cdl+8d8bj2OMeVcUdZkX09dutd0ygzFLQKeSVvDmUii1Sj+k2GiBiuaIIQQ1dlLz7a
         eIcdztkquGzZDY297oJZ83u4zikQOSvxP1A5j2h7Y1b90BBY/fwRb9ODfMpXQWo0ihOD
         kSY2rO7/p78EV5Hvxr312SAVNcc+CzW8GUzj/7fWd0eCMAY4rvCiJXKvjLcKjKZR7XSV
         oQ+56Czi7lz99yqUdqTEmTKXSvV2M5ZgbMbWAku5y1DkVs9F5KnJwjuvDaNLzziImOJl
         VZzL+H8EUA/NNBr+TN/BUtnpxxTTmfbQShGuwmkVmfIk7z6fybhHMfRzJl9bIry2G4kT
         quBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521425; x=1712126225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSuAzm3XlMTAAcdumCZGFConMRf5KMVdOQSvok+2c9Q=;
        b=ChTbCHzp91nWeJbA1r5C5EFZhUaiy9BpPpqOVNfwsMjj+ED71AnJte69ADEI+OXAcB
         91GiN5Pk4PENnDd0uR5TtDte8Nb++bVzb9zjBiopYqO+9SUralSzyeKL8tTQcoxb5CwQ
         4maec2k+DlcNtu8wpKJJOulx0QCBWn863T/ITxcygdHFT0LGfTU4BMsJTcNJjMNkygPH
         5kAG+BQ4Im6GuaXGnxbHv4ToVKlE+CHXrzcU7qtfe8j0aIbzX5CqgfjhoqGQpa13Bm3m
         oZgsFQSt1Be2lpSX4RRpeEZMbxOBnNecHvREeMEw9LlIHWQbmxn3+KNd8Iy1fIts9FPN
         tKvg==
X-Forwarded-Encrypted: i=1; AJvYcCUmirjbGn8JcNmCsmY8IXOd1LDawV3o6bBT17t8MYzTN6Cy0WYPuiVB0YDdYqawIiYpue3kJypPn1eRfkychRHIS7IV+iAeMQDUJB0=
X-Gm-Message-State: AOJu0YwR1f9OlCJgpV4mktLlV1CrmlWQSLz8EzS7sXnP2Hogl2N+7nuR
	xdnBcjO5MvX2W5QBI9XGReypCAewdIJC16zDndJIgDdq4SssRWU6r5pSjpEEzA==
X-Google-Smtp-Source: AGHT+IE9haQycs9Q8Q91eSl39u1OR+cHsQ599mlCpTtsFK7kXWvuJosCxsQnSUeW61EadHaElyNhsg==
X-Received: by 2002:a17:902:ce05:b0:1dd:de1a:bd02 with SMTP id k5-20020a170902ce0500b001ddde1abd02mr364190plg.41.1711521425358;
        Tue, 26 Mar 2024 23:37:05 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:37:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 12:05:48 +0530
Subject: [PATCH v11 2/8] PCI: dwc: ep: Add Kernel-doc comments for APIs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v11-2-6f5259f90673@linaro.org>
References: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5382;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=11bvpB29WOEPsNZgWi/F9cZ0k6NdPLVZ7xUwINuLjH8=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkhj3hcaXnph73rNP0ZBckdVuTJ6wtnYXU8tFizlnrzqI
 /PWRsZJnYzGLAyMXAyyYoos6UudtRo9Tt9YEqE+HWYQKxPIFAYuTgGYSNB99n+WZk42NTGsZ+e/
 27L+l5q25olUvTrdnU//mVhcWnFwQ+/zLOlbi16JXdd9/ZrhaeJv/m/l8404Nk4QqNSvc+xpqNh
 of+1bjXHCpDUMwfWWl6OW506Of8OcM+uNLPO56HnLBItd2Tf4zv3ipcN5+8tkx88F7FZdymL3hW
 +n5bSzCvadyEl+qXCn8YzvHhv/mvDfNQxz1VeFmlxkeeT4eaK1QkV7/roTe098UL90sNxU2+zbi
 5jZC/PenZPpL4vysrf14Zj2pa7k7OUEh1B9dTc7/0S56NrtbD9W1im7Bhh8aVw03yeIRcyt8eXB
 Y6FNHwU3MbGL164uMM5cnhsnwjNvkjafeFZUTn78H7klAA==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

All of the APIs are missing the Kernel-doc comments. Hence, add them.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 77 +++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index c05304eabb89..c2a7653b7b9f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -14,6 +14,10 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -22,6 +26,10 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
 
+/**
+ * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization complete
+ * @ep: DWC EP device
+ */
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 	struct pci_epc *epc = ep->epc;
@@ -30,6 +38,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
 
+/**
+ * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
+ *				 the endpoint function
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ *
+ * Return: struct dw_pcie_ep_func if success, NULL otherwise.
+ */
 struct dw_pcie_ep_func *
 dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
 {
@@ -60,6 +76,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+/**
+ * dw_pcie_ep_reset_bar - Reset endpoint BAR
+ * @pci: DWC PCI device
+ * @bar: BAR number of the endpoint
+ */
 void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
 {
 	u8 func_no, funcs;
@@ -439,6 +460,13 @@ static const struct pci_epc_ops epc_ops = {
 	.get_features		= dw_pcie_ep_get_features,
 };
 
+/**
+ * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -450,6 +478,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
 
+/**
+ * dw_pcie_ep_raise_msi_irq - Raise MSI IRQ to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errono otherwise.
+ */
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
 {
@@ -498,6 +534,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
 
+/**
+ * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSI-X to the host using Doorbell
+ *					method
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 				       u16 interrupt_num)
 {
@@ -517,6 +562,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_raise_msix_irq - Raise MSI-X to the host
+ * @ep: DWC EP device
+ * @func_no: Function number of the endpoint device
+ * @interrupt_num: Interrupt number to be raised
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 			      u16 interrupt_num)
 {
@@ -564,6 +617,13 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_exit - Deinitialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Deinitialize the endpoint device. EPC device is not destroyed since that will
+ * be taken care by Devres.
+ */
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -599,6 +659,14 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_init_complete - Complete DWC EP initialization
+ * @ep: DWC EP device
+ *
+ * Complete the initialization of the registers (CSRs) specific to DWC EP. This
+ * API should be called only when the endpoint receives an active refclk (either
+ * from host or generated locally).
+ */
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -716,6 +784,15 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
 
+/**
+ * dw_pcie_ep_init - Initialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Initialize the endpoint device. Allocate resources and create the EPC
+ * device with the endpoint framework.
+ *
+ * Return: 0 if success, errno otherwise.
+ */
 int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	int ret;

-- 
2.25.1


