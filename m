Return-Path: <linux-tegra+bounces-1198-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946F876323
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Mar 2024 12:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D4291C20AEA
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Mar 2024 11:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E739055E57;
	Fri,  8 Mar 2024 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IqFBkAJ2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2059.outbound.protection.outlook.com [40.107.114.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535485102A;
	Fri,  8 Mar 2024 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709896958; cv=fail; b=r8JIQ3LZ9l/qhgHbft3mn1o71t0ACsZMlne3rqZSpAU3PxXsJMceXxtp25EQjHEeAXymLbfyNH0qpQTEsZKxkFQ5UGb02JfZJm2gZyLWpjfzYkpBWGyCgvMXkUPy6BiRg8+m3z6aUymFp2pvTY/FY1EzNsVWPM3WXN47htQZWM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709896958; c=relaxed/simple;
	bh=dgWS5GXlcd7XflkL7Nx3aOxp41bG4JVQG2XS4XiDfHM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WiQMQ69Q536Wz1xHeUyzlguuBGSa5TtvppYwX3dT9mZa1qwqWiLcL0NHcW2I9Sh32FCOA3aNAmxX404884LkPIJGFUbon+vMMcKw9wrlVkMFFIoR8ogeqGJBtH1qug1YcGJ+6nE3eQNTrll4WiMQlYqFZy0mN7ChgMZBP9wu/tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IqFBkAJ2; arc=fail smtp.client-ip=40.107.114.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha18yrkpSu5Um+r0GEBcyzw18THg2k9ZGt/RTU8rkGfyJR15PTScGFKAx2+dTbcC4QAVH6tU60WsM5k3NMRofK5M9T6dWwdjWUA+tfoPd7SCWEaoECh3ujpS2SSs3XaxkZzfCsXzS5ROfoaSleDVlE35xmSqiNbRmwGOt12uea4OpRrQ/4irDrC2UPeX6kuHa4HhmwZdpdxZ0B3EDdu7l7BK+SLKRkHujL6h1JEz4qeFEPo2s4/AqSnIzZ1SjUHVYEr37es3jcPB4Z3AowaQL6KpAOUJbgC+3x67D4h5UVTPV1X9sNDtgQXdwckVcK0zORJHteHxeqtZAl7EPBpvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgWS5GXlcd7XflkL7Nx3aOxp41bG4JVQG2XS4XiDfHM=;
 b=NtZDSL3VaoBxz4X91bEwVoV80igBEFIhhjXQqTlhUQz6mGVks4hJYQMhYm/dwe6SMuVN4P7pDP87uXPlxHmvaaCifUTON252HDJj6NOohea18u8Zxb5PCr89hm+hvNcXKgxyuDzEbJ15A+pWv6+kwVvmrLL+8wuYLuOzoB1wqAaqpzpLSSZCyB6awcO0esjKaSMIweUx2nQKqliJj299zopUakIJ83U9iTiXnqf4t82Le8ocCT3kXEy08gwfn8zSkKKDCy7uIQ8rOvWkhuhmmaAGm91YoSAsgxhbi24RWevIUadHBzuSegrG25wtG6StP3ubDf8HpZ2CavGPuxgwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgWS5GXlcd7XflkL7Nx3aOxp41bG4JVQG2XS4XiDfHM=;
 b=IqFBkAJ2TCj3ujnXHtvgD3R2KTVVeHabk8jFIljx2D07btwdJb2XCz9Mi47j1A3Bq/rJyAC03RLU8bI4Wxh31+YqlLpB+FUAXjyHFLd+rKr4jrrQm9/ifwlev7Yw8IDxaLu5OaZDWTzFhqcIurfQK4oWXP9iwzaT8QBDfgXuYYI=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TY3PR01MB11220.jpnprd01.prod.outlook.com (2603:1096:400:3d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 11:22:32 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::f9d2:106:9dc3:224f%3]) with mapi id 15.20.7362.029; Fri, 8 Mar 2024
 11:22:32 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jingoo Han
	<jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Marek Vasut
	<marek.vasut+renesas@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
	<l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Srikanth
 Thokala <srikanth.thokala@intel.com>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Niklas Cassel <cassel@kernel.org>,
	"linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>
Subject: RE: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Thread-Topic: [PATCH v9 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Thread-Index: AQHabhWqjBYw8JYd4ki71hwSrJ2UPbEtuXHw
Date: Fri, 8 Mar 2024 11:22:32 +0000
Message-ID:
 <TYCPR01MB110402C977505FEA8E3A420DDD8272@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-6-29d433d99cda@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TY3PR01MB11220:EE_
x-ms-office365-filtering-correlation-id: 9b01069d-048b-417b-1e79-08dc3f620c48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 UJxTmu4ACmFp5yh86hsX3wG/LCdkBMIwXlqoEx7saSyihrlDViy1ahUWJaBt2vQEJ3S2em39PYoDf0RNoPmCysD0pVKfWmjAnoJ1M4EtdBtvfR5okuGRDxX3byShWWGMYY6+DZ75f6qaWYA8gZcG1QqbIHM7labOYsaRLg6c8tWCXsERemlh8I19k2HlaNdNoNHvp2t7nqCdK37wEuQRfRS6HVPGjFolQX5dNzizuBVT0j+hUiSwpUD7v2OOKbwpVhRvo967LnUlfLv/onORl+a4uPrR8+GgT645XXCt8qR5uTD8cykX9Kda5b4Vq7btPp8kkNGFhSslsVHtJGOqaLXUVtZ3drlfSVfp40jKx/aKckqmes7wWB+5zQkumxBKoh61snnuVq7mu0Ao3IsL2xq/z+zH9c7gYBaJ/xjNBXE27m4EFwI29lVDkoXGqKc1+bYJjFHhrQlarNEGHhZNpA692kOdMsj+YsCNJ0tiMj2WWr2rPkGKAtVn2Rok1evGRlNCO2NdgU2UPd5ZttB7WPf7rOqD+PQ8NxSmrKaNEBMoXarKlM30woJ+4PYWsSRXb7yXxU2RZrno9WglP0CcCwj3t8KEM8NUwgIKoWFZ8pUat8K2AytHsUi0E2McOaUitdEAF/OWb+S9FKxm7BWQh4VPsxgEMJgxLxVnI4/j1PHOJj0GUpxbQqniTE2ne8SQ7QWoNLcnu7QMz62jq/DXt3gBROaWCJv4+2kzy+9p5l4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cDdDMnVBWkl4ak1kSXJUWEt6ODQ2VXRYYXlUYUY5VWg4d25wd2RFMU1KOXNa?=
 =?utf-8?B?aGNVZk95eFR5ZnhkeHFrZ2YwSDJ5NUp3anBoZHQzZTJhaXIvVDRrSW9hMldo?=
 =?utf-8?B?aHN0UmNudHBsRkRBbjNVUlA0cEo2YnZwY0o3Mms2VEN1cUp3WXFJZExpbXZ0?=
 =?utf-8?B?aDNZL0FISjVWWUw1YTZsZGlPSjVpZDVvSmM1RmQvWlkrZU9UL0NoZUYrRW5m?=
 =?utf-8?B?TEpaMHg3VWdQSzFtRGFrNHkxcnN2UDYwWTRMcmowY0VIQ0RXOWt2QjFHVHRN?=
 =?utf-8?B?QnYyQ2cxclBFcmg4STkxemxKdHpTdHhEMTlVUXh2VnZVWkllZmlxYTFFallH?=
 =?utf-8?B?NHc0d0NwS3dBRkoxcVJ4SDl2SVc3cXh3a0dxcGRFSlEwUUpQZ0dyaDVPMC83?=
 =?utf-8?B?WldyelJJdFgwZ0FFVmVraDcwckxWSmpIVjF5VDlCQlpzazhjeTh0LzJrbTAy?=
 =?utf-8?B?N29BYXozSm9CdmNkYnJkMGwzclRpbU42dzZJZFFnZHB5cWxOYmQ5QWNZSXhz?=
 =?utf-8?B?T2hkUDVPS0d0ZEFUbDE3Q2FVTU9PLzQ0VGJrNzROZ2R4blRreHNOZ1VFWU9u?=
 =?utf-8?B?dFNUTHM3Q1NsMFZYRS9hakcraTR4c1R0dUtnWENwMWVSWGJjaTNXaU1ocVVH?=
 =?utf-8?B?L3VtWDVjNXd0SGhSVTU5bkNIQk9lYkF3RnBiR0pUbXBiRXkzZ1hFSEh4VXpE?=
 =?utf-8?B?d1BBNVZMS1lZRGJyWmtiVGMrSDZ2bVZpaFF2eVRHNGUwTTFEcWg1ZTloUE1S?=
 =?utf-8?B?YkwySWluK0pkZEEwQWxkblZ5eVc5ZjRwcGt0bVo4YXBTM1Q1a0hIb0xmWG1I?=
 =?utf-8?B?UllKbE0rdUpKWHhBK3JqeWVMWmJmWG9iWmpyTXpXai90UkZjc2x5bm52bzYv?=
 =?utf-8?B?dWNlc29BR3ZlcGJXcDNHNzdha1dNZjNNUnYwdmxtT0RVL3lZdlB5bWphS0cr?=
 =?utf-8?B?cUxCaGl3aGY3SEc2bnJHa1YwV2oxaEd6VFpxUUFqV3dkWVduZkxpUWFHK2Y4?=
 =?utf-8?B?MFV1OVVPcUd0MTlPN0lEZERMMUY1WXlmOFFZTUFQSmFtUG9QcXRkWTFPVWdu?=
 =?utf-8?B?ZWNRc3dWRDBqd3hCT1JPdlQrckVyRmc4V1N3a3MwQXZINmdsOUVRWXpKTHpY?=
 =?utf-8?B?YmxFcVFJS0xTby9jMGJlSm5SbldtUE93SmZCeGxKRzRyUFRXSXlEMnIvc0Qy?=
 =?utf-8?B?emRJRlRHcmw2ZVljQnN4ZVo4MUJEZktsK0lnMVZWZExZZWREeEFUMkg3V0RR?=
 =?utf-8?B?VGR4NDRWU3hNaGtUY2lpUnd1MTdDZE82ZG04Q016S1daVmtqUGhHUTZVa1gz?=
 =?utf-8?B?anp2WmZIckQyTjZJYi9NWmpmR3dRYjZvdHBIYWFMc3czU2pybGNMNWlqZ2Qw?=
 =?utf-8?B?QUd4RGJrRVhTVk9NOGMzbFRIMkxjM3VoVXZ2cU5UclMvNHNGenVIbzVROGNp?=
 =?utf-8?B?UzEzMmRaU0xPMHBDTk4xbDdEUS90QUdSTWdtRmRmRmFQZWN5T3Q4MXZUcUhq?=
 =?utf-8?B?c2p5V0lvd09NanJQd1NuVHhtMFhmay9GQ1UwOUU1Z2NNdzE4WXpMUFEvSW9t?=
 =?utf-8?B?bUhRbzNkKzRGcFFNRlNLU2pDZjhMeGZ1K21XUm1EaHF0Nm1yWDFkSUc4ZmhV?=
 =?utf-8?B?Wi8zanoxM24xWThCMWFIMUJleWlGSWRka3hIdjVLakZpTWdCNk5wQWpCQXI5?=
 =?utf-8?B?TzFwcWJHU2RaKzNxYzJpc3dtTFRkbi83MVhJbS9tc3VZZmJMd2dHVzc0ME1v?=
 =?utf-8?B?SmIvekpIZkwrOEpVM0JvTDU3SDdCZGZxaUloQk5aU0ZqdmNTMGdrcW1VQlR6?=
 =?utf-8?B?UmRTM3JJR1JHNDdBbVhUMlBTYUxSYThsTjFWTTgxT0RyWlpzZE02ZnM1M2FI?=
 =?utf-8?B?RThFMnF3U1FmTDFhblIyd3hQSHlVQWJVb3RTSmp2RWNodjJ5YVRqRit6dnhC?=
 =?utf-8?B?N081WktsZjY3OEhoYm1TR01GbGpGYkVUekN6V2J6Zm4xTWRoejdyYjhlQmph?=
 =?utf-8?B?Q3VqRENuWEpwbHNNTnlMTURUNTVpZzE1M2ZxMlJ4VkFnMWhOeHRPZUtETUhR?=
 =?utf-8?B?d0xwbmtRL2VVdmREWUVNU2l6WlZJSDRWUEl6QTE1RFh4ZlFVbTZudHovaE1r?=
 =?utf-8?B?bys0K013S0xKdjIyMkhoSFBwSW5YSTgrOHpOcFRVV0dhQmdxSlhEWWZpdHZo?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b01069d-048b-417b-1e79-08dc3f620c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:22:32.4634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byEgsX82VUhjJuS7Zom/h7CMYM7WNXjhXM9nLmKNRrKaGwpR+77SoP/t0N1M3smbYDX2hL2I76V3qbWHQHapYKcR2nb62bjgjTRrLLM9VrvPCzueugp02dwmaaAzjYMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

PiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6IE1vbmRheSwgTWFyY2ggNCwgMjAy
NCA2OjIyIFBNDQo+IA0KPiBDdXJyZW50bHksIGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoKSBB
UEkgaXMgZGlyZWN0bHkgY2FsbGVkIGJ5IHRoZSBnbHVlDQo+IGRyaXZlcnMgcmVxdWlyaW5nIGFj
dGl2ZSByZWZjbGsgZnJvbSBob3N0LiBCdXQgZm9yIHRoZSBvdGhlciBkcml2ZXJzLCBpdCBpcw0K
PiBnZXR0aW5nIGNhbGxlZCBpbXBsaWNpdGx5IGJ5IGR3X3BjaWVfZXBfaW5pdCgpLiBUaGlzIGlz
IGR1ZSB0byB0aGUgZmFjdA0KPiB0aGF0IHRoaXMgQVBJIGluaXRpYWxpemVzIERXQyBFUCBzcGVj
aWZpYyByZWdpc3RlcnMgYW5kIHRoYXQgcmVxdWlyZXMgYW4NCj4gYWN0aXZlIHJlZmNsayAoZWl0
aGVyIGZyb20gaG9zdCBvciBnZW5lcmF0ZWQgbG9jYWxseSBieSBlbmRwb2ludCBpdHNlZikuDQo+
IA0KPiBCdXQsIHRoaXMgY2F1c2VzIGEgZGlzY3JlcGFuY3kgYW1vbmcgdGhlIGdsdWUgZHJpdmVy
cy4gU28gdG8gYXZvaWQgdGhpcw0KPiBjb25mdXNpb24sIGxldCdzIGNhbGwgdGhpcyBBUEkgZGly
ZWN0bHkgZnJvbSBhbGwgZ2x1ZSBkcml2ZXJzIGlycmVzcGVjdGl2ZQ0KPiBvZiByZWZjbGsgZGVw
ZW5kZW5jeS4gT25seSBkaWZmZXJlbmNlIGhlcmUgaXMgdGhhdCB0aGUgZHJpdmVycyByZXF1aXJp
bmcNCj4gcmVmY2xrIGZyb20gaG9zdCB3aWxsIGNhbGwgdGhpcyBBUEkgb25seSBhZnRlciB0aGUg
cmVmY2xrIGlzIHJlY2VpdmVkIGFuZA0KPiBvdGhlciBkcml2ZXJzIHdpdGhvdXQgcmVmY2xrIGRl
cGVuZGVuY3kgd2lsbCBjYWxsIHRoaXMgQVBJIHJpZ2h0IGFmdGVyDQo+IGR3X3BjaWVfZXBfaW5p
dCgpLg0KPiANCj4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGNoZWNrIGZvciAnY29yZV9pbml0X25v
dGlmaWVyJyBmbGFnIGNhbiBub3cgYmUNCj4gZHJvcHBlZCBmcm9tIGR3X3BjaWVfZXBfaW5pdCgp
IEFQSS4gVGhpcyB3aWxsIGFsc28gYWxsb3cgdXMgdG8gcmVtb3ZlIHRoZQ0KPiAnY29yZV9pbml0
X25vdGlmaWVyJyBmbGFnIGNvbXBsZXRlbHkgaW4gdGhlIGxhdGVyIGNvbW1pdHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZh
bUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1k
cmE3eHguYyAgICAgICAgICAgfCAgNyArKysrKysrDQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2ktaW14Ni5jICAgICAgICAgICAgIHwgIDggKysrKysrKysNCj4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jICAgICAgICAgfCAgOSArKysrKysrKysNCj4g
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgICAgfCAgNyAr
KysrKysrDQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWFydHBlYzYuYyAgICAg
ICAgIHwgMTMgKysrKysrKysrKysrLQ0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLWVwLmMgICB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1wbGF0LmMgfCAgOSArKysrKysr
KysNCj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUta2VlbWJheS5jICAgICAgICAg
fCAxNiArKysrKysrKysrKysrKystDQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXJjYXItZ2VuNC5jICAgICAgIHwgMTIgKysrKysrKysrKystDQoNClRoYW5rIHlvdSBmb3IgdGhl
IHBhdGNoISBBYm91dCBwY2llLXJjYXItZ2VuNC5jLA0KDQpSZXZpZXdlZC1ieTogWW9zaGloaXJv
IFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLXVuaXBoaWVyLWVwLmMgICAgIHwgMTMgKysrKysrKysrKysrLQ0KPiAgMTAgZmlsZXMgY2hh
bmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jDQo+IGluZGV4IDBlNDA2Njc3MDYwZC4uMzk1MDQy
YjI5ZmZjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZHJh
N3h4LmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWRyYTd4eC5jDQo+
IEBAIC00NjcsNiArNDY3LDEzIEBAIHN0YXRpYyBpbnQgZHJhN3h4X2FkZF9wY2llX2VwKHN0cnVj
dCBkcmE3eHhfcGNpZSAqZHJhN3h4LA0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gDQo+ICsJ
cmV0ID0gZHdfcGNpZV9lcF9pbml0X3JlZ2lzdGVycyhlcCk7DQo+ICsJaWYgKHJldCkgew0KPiAr
CQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIERXQyBlbmRwb2ludCByZWdpc3Rl
cnNcbiIpOw0KPiArCQlkd19wY2llX2VwX2RlaW5pdChlcCk7DQo+ICsJCXJldHVybiByZXQ7DQo+
ICsJfQ0KPiArDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaS1pbXg2LmMNCj4gaW5kZXggZGMyYzAzNmFiMjhjLi5iZmNhZmE0NDBkZGIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMNCj4gKysrIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYw0KPiBAQCAtMTEzNiw2ICsxMTM2
LDE0IEBAIHN0YXRpYyBpbnQgaW14Nl9hZGRfcGNpZV9lcChzdHJ1Y3QgaW14Nl9wY2llICppbXg2
X3BjaWUsDQo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGluaXRpYWxpemUgZW5kcG9pbnRc
biIpOw0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gKw0KPiArCXJldCA9IGR3X3BjaWVfZXBf
aW5pdF9yZWdpc3RlcnMoZXApOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJZGV2X2VycihkZXYsICJG
YWlsZWQgdG8gaW5pdGlhbGl6ZSBEV0MgZW5kcG9pbnQgcmVnaXN0ZXJzXG4iKTsNCj4gKwkJZHdf
cGNpZV9lcF9kZWluaXQoZXApOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiAgCS8q
IFN0YXJ0IExUU1NNLiAqLw0KPiAgCWlteDZfcGNpZV9sdHNzbV9lbmFibGUoZGV2KTsNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5jDQo+IGluZGV4IGMwYzYy
NTMzYTNmMS4uODM5Mjg5NGVkMjg2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2kta2V5c3RvbmUuYw0KPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2kta2V5c3RvbmUuYw0KPiBAQCAtMTI4Niw2ICsxMjg2LDEzIEBAIHN0YXRpYyBpbnQga3Nf
cGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXQgPSBkd19w
Y2llX2VwX2luaXQoJnBjaS0+ZXApOw0KPiAgCQlpZiAocmV0IDwgMCkNCj4gIAkJCWdvdG8gZXJy
X2dldF9zeW5jOw0KPiArDQo+ICsJCXJldCA9IGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoJnBj
aS0+ZXApOw0KPiArCQlpZiAocmV0IDwgMCkgew0KPiArCQkJZGV2X2VycihkZXYsICJGYWlsZWQg
dG8gaW5pdGlhbGl6ZSBEV0MgZW5kcG9pbnQgcmVnaXN0ZXJzXG4iKTsNCj4gKwkJCWdvdG8gZXJy
X2VwX2luaXQ7DQo+ICsJCX0NCj4gKw0KPiAgCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQlk
ZXZfZXJyKGRldiwgIklOVkFMSUQgZGV2aWNlIHR5cGUgJWRcbiIsIG1vZGUpOw0KPiBAQCAtMTI5
NSw2ICsxMzAyLDggQEAgc3RhdGljIGludCBrc19wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+IA0KPiAgCXJldHVybiAwOw0KPiANCj4gK2Vycl9lcF9pbml0Og0KPiAr
CWR3X3BjaWVfZXBfZGVpbml0KCZwY2ktPmVwKTsNCj4gIGVycl9nZXRfc3luYzoNCj4gIAlwbV9y
dW50aW1lX3B1dChkZXYpOw0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYpOw0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gaW5kZXggMmUz
OTg0OTRlN2MwLi5iNzEyZmRkMDY1NDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiBAQCAtMjc2LDYgKzI3NiwxMyBAQCBzdGF0
aWMgaW50IF9faW5pdCBsc19wY2llX2VwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gDQo+ICsJcmV0ID0gZHdfcGNp
ZV9lcF9pbml0X3JlZ2lzdGVycygmcGNpLT5lcCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIERXQyBlbmRwb2ludCByZWdpc3RlcnNcbiIp
Ow0KPiArCQlkd19wY2llX2VwX2RlaW5pdCgmcGNpLT5lcCk7DQo+ICsJCXJldHVybiByZXQ7DQo+
ICsJfQ0KPiArDQo+ICAJcmV0dXJuIGxzX3BjaWVfZXBfaW50ZXJydXB0X2luaXQocGNpZSwgcGRl
dik7DQo+ICB9DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1hcnRwZWM2LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWFydHBlYzYu
Yw0KPiBpbmRleCA5ZWQwYTliYTc2MTkuLjBlZGQ5YWIzZjEzOSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRwZWM2LmMNCj4gKysrIGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRwZWM2LmMNCj4gQEAgLTQ0MSw3ICs0NDEsMTggQEAg
c3RhdGljIGludCBhcnRwZWM2X3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gDQo+ICAJCXBjaS0+ZXAub3BzID0gJnBjaWVfZXBfb3BzOw0KPiANCj4gLQkJcmV0dXJu
IGR3X3BjaWVfZXBfaW5pdCgmcGNpLT5lcCk7DQo+ICsJCXJldCA9IGR3X3BjaWVfZXBfaW5pdCgm
cGNpLT5lcCk7DQo+ICsJCWlmIChyZXQgPCAwKQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiAr
CQlyZXQgPSBkd19wY2llX2VwX2luaXRfcmVnaXN0ZXJzKCZwY2ktPmVwKTsNCj4gKwkJaWYgKHJl
dCkgew0KPiArCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBEV0MgZW5kcG9p
bnQgcmVnaXN0ZXJzXG4iKTsNCj4gKwkJCWR3X3BjaWVfZXBfZGVpbml0KCZwY2ktPmVwKTsNCj4g
KwkJCXJldHVybiByZXQ7DQo+ICsJCX0NCj4gKw0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0K
PiAgCQlkZXZfZXJyKGRldiwgIklOVkFMSUQgZGV2aWNlIHR5cGUgJWRcbiIsIGFydHBlYzZfcGNp
ZS0+bW9kZSk7DQo+ICAJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUtZXAuYw0KPiBpbmRleCBlZDFmMmFmZDgzMGEuLjI3OGJkYzliMjI2OSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVw
LmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVw
LmMNCj4gQEAgLTcyOSw3ICs3MjksNiBAQCBpbnQgZHdfcGNpZV9lcF9pbml0KHN0cnVjdCBkd19w
Y2llX2VwICplcCkNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwY2ktPmRldjsNCj4gIAlzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ICAJ
c3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLQljb25zdCBzdHJ1Y3Qg
cGNpX2VwY19mZWF0dXJlcyAqZXBjX2ZlYXR1cmVzOw0KPiANCj4gIAlJTklUX0xJU1RfSEVBRCgm
ZXAtPmZ1bmNfbGlzdCk7DQo+IA0KPiBAQCAtNzc1LDI5ICs3NzQsOCBAQCBpbnQgZHdfcGNpZV9l
cF9pbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkNCj4gIAkJZ290byBlcnJfZXhpdF9lcGNfbWVt
Ow0KPiAgCX0NCj4gDQo+IC0JaWYgKGVwLT5vcHMtPmdldF9mZWF0dXJlcykgew0KPiAtCQllcGNf
ZmVhdHVyZXMgPSBlcC0+b3BzLT5nZXRfZmVhdHVyZXMoZXApOw0KPiAtCQlpZiAoZXBjX2ZlYXR1
cmVzLT5jb3JlX2luaXRfbm90aWZpZXIpDQo+IC0JCQlyZXR1cm4gMDsNCj4gLQl9DQo+IC0NCj4g
LQkvKg0KPiAtCSAqIE5PVEU6LSBBdm9pZCBhY2Nlc3NpbmcgdGhlIGhhcmR3YXJlIChFeDotIERC
SSBzcGFjZSkgYmVmb3JlIHRoaXMNCj4gLQkgKiBzdGVwIGFzIHBsYXRmb3JtcyB0aGF0IGltcGxl
bWVudCAnY29yZV9pbml0X25vdGlmaWVyJyBmZWF0dXJlIG1heQ0KPiAtCSAqIG5vdCBoYXZlIHRo
ZSBoYXJkd2FyZSByZWFkeSAoaS5lLiBjb3JlIGluaXRpYWxpemVkKSBmb3IgYWNjZXNzDQo+IC0J
ICogKEV4OiB0ZWdyYTE5NCkuIEFueSBoYXJkd2FyZSBhY2Nlc3Mgb24gc3VjaCBwbGF0Zm9ybXMg
cmVzdWx0DQo+IC0JICogaW4gc3lzdGVtIGhhbmcuDQo+IC0JICovDQo+IC0JcmV0ID0gZHdfcGNp
ZV9lcF9pbml0X3JlZ2lzdGVycyhlcCk7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBlcnJfZnJl
ZV9lcGNfbWVtOw0KPiAtDQo+ICAJcmV0dXJuIDA7DQo+IA0KPiAtZXJyX2ZyZWVfZXBjX21lbToN
Cj4gLQlwY2lfZXBjX21lbV9mcmVlX2FkZHIoZXBjLCBlcC0+bXNpX21lbV9waHlzLCBlcC0+bXNp
X21lbSwNCj4gLQkJCSAgICAgIGVwYy0+bWVtLT53aW5kb3cucGFnZV9zaXplKTsNCj4gLQ0KPiAg
ZXJyX2V4aXRfZXBjX21lbToNCj4gIAlwY2lfZXBjX21lbV9leGl0KGVwYyk7DQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLXBsYXQu
YyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1wbGF0LmMNCj4g
aW5kZXggNzc4NTg4YjRiZTcwLi5jYTliMjJlNjU0Y2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1wbGF0LmMNCj4gKysrIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLXBsYXQuYw0KPiBAQCAtMTQ1LDYg
KzE0NSwxNSBAQCBzdGF0aWMgaW50IGR3X3BsYXRfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiANCj4gIAkJcGNpLT5lcC5vcHMgPSAmcGNpZV9lcF9vcHM7DQo+ICAJ
CXJldCA9IGR3X3BjaWVfZXBfaW5pdCgmcGNpLT5lcCk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQly
ZXR1cm4gcmV0Ow0KPiArDQo+ICsJCXJldCA9IGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoJnBj
aS0+ZXApOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBp
bml0aWFsaXplIERXQyBlbmRwb2ludCByZWdpc3RlcnNcbiIpOw0KPiArCQkJZHdfcGNpZV9lcF9k
ZWluaXQoJnBjaS0+ZXApOw0KPiArCQl9DQo+ICsNCj4gIAkJYnJlYWs7DQo+ICAJZGVmYXVsdDoN
Cj4gIAkJZGV2X2VycihkZXYsICJJTlZBTElEIGRldmljZSB0eXBlICVkXG4iLCBkd19wbGF0X3Bj
aWUtPm1vZGUpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1rZWVtYmF5LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWtlZW1iYXkuYw0K
PiBpbmRleCAyMDhkM2IwYmExOTYuLjI1MGQ2YWNmMTZkYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1rZWVtYmF5LmMNCj4gKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1rZWVtYmF5LmMNCj4gQEAgLTM5Miw2ICszOTIsNyBAQCBzdGF0
aWMgaW50IGtlZW1iYXlfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCXN0cnVjdCBrZWVtYmF5X3BjaWUgKnBjaWU7DQo+ICAJc3RydWN0IGR3X3BjaWUgKnBjaTsN
Cj4gIAllbnVtIGR3X3BjaWVfZGV2aWNlX21vZGUgbW9kZTsNCj4gKwlpbnQgcmV0Ow0KPiANCj4g
IAlkYXRhID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ICAJaWYgKCFkYXRhKQ0KPiBA
QCAtNDI2LDExICs0MjcsMjQgQEAgc3RhdGljIGludCBrZWVtYmF5X3BjaWVfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCXJldHVybiAtRU5PREVWOw0KPiANCj4gIAkJ
cGNpLT5lcC5vcHMgPSAma2VlbWJheV9wY2llX2VwX29wczsNCj4gLQkJcmV0dXJuIGR3X3BjaWVf
ZXBfaW5pdCgmcGNpLT5lcCk7DQo+ICsJCXJldCA9IGR3X3BjaWVfZXBfaW5pdCgmcGNpLT5lcCk7
DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJCXJldCA9IGR3X3Bj
aWVfZXBfaW5pdF9yZWdpc3RlcnMoJnBjaS0+ZXApOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIERXQyBlbmRwb2ludCByZWdpc3RlcnNc
biIpOw0KPiArCQkJZHdfcGNpZV9lcF9kZWluaXQoJnBjaS0+ZXApOw0KPiArCQkJcmV0dXJuIHJl
dDsNCj4gKwkJfQ0KPiArDQo+ICsJCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+ICAJCWRldl9lcnIo
ZGV2LCAiSW52YWxpZCBkZXZpY2UgdHlwZSAlZFxuIiwgcGNpZS0+bW9kZSk7DQo+ICAJCXJldHVy
biAtRU5PREVWOw0KPiAgCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga2VlbWJheV9wY2llX29mX2RhdGEga2VlbWJheV9wY2llX3JjX29mX2Rh
dGEgPSB7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXJj
YXItZ2VuNC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYw0K
PiBpbmRleCA5ZDlkMjJlMzY3YmIuLmZiN2MwMzYzOWE1MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1yY2FyLWdlbjQuYw0KPiArKysgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXJjYXItZ2VuNC5jDQo+IEBAIC00MTQsNiArNDE0LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkd19wY2llX2VwX29wcyBwY2llX2VwX29wcyA9IHsNCj4gIHN0
YXRpYyBpbnQgcmNhcl9nZW40X2FkZF9kd19wY2llX2VwKHN0cnVjdCByY2FyX2dlbjRfcGNpZSAq
cmNhcikNCj4gIHsNCj4gIAlzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAgPSAmcmNhci0+ZHcuZXA7DQo+
ICsJc3RydWN0IGRldmljZSAqZGV2ID0gcmNhci0+ZHcuZGV2Ow0KPiAgCWludCByZXQ7DQo+IA0K
PiAgCWlmICghSVNfRU5BQkxFRChDT05GSUdfUENJRV9SQ0FSX0dFTjRfRVApKQ0KPiBAQCAtNDIy
LDggKzQyMywxNyBAQCBzdGF0aWMgaW50IHJjYXJfZ2VuNF9hZGRfZHdfcGNpZV9lcChzdHJ1Y3Qg
cmNhcl9nZW40X3BjaWUgKnJjYXIpDQo+ICAJZXAtPm9wcyA9ICZwY2llX2VwX29wczsNCj4gDQo+
ICAJcmV0ID0gZHdfcGNpZV9lcF9pbml0KGVwKTsNCj4gLQlpZiAocmV0KQ0KPiArCWlmIChyZXQp
IHsNCj4gIAkJcmNhcl9nZW40X3BjaWVfZXBfZGVpbml0KHJjYXIpOw0KPiArCQlyZXR1cm4gcmV0
Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IGR3X3BjaWVfZXBfaW5pdF9yZWdpc3RlcnMoZXApOw0K
PiArCWlmIChyZXQpIHsNCj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBE
V0MgZW5kcG9pbnQgcmVnaXN0ZXJzXG4iKTsNCj4gKwkJZHdfcGNpZV9lcF9kZWluaXQoZXApOw0K
PiArCQlyY2FyX2dlbjRfcGNpZV9lcF9kZWluaXQocmNhcik7DQo+ICsJfQ0KPiANCj4gIAlyZXR1
cm4gcmV0Ow0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS11bmlwaGllci1lcC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS11bmlw
aGllci1lcC5jDQo+IGluZGV4IDNmY2VkMGQzZTg1MS4uODJjY2FlYTA4OWJlIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXVuaXBoaWVyLWVwLmMNCj4gKysr
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS11bmlwaGllci1lcC5jDQo+IEBAIC0z
OTksNyArMzk5LDE4IEBAIHN0YXRpYyBpbnQgdW5pcGhpZXJfcGNpZV9lcF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KPiANCj4gIAlwcml2LT5w
Y2kuZXAub3BzID0gJnVuaXBoaWVyX3BjaWVfZXBfb3BzOw0KPiAtCXJldHVybiBkd19wY2llX2Vw
X2luaXQoJnByaXYtPnBjaS5lcCk7DQo+ICsJcmV0ID0gZHdfcGNpZV9lcF9pbml0KCZwcml2LT5w
Y2kuZXApOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXQgPSBk
d19wY2llX2VwX2luaXRfcmVnaXN0ZXJzKCZwcml2LT5wY2kuZXApOw0KPiArCWlmIChyZXQpIHsN
Cj4gKwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBEV0MgZW5kcG9pbnQgcmVn
aXN0ZXJzXG4iKTsNCj4gKwkJZHdfcGNpZV9lcF9kZWluaXQoJnByaXYtPnBjaS5lcCk7DQo+ICsJ
CXJldHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB1bmlwaGllcl9wY2llX2VwX3NvY19kYXRhIHVuaXBoaWVyX3BybzVf
ZGF0YSA9IHsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=

