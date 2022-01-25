Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB6549ADD0
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jan 2022 09:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237744AbiAYIGO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jan 2022 03:06:14 -0500
Received: from guitar.tcltek.co.il ([84.110.109.230]:35004 "EHLO mx.tkos.co.il"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1448047AbiAYID2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jan 2022 03:03:28 -0500
Received: from tarshish (unknown [10.0.8.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id D1B26440537;
        Tue, 25 Jan 2022 10:02:58 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1643097779;
        bh=iPGeJdTdA+TpA5xDJP7UJ9drYm1TDPI/YbdN2WqBtnU=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=d60MWrops0rKjqbjNjCWnpl8XxcE937GqSNudiQOtHJKzP8P1m8whC/P7CfNU3vXC
         GYxdBeZPq+SYSaC+ENkTG9HI/9EWiGxERRjcazKailFGjGSBtSqXlHTFSZQfaKb8mN
         5us8w77Ge0m2MEdKQSOFnZQhVkj7lEF1qGsy2pPgz3Z55TYf9kSyQcGCp6Bh6uNfNW
         oVw6ZFr0ygyqaLndNk9pFZkv3FuZ14dBOTfhiAwGiyui4QZcWqm886yqGbDNtXIP1R
         AIYLvoan+t/fVlVZcRwOtxog664E6e4ERFEtjL5dnyn66kdysGXCe55rGzxmnHF0kj
         /GkVHCemMk3Cg==
References: <f69d32f08a890463a331567e5742f2d33fa8b2bb.1643041464.git.baruch@tkos.co.il>
 <20220124204252.GA1552314@bhelgaas>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] PCI: qcom: add support for IPQ60xx PCIe controller
Date:   Tue, 25 Jan 2022 09:41:45 +0200
In-reply-to: <20220124204252.GA1552314@bhelgaas>
Message-ID: <8735lc9r9d.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Bjorn,

Thanks for your review comments.

On Mon, Jan 24 2022, Bjorn Helgaas wrote:
> Capitalize subject line to match history, i.e.,
>
>   $ git log --oneline drivers/pci/controller/dwc/pcie-qcom.c
>   3f13d611aa6b PCI: qcom: Use __be16 type to store return value from cpu_to_be16()
>   4e0e90539bb0 PCI: qcom: Fix an error handling path in 'qcom_pcie_probe()'
>   45a3ec891370 PCI: qcom: Add sc8180x compatible
>   aa9c0df98c29 PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
>   b89ff410253d PCI: qcom: Replace ops with struct pcie_cfg in pcie match data
>   2cfef1971aea PCI: qcom: Use PHY_REFCLK_USE_PAD only for ipq8064
>   7081556f81f7 PCI: qcom: Add support for ddrss_sf_tbu clock
>   4c9398822106 PCI: qcom: Add support for configuring BDF to SID mapping for SM8250
>   e1dd639e374a PCI: qcom: Add SM8250 SoC support
>
> A good one would be:
>
>   PCI: qcom: Add IPQ60xx support
>
> We already know this is a PCIe controller, and it's nice to have the
> important words like "IPQ60xx" early in the message so they don't get
> truncated or wrapped.
>
> On Mon, Jan 24, 2022 at 06:27:31PM +0200, Baruch Siach wrote:
>> From: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> 
>> IPQ60xx series of SoCs have one port of PCIe gen 3. Add support for that
>> platform.
>> 
>> The code is based on downstream[1] Codeaurora kernel v5.4 (branch
>> win.linuxopenwrt.2.0).
>> 
>> Split out the DBI registers access part from .init into .post_init. DBI
>> registers are only accessible after phy_power_on().
>> 
>> [1] https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/
>> 
>> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
>> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
>> ---
>> v5:
>> 
>>   * Remove comments from qcom_pcie_init_2_9_0() (Bjorn Andersson)
>> 
>> v4:
>> 
>>   * Rebase on v5.16-rc1
>> 
>> v3:
>>   * Drop speed setup; rely on generic code (Rob Herring)
>> 
>>   * Drop unused CLK_RATE macros (Bjorn Helgaas)
>> 
>>   * Minor formatting fixes (Bjorn Helgaas)
>> 
>>   * Add reference to downstream Codeaurora kernel tree (Bjorn Helgaas)
>> 
>> v2:
>>   * Drop ATU configuration; rely on common code instead
>> 
>>   * Use more common register macros
>> 
>>   * Use bulk clk and reset APIs
>> ---
>>  drivers/pci/controller/dwc/pcie-designware.h |   1 +
>>  drivers/pci/controller/dwc/pcie-qcom.c       | 137 +++++++++++++++++++
>>  2 files changed, 138 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index ea87809ee298..279c3778a13b 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>> @@ -76,6 +76,7 @@
>>  
>>  #define GEN3_RELATED_OFF			0x890
>>  #define GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL	BIT(0)
>> +#define GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS	BIT(13)
>>  #define GEN3_RELATED_OFF_GEN3_EQ_DISABLE	BIT(16)
>>  #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_SHIFT	24
>>  #define GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK	GENMASK(25, 24)
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index c19cd506ed3f..5d47e572da44 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -52,6 +52,10 @@
>>  #define PCIE20_PARF_DBI_BASE_ADDR		0x168
>>  #define PCIE20_PARF_SLV_ADDR_SPACE_SIZE		0x16C
>>  #define PCIE20_PARF_MHI_CLOCK_RESET_CTRL	0x174
>> +#define AHB_CLK_EN				BIT(0)
>> +#define MSTR_AXI_CLK_EN				BIT(1)
>> +#define BYPASS					BIT(4)
>> +
>>  #define PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT	0x178
>>  #define PCIE20_PARF_AXI_MSTR_WR_ADDR_HALT_V2	0x1A8
>>  #define PCIE20_PARF_LTSSM			0x1B0
>> @@ -171,6 +175,11 @@ struct qcom_pcie_resources_2_7_0 {
>>  	struct clk *ref_clk_src;
>>  };
>>  
>> +struct qcom_pcie_resources_2_9_0 {
>> +	struct clk_bulk_data clks[5];
>> +	struct reset_control *rst;
>> +};
>> +
>>  union qcom_pcie_resources {
>>  	struct qcom_pcie_resources_1_0_0 v1_0_0;
>>  	struct qcom_pcie_resources_2_1_0 v2_1_0;
>> @@ -178,6 +187,7 @@ union qcom_pcie_resources {
>>  	struct qcom_pcie_resources_2_3_3 v2_3_3;
>>  	struct qcom_pcie_resources_2_4_0 v2_4_0;
>>  	struct qcom_pcie_resources_2_7_0 v2_7_0;
>> +	struct qcom_pcie_resources_2_9_0 v2_9_0;
>>  };
>>  
>>  struct qcom_pcie;
>> @@ -1297,6 +1307,119 @@ static void qcom_pcie_post_deinit_2_7_0(struct qcom_pcie *pcie)
>>  	clk_disable_unprepare(res->pipe_clk);
>>  }
>>  
>> +static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>> +{
>> +	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>> +	struct dw_pcie *pci = pcie->pci;
>> +	struct device *dev = pci->dev;
>> +	int ret;
>> +
>> +	res->clks[0].id = "iface";
>> +	res->clks[1].id = "axi_m";
>> +	res->clks[2].id = "axi_s";
>> +	res->clks[3].id = "axi_bridge";
>> +	res->clks[4].id = "rchng";
>> +
>> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	res->rst = devm_reset_control_array_get_exclusive(dev);
>> +	if (IS_ERR(res->rst))
>> +		return PTR_ERR(res->rst);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_pcie_deinit_2_9_0(struct qcom_pcie *pcie)
>> +{
>> +	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>> +
>> +	clk_bulk_disable_unprepare(ARRAY_SIZE(res->clks), res->clks);
>> +}
>> +
>> +static int qcom_pcie_init_2_9_0(struct qcom_pcie *pcie)
>> +{
>> +	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>> +	struct device *dev = pcie->pci->dev;
>> +	int ret;
>> +
>> +	ret = reset_control_assert(res->rst);
>> +	if (ret) {
>> +		dev_err(dev, "reset assert failed (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usleep_range(2000, 2500);
>
> Where do these sleep durations come from?  If they're specified
> somewhere by PCIe, can you include a citation, e.g., a section number
> in the spec.

As I mentioned before, I have no access to hardware documentation. I'm
only porting working code from downstream kernel.

In a comment on v4 Bjorn Andersson mentioned "datasheet stating the
minimum timing of the operations to be performed to get the PCIe
controller into a known (clean) state".

  https://lore.kernel.org/all/Ydd5Wh0KeADBQ%2Fh1@ripper/

I have no further details.

>> +	ret = reset_control_deassert(res->rst);
>> +	if (ret) {
>> +		dev_err(dev, "reset deassert failed (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	usleep_range(2000, 2500);
>> +
>> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(res->clks), res->clks);
>> +	if (ret)
>> +		goto err_reset;
>> +
>> +	return 0;
>> +
>> +err_reset:
>> +	reset_control_assert(res->rst);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
>> +{
>> +	struct dw_pcie *pci = pcie->pci;
>> +	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +	u32 val;
>> +	int i;
>> +
>> +	writel(SLV_ADDR_SPACE_SZ,
>> +		pcie->parf + PCIE20_v3_PARF_SLV_ADDR_SPACE_SIZE);
>> +
>> +	val = readl(pcie->parf + PCIE20_PARF_PHY_CTRL);
>> +	val &= ~BIT(0);
>> +	writel(val, pcie->parf + PCIE20_PARF_PHY_CTRL);
>> +
>> +	writel(0, pcie->parf + PCIE20_PARF_DBI_BASE_ADDR);
>> +
>> +	writel(DEVICE_TYPE_RC, pcie->parf + PCIE20_PARF_DEVICE_TYPE);
>> +	writel(BYPASS | MSTR_AXI_CLK_EN | AHB_CLK_EN,
>> +		pcie->parf + PCIE20_PARF_MHI_CLOCK_RESET_CTRL);
>> +	writel(GEN3_RELATED_OFF_RXEQ_RGRDLESS_RXTS
>> +		| GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL,
>> +		pci->dbi_base + GEN3_RELATED_OFF);
>> +
>> +	writel(MST_WAKEUP_EN | SLV_WAKEUP_EN | MSTR_ACLK_CGC_DIS
>> +		| SLV_ACLK_CGC_DIS | CORE_CLK_CGC_DIS |
>> +		AUX_PWR_DET | L23_CLK_RMV_DIS | L1_CLK_RMV_DIS,
>> +		pcie->parf + PCIE20_PARF_SYS_CTRL);
>> +
>> +	writel(0, pcie->parf + PCIE20_PARF_Q2A_FLUSH);
>> +
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +	writel(PCIE_CAP_LINK1_VAL, pci->dbi_base + offset + PCI_EXP_SLTCAP);
>
> Is "PCIE_CAP_LINK1_VAL" misnamed?  If it's being written to
> PCI_EXP_SLTCAP, seems like it should be named something about a
> *slot*, not a *link*.
>
> Or is this an error and it should this be written to PCI_EXP_LNKCAP
> instead?

As above, I don't know. I can only mention that the exact same
assignment is currently also in qcom_pcie_init_2_3_3().

> Could PCIE_CAP_LINK1_VAL be defined in terms of PCI_EXP_SLTCAP_* or
> PCI_EXP_LNKCAP_*?

It surely can. Whether it makes sense I can't tell.

>> +	/* Configure PCIe link capabilities for ASPM */
>> +	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
>> +	val &= ~PCI_EXP_LNKCAP_ASPMS;
>> +	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);
>
> Thanks for using the standard PCI_EXP_LNKCAP and similar #defines.
> Does this mean you don't advertise any ASPM support on this platform?
> If so, that's fine, but the comment could be more specific.
> "Configure" doesn't give any hint about *how* they are configured.

Again, the same code is in qcom_pcie_init_2_3_3(). I'll just drop the
comment in the next submission.

Thanks,
baruch

>> +	writel(PCI_EXP_DEVCTL2_COMP_TMOUT_DIS, pci->dbi_base + offset +
>> +			PCI_EXP_DEVCTL2);
>> +
>> +	for (i = 0; i < 256; i++)
>> +		writel(0x0, pcie->parf + PCIE20_PARF_BDF_TO_SID_TABLE_N
>> +				+ (4 * i));
>> +
>> +	return 0;
>> +}
>> +
>>  static int qcom_pcie_link_up(struct dw_pcie *pci)
>>  {
>>  	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> @@ -1487,6 +1610,15 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>>  	.config_sid = qcom_pcie_config_sid_sm8250,
>>  };
>>  
>> +/* Qcom IP rev.: 2.9.0  Synopsys IP rev.: 5.00a */
>> +static const struct qcom_pcie_ops ops_2_9_0 = {
>> +	.get_resources = qcom_pcie_get_resources_2_9_0,
>> +	.init = qcom_pcie_init_2_9_0,
>> +	.post_init = qcom_pcie_post_init_2_9_0,
>> +	.deinit = qcom_pcie_deinit_2_9_0,
>> +	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
>> +};
>> +
>>  static const struct qcom_pcie_cfg apq8084_cfg = {
>>  	.ops = &ops_1_0_0,
>>  };
>> @@ -1520,6 +1652,10 @@ static const struct qcom_pcie_cfg sc7280_cfg = {
>>  	.pipe_clk_need_muxing = true,
>>  };
>>  
>> +static const struct qcom_pcie_cfg ipq6018_cfg = {
>> +	.ops = &ops_2_9_0,
>> +};
>> +
>>  static const struct dw_pcie_ops dw_pcie_ops = {
>>  	.link_up = qcom_pcie_link_up,
>>  	.start_link = qcom_pcie_start_link,
>> @@ -1629,6 +1765,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>>  	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
>>  	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
>>  	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
>> +	{ .compatible = "qcom,pcie-ipq6018", .data = &ipq6018_cfg },
>>  	{ }
>>  };
>>  
>> -- 
>> 2.34.1

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
