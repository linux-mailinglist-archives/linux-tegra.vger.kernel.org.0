Return-Path: <linux-tegra+bounces-475-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082782A748
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jan 2024 06:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F541F24510
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jan 2024 05:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B9820E0;
	Thu, 11 Jan 2024 05:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Jjl70M5C"
X-Original-To: linux-tegra@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4751FB0;
	Thu, 11 Jan 2024 05:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih/6fiKkFskhoFztbRkq/R8XYUuo+8sC6vhqyx9uVAYjgfaUTFxcvAOXCk3IDvrdz00rqlmEHIhs+VIUhEnChCSuLvyPkqWugrV9gzzJgGj5K0HJ/h6iqnA5YTn5oWD1gHaPMaMmgzIybPzH45fh8qbiQeqJ/+O2qc//zO6iDFV2xvP4ZcU4OaKikSdn/zylTIYEReUNYFBASKooakRJ2Y6XCuXVFo7VeOXsRpQu8YgbdmoDxJZ5M4nsUCnLf238a3Vqr12N6JYe0jO4hf9n/KsfGG7Q/Bau+5OmINRTmrK2l6zxdoqehMSaaw2CLDbjic7po7z4Bf90XY2beaaGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwF3eKLwRmsdYVkfOuLOTKAz3tjqSGtX1JKn27VAkSw=;
 b=PEh5qxMfnqgUZ+Dx3S3htBso4r77cx3C/r2aPIWYg0WmNt8MQ4aCM/ruB6ztn1x3pLy6+QWrBcActOl0SOgQ2rFcv7txsH9zml09c0PtcXntM5aoEvz8W9O/Tw2xMzQ1r7K3SmzS/b95SncJMIpKV/vJl40eCU5C4bJiHeXOxn/DzHlXCama4ROqVBIuLnVSmdU1inOXu+nzkU9xwmnnd/SCW+JNAuAy8+EDT1AvYGqIFH2rCzbL/sJUacT0HWUQuUZjo5sDeaqhk9PLEG8FWjt1qCCdYw54P2WrmgeSUKxNhAyBHz81muAX8YhQqYow8qcMbOqI6GNuX+YHopGPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwF3eKLwRmsdYVkfOuLOTKAz3tjqSGtX1JKn27VAkSw=;
 b=Jjl70M5C0C7SaPNzF1SzVMyXSkJlRbSa5ovwq8dkttunabTPgFynNh8vL4ENwIjYyc9VXdIVNn2Gd8fIe8IUCQ1FMDEzAI9jqxMozXaQr3666fmE884RmUupk8HPQnv3FC1HyKAhosNr+iW0wHdPA8m11HPzr+enbzAjFVBluro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11338.jpnprd01.prod.outlook.com
 (2603:1096:400:36a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 05:32:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 05:32:42 +0000
Message-ID: <87le8wwi2u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Mark Brown
 <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
In-Reply-To: <c868bce1-9a99-49d9-97cd-ead8d0295504@nvidia.com>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
	<ZZblyhfzQjzyoUc_@orome.fritz.box>
	<42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
	<3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
	<ZZe5sTNz005Tt4jk@orome.fritz.box>
	<8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
	<875y03i739.wl-kuninori.morimoto.gx@renesas.com>
	<e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
	<87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
	<cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
	<8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
	<eeb61f8a-697c-425a-9873-b7b60c0a5558@nvidia.com>
	<87o7dswjry.wl-kuninori.morimoto.gx@renesas.com>
	<c868bce1-9a99-49d9-97cd-ead8d0295504@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 05:32:41 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11338:EE_
X-MS-Office365-Filtering-Correlation-Id: 44547e27-bc7c-49b1-8291-08dc1266bb4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bPEEQxq/s7s4FMSx/BRKPJQDVGpByHaOftUPc4rpCWKhACaqg4URqaiQO2DzPbn+7eQdctz7Q/mG7bDJDgEoEr5ISAFfS4cIePZ7LDI9F5o2Yc+IIUxBxBGMV7a+q/XSI0hkzWjHrY4DAK3WaWuEBRH5N13dg8FtqrIhKpiMHRtCg+bKGhQVlhLCWEky170l1VnHCyzfo2J2DxJcbZxGk2AFaKsAFtcfapEhxZlf8oSksvgspsbJwiMxSMn6KTvzNKO/aik1TsI+iikZn67Fc99oAmyWfn8kJ9C4C6M+Tx06VKVvTRwHj1VoimvyIfH/BDeNV8GNMiY7I1AEV4KlywVDcS0xbwBPPLqHLXJNovIE9Kr/bLnCBqxFKwx8YMJUz4wElRTrgdZry7OBNh4Vwv0QN1rHPCNHrcmLMWugQZ852hud0bGi0ejYhMF45EnEZ9mT0gPmg+58XFT5xP1IAeVVb2EKIILqUGwyccKXaCazV2YvxuAbdSzGZqWvEEAJ5Nr3wrxR6jb7BSjw9xZerDVuuBbnEdHKTRXhapX7J97l5Bf/UBsztC9vye8bfes1n5ooq0BY2idvgMsmqcGnlTpcwx7++54+njVCJvD5RwIzvjQJCL2hET5+g1bViQKft6PLIDduiOq5xSeUOtdOlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(6512007)(6506007)(2616005)(26005)(966005)(6486002)(316002)(52116002)(41300700001)(5660300002)(4326008)(2906002)(478600001)(8676002)(8936002)(38100700002)(66476007)(6916009)(54906003)(66946007)(66556008)(2013699003)(36756003)(86362001)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3eKI6MDfTFff70yMYF9Jz55TzXj7hTMhYDSpOY9pjrdT3TvvVQQn40uA2Vk?=
 =?us-ascii?Q?dpCSNGULyrEiAhgbEoaJnyaFMpN51OBD1Shq5XXIRkRSgBExBHtUHSAkyYLt?=
 =?us-ascii?Q?Wz+/lo0LnBFdyRap+2pprujmaM/vg9xQP/waIY4ptY8SY6mk20hbS0Lvw8F6?=
 =?us-ascii?Q?bO2YBuKbJRIRxwRwW6x+ZKZUyHSOe3JH4iC3AaQhJg4YudnbS9OPpFKG3AxI?=
 =?us-ascii?Q?FSa407TUjkKojft4W8+0q0sNYB3191vGnTFW6FuXpCPRVf79+rEoPVs/hRYl?=
 =?us-ascii?Q?ipMC3x3tCemmafHU6vsZol/Nmfp8qICNkVenFNR4xfwItWZ3lA5DOBDyA8IK?=
 =?us-ascii?Q?vanXH/p6+18coIH2TBM6nKfA+52u6TE9VA07fI/+e3VYeSUARJoZqgeY6x/k?=
 =?us-ascii?Q?fPyacfuDGkFQMq/ByFvIc0u5NbLgetf6zSmU+RKPyodY/zw3FS/P0oKSxqLl?=
 =?us-ascii?Q?83POdCzcNHP9GmEzOw34BK2l2KrzPshYkQq0NdZuKwMYs+iteRjlih7iSKU7?=
 =?us-ascii?Q?y18VBl29fXX+QgSEyuONT8sOzYoGtlme6fNKLBzXPQvYYRsZvZP271CXXUQI?=
 =?us-ascii?Q?hph7xkh8o+UKJF1H0e9wL9eyQ55WdzG+PJLO72u06Iy04a6i4n9J/+e1j0xN?=
 =?us-ascii?Q?BU9krUkllmHM/yreAD44Nbkd5foSiWwUR7bDTqNDZXHGy/eSn3q4K3sRxyib?=
 =?us-ascii?Q?LM9yBm1ZO8vVuT7fIN6eQAcENT02HQXxtvTWp1ZQIbHUKLqS4CjY+oBPZna6?=
 =?us-ascii?Q?7z2/9mHcwL6z02aVrH+NyZYl9friQF1tqhwLmIwAxxUR12+0naZtgmwEFkQ+?=
 =?us-ascii?Q?fv6FzqIWc2J6wFFSdonMcInXhjQamlW4WTT9NypPfo3ef/tUsWBKO+h8SSHT?=
 =?us-ascii?Q?IsN89RdhRMyPs1V/V6GX++F/UkxPQg/Ijj5djwUy2BsOEckMjp4Qm3uj8KL2?=
 =?us-ascii?Q?0WFzvc/LgudZNOn6cUX5v7riofYkEVle021xq2D83goiNOEP2JGj54UVsN0n?=
 =?us-ascii?Q?J67DDXyxbIPbqQzHL3eoNvIP+UX7eBhXEKxeJGGY8/7Rum9zyRfkWOHPLRbn?=
 =?us-ascii?Q?KmbiIdDwEQCiRfqI6I1olZhLlm7w4Svw+7hFW9xeSs/vye9o39ErCP68OSqI?=
 =?us-ascii?Q?cadwYAVGt3pzcf+9dgKWthfpfM7rzUOj4ALx0baioxyC1lPvM01Mus0m8J31?=
 =?us-ascii?Q?EYy/1zQpO6W/6GUHQ3/LTXi3p2ljUA9feoYeCwxjAmwaLrxgc3Wr+M/OgxI4?=
 =?us-ascii?Q?ktp1OrEHjFUbyVx7YWMGKcR48fSGWcpdBlBqaIt6fXTI2DsF7GjcBI4aEUpJ?=
 =?us-ascii?Q?Sl4zbVCF6mhMMch7pef/bvZS1bQpm2pKwmmiW0O2PwvxCNFLZBWN1rORSLI4?=
 =?us-ascii?Q?fuaWIXxdVfkOfdOCSjHVgxZI62oPqSWQIEeVdgvkBqNPRrrmPTGu3iHXsAQR?=
 =?us-ascii?Q?glibCoiouo5RpOb/aKlci0FWhDMPjqz1gwxCqiOSaA07FjF31PT4qMkbg4Xg?=
 =?us-ascii?Q?yt5vscrvUnzLMJ9o+fU0XZ4rZLEbPOjh/rzTTFhqrzbL3grmbvuu3+Jqd7XV?=
 =?us-ascii?Q?uyckrwSeo2D8kWQnsw8rc2KiSB83fI2NX1kwtAuHZFxP2BG65xZVrFSuCTx2?=
 =?us-ascii?Q?mIMDEi1Cv0I5VncPj94FBRI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44547e27-bc7c-49b1-8291-08dc1266bb4d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 05:32:41.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyG1jB1qa0VdD0XZaXQc6dR5lSyS4637h1pSH1yCCz+SXnr6ZWkY+vsXQU/HUODV3NfAaCAiwRATZpJHNi5ax68tNLygl78GU4CR7egPFPJeo9YRBXrvujtEKvv4WFQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11338


Hi Sameer

> >>>>>            port {
> >>>>>                    cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
> >>>>>                    cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
(snip)
> Is it possible to have similar behavior with audio-graph-card?

Unfortunately, N:M connection is supported only Card2.

> >> For 1:N connection, how many DAI links audio-graph-card2 driver creates?
(snip)
> No, that is not what I am looking for. Let me please try to rephrase this.
> Does audio-graph-card2 driver creates N+1 DAI links or a single DAI link?

Oh, I see. It can handle many DAI links. see [1].
One note here is some link is comment-outed here,
because it handles too many DAI links, it reached to the upper size limit.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n160

If you want to try Card2, you can try this sample on your machine. see [2].
This sample is using card2-custom, but if you want, you can easy to switch to card2 by

	- compatible = "audio-graph-card2-custom-sample";
	+ compatible = "audio-graph-card2";

[2] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=for-6.8#n12


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

