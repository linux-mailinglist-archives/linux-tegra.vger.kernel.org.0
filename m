Return-Path: <linux-tegra+bounces-5789-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87AA7D9A4
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Apr 2025 11:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE685188A1B0
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Apr 2025 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA19227E93;
	Mon,  7 Apr 2025 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Beio4NFe"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6797C221F3B;
	Mon,  7 Apr 2025 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018078; cv=fail; b=nShKDPYdUd7+OvBsAKGn2jmkrQ98rLort8eH0X64j2xaT0okouoIIMaYzKBCufBg7vSLg7cFE9iGRvlC3SXq8TQeO3ujYhnE0x2iVnepdNHo1Ai+xymutKr5h2a2viRSAcXetGxFMBB6tEIm7xApGGDP+9k2POAHFwLm7eQOdfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018078; c=relaxed/simple;
	bh=qTzBNzyAK7U/413q/Ke9/hb7xbk85iTKunsDSrXSk2o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jiW1n6nh7qgcJ3Uz4L9wm4OOhKuudYgjp4YUxIDrbVRCEIWT5aWk7H4N9kOTErPbv6lPdfiUVv0TXFCyelhIz0SaHM4I9qCyawjXSvzy+35OY3xlGE1SvnJpjROjukEqb1p2LcITYf90rumNgT2bRAHXmPwWpAwh+hRYSpSBARs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Beio4NFe; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygX07TTz2XRYZuUUzjtx486VipESg6qEzsuK0Y7cgBmIAL78AallmuyyXy3IOcNQ1JUbYq/b8BK8Z3DyIgEmQYG1Lp57jONDavSIPD9RQlblLZnHk3Seson0zhJv9sSqIlMYz4LWpGuYC3UIqr0Ew/hnpJ/zd0bRp3CRM2PFLPkc6YmstPYnaZhSVRmH/P5Np2Hnq6P8ahdxWHAH/z4d8/jS9lXNsq8+KEn2H4yAzFPDUMTY4FGWj2SMirdQvf0IrJRjcISTGA2JNcHPAo9ZmNIxj1Nd98qbdLH59jZs6xSiVOyIM1kLl11sqfMmTSLCBO/WbxAHzMJdElnyZuycBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTzBNzyAK7U/413q/Ke9/hb7xbk85iTKunsDSrXSk2o=;
 b=EOJ76oujjojHmtv57x1TikAPPXh05wiy3Aw/pXXKrYVT84l0ru7L8a3P73DVyt1HoVQGbY7iCm4Nbz76iG3Wwz/DsCHLXx4ETTg0rEPb9Fk2NB8ggpZVYRWcriZ8rO4kL1dRdcy7/UD7EdivqgCdNdEyvGRXkuveDQRYLe2XfRgkwwVMTyxkexL6R7DW4/aVbcpkn8opMSbrz/ZM/VZ424s7X56VmJF9vPzsbCBLN/WB9g4/YNxcJEdJVAWZkAGjHe4aAnKy8I/0HWYpC21b4imm4DlwZC7qD2cB+2Si8Xw4N5Z37kspMHf+Efm9F3gttvoyl4M+ocWEUg1fh+a0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTzBNzyAK7U/413q/Ke9/hb7xbk85iTKunsDSrXSk2o=;
 b=Beio4NFexooW6T/kxuWupkVi5YsczjvOxiyUJBeY8WezVm9R4/S1S4n0grWeqHM7t3GutzprkdYjCrRTS13/KsDK0xlCTLqAmkfS0ZDpCIr6pe46M4VjlYR91nq4Nu40AJbOc2bgQFgV2/CVtkPcxfE1KuDEmKPCDZO21fVuxFC+FuF2EiXQmJsiXwNWVqXsDv8UyixoncJgw4bXN+ElO9H427j74eU0ErcYYEAUThsnOQahF+f3oRTNtM3JKB2guv1uWP8HnYq0Hs+mi+sgG8ZojqNl6q8sue1+wcvlXwh6bOUKS/iNfAXLdCUryegvItAqT5qa8UUX+Fsx+IDh6w==
Received: from BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 09:27:52 +0000
Received: from BL3PR12MB6474.namprd12.prod.outlook.com
 ([fe80::6e55:f98:3698:8ce4]) by BL3PR12MB6474.namprd12.prod.outlook.com
 ([fe80::6e55:f98:3698:8ce4%5]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 09:27:51 +0000
From: Wayne Chang <waynec@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, Jui Chang Kuo <jckuo@nvidia.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] phy: tegra: xusb: Use a bitmask for UTMI pad power
 state tracking
Thread-Topic: [PATCH v2 1/1] phy: tegra: xusb: Use a bitmask for UTMI pad
 power state tracking
Thread-Index: AQHbouYm8h3sM+TM5EC3FEm2DwDFiLOOjggAgAlq1oA=
Date: Mon, 7 Apr 2025 09:27:51 +0000
Message-ID: <7e7decc3-0abf-4b3a-91c6-46fb31b42a36@nvidia.com>
References: <20250401091143.2621353-1-waynec@nvidia.com>
 <a713c180-60fa-43f5-9ffa-5c348c8d538f@nvidia.com>
In-Reply-To: <a713c180-60fa-43f5-9ffa-5c348c8d538f@nvidia.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6474:EE_|PH7PR12MB7138:EE_
x-ms-office365-filtering-correlation-id: ab16e60e-92e8-4c47-6bde-08dd75b6784d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFhOSWcwK2FUMmJwbzlTWnJIMXZrMXErdk4vMWZNT2ZFV2MvMXA3Z3JRUEpp?=
 =?utf-8?B?Y0E1VW9ZVUhNdzdHZG9UVXFxSFZoYWVwTWNVMTRpRFJrbTZkdHRhRVY3S1VJ?=
 =?utf-8?B?TzBmSFlWd3VId3BQTXVNcUFTTytvaEk1NWN4TjQ3NHN6OTdiaUJlSVNhZjRj?=
 =?utf-8?B?VE1JcldnMVJjc0l5U1haZmRGdVpWY2xRWDlnOGd2WmdYWjU5eml3ZGZla2xC?=
 =?utf-8?B?VUtMUkZHSVNveGV2UXIzT0c2cm5LYmVoeHF3NUpJSGRlMEFzMFhRUGowa1ZR?=
 =?utf-8?B?UXprV2VoU0VoMHl1blo1VmxmVkxxd3NGYkE0OWNCWlpWOTJJWE9xSFovZm5K?=
 =?utf-8?B?ODY1T1RKcTc5b25sUkFzb1dnQVhnZEVFKzJZTDNiczI4c2ZOQ1NyRUpubnNi?=
 =?utf-8?B?elhLYitoRTNHSlF4cnF3UmRzVTlRbXVId0dSRDR1a2tXaHgyam0wYTFEVGRt?=
 =?utf-8?B?RTZGUWQxeVpFOWZDc1V6TmZZbGR6d0NYNENpNEpkV0RWdGxIcG9wY01JQSto?=
 =?utf-8?B?b0Raa3NKdXpEQnMvRnBjbW9uTmg1eW1md0F6SWgrcERoT1JibDlWMkNrSTFB?=
 =?utf-8?B?WC85M3VDbGZ4YzJlWmhkUUZHdmsybHE1NTdZcjJOYlo5K0Z6ZkNra2o2dHZw?=
 =?utf-8?B?L1BJL2dlUG5qK0N1aUJxaGJxN002VDB2MTU3ZE5Wb3EzRk1UbFZDNVdnMzFz?=
 =?utf-8?B?eGZyY1YySjRJY1Bla3RuZ2VCU3FLNXowNE5BcWkycFAxK2dkbzVhR2dnZW1L?=
 =?utf-8?B?U0VYbnhKMEFiVHZ6TVNzd1EzTHZxSWd1SEdlUTd4TUMvTnNEUlVMbGNTNnRm?=
 =?utf-8?B?Y2Uvb3ZIdHpHNThYYUlrWUNtT2xmUEtOTEVCZml4aVRYUzk1VHNGR0ROVmRL?=
 =?utf-8?B?bEJ2bDl6MXhiNHpOL25kOVY5N0VjdHA3aEozYm81OGxlcmdDU2N6V0poWW1m?=
 =?utf-8?B?V1pDN0RmSkNCUFlYb3BwaEtqajZoY1dzRFlyekpKc1pmdXFjZDdvWGRyd0hD?=
 =?utf-8?B?NWR4TWUrZ0VTQlZtbjBTN3RLUXhJRHcyMHRTWC9BcENrS1k0dkhnWU5QZGxE?=
 =?utf-8?B?U2ozcjJzMnBUTVR5ZkE0ZmtFSXpRRFU1R3dmV3VuU2RjUGhkcUlZL2c0T0tT?=
 =?utf-8?B?STVnRmxsS3BJcFZCb1ZaRjRtbXhERjg2c2JmNHA3eWJNWGc1YnZLVUJzMDFj?=
 =?utf-8?B?TGdUVERHOVppOXFkc2tVQUJINEFpeXVhdTVjUzdEdGltUkp3REhiK05vZTN6?=
 =?utf-8?B?SlZ2ZnFSc0Q1eDE0SVVwMW5TcE9WMEVTa2V1cURPWFMxTDA1VUdvZ29yWkZy?=
 =?utf-8?B?KzNrTEFDTy9pZmdBOHk3ZDc2SkRjdHZjR1BQelZiczk5TUVJdmw4bTdwcE9a?=
 =?utf-8?B?KzI0S1hYdE05ZzlIMC8xaTljRHg1Skp5eC9xZ3I3WVZDSW1SeTFQbDIyNmpK?=
 =?utf-8?B?Q0dJdlZmZjdTRlpqQ05NMkZ3Z0Z4bm5UOXFCOStxNll0akdydVFmTzJhdHZ6?=
 =?utf-8?B?VXZPY2ZmZEVwa0ZkcWsrcGdJV0dGc1QxYlQvaW92djdhS1ZuOXZrMzhBeVdz?=
 =?utf-8?B?NnlNeXpwdmVjUlpJR2ZJRmU5NTVnWUxjV1RsaXE1bGlQN0Q1eTF4MnhpOWln?=
 =?utf-8?B?WmFxKzJZZ0tzVUZXbElLWWREL1ZzNHk5OXgzZ0NDcEtrRS9hNE9ZajRUemZX?=
 =?utf-8?B?OGxFeVJXbnFxRHh1VitNOGxJU3djNEMxYkErRnJlS3g4cVQyY2VJS1YxaTU5?=
 =?utf-8?B?WFNWY21SaDdIeC9oOU5ONWp1dVRUVnNRaHUrWmg3MWhLWFlUb095L2NaaWlQ?=
 =?utf-8?B?MEQwZG5pSm1LU3kwbDZ5ZTBRSmlJTlVVU1RZRTNseG1LaGhsaXdPYU5sRmNF?=
 =?utf-8?B?dmtpYThvTEtYTXIxR3QxOUNNcUxaS0htaHhxNjNEOUQ5S2c2b0NFbmtlVTEr?=
 =?utf-8?Q?xBI9MpBprDhI2ikNe+AX4llxUad8bY26?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekwwUUxUeVE2NC91RXJXY0JORnF1UEp4a1F5UmJ0SzE1S0ozaUdFaUhRQ0Zx?=
 =?utf-8?B?KzdlQ0UyS1Evbk9aT3gxR1JIdlpBaGhPTm8yT0F1ZDAwdHlzQWRtZEpVVk9z?=
 =?utf-8?B?Rm9RcjVPY0swaXBFcXh6RVh0NEYxS280ZVR3SXd2U3puWGJDdnUraGh4b29G?=
 =?utf-8?B?VnVTMFdqekZFejJucmt6Q0VTY2hCZ0t6cGNkM1A2b2piU3FMZGZvSzhFd1gx?=
 =?utf-8?B?RExZd2VSaGIvdlJXamVnTUxucnUwQ25xakxaZ3AvMDczMmhMdDJiV3RqclhY?=
 =?utf-8?B?VkM1d3gxUGtNNFdCRG1HOUJLRTFpTDVuTnZISGd5aXhVZmJVWGg0Q2JhZSt0?=
 =?utf-8?B?TTZxSFZoWXpuNUdrVXo1dkp3dTJ5aHRZZVNzdHBqK0pIcWlHQXVnV0w3eVJV?=
 =?utf-8?B?aEpJTFlYTU13R21RaWVTdjRFWmNQM1FKNkVRb3g0WWpnZVh3blA2emlSenNu?=
 =?utf-8?B?NWlKQnVHaDFySC9kVldPUXFnRGl3YTZlVUxTbGlDeFRjR3dBRWNVcnpCaFRW?=
 =?utf-8?B?TVcrSzZ4Sks4dlNyMVRaNjBsMVFpWEdvTE1TSS9maU5iL3NFRHMzWjdobm9r?=
 =?utf-8?B?UVpCbnpaSjdyTU0vY1BhMzJBSGlGSTFwZXZDWTQ1SmViTGpNYStKZ1pROVJT?=
 =?utf-8?B?WGxySU1kenFxZE1zODk5Z1NlNVY2V3BUc0VVK05MLy90aWVRNW81QVpwWDVj?=
 =?utf-8?B?RHd6WjdjckF3aHpnUGw2Yjd6VGNsZUZoR2p2RGxpY1dCZDg0dWVaS0NsZzBP?=
 =?utf-8?B?bDIya3EvU1hWM3lVTzJZbjFzRUc5MjhNS0lZQlcwbEZtZ3pBOUhkaUVoNEly?=
 =?utf-8?B?cWhXNndYQWZucXNva2lacGV0NjhXQ0E1Q3VaQ00xdUg1NmdaRmtzMytwRm1M?=
 =?utf-8?B?SXFQNDFGSFJsYXdTSmgySHNEZzl4TklxVGEwUlEzN2lNQ2RUZng3RHg5NDZk?=
 =?utf-8?B?ZTNWaXhRb0pPREVJcWlONk1nNmdSbU85c25md1VDVmp4Y1h1YmRaSndBbzB4?=
 =?utf-8?B?T1hMRXhPQ1Q1bUdXQ2c2d2Q2R2kzYm5DenlWeG5uZi84aFpWS1lSNnd6Ny9Y?=
 =?utf-8?B?dXNhRmZPTHRjbHZIQ1JhU0dVekRLZnkybGFDMFp4ZG1Dd2l2RXZqaWpscEY3?=
 =?utf-8?B?NllNNjF0VW53bytlWWl1T0V0UFlYK2hDSHlYTjl1ZU5jZm52aEJqVFh4TTdj?=
 =?utf-8?B?UlhxM0dHSVB2eVBSQWt1YXk1SS9qT2Z5WThqT28wdWxzMDBvNWlnQXJvWTZx?=
 =?utf-8?B?REZWcExTam1EWVo5UUpYTVg1UWdDTjZ6NEtwKzB4YmFXRkZVc1VqWjgzL1Vo?=
 =?utf-8?B?YTBIS1R5MVNzREQ3ajRFY2YycTd5emJtYThtK090SVJ1MXdmSFZjRUt6aVp6?=
 =?utf-8?B?QWR3anNDZ0IvRjZyN2pTd3JXL0s5Um1UazdXazZWSmpwdnpZaUhFeUJWaFR2?=
 =?utf-8?B?dHFJWnI1ZjBGc2VjVjFVZE44YlJKZmd4VTV4WEtYekRhNVN5WDhYTTBidXZq?=
 =?utf-8?B?Y0FpcmRlZU5aZEd3VXkxY1lsSWlRQ3JiTXFNOGFWZ3NlOHdKQXVWK1NGTEpF?=
 =?utf-8?B?ZFZibnhjUTdKaFNTVkpOeTYydGlLcWVYOER1TXlRcTIwUHE0djBKa3Y3NWo2?=
 =?utf-8?B?UDNTbjRidmRmaHNiYlE3MEdtYzZiay9OM1FiU3YzMkhhc1IwT1JVSnBncXhr?=
 =?utf-8?B?dmZoL3lIOVpXNzdSZzlyVWhHRkk5MVBkV2tFcFZVeVRsdG4xeUgxaWorS1dY?=
 =?utf-8?B?Y0h1UXRicjJ4Z3huVWtqZm5lRlBMZzVSQ2JteXc0VzlJTEVFME5QQnJSVDcy?=
 =?utf-8?B?OG1YU2FWSXNMdnRjc3hLRE5hTTlXVjFWNlZHRzJWQUJIeFhZTytTd0tSQ0Fu?=
 =?utf-8?B?eGJXK0NMVnBtUmRKTlVaRHMzbHEwNWE0UDZvbjNrenJTcGNjSWRWNHZ5MlBJ?=
 =?utf-8?B?Z2MweHJja2dVdGdaYjJqd1JabTViZEcxZXdKWGtIR0kvUmMyblJmMmtvRUl5?=
 =?utf-8?B?VEFQSGZhMVhXenB1TFlMUlB1VEUyTjh0a2RhTjAraytQS0ZaTm11YlBERkw0?=
 =?utf-8?B?L1RPVWlzUG9UL1BHUk42RzBpaEZDOFFuYUZ0STJKWE5OZVVmSWNGVE1TY3ha?=
 =?utf-8?Q?FPMpaIL65UTHIlf7mBJ3Jvy6Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95E510402B67054785E23ADEF608F70C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab16e60e-92e8-4c47-6bde-08dd75b6784d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 09:27:51.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVz4YUJtSPDF540e7Z08ch+YVfxZj2cfXheFLVt9AQDIIgpeWZsEymRE8sBc4KeY+xVzxNR1KmMqSQaHEEr3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138

SGkgSm9uYXRoYW4sDQoNCk9uIDQvMS8yNSAxNzozOSwgSm9uIEh1bnRlciB3cm90ZToNCj4gSGkg
V2F5bmUsDQo+DQo+IE9uIDAxLzA0LzIwMjUgMTA6MTEsIFdheW5lIENoYW5nIHdyb3RlOg0KPj4g
VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gdXNlcyBiaWFzX3BhZF9lbmFibGUgYXMgYSByZWZl
cmVuY2UgY291bnQgdG8NCj4+IG1hbmFnZSB0aGUgc2hhcmVkIGJpYXMgcGFkIGZvciBhbGwgVVRN
SSBQSFlzLiBIb3dldmVyLCBkdXJpbmcgc3lzdGVtDQo+PiBzdXNwZW5zaW9uIHdpdGggY29ubmVj
dGVkIFVTQiBkZXZpY2VzLCBtdWx0aXBsZSBwb3dlci1kb3duIHJlcXVlc3RzIGZvcg0KPj4gdGhl
IFVUTUkgcGFkIHJlc3VsdCBpbiBhIG1pc21hdGNoIGluIHRoZSByZWZlcmVuY2UgY291bnQsIHdo
aWNoIGluIHR1cm4NCj4+IHByb2R1Y2VzIHdhcm5pbmdzIHN1Y2ggYXM6DQo+Pg0KPj4gWyAgMjM3
Ljc2Mjk2N10gV0FSTklORzogQ1BVOiAxMCBQSUQ6IDE2MTggYXQgdGVncmExODZfdXRtaV9wYWRf
cG93ZXJfZG93bisweDE2MC8weDE3MA0KPj4gWyAgMjM3Ljc2MzEwM10gQ2FsbCB0cmFjZToNCj4+
IFsgIDIzNy43NjMxMDRdICB0ZWdyYTE4Nl91dG1pX3BhZF9wb3dlcl9kb3duKzB4MTYwLzB4MTcw
DQo+PiBbICAyMzcuNzYzMTA3XSAgdGVncmExODZfdXRtaV9waHlfcG93ZXJfb2ZmKzB4MTAvMHgz
MA0KPj4gWyAgMjM3Ljc2MzExMF0gIHBoeV9wb3dlcl9vZmYrMHg0OC8weDEwMA0KPj4gWyAgMjM3
Ljc2MzExM10gIHRlZ3JhX3h1c2JfZW50ZXJfZWxwZysweDIwNC8weDUwMA0KPj4gWyAgMjM3Ljc2
MzExOV0gIHRlZ3JhX3h1c2Jfc3VzcGVuZCsweDQ4LzB4MTQwDQo+PiBbICAyMzcuNzYzMTIyXSAg
cGxhdGZvcm1fcG1fc3VzcGVuZCsweDJjLzB4YjANCj4+IFsgIDIzNy43NjMxMjVdICBkcG1fcnVu
X2NhbGxiYWNrLmlzcmEuMCsweDIwLzB4YTANCj4+IFsgIDIzNy43NjMxMjddICBfX2RldmljZV9z
dXNwZW5kKzB4MTE4LzB4MzMwDQo+PiBbICAyMzcuNzYzMTI5XSAgZHBtX3N1c3BlbmQrMHgxMGMv
MHgxZjANCj4+IFsgIDIzNy43NjMxMzBdICBkcG1fc3VzcGVuZF9zdGFydCsweDg4LzB4YjANCj4+
IFsgIDIzNy43NjMxMzJdICBzdXNwZW5kX2RldmljZXNfYW5kX2VudGVyKzB4MTIwLzB4NTAwDQo+
PiBbICAyMzcuNzYzMTM1XSAgcG1fc3VzcGVuZCsweDFlYy8weDI3MA0KPj4NCj4+IFRoZSByb290
IGNhdXNlIHdhcyB0cmFjZWQgYmFjayB0byB0aGUgZHluYW1pYyBwb3dlci1kb3duIGNoYW5nZXMN
Cj4+IGludHJvZHVjZWQgaW4gY29tbWl0IGEzMDk1MWQzMWIyNSAoInhoY2k6IHRlZ3JhOiBVU0Iy
IHBhZCBwb3dlciBjb250cm9scyIpLA0KPj4gd2hlcmUgdGhlIFVUTUkgcGFkIHdhcyBiZWluZyBw
b3dlcmVkIGRvd24gd2l0aG91dCB2ZXJpZnlpbmcgaXRzIGN1cnJlbnQNCj4+IHN0YXRlLiBUaGlz
IHVuYmFsYW5jZWQgYmVoYXZpb3IgbGVkIHRvIGRpc2NyZXBhbmNpZXMgaW4gdGhlIHJlZmVyZW5j
ZQ0KPj4gY291bnQuDQo+Pg0KPj4gVG8gcmVjdGlmeSB0aGlzIGlzc3VlLCB0aGlzIHBhdGNoIHJl
cGxhY2VzIHRoZSBzaW5nbGUgcmVmZXJlbmNlIGNvdW50ZXINCj4+IHdpdGggYSBiaXRtYXNrLCBy
ZW5hbWVkIHRvIHV0bWlfcGFkX2VuYWJsZWQuIEVhY2ggYml0IGluIHRoZSBtYXNrDQo+PiBjb3Jy
ZXNwb25kcyB0byBvbmUgb2YgdGhlIGZvdXIgVVNCMiBQSFlzLCBhbGxvd2luZyB1cyB0byB0cmFj
ayBlYWNoIHBhZCdzDQo+PiBlbmFibGVtZW50IHN0YXR1cyBpbmRpdmlkdWFsbHkuDQo+Pg0KPj4g
V2l0aCB0aGlzIGNoYW5nZToNCj4+ICAgICAtIFRoZSBiaWFzIHBhZCBpcyBwb3dlcmVkIG9uIG9u
bHkgd2hlbiB0aGUgbWFzayBpcyBjbGVhci4NCj4+ICAgICAtIEVhY2ggVVRNSSBwYWQgaXMgcG93
ZXJlZCBvbiBvciBkb3duIGJhc2VkIG9uIGl0cyBjb3JyZXNwb25kaW5nIGJpdA0KPj4gICAgICAg
aW4gdGhlIG1hc2ssIHByZXZlbnRpbmcgcmVkdW5kYW50IG9wZXJhdGlvbnMuDQo+PiAgICAgLSBU
aGUgb3ZlcmFsbCBwb3dlciBzdGF0ZSBvZiB0aGUgc2hhcmVkIGJpYXMgcGFkIGlzIG1haW50YWlu
ZWQNCj4+ICAgICAgIGNvcnJlY3RseSBkdXJpbmcgc3VzcGVuZC9yZXN1bWUgY3ljbGVzLg0KPiBJ
dCBtaWdodCBiZSB3b3J0aCBtZW50aW9uaW5nIGhlcmUgdGhhdCAuLi4NCj4NCj4gIi0gVGhlIG11
dGV4IHVzZWQgdG8gcHJldmVudCByYWNlcyB3aGVuIHRoZSBVVE1JIHBhZHMgYXJlIGVuYWJsZWQv
DQo+ICAgICAgZGlzYWJsZWQgaXMgbW92ZWQgZnJvbSB0aGUgdGVncmExODZfdXRtaV9iaWFzX3Bh
ZF9wb3dlcl9vbi9vZmYNCj4gICAgICBmdW5jdGlvbnMgdG8gdGhlIHBhcmVudCBmdW5jdGlvbnMg
dGVncmExODZfdXRtaV9wYWRfcG93ZXJfb24vZG93biB0bw0KPiAgICAgIGVuc3VyZSB0aGF0IGFy
ZSBubyByYWNlcyB3aGVuIHVwZGF0aW5nIHRoZSBiaXRtYXNrLiINCg0KVGhhbmtzIGZvciB0aGUg
cmV2aWV3LiBJJ2xsIHVwZGF0ZSBpbiB0aGUgbmV4dCBwYXRjaHNldC4NCg0KPg0KPj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IEZpeGVzOiBhMzA5NTFkMzFiMjUgKCJ4aGNpOiB0ZWdy
YTogVVNCMiBwYWQgcG93ZXIgY29udHJvbHMiKQ0KPj4gU2lnbmVkLW9mZi1ieTogV2F5bmUgQ2hh
bmcgPHdheW5lY0BudmlkaWEuY29tPg0KPj4gLS0tDQo+PiBWMSAtPiBWMjogaG9sZGluZyB0aGUg
cGFkY3RsLT5sb2NrIHRvIHByb3RlY3Qgc2hhcmVkIGJpdG1hc2sNCj4gSSBzZWUgeW91IG1lbnRp
b25lZCBpdCBoZXJlLCBidXQgdGhlIGNoYW5nZWxvZyBzaG91bGQgYWxzbyBpbmRpY2F0ZSB0aGF0
DQo+IHRoaXMgaGFzIGNoYW5nZWQuDQpPSy4gU3VyZS4NCj4NCj4+ICAgIGRyaXZlcnMvcGh5L3Rl
Z3JhL3h1c2ItdGVncmExODYuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0N
Cj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvdGVncmEveHVzYi10ZWdyYTE4Ni5jIGIv
ZHJpdmVycy9waHkvdGVncmEveHVzYi10ZWdyYTE4Ni5jDQo+PiBpbmRleCBmYWU2MjQyYWE3MzAu
LmNjN2I4YTZhOTk5ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvcGh5L3RlZ3JhL3h1c2ItdGVn
cmExODYuYw0KPj4gKysrIGIvZHJpdmVycy9waHkvdGVncmEveHVzYi10ZWdyYTE4Ni5jDQo+PiBA
QCAtMjM3LDYgKzIzNyw4IEBADQo+PiAgICAjZGVmaW5lICAgREFUQTBfVkFMX1BECQkJCUJJVCgx
KQ0KPj4gICAgI2RlZmluZSAgIFVTRV9YVVNCX0FPCQkJCUJJVCg0KQ0KPj4gICAgDQo+PiArI2Rl
ZmluZSBURUdSQV9VVE1JX1BBRF9NQVggNA0KPj4gKw0KPj4gICAgI2RlZmluZSBURUdSQTE4Nl9M
QU5FKF9uYW1lLCBfb2Zmc2V0LCBfc2hpZnQsIF9tYXNrLCBfdHlwZSkJCVwNCj4+ICAgIAl7CQkJ
CQkJCQlcDQo+PiAgICAJCS5uYW1lID0gX25hbWUsCQkJCQkJXA0KPj4gQEAgLTI2OSw3ICsyNzEs
NyBAQCBzdHJ1Y3QgdGVncmExODZfeHVzYl9wYWRjdGwgew0KPj4gICAgDQo+PiAgICAJLyogVVRN
SSBiaWFzIGFuZCB0cmFja2luZyAqLw0KPj4gICAgCXN0cnVjdCBjbGsgKnVzYjJfdHJrX2NsazsN
Cj4+IC0JdW5zaWduZWQgaW50IGJpYXNfcGFkX2VuYWJsZTsNCj4+ICsJREVDTEFSRV9CSVRNQVAo
dXRtaV9wYWRfZW5hYmxlZCwgVEVHUkFfVVRNSV9QQURfTUFYKTsNCj4+ICAgIA0KPj4gICAgCS8q
IHBhZGN0bCBjb250ZXh0ICovDQo+PiAgICAJc3RydWN0IHRlZ3JhMTg2X3h1c2JfcGFkY3RsX2Nv
bnRleHQgY29udGV4dDsNCj4+IEBAIC02MDMsMTIgKzYwNSw4IEBAIHN0YXRpYyB2b2lkIHRlZ3Jh
MTg2X3V0bWlfYmlhc19wYWRfcG93ZXJfb24oc3RydWN0IHRlZ3JhX3h1c2JfcGFkY3RsICpwYWRj
dGwpDQo+PiAgICAJdTMyIHZhbHVlOw0KPj4gICAgCWludCBlcnI7DQo+PiAgICANCj4+IC0JbXV0
ZXhfbG9jaygmcGFkY3RsLT5sb2NrKTsNCj4+IC0NCj4+IC0JaWYgKHByaXYtPmJpYXNfcGFkX2Vu
YWJsZSsrID4gMCkgew0KPj4gLQkJbXV0ZXhfdW5sb2NrKCZwYWRjdGwtPmxvY2spOw0KPj4gKwlp
ZiAoIWJpdG1hcF9lbXB0eShwcml2LT51dG1pX3BhZF9lbmFibGVkLCBURUdSQV9VVE1JX1BBRF9N
QVgpKQ0KPj4gICAgCQlyZXR1cm47DQo+PiAtCX0NCj4+ICAgIA0KPj4gICAgCWVyciA9IGNsa19w
cmVwYXJlX2VuYWJsZShwcml2LT51c2IyX3Rya19jbGspOw0KPj4gICAgCWlmIChlcnIgPCAwKQ0K
Pj4gQEAgLTY2NywxNyArNjY1LDggQEAgc3RhdGljIHZvaWQgdGVncmExODZfdXRtaV9iaWFzX3Bh
ZF9wb3dlcl9vZmYoc3RydWN0IHRlZ3JhX3h1c2JfcGFkY3RsICpwYWRjdGwpDQo+PiAgICAJc3Ry
dWN0IHRlZ3JhMTg2X3h1c2JfcGFkY3RsICpwcml2ID0gdG9fdGVncmExODZfeHVzYl9wYWRjdGwo
cGFkY3RsKTsNCj4+ICAgIAl1MzIgdmFsdWU7DQo+PiAgICANCj4+IC0JbXV0ZXhfbG9jaygmcGFk
Y3RsLT5sb2NrKTsNCj4+IC0NCj4+IC0JaWYgKFdBUk5fT04ocHJpdi0+Ymlhc19wYWRfZW5hYmxl
ID09IDApKSB7DQo+PiAtCQltdXRleF91bmxvY2soJnBhZGN0bC0+bG9jayk7DQo+PiAtCQlyZXR1
cm47DQo+PiAtCX0NCj4+IC0NCj4+IC0JaWYgKC0tcHJpdi0+Ymlhc19wYWRfZW5hYmxlID4gMCkg
ew0KPj4gLQkJbXV0ZXhfdW5sb2NrKCZwYWRjdGwtPmxvY2spOw0KPj4gKwlpZiAoIWJpdG1hcF9l
bXB0eShwcml2LT51dG1pX3BhZF9lbmFibGVkLCBURUdSQV9VVE1JX1BBRF9NQVgpKQ0KPj4gICAg
CQlyZXR1cm47DQo+PiAtCX0NCj4+ICAgIA0KPj4gICAgCXZhbHVlID0gcGFkY3RsX3JlYWRsKHBh
ZGN0bCwgWFVTQl9QQURDVExfVVNCMl9CSUFTX1BBRF9DVEwxKTsNCj4+ICAgIAl2YWx1ZSB8PSBV
U0IyX1BEX1RSSzsNCj4+IEBAIC02OTAsMTMgKzY3OSwxMyBAQCBzdGF0aWMgdm9pZCB0ZWdyYTE4
Nl91dG1pX2JpYXNfcGFkX3Bvd2VyX29mZihzdHJ1Y3QgdGVncmFfeHVzYl9wYWRjdGwgKnBhZGN0
bCkNCj4+ICAgIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPnVzYjJfdHJrX2Nsayk7DQo+
PiAgICAJfQ0KPj4gICAgDQo+PiAtCW11dGV4X3VubG9jaygmcGFkY3RsLT5sb2NrKTsNCj4+ICAg
IH0NCj4+ICAgIA0KPj4gICAgc3RhdGljIHZvaWQgdGVncmExODZfdXRtaV9wYWRfcG93ZXJfb24o
c3RydWN0IHBoeSAqcGh5KQ0KPj4gICAgew0KPj4gICAgCXN0cnVjdCB0ZWdyYV94dXNiX2xhbmUg
KmxhbmUgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsNCj4+ICAgIAlzdHJ1Y3QgdGVncmFfeHVzYl9w
YWRjdGwgKnBhZGN0bCA9IGxhbmUtPnBhZC0+cGFkY3RsOw0KPj4gKwlzdHJ1Y3QgdGVncmExODZf
eHVzYl9wYWRjdGwgKnByaXYgPSB0b190ZWdyYTE4Nl94dXNiX3BhZGN0bChwYWRjdGwpOw0KPj4g
ICAgCXN0cnVjdCB0ZWdyYV94dXNiX3VzYjJfcG9ydCAqcG9ydDsNCj4+ICAgIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBwYWRjdGwtPmRldjsNCj4+ICAgIAl1bnNpZ25lZCBpbnQgaW5kZXggPSBsYW5l
LT5pbmRleDsNCj4+IEBAIC03MDUsOSArNjk0LDE2IEBAIHN0YXRpYyB2b2lkIHRlZ3JhMTg2X3V0
bWlfcGFkX3Bvd2VyX29uKHN0cnVjdCBwaHkgKnBoeSkNCj4+ICAgIAlpZiAoIXBoeSkNCj4+ICAg
IAkJcmV0dXJuOw0KPj4gICAgDQo+PiArCW11dGV4X2xvY2soJnBhZGN0bC0+bG9jayk7DQo+PiAr
CWlmICh0ZXN0X2JpdChpbmRleCwgcHJpdi0+dXRtaV9wYWRfZW5hYmxlZCkpIHsNCj4+ICsJCW11
dGV4X3VubG9jaygmcGFkY3RsLT5sb2NrKTsNCj4+ICsJCXJldHVybjsNCj4+ICsJfQ0KPj4gKw0K
Pj4gICAgCXBvcnQgPSB0ZWdyYV94dXNiX2ZpbmRfdXNiMl9wb3J0KHBhZGN0bCwgaW5kZXgpOw0K
Pj4gICAgCWlmICghcG9ydCkgew0KPj4gICAgCQlkZXZfZXJyKGRldiwgIm5vIHBvcnQgZm91bmQg
Zm9yIFVTQjIgbGFuZSAldVxuIiwgaW5kZXgpOw0KPj4gKwkJbXV0ZXhfdW5sb2NrKCZwYWRjdGwt
PmxvY2spOw0KPj4gICAgCQlyZXR1cm47DQo+PiAgICAJfQ0KPj4gICAgDQo+PiBAQCAtNzI0LDE4
ICs3MjAsMjggQEAgc3RhdGljIHZvaWQgdGVncmExODZfdXRtaV9wYWRfcG93ZXJfb24oc3RydWN0
IHBoeSAqcGh5KQ0KPj4gICAgCXZhbHVlID0gcGFkY3RsX3JlYWRsKHBhZGN0bCwgWFVTQl9QQURD
VExfVVNCMl9PVEdfUEFEWF9DVEwxKGluZGV4KSk7DQo+PiAgICAJdmFsdWUgJj0gflVTQjJfT1RH
X1BEX0RSOw0KPj4gICAgCXBhZGN0bF93cml0ZWwocGFkY3RsLCB2YWx1ZSwgWFVTQl9QQURDVExf
VVNCMl9PVEdfUEFEWF9DVEwxKGluZGV4KSk7DQo+PiArDQo+PiArCXNldF9iaXQoaW5kZXgsIHBy
aXYtPnV0bWlfcGFkX2VuYWJsZWQpOw0KPj4gKwltdXRleF91bmxvY2soJnBhZGN0bC0+bG9jayk7
DQo+PiAgICB9DQo+PiAgICANCj4+ICAgIHN0YXRpYyB2b2lkIHRlZ3JhMTg2X3V0bWlfcGFkX3Bv
d2VyX2Rvd24oc3RydWN0IHBoeSAqcGh5KQ0KPj4gICAgew0KPj4gICAgCXN0cnVjdCB0ZWdyYV94
dXNiX2xhbmUgKmxhbmUgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsNCj4+ICAgIAlzdHJ1Y3QgdGVn
cmFfeHVzYl9wYWRjdGwgKnBhZGN0bCA9IGxhbmUtPnBhZC0+cGFkY3RsOw0KPj4gKwlzdHJ1Y3Qg
dGVncmExODZfeHVzYl9wYWRjdGwgKnByaXYgPSB0b190ZWdyYTE4Nl94dXNiX3BhZGN0bChwYWRj
dGwpOw0KPj4gICAgCXVuc2lnbmVkIGludCBpbmRleCA9IGxhbmUtPmluZGV4Ow0KPj4gICAgCXUz
MiB2YWx1ZTsNCj4+ICAgIA0KPj4gICAgCWlmICghcGh5KQ0KPj4gICAgCQlyZXR1cm47DQo+PiAg
ICANCj4+ICsJbXV0ZXhfbG9jaygmcGFkY3RsLT5sb2NrKTsNCj4+ICsJaWYgKCF0ZXN0X2JpdChp
bmRleCwgcHJpdi0+dXRtaV9wYWRfZW5hYmxlZCkpIHsNCj4+ICsJCW11dGV4X3VubG9jaygmcGFk
Y3RsLT5sb2NrKTsNCj4+ICsJCXJldHVybjsNCj4+ICsJfQ0KPj4gKw0KPj4gICAgCWRldl9kYmco
cGFkY3RsLT5kZXYsICJwb3dlciBkb3duIFVUTUkgcGFkICV1XG4iLCBpbmRleCk7DQo+PiAgICAN
Cj4+ICAgIAl2YWx1ZSA9IHBhZGN0bF9yZWFkbChwYWRjdGwsIFhVU0JfUEFEQ1RMX1VTQjJfT1RH
X1BBRFhfQ1RMMChpbmRleCkpOw0KPj4gQEAgLTc0OCw3ICs3NTQsMTEgQEAgc3RhdGljIHZvaWQg
dGVncmExODZfdXRtaV9wYWRfcG93ZXJfZG93bihzdHJ1Y3QgcGh5ICpwaHkpDQo+PiAgICANCj4+
ICAgIAl1ZGVsYXkoMik7DQo+PiAgICANCj4+ICsJY2xlYXJfYml0KGluZGV4LCBwcml2LT51dG1p
X3BhZF9lbmFibGVkKTsNCj4+ICsNCj4+ICAgIAl0ZWdyYTE4Nl91dG1pX2JpYXNfcGFkX3Bvd2Vy
X29mZihwYWRjdGwpOw0KPj4gKw0KPg0KPiBJdCBzZWVtcyBtb3JlIG5hdHVyYWwgdG8gY2xlYXIg
dGhlIGJpdG1hc2sgYWZ0ZXIgZGlzYWJsaW5nIHRoZSBiaWFzDQo+IHBvd2VyLiBJIGd1ZXNzIHRo
aXMgaXMgcHJvdGVjdGVkIGJ5IHRoZSBtdXRleCBhbmQgc28gc2hvdWxkIG5vdCBtYXR0ZXIuDQoN
CldlIG5lZWQgdGhlIGJpdG1hc2sgdG8gYmUgdXBkYXRlZCBiZWZvcmUgZGlzYWJsaW5nIHRoZSBi
aWFzIHBhZCwgYXMgDQp3ZSdyZSB1c2luZyBpdCB0byBkZXRlcm1pbmUgdGhlIHN0YXR1cyBvZiB0
aGUgVVRNSSBwYWRzLiBUaGlzIGhlbHBzIHVzIA0KZGVjaWRlIHdoZXRoZXIgaXQncyBzYWZlIHRv
IHBvd2VyIGRvd24gdGhlIGJpYXMgcGFkIG9yIG5vdC4NCg0KPg0KPiBKb24NCj4NCg0K

