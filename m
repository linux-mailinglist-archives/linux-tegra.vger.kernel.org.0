Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408C22DCEBF
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Dec 2020 10:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbgLQJqV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Dec 2020 04:46:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgLQJqK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 04:46:10 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B58C0611C5;
        Thu, 17 Dec 2020 01:44:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o17so52813818lfg.4;
        Thu, 17 Dec 2020 01:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxpacJWFFik4GzE6cguLm8wKxqvS5Gm/+ep+1Cdbb0Q=;
        b=kVQkr/Qeh5mEwFfEvfXluyzZ3O/+deA2+i9P8Vj31bQ8W+3SXpI8Rr2xS5TOpNCt+E
         8CFjFOBSOJOcWzX6J9P4KXf+IfdD4Kx/TzzkYkpLJ/5aGKTvPPGE1mxMy/6W8TsavxEH
         cIMjimhbJnkpnpQo1j/T5J2ewljKlyalAbr848UHfA1Z1QiMUyQALAESrtievjYDM7+x
         xUFkrQ87rsKFRXaT+3w78EHNarG+zksdUpg3jHf/BZCfwJrT0EAg7K/gneAlmM5WTbUh
         eaSWLvq+kiB7j9/iI5dE4ZrgKDtgZbeDmsN7QJOsErFCXTvWR35rJZlm3ixNGfNU72Oa
         nLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxpacJWFFik4GzE6cguLm8wKxqvS5Gm/+ep+1Cdbb0Q=;
        b=D7H3JtfkKELw5sh1P1XUqiMH2wXMl1KW1MJsBgS60TI1+2d4CT0rGaC2+wlAWzhwfm
         8ymPHbCcHqu3W5YRv5bPLMNgBdME5a1RgdorqM7j9yiE+UV1+UJucPh/734H0TsyVqE8
         MUrh7QeQ8NN5yZmvUM4GPhKw1S3nx6VDnjpz/dN8lL6EesQiFev92xQ1rf8UNclu9BXs
         H9DYavQcC3kx5fCo/9uJw2vez2JmSZnkfxVgrJziK2GdamjAhomkLGk9AXKgT+B6/pO4
         b/6DUoYB+AEmWKp4obSVFPGVivBYkpfzm9F7DgxbpP2X7n+Oo8V/MqPM7PCgamomlTNt
         cogA==
X-Gm-Message-State: AOAM532l+XPl5AwocV4pbgpdqqXvOsOSGSUz9suCundthwKal3eC9Fv6
        +hna1YI3A+olRfuemBOK6WE=
X-Google-Smtp-Source: ABdhPJwfsIB/R4F3Jl2Q2kbj8jWT93OHnVNYm9O2S+Fr4/J0Fdrl3qMavT+xjM5nfnASDz1cHG0Dbg==
X-Received: by 2002:a19:f203:: with SMTP id q3mr2870815lfh.166.1608198293347;
        Thu, 17 Dec 2020 01:44:53 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u19sm613917lji.2.2020.12.17.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 01:44:52 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] usb: host: ehci-tegra: Remove the driver
Date:   Thu, 17 Dec 2020 12:40:06 +0300
Message-Id: <20201217094007.19336-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094007.19336-1-digetx@gmail.com>
References: <20201217094007.19336-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ChipIdea driver now provides USB2 host mode support for NVIDIA Tegra
SoCs. The ehci-tegra driver is obsolete now, remove it and redirect the
older Kconfig entry to the CI driver.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/Kconfig      |   8 +-
 drivers/usb/host/Makefile     |   1 -
 drivers/usb/host/ehci-tegra.c | 604 ----------------------------------
 3 files changed, 6 insertions(+), 607 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-tegra.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 31e59309da1f..318315602337 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -269,9 +269,13 @@ config USB_EHCI_HCD_AT91
 config USB_EHCI_TEGRA
 	tristate "NVIDIA Tegra HCD support"
 	depends on ARCH_TEGRA
-	select USB_EHCI_ROOT_HUB_TT
-	select USB_TEGRA_PHY
+	select USB_CHIPIDEA
+	select USB_CHIPIDEA_HOST
+	select USB_CHIPIDEA_TEGRA
 	help
+	  This option is deprecated now and the driver was removed, use
+	  USB_CHIPIDEA_TEGRA instead.
+
 	  This driver enables support for the internal USB Host Controllers
 	  found in NVIDIA Tegra SoCs. The controllers are EHCI compliant.
 
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index c1b08703af10..3e4d298d851f 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -47,7 +47,6 @@ obj-$(CONFIG_USB_EHCI_HCD_SPEAR)	+= ehci-spear.o
 obj-$(CONFIG_USB_EHCI_HCD_STI)	+= ehci-st.o
 obj-$(CONFIG_USB_EHCI_EXYNOS)	+= ehci-exynos.o
 obj-$(CONFIG_USB_EHCI_HCD_AT91) += ehci-atmel.o
-obj-$(CONFIG_USB_EHCI_TEGRA)	+= ehci-tegra.o
 obj-$(CONFIG_USB_EHCI_BRCMSTB)	+= ehci-brcm.o
 
 obj-$(CONFIG_USB_OXU210HP_HCD)	+= oxu210hp-hcd.o
diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
deleted file mode 100644
index 869d9c4de5fc..000000000000
--- a/drivers/usb/host/ehci-tegra.c
+++ /dev/null
@@ -1,604 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * EHCI-compliant USB host controller driver for NVIDIA Tegra SoCs
- *
- * Copyright (C) 2010 Google, Inc.
- * Copyright (C) 2009 - 2013 NVIDIA Corporation
- */
-
-#include <linux/clk.h>
-#include <linux/dma-mapping.h>
-#include <linux/err.h>
-#include <linux/gpio.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/reset.h>
-#include <linux/slab.h>
-#include <linux/usb/ehci_def.h>
-#include <linux/usb/tegra_usb_phy.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
-#include <linux/usb/otg.h>
-
-#include "ehci.h"
-
-#define PORT_WAKE_BITS (PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
-
-#define TEGRA_USB_DMA_ALIGN 32
-
-#define DRIVER_DESC "Tegra EHCI driver"
-#define DRV_NAME "tegra-ehci"
-
-static struct hc_driver __read_mostly tegra_ehci_hc_driver;
-
-struct tegra_ehci_soc_config {
-	bool has_hostpc;
-};
-
-struct tegra_ehci_hcd {
-	struct clk *clk;
-	struct reset_control *rst;
-	int port_resuming;
-	bool needs_double_reset;
-};
-
-static int tegra_reset_usb_controller(struct platform_device *pdev)
-{
-	struct device_node *phy_np;
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-	struct tegra_ehci_hcd *tegra =
-		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
-	struct reset_control *rst;
-	int err;
-
-	phy_np = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
-	if (!phy_np)
-		return -ENOENT;
-
-	/*
-	 * The 1st USB controller contains some UTMI pad registers that are
-	 * global for all the controllers on the chip. Those registers are
-	 * also cleared when reset is asserted to the 1st controller.
-	 */
-	rst = of_reset_control_get_shared(phy_np, "utmi-pads");
-	if (IS_ERR(rst)) {
-		dev_warn(&pdev->dev,
-			 "can't get utmi-pads reset from the PHY\n");
-		dev_warn(&pdev->dev,
-			 "continuing, but please update your DT\n");
-	} else {
-		/*
-		 * PHY driver performs UTMI-pads reset in a case of
-		 * non-legacy DT.
-		 */
-		reset_control_put(rst);
-	}
-
-	of_node_put(phy_np);
-
-	/* reset control is shared, hence initialize it first */
-	err = reset_control_deassert(tegra->rst);
-	if (err)
-		return err;
-
-	err = reset_control_assert(tegra->rst);
-	if (err)
-		return err;
-
-	udelay(1);
-
-	err = reset_control_deassert(tegra->rst);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static int tegra_ehci_internal_port_reset(
-	struct ehci_hcd	*ehci,
-	u32 __iomem	*portsc_reg
-)
-{
-	u32		temp;
-	unsigned long	flags;
-	int		retval = 0;
-	int		i, tries;
-	u32		saved_usbintr;
-
-	spin_lock_irqsave(&ehci->lock, flags);
-	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
-	/* disable USB interrupt */
-	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
-	spin_unlock_irqrestore(&ehci->lock, flags);
-
-	/*
-	 * Here we have to do Port Reset at most twice for
-	 * Port Enable bit to be set.
-	 */
-	for (i = 0; i < 2; i++) {
-		temp = ehci_readl(ehci, portsc_reg);
-		temp |= PORT_RESET;
-		ehci_writel(ehci, temp, portsc_reg);
-		mdelay(10);
-		temp &= ~PORT_RESET;
-		ehci_writel(ehci, temp, portsc_reg);
-		mdelay(1);
-		tries = 100;
-		do {
-			mdelay(1);
-			/*
-			 * Up to this point, Port Enable bit is
-			 * expected to be set after 2 ms waiting.
-			 * USB1 usually takes extra 45 ms, for safety,
-			 * we take 100 ms as timeout.
-			 */
-			temp = ehci_readl(ehci, portsc_reg);
-		} while (!(temp & PORT_PE) && tries--);
-		if (temp & PORT_PE)
-			break;
-	}
-	if (i == 2)
-		retval = -ETIMEDOUT;
-
-	/*
-	 * Clear Connect Status Change bit if it's set.
-	 * We can't clear PORT_PEC. It will also cause PORT_PE to be cleared.
-	 */
-	if (temp & PORT_CSC)
-		ehci_writel(ehci, PORT_CSC, portsc_reg);
-
-	/*
-	 * Write to clear any interrupt status bits that might be set
-	 * during port reset.
-	 */
-	temp = ehci_readl(ehci, &ehci->regs->status);
-	ehci_writel(ehci, temp, &ehci->regs->status);
-
-	/* restore original interrupt enable bits */
-	ehci_writel(ehci, saved_usbintr, &ehci->regs->intr_enable);
-	return retval;
-}
-
-static int tegra_ehci_hub_control(
-	struct usb_hcd	*hcd,
-	u16		typeReq,
-	u16		wValue,
-	u16		wIndex,
-	char		*buf,
-	u16		wLength
-)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-	struct tegra_ehci_hcd *tegra = (struct tegra_ehci_hcd *)ehci->priv;
-	u32 __iomem	*status_reg;
-	u32		temp;
-	unsigned long	flags;
-	int		retval = 0;
-
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
-
-	spin_lock_irqsave(&ehci->lock, flags);
-
-	if (typeReq == GetPortStatus) {
-		temp = ehci_readl(ehci, status_reg);
-		if (tegra->port_resuming && !(temp & PORT_SUSPEND)) {
-			/* Resume completed, re-enable disconnect detection */
-			tegra->port_resuming = 0;
-			tegra_usb_phy_postresume(hcd->usb_phy);
-		}
-	}
-
-	else if (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_SUSPEND) {
-		temp = ehci_readl(ehci, status_reg);
-		if ((temp & PORT_PE) == 0 || (temp & PORT_RESET) != 0) {
-			retval = -EPIPE;
-			goto done;
-		}
-
-		temp &= ~(PORT_RWC_BITS | PORT_WKCONN_E);
-		temp |= PORT_WKDISC_E | PORT_WKOC_E;
-		ehci_writel(ehci, temp | PORT_SUSPEND, status_reg);
-
-		/*
-		 * If a transaction is in progress, there may be a delay in
-		 * suspending the port. Poll until the port is suspended.
-		 */
-		if (ehci_handshake(ehci, status_reg, PORT_SUSPEND,
-						PORT_SUSPEND, 5000))
-			pr_err("%s: timeout waiting for SUSPEND\n", __func__);
-
-		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
-		goto done;
-	}
-
-	/* For USB1 port we need to issue Port Reset twice internally */
-	if (tegra->needs_double_reset &&
-	   (typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET)) {
-		spin_unlock_irqrestore(&ehci->lock, flags);
-		return tegra_ehci_internal_port_reset(ehci, status_reg);
-	}
-
-	/*
-	 * Tegra host controller will time the resume operation to clear the bit
-	 * when the port control state switches to HS or FS Idle. This behavior
-	 * is different from EHCI where the host controller driver is required
-	 * to set this bit to a zero after the resume duration is timed in the
-	 * driver.
-	 */
-	else if (typeReq == ClearPortFeature &&
-					wValue == USB_PORT_FEAT_SUSPEND) {
-		temp = ehci_readl(ehci, status_reg);
-		if ((temp & PORT_RESET) || !(temp & PORT_PE)) {
-			retval = -EPIPE;
-			goto done;
-		}
-
-		if (!(temp & PORT_SUSPEND))
-			goto done;
-
-		/* Disable disconnect detection during port resume */
-		tegra_usb_phy_preresume(hcd->usb_phy);
-
-		ehci->reset_done[wIndex-1] = jiffies + msecs_to_jiffies(25);
-
-		temp &= ~(PORT_RWC_BITS | PORT_WAKE_BITS);
-		/* start resume signalling */
-		ehci_writel(ehci, temp | PORT_RESUME, status_reg);
-		set_bit(wIndex-1, &ehci->resuming_ports);
-
-		spin_unlock_irqrestore(&ehci->lock, flags);
-		msleep(20);
-		spin_lock_irqsave(&ehci->lock, flags);
-
-		/* Poll until the controller clears RESUME and SUSPEND */
-		if (ehci_handshake(ehci, status_reg, PORT_RESUME, 0, 2000))
-			pr_err("%s: timeout waiting for RESUME\n", __func__);
-		if (ehci_handshake(ehci, status_reg, PORT_SUSPEND, 0, 2000))
-			pr_err("%s: timeout waiting for SUSPEND\n", __func__);
-
-		ehci->reset_done[wIndex-1] = 0;
-		clear_bit(wIndex-1, &ehci->resuming_ports);
-
-		tegra->port_resuming = 1;
-		goto done;
-	}
-
-	spin_unlock_irqrestore(&ehci->lock, flags);
-
-	/* Handle the hub control events here */
-	return ehci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
-
-done:
-	spin_unlock_irqrestore(&ehci->lock, flags);
-	return retval;
-}
-
-struct dma_aligned_buffer {
-	void *kmalloc_ptr;
-	void *old_xfer_buffer;
-	u8 data[];
-};
-
-static void free_dma_aligned_buffer(struct urb *urb)
-{
-	struct dma_aligned_buffer *temp;
-	size_t length;
-
-	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
-		return;
-
-	temp = container_of(urb->transfer_buffer,
-		struct dma_aligned_buffer, data);
-
-	if (usb_urb_dir_in(urb)) {
-		if (usb_pipeisoc(urb->pipe))
-			length = urb->transfer_buffer_length;
-		else
-			length = urb->actual_length;
-
-		memcpy(temp->old_xfer_buffer, temp->data, length);
-	}
-	urb->transfer_buffer = temp->old_xfer_buffer;
-	kfree(temp->kmalloc_ptr);
-
-	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
-}
-
-static int alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
-{
-	struct dma_aligned_buffer *temp, *kmalloc_ptr;
-	size_t kmalloc_size;
-
-	if (urb->num_sgs || urb->sg ||
-	    urb->transfer_buffer_length == 0 ||
-	    !((uintptr_t)urb->transfer_buffer & (TEGRA_USB_DMA_ALIGN - 1)))
-		return 0;
-
-	/* Allocate a buffer with enough padding for alignment */
-	kmalloc_size = urb->transfer_buffer_length +
-		sizeof(struct dma_aligned_buffer) + TEGRA_USB_DMA_ALIGN - 1;
-
-	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
-	if (!kmalloc_ptr)
-		return -ENOMEM;
-
-	/* Position our struct dma_aligned_buffer such that data is aligned */
-	temp = PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;
-	temp->kmalloc_ptr = kmalloc_ptr;
-	temp->old_xfer_buffer = urb->transfer_buffer;
-	if (usb_urb_dir_out(urb))
-		memcpy(temp->data, urb->transfer_buffer,
-		       urb->transfer_buffer_length);
-	urb->transfer_buffer = temp->data;
-
-	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
-
-	return 0;
-}
-
-static int tegra_ehci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
-				      gfp_t mem_flags)
-{
-	int ret;
-
-	ret = alloc_dma_aligned_buffer(urb, mem_flags);
-	if (ret)
-		return ret;
-
-	ret = usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
-	if (ret)
-		free_dma_aligned_buffer(urb);
-
-	return ret;
-}
-
-static void tegra_ehci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
-{
-	usb_hcd_unmap_urb_for_dma(hcd, urb);
-	free_dma_aligned_buffer(urb);
-}
-
-static const struct tegra_ehci_soc_config tegra30_soc_config = {
-	.has_hostpc = true,
-};
-
-static const struct tegra_ehci_soc_config tegra20_soc_config = {
-	.has_hostpc = false,
-};
-
-static const struct of_device_id tegra_ehci_of_match[] = {
-	{ .compatible = "nvidia,tegra30-ehci", .data = &tegra30_soc_config },
-	{ .compatible = "nvidia,tegra20-ehci", .data = &tegra20_soc_config },
-	{ },
-};
-
-static int tegra_ehci_probe(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-	const struct tegra_ehci_soc_config *soc_config;
-	struct resource *res;
-	struct usb_hcd *hcd;
-	struct ehci_hcd *ehci;
-	struct tegra_ehci_hcd *tegra;
-	int err = 0;
-	int irq;
-	struct usb_phy *u_phy;
-
-	match = of_match_device(tegra_ehci_of_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
-		return -ENODEV;
-	}
-	soc_config = match->data;
-
-	/* Right now device-tree probed devices don't get dma_mask set.
-	 * Since shared usb code relies on it, set it here for now.
-	 * Once we have dma capability bindings this can go away.
-	 */
-	err = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-	if (err)
-		return err;
-
-	hcd = usb_create_hcd(&tegra_ehci_hc_driver, &pdev->dev,
-					dev_name(&pdev->dev));
-	if (!hcd) {
-		dev_err(&pdev->dev, "Unable to create HCD\n");
-		return -ENOMEM;
-	}
-	platform_set_drvdata(pdev, hcd);
-	ehci = hcd_to_ehci(hcd);
-	tegra = (struct tegra_ehci_hcd *)ehci->priv;
-
-	hcd->has_tt = 1;
-
-	tegra->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(tegra->clk)) {
-		dev_err(&pdev->dev, "Can't get ehci clock\n");
-		err = PTR_ERR(tegra->clk);
-		goto cleanup_hcd_create;
-	}
-
-	tegra->rst = devm_reset_control_get_shared(&pdev->dev, "usb");
-	if (IS_ERR(tegra->rst)) {
-		dev_err(&pdev->dev, "Can't get ehci reset\n");
-		err = PTR_ERR(tegra->rst);
-		goto cleanup_hcd_create;
-	}
-
-	err = clk_prepare_enable(tegra->clk);
-	if (err)
-		goto cleanup_hcd_create;
-
-	err = tegra_reset_usb_controller(pdev);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to reset controller\n");
-		goto cleanup_clk_en;
-	}
-
-	u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
-	if (IS_ERR(u_phy)) {
-		err = -EPROBE_DEFER;
-		goto cleanup_clk_en;
-	}
-	hcd->usb_phy = u_phy;
-	hcd->skip_phy_initialization = 1;
-
-	tegra->needs_double_reset = of_property_read_bool(pdev->dev.of_node,
-		"nvidia,needs-double-reset");
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hcd->regs)) {
-		err = PTR_ERR(hcd->regs);
-		goto cleanup_clk_en;
-	}
-	hcd->rsrc_start = res->start;
-	hcd->rsrc_len = resource_size(res);
-
-	ehci->caps = hcd->regs + 0x100;
-	ehci->has_hostpc = soc_config->has_hostpc;
-
-	err = usb_phy_init(hcd->usb_phy);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to initialize phy\n");
-		goto cleanup_clk_en;
-	}
-
-	u_phy->otg = devm_kzalloc(&pdev->dev, sizeof(struct usb_otg),
-			     GFP_KERNEL);
-	if (!u_phy->otg) {
-		err = -ENOMEM;
-		goto cleanup_phy;
-	}
-	u_phy->otg->host = hcd_to_bus(hcd);
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto cleanup_phy;
-	}
-
-	otg_set_host(u_phy->otg, &hcd->self);
-
-	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
-	if (err) {
-		dev_err(&pdev->dev, "Failed to add USB HCD\n");
-		goto cleanup_otg_set_host;
-	}
-	device_wakeup_enable(hcd->self.controller);
-
-	return err;
-
-cleanup_otg_set_host:
-	otg_set_host(u_phy->otg, NULL);
-cleanup_phy:
-	usb_phy_shutdown(hcd->usb_phy);
-cleanup_clk_en:
-	clk_disable_unprepare(tegra->clk);
-cleanup_hcd_create:
-	usb_put_hcd(hcd);
-	return err;
-}
-
-static int tegra_ehci_remove(struct platform_device *pdev)
-{
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-	struct tegra_ehci_hcd *tegra =
-		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
-
-	usb_remove_hcd(hcd);
-	otg_set_host(hcd->usb_phy->otg, NULL);
-	usb_phy_shutdown(hcd->usb_phy);
-	clk_disable_unprepare(tegra->clk);
-	usb_put_hcd(hcd);
-
-	return 0;
-}
-
-static void tegra_ehci_hcd_shutdown(struct platform_device *pdev)
-{
-	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-
-	if (hcd->driver->shutdown)
-		hcd->driver->shutdown(hcd);
-}
-
-static struct platform_driver tegra_ehci_driver = {
-	.probe		= tegra_ehci_probe,
-	.remove		= tegra_ehci_remove,
-	.shutdown	= tegra_ehci_hcd_shutdown,
-	.driver		= {
-		.name	= DRV_NAME,
-		.of_match_table = tegra_ehci_of_match,
-	}
-};
-
-static int tegra_ehci_reset(struct usb_hcd *hcd)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-	int retval;
-	int txfifothresh;
-
-	retval = ehci_setup(hcd);
-	if (retval)
-		return retval;
-
-	/*
-	 * We should really pull this value out of tegra_ehci_soc_config, but
-	 * to avoid needing access to it, make use of the fact that Tegra20 is
-	 * the only one so far that needs a value of 10, and Tegra20 is the
-	 * only one which doesn't set has_hostpc.
-	 */
-	txfifothresh = ehci->has_hostpc ? 0x10 : 10;
-	ehci_writel(ehci, txfifothresh << 16, &ehci->regs->txfill_tuning);
-
-	return 0;
-}
-
-static const struct ehci_driver_overrides tegra_overrides __initconst = {
-	.extra_priv_size	= sizeof(struct tegra_ehci_hcd),
-	.reset			= tegra_ehci_reset,
-};
-
-static int __init ehci_tegra_init(void)
-{
-	if (usb_disabled())
-		return -ENODEV;
-
-	pr_info(DRV_NAME ": " DRIVER_DESC "\n");
-
-	ehci_init_driver(&tegra_ehci_hc_driver, &tegra_overrides);
-
-	/*
-	 * The Tegra HW has some unusual quirks, which require Tegra-specific
-	 * workarounds. We override certain hc_driver functions here to
-	 * achieve that. We explicitly do not enhance ehci_driver_overrides to
-	 * allow this more easily, since this is an unusual case, and we don't
-	 * want to encourage others to override these functions by making it
-	 * too easy.
-	 */
-
-	tegra_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
-	tegra_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
-	tegra_ehci_hc_driver.hub_control = tegra_ehci_hub_control;
-
-	return platform_driver_register(&tegra_ehci_driver);
-}
-module_init(ehci_tegra_init);
-
-static void __exit ehci_tegra_cleanup(void)
-{
-	platform_driver_unregister(&tegra_ehci_driver);
-}
-module_exit(ehci_tegra_cleanup);
-
-MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_ehci_of_match);
-- 
2.29.2

