Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450B6672FF
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jul 2019 18:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfGLQID (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jul 2019 12:08:03 -0400
Received: from foss.arm.com ([217.140.110.172]:59642 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbfGLQID (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jul 2019 12:08:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7F22B;
        Fri, 12 Jul 2019 09:08:01 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D0B93F246;
        Fri, 12 Jul 2019 09:07:59 -0700 (PDT)
Date:   Fri, 12 Jul 2019 17:07:54 +0100
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com,
        catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, digetx@gmail.com,
        mperttunen@nvidia.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V13 12/12] PCI: tegra: Add Tegra194 PCIe support
Message-ID: <20190712160754.GA24285@e121166-lin.cambridge.arm.com>
References: <20190710062212.1745-1-vidyas@nvidia.com>
 <20190710062212.1745-13-vidyas@nvidia.com>
 <20190711125433.GB26088@e121166-lin.cambridge.arm.com>
 <986d0b1a-666a-7b05-a9f3-e761518bdc92@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <986d0b1a-666a-7b05-a9f3-e761518bdc92@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 12, 2019 at 09:02:49PM +0530, Vidya Sagar wrote:

[...]

> > > +static irqreturn_t tegra_pcie_irq_handler(int irq, void *arg)
> > > +{
> > > +	struct tegra_pcie_dw *pcie = arg;
> > > +
> > > +	if (pcie->mode == DW_PCIE_RC_TYPE)
> > > +		return tegra_pcie_rp_irq_handler(pcie);
> > 
> > What's the point of registering the handler if mode != DW_PCIE_RC_TYPE ?
> Currently this driver supports only root port mode but we have a plan
> to add support for endpoint mode (as Tegra194 as dual mode
> controllers) also in future and when that happens, we'll have a
> corresponding tegra_pcie_ep_irq_handler() to take care of ep specific
> interrupts.

Sure, that's why you should add tegra_pcie_dw->mode when it is needed,
not in this patch.

[...]

> > > +static int tegra_pcie_dw_host_init(struct pcie_port *pp)
> > > +{
> > > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > > +	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
> > > +	u32 val, tmp, offset, speed;
> > > +	unsigned int count;
> > > +	u16 val_w;
> > > +
> > > +core_init:
> > 
> > I think it would be cleaner to include all registers programming
> > within a function and we remove this label (and goto) below.
> Some background: As per spec r4.0 v1.0, downstream ports that support
> 16.0 GT/s must support Scaled Flow Control (sec 3.4.2) and Tegra194's
> downstream ports being 16.0 GT/s capable, enable scaled flow control
> by having Data Link Feature (sec 7.7.4) enabled by default. There is
> one endpoint (ASMedia USB3.0 controller) that doesn't link up with
> root port because of this (i.e. DLF being enabled). The way we are
> detecting this situation is to check for partial linkup i.e. one of
> application logic registers (i.e. from "appl" region) says link is up
> but the same is not reflected in configuration space of root port.
> Recommendation from our hardware team in this situation is to disable
> DLF in root port and try link up with endpoint again.  To achieve
> this, we put the core through reset cycle, disable DLF and proceed
> with configuring all other registers and check for link up.
> 
> Initially in Patch-1, I didn't have goto statement but a recursion
> with depth-1 (as the above situation occurs only once). It was
> reviewed @ http://patchwork.ozlabs.org/patch/1065707/ and Thierry said
> it would be simpler to use a goto instead of calling the same function
> again. So, I modified the code accordingly. Please do let me know if
> you strongly feel we should call tegra_pcie_dw_host_init() instead of
> goto here. I'll change it.

I did not say we should call tegra_pcie_dw_host_init(), sorry for
not being clear. What I asked is factoring out registers programming
in a function and call it where core_init: label is and call it
again if DLF enablement causes link up to fail.

[...]

> > > +static int tegra_pcie_bpmp_set_ctrl_state(struct tegra_pcie_dw *pcie,
> > > +					  bool enable)
> > > +{
> > > +	struct mrq_uphy_response resp;
> > > +	struct tegra_bpmp_message msg;
> > > +	struct mrq_uphy_request req;
> > > +	int err;
> > > +
> > > +	if (pcie->cid == 5)
> > > +		return 0;
> > 
> > What's wrong with cid == 5 ? Explain please.
> Controller with ID=5 doesn't need any programming to enable it which is
> done here through calling firmware API.
> 
> > 
> > > +	memset(&req, 0, sizeof(req));
> > > +	memset(&resp, 0, sizeof(resp));
> > > +
> > > +	req.cmd = CMD_UPHY_PCIE_CONTROLLER_STATE;
> > > +	req.controller_state.pcie_controller = pcie->cid;
> > > +	req.controller_state.enable = enable;
> > > +
> > > +	memset(&msg, 0, sizeof(msg));
> > > +	msg.mrq = MRQ_UPHY;
> > > +	msg.tx.data = &req;
> > > +	msg.tx.size = sizeof(req);
> > > +	msg.rx.data = &resp;
> > > +	msg.rx.size = sizeof(resp);
> > > +
> > > +	if (irqs_disabled())
> > 
> > Can you explain to me what this check is meant to achieve please ?
> Firmware interface provides different APIs to be called when there are
> no interrupts enabled in the system (noirq context) and otherwise
> hence checking that situation here and calling appropriate API.

That's what I am questioning. Being called from {suspend/resume}_noirq()
callbacks (if that's the code path this check caters for) does not mean
irqs_disabled() == true.

Actually, if tegra_bpmp_transfer() requires IRQs to be enabled you may
even end up in a situation where that blocking call does not wake up
because the IRQ in question was disabled in the NOIRQ suspend/resume
phase.

[...]

> > > +static int tegra_pcie_dw_probe(struct platform_device *pdev)
> > > +{
> > > +	const struct tegra_pcie_soc *data;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct resource *atu_dma_res;
> > > +	struct tegra_pcie_dw *pcie;
> > > +	struct resource *dbi_res;
> > > +	struct pcie_port *pp;
> > > +	struct dw_pcie *pci;
> > > +	struct phy **phys;
> > > +	char *name;
> > > +	int ret;
> > > +	u32 i;
> > > +
> > > +	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > > +	if (!pcie)
> > > +		return -ENOMEM;
> > > +
> > > +	pci = &pcie->pci;
> > > +	pci->dev = &pdev->dev;
> > > +	pci->ops = &tegra_dw_pcie_ops;
> > > +	pp = &pci->pp;
> > > +	pcie->dev = &pdev->dev;
> > > +
> > > +	data = (struct tegra_pcie_soc *)of_device_get_match_data(dev);
> > > +	if (!data)
> > > +		return -EINVAL;
> > > +	pcie->mode = (enum dw_pcie_device_mode)data->mode;
> > > +
> > > +	ret = tegra_pcie_dw_parse_dt(pcie);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	pcie->pex_ctl_supply = devm_regulator_get(dev, "vddio-pex-ctl");
> > > +	if (IS_ERR(pcie->pex_ctl_supply)) {
> > > +		dev_err(dev, "Failed to get regulator: %ld\n",
> > > +			PTR_ERR(pcie->pex_ctl_supply));
> > > +		return PTR_ERR(pcie->pex_ctl_supply);
> > > +	}
> > > +
> > > +	pcie->core_clk = devm_clk_get(dev, "core");
> > > +	if (IS_ERR(pcie->core_clk)) {
> > > +		dev_err(dev, "Failed to get core clock: %ld\n",
> > > +			PTR_ERR(pcie->core_clk));
> > > +		return PTR_ERR(pcie->core_clk);
> > > +	}
> > > +
> > > +	pcie->appl_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > +						      "appl");
> > > +	if (!pcie->appl_res) {
> > > +		dev_err(dev, "Failed to find \"appl\" region\n");
> > > +		return PTR_ERR(pcie->appl_res);
> > > +	}
> > > +	pcie->appl_base = devm_ioremap_resource(dev, pcie->appl_res);
> > > +	if (IS_ERR(pcie->appl_base))
> > > +		return PTR_ERR(pcie->appl_base);
> > > +
> > > +	pcie->core_apb_rst = devm_reset_control_get(dev, "apb");
> > > +	if (IS_ERR(pcie->core_apb_rst)) {
> > > +		dev_err(dev, "Failed to get APB reset: %ld\n",
> > > +			PTR_ERR(pcie->core_apb_rst));
> > > +		return PTR_ERR(pcie->core_apb_rst);
> > > +	}
> > > +
> > > +	phys = devm_kcalloc(dev, pcie->phy_count, sizeof(*phys), GFP_KERNEL);
> > > +	if (!phys)
> > > +		return PTR_ERR(phys);
> > > +
> > > +	for (i = 0; i < pcie->phy_count; i++) {
> > > +		name = kasprintf(GFP_KERNEL, "p2u-%u", i);
> > > +		if (!name) {
> > > +			dev_err(dev, "Failed to create P2U string\n");
> > > +			return -ENOMEM;
> > > +		}
> > > +		phys[i] = devm_phy_get(dev, name);
> > > +		kfree(name);
> > > +		if (IS_ERR(phys[i])) {
> > > +			ret = PTR_ERR(phys[i]);
> > > +			dev_err(dev, "Failed to get PHY: %d\n", ret);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	pcie->phys = phys;
> > > +
> > > +	dbi_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
> > > +	if (!dbi_res) {
> > > +		dev_err(dev, "Failed to find \"dbi\" region\n");
> > > +		return PTR_ERR(dbi_res);
> > > +	}
> > > +	pcie->dbi_res = dbi_res;
> > > +
> > > +	pci->dbi_base = devm_ioremap_resource(dev, dbi_res);
> > > +	if (IS_ERR(pci->dbi_base))
> > > +		return PTR_ERR(pci->dbi_base);
> > > +
> > > +	/* Tegra HW locates DBI2 at a fixed offset from DBI */
> > > +	pci->dbi_base2 = pci->dbi_base + 0x1000;
> > > +
> > > +	atu_dma_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > > +						   "atu_dma");
> > > +	if (!atu_dma_res) {
> > > +		dev_err(dev, "Failed to find \"atu_dma\" region\n");
> > > +		return PTR_ERR(atu_dma_res);
> > > +	}
> > > +	pcie->atu_dma_res = atu_dma_res;
> > > +	pci->atu_base = devm_ioremap_resource(dev, atu_dma_res);
> > > +	if (IS_ERR(pci->atu_base))
> > > +		return PTR_ERR(pci->atu_base);
> > > +
> > > +	pcie->core_rst = devm_reset_control_get(dev, "core");
> > > +	if (IS_ERR(pcie->core_rst)) {
> > > +		dev_err(dev, "Failed to get core reset: %ld\n",
> > > +			PTR_ERR(pcie->core_rst));
> > > +		return PTR_ERR(pcie->core_rst);
> > > +	}
> > > +
> > > +	pp->irq = platform_get_irq_byname(pdev, "intr");
> > > +	if (!pp->irq) {
> > > +		dev_err(dev, "Failed to get \"intr\" interrupt\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	ret = devm_request_irq(dev, pp->irq, tegra_pcie_irq_handler,
> > > +			       IRQF_SHARED, "tegra-pcie-intr", pcie);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to request IRQ %d: %d\n", pp->irq, ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	pcie->bpmp = tegra_bpmp_get(dev);
> > > +	if (IS_ERR(pcie->bpmp))
> > > +		return PTR_ERR(pcie->bpmp);
> > > +
> > > +	platform_set_drvdata(pdev, pcie);
> > > +
> > > +	if (pcie->mode == DW_PCIE_RC_TYPE) {
> > > +		ret = tegra_pcie_config_rp(pcie);
> > > +		if (ret && ret != -ENOMEDIUM)
> > > +			goto fail;
> > > +		else
> > > +			return 0;
> > 
> > So if the link is not up we still go ahead and make probe
> > succeed. What for ?
> We may need root port to be available to support hot-plugging of
> endpoint devices, so, we don't fail the probe.

We need it or we don't. If you do support hotplugging of endpoint
devices point me at the code, otherwise link up failure means
failure to probe.

> > > +	}
> > > +
> > > +fail:
> > > +	tegra_bpmp_put(pcie->bpmp);
> > > +	return ret;
> > > +}
> > > +
> > > +static int tegra_pcie_dw_remove(struct platform_device *pdev)
> > > +{
> > > +	struct tegra_pcie_dw *pcie = platform_get_drvdata(pdev);
> > > +
> > > +	if (pcie->mode != DW_PCIE_RC_TYPE)
> > > +		return 0;
> > > +
> > > +	if (!pcie->link_state)
> > > +		return 0;
> > > +
> > > +	debugfs_remove_recursive(pcie->debugfs);
> > > +	tegra_pcie_deinit_controller(pcie);
> > > +	pm_runtime_put_sync(pcie->dev);
> > > +	pm_runtime_disable(pcie->dev);
> > > +	tegra_bpmp_put(pcie->bpmp);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int tegra_pcie_dw_suspend_late(struct device *dev)
> > > +{
> > > +	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> > > +	u32 val;
> > > +
> > > +	if (!pcie->link_state)
> > > +		return 0;
> > > +
> > > +	/* Enable HW_HOT_RST mode */
> > > +	val = appl_readl(pcie, APPL_CTRL);
> > > +	val &= ~(APPL_CTRL_HW_HOT_RST_MODE_MASK <<
> > > +		 APPL_CTRL_HW_HOT_RST_MODE_SHIFT);
> > > +	val |= APPL_CTRL_HW_HOT_RST_EN;
> > > +	appl_writel(pcie, val, APPL_CTRL);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int tegra_pcie_dw_suspend_noirq(struct device *dev)
> > > +{
> > > +	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> > > +
> > > +	if (!pcie->link_state)
> > > +		return 0;
> > > +
> > > +	/* Save MSI interrupt vector */
> > > +	pcie->msi_ctrl_int = dw_pcie_readl_dbi(&pcie->pci,
> > > +					       PORT_LOGIC_MSI_CTRL_INT_0_EN);
> > > +	tegra_pcie_downstream_dev_to_D0(pcie);
> > 
> > I think this requires some comments. AFAIU this is allowed by
> > the PCI specs (PCI Express Base 4.0 r1.0 September 29-2017,
> > 5.2 Link State Power Management). However, I would like to
> > understand how this plays with the D state the devices are left
> > in upon system suspend.
> > 
> > "As the following example illustrates, it is also possible to remove
> > power without first placing all Functions into D3Hot".
> > 
> > I assume that's what happens on this platform to allow L2 entry but
> > again, this needs clarification.
> Yes. It is true that in the case of Tegra194, it brings devices back
> to D0 before putting link to L2 state.

Comment it, extensively, so that anyone reading the code understands
why it is done so and what happens to devices then.

Lorenzo
