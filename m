Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9E35F3083
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Oct 2022 14:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJCMwd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Oct 2022 08:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbiJCMwb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Oct 2022 08:52:31 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFED3ECF9;
        Mon,  3 Oct 2022 05:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwGVJrNd0dQDMOzVflwyqDPd+1OPieg1Th2JwTUk55oUsZgh2AlL2W6UwzaR9OQpmeMi9SKzMSKFWoR1kQl3brJtzbkAlVVC6iJgoFI8xDnC4/WUXlt1A6l948+uFnoUMw3uJz6pSm04oFKDPQs8Iw0hfdXqqRTsAWlAB5iFkVQ9j3ykkGAcCNIyBPEiJJKzbmq2oMjXwZG5zT18sAPSoh23wEWYK0boySmHDiAtreUL8Ofa0N2jCnMuvOtk3W6TDg1MRkxCWTOzcmnF26agcxGAfTf3e+8qtGLr0Ikz+F56q43xppyKu9xWVkpIBTTX0RgW28MZIFDcZmQUDhZnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi9l05DVxrWtJUTzTRk8G7TW3UvBEWLRLG5cWI29BiA=;
 b=UomCQVt9TuDMZS4Mltga56eCnNTFum90QtupHfHD0CW89imedyUBaKEHu8UOdYicmQtiSy5+vPen6P1FbbWHJOhWIU5ZReCSb35kK6c8WrQCAj1OmeGzfars9pT6G2N+PNQUQhZQPteb5mMIYwZ5X7BG4f5rg3X0Df0TGQHezhZYC6cmyT+vSNymF/5c07xpYLiHeXfmImSKM5lGMhEryTIOeXD6dR+inPzHJ0L2Xr64V0GTqotZ5FQyBBsD4IbXiExFwRSCMEBzK7nPvrj06ycdzUTfpk1VGZipxxIiJWPhax5Qr267zvI/apuXLc6jR5NlHi+YFigsbJcPIFHPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi9l05DVxrWtJUTzTRk8G7TW3UvBEWLRLG5cWI29BiA=;
 b=uarMBPdGtUv/78OBNxity1FYMBzfBUfcXJBT34CjEidTJA2/+ALgVcQAO9cFdk9u6d/eM6cn6i4++p9JapxxebGyAGSOXucVQsoidqqhdZkUeub3DjOqNn5is1AnE34nWxpY44qzVuVJkUvHI6TokZuayLGylhxanQFnV57yh70U2rvlR5IqDaRrniSSEHJmhj7Ay0GFydWNF3Nl4pos0Rvtdf9xZjHGyrNuoIiXG+lpn1x4snQo8MBaT+3oal6WoIn5fsEh9WFXX6FaGS8slM9hGpgFC9ArqWmZivSGTJtrmS4TQ98IgP16i0R18LcTKjAC0bASWkXsBa40voVt5w==
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Mon, 3 Oct
 2022 12:51:58 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::63) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.26 via Frontend
 Transport; Mon, 3 Oct 2022 12:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Mon, 3 Oct 2022 12:51:58 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 3 Oct 2022
 05:51:49 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 3 Oct 2022
 05:51:48 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport; Mon, 3 Oct
 2022 05:51:47 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] dt-bindings: tegra: Update headers for Tegra234
Date:   Mon, 3 Oct 2022 13:51:41 +0100
Message-ID: <20221003125141.123759-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 010d483d-a348-460b-d130-08daa53e0f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGGeu+evYkW8ngaF40vOWRaA2lEpi5JjNhN2Q6C5oJO7VZqKRslGWBrHdzFR5H1mbJ/8vk5erSyMF0/tW7H+7ToUKg7Db+m9dmWRaUU+6hl2bddPFsFlKCa3+cx7Gl8WW9MXBf6kvDNyuZ4rCYGfyxi3WPom7cJqSgJP7smZwl8ouye03OYGF9D887bOPCu5vYO+nI9G73DeERzoz+LvAdcUtkOR0tKFtctloza6rF6ubH+U06dbwOj8+7WxG8jw6J+0nrPVT+dFkWVrw/m2kDlVnKzhDFFQaaLGTYkNwy5AYtwde/bXS+XZLJtcVu1Sy6EAVLStr+/GTUDBUWr4St1uRa2AmIG7cCwlXaymiz947wYe9Obs3ZnFrOhebZctuqyzb//Ieycq2TsaYY+v3MkWKnvqMORkHYn1d58RDGdGHM2y6Fld1yNn0ZZe8relnjd12cyz2PAPTt6Qbh56nd5MKFXaNqbvs2i/skxzrmjkVaD+KvtoNbOsq78B6LwnIbS2nm0E9Yg/AwJIFOiL2rWdVfg42eHfsWJbmBwjpaH6pfIplVmtMLImgMn99y/0BHGAE9Tffe37ldCuER3LJ+EB2Lu1spOnGJaYRmcYIirGuVktksmDyuWoPTdnvsO5oQTHffn/4LOQQOoVRSQ6wcAzLKmSEm2Ds/Eik4V+zG9w4cpTTBm1sZslwD6wMRZmTNkW9PgbH6RpgXxCV1KqF8FJ51geGhJ95veEEW1qANV14uFRPgQaja7rNMzJeDNvoIbebP/Y+/REToNWSlt8Xg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(1076003)(2906002)(70586007)(5660300002)(15650500001)(7636003)(336012)(316002)(107886003)(54906003)(478600001)(82310400005)(110136005)(186003)(26005)(2616005)(82740400003)(36756003)(356005)(41300700001)(47076005)(40460700003)(36860700001)(30864003)(86362001)(40480700001)(426003)(6666004)(4326008)(8676002)(8936002)(83380400001)(70206006)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 12:51:58.5662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010d483d-a348-460b-d130-08daa53e0f2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Update the device-tree clock, memory, power and reset headers for
Tegra234 by adding the definitions for all the various devices.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/dt-bindings/clock/tegra234-clock.h    | 639 +++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h      | 440 +++++++++++-
 .../dt-bindings/power/tegra234-powergate.h    |  15 +
 include/dt-bindings/reset/tegra234-reset.h    | 111 ++-
 4 files changed, 1175 insertions(+), 30 deletions(-)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index 173364a93381..c360455d02ee 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -9,6 +9,12 @@
  * @defgroup bpmp_clock_ids Clock ID's
  * @{
  */
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_ACTMON */
+#define TEGRA234_CLK_ACTMON			1U
+/** @brief output of gate CLK_ENB_ADSP */
+#define TEGRA234_CLK_ADSP			2U
+/** @brief output of gate CLK_ENB_ADSPNEON */
+#define TEGRA234_CLK_ADSPNEON			3U
 /** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_AHUB */
 #define TEGRA234_CLK_AHUB			4U
 /** @brief output of gate CLK_ENB_APB2APE */
@@ -17,6 +23,18 @@
 #define TEGRA234_CLK_APE			6U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_AUD_MCLK */
 #define TEGRA234_CLK_AUD_MCLK			7U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_AXI_CBB */
+#define TEGRA234_CLK_AXI_CBB			8U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_CAN1 */
+#define TEGRA234_CLK_CAN1			9U
+/** @brief output of gate CLK_ENB_CAN1_HOST */
+#define TEGRA234_CLK_CAN1_HOST			10U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_CAN2 */
+#define TEGRA234_CLK_CAN2			11U
+/** @brief output of gate CLK_ENB_CAN2_HOST */
+#define TEGRA234_CLK_CAN2_HOST			12U
+/** @brief output of divider CLK_RST_CONTROLLER_CLK_M_DIVIDE */
+#define TEGRA234_CLK_CLK_M			14U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DMIC1 */
 #define TEGRA234_CLK_DMIC1			15U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DMIC2 */
@@ -25,6 +43,28 @@
 #define TEGRA234_CLK_DMIC3			17U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DMIC4 */
 #define TEGRA234_CLK_DMIC4			18U
+/** @brief output of gate CLK_ENB_DPAUX */
+#define TEGRA234_CLK_DPAUX			19U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVJPG1 */
+#define TEGRA234_CLK_NVJPG1			20U
+/**
+ * @brief output of mux controlled by CLK_RST_CONTROLLER_ACLK_BURST_POLICY
+ * divided by the divider controlled by ACLK_CLK_DIVISOR in
+ * CLK_RST_CONTROLLER_SUPER_ACLK_DIVIDER
+ */
+#define TEGRA234_CLK_ACLK			21U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_MSS_ENCRYPT switch divider output */
+#define TEGRA234_CLK_MSS_ENCRYPT		22U
+/** @brief clock recovered from EAVB input */
+#define TEGRA234_CLK_EQOS_RX_INPUT		23U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_AON_APB switch divider output */
+#define TEGRA234_CLK_AON_APB			25U
+/** @brief CLK_RST_CONTROLLER_AON_NIC_RATE divider output */
+#define TEGRA234_CLK_AON_NIC			26U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_AON_CPU_NIC switch divider output */
+#define TEGRA234_CLK_AON_CPU_NIC		27U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLA1_BASE for use by audio clocks */
+#define TEGRA234_CLK_PLLA1			28U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DSPK1 */
 #define TEGRA234_CLK_DSPK1			29U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DSPK2 */
@@ -38,10 +78,33 @@
  * throughput and memory controller power.
  */
 #define TEGRA234_CLK_EMC			31U
-/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_HOST1X */
-#define TEGRA234_CLK_HOST1X                     46U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_EQOS_AXI_CLK_0 divider gated output */
+#define TEGRA234_CLK_EQOS_AXI			32U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_EQOS_PTP_REF_CLK_0 divider gated output */
+#define TEGRA234_CLK_EQOS_PTP_REF		33U
+/** @brief output of gate CLK_ENB_EQOS_RX */
+#define TEGRA234_CLK_EQOS_RX			34U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_EQOS_TX_CLK divider gated output */
+#define TEGRA234_CLK_EQOS_TX			35U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EXTPERIPH1 */
+#define TEGRA234_CLK_EXTPERIPH1			36U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EXTPERIPH2 */
+#define TEGRA234_CLK_EXTPERIPH2			37U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EXTPERIPH3 */
+#define TEGRA234_CLK_EXTPERIPH3			38U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EXTPERIPH4 */
+#define TEGRA234_CLK_EXTPERIPH4			39U
 /** @brief output of gate CLK_ENB_FUSE */
 #define TEGRA234_CLK_FUSE			40U
+/** @brief output of GPU GPC0 clkGen (in 1x mode same rate as GPC0 MUX2 out) */
+#define TEGRA234_CLK_GPC0CLK			41U
+/** @brief TODO */
+#define TEGRA234_CLK_GPU_PWR			42U
+/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_HDA2CODEC_2X */
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_HOST1X */
+#define TEGRA234_CLK_HOST1X			46U
+/** @brief xusb_hs_hsicp_clk */
+#define TEGRA234_CLK_XUSB_HS_HSICP		47U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
 #define TEGRA234_CLK_I2C1			48U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C2 */
@@ -82,10 +145,66 @@
 #define TEGRA234_CLK_I2S6			66U
 /** @brief clock recovered from I2S6 input */
 #define TEGRA234_CLK_I2S6_SYNC_INPUT		67U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_ISP */
+#define TEGRA234_CLK_ISP			69U
+/** @brief Monitored branch of EQOS_RX clock */
+#define TEGRA234_CLK_EQOS_RX_M			70U
+/** @brief CLK_RST_CONTROLLER_MAUDCLK_OUT_SWITCH_DIVIDER switch divider output (maudclk) */
+#define TEGRA234_CLK_MAUD			71U
+/** @brief output of gate CLK_ENB_MIPI_CAL */
+#define TEGRA234_CLK_MIPI_CAL			72U
+/** @brief output of the divider CLK_RST_CONTROLLER_CLK_SOURCE_MPHY_CORE_PLL_FIXED */
+#define TEGRA234_CLK_MPHY_CORE_PLL_FIXED	73U
+/** @brief output of gate CLK_ENB_MPHY_L0_RX_ANA */
+#define TEGRA234_CLK_MPHY_L0_RX_ANA		74U
+/** @brief output of gate CLK_ENB_MPHY_L0_RX_LS_BIT */
+#define TEGRA234_CLK_MPHY_L0_RX_LS_BIT		75U
+/** @brief output of gate CLK_ENB_MPHY_L0_RX_SYMB */
+#define TEGRA234_CLK_MPHY_L0_RX_SYMB		76U
+/** @brief output of gate CLK_ENB_MPHY_L0_TX_LS_3XBIT */
+#define TEGRA234_CLK_MPHY_L0_TX_LS_3XBIT	77U
+/** @brief output of gate CLK_ENB_MPHY_L0_TX_SYMB */
+#define TEGRA234_CLK_MPHY_L0_TX_SYMB		78U
+/** @brief output of gate CLK_ENB_MPHY_L1_RX_ANA */
+#define TEGRA234_CLK_MPHY_L1_RX_ANA		79U
+/** @brief output of the divider CLK_RST_CONTROLLER_CLK_SOURCE_MPHY_TX_1MHZ_REF */
+#define TEGRA234_CLK_MPHY_TX_1MHZ_REF		80U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVCSI */
+#define TEGRA234_CLK_NVCSI			81U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVCSILP */
+#define TEGRA234_CLK_NVCSILP			82U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVDEC */
+#define TEGRA234_CLK_NVDEC			83U
+/** @brief CLK_RST_CONTROLLER_HUBCLK_OUT_SWITCH_DIVIDER switch divider output (hubclk) */
+#define TEGRA234_CLK_HUB			84U
+/** @brief CLK_RST_CONTROLLER_DISPCLK_SWITCH_DIVIDER switch divider output (dispclk) */
+#define TEGRA234_CLK_DISP			85U
+/** @brief RG_CLK_CTRL__0_DIV divider output (nvdisplay_p0_clk) */
+#define TEGRA234_CLK_NVDISPLAY_P0		86U
+/** @brief RG_CLK_CTRL__1_DIV divider output (nvdisplay_p1_clk) */
+#define TEGRA234_CLK_NVDISPLAY_P1		87U
+/** @brief DSC_CLK (DISPCLK ÷ 3) */
+#define TEGRA234_CLK_DSC			88U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVENC */
+#define TEGRA234_CLK_NVENC			89U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_NVJPG */
+#define TEGRA234_CLK_NVJPG			90U
+/** @brief input from Tegra's XTAL_IN */
+#define TEGRA234_CLK_OSC			91U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_AON_TOUCH switch divider output */
+#define TEGRA234_CLK_AON_TOUCH			92U
 /** PLL controlled by CLK_RST_CONTROLLER_PLLA_BASE for use by audio clocks */
 #define TEGRA234_CLK_PLLA			93U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLAON_BASE for use by IP blocks in the AON domain */
+#define TEGRA234_CLK_PLLAON			94U
+/** Fixed 100MHz PLL for PCIe, SATA and superspeed USB */
+#define TEGRA234_CLK_PLLE			100U
+/** @brief PLLP vco output */
+#define TEGRA234_CLK_PLLP			101U
 /** @brief PLLP clk output */
 #define TEGRA234_CLK_PLLP_OUT0			102U
+/** Fixed frequency 960MHz PLL for USB and EAVB */
+#define TEGRA234_CLK_UTMIP_PLL			103U
 /** @brief output of the divider CLK_RST_CONTROLLER_PLLA_OUT */
 #define TEGRA234_CLK_PLLA_OUT0			104U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM1 */
@@ -104,8 +223,50 @@
 #define TEGRA234_CLK_PWM7			111U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PWM8 */
 #define TEGRA234_CLK_PWM8			112U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_RCE_CPU_NIC output */
+#define TEGRA234_CLK_RCE_CPU_NIC		113U
+/** @brief CLK_RST_CONTROLLER_RCE_NIC_RATE divider output */
+#define TEGRA234_CLK_RCE_NIC			114U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_AON_I2C_SLOW switch divider output */
+#define TEGRA234_CLK_AON_I2C_SLOW		117U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SCE_CPU_NIC */
+#define TEGRA234_CLK_SCE_CPU_NIC		118U
+/** @brief output of divider CLK_RST_CONTROLLER_SCE_NIC_RATE */
+#define TEGRA234_CLK_SCE_NIC			119U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC1 */
+#define TEGRA234_CLK_SDMMC1			120U
+/** @brief Logical clk for setting the UPHY PLL3 rate */
+#define TEGRA234_CLK_UPHY_PLL3			121U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC4 */
 #define TEGRA234_CLK_SDMMC4			123U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SE switch divider gated output */
+#define TEGRA234_CLK_SE				124U
+/** @brief VPLL select for sor0_ref clk driven by disp_2clk_sor0_head_sel signal */
+#define TEGRA234_CLK_SOR0_PLL_REF		125U
+/** @brief Output of mux controlled by disp_2clk_sor0_pll_ref_clk_safe signal (sor0_ref_clk) */
+#define TEGRA234_CLK_SOR0_REF			126U
+/** @brief VPLL select for sor1_ref clk driven by disp_2clk_sor0_head_sel signal */
+#define TEGRA234_CLK_SOR1_PLL_REF		127U
+/** @brief SOR_PLL_REF_CLK_CTRL__0_DIV divider output */
+#define TEGRA234_CLK_PRE_SOR0_REF		128U
+/** @brief Output of mux controlled by disp_2clk_sor1_pll_ref_clk_safe signal (sor1_ref_clk) */
+#define TEGRA234_CLK_SOR1_REF			129U
+/** @brief SOR_PLL_REF_CLK_CTRL__1_DIV divider output */
+#define TEGRA234_CLK_PRE_SOR1_REF		130U
+/** @brief output of gate CLK_ENB_SOR_SAFE */
+#define TEGRA234_CLK_SOR_SAFE			131U
+/** @brief SOR_CLK_CTRL__0_DIV divider output */
+#define TEGRA234_CLK_SOR0_DIV			132U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DMIC5 */
+#define TEGRA234_CLK_DMIC5			134U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SPI1 */
+#define TEGRA234_CLK_SPI1			135U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SPI2 */
+#define TEGRA234_CLK_SPI2			136U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SPI3 */
+#define TEGRA234_CLK_SPI3			137U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C_SLOW */
+#define TEGRA234_CLK_I2C_SLOW			138U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_DMIC1 */
 #define TEGRA234_CLK_SYNC_DMIC1			139U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_DMIC2 */
@@ -130,28 +291,132 @@
 #define TEGRA234_CLK_SYNC_I2S5			149U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_I2S6 */
 #define TEGRA234_CLK_SYNC_I2S6			150U
+/** @brief controls MPHY_FORCE_LS_MODE upon enable & disable */
+#define TEGRA234_CLK_MPHY_FORCE_LS_MODE		151U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_TACH0 */
+#define TEGRA234_CLK_TACH0			152U
+/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_TSEC */
+#define TEGRA234_CLK_TSEC			153U
+/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_PKA */
+#define TEGRA234_CLK_TSEC_PKA			154U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTA */
 #define TEGRA234_CLK_UARTA			155U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTB */
+#define TEGRA234_CLK_UARTB			156U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTC */
+#define TEGRA234_CLK_UARTC			157U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTD */
+#define TEGRA234_CLK_UARTD			158U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTE */
+#define TEGRA234_CLK_UARTE			159U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UARTF */
+#define TEGRA234_CLK_UARTF			160U
 /** @brief output of gate CLK_ENB_PEX1_CORE_6 */
 #define TEGRA234_CLK_PEX1_C6_CORE		161U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UART_FST_MIPI_CAL */
+#define TEGRA234_CLK_UART_FST_MIPI_CAL		162U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UFSDEV_REF */
+#define TEGRA234_CLK_UFSDEV_REF			163U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_UFSHC_CG_SYS */
+#define TEGRA234_CLK_UFSHC			164U
+/** @brief output of gate CLK_ENB_USB2_TRK */
+#define TEGRA234_CLK_USB2_TRK			165U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_VI */
+#define TEGRA234_CLK_VI				166U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_VIC */
-#define TEGRA234_CLK_VIC                        167U
+#define TEGRA234_CLK_VIC			167U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_CSITE switch divider output */
+#define TEGRA234_CLK_CSITE			168U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_IST switch divider output */
+#define TEGRA234_CLK_IST			169U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_IST_JTAG_REG_CLK_SEL */
+#define TEGRA234_CLK_JTAG_INTFC_PRE_CG		170U
 /** @brief output of gate CLK_ENB_PEX2_CORE_7 */
 #define TEGRA234_CLK_PEX2_C7_CORE		171U
 /** @brief output of gate CLK_ENB_PEX2_CORE_8 */
 #define TEGRA234_CLK_PEX2_C8_CORE		172U
 /** @brief output of gate CLK_ENB_PEX2_CORE_9 */
 #define TEGRA234_CLK_PEX2_C9_CORE		173U
+/** @brief dla0_falcon_clk */
+#define TEGRA234_CLK_DLA0_FALCON		174U
+/** @brief dla0_core_clk */
+#define TEGRA234_CLK_DLA0_CORE			175U
+/** @brief dla1_falcon_clk */
+#define TEGRA234_CLK_DLA1_FALCON		176U
+/** @brief dla1_core_clk */
+#define TEGRA234_CLK_DLA1_CORE			177U
+/** @brief Output of mux controlled by disp_2clk_sor0_clk_safe signal (sor0_clk) */
+#define TEGRA234_CLK_SOR0			178U
+/** @brief Output of mux controlled by disp_2clk_sor1_clk_safe signal (sor1_clk) */
+#define TEGRA234_CLK_SOR1			179U
+/** @brief DP macro feedback clock (same as LINKA_SYM CLKOUT) */
+#define TEGRA234_CLK_SOR_PAD_INPUT		180U
+/** @brief Output of mux controlled by disp_2clk_h0_dsi_sel signal in sf0_clk path */
+#define TEGRA234_CLK_PRE_SF0			181U
+/** @brief Output of mux controlled by disp_2clk_sf0_clk_safe signal (sf0_clk) */
+#define TEGRA234_CLK_SF0			182U
+/** @brief Output of mux controlled by disp_2clk_sf1_clk_safe signal (sf1_clk) */
+#define TEGRA234_CLK_SF1			183U
+/** @brief CLKOUT_AB output from DSI BRICK A (dsi_clkout_ab) */
+#define TEGRA234_CLK_DSI_PAD_INPUT		184U
 /** @brief output of gate CLK_ENB_PEX2_CORE_10 */
 #define TEGRA234_CLK_PEX2_C10_CORE		187U
-/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_QSPI0 switch divider output */
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_UARTI switch divider output (uarti_r_clk) */
+#define TEGRA234_CLK_UARTI			188U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_UARTJ switch divider output (uartj_r_clk) */
+#define TEGRA234_CLK_UARTJ			189U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_UARTH switch divider output */
+#define TEGRA234_CLK_UARTH			190U
+/** @brief ungated version of fuse clk */
+#define TEGRA234_CLK_FUSE_SERIAL		191U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_QSPI0 switch divider output (qspi0_2x_pm_clk) */
 #define TEGRA234_CLK_QSPI0_2X_PM		192U
-/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_QSPI1 switch divider output */
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_QSPI1 switch divider output (qspi1_2x_pm_clk) */
 #define TEGRA234_CLK_QSPI1_2X_PM		193U
-/** @brief output of the divider QSPI_CLK_DIV2_SEL in CLK_RST_CONTROLLER_CLK_SOURCE_QSPI0 */
+/** @brief output of the divider QSPI_CLK_DIV2_SEL in CLK_RST_CONTROLLER_CLK_SOURCE_QSPI0 (qspi0_pm_clk) */
 #define TEGRA234_CLK_QSPI0_PM			194U
-/** @brief output of the divider QSPI_CLK_DIV2_SEL in CLK_RST_CONTROLLER_CLK_SOURCE_QSPI1 */
+/** @brief output of the divider QSPI_CLK_DIV2_SEL in CLK_RST_CONTROLLER_CLK_SOURCE_QSPI1 (qspi1_pm_clk) */
 #define TEGRA234_CLK_QSPI1_PM			195U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_VI_CONST switch divider output */
+#define TEGRA234_CLK_VI_CONST			196U
+/** @brief NAFLL clock source for BPMP */
+#define TEGRA234_CLK_NAFLL_BPMP			197U
+/** @brief NAFLL clock source for SCE */
+#define TEGRA234_CLK_NAFLL_SCE			198U
+/** @brief NAFLL clock source for NVDEC */
+#define TEGRA234_CLK_NAFLL_NVDEC		199U
+/** @brief NAFLL clock source for NVJPG */
+#define TEGRA234_CLK_NAFLL_NVJPG		200U
+/** @brief NAFLL clock source for TSEC */
+#define TEGRA234_CLK_NAFLL_TSEC			201U
+/** @brief NAFLL clock source for VI */
+#define TEGRA234_CLK_NAFLL_VI			203U
+/** @brief NAFLL clock source for SE */
+#define TEGRA234_CLK_NAFLL_SE			204U
+/** @brief NAFLL clock source for NVENC */
+#define TEGRA234_CLK_NAFLL_NVENC		205U
+/** @brief NAFLL clock source for ISP */
+#define TEGRA234_CLK_NAFLL_ISP			206U
+/** @brief NAFLL clock source for VIC */
+#define TEGRA234_CLK_NAFLL_VIC			207U
+/** @brief NAFLL clock source for AXICBB */
+#define TEGRA234_CLK_NAFLL_AXICBB		209U
+/** @brief NAFLL clock source for NVJPG1 */
+#define TEGRA234_CLK_NAFLL_NVJPG1		210U
+/** @brief NAFLL clock source for PVA core */
+#define TEGRA234_CLK_NAFLL_PVA0_CORE		211U
+/** @brief NAFLL clock source for PVA VPS */
+#define TEGRA234_CLK_NAFLL_PVA0_VPS		212U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_DBGAPB_0 switch divider output (dbgapb_clk) */
+#define TEGRA234_CLK_DBGAPB			213U
+/** @brief NAFLL clock source for RCE */
+#define TEGRA234_CLK_NAFLL_RCE			214U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_LA switch divider output (la_r_clk) */
+#define TEGRA234_CLK_LA				215U
+/** @brief output of the divider CLK_RST_CONTROLLER_PLLP_OUTD */
+#define TEGRA234_CLK_PLLP_OUT_JTAG		216U
+/** @brief AXI_CBB branch sharing gate control with SDMMC4 */
+#define TEGRA234_CLK_SDMMC4_AXICIF		217U
 /** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SDMMC_LEGACY_TM switch divider output */
 #define TEGRA234_CLK_SDMMC_LEGACY_TM		219U
 /** @brief output of gate CLK_ENB_PEX0_CORE_0 */
@@ -166,8 +431,42 @@
 #define TEGRA234_CLK_PEX0_C4_CORE		224U
 /** @brief output of gate CLK_ENB_PEX1_CORE_5 */
 #define TEGRA234_CLK_PEX1_C5_CORE		225U
+/** @brief Monitored branch of PEX0_C0_CORE clock */
+#define TEGRA234_CLK_PEX0_C0_CORE_M		229U
+/** @brief Monitored branch of PEX0_C1_CORE clock */
+#define TEGRA234_CLK_PEX0_C1_CORE_M		230U
+/** @brief Monitored branch of PEX0_C2_CORE clock */
+#define TEGRA234_CLK_PEX0_C2_CORE_M		231U
+/** @brief Monitored branch of PEX0_C3_CORE clock */
+#define TEGRA234_CLK_PEX0_C3_CORE_M		232U
+/** @brief Monitored branch of PEX0_C4_CORE clock */
+#define TEGRA234_CLK_PEX0_C4_CORE_M		233U
+/** @brief Monitored branch of PEX1_C5_CORE clock */
+#define TEGRA234_CLK_PEX1_C5_CORE_M		234U
+/** @brief Monitored branch of PEX1_C6_CORE clock */
+#define TEGRA234_CLK_PEX1_C6_CORE_M		235U
+/** @brief output of GPU GPC1 clkGen (in 1x mode same rate as GPC1 MUX2 out) */
+#define TEGRA234_CLK_GPC1CLK			236U
 /** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC4_BASE */
 #define TEGRA234_CLK_PLLC4			237U
+/** @brief PLLC4 VCO followed by DIV3 path */
+#define TEGRA234_CLK_PLLC4_OUT1			239U
+/** @brief PLLC4 VCO followed by DIV5 path */
+#define TEGRA234_CLK_PLLC4_OUT2			240U
+/** @brief output of the mux controlled by PLLC4_CLK_SEL */
+#define TEGRA234_CLK_PLLC4_MUXED		241U
+/** @brief PLLC4 VCO followed by DIV2 path */
+#define TEGRA234_CLK_PLLC4_VCO_DIV2		242U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLNVHS_BASE */
+#define TEGRA234_CLK_PLLNVHS			243U
+/** @brief Monitored branch of PEX2_C7_CORE clock */
+#define TEGRA234_CLK_PEX2_C7_CORE_M		244U
+/** @brief Monitored branch of PEX2_C8_CORE clock */
+#define TEGRA234_CLK_PEX2_C8_CORE_M		245U
+/** @brief Monitored branch of PEX2_C9_CORE clock */
+#define TEGRA234_CLK_PEX2_C9_CORE_M		246U
+/** @brief Monitored branch of PEX2_C10_CORE clock */
+#define TEGRA234_CLK_PEX2_C10_CORE_M		247U
 /** @brief RX clock recovered from MGBE0 lane input */
 #define TEGRA234_CLK_MGBE0_RX_INPUT		248U
 /** @brief RX clock recovered from MGBE1 lane input */
@@ -176,8 +475,185 @@
 #define TEGRA234_CLK_MGBE2_RX_INPUT		250U
 /** @brief RX clock recovered from MGBE3 lane input */
 #define TEGRA234_CLK_MGBE3_RX_INPUT		251U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PEX_SATA_USB_RX_BYP switch divider output */
+#define TEGRA234_CLK_PEX_SATA_USB_RX_BYP	254U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PEX_USB_PAD_PLL0_MGMT switch divider output */
+#define TEGRA234_CLK_PEX_USB_PAD_PLL0_MGMT	255U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PEX_USB_PAD_PLL1_MGMT switch divider output */
+#define TEGRA234_CLK_PEX_USB_PAD_PLL1_MGMT	256U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PEX_USB_PAD_PLL2_MGMT switch divider output */
+#define TEGRA234_CLK_PEX_USB_PAD_PLL2_MGMT	257U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PEX_USB_PAD_PLL3_MGMT switch divider output */
+#define TEGRA234_CLK_PEX_USB_PAD_PLL3_MGMT	258U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_NVHS_RX_BYP switch divider output */
+#define TEGRA234_CLK_NVHS_RX_BYP_REF		263U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_NVHS_PLL0_MGMT switch divider output */
+#define TEGRA234_CLK_NVHS_PLL0_MGMT		264U
+/** @brief xusb_core_dev_clk */
+#define TEGRA234_CLK_XUSB_CORE_DEV		265U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_XUSB_CORE_HOST switch divider output  */
+#define TEGRA234_CLK_XUSB_CORE_MUX		266U
+/** @brief xusb_core_host_clk */
+#define TEGRA234_CLK_XUSB_CORE_HOST		267U
+/** @brief xusb_core_superspeed_clk */
+#define TEGRA234_CLK_XUSB_CORE_SS		268U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_XUSB_FALCON switch divider output */
+#define TEGRA234_CLK_XUSB_FALCON		269U
+/** @brief xusb_falcon_host_clk */
+#define TEGRA234_CLK_XUSB_FALCON_HOST		270U
+/** @brief xusb_falcon_superspeed_clk */
+#define TEGRA234_CLK_XUSB_FALCON_SS		271U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_XUSB_FS switch divider output */
+#define TEGRA234_CLK_XUSB_FS			272U
+/** @brief xusb_fs_host_clk */
+#define TEGRA234_CLK_XUSB_FS_HOST		273U
+/** @brief xusb_fs_dev_clk */
+#define TEGRA234_CLK_XUSB_FS_DEV		274U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_XUSB_SS switch divider output */
+#define TEGRA234_CLK_XUSB_SS			275U
+/** @brief xusb_ss_dev_clk */
+#define TEGRA234_CLK_XUSB_SS_DEV		276U
+/** @brief xusb_ss_superspeed_clk */
+#define TEGRA234_CLK_XUSB_SS_SUPERSPEED		277U
+/** @brief NAFLL clock source for CPU cluster 0 */
+#define TEGRA234_CLK_NAFLL_CLUSTER0		280U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER0_CORE	280U
+/** @brief NAFLL clock source for CPU cluster 1 */
+#define TEGRA234_CLK_NAFLL_CLUSTER1		281U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER1_CORE	281U
+/** @brief NAFLL clock source for CPU cluster 2 */
+#define TEGRA234_CLK_NAFLL_CLUSTER2		282U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER2_CORE	282U
+/** @brief CLK_RST_CONTROLLER_CAN1_CORE_RATE divider output */
+#define TEGRA234_CLK_CAN1_CORE			284U
+/** @brief CLK_RST_CONTROLLER_CAN2_CORE_RATE divider outputt */
+#define TEGRA234_CLK_CAN2_CORE			285U
+/** @brief CLK_RST_CONTROLLER_PLLA1_OUT1 switch divider output */
+#define TEGRA234_CLK_PLLA1_OUT1			286U
+/** @brief NVHS PLL hardware power sequencer (overrides 'manual' programming of PLL) */
+#define TEGRA234_CLK_PLLNVHS_HPS		287U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLREFE_BASE */
+#define TEGRA234_CLK_PLLREFE_VCOOUT		288U
 /** @brief 32K input clock provided by PMIC */
 #define TEGRA234_CLK_CLK_32K			289U
+/** @brief Fixed 48MHz clock divided down from utmipll */
+#define TEGRA234_CLK_UTMIPLL_CLKOUT48		291U
+/** @brief Fixed 480MHz clock divided down from utmipll */
+#define TEGRA234_CLK_UTMIPLL_CLKOUT480		292U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLNVCSI_BASE  */
+#define TEGRA234_CLK_PLLNVCSI			294U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PVA0_CPU_AXI switch divider output */
+#define TEGRA234_CLK_PVA0_CPU_AXI		295U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_PVA0_VPS switch divider output */
+#define TEGRA234_CLK_PVA0_VPS			297U
+/** @brief DLA0_CORE_NAFLL */
+#define TEGRA234_CLK_NAFLL_DLA0_CORE		299U
+/** @brief DLA0_FALCON_NAFLL */
+#define TEGRA234_CLK_NAFLL_DLA0_FALCON		300U
+/** @brief DLA1_CORE_NAFLL */
+#define TEGRA234_CLK_NAFLL_DLA1_CORE		301U
+/** @brief DLA1_FALCON_NAFLL */
+#define TEGRA234_CLK_NAFLL_DLA1_FALCON		302U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_AON_UART_FST_MIPI_CAL */
+#define TEGRA234_CLK_AON_UART_FST_MIPI_CAL	303U
+/** @brief GPU system clock */
+#define TEGRA234_CLK_GPUSYS			304U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C5 */
+#define TEGRA234_CLK_I2C5			305U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SE switch divider free running clk */
+#define TEGRA234_CLK_FR_SE			306U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_BPMP_CPU_NIC switch divider output */
+#define TEGRA234_CLK_BPMP_CPU_NIC		307U
+/** @brief output of gate CLK_ENB_BPMP_CPU */
+#define TEGRA234_CLK_BPMP_CPU			308U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_TSC switch divider output */
+#define TEGRA234_CLK_TSC			309U
+/** @brief output of mem pll A sync mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EMC */
+#define TEGRA234_CLK_EMCSA_MPLL			310U
+/** @brief output of mem pll B sync mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EMCSB */
+#define TEGRA234_CLK_EMCSB_MPLL			311U
+/** @brief output of mem pll C sync mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EMCSC */
+#define TEGRA234_CLK_EMCSC_MPLL			312U
+/** @brief output of mem pll D sync mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_EMCSD */
+#define TEGRA234_CLK_EMCSD_MPLL			313U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC_BASE */
+#define TEGRA234_CLK_PLLC			314U
+/** @brief PLL controlled by CLK_RST_CONTROLLER_PLLC2_BASE */
+#define TEGRA234_CLK_PLLC2			315U
+/** @brief CLK_RST_CONTROLLER_TSC_HS_SUPER_CLK_DIVIDER skip divider output */
+#define TEGRA234_CLK_TSC_REF			317U
+/** @brief Dummy clock to ensure minimum SoC voltage for fuse burning */
+#define TEGRA234_CLK_FUSE_BURN			318U
+/** @brief GBE PLL */
+#define TEGRA234_CLK_PLLGBE			319U
+/** @brief GBE PLL hardware power sequencer */
+#define TEGRA234_CLK_PLLGBE_HPS			320U
+/** @brief output of EMC CDB side A fixed (DIV4)  divider */
+#define TEGRA234_CLK_EMCSA_EMC			321U
+/** @brief output of EMC CDB side B fixed (DIV4)  divider */
+#define TEGRA234_CLK_EMCSB_EMC			322U
+/** @brief output of EMC CDB side C fixed (DIV4)  divider */
+#define TEGRA234_CLK_EMCSC_EMC			323U
+/** @brief output of EMC CDB side D fixed (DIV4)  divider */
+#define TEGRA234_CLK_EMCSD_EMC			324U
+/** @brief PLLE hardware power sequencer (overrides 'manual' programming of PLL) */
+#define TEGRA234_CLK_PLLE_HPS			326U
+/** @brief CLK_ENB_PLLREFE_OUT gate output */
+#define TEGRA234_CLK_PLLREFE_VCOOUT_GATED	327U
+/** @brief TEGRA234_CLK_SOR_SAFE clk source (PLLP_OUT0 divided by 17) */
+#define TEGRA234_CLK_PLLP_DIV17			328U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SOC_THERM switch divider output */
+#define TEGRA234_CLK_SOC_THERM			329U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_TSENSE switch divider output */
+#define TEGRA234_CLK_TSENSE			330U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SEU1 switch divider free running clk */
+#define TEGRA234_CLK_FR_SEU1			331U
+/** @brief NAFLL clock source for OFA */
+#define TEGRA234_CLK_NAFLL_OFA			333U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_OFA switch divider output */
+#define TEGRA234_CLK_OFA			334U
+/** @brief NAFLL clock source for SEU1 */
+#define TEGRA234_CLK_NAFLL_SEU1			335U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_SEU1 switch divider gated output */
+#define TEGRA234_CLK_SEU1			336U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SPI4 */
+#define TEGRA234_CLK_SPI4			337U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_SPI5 */
+#define TEGRA234_CLK_SPI5			338U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_DCE_CPU_NIC */
+#define TEGRA234_CLK_DCE_CPU_NIC		339U
+/** @brief output of divider CLK_RST_CONTROLLER_DCE_NIC_RATE */
+#define TEGRA234_CLK_DCE_NIC			340U
+/** @brief NAFLL clock source for DCE */
+#define TEGRA234_CLK_NAFLL_DCE			341U
+/** @brief Monitored branch of MPHY_L0_RX_ANA clock */
+#define TEGRA234_CLK_MPHY_L0_RX_ANA_M		342U
+/** @brief Monitored branch of MPHY_L1_RX_ANA clock */
+#define TEGRA234_CLK_MPHY_L1_RX_ANA_M		343U
+/** @brief ungated version of TX symbol clock after fixed 1/2 divider */
+#define TEGRA234_CLK_MPHY_L0_TX_PRE_SYMB	344U
+/** @brief output of divider CLK_RST_CONTROLLER_CLK_SOURCE_MPHY_L0_TX_LS_SYMB */
+#define TEGRA234_CLK_MPHY_L0_TX_LS_SYMB_DIV	345U
+/** @brief output of gate CLK_ENB_MPHY_L0_TX_2X_SYMB */
+#define TEGRA234_CLK_MPHY_L0_TX_2X_SYMB		346U
+/** @brief output of SW_MPHY_L0_TX_HS_SYMB divider in CLK_RST_CONTROLLER_MPHY_L0_TX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_TX_HS_SYMB_DIV	347U
+/** @brief output of SW_MPHY_L0_TX_LS_3XBIT divider in CLK_RST_CONTROLLER_MPHY_L0_TX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_TX_LS_3XBIT_DIV	348U
+/** @brief LS/HS divider mux SW_MPHY_L0_TX_LS_HS_SEL in CLK_RST_CONTROLLER_MPHY_L0_TX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_TX_MUX_SYMB_DIV	349U
+/** @brief Monitored branch of MPHY_L0_TX_SYMB clock */
+#define TEGRA234_CLK_MPHY_L0_TX_SYMB_M		350U
+/** @brief output of divider CLK_RST_CONTROLLER_CLK_SOURCE_MPHY_L0_RX_LS_SYMB */
+#define TEGRA234_CLK_MPHY_L0_RX_LS_SYMB_DIV	351U
+/** @brief output of SW_MPHY_L0_RX_HS_SYMB divider in CLK_RST_CONTROLLER_MPHY_L0_RX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_RX_HS_SYMB_DIV	352U
+/** @brief output of SW_MPHY_L0_RX_LS_BIT divider in  CLK_RST_CONTROLLER_MPHY_L0_RX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_RX_LS_BIT_DIV	353U
+/** @brief LS/HS divider mux SW_MPHY_L0_RX_LS_HS_SEL in CLK_RST_CONTROLLER_MPHY_L0_RX_CLK_CTRL_0 */
+#define TEGRA234_CLK_MPHY_L0_RX_MUX_SYMB_DIV	354U
+/** @brief Monitored branch of MPHY_L0_RX_SYMB clock */
+#define TEGRA234_CLK_MPHY_L0_RX_SYMB_M		355U
 /** @brief Monitored branch of MBGE0 RX input clock */
 #define TEGRA234_CLK_MGBE0_RX_INPUT_M		357U
 /** @brief Monitored branch of MBGE1 RX input clock */
@@ -194,6 +670,14 @@
 #define TEGRA234_CLK_MGBE2_RX_PCS_M		363U
 /** @brief Monitored branch of MGBE3 RX PCS mux output */
 #define TEGRA234_CLK_MGBE3_RX_PCS_M		364U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_TACH1 */
+#define TEGRA234_CLK_TACH1			365U
+/** @brief GBE_UPHY_MGBES_APP_CLK switch divider gated output */
+#define TEGRA234_CLK_MGBES_APP			366U
+/** @brief Logical clk for setting GBE UPHY PLL2 TX_REF rate */
+#define TEGRA234_CLK_UPHY_GBE_PLL2_TX_REF	367U
+/** @brief Logical clk for setting GBE UPHY PLL2 XDIG rate */
+#define TEGRA234_CLK_UPHY_GBE_PLL2_XDIG		368U
 /** @brief RX PCS clock recovered from MGBE0 lane input */
 #define TEGRA234_CLK_MGBE0_RX_PCS_INPUT		369U
 /** @brief RX PCS clock recovered from MGBE1 lane input */
@@ -230,6 +714,8 @@
 #define TEGRA234_CLK_MGBE1_MAC_DIVIDER		385U
 /** @brief GBE_UPHY_MGBE1_MAC_CLK gate output */
 #define TEGRA234_CLK_MGBE1_MAC			386U
+/** @brief GBE_UPHY_MGBE1_MACSEC_CLK gate output */
+#define TEGRA234_CLK_MGBE1_MACSEC		387U
 /** @brief GBE_UPHY_MGBE1_EEE_PCS_CLK gate output */
 #define TEGRA234_CLK_MGBE1_EEE_PCS		388U
 /** @brief GBE_UPHY_MGBE1_APP_CLK gate output */
@@ -246,6 +732,8 @@
 #define TEGRA234_CLK_MGBE2_MAC_DIVIDER		394U
 /** @brief GBE_UPHY_MGBE2_MAC_CLK gate output */
 #define TEGRA234_CLK_MGBE2_MAC			395U
+/** @brief GBE_UPHY_MGBE2_MACSEC_CLK gate output */
+#define TEGRA234_CLK_MGBE2_MACSEC		396U
 /** @brief GBE_UPHY_MGBE2_EEE_PCS_CLK gate output */
 #define TEGRA234_CLK_MGBE2_EEE_PCS		397U
 /** @brief GBE_UPHY_MGBE2_APP_CLK gate output */
@@ -270,9 +758,146 @@
 #define TEGRA234_CLK_MGBE3_APP			407U
 /** @brief GBE_UPHY_MGBE3_PTP_REF_CLK divider gated output */
 #define TEGRA234_CLK_MGBE3_PTP_REF		408U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_GBE_RX_BYP switch divider output */
+#define TEGRA234_CLK_GBE_RX_BYP_REF		409U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_GBE_PLL0_MGMT switch divider output */
+#define TEGRA234_CLK_GBE_PLL0_MGMT		410U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_GBE_PLL1_MGMT switch divider output */
+#define TEGRA234_CLK_GBE_PLL1_MGMT		411U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_GBE_PLL2_MGMT switch divider output */
+#define TEGRA234_CLK_GBE_PLL2_MGMT		412U
+/** @brief output of gate CLK_ENB_EQOS_MACSEC_RX */
+#define TEGRA234_CLK_EQOS_MACSEC_RX		413U
+/** @brief output of gate CLK_ENB_EQOS_MACSEC_TX */
+#define TEGRA234_CLK_EQOS_MACSEC_TX		414U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_EQOS_TX_CLK divider ungated output */
+#define TEGRA234_CLK_EQOS_TX_DIVIDER		415U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_NVHS_PLL1_MGMT switch divider output */
+#define TEGRA234_CLK_NVHS_PLL1_MGMT		416U
+/** @brief CLK_RST_CONTROLLER_CLK_SOURCE_EMCHUB mux output */
+#define TEGRA234_CLK_EMCHUB			417U
+/** @brief clock recovered from I2S7 input */
+#define TEGRA234_CLK_I2S7_SYNC_INPUT		418U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_I2S7 */
+#define TEGRA234_CLK_SYNC_I2S7			419U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2S7 */
+#define TEGRA234_CLK_I2S7			420U
+/** @brief Monitored output of I2S7 pad macro mux */
+#define TEGRA234_CLK_I2S7_PAD_M			421U
+/** @brief clock recovered from I2S8 input */
+#define TEGRA234_CLK_I2S8_SYNC_INPUT		422U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_AUDIO_SYNC_CLK_I2S8 */
+#define TEGRA234_CLK_SYNC_I2S8			423U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2S8 */
+#define TEGRA234_CLK_I2S8			424U
+/** @brief Monitored output of I2S8 pad macro mux */
+#define TEGRA234_CLK_I2S8_PAD_M			425U
+/** @brief NAFLL clock source for GPU GPC0 */
+#define TEGRA234_CLK_NAFLL_GPC0			426U
+/** @brief NAFLL clock source for GPU GPC1 */
+#define TEGRA234_CLK_NAFLL_GPC1			427U
+/** @brief NAFLL clock source for GPU SYSCLK */
+#define TEGRA234_CLK_NAFLL_GPUSYS		428U
+/** @brief NAFLL clock source for CPU cluster 0 DSUCLK */
+#define TEGRA234_CLK_NAFLL_DSU0			429U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER0_DSU		429U
+/** @brief NAFLL clock source for CPU cluster 1 DSUCLK */
+#define TEGRA234_CLK_NAFLL_DSU1			430U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER1_DSU		430U
+/** @brief NAFLL clock source for CPU cluster 2 DSUCLK */
+#define TEGRA234_CLK_NAFLL_DSU2			431U /* TODO: remove */
+#define TEGRA234_CLK_NAFLL_CLUSTER2_DSU		431U
+/** @brief output of gate CLK_ENB_SCE_CPU */
+#define TEGRA234_CLK_SCE_CPU			432U
+/** @brief output of gate CLK_ENB_RCE_CPU */
+#define TEGRA234_CLK_RCE_CPU			433U
+/** @brief output of gate CLK_ENB_DCE_CPU */
+#define TEGRA234_CLK_DCE_CPU			434U
+/** @brief DSIPLL VCO output */
+#define TEGRA234_CLK_DSIPLL_VCO			435U
+/** @brief DSIPLL SYNC_CLKOUTP/N differential output */
+#define TEGRA234_CLK_DSIPLL_CLKOUTPN		436U
+/** @brief DSIPLL SYNC_CLKOUTA output */
+#define TEGRA234_CLK_DSIPLL_CLKOUTA		437U
+/** @brief SPPLL0 VCO output */
+#define TEGRA234_CLK_SPPLL0_VCO			438U
+/** @brief SPPLL0 SYNC_CLKOUTP/N differential output */
+#define TEGRA234_CLK_SPPLL0_CLKOUTPN		439U
+/** @brief SPPLL0 SYNC_CLKOUTA output */
+#define TEGRA234_CLK_SPPLL0_CLKOUTA		440U
+/** @brief SPPLL0 SYNC_CLKOUTB output */
+#define TEGRA234_CLK_SPPLL0_CLKOUTB		441U
+/** @brief SPPLL0 CLKOUT_DIVBY10 output */
+#define TEGRA234_CLK_SPPLL0_DIV10		442U
+/** @brief SPPLL0 CLKOUT_DIVBY25 output */
+#define TEGRA234_CLK_SPPLL0_DIV25		443U
+/** @brief SPPLL0 CLKOUT_DIVBY27P/N differential output */
+#define TEGRA234_CLK_SPPLL0_DIV27PN		444U
+/** @brief SPPLL1 VCO output */
+#define TEGRA234_CLK_SPPLL1_VCO			445U
+/** @brief SPPLL1 SYNC_CLKOUTP/N differential output */
+#define TEGRA234_CLK_SPPLL1_CLKOUTPN		446U
+/** @brief SPPLL1 CLKOUT_DIVBY27P/N differential output */
+#define TEGRA234_CLK_SPPLL1_DIV27PN		447U
+/** @brief VPLL0 reference clock */
+#define TEGRA234_CLK_VPLL0_REF			448U
+/** @brief VPLL0 */
+#define TEGRA234_CLK_VPLL0			449U
+/** @brief VPLL1 */
+#define TEGRA234_CLK_VPLL1			450U
+/** @brief NVDISPLAY_P0_CLK reference select */
+#define TEGRA234_CLK_NVDISPLAY_P0_REF		451U
+/** @brief RG0_PCLK */
+#define TEGRA234_CLK_RG0			452U
+/** @brief RG1_PCLK */
+#define TEGRA234_CLK_RG1			453U
+/** @brief DISPPLL output */
+#define TEGRA234_CLK_DISPPLL			454U
+/** @brief DISPHUBPLL output */
+#define TEGRA234_CLK_DISPHUBPLL			455U
+/** @brief CLK_RST_CONTROLLER_DSI_LP_SWITCH_DIVIDER switch divider output (dsi_lp_clk) */
+#define TEGRA234_CLK_DSI_LP			456U
 /** @brief CLK_RST_CONTROLLER_AZA2XBITCLK_OUT_SWITCH_DIVIDER switch divider output (aza_2xbitclk) */
 #define TEGRA234_CLK_AZA_2XBIT			457U
 /** @brief aza_2xbitclk / 2 (aza_bitclk) */
 #define TEGRA234_CLK_AZA_BIT			458U
+/** @brief SWITCH_DSI_CORE_PIXEL_MISC_DSI_CORE_CLK_SRC switch output (dsi_core_clk) */
+#define TEGRA234_CLK_DSI_CORE			459U
+/** @brief Output of mux controlled by pkt_wr_fifo_signal from dsi (dsi_pixel_clk) */
+#define TEGRA234_CLK_DSI_PIXEL			460U
+/** @brief Output of mux controlled by disp_2clk_sor0_dp_sel (pre_sor0_clk) */
+#define TEGRA234_CLK_PRE_SOR0			461U
+/** @brief Output of mux controlled by disp_2clk_sor1_dp_sel (pre_sor1_clk) */
+#define TEGRA234_CLK_PRE_SOR1			462U
+/** @brief CLK_RST_CONTROLLER_LINK_REFCLK_CFG__0 output */
+#define TEGRA234_CLK_DP_LINK_REF		463U
+/** @brief Link clock input from DP macro brick PLL */
+#define TEGRA234_CLK_SOR_LINKA_INPUT		464U
+/** @brief SOR AFIFO clock outut */
+#define TEGRA234_CLK_SOR_LINKA_AFIFO		465U
+/** @brief Monitored branch of linka_afifo_clk */
+#define TEGRA234_CLK_SOR_LINKA_AFIFO_M		466U
+/** @brief Monitored branch of rg0_pclk */
+#define TEGRA234_CLK_RG0_M			467U
+/** @brief Monitored branch of rg1_pclk */
+#define TEGRA234_CLK_RG1_M			468U
+/** @brief Monitored branch of sor0_clk */
+#define TEGRA234_CLK_SOR0_M			469U
+/** @brief Monitored branch of sor1_clk */
+#define TEGRA234_CLK_SOR1_M			470U
+/** @brief EMC PLLHUB output */
+#define TEGRA234_CLK_PLLHUB			471U
+/** @brief output of fixed (DIV2) MC HUB divider */
+#define TEGRA234_CLK_MCHUB			472U
+/** @brief output of divider controlled by EMC side A MC_EMC_SAFE_SAME_FREQ */
+#define TEGRA234_CLK_EMCSA_MC			473U
+/** @brief output of divider controlled by EMC side B MC_EMC_SAFE_SAME_FREQ */
+#define TEGRA234_CLK_EMCSB_MC			474U
+/** @brief output of divider controlled by EMC side C MC_EMC_SAFE_SAME_FREQ */
+#define TEGRA234_CLK_EMCSC_MC			475U
+/** @brief output of divider controlled by EMC side D MC_EMC_SAFE_SAME_FREQ */
+#define TEGRA234_CLK_EMCSD_MC			476U
+
+/** @} */
 
 #endif
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index bd71cc1d7990..7d49880e7faa 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -8,31 +8,158 @@
 #define TEGRA234_SID_INVALID		0x00
 #define TEGRA234_SID_PASSTHROUGH	0x7f
 
+/* ISO stream IDs */
+#define TEGRA234_SID_ISO_NVDISPLAY	0x01
+#define TEGRA234_SID_ISO_VI		0x02
+#define TEGRA234_SID_ISO_VIFALC		0x03
+#define TEGRA234_SID_ISO_VI2		0x04
+#define TEGRA234_SID_ISO_VI2FALC	0x05
+#define TEGRA234_SID_ISO_VI_VM2		0x06
+#define TEGRA234_SID_ISO_VI2_VM2	0x07
+
 /* NISO0 stream IDs */
-#define TEGRA234_SID_APE	0x02
-#define TEGRA234_SID_HDA	0x03
-#define TEGRA234_SID_GPCDMA	0x04
-#define TEGRA234_SID_MGBE	0x06
-#define TEGRA234_SID_PCIE0	0x12
-#define TEGRA234_SID_PCIE4	0x13
-#define TEGRA234_SID_PCIE5	0x14
-#define TEGRA234_SID_PCIE6	0x15
-#define TEGRA234_SID_PCIE9	0x1f
-#define TEGRA234_SID_MGBE_VF1	0x49
-#define TEGRA234_SID_MGBE_VF2	0x4a
-#define TEGRA234_SID_MGBE_VF3	0x4b
+#define TEGRA234_SID_AON		0x01
+#define TEGRA234_SID_APE		0x02
+#define TEGRA234_SID_HDA		0x03
+#define TEGRA234_SID_GPCDMA		0x04
+#define TEGRA234_SID_ETR		0x05
+#define TEGRA234_SID_MGBE		0x06
+#define TEGRA234_SID_NVDISPLAY		0x07
+#define TEGRA234_SID_DCE		0x08
+#define TEGRA234_SID_PSC		0x09
+#define TEGRA234_SID_RCE		0x0a
+#define TEGRA234_SID_SCE		0x0b
+#define TEGRA234_SID_UFSHC		0x0c
+#define TEGRA234_SID_APE_1		0x0d
+#define TEGRA234_SID_GPCDMA_1		0x0e
+#define TEGRA234_SID_GPCDMA_2		0x0f
+#define TEGRA234_SID_GPCDMA_3		0x10
+#define TEGRA234_SID_GPCDMA_4		0x11
+#define TEGRA234_SID_PCIE0		0x12
+#define TEGRA234_SID_PCIE4		0x13
+#define TEGRA234_SID_PCIE5		0x14
+#define TEGRA234_SID_PCIE6		0x15
+#define TEGRA234_SID_RCE_VM2		0x16
+#define TEGRA234_SID_RCE_SERVER		0x17
+#define TEGRA234_SID_SMMU_TEST		0x18
+#define TEGRA234_SID_UFS_1		0x19
+#define TEGRA234_SID_UFS_2		0x1a
+#define TEGRA234_SID_UFS_3		0x1b
+#define TEGRA234_SID_UFS_4		0x1c
+#define TEGRA234_SID_UFS_5		0x1d
+#define TEGRA234_SID_UFS_6		0x1e
+#define TEGRA234_SID_PCIE9		0x1f
+#define TEGRA234_SID_VSE_GPCDMA_VM0	0x20
+#define TEGRA234_SID_VSE_GPCDMA_VM1	0x21
+#define TEGRA234_SID_VSE_GPCDMA_VM2	0x22
+#define TEGRA234_SID_NVDLA1		0x23
+#define TEGRA234_SID_NVENC		0x24
+#define TEGRA234_SID_NVJPG1		0x25
+#define TEGRA234_SID_OFA		0x26
+#define TEGRA234_SID_MGBE_VF1		0x49
+#define TEGRA234_SID_MGBE_VF2		0x4a
+#define TEGRA234_SID_MGBE_VF3		0x4b
+#define TEGRA234_SID_MGBE_VF4		0x4c
+#define TEGRA234_SID_MGBE_VF5		0x4d
+#define TEGRA234_SID_MGBE_VF6		0x4e
+#define TEGRA234_SID_MGBE_VF7		0x4f
+#define TEGRA234_SID_MGBE_VF8		0x50
+#define TEGRA234_SID_MGBE_VF9		0x51
+#define TEGRA234_SID_MGBE_VF10		0x52
+#define TEGRA234_SID_MGBE_VF11		0x53
+#define TEGRA234_SID_MGBE_VF12		0x54
+#define TEGRA234_SID_MGBE_VF13		0x55
+#define TEGRA234_SID_MGBE_VF14		0x56
+#define TEGRA234_SID_MGBE_VF15		0x57
+#define TEGRA234_SID_MGBE_VF16		0x58
+#define TEGRA234_SID_MGBE_VF17		0x59
+#define TEGRA234_SID_MGBE_VF18		0x5a
+#define TEGRA234_SID_MGBE_VF19		0x5b
+#define TEGRA234_SID_MGBE_VF20		0x5c
+#define TEGRA234_SID_APE_2		0x5e
+#define TEGRA234_SID_APE_3		0x5f
+#define TEGRA234_SID_UFS_7		0x60
+#define TEGRA234_SID_UFS_8		0x61
+#define TEGRA234_SID_UFS_9		0x62
+#define TEGRA234_SID_UFS_10		0x63
+#define TEGRA234_SID_UFS_11		0x64
+#define TEGRA234_SID_UFS_12		0x65
+#define TEGRA234_SID_UFS_13		0x66
+#define TEGRA234_SID_UFS_14		0x67
+#define TEGRA234_SID_UFS_15		0x68
+#define TEGRA234_SID_UFS_16		0x69
+#define TEGRA234_SID_UFS_17		0x6a
+#define TEGRA234_SID_UFS_18		0x6b
+#define TEGRA234_SID_UFS_19		0x6c
+#define TEGRA234_SID_UFS_20		0x6d
+#define TEGRA234_SID_GPCDMA_5		0x6e
+#define TEGRA234_SID_GPCDMA_6		0x6f
+#define TEGRA234_SID_GPCDMA_7		0x70
+#define TEGRA234_SID_GPCDMA_8		0x71
+#define TEGRA234_SID_GPCDMA_9		0x72
 
 /* NISO1 stream IDs */
-#define TEGRA234_SID_SDMMC4	0x02
-#define TEGRA234_SID_PCIE1	0x05
-#define TEGRA234_SID_PCIE2	0x06
-#define TEGRA234_SID_PCIE3	0x07
-#define TEGRA234_SID_PCIE7	0x08
-#define TEGRA234_SID_PCIE8	0x09
-#define TEGRA234_SID_PCIE10	0x0b
-#define TEGRA234_SID_BPMP	0x10
-#define TEGRA234_SID_HOST1X	0x27
-#define TEGRA234_SID_VIC	0x34
+#define TEGRA234_SID_SDMMC1A		0x01
+#define TEGRA234_SID_SDMMC4		0x02
+#define TEGRA234_SID_EQOS		0x03
+#define TEGRA234_SID_HWMP_PMA		0x04
+#define TEGRA234_SID_PCIE1		0x05
+#define TEGRA234_SID_PCIE2		0x06
+#define TEGRA234_SID_PCIE3		0x07
+#define TEGRA234_SID_PCIE7		0x08
+#define TEGRA234_SID_PCIE8		0x09
+#define TEGRA234_SID_PCIE10		0x0b
+#define TEGRA234_SID_QSPI0		0x0c
+#define TEGRA234_SID_QSPI1		0x0d
+#define TEGRA234_SID_XUSB_HOST		0x0e
+#define TEGRA234_SID_XUSB_DEV		0x0f
+#define TEGRA234_SID_BPMP		0x10
+#define TEGRA234_SID_FSI		0x11
+#define TEGRA234_SID_PVA0_VM0		0x12
+#define TEGRA234_SID_PVA0_VM1		0x13
+#define TEGRA234_SID_PVA0_VM2		0x14
+#define TEGRA234_SID_PVA0_VM3		0x15
+#define TEGRA234_SID_PVA0_VM4		0x16
+#define TEGRA234_SID_PVA0_VM5		0x17
+#define TEGRA234_SID_PVA0_VM6		0x18
+#define TEGRA234_SID_PVA0_VM7		0x19
+#define TEGRA234_SID_XUSB_VF0		0x1a
+#define TEGRA234_SID_XUSB_VF1		0x1b
+#define TEGRA234_SID_XUSB_VF2		0x1c
+#define TEGRA234_SID_XUSB_VF3		0x1d
+#define TEGRA234_SID_EQOS_VF1		0x1e
+#define TEGRA234_SID_EQOS_VF2		0x1f
+#define TEGRA234_SID_EQOS_VF3		0x20
+#define TEGRA234_SID_EQOS_VF4		0x21
+#define TEGRA234_SID_ISP_VM2		0x22
+#define TEGRA234_SID_HOST1X		0x27
+#define TEGRA234_SID_ISP		0x28
+#define TEGRA234_SID_NVDEC		0x29
+#define TEGRA234_SID_NVJPG		0x2a
+#define TEGRA234_SID_NVDLA0		0x2b
+#define TEGRA234_SID_PVA0		0x2c
+#define TEGRA234_SID_SES_SE0		0x2d
+#define TEGRA234_SID_SES_SE1		0x2e
+#define TEGRA234_SID_SES_SE2		0x2f
+#define TEGRA234_SID_SEU1_SE0		0x30
+#define TEGRA234_SID_SEU1_SE1		0x31
+#define TEGRA234_SID_SEU1_SE2		0x32
+#define TEGRA234_SID_TSEC		0x33
+#define TEGRA234_SID_VIC		0x34
+#define TEGRA234_SID_HC_VM0		0x3d
+#define TEGRA234_SID_HC_VM1		0x3e
+#define TEGRA234_SID_HC_VM2		0x3f
+#define TEGRA234_SID_HC_VM3		0x40
+#define TEGRA234_SID_HC_VM4		0x41
+#define TEGRA234_SID_HC_VM5		0x42
+#define TEGRA234_SID_HC_VM6		0x43
+#define TEGRA234_SID_HC_VM7		0x44
+#define TEGRA234_SID_SE_VM0		0x45
+#define TEGRA234_SID_SE_VM1		0x46
+#define TEGRA234_SID_SE_VM2		0x47
+#define TEGRA234_SID_ISPFALC		0x48
+#define TEGRA234_SID_NISO1_SMMU_TEST	0x49
+#define TEGRA234_SID_TSEC_VM0		0x4a
 
 /* Shared stream IDs */
 #define TEGRA234_SID_HOST1X_CTX0	0x35
@@ -48,21 +175,81 @@
  * memory client IDs
  */
 
+/* Misses from System Memory Management Unit (SMMU) Page Table Cache (PTC) */
+#define TEGRA234_MEMORY_CLIENT_PTCR 0x00
+/* MSS internal memqual MIU7 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU7R 0x01
+/* MSS internal memqual MIU7 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU7W 0x02
+/* MSS internal memqual MIU8 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU8R 0x03
+/* MSS internal memqual MIU8 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU8W 0x04
+/* MSS internal memqual MIU9 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU9R 0x05
+/* MSS internal memqual MIU9 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU9W 0x06
+/* MSS internal memqual MIU10 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU10R 0x07
+/* MSS internal memqual MIU10 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU10W 0x08
+/* MSS internal memqual MIU11 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU11R 0x09
+/* MSS internal memqual MIU11 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU11W 0x0a
+/* MSS internal memqual MIU12 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU12R 0x0b
+/* MSS internal memqual MIU12 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU12W 0x0c
+/* MSS internal memqual MIU13 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU13R 0x0d
+/* MSS internal memqual MIU13 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU13W 0x0e
+#define TEGRA234_MEMORY_CLIENT_NVL5RHP 0x13
+#define TEGRA234_MEMORY_CLIENT_NVL5R 0x14
 /* High-definition audio (HDA) read clients */
 #define TEGRA234_MEMORY_CLIENT_HDAR 0x15
+/* Host channel data read clients */
 #define TEGRA234_MEMORY_CLIENT_HOST1XDMAR 0x16
+#define TEGRA234_MEMORY_CLIENT_NVL5W 0x17
+#define TEGRA234_MEMORY_CLIENT_NVL6RHP 0x18
+#define TEGRA234_MEMORY_CLIENT_NVL6R 0x19
+#define TEGRA234_MEMORY_CLIENT_NVL6W 0x1a
+#define TEGRA234_MEMORY_CLIENT_NVL7RHP 0x1b
+#define TEGRA234_MEMORY_CLIENT_NVENCSRD 0x1c
+#define TEGRA234_MEMORY_CLIENT_NVL7R 0x1d
+#define TEGRA234_MEMORY_CLIENT_NVL7W 0x1e
+#define TEGRA234_MEMORY_CLIENT_NVL8RHP 0x20
+#define TEGRA234_MEMORY_CLIENT_NVL8R 0x21
+#define TEGRA234_MEMORY_CLIENT_NVL8W 0x22
+#define TEGRA234_MEMORY_CLIENT_NVL9RHP 0x23
+#define TEGRA234_MEMORY_CLIENT_NVL9R 0x24
+#define TEGRA234_MEMORY_CLIENT_NVL9W 0x25
 /* PCIE6 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE6AR 0x28
 /* PCIE6 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE6AW 0x29
 /* PCIE7 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE7AR 0x2a
+#define TEGRA234_MEMORY_CLIENT_NVENCSWR 0x2b
+/* DLA0ARDB read clinets */
+#define TEGRA234_MEMORY_CLIENT_DLA0RDB 0x2c
+/* DLA0ARDB1 read clinets */
+#define TEGRA234_MEMORY_CLIENT_DLA0RDB1 0x2d
+/* DLA0 writes */
+#define TEGRA234_MEMORY_CLIENT_DLA0WDB 0x2e
+/* DLA1ARDB read clinets */
+#define TEGRA234_MEMORY_CLIENT_DLA1RDB 0x2f
 /* PCIE7 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE7AW 0x30
 /* PCIE8 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE8AR 0x32
 /* High-definition audio (HDA) write clients */
 #define TEGRA234_MEMORY_CLIENT_HDAW 0x35
+/* Writes from Cortex-A9 4 CPU cores via the L2 cache */
+#define TEGRA234_MEMORY_CLIENT_MPCOREW 0x39
+/* OFAA client */
+#define TEGRA234_MEMORY_CLIENT_OFAR1 0x3a
 /* PCIE8 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE8AW 0x3b
 /* PCIE9 read clients */
@@ -75,10 +262,32 @@
 #define TEGRA234_MEMORY_CLIENT_PCIE10AR 0x3f
 /* PCIE10 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE10AW 0x40
+/* ISP read client for Crossbar A */
+#define TEGRA234_MEMORY_CLIENT_ISPRA 0x44
+/* ISP read client 1 for Crossbar A */
+#define TEGRA234_MEMORY_CLIENT_ISPFALR 0x45
+/* ISP Write client for Crossbar A */
+#define TEGRA234_MEMORY_CLIENT_ISPWA 0x46
+/* ISP Write client Crossbar B */
+#define TEGRA234_MEMORY_CLIENT_ISPWB 0x47
 /* PCIE10r1 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE10AR1 0x48
 /* PCIE7r1 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE7AR1 0x49
+/* XUSB_HOST read clients */
+#define TEGRA234_MEMORY_CLIENT_XUSB_HOSTR 0x4a
+/* XUSB_HOST write clients */
+#define TEGRA234_MEMORY_CLIENT_XUSB_HOSTW 0x4b
+/* XUSB read clients */
+#define TEGRA234_MEMORY_CLIENT_XUSB_DEVR 0x4c
+/* XUSB_DEV write clients */
+#define TEGRA234_MEMORY_CLIENT_XUSB_DEVW 0x4d
+/* TSEC Memory Return Data Client Description */
+#define TEGRA234_MEMORY_CLIENT_TSECSRD 0x54
+/* TSEC Memory Write Client Description */
+#define TEGRA234_MEMORY_CLIENT_TSECSWR 0x55
+/* XSPI writes */
+#define TEGRA234_MEMORY_CLIENT_XSPI1W 0x56
 /* MGBE0 read client */
 #define TEGRA234_MEMORY_CLIENT_MGBEARD 0x58
 /* MGBEB read client */
@@ -89,18 +298,86 @@
 #define TEGRA234_MEMORY_CLIENT_MGBEDRD 0x5b
 /* MGBE0 write client */
 #define TEGRA234_MEMORY_CLIENT_MGBEAWR 0x5c
+/* OFAA client */
+#define TEGRA234_MEMORY_CLIENT_OFAR 0x5d
+/* OFAA writes */
+#define TEGRA234_MEMORY_CLIENT_OFAW 0x5e
 /* MGBEB write client */
 #define TEGRA234_MEMORY_CLIENT_MGBEBWR 0x5f
+/* sdmmca memory read client */
+#define TEGRA234_MEMORY_CLIENT_SDMMCRA 0x60
 /* MGBEC write client */
 #define TEGRA234_MEMORY_CLIENT_MGBECWR 0x61
 /* sdmmcd memory read client */
 #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
+/* sdmmca memory write client */
+#define TEGRA234_MEMORY_CLIENT_SDMMCWA 0x64
 /* MGBED write client */
 #define TEGRA234_MEMORY_CLIENT_MGBEDWR 0x65
 /* sdmmcd memory write client */
 #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
+/* SE Memory Return Data Client Description */
+#define TEGRA234_MEMORY_CLIENT_SEU1RD 0x68
+/* SE Memory Write Client Description */
+#define TEGRA234_MEMORY_CLIENT_SUE1WR 0x69
 #define TEGRA234_MEMORY_CLIENT_VICSRD 0x6c
 #define TEGRA234_MEMORY_CLIENT_VICSWR 0x6d
+/* DLA1ARDB1 read clinets */
+#define TEGRA234_MEMORY_CLIENT_DLA1RDB1 0x6e
+/* DLA1 writes */
+#define TEGRA234_MEMORY_CLIENT_DLA1WRB 0x6f
+/* VI FLACON read clinets */
+#define TEGRA234_MEMORY_CLIENT_VI2FALR 0x71
+/* VI Write client */
+#define TEGRA234_MEMORY_CLIENT_VI2W 0x70
+/* VI Write client */
+#define TEGRA234_MEMORY_CLIENT_VIW 0x72
+/* NISO display read client */
+#define TEGRA234_MEMORY_CLIENT_NVDISPNISOR 0x73
+/* NVDISPNISO writes */
+#define TEGRA234_MEMORY_CLIENT_NVDISPNISOW 0x74
+/* XSPI client */
+#define TEGRA234_MEMORY_CLIENT_XSPI0R 0x75
+/* XSPI writes */
+#define TEGRA234_MEMORY_CLIENT_XSPI0W 0x76
+/* XSPI client */
+#define TEGRA234_MEMORY_CLIENT_XSPI1R 0x77
+#define TEGRA234_MEMORY_CLIENT_NVDECSRD 0x78
+#define TEGRA234_MEMORY_CLIENT_NVDECSWR 0x79
+/* Audio Processing (APE) engine read clients */
+#define TEGRA234_MEMORY_CLIENT_APER 0x7a
+/* Audio Processing (APE) engine write clients */
+#define TEGRA234_MEMORY_CLIENT_APEW 0x7b
+/* VI2FAL writes */
+#define TEGRA234_MEMORY_CLIENT_VI2FALW 0x7c
+#define TEGRA234_MEMORY_CLIENT_NVJPGSRD 0x7e
+#define TEGRA234_MEMORY_CLIENT_NVJPGSWR 0x7f
+/* SE Memory Return Data Client Description */
+#define TEGRA234_MEMORY_CLIENT_SESRD 0x80
+/* SE Memory Write Client Description */
+#define TEGRA234_MEMORY_CLIENT_SESWR 0x81
+/* AXI AP and DFD-AUX0/1 read clients Both share the same interface on the on MSS */
+#define TEGRA234_MEMORY_CLIENT_AXIAPR 0x82
+/* AXI AP and DFD-AUX0/1 write clients Both sahre the same interface on MSS */
+#define TEGRA234_MEMORY_CLIENT_AXIAPW 0x83
+/* ETR read clients */
+#define TEGRA234_MEMORY_CLIENT_ETRR 0x84
+/* ETR write clients */
+#define TEGRA234_MEMORY_CLIENT_ETRW 0x85
+/* AXI Switch read client */
+#define TEGRA234_MEMORY_CLIENT_AXISR 0x8c
+/* AXI Switch write client */
+#define TEGRA234_MEMORY_CLIENT_AXISW 0x8d
+/* EQOS read client */
+#define TEGRA234_MEMORY_CLIENT_EQOSR 0x8e
+/* EQOS write client */
+#define TEGRA234_MEMORY_CLIENT_EQOSW 0x8f
+/* UFSHC read client */
+#define TEGRA234_MEMORY_CLIENT_UFSHCR 0x90
+/* UFSHC write client */
+#define TEGRA234_MEMORY_CLIENT_UFSHCW 0x91
+/* NVDISPLAY read client */
+#define TEGRA234_MEMORY_CLIENT_NVDISPLAYR 0x92
 /* BPMP read client */
 #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
 /* BPMP write client */
@@ -109,10 +386,97 @@
 #define TEGRA234_MEMORY_CLIENT_BPMPDMAR 0x95
 /* BPMPDMA write client */
 #define TEGRA234_MEMORY_CLIENT_BPMPDMAW 0x96
+/* AON read client */
+#define TEGRA234_MEMORY_CLIENT_AONR 0x97
+/* AON write client */
+#define TEGRA234_MEMORY_CLIENT_AONW 0x98
+/* AONDMA read client */
+#define TEGRA234_MEMORY_CLIENT_AONDMAR 0x99
+/* AONDMA write client */
+#define TEGRA234_MEMORY_CLIENT_AONDMAW 0x9a
+/* SCE read client */
+#define TEGRA234_MEMORY_CLIENT_SCER 0x9b
+/* SCE write client */
+#define TEGRA234_MEMORY_CLIENT_SCEW 0x9c
+/* SCEDMA read client */
+#define TEGRA234_MEMORY_CLIENT_SCEDMAR 0x9d
+/* SCEDMA write client */
+#define TEGRA234_MEMORY_CLIENT_SCEDMAW 0x9e
 /* APEDMA read client */
 #define TEGRA234_MEMORY_CLIENT_APEDMAR 0x9f
 /* APEDMA write client */
 #define TEGRA234_MEMORY_CLIENT_APEDMAW 0xa0
+/* NVDISPLAY read client instance 2 */
+#define TEGRA234_MEMORY_CLIENT_NVDISPLAYR1 0xa1
+#define TEGRA234_MEMORY_CLIENT_VICSRD1 0xa2
+/* MSS internal memqual MIU0 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU0R 0xa6
+/* MSS internal memqual MIU0 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU0W 0xa7
+/* MSS internal memqual MIU1 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU1R 0xa8
+/* MSS internal memqual MIU1 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU1W 0xa9
+/* MSS internal memqual MIU2 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU2R 0xae
+/* MSS internal memqual MIU2 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU2W 0xaf
+/* MSS internal memqual MIU3 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU3R 0xb0
+/* MSS internal memqual MIU3 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU3W 0xb1
+/* MSS internal memqual MIU4 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU4R 0xb2
+/* MSS internal memqual MIU4 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU4W 0xb3
+#define TEGRA234_MEMORY_CLIENT_DPMUR 0xb4
+#define TEGRA234_MEMORY_CLIENT_DPMUW 0xb5
+#define TEGRA234_MEMORY_CLIENT_NVL0R 0xb6
+#define TEGRA234_MEMORY_CLIENT_NVL0W 0xb7
+#define TEGRA234_MEMORY_CLIENT_NVL1R 0xb8
+#define TEGRA234_MEMORY_CLIENT_NVL1W 0xb9
+#define TEGRA234_MEMORY_CLIENT_NVL2R 0xba
+#define TEGRA234_MEMORY_CLIENT_NVL2W 0xbb
+/* VI FLACON read clients */
+#define TEGRA234_MEMORY_CLIENT_VIFALR 0xbc
+/* VIFAL write clients */
+#define TEGRA234_MEMORY_CLIENT_VIFALW 0xbd
+/* DLA0ARDA read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA0RDA 0xbe
+/* DLA0 Falcon read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA0FALRDB 0xbf
+/* DLA0 write clients */
+#define TEGRA234_MEMORY_CLIENT_DLA0WRA 0xc0
+/* DLA0 write clients */
+#define TEGRA234_MEMORY_CLIENT_DLA0FALWRB 0xc1
+/* DLA1ARDA read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA1RDA 0xc2
+/* DLA1 Falcon read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA1FALRDB 0xc3
+/* DLA1 write clients */
+#define TEGRA234_MEMORY_CLIENT_DLA1WRA 0xc4
+/* DLA1 write clients */
+#define TEGRA234_MEMORY_CLIENT_DLA1FALWRB 0xc5
+/* PVA0RDA read clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0RDA 0xc6
+/* PVA0RDB read clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0RDB 0xc7
+/* PVA0RDC read clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0RDC 0xc8
+/* PVA0WRA write clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0WRA 0xc9
+/* PVA0WRB write clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0WRB 0xca
+/* PVA0WRC write clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0WRC 0xcb
+/* RCE read client */
+#define TEGRA234_MEMORY_CLIENT_RCER 0xd2
+/* RCE write client */
+#define TEGRA234_MEMORY_CLIENT_RCEW 0xd3
+/* RCEDMA read client */
+#define TEGRA234_MEMORY_CLIENT_RCEDMAR 0xd4
+/* RCEDMA write client */
+#define TEGRA234_MEMORY_CLIENT_RCEDMAW 0xd5
 /* PCIE0 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE0R 0xd8
 /* PCIE0 write clients */
@@ -137,7 +501,39 @@
 #define TEGRA234_MEMORY_CLIENT_PCIE5R 0xe2
 /* PCIE5 write clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE5W 0xe3
+/* ISP read client 1 for Crossbar A */
+#define TEGRA234_MEMORY_CLIENT_ISPFALW 0xe4
+#define TEGRA234_MEMORY_CLIENT_NVL3R 0xe5
+#define TEGRA234_MEMORY_CLIENT_NVL3W 0xe6
+#define TEGRA234_MEMORY_CLIENT_NVL4R 0xe7
+#define TEGRA234_MEMORY_CLIENT_NVL4W 0xe8
+/* DLA0ARDA1 read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA0RDA1 0xe9
+/* DLA1ARDA1 read clients */
+#define TEGRA234_MEMORY_CLIENT_DLA1RDA1 0xea
+/* PVA0RDA1 read clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0RDA1 0xeb
+/* PVA0RDB1 read clients */
+#define TEGRA234_MEMORY_CLIENT_PVA0RDB1 0xec
 /* PCIE5r1 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE5R1 0xef
+#define TEGRA234_MEMORY_CLIENT_NVENCSRD1 0xf0
+/* ISP read client for Crossbar A */
+#define TEGRA234_MEMORY_CLIENT_ISPRA1 0xf2
+#define TEGRA234_MEMORY_CLIENT_NVL0RHP 0xf4
+#define TEGRA234_MEMORY_CLIENT_NVL1RHP 0xf5
+#define TEGRA234_MEMORY_CLIENT_NVL2RHP 0xf6
+#define TEGRA234_MEMORY_CLIENT_NVL3RHP 0xf7
+#define TEGRA234_MEMORY_CLIENT_NVL4RHP 0xf8
+/* MSS internal memqual MIU5 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU5R 0xfc
+/* MSS internal memqual MIU5 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU5W 0xfd
+/* MSS internal memqual MIU6 read clients */
+#define TEGRA234_MEMORY_CLIENT_MIU6R 0xfe
+/* MSS internal memqual MIU6 write clients */
+#define TEGRA234_MEMORY_CLIENT_MIU6W 0xff
+#define TEGRA234_MEMORY_CLIENT_NVJPG1SRD 0x123
+#define TEGRA234_MEMORY_CLIENT_NVJPG1SWR 0x124
 
 #endif
diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
index ae9286cef85c..b0fec2ddec84 100644
--- a/include/dt-bindings/power/tegra234-powergate.h
+++ b/include/dt-bindings/power/tegra234-powergate.h
@@ -4,6 +4,7 @@
 #ifndef __ABI_MACH_T234_POWERGATE_T234_H_
 #define __ABI_MACH_T234_POWERGATE_T234_H_
 
+#define TEGRA234_POWER_DOMAIN_OFA	1U
 #define TEGRA234_POWER_DOMAIN_AUD	2U
 #define TEGRA234_POWER_DOMAIN_DISP	3U
 #define TEGRA234_POWER_DOMAIN_PCIEX8A	5U
@@ -11,6 +12,9 @@
 #define TEGRA234_POWER_DOMAIN_PCIEX4BA	7U
 #define TEGRA234_POWER_DOMAIN_PCIEX4BB	8U
 #define TEGRA234_POWER_DOMAIN_PCIEX1A	9U
+#define TEGRA234_POWER_DOMAIN_XUSBA	10U
+#define TEGRA234_POWER_DOMAIN_XUSBB	11U
+#define TEGRA234_POWER_DOMAIN_XUSBC	12U
 #define TEGRA234_POWER_DOMAIN_PCIEX4CA	13U
 #define TEGRA234_POWER_DOMAIN_PCIEX4CB	14U
 #define TEGRA234_POWER_DOMAIN_PCIEX4CC	15U
@@ -19,6 +23,17 @@
 #define TEGRA234_POWER_DOMAIN_MGBEB	18U
 #define TEGRA234_POWER_DOMAIN_MGBEC	19U
 #define TEGRA234_POWER_DOMAIN_MGBED	20U
+#define TEGRA234_POWER_DOMAIN_ISPA	22U
+#define TEGRA234_POWER_DOMAIN_NVDEC	23U
+#define TEGRA234_POWER_DOMAIN_NVJPGA	24U
+#define TEGRA234_POWER_DOMAIN_NVENC	25U
+#define TEGRA234_POWER_DOMAIN_VI	28U
 #define TEGRA234_POWER_DOMAIN_VIC	29U
+#define TEGRA234_POWER_DOMAIN_PVA	30U
+#define TEGRA234_POWER_DOMAIN_DLAA	32U
+#define TEGRA234_POWER_DOMAIN_DLAB	33U
+#define TEGRA234_POWER_DOMAIN_CV	34U
+#define TEGRA234_POWER_DOMAIN_GPU	35U
+#define TEGRA234_POWER_DOMAIN_NVJPGB	36U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index d48d22b2bc7f..85cc423a7bdf 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -10,14 +10,29 @@
  * @brief Identifiers for Resets controllable by firmware
  * @{
  */
+#define TEGRA234_RESET_ACTMON			1U
+#define TEGRA234_RESET_ADSP_ALL			2U
+#define TEGRA234_RESET_DSI_CORE			3U
+#define TEGRA234_RESET_CAN1			4U
+#define TEGRA234_RESET_CAN2			5U
+#define TEGRA234_RESET_DLA0			6U
+#define TEGRA234_RESET_DLA1			7U
+#define TEGRA234_RESET_DPAUX			8U
+#define TEGRA234_RESET_OFA			9U
+#define TEGRA234_RESET_NVJPG1			10U
 #define TEGRA234_RESET_PEX1_CORE_6		11U
 #define TEGRA234_RESET_PEX1_CORE_6_APB		12U
 #define TEGRA234_RESET_PEX1_COMMON_APB		13U
 #define TEGRA234_RESET_PEX2_CORE_7		14U
 #define TEGRA234_RESET_PEX2_CORE_7_APB		15U
+#define TEGRA234_RESET_NVDISPLAY		16U
+#define TEGRA234_RESET_EQOS			17U
 #define TEGRA234_RESET_GPCDMA			18U
+#define TEGRA234_RESET_GPU			19U
 #define TEGRA234_RESET_HDA			20U
 #define TEGRA234_RESET_HDACODEC			21U
+#define TEGRA234_RESET_EQOS_MACSEC		22U
+#define TEGRA234_RESET_EQOS_MACSEC_SECURE	23U
 #define TEGRA234_RESET_I2C1			24U
 #define TEGRA234_RESET_PEX2_CORE_8		25U
 #define TEGRA234_RESET_PEX2_CORE_8_APB		26U
@@ -30,15 +45,36 @@
 #define TEGRA234_RESET_I2C7			33U
 #define TEGRA234_RESET_I2C8			34U
 #define TEGRA234_RESET_I2C9			35U
+#define TEGRA234_RESET_ISP			36U
+#define TEGRA234_RESET_MIPI_CAL			37U
+#define TEGRA234_RESET_MPHY_CLK_CTL		38U
+#define TEGRA234_RESET_MPHY_L0_RX		39U
+#define TEGRA234_RESET_MPHY_L0_TX		40U
+#define TEGRA234_RESET_MPHY_L1_RX		41U
+#define TEGRA234_RESET_MPHY_L1_TX		42U
+#define TEGRA234_RESET_NVCSI			43U
+#define TEGRA234_RESET_NVDEC			44U
 #define TEGRA234_RESET_MGBE0_PCS		45U
 #define TEGRA234_RESET_MGBE0_MAC		46U
+#define TEGRA234_RESET_MGBE0_MACSEC		47U
+#define TEGRA234_RESET_MGBE0_MACSEC_SECURE	48U
 #define TEGRA234_RESET_MGBE1_PCS		49U
 #define TEGRA234_RESET_MGBE1_MAC		50U
+#define TEGRA234_RESET_MGBE1_MACSEC		51U
+#define TEGRA234_RESET_MGBE1_MACSEC_SECURE	52U
 #define TEGRA234_RESET_MGBE2_PCS		53U
 #define TEGRA234_RESET_MGBE2_MAC		54U
+#define TEGRA234_RESET_MGBE2_MACSEC		55U
 #define TEGRA234_RESET_PEX2_CORE_10		56U
 #define TEGRA234_RESET_PEX2_CORE_10_APB		57U
 #define TEGRA234_RESET_PEX2_COMMON_APB		58U
+#define TEGRA234_RESET_NVENC			59U
+#define TEGRA234_RESET_MGBE2_MACSEC_SECURE	60U
+#define TEGRA234_RESET_NVJPG			61U
+#define TEGRA234_RESET_LA			64U
+#define TEGRA234_RESET_HWPM			65U
+#define TEGRA234_RESET_PVA0_ALL			66U
+#define TEGRA234_RESET_CEC			67U
 #define TEGRA234_RESET_PWM1			68U
 #define TEGRA234_RESET_PWM2			69U
 #define TEGRA234_RESET_PWM3			70U
@@ -49,11 +85,43 @@
 #define TEGRA234_RESET_PWM8			75U
 #define TEGRA234_RESET_QSPI0			76U
 #define TEGRA234_RESET_QSPI1			77U
+#define TEGRA234_RESET_I2S7			78U
+#define TEGRA234_RESET_I2S8			79U
+#define TEGRA234_RESET_SCE_ALL			80U
+#define TEGRA234_RESET_RCE_ALL			81U
+#define TEGRA234_RESET_SDMMC1			82U
+#define TEGRA234_RESET_RSVD_83			83U
+#define TEGRA234_RESET_RSVD_84			84U
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_MGBE3_PCS		87U
 #define TEGRA234_RESET_MGBE3_MAC		88U
+#define TEGRA234_RESET_MGBE3_MACSEC		89U
+#define TEGRA234_RESET_MGBE3_MACSEC_SECURE	90U
+#define TEGRA234_RESET_SPI1			91U
+#define TEGRA234_RESET_SPI2			92U
+#define TEGRA234_RESET_SPI3			93U
+#define TEGRA234_RESET_SPI4			94U
+#define TEGRA234_RESET_TACH0			95U
+#define TEGRA234_RESET_TACH1			96U
+#define TEGRA234_RESET_SPI5			97U
+#define TEGRA234_RESET_TSEC			98U
+#define TEGRA234_RESET_UARTI			99U
 #define TEGRA234_RESET_UARTA			100U
-#define TEGRA234_RESET_VIC                      113U
+#define TEGRA234_RESET_UARTB			101U
+#define TEGRA234_RESET_UARTC			102U
+#define TEGRA234_RESET_UARTD			103U
+#define TEGRA234_RESET_UARTE			104U
+#define TEGRA234_RESET_UARTF			105U
+#define TEGRA234_RESET_UARTJ			106U
+#define TEGRA234_RESET_UARTH			107U
+#define TEGRA234_RESET_UFSHC			108U
+#define TEGRA234_RESET_UFSHC_AXI_M		109U
+#define TEGRA234_RESET_UFSHC_LP_SEQ		110U
+#define TEGRA234_RESET_RSVD_111			111U
+#define TEGRA234_RESET_VI			112U
+#define TEGRA234_RESET_VIC			113U
+#define TEGRA234_RESET_XUSB_PADCTL		114U
+#define TEGRA234_RESET_VI2			115U
 #define TEGRA234_RESET_PEX0_CORE_0		116U
 #define TEGRA234_RESET_PEX0_CORE_1		117U
 #define TEGRA234_RESET_PEX0_CORE_2		118U
@@ -65,8 +133,49 @@
 #define TEGRA234_RESET_PEX0_CORE_3_APB		124U
 #define TEGRA234_RESET_PEX0_CORE_4_APB		125U
 #define TEGRA234_RESET_PEX0_COMMON_APB		126U
+#define TEGRA234_RESET_RSVD_127			127U
+#define TEGRA234_RESET_NVHS_UPHY_PLL1		128U
 #define TEGRA234_RESET_PEX1_CORE_5		129U
 #define TEGRA234_RESET_PEX1_CORE_5_APB		130U
+#define TEGRA234_RESET_GBE_UPHY			131U
+#define TEGRA234_RESET_GBE_UPHY_PM		132U
+#define TEGRA234_RESET_NVHS_UPHY		133U
+#define TEGRA234_RESET_NVHS_UPHY_PLL0		134U
+#define TEGRA234_RESET_NVHS_UPHY_L0		135U
+#define TEGRA234_RESET_NVHS_UPHY_L1		136U
+#define TEGRA234_RESET_NVHS_UPHY_L2		137U
+#define TEGRA234_RESET_NVHS_UPHY_L3		138U
+#define TEGRA234_RESET_NVHS_UPHY_L4		139U
+#define TEGRA234_RESET_NVHS_UPHY_L5		140U
+#define TEGRA234_RESET_NVHS_UPHY_L6		141U
+#define TEGRA234_RESET_NVHS_UPHY_L7		142U
+#define TEGRA234_RESET_NVHS_UPHY_PM		143U
+#define TEGRA234_RESET_DMIC5			144U
+#define TEGRA234_RESET_APE			145U
+#define TEGRA234_RESET_PEX_USB_UPHY		146U
+#define TEGRA234_RESET_PEX_USB_UPHY_L0		147U
+#define TEGRA234_RESET_PEX_USB_UPHY_L1		148U
+#define TEGRA234_RESET_PEX_USB_UPHY_L2		149U
+#define TEGRA234_RESET_PEX_USB_UPHY_L3		150U
+#define TEGRA234_RESET_PEX_USB_UPHY_L4		151U
+#define TEGRA234_RESET_PEX_USB_UPHY_L5		152U
+#define TEGRA234_RESET_PEX_USB_UPHY_L6		153U
+#define TEGRA234_RESET_PEX_USB_UPHY_L7		154U
+#define TEGRA234_RESET_PEX_USB_UPHY_PLL0	159U
+#define TEGRA234_RESET_PEX_USB_UPHY_PLL1	160U
+#define TEGRA234_RESET_PEX_USB_UPHY_PLL2	161U
+#define TEGRA234_RESET_PEX_USB_UPHY_PLL3	162U
+#define TEGRA234_RESET_GBE_UPHY_L0		163U
+#define TEGRA234_RESET_GBE_UPHY_L1		164U
+#define TEGRA234_RESET_GBE_UPHY_L2		165U
+#define TEGRA234_RESET_GBE_UPHY_L3		166U
+#define TEGRA234_RESET_GBE_UPHY_L4		167U
+#define TEGRA234_RESET_GBE_UPHY_L5		168U
+#define TEGRA234_RESET_GBE_UPHY_L6		169U
+#define TEGRA234_RESET_GBE_UPHY_L7		170U
+#define TEGRA234_RESET_GBE_UPHY_PLL0		171U
+#define TEGRA234_RESET_GBE_UPHY_PLL1		172U
+#define TEGRA234_RESET_GBE_UPHY_PLL2		173U
 
 /** @} */
 
-- 
2.25.1

