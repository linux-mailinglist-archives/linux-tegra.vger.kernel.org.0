Return-Path: <linux-tegra+bounces-13216-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KICSLt3ew2kgugQAu9opvQ
	(envelope-from <linux-tegra+bounces-13216-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:10:53 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5803332578C
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 14:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BAE030AA7D0
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCD43D7D6A;
	Wed, 25 Mar 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AqU++wDf"
X-Original-To: linux-tegra@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49C3D7D66;
	Wed, 25 Mar 2026 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443485; cv=fail; b=dwfhoBBD5h+awYM0X9vLky/6a7UpySRE1MB8RNVMoSuxkIjUNiFr+c1AGmCN1x16FJO+UVntTGYF0lqROqjBpow9dk8tswyCL+D1bjIg6hUAwT0718Qh2TsbsQxwSZ2p9XBtIcjTBq053+YTXsrp6RL3pdEfD/JJn5MnhjLXDiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443485; c=relaxed/simple;
	bh=m4K2aVk86JOoGh3yGcXyU5LbNodBDUJolDt9YmfX2j0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ta/io8B14CE/NnXEDqEAfFc6IsQE7EpPjzQ8JIDbadFEgwOiHwt0BT7FCqHN+dCi87n3CsrMOJditp3cSwIPWrXJsxWfuf2PPr0XpuZsSH5l6wFiHOfQO9272KhR6xeRFi93+dNRagcUjJVv0a0CCiOVHaKi9eb11KLcrWelfxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AqU++wDf; arc=fail smtp.client-ip=40.107.209.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUdvZnUiK4DKufYF7YZwdHR0/WxNpzlZGj5K1fSAeGspTmlY4ZGWmyT47/+5gz/SN3+UgIruREcCr00DNnmdooBypVnFpiE2A1RblQwpyZ7b7t3BBzeA7FrAoyiDHgWq7e7Aa85eZ0vZBbZmCrNvO1px5laqY4fUw972aHpfSbeNmuFOoyyNk8ds9XsNI2Bw2T9dgFZlT/D9iWa1ZH01tX4FHphnhReZZzLFcZllEA9gfwMZ/QWRYMiXh+YnN8pHSrggJojfQgOzTn8+XvJTpmZGEVkfIYKvlXocOimw/GN3s41Lo58uMGhe0ttLgxeLh6Qkbb4GzXi1PAG+LO9AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLaUEbSNha36vClTGzFCSgpZeGHtp1Jgv6PoRsrNaLU=;
 b=pv+4WALlbI9Ojq7XD8oTZVdSjyaw/PPH71s4D6DaJ+s7nB+LJPGEyciEygPYNNpZJPYvxOj++BJ3tva/N2ilaB2RFn8zfq2KSrlKI+P0EZVJF5X3pmyia8vNl/kXPzP/Yd0DovKWahXYyYihE5vr0eOhXCNau3U/0HydX6F5Rb5UDUcifdQQjmW6Yvh5AyuTfKPXtb022bOZi34wAd6iLOec2Lv44oZbSBIH2S/A9Cq5yaARMVJU8m1XcvuxFBIeswfKsXKvDUS/8lXe+cb3LipPLuE8Xz5xc30Dl5fAXhchQdcfqJTeAZqj6DCMbiqzvyJR+A2AHstpS9ePQbXMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLaUEbSNha36vClTGzFCSgpZeGHtp1Jgv6PoRsrNaLU=;
 b=AqU++wDfRJR32JVTAWV0ab0Rgm+zWQYl2YnDXN+fIAbn+OlCdFSen+9NhbxZrk5vMWE3HggoLlAUMEd559WRZexf8X44T16/qrv/BpP2714dJq4q/ltu5Mn2nRr4/qxKoIadRAXdh09DVuSAQ+L302/7gU/LsPmgJMbMIY0ezRA3F7LtUlQB14mDvGd1TjEYHGLdmtJEFMn18x8HyKf30EkFRXJCaLMvClN61bjXVYDzeL/ravBItlrIMzxrj7HmW5h61iqLaMySXbEJ4XgA+hsn0WAJxoYlImnH0KUan7k8+bFotVbHjwOUxbTCEXc7OIOjlRNb56xrimMgsxp1nQ==
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 12:57:58 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 12:57:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 12:57:58 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:37 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 05:57:36 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 05:57:33 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
Date: Wed, 25 Mar 2026 18:27:25 +0530
Message-ID: <20260325125726.2694144-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325125726.2694144-1-sumitg@nvidia.com>
References: <20260325125726.2694144-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cf9985-412e-4b15-194c-08de8a6e23a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AVKj6rTtN6qpjGHnRir/uJgL5HQCJL4Tw0AU2c/0fbjpaUYr/eTopus/h2sb0+ApvOz1ZW16EmYEijO18yIeMdgTpT6JLGAsObVKXz33jt6qUefHWgl5wnQ+Tb6OYdg53+cMpPRKJ9v7dIHkfj5xZ2d88+kFUPjLW5CTiEZEjmCziKaQ1eaDj0T3V8Vd3MRHmNLHMGg992vxY/POiLnIgPsCrVkzApa3jL25sDKheHBZ0xZw9emO4v3t5p2EPywxBPmLag8+iTFKO9KamKFmcr55BJOO4lGKqccpI8VpZ32VR/9cM7AD1b9vyXZvsVKyduFhU/Tq/oRnrCJpKs2Y9n7XndKuLBoYtq71bRp9odQVXMA9/BK8Ost1xQakpIKh+9BN6ULxPQa7eXAIzycsrSGSmao9aCdO9WxN4HJq9/xsH28TfbKmmEfmtrrWTavUwhTa/xY6xNo2Lr4SvybgogoSW7CBNqh0XXbqvMQOdjcIXSacMAvOk7ps7OzHtj4LS8FlozHowCPrekVWCkxiuN6U4AhCkge9oEp/mNF9fkY3wqLqTNKGCtrRBqzrZk6KbO8zWqlpmCU4K1w7JTnwo7JVVw8xDysPELkdwUwpOz3yJXpegEqtrjOFL6v1MyyD7NSClZ22EG79QY/TY4QC3vQrdqdLr66LYAmvyIt5FRsy3mqEMlAOKR6IEIHy5JR9riLTZ2H7nC2dX8hWeJAqVU3Paig9XGRRB7bgaVpU5lxGDIuboxbLKBeVVLFnYoc2wpSe7MJrh5MUqzvdfaFu2g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/mWRR1ekBDnaJXP+XVSJlU6buPZqF1s/D3kRlAWQtxgnN1Vo3itbI9q7ikyyh57/LY3oBUp8Jd77BVCi7/5M1V68vZJtbVEl24mWIbB/FhRuMI7pxCVxDa3cVngrCboMinXyng8mv1mKUjd/3MZiK+LM9+/kyNKpXi7MmXiIU+EJDlbJctsxDoZ6GsABwBDOIWbWo05TVFDu7pXIt66i+VrLRdSzSb/GK9hxiF/8TcL7sKGOa93fLYS4JB4tMKAdizQxUqHAuD863I3E7OGE+Ra7CB8mXJKtFW9W+nseEy/bEqyD5pdLg2tEY+6bJ8Uq2qVXIHBQWcNOWzvmOW0B4C/AohY/cXPXUMWDRVpzZgw1ebNs7QrY+3e7EekkOVS+xQouArBFiTFuLQd9pJrVqH7gJopncabt4UJYAchKvyWs++YvGUMRlnTf566e7Boa
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:57:58.1432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cf9985-412e-4b15-194c-08de8a6e23a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_FROM(0.00)[bounces-13216-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumitg@nvidia.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5803332578C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible strings for CBB v2.0 based fabrics in Tegra238:
- nvidia,tegra238-ape-fabric
- nvidia,tegra238-aon-fabric
- nvidia,tegra238-bpmp-fabric
- nvidia,tegra238-cbb-fabric

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
index fcdf03131323..e69ee6a48fcc 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
@@ -48,6 +48,10 @@ properties:
       - nvidia,tegra234-dce-fabric
       - nvidia,tegra234-rce-fabric
       - nvidia,tegra234-sce-fabric
+      - nvidia,tegra238-ape-fabric
+      - nvidia,tegra238-aon-fabric
+      - nvidia,tegra238-bpmp-fabric
+      - nvidia,tegra238-cbb-fabric
 
   reg:
     maxItems: 1
-- 
2.34.1


