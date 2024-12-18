Return-Path: <linux-tegra+bounces-4401-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 352879F85E8
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2024 21:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05134188D1F3
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2024 20:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2131BEF7A;
	Thu, 19 Dec 2024 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W8M9MkGD"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9381BD9EA;
	Thu, 19 Dec 2024 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640207; cv=fail; b=Z0XmC/1ZzhxoWNQ1xWxVYAWvhtbSKiAPN4se15KmkVcUrREU3Osbeisf1AWqAbUngD7fkyGmo12uTRAAmZkYe/IpbCpOsQu0Hf+pDYtKLa8gyGRNk3ZHeeDrttUMwJJzLrA3xwIAYP4RaPqScjRzKVFKX+c4WdNm0zWA+sCgXAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640207; c=relaxed/simple;
	bh=fOhbpP1/tc4SRD7i7RZfF8K46Ryha0riJk5RBE6w6g4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Er6xDb1+xjUQrmyyjfA/8omnnjEM1htcjsPJXInEzaDkJoUHI9DYx6QZvHyWNVA48uTememRu1lNn458DOhoZ6qUT4G3VyIsdNOqe3TFO35S0iD2accLDTVG7XATlP/541Lfy4u8n+rWF3W9QUYAoY/EllRv7tRxDQanzN/ujlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W8M9MkGD; arc=fail smtp.client-ip=40.107.96.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=si0bu/QGzA8a8gOI3FXEKOC7nPDKpW6dtuzcAXdSlCFBLQB2LdP02SFTWZZieDvVAj44wg1+OfZfqFFahzUrldNs3cUMs7gTBNynCiaSoTDfzYdfNgzCLvUr+4CY58lgTs8cx/VGDbde3jqykRMjBwDS6E5ZlFpV9ZuLjehZdQ0UFSOkLtAz/kAS68sr3odX5dp4ts9OpKCgQnDt2kMq+95CRo0AwZ9QhX1ZP1GlA26UqeHO5Ot56eM1g4ZVgYExBBZAbv4k+5SRkKHaru+MKFm1i8iE+oUTUcO9yzbIQNr8Oo/0+EG/Q5JrcSf6ae+PUBGJxNFS5mPwS7gn7OPOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcyYVflmvIcydho0Bpw2JCp0m/+gSUoMdA71/ITOJto=;
 b=OoEmpmE6noEfvmWiyEuBZBc9QTz5DP+TuIweotXkL764Zr1DkFgu+IZO6Dw4inBfchYE4u6oBqirEmxFZuPRTBZEzSqGiZzCntQHLwToTnjsZDbsRvvXPLjSVfnLthPd7jArnxiX7S8+r1CfBASSc+19oplk1U4kIzEIRBlOzj67/3VO1HE3VOA5m1UmEDr/oixgyrPrXk9EcWb+vw5mZozlENsi6dpLMPjcm8vcYhv3hhnKct9KFKCspAoVoV2/EZuDTBXDAPM8PZCF29DomFyuYxyhi+WYrEfXBi6npRJa7EBRQpHUFyJoav4cyBoSuXe3ZZ6MrSRAbQwduOYJcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcyYVflmvIcydho0Bpw2JCp0m/+gSUoMdA71/ITOJto=;
 b=W8M9MkGDWvpqn/fCyaGQR5LnBOxPLCHJPjHG2p8pDctIRQz17c2BWu+diKaT2PnmBJn9YxGF7FniwsEe+nVuKpAMo5qXuf8mx1WKTTT2neEKBnMxDoO1OekAT+1KHDcGChw3BEhf+RgFJ+LPgWIWqlDfrXhYhWL0JrhMahK2zSFAoutmb3xKBO4ipHhaVYM3lpO6stAn84D+kWe+T/KwW+TE0zTCoO6xth73GmNZLqkiUfhV0qh/kbQwhZBBhEJptxsJjlbc9B+hSTHceX81nIMKq7tkkQMoNrDTclhewD86xs4CYhRngneX3c8ko969TQ2KZTLQc0LRp/Nf+kOkCQ==
Received: from DM6PR06CA0042.namprd06.prod.outlook.com (2603:10b6:5:54::19) by
 DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Thu, 19 Dec 2024 20:29:58 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:54:cafe::87) by DM6PR06CA0042.outlook.office365.com
 (2603:10b6:5:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Thu,
 19 Dec 2024 20:29:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 20:29:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 19 Dec
 2024 12:29:51 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 19 Dec 2024 12:29:50 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 19 Dec 2024 12:29:50 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <krzk@kernel.org>
CC: <airlied@gmail.com>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <johnliu@nvidia.com>,
	<jonathanh@nvidia.com>, <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<luca.ceresoli@bootlin.com>, <maarten.lankhorst@linux.intel.com>,
	<mperttunen@nvidia.com>, <mripard@kernel.org>, <robh@kernel.org>,
	<simona@ffwll.ch>, <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
	<tzimmermann@suse.de>
Subject: Re: [PATCH v1 3/5] gpu: host1x: Support device monitoring with actmon
Date: Thu, 19 Dec 2024 12:29:50 -0800
Message-ID: <20241219202950.15277-1-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b7bd87f8-d651-4d27-bfc7-040a5192f285@kernel.org>
References: <b7bd87f8-d651-4d27-bfc7-040a5192f285@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS0PR12MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd79c81-8609-4309-ad67-08dd206be7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gnptGi9EX5OiR1cOA+4hoeUijNi3JzdX93km52U1idoU/kYBpz+49lNZieEw?=
 =?us-ascii?Q?/U5/r+Mmy54eKpsGfwfW84j13zIGMiGfxdIsZk5jlCh6z3FztYWkHB6JFMA0?=
 =?us-ascii?Q?Iu5Sd13vTDReFrVYfULcy/JeYUpr3njM2dP3Uf26quDK0+qjlN/45py+Fv6T?=
 =?us-ascii?Q?Pag+K4DiTWo7lAi5bAL0cXOVFAdfBHUrLMmbh/QbFWEjGpuIQMCmXSqzxRcd?=
 =?us-ascii?Q?rDb/4Cmi+TXYQSptCtM7Ya34FddxSVDVk5pp4MMU3y8MjjBUl4WpjixywUSg?=
 =?us-ascii?Q?Ew730X59Ii/Ic5QGWyLLlx5ZAeW0a2XjarPMEzRJRKh5x1fd4DgNDOsWF/P+?=
 =?us-ascii?Q?aKgpMqB6JAOO9EFcr6smDw4zgysGZ7KfknE3U1Mr7rTkAazEf/c0bdz3pQua?=
 =?us-ascii?Q?0jDN+58+tZ/zcvkggFvohhHtlh8CLPhd1KHnEuBUd1iZbXtuHAWdMSALu3by?=
 =?us-ascii?Q?mlIhqDCXQc8ikd880Az4znpVrXPBdnotNRYfKZaMyWrmCMZGV4XUpSrtR/Tk?=
 =?us-ascii?Q?drfOE4cd10JQtNCzYm3+uicVwXvW2Wglmxc5nwglHQC2KA1/dwSoZmQm95AL?=
 =?us-ascii?Q?KIe99vFJYsdAJo3gcWUxaerItnPf42OSJsP8Dgdnx4NfkozEPvXZbXXhKxfO?=
 =?us-ascii?Q?CaHQLgOGkCeYcAa8qhs6UBL++C5f8dt5DH6zBkOBQJYeYJmDeZI8XCFlZPqs?=
 =?us-ascii?Q?uyfiKPLbPygMUtkZ4BjTjswtO68gyfFAvdha7h/r/IIqSY1/rnssS6KYnoyx?=
 =?us-ascii?Q?Iz7BartjL4Px4H+OWm7JAZchzSfhPjz51b0rMsVj7A/0qiwgmi+TPynhW5ha?=
 =?us-ascii?Q?zmvs0oGX/yblz4fbV9WDVMw+DxkipgA7kP+lu1djS3HSLQixc9wj12z3Ext6?=
 =?us-ascii?Q?feOLBpOg9Gr9opCB170oQ/1GNi0KnOkIwa5tn+alIKAHqmYk/AOZxsgcjJrn?=
 =?us-ascii?Q?9aHx86HLiNpAMcEQJY4SlUrMGSDGW1FMmXzekupkc4HPcrpfvOzQl+A82dXu?=
 =?us-ascii?Q?ocDFHeQ24ycwRm59T/JDt3jK1VOQ4SKKFThE40V1SFDdOl+bbA7CUkNA2gIw?=
 =?us-ascii?Q?HFfPJN1k8KUzBiABSrPYsbMTGT/XbzsGklaU2/WF3a/51I57sYqI/yIp9hEt?=
 =?us-ascii?Q?iX0VP1M8eSFmXbpJzIL1rkKeigtywUN30fccuGjkG8nK6pCcWk7dvFepUGMA?=
 =?us-ascii?Q?dtdD1EMN+P0HnbvObp0QFy4NTy+AyLFp+4LS6J+VhPv4xwIAyk3Hv8LOhlJW?=
 =?us-ascii?Q?e0Cjh7EclK9EPrnr0tHbzHIJMIvjSUb+keQq+6alCrlWJxmHa7u4P2/1H4IL?=
 =?us-ascii?Q?cxZ8aUdn7kMs05JpAKKkujEUpX5blaJTkanFjkGgDgyo6yhMxCDWGV+Rg0fZ?=
 =?us-ascii?Q?EKR4l4jLo0Bj+xoFOGi5TfJO5EQ7N+1z52cAjBbb8fRpaeLAeCCgVj0ig55h?=
 =?us-ascii?Q?h4qThSvAEGN+UYWr6CO0Z4LQ3PJlKYjbkL476HwJI+nNyMd0ZZnfXqd7y195?=
 =?us-ascii?Q?p3dThTA/GXfpWZs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:29:58.1005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd79c81-8609-4309-ad67-08dd206be7fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535

> On 10/12/2024 18:45, Johnny Liu wrote:
>
> > +
> > +static int host1x_actmon_sample_period_set(void *data, u64 val)
> > +{
> > +	struct host1x_actmon *actmon = (struct host1x_actmon *)data;
> > +
> > +	actmon->usecs_per_sample = (u32)val;
> > +	host1x_actmon_update_sample_period(actmon);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_sample_period_fops,
> > +			host1x_actmon_sample_period_get,
> > +		host1x_actmon_sample_period_set,
> > +		"%lld\n");
> > +
> > +/**
> > + * host1x_actmon_debug_init - Initialize actmon debugfs
>
>
> No, debugfs is only for debugging, not for usual interfaces. You now
> added several driver knobs bypassing any ABI documentation.

Thank you for pointing out the issue. I will expose these control
interfaces under sysfs, probably hwmon, in the next patch series.

> > + * @actmon: the actmon instance being configured
> > + * @name: an unique name of the actmon
> > + *
> > + * There are multiple modules available inside the actmon, and they perform the
> > + * signal sampling at the same rate. The debugfs of an actmon will expose this
> > + * shared configuration, sample_period, via a debugfs node:
> > + * - sample_period:
> > + *   Sampling period in micro-second of modules inside the actmon
> > + */
> > +static void host1x_actmon_debug_init(struct host1x_actmon *actmon, const char *name)
> > +{
> > +	struct host1x *host = dev_get_drvdata(actmon->client->host->parent);
> > +
> > +	if (!host->debugfs) {
> > +		dev_warn(host->dev, "debugfs is unavailable\n");
> > +		return;
> > +	}
> > +
> > +	if (!host->actmon_debugfs)
> > +		host->actmon_debugfs = debugfs_create_dir("actmon", host->debugfs);
> > +
> > +	actmon->debugfs = debugfs_create_dir(name, host->actmon_debugfs);
> > +
> > +	/* R/W files */
> > +	debugfs_create_file("sample_period", 0644, actmon->debugfs, actmon,
> > +			    &host1x_actmon_sample_period_fops);
> > +}
> > +

Thanks,
Johnny

