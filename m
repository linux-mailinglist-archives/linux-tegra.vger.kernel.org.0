Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B5DC45AA
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729695AbfJBBmH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44501 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbfJBBmH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id u40so24272502qth.11
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZZ+tUEu8JllTZk2OnVO3bmD3CZCMXEEUSMbv+KGLiVI=;
        b=c3zJFj49nLK/AGdeZ7NNmPy3UKDuTIsT4dDvtOTVxBD64OsIcP7Fhvw6oj33/Knobv
         d7EkY5CqX5jyo+hAadLulkyOLK7CqH6qVOjM1BO7YgdTpZ+IKNIFteYaqwn+Jf7YoaDl
         ltvNwUxFwn0QFRn/8eJgaP0RGNU9IXLTFtF7N6eNN8Ja1amOZ7QFiSyR4kVxbjBgMlEC
         /58sJ0hMJ7Qa0JfpwGunZLCD5ajsXFbV33H4F7FX1BNc/qxkZSPpHUwQJbCTmS8PeZtY
         HdywHKnAhalTyIR0uuBfcHuf2rB6S008hXokmSd81ytn2jKpPbITlBEobikKVV1a1rLN
         Lk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZZ+tUEu8JllTZk2OnVO3bmD3CZCMXEEUSMbv+KGLiVI=;
        b=TtB+G2Pr7v+kpf5BlrwM4O5Vu9iJkeBv9KMX0HTrazkhFsnnQebV4RLyyPuB1osM2E
         r/KZZ4zStcrKWIGKpx0eSz2BllGcm7jvGK7u65MG0PdtFa8x2s6AafhZVDrNO26lsuQv
         XRvGha8AmpcijhdjnBrAX1vONXeyE4OiKD+Q264UEp22b4elB5tjkfKnZiKR7tmZBe4h
         bHftCmSp3qS0yChv0go0+j1qOwTTB8nvChgjfayNbr3etNrHPjKV9F6CD+Y25mcbrLB4
         mqA+pBhmoljAr2ljqSV32ezKXbEumwwUp6vkGiBmGvmcqlH+DLO545BWxlxaTZ50yGJh
         yUKw==
X-Gm-Message-State: APjAAAWoImWph/+mAtyya39n1eSTxza970ahDPHjujoC0QNsuscyeqk6
        aKMcLYd/5OojHzd6x7yYsps=
X-Google-Smtp-Source: APXvYqxYuUFLEx9tt7qyQJN7Osrc3DmoPfmtT46MyGUfv8fg6IGSUrVJJ/JHNUQq2BJpOIu7vnfx9g==
X-Received: by 2002:ac8:2e31:: with SMTP id r46mr1505944qta.293.1569980525842;
        Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:05 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH 4/5] usb: chipidea: tegra: add the tegra specific bits
Date:   Tue,  1 Oct 2019 21:41:52 -0400
Message-Id: <20191002014153.29831-5-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As Tegra requires special handlers for resets and dma alignment, add
those functions to a header.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/chipidea/tegra.h | 159 +++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 drivers/usb/chipidea/tegra.h

diff --git a/drivers/usb/chipidea/tegra.h b/drivers/usb/chipidea/tegra.h
new file mode 100644
index 000000000000..4e61381bbd68
--- /dev/null
+++ b/drivers/usb/chipidea/tegra.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ *
+ * Tegra specific bits for Chipidea USB dual role driver
+ *
+ * Pulled from ehci-tegra.c
+ *
+ */
+
+#define TEGRA_USB_DMA_ALIGN 32
+
+struct tegra_dma_aligned_buffer {
+	void *kmalloc_ptr;
+	void *old_xfer_buffer;
+	u8 data[0];
+};
+
+static int tegra_ehci_internal_port_reset(
+	struct ehci_hcd *ehci,
+	u32 __iomem     *portsc_reg
+)
+{
+	u32             temp;
+	unsigned long   flags;
+	int             retval = 0;
+	int             i, tries;
+	u32             saved_usbintr;
+
+	spin_lock_irqsave(&ehci->lock, flags);
+	saved_usbintr = ehci_readl(ehci, &ehci->regs->intr_enable);
+	/* disable USB interrupt */
+	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
+	spin_unlock_irqrestore(&ehci->lock, flags);
+
+	/*
+	 * Here we have to do Port Reset at most twice for
+	 * Port Enable bit to be set.
+	 */
+	for (i = 0; i < 2; i++) {
+		temp = ehci_readl(ehci, portsc_reg);
+		temp |= PORT_RESET;
+		ehci_writel(ehci, temp, portsc_reg);
+		mdelay(10);
+		temp &= ~PORT_RESET;
+		ehci_writel(ehci, temp, portsc_reg);
+		mdelay(1);
+		tries = 100;
+		do {
+			mdelay(1);
+			/*
+			 * Up to this point, Port Enable bit is
+			 * expected to be set after 2 ms waiting.
+			 * USB1 usually takes extra 45 ms, for safety,
+			 * we take 100 ms as timeout.
+			 */
+			temp = ehci_readl(ehci, portsc_reg);
+		} while (!(temp & PORT_PE) && tries--);
+		if (temp & PORT_PE)
+			break;
+	}
+	if (i == 2)
+		retval = -ETIMEDOUT;
+
+	/*
+	 * Clear Connect Status Change bit if it's set.
+	 * We can't clear PORT_PEC. It will also cause PORT_PE to be cleared.
+	 */
+	if (temp & PORT_CSC)
+		ehci_writel(ehci, PORT_CSC, portsc_reg);
+
+	/*
+	 * Write to clear any interrupt status bits that might be set
+	 * during port reset.
+	 */
+	temp = ehci_readl(ehci, &ehci->regs->status);
+	ehci_writel(ehci, temp, &ehci->regs->status);
+
+	/* restore original interrupt enable bits */
+	ehci_writel(ehci, saved_usbintr, &ehci->regs->intr_enable);
+	return retval;
+}
+
+static void tegra_free_dma_aligned_buffer(struct urb *urb)
+{
+	struct tegra_dma_aligned_buffer *temp;
+	size_t length;
+
+	if (!(urb->transfer_flags & URB_ALIGNED_TEMP_BUFFER))
+		return;
+
+	temp = container_of(urb->transfer_buffer,
+		struct tegra_dma_aligned_buffer, data);
+
+	if (usb_urb_dir_in(urb)) {
+		if (usb_pipeisoc(urb->pipe))
+			length = urb->transfer_buffer_length;
+		else
+			length = urb->actual_length;
+
+		memcpy(temp->old_xfer_buffer, temp->data, length);
+	}
+	urb->transfer_buffer = temp->old_xfer_buffer;
+	kfree(temp->kmalloc_ptr);
+
+	urb->transfer_flags &= ~URB_ALIGNED_TEMP_BUFFER;
+}
+
+static int tegra_alloc_dma_aligned_buffer(struct urb *urb, gfp_t mem_flags)
+{
+	struct tegra_dma_aligned_buffer *temp, *kmalloc_ptr;
+	size_t kmalloc_size;
+
+	if (urb->num_sgs || urb->sg ||
+		urb->transfer_buffer_length == 0 ||
+		!((uintptr_t)urb->transfer_buffer & (TEGRA_USB_DMA_ALIGN - 1)))
+		return 0;
+
+	/* Allocate a buffer with enough padding for alignment */
+	kmalloc_size = urb->transfer_buffer_length +
+		sizeof(struct tegra_dma_aligned_buffer) + TEGRA_USB_DMA_ALIGN - 1;
+
+	kmalloc_ptr = kmalloc(kmalloc_size, mem_flags);
+	if (!kmalloc_ptr)
+		return -ENOMEM;
+
+	/* Position our struct dma_aligned_buffer such that data is aligned */
+	temp = PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;
+	temp->kmalloc_ptr = kmalloc_ptr;
+	temp->old_xfer_buffer = urb->transfer_buffer;
+	if (usb_urb_dir_out(urb))
+		memcpy(temp->data, urb->transfer_buffer,
+			urb->transfer_buffer_length);
+	urb->transfer_buffer = temp->data;
+
+	urb->transfer_flags |= URB_ALIGNED_TEMP_BUFFER;
+
+	return 0;
+}
+
+static int tegra_ehci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
+				      gfp_t mem_flags)
+{
+	int ret;
+
+	ret = tegra_alloc_dma_aligned_buffer(urb, mem_flags);
+	if (ret)
+		return ret;
+
+	ret = usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
+	if (ret)
+		tegra_free_dma_aligned_buffer(urb);
+
+	return ret;
+}
+
+static void tegra_ehci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
+{
+	usb_hcd_unmap_urb_for_dma(hcd, urb);
+	tegra_free_dma_aligned_buffer(urb);
+}
-- 
2.17.1

