Return-Path: <linux-tegra+bounces-4991-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CEA3231B
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Feb 2025 11:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5ABE3A67AE
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Feb 2025 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7724C205E1B;
	Wed, 12 Feb 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IpwYjhf9"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3A1F8692;
	Wed, 12 Feb 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354581; cv=fail; b=hsdqeVSCktbe4Tsae0XmG6q1ak08ALJgiEnLQMhNBMUlN7TNbmNh1uNZBTOugmrV43Rrh8384OqH14Zo/Aty9W4PQNdff6Oqho3ZloFIhQvPqoWOMRBYLaGzianc1teH1ZwvtUyA9afgkM6iHYh9ENB9YpUrLqJFYCS1Bic5Pqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354581; c=relaxed/simple;
	bh=C9N31IIrwrZg0/bNx0WWm2dP7KvOdE7iTO4ZKsI1DXA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wuqm1BMTGUV0HFBjt3utU0fz2xLKEs/3n7WGcnrQElhxqpNM/YJ9vgS7nE4cd6ohIRwdeIzeFIzmfTENmMFY6r8aAHkoI0bGtY1C9DfkVHaJT5jQg5Ko1KAiXyUW76zaIYvHdFvtWdbfgpNFuMUtUHuxasFDfdYeaBwCiBrfFQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IpwYjhf9; arc=fail smtp.client-ip=40.107.100.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqfoyw0S3vxyjl+fQno99TwVllkdU/y4LIyeyVcPiW0Is+rl5O1QoaIc5Qn5m8m+zrshDy2ySA1pvQWWjxAAvtxKG+ZLMeUbn+Ye7j59PIt22Ida04/P3ekZduVWfpnVbBd0rc7mBWFkmch+3PbscH1HrRiopHTSWmwejutU34vBMHG+v5WDKGMDRTlAb9yiSEqcByUsGp3mV2+h16MUWaDstoCDN/1Avtlrb0BnFKDrPfj6SDuU9MIZYTH7vMuzd5BKSlry4gn0ZI24zGR1F9t+qjYe8kr0bhW6Raqz3nsmb+Y5KI/UBxTJRIu+U6sVK2HuD2B5r04EzK0YaH+Vsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9N31IIrwrZg0/bNx0WWm2dP7KvOdE7iTO4ZKsI1DXA=;
 b=d0oAOkNJDl0255X5vmkHmXTqRMeQD9Eoy8x+TvM+kJs1mGN9j2QskusOFtnQ98XtH6HsGm3o/oMTcku/4cunjN/MU72rpEOmEXQvlzPvc8aGLWPIFok/d+EcCMb8KeMtvd6XQP5j7cb47RRFFyj5Hd0WYXPSj8d5H+MZLVLgyEnMSqAkjN/4Xn+6u5wcDUB981q+KGGX3KqFJD3MEcx5d7vTGPM3HGj/KqW+6wOZ7c+3uIKm2b3m4FtQ2+rSTpS+UfxzRD/O7ZdBdJ2350PrU4WJuG2eG/xva3VzboEuJ/rFQcNdwq7w3GH+uOYHlwwC6AiS5p1VH5zAcRQ00LLEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9N31IIrwrZg0/bNx0WWm2dP7KvOdE7iTO4ZKsI1DXA=;
 b=IpwYjhf92uGaOkOjkZt6TVymrE83f+6bFXonO7yamRtGAywAkK62WU3h1GCLpbIXaqVZBDIB+Vcdb/ZN3OYgP6gW2KyOn6UzrtyToJ7aFRNOId2ggzbDFmMpmQHR7wq7RGdp2XokdFL/oWrCHZNlwaLUiK1j9P9SVwlOaJ5cie//IrA/Xnuywb3EK7MSMpyic8BVGfEJO3Hh6oTpIK6sVfT2ba9+Xl6mLtCQDTIIlMC1sOamIf3+tC9/Ov/W6+o5SLn2vjC0/indlAMZeDqAhH3hSeE+CM1F/3RiDzrK1bEHYuIJQgCLd6OzpJ48k45l/8Bd/R68hzfvjNRArbXSUA==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 10:02:56 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 10:02:56 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Jon Hunter <jonathanh@nvidia.com>, "robh@kernel.org" <robh@kernel.org>,
	"robert.marko@sartura.hr" <robert.marko@sartura.hr>, "arnd@kernel.org"
	<arnd@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "hvilleneuve@dimonoff.com"
	<hvilleneuve@dimonoff.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "schnelle@linux.ibm.com"
	<schnelle@linux.ibm.com>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] serial: tegra-utc: Add driver for Tegra UART Trace
 Controller (UTC)
Thread-Topic: [PATCH v2 2/2] serial: tegra-utc: Add driver for Tegra UART
 Trace Controller (UTC)
Thread-Index: AQHbfGvgjS6HrzMaWE2iP1UtNVTWhbNDcbeA
Date: Wed, 12 Feb 2025 10:02:55 +0000
Message-ID: <d4b9a604d099f4056b9bfb653fe32e8bf071e915.camel@nvidia.com>
References: <20250211061945.18836-1-kkartik@nvidia.com>
	 <20250211061945.18836-3-kkartik@nvidia.com>
	 <Z6sf58j4HJH4OCX9@smile.fi.intel.com>
In-Reply-To: <Z6sf58j4HJH4OCX9@smile.fi.intel.com>
Reply-To: Kartik Rajput <kkartik@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|SA1PR12MB8843:EE_
x-ms-office365-filtering-correlation-id: 931fef66-59bd-48b7-be8c-08dd4b4c6c27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXdjZi8yVWFvSVNCQXBFUjRGdUhKZEVkZzZHc0VnR2xJNHR3dTNDeitTUG5r?=
 =?utf-8?B?UTJhYllkalRTUWk5UUdKci9UMzBZZElSSXJOYThsY2t3ODRJaHZaMllkWFFt?=
 =?utf-8?B?Z3UwSGFBeDZEam9pZVZHS21Pa2lMUVFyY3hKajFVbHk0VXFLY1JpU0VlcmdD?=
 =?utf-8?B?RTdoNkwzamYrU3Rzc1d0ZUNuSFlqcHYwQlVBNkQ2UGVWcXhLUExWajBWUDMw?=
 =?utf-8?B?aTR3QzI4U3o5OEs4dURzbnd0RnArOU16alMzbnIrcjdDMWJIWkMxaUpZQzh3?=
 =?utf-8?B?RnEvMFo4dGxBaUNqZ2hpVlBGbUVyc3lUUUlpeG1DeWl6dVprcmx4KzlhcmpX?=
 =?utf-8?B?MUsrQ042MU15NGZLNUliNkpKNUoxSTl1NzJ4UkFKRWg3TGdnd0ZLbzEwdncr?=
 =?utf-8?B?TldlakdMbW5zK29xLzFKVktaOXRzaWpOTE4xVTRyK0ZKRVJ0UlJlR3QvbWRV?=
 =?utf-8?B?NndBQVBmWXJhOXZpSmcxeVpLZmkvOUZONFVscE1peTVjN0x4SUxlQVJodE1r?=
 =?utf-8?B?cCtsL0p5QStEL29lQjVXVGVTUmVQNnFSdHpjR1JuU3N6ejg4dWlNUW4zbi9N?=
 =?utf-8?B?Y2ZlcUhRb0htaUR5WWY4NjQ0TnIxRTd5VE9kUjVRc3Fmc0s0SGpkeHFZLzdi?=
 =?utf-8?B?SWt0TXJ4WnhsOEJOaVhnTTdMQTdyZ0hCcHA5TjAzRFVoSkhaVU9xYzh0dDl0?=
 =?utf-8?B?K3RBemFrOFlaWnZQZUpWaWN6NlhaYVBMak53U2Y3NDlGNzdUM0VLdGdYa1Na?=
 =?utf-8?B?TEJrd29SVkNjMzdaaWlHNUsra2pQQU9HOG00Nno2ZExiVUJ3Wjl5bGQzM0k1?=
 =?utf-8?B?azllQzhrTXJFWU5HUitGZnFsd1dESFV3ZG5yYm4yQUJ4czlPVFNvbS9sRTVa?=
 =?utf-8?B?MldzTHN6VnBJSjBxNkhmTGVrbHF4SWJTNE41YnB6NnIxR0o5YUJ1N2ZBcyt2?=
 =?utf-8?B?Y1JSQnFyMTB4YVBnTzhWOUZPd2JJWThoQ2QzSGMxNjcybHdVZmZnUzAzK1Vz?=
 =?utf-8?B?dmRwNVlnenkyVHRGem44dC9kdFp2SWJFQUtKbGVoVElXM3VoWVVSeHoyWDVU?=
 =?utf-8?B?VlpOeXVuQldsZFNQV3d4Z2RVUGYxd2FxZkw3L01ZWjhrMGtTT20vb1pTQ1N2?=
 =?utf-8?B?TUlYNDVCRURIWGg5dnJHQVdKbHdTcHJxSktabm1HeGpueVNhM09SSENvalBB?=
 =?utf-8?B?K1B0UVVwMGU0eVo1ejRaRERRVlgwRmREMUNuLy81aVdadWROTm9wMmRCN1pG?=
 =?utf-8?B?Zk9hT01TZlh6MVZoQy9ORXFvQUs1QlRpZmhLNEp1OWpjcHR4cnFEQ1h4MDJn?=
 =?utf-8?B?RmVkT2wyTzlJMEdkVFEwQWR2d0RVN2h2NEc1dmRmWDhGK3FKbnhXRTJvUjZ5?=
 =?utf-8?B?VDFsaEZCWEZERjBmcm51emJyZ3U3SkZyejVENWpNanF5cjZqOWl2RTVtSVU1?=
 =?utf-8?B?aWorVkFQbDR3WTdOS0MyaUJLa21zYWpCb3Z1RFltMktiWnByTWFQMlIrbGpN?=
 =?utf-8?B?QjlLSGRMMFBzek55a0wwUmd3UVJhUWdVM0xnalJqcnZtemFjckZaem1GLzk5?=
 =?utf-8?B?czhkQmVZM3pWdEd2Vk00Y0tGaE0zQi95Vks0cndEYUF4VDIybVkzQzNwdFJM?=
 =?utf-8?B?c0xBdmd6OWU0S0dSUUJzdFpBdjZPSXZxeUtZa0owM2hSb0o3MXJmeVZFeW1s?=
 =?utf-8?B?L1RQcE94U3FKdnllczU5S2t3VkxucXZiTGN2c053TjArYlk2aWVINkM5YXBD?=
 =?utf-8?B?b3BodmlGeDhZSXhRaHU3VVQxcHA3d1BHbi92RUEwY21hRXdnMlBvMGpSSHFi?=
 =?utf-8?B?Z00zSTNmMHo3cnhpS2xVc3Z0WjB3amZiWkxENVRCdFh2VzJnaXZnYXlUdGpr?=
 =?utf-8?B?TUpFcEN0WEtXNklqMWJHSUFua0ZVVHlrZUs5NHkvQ251S1lZd29iY2xqUHlC?=
 =?utf-8?Q?G4s/VPFtUiF+RbvtEVXDf+83gWwqQoQ8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1RpWHhrb2dKdllDK0ViSWpkRHlyRUllNE96dkh4SnU4WURCcnR6SVc5VGMr?=
 =?utf-8?B?QmxnZFhTVmxQVmo3UXJTQ2RyS2tHRHZXbW9RYWZOVEFMaE1sOWtPaTJNWHkr?=
 =?utf-8?B?cUtLSlRKSkwrdlJFWDNyU2liYm1DeElydGN5Nnhubjg3RVZJemdSMzNPWVJw?=
 =?utf-8?B?WldZczVZSk1Zd2VkOFpqQmtuSURxNDFTblltYTM0dS9kK2tROHVxMEVjeXpq?=
 =?utf-8?B?WHBDSElGM00rSmlkT2RON3dEbWd6V0RQMGU1Yk9vV08zbG9OZ1dLeWxNS25z?=
 =?utf-8?B?WFp6TUVIcHRJaGZXOENJSXR6NGZvNVN4Z1hlcXo5VHdYdm5LNVVXYmdXbHh2?=
 =?utf-8?B?WGNzMGJyMU5oR3I4akc1NHZHSjhSSHkrem5IYU5JckNUTCtycFNGZ0NxMnNS?=
 =?utf-8?B?YWRzMTV0N0oybjI2U3Zva1hPSjFvWEQ3Q2crWU1MUWx1ZzY2SG93UWFxQldv?=
 =?utf-8?B?cEZEemN5VHFIQmZUL3FxTEtjYkpBUTRDRVdSeHV4SGtPbUNoT2lhWVRJN1Ex?=
 =?utf-8?B?SUIyOHdQc2JXa2FyYllTMmpDRlNDclA5N2I2Z0huY29SMVdPZDROK281UDY2?=
 =?utf-8?B?SEx2OFpMKzczeTA1MWhaQm1xczNMaEUxaGZSWEN6NHpRYWkxSDlwOW9ZbmlZ?=
 =?utf-8?B?MGpvNzU3T21GVlZGSElQS3hoN2xpL0taa0N1U1k2OFJsWmFlcC9SdzFvSnYw?=
 =?utf-8?B?V3ZNTTQ4eGpKakRpa3FTVTkrYWQ1bEVRcEVTSXpLVitheDhaYmViS2J3Q28z?=
 =?utf-8?B?TktJaHRwdzlodVVkNTJuN2IvVjY4T3BQaDhuU2V5Qm90cnE4aDdOQVl2aHZW?=
 =?utf-8?B?b00wZXNUK3UwSys1RTJhQlZWRnUvMTROc0ZvMU9aZWZVcEZJdFlDNU9ia3FD?=
 =?utf-8?B?Z0tTajJJYk1DaFFyUGZObGNha1VESytqMzZoVkhrMExVckNCT0wzWlJCRWw5?=
 =?utf-8?B?NG82dEpNcDlxNjArOU1jZnA0WWJ6QXlCQzhBcmVRT09Ra3JUQStqd2dTUDlL?=
 =?utf-8?B?RHpGMFEydHRianFEYlNyRzdNWnpwZC9rYTJaVExuU0NHajI2OGJ5QlRyeE5F?=
 =?utf-8?B?TXo5blJVcytPbUsxamVyZ0hpTk1sWlAxK2Y5YXBtU2Fyb3I1ODBQT2lDWkli?=
 =?utf-8?B?U014cnVnWGhUK1c3U2RjS2FSb3NHblF5UTNLNkRNMjZqRmZnS242ME5YelBp?=
 =?utf-8?B?L20rSjRkUGtIeVVrQm5NcmNwR1JGaERGU1YxemVRdVd2NUhyMVB5dzNEM1V5?=
 =?utf-8?B?WThLTjcyZ0VNUFlMR1ZtTmdHejRnTGYzTTNqc1Z1TDhpbW1tSVJLVUZpajFm?=
 =?utf-8?B?d0R3Q2czdnV5TmxaSmNLYzZXRkxDWHB3bHZCNisxbkcwTzNwbFZpVm85emFV?=
 =?utf-8?B?bVBubkhyaHVONVA4a2t0MDlmdWhTenk5b2FBRTRkZVhVOUhhU0dVek5vc3hT?=
 =?utf-8?B?dCtNWFJ0QVUzcWZ4V054TURKcnQ5UmRkZ3Q1Z09EYTY5Ym83clpwUVd5SDh3?=
 =?utf-8?B?VU50U00yNGNMOWFuV2RIQlhlMFhBbUlIaXZCWHhFd0JjUUo0WGsvaTRCNW9U?=
 =?utf-8?B?OW41R1ljRlEvbi8zMEdTY2hraDhRNmhxaVFmYW82U1BRMnlJbjE0L1A2SzhV?=
 =?utf-8?B?QW9sM3ZqWExkOXR6SUxmbU1YTHZqSlRDdHlHaDAvTFZLWlU4VnppSFFjdGJu?=
 =?utf-8?B?Y0VwbnRpaHU2V0QrOU9wWWpuUXJKTk9OL2gvYS82T0VrNi91cHN0Q3dwOGV0?=
 =?utf-8?B?bTBwZWZjWGJwS3RWZ29ORHJqa1JsV1lTYS9yYS9RWXgvVXFsbHBPTDA1dHFO?=
 =?utf-8?B?Sm45VVVFRVlNTEpzb2psVkYwSXZtVHhNenBmTExCOTZqQW5Ua3RrZ2JlZHE0?=
 =?utf-8?B?RzZkQURNbXJHbnRTb0VmNkcrV29CdGhCaXBBZndkSm9hNFFPV093ZCtxUGs5?=
 =?utf-8?B?TVl4dDZObkxsd1VTRzRYcWJ0cFFaVmxjZ1dWdmRtS1BzeVNxVW9OdVZTL1hW?=
 =?utf-8?B?ZTQwZDA5NmNJbStMYkdxdU82bWZWWGU0M1FNTERpeURWVTV5WVQ0NkVJR3dM?=
 =?utf-8?B?RlZHb3hXYXdsT2x4MXAyUUFoRlV0aUo2elBpa2ZQOXRaVW9LK290MjBub1My?=
 =?utf-8?B?Z01NSjFHWlB5b1owaWRwSlh5RGtCeWlZbmltcFlFU2kyVFlDMGQwMWZRNU5r?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2032DBB88213764288CB0747DB575709@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931fef66-59bd-48b7-be8c-08dd4b4c6c27
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 10:02:56.0027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3yLElkuFum1ULM95nDdgpQqIvU/DFL3o/uCj7gCiu+sKMzYoEGp7RT6PXiEACWoPeILyalCB/cuytyRl0g6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843

VGhhbmtzIGZvciByZXZpZXdpbmcgdGhlIHBhdGNoIEFuZHkhCgpPbiBUdWUsIDIwMjUtMDItMTEg
YXQgMTI6MDEgKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiBFeHRlcm5hbCBlbWFpbDog
VXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+IAo+IAo+IE9uIFR1ZSwg
RmViIDExLCAyMDI1IGF0IDExOjQ5OjQ1QU0gKzA1MzAsIEthcnRpayBSYWpwdXQgd3JvdGU6Cj4g
PiBUaGUgVGVncmEyNjQgU29DIHN1cHBvcnRzIHRoZSBVVEMgKFVBUlQgVHJhY2UgQ29udHJvbGxl
ciksIHdoaWNoCj4gPiBhbGxvd3MKPiA+IG11bHRpcGxlIGZpcm13YXJlIGNsaWVudHMgKHVwIHRv
IDE2KSB0byBzaGFyZSBhIHNpbmdsZSBwaHlzaWNhbAo+ID4gVUFSVC4KPiA+IEVhY2ggY2xpZW50
IGlzIHByb3ZpZGVkIHdpdGggaXRzIG93biBpbnRlcnJ1cHQgYW5kIGhhcyBhY2Nlc3MgdG8gYQo+
ID4gMTI4LWNoYXJhY3RlciB3aWRlIEZJRk8gZm9yIGJvdGggdHJhbnNtaXQgKFRYKSBhbmQgcmVj
ZWl2ZSAoUlgpCj4gPiBvcGVyYXRpb25zLgo+ID4gCj4gPiBBZGQgdGVncmEtdXRjIGRyaXZlciB0
byBzdXBwb3J0IFRlZ3JhIFVBUlQgVHJhY2UgQ29udHJvbGxlciAoVVRDKQo+ID4gY2xpZW50Lgo+
IAo+IC4uLgo+IAo+ICsgYml0cy5oCj4gCj4gPiArI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4K
PiAKPiArIGNvbnRhaW5lcl9vZi5oCj4gKyBkZXZpY2UuaAo+ICsgZXJyLmgKPiArIGlvLmgKPiAK
PiA+ICsjaW5jbHVkZSA8bGludXgva3RocmVhZC5oPgo+IAo+ICsga2ZpZm8uaAo+IAo+ID4gKyNp
bmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAKPiArIG1vZF9kZXZpY2V0YWJsZS5oCj4gCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5o
Pgo+IAo+IFVzZSBwcm9wZXJ0eS5oIChzZWUgYWxzbyBiZWxvdykuCj4gCj4gPiArI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9zZXJpYWwuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvc2VyaWFsX2NvcmUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgv
c2xhYi5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvdHR5Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3R0eV9mbGlwLmg+Cj4gCj4gKyB0eXBlcy5o
Cj4gCgpBY2suCgo+IC4uLgo+IAo+ID4gK3N0YXRpYyB2b2lkIHRlZ3JhX3V0Y19yeF9jaGFycyhz
dHJ1Y3QgdGVncmFfdXRjX3BvcnQgKnR1cCkKPiA+ICt7Cj4gPiArwqDCoMKgwqAgc3RydWN0IHR0
eV9wb3J0ICpwb3J0ID0gJnR1cC0+cG9ydC5zdGF0ZS0+cG9ydDsKPiA+ICvCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgbWF4X2NoYXJzID0gMjU2Owo+ID4gK8KgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFn
Owo+ID4gK8KgwqDCoMKgIHUzMiBzdGF0dXM7Cj4gPiArwqDCoMKgwqAgaW50IHN5c3JxOwo+ID4g
K8KgwqDCoMKgIHUzMiBjaDsKPiA+ICsKPiA+ICvCoMKgwqDCoCB3aGlsZSAoLS1tYXhfY2hhcnMp
IHsKPiAKPiBXb3VsZG4ndCB3aGlsZSAobWF4X2NoYXJzLS0pIHsgc3VmZmljZT8KPiAKClllcywg
SSBzaG91bGQgYmUgdXNpbmcgYG1heF9jaGFycy0tYCBpbnN0ZWFkLiBJIHdpbGwgdXBkYXRlIHRo
aXMuCgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSB0ZWdyYV91dGNfcnhf
cmVhZGwodHVwLAo+ID4gVEVHUkFfVVRDX0ZJRk9fU1RBVFVTKTsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHN0YXR1cyAmIFRFR1JBX1VUQ19GSUZPX0VNUFRZKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiArCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNoID0gdGVncmFfdXRjX3J4X3JlYWRsKHR1cCwgVEVHUkFf
VVRDX0RBVEEpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFnID0gVFRZX05PUk1B
TDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHVwLT5wb3J0Lmljb3VudC5yeCsrOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc3RhdHVzICYgVEVHUkFfVVRD
X0ZJRk9fT1ZFUkZMT1cpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0dXAtPnBvcnQuaWNvdW50Lm92ZXJydW4rKzsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdWFydF9wb3J0X3VubG9jaygmdHVwLT5wb3J0KTsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3lzcnEgPSB1YXJ0X2hhbmRsZV9zeXNycV9jaGFyKCZ0dXAtPnBvcnQs
IGNoICYKPiA+IDB4ZmYpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1YXJ0X3BvcnRf
bG9jaygmdHVwLT5wb3J0KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KCFzeXNycSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHR0
eV9pbnNlcnRfZmxpcF9jaGFyKHBvcnQsIGNoLCBmbGFnKTsKPiA+ICvCoMKgwqDCoCB9Cj4gPiAr
Cj4gPiArwqDCoMKgwqAgdHR5X2ZsaXBfYnVmZmVyX3B1c2gocG9ydCk7Cj4gPiArfQo+IAo+IC4u
Lgo+IAo+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCB0ZWdyYV91dGNfaXNyKGludCBpcnEsIHZvaWQg
KmRldl9pZCkKPiA+ICt7Cj4gPiArwqDCoMKgwqAgc3RydWN0IHRlZ3JhX3V0Y19wb3J0ICp0dXAg
PSBkZXZfaWQ7Cj4gPiArwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiA+ICvCoMKgwqDC
oCB1MzIgc3RhdHVzOwo+IAo+ID4gK8KgwqDCoMKgIHVhcnRfcG9ydF9sb2NrX2lycXNhdmUoJnR1
cC0+cG9ydCwgJmZsYWdzKTsKPiAKPiBBcyBzYWlkIHByZXZpb3VzbHksIHdoeSBfaXJxc2F2ZT8K
PiAKCllvdSdyZSByaWdodCwgYXQgdGhpcyBwb2ludCB0aGUgSVJRcyBhcmUgYWxyZWFkeSBkaXNh
YmxlZCBzbyB0aGlzIGlzCm5vdCByZWFsbHkgcmVxdWlyZWQuIEkgd2lsbCB1c2UgYHVhcnRfcG9y
dF9sb2NrL3VubG9jaygpYCBpbnN0ZWFkLgoKPiA+ICvCoMKgwqDCoCAvKiBQcm9jZXNzIFJYX1JF
USBhbmQgUlhfVElNRU9VVCBpbnRlcnJ1cHRzLiAqLwo+ID4gK8KgwqDCoMKgIGRvIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gdGVncmFfdXRjX3J4X3JlYWRsKHR1cCwK
PiA+IFRFR1JBX1VUQ19JTlRSX1NUQVRVUykgJiB0dXAtPnJ4X2lycW1hc2s7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzdGF0dXMpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlZ3JhX3V0Y19yeF93cml0ZWwodHVwLCB0dXAtPnJ4X2ly
cW1hc2ssCj4gPiBURUdSQV9VVENfSU5UUl9DTEVBUik7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZWdyYV91dGNfcnhfY2hhcnModHVwKTsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgIH0gd2hpbGUgKHN0YXR1cyk7Cj4g
PiArCj4gPiArwqDCoMKgwqAgLyogUHJvY2VzcyBUWF9SRVEgaW50ZXJydXB0LiAqLwo+ID4gK8Kg
wqDCoMKgIGRvIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gdGVncmFf
dXRjX3R4X3JlYWRsKHR1cCwKPiA+IFRFR1JBX1VUQ19JTlRSX1NUQVRVUykgJiB0dXAtPnR4X2ly
cW1hc2s7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzdGF0dXMpIHsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRlZ3JhX3V0Y190eF93cml0
ZWwodHVwLCB0dXAtPnR4X2lycW1hc2ssCj4gPiBURUdSQV9VVENfSU5UUl9DTEVBUik7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZWdyYV91dGNfdHhfY2hh
cnModHVwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gK8KgwqDCoMKgIH0g
d2hpbGUgKHN0YXR1cyk7Cj4gPiArCj4gPiArwqDCoMKgwqAgdWFydF9wb3J0X3VubG9ja19pcnFy
ZXN0b3JlKCZ0dXAtPnBvcnQsIGZsYWdzKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCByZXR1cm4gSVJR
X0hBTkRMRUQ7Cj4gPiArfQo+IAo+IC4uLgo+IAo+ID4gK3sKPiA+ICvCoMKgwqDCoCBzdHJ1Y3Qg
dGVncmFfdXRjX3BvcnQgKnR1cCA9IGNvbnRhaW5lcl9vZihwb3J0LCBzdHJ1Y3QKPiA+IHRlZ3Jh
X3V0Y19wb3J0LCBwb3J0KTsKPiA+ICvCoMKgwqDCoCBpbnQgcmV0Owo+ID4gKwo+ID4gK8KgwqDC
oMKgIHRlZ3JhX3V0Y19od19pbml0KHR1cCk7Cj4gPiArCj4gPiArwqDCoMKgwqAgcmV0ID0gcmVx
dWVzdF9pcnEodHVwLT5pcnEsIHRlZ3JhX3V0Y19pc3IsIDAsIGRldl9uYW1lKHBvcnQtCj4gPiA+
ZGV2KSwgdHVwKTsKPiA+ICvCoMKgwqDCoCBpZiAocmV0IDwgMCkgewo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKHBvcnQtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBpbnRl
cnJ1cHQKPiA+IGhhbmRsZXJcbiIpOwo+IAo+IEluc3RlYWQgb2YgdGhlc2UgTG9Dcy4uLgo+IAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gK8KgwqDCoMKgIH0K
PiA+ICsKPiA+ICvCoMKgwqDCoCByZXR1cm4gMDsKPiAKPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0OwoKQWNrLgoKPiAKPiA+ICt9Cj4gCj4gLi4uCj4gCj4gPiArc3RhdGljIGludCB0ZWdyYV91
dGNfZ2V0X3BvbGxfY2hhcihzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+ID4gK3sKPiA+ICvCoMKg
wqDCoCBzdHJ1Y3QgdGVncmFfdXRjX3BvcnQgKnR1cCA9IGNvbnRhaW5lcl9vZihwb3J0LCBzdHJ1
Y3QKPiA+IHRlZ3JhX3V0Y19wb3J0LCBwb3J0KTsKPiA+ICsKPiA+ICvCoMKgwqDCoCB3aGlsZSAo
dGVncmFfdXRjX3J4X3JlYWRsKHR1cCwgVEVHUkFfVVRDX0ZJRk9fU1RBVFVTKSAmCj4gPiBURUdS
QV9VVENfRklGT19FTVBUWSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1X3JlbGF4
KCk7Cj4gCj4gTm8gd2F5IG91dD8gSFcgbWlnaHQgZ2V0IHN0dWNrLi4uCgpBY2suIEkgd2lsbCB1
cGRhdGUgdGhpcyB0byB1c2UgYHJlYWRfcG9sbF90aW1lb3V0X2F0b21pY2AuCgo+IAo+ID4gK8Kg
wqDCoMKgIHJldHVybiB0ZWdyYV91dGNfcnhfcmVhZGwodHVwLCBURUdSQV9VVENfREFUQSk7Cj4g
PiArfQo+IAo+IC4uLgo+IAo+ID4gK3N0YXRpYyB2b2lkIHRlZ3JhX3V0Y19wdXRfcG9sbF9jaGFy
KHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsCj4gPiB1bnNpZ25lZCBjaGFyIGNoKQo+ID4gK3sKPiA+
ICvCoMKgwqDCoCBzdHJ1Y3QgdGVncmFfdXRjX3BvcnQgKnR1cCA9IGNvbnRhaW5lcl9vZihwb3J0
LCBzdHJ1Y3QKPiA+IHRlZ3JhX3V0Y19wb3J0LCBwb3J0KTsKPiA+ICsKPiA+ICvCoMKgwqDCoCB3
aGlsZSAodGVncmFfdXRjX3R4X3JlYWRsKHR1cCwgVEVHUkFfVVRDX0ZJRk9fU1RBVFVTKSAmCj4g
PiBURUdSQV9VVENfRklGT19GVUxMKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcHVf
cmVsYXgoKTsKPiAKPiBEaXR0by4KCkFjay4KCj4gCj4gPiArwqDCoMKgwqAgdGVncmFfdXRjX3R4
X3dyaXRlbCh0dXAsIGNoLCBURUdSQV9VVENfREFUQSk7Cj4gPiArfQo+IAo+IC4uLgo+IAo+ID4g
K3N0YXRpYyBzdHJ1Y3QgdWFydF9kcml2ZXIgdGVncmFfdXRjX2RyaXZlciA9IHsKPiA+ICvCoMKg
wqDCoCAuZHJpdmVyX25hbWXCoMKgwqAgPSAidGVncmEtdXRjIiwKPiA+ICvCoMKgwqDCoCAuZGV2
X25hbWXCoMKgwqDCoMKgwqAgPSAidHR5VVRDIiwKPiAKPiA+ICvCoMKgwqDCoCAubnLCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSBVQVJUX05SCj4gCj4gTGVhdmUgdHJhaWxpbmcgY29tbWEuCgpB
Y2suCgo+IAo+ID4gK307Cj4gCj4gLi4uCj4gCj4gPiArc3RhdGljIHZvaWQgdGVncmFfdXRjX3Nl
dHVwX3BvcnQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QKPiA+IHRlZ3JhX3V0Y19wb3J0ICp0
dXApCj4gPiArewo+ID4gK8KgwqDCoMKgIHR1cC0+cG9ydC5kZXbCoMKgwqDCoMKgwqDCoMKgwqDC
oCA9IGRldjsKPiA+ICvCoMKgwqDCoCB0dXAtPnBvcnQuZmlmb3NpemXCoMKgwqDCoMKgID0gdHVw
LT5zb2MtPmZpZm9zaXplOwo+ID4gK8KgwqDCoMKgIHR1cC0+cG9ydC5mbGFnc8KgwqDCoMKgwqDC
oMKgwqAgPSBVUEZfQk9PVF9BVVRPQ09ORjsKPiA+ICvCoMKgwqDCoCB0dXAtPnBvcnQuaW90eXBl
wqDCoMKgwqDCoMKgwqAgPSBVUElPX01FTTsKPiA+ICvCoMKgwqDCoCB0dXAtPnBvcnQub3BzwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSAmdGVncmFfdXRjX3VhcnRfb3BzOwo+ID4gK8KgwqDCoMKgIHR1
cC0+cG9ydC50eXBlwqDCoMKgwqDCoMKgwqDCoMKgID0gUE9SVF9URUdSQV9UQ1U7Cj4gPiArwqDC
oMKgwqAgdHVwLT5wb3J0LnByaXZhdGVfZGF0YcKgID0gdHVwOwo+ID4gKwo+ID4gKyNpZiBJU19F
TkFCTEVEKENPTkZJR19TRVJJQUxfVEVHUkFfVVRDX0NPTlNPTEUpCj4gPiArwqDCoMKgwqAgc3Ry
c2NweSh0dXAtPmNvbnNvbGUubmFtZSwgInR0eVVUQyIsIHNpemVvZih0dXAtCj4gPiA+Y29uc29s
ZS5uYW1lKSk7Cj4gPiArwqDCoMKgwqAgdHVwLT5jb25zb2xlLndyaXRlwqDCoMKgwqDCoCA9IHRl
Z3JhX3V0Y19jb25zb2xlX3dyaXRlOwo+ID4gK8KgwqDCoMKgIHR1cC0+Y29uc29sZS5kZXZpY2XC
oMKgwqDCoCA9IHVhcnRfY29uc29sZV9kZXZpY2U7Cj4gPiArwqDCoMKgwqAgdHVwLT5jb25zb2xl
LnNldHVwwqDCoMKgwqDCoCA9IHRlZ3JhX3V0Y19jb25zb2xlX3NldHVwOwo+ID4gK8KgwqDCoMKg
IHR1cC0+Y29uc29sZS5mbGFnc8KgwqDCoMKgwqAgPSBDT05fUFJJTlRCVUZGRVIgfCBDT05fQ09O
U0RFViB8Cj4gPiBDT05fQU5ZVElNRTsKPiA+ICvCoMKgwqDCoCB0dXAtPmNvbnNvbGUuZGF0YcKg
wqDCoMKgwqDCoCA9ICZ0ZWdyYV91dGNfZHJpdmVyOwo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gK8Kg
wqDCoMKgIHVhcnRfcmVhZF9wb3J0X3Byb3BlcnRpZXMoJnR1cC0+cG9ydCk7Cj4gCj4gTm8gZmFp
bHVyZSBoYW5kbGluZz8gSW4gc29tZSBjYXNlcyBpdCBtaWdodCByZXR1cm4gYW4gZXJyb3IuCgpB
Y2ssIEkgd2lsbCBwcm9wYWdhdGUgdGhlIGVycm9yIHByb3Blcmx5LgoKPiAKPiA+ICt9Cj4gCj4g
Li4uCj4gCj4gPiArc3RhdGljIGludCB0ZWdyYV91dGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKPiA+ICt7Cj4gPiArwqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9
IHBkZXYtPmRldi5vZl9ub2RlOwo+ID4gK8KgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7Cj4gPiArwqDCoMKgwqAgc3RydWN0IHRlZ3JhX3V0Y19wb3J0ICp0dXA7Cj4gPiAr
wqDCoMKgwqAgaW50IHJldDsKPiA+ICsKPiA+ICvCoMKgwqDCoCB0dXAgPSBkZXZtX2t6YWxsb2Mo
JnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCB0ZWdyYV91dGNfcG9ydCksCj4gPiBHRlBfS0VSTkVM
KTsKPiAKPiBzaXplb2YoKnR1cCkKPiAKPiA+ICvCoMKgwqDCoCBpZiAoIXR1cCkKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4gCj4gPiArwqDCoMKgwqAgcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJ0eC10aHJlc2hvbGQiLCAmdHVwLQo+ID4gPnR4
X3RocmVzaG9sZCk7Cj4gCj4gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKCkKCkFjay4KCj4gCj4g
PiArwqDCoMKgwqAgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJtaXNzaW5nIHR4LXRocmVzaG9sZAo+ID4gZGV2aWNl
LXRyZWUgcHJvcGVydHlcbiIpOwo+ID4gKwo+ID4gK8KgwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAicngtdGhyZXNob2xkIiwgJnR1cC0KPiA+ID5yeF90aHJlc2hvbGQpOwo+
IAo+IERpdHRvLgoKQWNrLgoKPiAKPiA+ICvCoMKgwqDCoCBpZiAocmV0KQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIm1pc3Npbmcg
cngtdGhyZXNob2xkCj4gPiBkZXZpY2UtdHJlZSBwcm9wZXJ0eVxuIik7Cj4gCj4gPiArwqDCoMKg
wqAgdHVwLT5pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+ID4gK8KgwqDCoMKgIGlm
ICh0dXAtPmlycSA8IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0dXAt
PmlycTsKPiAKPiB1YXJ0X3JlYWRfcG9ydF9wcm9wZXJ0aWVzKCkgZG9lcyB0aGlzIGZvciB5b3Uu
CgpBY2suCgo+IAo+ID4gK8KgwqDCoMKgIHR1cC0+c29jID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwo+IAo+IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpCgpBY2suCgo+IAo+
ID4gK8KgwqDCoMKgIHR1cC0+dHhfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwKPiA+ICJ0eCIpOwo+ID4gK8KgwqDCoMKgIGlmIChJU19FUlIodHVwLT50
eF9iYXNlKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIodHVw
LT50eF9iYXNlKTsKPiA+ICsKPiA+ICvCoMKgwqDCoCB0dXAtPnJ4X2Jhc2UgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsCj4gPiAicngiKTsKPiA+ICvCoMKgwqDC
oCBpZiAoSVNfRVJSKHR1cC0+cnhfYmFzZSkpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBQVFJfRVJSKHR1cC0+cnhfYmFzZSk7Cj4gPiArCj4gPiArwqDCoMKgwqAgdGVncmFf
dXRjX3NldHVwX3BvcnQoJnBkZXYtPmRldiwgdHVwKTsKPiA+ICvCoMKgwqDCoCBwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCB0dXApOwo+ID4gKwo+ID4gK8KgwqDCoMKgIHJldHVybiB0ZWdyYV91
dGNfcmVnaXN0ZXJfcG9ydCh0dXApOwo+ID4gK30KPiAKPiAtLQo+IFdpdGggQmVzdCBSZWdhcmRz
LAo+IEFuZHkgU2hldmNoZW5rbwo+IAo+IAoKVGhhbmtzLApLYXJ0aWsK

