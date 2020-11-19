Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6127C2B8E29
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Nov 2020 09:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgKSIys (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Nov 2020 03:54:48 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16367 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgKSIyr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:47 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632cd0000>; Thu, 19 Nov 2020 00:54:37 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:44 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:42 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 16/16] xhci: tegra: Enable ELPG for runtime/system PM
Date:   Thu, 19 Nov 2020 16:54:05 +0800
Message-ID: <20201119085405.556138-17-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776077; bh=+miKM29C6JXC0HaawAWaOQyAqGwBKfa0cz2OemokXRg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=inXKsBtFM6Qu2U0ekvOPUxcX/q0jwCwbnIvlRtCSQKu66nB3x1jcthzvdaRZNNxMN
         eR4rMCj6B1jAN9LxXLu+Mls1u7VhtaTyAgaUJSvHRxQmlzRCE6GrTzQ6fCyg1zHxI3
         wcjgff2XtDPAUgQOVU+5sndj1BVu2E/GwH5woHX3xfSv96A/9PegG65R3hbcULiWMU
         52CvxCrAJors7xiyxegXjZHHje/ahJ2xFu9TrQYbKCqfs2DF9qnRPTwZEyqN9UqNsc
         SgUxYrfxZKAlGpoWzTC0eTRYSexk59jMl6FEFdsTgai+OzOOLKjIFbDxLVwPNiVdXn
         T/DYwMhLC0UIw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit implements the complete programming sequence for ELPG
entry and exit.

 1. At ELPG entry, invokes tegra_xusb_padctl_enable_phy_sleepwalk()
    and tegra_xusb_padctl_enable_phy_wake() to configure XUSB PADCTL
    sleepwalk and wake detection circuits to maintain USB lines level
    and respond to wake events (wake-on-connect, wake-on-disconnect,
    device-initiated-wake).

 2. At ELPG exit, invokes tegra_xusb_padctl_disable_phy_sleepwalk()
    and tegra_xusb_padctl_disable_phy_wake() to disarm sleepwalk and
    wake detection circuits.

At runtime suspend, XUSB host controller can enter ELPG to reduce
power consumption. When XUSB PADCTL wake detection circuit detects
a wake event, an interrupt will be raised. xhci-tegra driver then
will invoke pm_runtime_resume() for xhci-tegra.

Runtime resume could also be triggered by protocol drivers, this is
the host-initiated-wake event. At runtime resume, xhci-tegra driver
brings XUSB host controller out of ELPG to handle the wake events.

The same ELPG enter/exit procedure will be performed for system
suspend/resume path so USB devices can remain connected across SC7.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v5:
   avoid using xhci_get_rhub()
   protect ELPG routines with (CONFIG_PM || CONFIG_PM_SLEEP)
v4:
   reshuffle the code to avoid these pre-declarations
v3:
   use 'unsigned int' for PHY index
   remove unnecessary 'else'
   drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()

 drivers/usb/host/xhci-tegra.c | 407 ++++++++++++++++++++++++++++++----
 1 file changed, 370 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 375aaf4d22dc..c75987c607ff 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -15,9 +15,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
+#include <linux/usb/ch9.h>
 #include <linux/pm.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -224,6 +226,7 @@ struct tegra_xusb {
=20
 	int xhci_irq;
 	int mbox_irq;
+	int padctl_irq;
=20
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
@@ -269,6 +272,7 @@ struct tegra_xusb {
 		dma_addr_t phys;
 	} fw;
=20
+	bool suspended;
 	struct tegra_xusb_context context;
 };
=20
@@ -658,6 +662,9 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void=
 *data)
=20
 	mutex_lock(&tegra->lock);
=20
+	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
+		goto out;
+
 	value =3D fpci_readl(tegra, tegra->soc->mbox.data_out);
 	tegra_xusb_mbox_unpack(&msg, value);
=20
@@ -671,6 +678,7 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void=
 *data)
=20
 	tegra_xusb_mbox_handle(tegra, &msg);
=20
+out:
 	mutex_unlock(&tegra->lock);
 	return IRQ_HANDLED;
 }
@@ -811,16 +819,6 @@ static void tegra_xusb_phy_disable(struct tegra_xusb *=
tegra)
 	}
 }
=20
-static int tegra_xusb_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
-static int tegra_xusb_runtime_resume(struct device *dev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int tegra_xusb_init_context(struct tegra_xusb *tegra)
 {
@@ -1121,6 +1119,24 @@ static int __tegra_xusb_enable_firmware_messages(str=
uct tegra_xusb *tegra)
 	return err;
 }
=20
+static irqreturn_t tegra_xusb_padctl_irq(int irq, void *data)
+{
+	struct tegra_xusb *tegra =3D data;
+
+	mutex_lock(&tegra->lock);
+
+	if (tegra->suspended) {
+		mutex_unlock(&tegra->lock);
+		return IRQ_HANDLED;
+	}
+
+	mutex_unlock(&tegra->lock);
+
+	pm_runtime_resume(tegra->dev);
+
+	return IRQ_HANDLED;
+}
+
 static int tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
 {
 	int err;
@@ -1244,6 +1260,52 @@ static void tegra_xhci_id_work(struct work_struct *w=
ork)
 	}
 }
=20
+#ifdef IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
+static bool is_usb2_otg_phy(struct tegra_xusb *tegra, unsigned int index)
+{
+	return (tegra->usbphy[index] !=3D NULL);
+}
+
+static bool is_usb3_otg_phy(struct tegra_xusb *tegra, unsigned int index)
+{
+	struct tegra_xusb_padctl *padctl =3D tegra->padctl;
+	unsigned int i;
+	int port;
+
+	for (i =3D 0; i < tegra->num_usb_phys; i++) {
+		if (is_usb2_otg_phy(tegra, i)) {
+			port =3D tegra_xusb_padctl_get_usb3_companion(padctl, i);
+			if ((port >=3D 0) && (index =3D=3D (unsigned int)port))
+				return true;
+		}
+	}
+
+	return false;
+}
+
+static bool is_host_mode_phy(struct tegra_xusb *tegra, unsigned int phy_ty=
pe, unsigned int index)
+{
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "hsic") =3D=3D 0)
+		return true;
+
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "usb2") =3D=3D 0) {
+		if (is_usb2_otg_phy(tegra, index))
+			return ((index =3D=3D tegra->otg_usb2_port) && tegra->host_mode);
+		else
+			return true;
+	}
+
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "usb3") =3D=3D 0) {
+		if (is_usb3_otg_phy(tegra, index))
+			return ((index =3D=3D tegra->otg_usb3_port) && tegra->host_mode);
+		else
+			return true;
+	}
+
+	return false;
+}
+#endif
+
 static int tegra_xusb_get_usb2_port(struct tegra_xusb *tegra,
 					      struct usb_phy *usbphy)
 {
@@ -1336,6 +1398,7 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xu=
sb *tegra)
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra;
+	struct device_node *np;
 	struct resource *regs;
 	struct xhci_hcd *xhci;
 	unsigned int i, j, k;
@@ -1383,6 +1446,14 @@ static int tegra_xusb_probe(struct platform_device *=
pdev)
 	if (IS_ERR(tegra->padctl))
 		return PTR_ERR(tegra->padctl);
=20
+	np =3D of_parse_phandle(pdev->dev.of_node, "nvidia,xusb-padctl", 0);
+	if (!np)
+		return -ENODEV;
+
+	tegra->padctl_irq =3D of_irq_get(np, 0);
+	if (tegra->padctl_irq <=3D 0)
+		return (tegra->padctl_irq =3D=3D 0) ? -ENODEV : tegra->padctl_irq;
+
 	tegra->host_clk =3D devm_clk_get(&pdev->dev, "xusb_host");
 	if (IS_ERR(tegra->host_clk)) {
 		err =3D PTR_ERR(tegra->host_clk);
@@ -1527,6 +1598,7 @@ static int tegra_xusb_probe(struct platform_device *p=
dev)
 		goto put_powerdomains;
 	}
=20
+	tegra->hcd->skip_phy_initialization =3D 1;
 	tegra->hcd->regs =3D tegra->regs;
 	tegra->hcd->rsrc_start =3D regs->start;
 	tegra->hcd->rsrc_len =3D resource_size(regs);
@@ -1609,12 +1681,6 @@ static int tegra_xusb_probe(struct platform_device *=
pdev)
 		goto put_usb3;
 	}
=20
-	err =3D tegra_xusb_enable_firmware_messages(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable messages: %d\n", err);
-		goto remove_usb3;
-	}
-
 	err =3D devm_request_threaded_irq(&pdev->dev, tegra->mbox_irq,
 					tegra_xusb_mbox_irq,
 					tegra_xusb_mbox_thread, 0,
@@ -1624,12 +1690,36 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
 		goto remove_usb3;
 	}
=20
+	err =3D devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq, NULL, te=
gra_xusb_padctl_irq,
+					IRQF_ONESHOT, dev_name(&pdev->dev), tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
+		goto remove_usb3;
+	}
+
+	err =3D tegra_xusb_enable_firmware_messages(tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable messages: %d\n", err);
+		goto remove_usb3;
+	}
+
 	err =3D tegra_xusb_init_usb_phy(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to init USB PHY: %d\n", err);
 		goto remove_usb3;
 	}
=20
+	/* Enable wake for both USB 2.0 and USB 3.0 roothubs */
+	device_init_wakeup(&tegra->hcd->self.root_hub->dev, true);
+	device_init_wakeup(&xhci->shared_hcd->self.root_hub->dev, true);
+	device_init_wakeup(tegra->dev, true);
+
+	pm_runtime_use_autosuspend(tegra->dev);
+	pm_runtime_set_autosuspend_delay(tegra->dev, 2000);
+	pm_runtime_mark_last_busy(tegra->dev);
+	pm_runtime_set_active(tegra->dev);
+	pm_runtime_enable(tegra->dev);
+
 	return 0;
=20
 remove_usb3:
@@ -1665,6 +1755,7 @@ static int tegra_xusb_remove(struct platform_device *=
pdev)
=20
 	tegra_xusb_deinit_usb_phy(tegra);
=20
+	pm_runtime_get_sync(&pdev->dev);
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_put_hcd(xhci->shared_hcd);
 	xhci->shared_hcd =3D NULL;
@@ -1674,8 +1765,8 @@ static int tegra_xusb_remove(struct platform_device *=
pdev)
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
=20
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put(&pdev->dev);
=20
 	tegra_xusb_powergate_partitions(tegra);
=20
@@ -1689,7 +1780,7 @@ static int tegra_xusb_remove(struct platform_device *=
pdev)
 	return 0;
 }
=20
-#ifdef CONFIG_PM_SLEEP
+#ifdef IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
 static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 {
 	struct device *dev =3D hub->hcd->self.controller;
@@ -1715,9 +1806,17 @@ static bool xhci_hub_ports_suspended(struct xhci_hub=
 *hub)
 static int tegra_xusb_check_ports(struct tegra_xusb *tegra)
 {
 	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
+	struct xhci_bus_state *bus_state =3D &xhci->usb2_rhub.bus_state;
 	unsigned long flags;
 	int err =3D 0;
=20
+	if (bus_state->bus_suspended) {
+		/* xusb_hub_suspend() has just directed one or more USB2 port(s)
+		 * to U3 state, it takes 3ms to enter U3.
+		 */
+		usleep_range(3000, 4000);
+	}
+
 	spin_lock_irqsave(&xhci->lock, flags);
=20
 	if (!xhci_hub_ports_suspended(&xhci->usb2_rhub) ||
@@ -1763,45 +1862,186 @@ static void tegra_xusb_restore_context(struct tegr=
a_xusb *tegra)
 	}
 }
=20
-static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
+static enum usb_device_speed tegra_xhci_portsc_to_speed(struct tegra_xusb =
*tegra, u32 portsc)
+{
+	if (DEV_LOWSPEED(portsc))
+		return USB_SPEED_LOW;
+
+	if (DEV_HIGHSPEED(portsc))
+		return USB_SPEED_HIGH;
+
+	if (DEV_FULLSPEED(portsc))
+		return USB_SPEED_FULL;
+
+	if (DEV_SUPERSPEED_ANY(portsc))
+		return USB_SPEED_SUPER;
+
+	return USB_SPEED_UNKNOWN;
+}
+
+static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
 {
+	struct tegra_xusb_padctl *padctl =3D tegra->padctl;
 	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
+	enum usb_device_speed speed;
+	struct phy *phy;
+	unsigned int index, offset;
+	unsigned int i, j, k;
+	struct xhci_hub *rhub;
+	u32 portsc;
+
+	for (i =3D 0, k =3D 0; i < tegra->soc->num_types; i++) {
+		if (strcmp(tegra->soc->phy_types[i].name, "usb3") =3D=3D 0)
+			rhub =3D &xhci->usb3_rhub;
+		else
+			rhub =3D &xhci->usb2_rhub;
+
+		if (strcmp(tegra->soc->phy_types[i].name, "hsic") =3D=3D 0)
+			offset =3D tegra->soc->ports.usb2.count;
+		else
+			offset =3D 0;
+
+		for (j =3D 0; j < tegra->soc->phy_types[i].num; j++) {
+			phy =3D tegra->phys[k++];
+
+			if (!phy)
+				continue;
+
+			index =3D j + offset;
+
+			if (index >=3D rhub->num_ports)
+				continue;
+
+			if (!is_host_mode_phy(tegra, i, j))
+				continue;
+
+			portsc =3D readl(rhub->ports[index]->addr);
+			speed =3D tegra_xhci_portsc_to_speed(tegra, portsc);
+			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy, speed);
+			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
+		}
+	}
+}
+
+static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
+{
+	struct tegra_xusb_padctl *padctl =3D tegra->padctl;
+	unsigned int i;
+
+	for (i =3D 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
+	}
+}
+
+static void tegra_xhci_disable_phy_sleepwalk(struct tegra_xusb *tegra)
+{
+	struct tegra_xusb_padctl *padctl =3D tegra->padctl;
+	unsigned int i;
+
+	for (i =3D 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		tegra_xusb_padctl_disable_phy_sleepwalk(padctl, tegra->phys[i]);
+	}
+}
+
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
+{
+	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
+	struct device *dev =3D tegra->dev;
+	bool wakeup =3D runtime ? true : device_may_wakeup(dev);
+	unsigned int i;
 	int err;
+	u32 usbcmd;
+
+	dev_dbg(dev, "entering ELPG\n");
+
+	usbcmd =3D readl(&xhci->op_regs->command);
+	usbcmd &=3D ~CMD_EIE;
+	writel(usbcmd, &xhci->op_regs->command);
=20
 	err =3D tegra_xusb_check_ports(tegra);
 	if (err < 0) {
 		dev_err(tegra->dev, "not all ports suspended: %d\n", err);
-		return err;
+		goto out;
 	}
=20
 	err =3D xhci_suspend(xhci, wakeup);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
-		return err;
+		goto out;
 	}
=20
 	tegra_xusb_save_context(tegra);
-	tegra_xusb_phy_disable(tegra);
+
+	if (wakeup)
+		tegra_xhci_enable_phy_sleepwalk_wake(tegra);
+
+	tegra_xusb_powergate_partitions(tegra);
+
+	for (i =3D 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		phy_power_off(tegra->phys[i]);
+		if (!wakeup)
+			phy_exit(tegra->phys[i]);
+	}
+
 	tegra_xusb_clk_disable(tegra);
=20
-	return 0;
+out:
+	if (!err)
+		dev_dbg(tegra->dev, "entering ELPG done\n");
+	else {
+		usbcmd =3D readl(&xhci->op_regs->command);
+		usbcmd |=3D CMD_EIE;
+		writel(usbcmd, &xhci->op_regs->command);
+
+		dev_dbg(tegra->dev, "entering ELPG failed\n");
+		pm_runtime_mark_last_busy(tegra->dev);
+	}
+
+	return err;
 }
=20
-static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
+static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 {
 	struct xhci_hcd *xhci =3D hcd_to_xhci(tegra->hcd);
+	struct device *dev =3D tegra->dev;
+	bool wakeup =3D runtime ? true : device_may_wakeup(dev);
+	unsigned int i;
+	u32 usbcmd;
 	int err;
=20
+	dev_dbg(dev, "exiting ELPG\n");
+	pm_runtime_mark_last_busy(tegra->dev);
+
 	err =3D tegra_xusb_clk_enable(tegra);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
-		return err;
+		goto out;
 	}
=20
-	err =3D tegra_xusb_phy_enable(tegra);
-	if (err < 0) {
-		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
-		goto disable_clk;
+	err =3D tegra_xusb_unpowergate_partitions(tegra);
+	if (err)
+		goto disable_clks;
+
+	if (wakeup)
+		tegra_xhci_disable_phy_wake(tegra);
+
+	for (i =3D 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		if (!wakeup)
+			phy_init(tegra->phys[i]);
+
+		phy_power_on(tegra->phys[i]);
 	}
=20
 	tegra_xusb_config(tegra);
@@ -1819,31 +2059,79 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *=
tegra, bool wakeup)
 		goto disable_phy;
 	}
=20
-	err =3D xhci_resume(xhci, true);
+	if (wakeup)
+		tegra_xhci_disable_phy_sleepwalk(tegra);
+
+	err =3D xhci_resume(xhci, 0);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
 	}
=20
-	return 0;
+	usbcmd =3D readl(&xhci->op_regs->command);
+	usbcmd |=3D CMD_EIE;
+	writel(usbcmd, &xhci->op_regs->command);
+
+	goto out;
=20
 disable_phy:
-	tegra_xusb_phy_disable(tegra);
-disable_clk:
+	for (i =3D 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		phy_power_off(tegra->phys[i]);
+		if (!wakeup)
+			phy_exit(tegra->phys[i]);
+	}
+	tegra_xusb_powergate_partitions(tegra);
+disable_clks:
 	tegra_xusb_clk_disable(tegra);
+out:
+	if (!err)
+		dev_dbg(dev, "exiting ELPG done\n");
+	else
+		dev_dbg(dev, "exiting ELPG failed\n");
+
 	return err;
 }
=20
 static int tegra_xusb_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-	bool wakeup =3D device_may_wakeup(dev);
 	int err;
=20
 	synchronize_irq(tegra->mbox_irq);
=20
 	mutex_lock(&tegra->lock);
-	err =3D tegra_xusb_enter_elpg(tegra, wakeup);
+
+	if (pm_runtime_suspended(dev)) {
+		err =3D tegra_xusb_exit_elpg(tegra, true);
+		if (err < 0)
+			goto out;
+	}
+
+	err =3D tegra_xusb_enter_elpg(tegra, false);
+	if (err < 0) {
+		if (pm_runtime_suspended(dev)) {
+			pm_runtime_disable(dev);
+			pm_runtime_set_active(dev);
+			pm_runtime_enable(dev);
+		}
+
+		goto out;
+	}
+
+out:
+	if (!err) {
+		tegra->suspended =3D true;
+		pm_runtime_disable(dev);
+
+		if (device_may_wakeup(dev)) {
+			if (enable_irq_wake(tegra->padctl_irq))
+				dev_err(dev, "failed to enable padctl wakes\n");
+		}
+	}
+
 	mutex_unlock(&tegra->lock);
=20
 	return err;
@@ -1852,11 +2140,56 @@ static int tegra_xusb_suspend(struct device *dev)
 static int tegra_xusb_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
-	bool wakeup =3D device_may_wakeup(dev);
 	int err;
=20
 	mutex_lock(&tegra->lock);
-	err =3D tegra_xusb_exit_elpg(tegra, wakeup);
+
+	if (!tegra->suspended) {
+		mutex_unlock(&tegra->lock);
+		return 0;
+	}
+
+	err =3D tegra_xusb_exit_elpg(tegra, false);
+	if (err < 0) {
+		mutex_unlock(&tegra->lock);
+		return err;
+	}
+
+	if (device_may_wakeup(dev)) {
+		if (disable_irq_wake(tegra->padctl_irq))
+			dev_err(dev, "failed to disable padctl wakes\n");
+	}
+	tegra->suspended =3D false;
+	mutex_unlock(&tegra->lock);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+static int tegra_xusb_runtime_suspend(struct device *dev)
+{
+	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
+	int ret;
+
+	synchronize_irq(tegra->mbox_irq);
+	mutex_lock(&tegra->lock);
+	ret =3D tegra_xusb_enter_elpg(tegra, true);
+	mutex_unlock(&tegra->lock);
+
+	return ret;
+}
+
+static int tegra_xusb_runtime_resume(struct device *dev)
+{
+	struct tegra_xusb *tegra =3D dev_get_drvdata(dev);
+	int err;
+
+	mutex_lock(&tegra->lock);
+	err =3D tegra_xusb_exit_elpg(tegra, true);
 	mutex_unlock(&tegra->lock);
=20
 	return err;
--=20
2.25.1

