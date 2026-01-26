Return-Path: <linux-tegra+bounces-11602-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAPJOaaud2ngkAEAu9opvQ
	(envelope-from <linux-tegra+bounces-11602-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 19:12:54 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB58BF1E
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 19:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F83301C927
	for <lists+linux-tegra@lfdr.de>; Mon, 26 Jan 2026 18:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B3E34D90B;
	Mon, 26 Jan 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GkJ9hzcO"
X-Original-To: linux-tegra@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3934D901;
	Mon, 26 Jan 2026 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451162; cv=fail; b=e9f/0Ju3mcBJM2jCLmNnu3flTaSThlECBf5BMqLBZacYN6vFdjWfT5jjqflreukhAh9NAJNgw4qJJq0YxaC8DVTYrcKHPyIutczMjXwMc8n+GQ8uGTjQikZLLaxrIS06DEEK5/mLVKF8oHtmymDfBtGLXbHGIs5DczCeOZ3rLE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451162; c=relaxed/simple;
	bh=UXwU4I8BwVLGzKQFj8FXLfqaphtR7jI3z1WC2JR4BJw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZKMbPPgqQWAV7SqJ/dT3nI0/WPZWXfxiUvQ8UlyZVOJbVJO/CMC0+Xir9Sbdly+coXLmO3BcQ2wz3rsFXJn1FFiHspmGLchvymrw6RShLGM7p0Ym3uWQue9JJxKm2KWSZQ94XAPNM3cssB4DYqUf9jJXQxYdLkQlu+bvn5PUd8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GkJ9hzcO; arc=fail smtp.client-ip=52.101.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdCCMHmsibfdPE3lUgrHzQEODAkW95gHqAxVBWXkJDhnC6X/rbmlG8tBVxp5gFCylQ8POlPZPfeMRh3kWTO1/Tzc62VqGaF0zfHr7HteMruKZXUpIUPWcW0Ok3YYjfWE5nqk0XrcJJtryDNlyW7YRX1ofKOEgty529dTCqmjCBq/bL9z5UUl7ysPAZ0lX6ONWDPP8VCCX3xHF1LZpzy4RW9OnX1qFqro1BOQdP1EOx8Zf5SXAoFJM7T4/BbZcFuNMcqezZYo+9ZQP1BNrfjP//HfFoW/LetFjTwXNl4VjbmyLH/JAf8igbAz8ycEi6bvoiAr4T//5GeriiSsLs+ugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhEuAZMR5UDGow0z2dsH6PsRMXDGpCka9sRzAIIM/FQ=;
 b=e2AQ7gpQ1PPKxvH7aCxIWvSeNqaPAoO3Kg3JnAHJGjkmqdDcUugOXEqGy9fPuzp/QOGD/KDxfBqAlHTAXuMaWyohCYU+DhtpZLR4/QE99FPPgudmzzdpE5QyRmhN4S7qWcC+tteZgxvR+L7w0YwtlmNWED1x8mYcJv2TNihpwLuAdXzO3HofhDlf3tMV3JTTe4Sv2hzyZ3FxsVr0Tbp4/eo4LhbHREz7MaEE/08tKvyYg0ckx9QpJ7Ff3qwLwshL8SnjjeaIXhD4zjdulwdYzjT+Z5ZLZV4PphP25GKK0eMzhpOwDcD+psy3aZTUYWHtV/cv4PHZAwcEN8rwccye+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhEuAZMR5UDGow0z2dsH6PsRMXDGpCka9sRzAIIM/FQ=;
 b=GkJ9hzcOyLeE05aHXXctYgVXep/OYb8704LOpZdKsSSlRBTmNwziLf7KLbjo75IVBkCI5mt1Wpw3WxCU4SMkLtN29qILC98ohFiq59RLfVzzY/qWfmEqrYWH8UeOKuMXXtXfCx5QwORstuxE8f29ZDGGnM0lpJuOy5sgZH1vo9aFT67HiKv0X0ln0fy8PsJKQBUmwsUynv25qtoUsfGSCyiV/CYJE2/RxnxeLT9lwUMdiUMFZ953GBGdJ7cDkh4LK08+nXIOAyjCL5ey756+WKI0t+6kBztYNvGPbITF/7wZB6ilBeaIp3YrOg6gLEPNgIH1dgqqi9heDz+G2zk9kg==
Received: from BN9PR03CA0595.namprd03.prod.outlook.com (2603:10b6:408:10d::30)
 by CH1PR12MB9621.namprd12.prod.outlook.com (2603:10b6:610:2b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 18:12:35 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::59) by BN9PR03CA0595.outlook.office365.com
 (2603:10b6:408:10d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 18:12:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:12:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:21 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:21 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:20 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 0/8] perf: add NVIDIA Tegra410 Uncore PMU support
Date: Mon, 26 Jan 2026 18:11:47 +0000
Message-ID: <20260126181155.2776097-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CH1PR12MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c6a6d1-ff54-4c1a-8285-08de5d067a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abvHa7OCNhPpF2CctZcpgkyKcDOWucXcDhOwHx7qDdDpCi8hkkuKvukm8/zT?=
 =?us-ascii?Q?amokCRkySM2rf0LYUIbuz1JJz0hfOa+olhyVyiRRFmK4XbrdubpXbv8Es0ps?=
 =?us-ascii?Q?5HQUmFO2WFI0thk7DrqhRxvNsRxfd+7mJMIX8dxbR0mIW6IJqr9NjLJM4Zzl?=
 =?us-ascii?Q?QMMlBFzcG8vOmynzC9EaUwiafXEq+wbjasf/xaK2q357bSdTv/aiIRdAtvwd?=
 =?us-ascii?Q?5atfGKfUCT3puMf8AoXipMeHIzNQXVsmtuP25uCsgLQWYU8q5saFf6Mw0iVQ?=
 =?us-ascii?Q?SVlQ/NBcVkPkfKQzVF/55LWtN+C8jqwlBwkDtsuNfeoYrVUpkKcDkPP7Miih?=
 =?us-ascii?Q?7EqWRl72QAnSaZ6P+V38RBign++AtX5lMkWHV9GKKe93exE+imkLtvFztCnZ?=
 =?us-ascii?Q?I9zVu7neT4r0Aw1ouyQka82e48QpnzTT5OBwYfoTV9dp/8Yd6dbF7gThSW88?=
 =?us-ascii?Q?A9q4c8TgWH0TvoEMs6fcDeaGq+TomYDmcF2iXSGdmjM72v2Ikw4+daoJAKlH?=
 =?us-ascii?Q?+KLgpZYsVuGypufz+rPwYRR/5Ntl08l+szpMgCFOBiAMDD3dgTkpSm1Ti8lQ?=
 =?us-ascii?Q?mjgE6OBs9zzjIVFWwpFCt4Uk52SA/p6owCi46Ds2lp2W1MPZEFuGoNd1VbZJ?=
 =?us-ascii?Q?n5Q6+eTO3bRHWoMxPAx7gqoQuiRIJC5zx1dtY1bqu7EHJ/ZhDlI6mSiQd52R?=
 =?us-ascii?Q?eGuzsYSRz4DVqTbl1akQ23z3Qkj8nV+LuNhnY7VUXAQ8cNJgSj+RCKpG1YHZ?=
 =?us-ascii?Q?DN4KiiR3H05R6IFllib18cMGS0nY3qAwpjfDf3mi+9cdEMSnHqI1nLgGrIzQ?=
 =?us-ascii?Q?9s6WuVb8381WTA174wUTZVHaUTG7PIv5Qd+bkZxuD4X0uoHjCJSgebiapcUu?=
 =?us-ascii?Q?IWhgQnsS50jZjkzqA6H0FA/Nr4U9n+hAAZ8oS5yEF7e5RexJcUY5IvnHLJju?=
 =?us-ascii?Q?mXc+jN8C3OG21WIAdQNrIqUv25JFYyHn6uhHnjLuF1DvcxQi7max2FTILp/A?=
 =?us-ascii?Q?e15AUzSg2sdUsGhyXF2j6/e1pVHrf8QocHI7kIKNU82SWv8Cy6rZiJzxEzAP?=
 =?us-ascii?Q?AC7lQp1nPdDPKO4DyqwIAucRszexvtjVmQrJ+95ayCfAPhKfGU3KtfMaVucO?=
 =?us-ascii?Q?KIdBeRJo4wXPO1k6RSNHkbUYq1Rr+eqUVdFs4hlWftUSL7z1ZxvQZVyWryGu?=
 =?us-ascii?Q?ofqyIasJ3z6WvN/fM8EnCKV2wfKtl4mbjT0VPE0eV9nSPD1c5JMLLsCjOoHj?=
 =?us-ascii?Q?B1E0NpR7cY8hh+gG+X+Pnknhu+FuiXNcNKuJnqHgXpTf14g92N7odnrpyeod?=
 =?us-ascii?Q?lGkZw3vTJbYvyfedDK8qv5LjatrGnKKI/ffyPAaLJAMSsCF50LrUB7CU1QmI?=
 =?us-ascii?Q?xbr6ZesbOi8evwm0rWGek05mQwBjx8n5XfCP3WVgSoJHY1dmJtIih2frGNng?=
 =?us-ascii?Q?JnmqftGaCfFybsLqFhrMMj27Wpwianh4G2kPwDbqXGF8vrIBvTKyA2O/5TQV?=
 =?us-ascii?Q?RSaFuYQiHP9T8h3COFJYB9GYxEa/CdU2V45DwGDDCHsOuN/ICC/7nCcHWBGA?=
 =?us-ascii?Q?Ku5VFE9GzcjipsAWTM0uB4pEj7j7tMlajLZLM8jkch7HPwZ+F2mXJAFQnFQq?=
 =?us-ascii?Q?jttNGqLhETda6q0OkIjQWkMujpHkaKqfeEjfbwWuVWE24wOrrc4CdtnsYyxd?=
 =?us-ascii?Q?G9Q3Qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:12:33.5233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c6a6d1-ff54-4c1a-8285-08de5d067a57
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9621
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11602-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bwicaksono@nvidia.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:mid];
	TAGGED_RCPT(0.00)[linux-tegra];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 69CB58BF1E
X-Rspamd-Action: no action

This series adds driver support for the following Uncore PMUs in
NVIDIA Tegra410 SoC:
  - Unified Coherence Fabric (UCF)
  - PCIE
  - PCIE-TGT
  - CPU Memory (CMEM) Latency
  - NVLink-C2C
  - NV-CLink
  - NV-DLink

Thanks,
Besar

Besar Wicaksono (8):
  perf/arm_cspmu: nvidia: Rename doc to Tegra241
  perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
  perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
  perf: add NVIDIA Tegra410 CPU Memory Latency PMU
  perf: add NVIDIA Tegra410 C2C PMU
  arm64: defconfig: Enable NVIDIA TEGRA410 PMU

 Documentation/admin-guide/perf/index.rst      |    3 +-
 ...nvidia-pmu.rst => nvidia-tegra241-pmu.rst} |    8 +-
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  520 ++++++++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/perf/Kconfig                          |   14 +
 drivers/perf/Makefile                         |    2 +
 drivers/perf/arm_cspmu/arm_cspmu.c            |   24 +-
 drivers/perf/arm_cspmu/arm_cspmu.h            |   17 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  622 +++++++++-
 drivers/perf/nvidia_t410_c2c_pmu.c            | 1061 +++++++++++++++++
 drivers/perf/nvidia_t410_cmem_latency_pmu.c   |  727 +++++++++++
 11 files changed, 2990 insertions(+), 10 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)
 create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
 create mode 100644 drivers/perf/nvidia_t410_c2c_pmu.c
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c

-- 
2.43.0


