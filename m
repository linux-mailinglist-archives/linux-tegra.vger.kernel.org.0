Return-Path: <linux-tegra+bounces-12427-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAUpA+AFp2k7bgAAu9opvQ
	(envelope-from <linux-tegra+bounces-12427-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 17:01:36 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E61F323A
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 17:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D03FE3008092
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 16:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A00748C41C;
	Tue,  3 Mar 2026 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gs7/5fm5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0937B035;
	Tue,  3 Mar 2026 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553638; cv=fail; b=j0glQIJCMqaH/5h0jRN7/YrYAOTFcBQWvn92An+ZlPHjGnvJIr/06WY2Svz9/9mrMzht0W3NfehAG6mnoW3ZBnqkTTNxxvwQvyAGICCgfeNKqqo0KGnY4lKFHxe3Mm75Vv/SSbuDR8zOeV9X7uYJIcirB28aa5p5FxyTlgYKfjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553638; c=relaxed/simple;
	bh=m4K2aVk86JOoGh3yGcXyU5LbNodBDUJolDt9YmfX2j0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WJCqKJmdq7rpz9W2lfkxGCpjOfSRSvs4miEis0dbKob9Ev6+Oog35szsJKNCDQ3pWkmY96cZ7siu4HzUZiUhkjJ73MttKD5hGa0ww5+ZWCrg57J1VO5rG8tGnrqd7NPe07C62RdZPt/ReslWLfB09QBMfNmwsTJM3M72Jkl4Poc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gs7/5fm5; arc=fail smtp.client-ip=52.101.61.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOHx4xjag/FWrg8dpgPbZwJCHWW9w6JQ2SN5+1cRRZUAsOP61GGnxiDdBg5fQHyl+VWLCWUKkdQCEZSW9fJFgsJzYO+/KjcamBi6bD1LD25vD+nbGMBDH6eM60GmXVwpPylJfJA8q5LKdijg0m+F9q9p8Vyne9+V9nNqXLg5RP9jzjjEQ3XkvUE1QLw9pprdd7kv3Ekk+KISO5gvFUWPuAb2vGMPgJQ/dMygvt1WuLaybLuWH4RP4RoE9cwUXTFPRIQAZ1ChSImzO+M92ad0tnNhsplTQQM3tqFu4ycFaVfgduf2kIiW+0TyOLUkD36dPk6MGIEbp2QGIONMu6az7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLaUEbSNha36vClTGzFCSgpZeGHtp1Jgv6PoRsrNaLU=;
 b=AbtQEaF6bsvo9n0Rx2oyzYKHfRq0n7JdN3EzfplM2HiZy8ukQBTbrCRl748klALLLI70wewqmZ7WmUS40mmFR3RMf3cE8a2XmZRF8qXguBLlo0dS/bqCQkqlH9XEwJsMqPYtKZX6EM1V8Jf5sPT4RCkpTru6bsQCqXnffeTiS31OIIsNkInlW2rAwLhu05BUnW8eKm7z8b735ndHo1U9OBuTECVEKPE1L1bwVvuLKjuZnrUdAMGXGSLFo4BXBhJdEjbvn7IQGVUjGKM6VpL/VfMnXJ2yEqS7yVmGjKSagnYM02b7LXz7nb7w6SenMPy7P1+V3RVSctNlZx/riNKixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLaUEbSNha36vClTGzFCSgpZeGHtp1Jgv6PoRsrNaLU=;
 b=Gs7/5fm5Pf7yCZEZCa9BeGDaujuyUUa43H1GaO+LX+TYffiCwS8ZeX9isr1qjQSo9fXyx2bri1B+EE7HPOU0lmUy06BRqJvW4+v5X7Ywb7fhTxn5ZYTykLxg2ZDtR2WCaTDckCesSR09s38YBYUMH3eFOQgko5eG50vYgF/dlSYYICebfMXlqOiJGStxFr/zz2yecPx1Q/a3JPWRy2vn3eZy5ZCpbsJjF+Vj0Adt+amNBuP+NF++99Q7NPytgZAFFIqieokfldOlWy15ovk6HGu6eWDRGXh9hTbRhI+zqlPCeesSyFnWVyi5tlg4JpoyLV3Y+IaTkJGRpyuFt9TzLA==
Received: from CH5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:1f1::10)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:00:31 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::45) by CH5PR03CA0020.outlook.office365.com
 (2603:10b6:610:1f1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:00:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 3 Mar 2026 16:00:31 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:10 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:09 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:00:08 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
Date: Tue, 3 Mar 2026 21:29:26 +0530
Message-ID: <20260303155927.1885297-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303155927.1885297-1-sumitg@nvidia.com>
References: <20260303155927.1885297-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: e3207c8a-8a30-4426-d2aa-08de793dff4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	gbVUttegm6i5aUdHKg1vteTibaXz/plfoJWQYPiSn2XqXCP40V/X+Oh99jPNdEtK/y6+PuWzzIq8td1KH/F8bsL1o1wsltGtnX3kYWJfqj491LJf0zISRmVp2P4WzT93chjkP2UgtZNYtZDeAJai8FA0YFK7TJ5nvJPEjXg+bExpDPiLxt1BBe4g46f51ZIrogET1qL/QySXiDmAXH59ksqX87zYXwP8RJgmggwNWXAvc7nztDOc/9NPAV3KSGvUgT+pE7qr9BB17S1jPPWDOwR6f4Y5Q1ZV39blpLjxd2BEZtJuNDGjdgH0G+ncDLSUpaPOFIVIlr1LeikwE+DNyqeEraA9hL1kkKvTTPa33jyxojtxiSbnmH7bKfHBjy/Ial3lpBUCzDpdp9Y6pd4d+FlqL+bCrqXrVftiI25aignTUzKDD4LyecJBJQU31AUtf+FYgu3EiGdw+aIQ/39EmdcYuwO1XsPksxu+OtSgcnKic4ehxGltV+q6a3QKjLtBOZmmov65Na8Uw7TGDc8OJ/NtjynxT+hrcdI8tMhwYwldC3mgam1CliFFrzPJ7jbEwuD5oGjQr6P13VqPt+SA3lgZ28QXKMr6alOM+kx0JZxsnE9/DSsZY1VVioTFaA1aeZSaSozmxeg4IbJ8wqUp1K8FFPbAJAe9oSP8os9cZ4kYORfoOPkswTxHxsbQFXFNcySc7RML6bv4YeskH0PP7o/301PQR2buMTgSRsF0b/b4LU+dKu7BScK8OoCLtSs3F56bUR/NCHhZD9uTMa1WRtRPAjVizV+JNAY7BYDNfF2ciT993MV4LEwVzz9FMKBvMB0utce9txB2Hhs9C2qE6A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+9Tn2TUR+fxkJuF2GVW9rad9k2LvXKecJjH9PLIcqiWMv5pm/J2u/Npu5zXx9tG1OQbvQ8MV85Ilg6/OWjBYWzCwtNmep1Q2y3ZxOYSzBkjcvhtnMHKYxTDFkLzhgcVOj5CZRszcZ2ts13jQaH4T6XgYgDqQpH2lyr88dSFW5axqzprdEuMx0JaX7F6Ei1ViSsjNo/lVovBeUBtgBQ/9Vswgs0WH39u9/v9kJM9Vmc1Tfkl24wGvrn7oYsUwqmtgaSn6jy0OWnCemFkjAY8GIVOvSGoTzWui3s89dcUM04cul/rbcvsbwGfYd8cA4QcxvaFdckgcKZyPgAVnYr3GmfKugJuRmhFPgtJFOYxZi1DxnzEosC2ic/2BqXrFlOC1lwYbyrXBaOVkIvajuRUqcrSHJsRbtJamLrfofFdcvGWwEmfxls32TGsF6N53WHO9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:00:31.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3207c8a-8a30-4426-d2aa-08de793dff4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595
X-Rspamd-Queue-Id: 448E61F323A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12427-lists,linux-tegra=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[nvidia.com:query timed out];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumitg@nvidia.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

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


