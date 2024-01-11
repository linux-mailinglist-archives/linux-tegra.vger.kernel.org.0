Return-Path: <linux-tegra+bounces-474-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476382A72C
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jan 2024 06:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28651F239A7
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jan 2024 05:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F311856;
	Thu, 11 Jan 2024 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GKC3I1MW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F917F1;
	Thu, 11 Jan 2024 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI3I5R8sNF2nZwu4wPvrU1FmHsrNTzbiwVmR0ykGswxoROFmS+Zvl06B8a6ywWHps3gO17bs6VJfBtsGZ4wBVPY9d/uWLaWpkCx7bK+rIZxFL4e72wFNgeRIQjhDErYic55Ul+kSpZelNzqEKKQSGpImXEkABnu2jax2Bz9joVQsFj9rxkN9Cl3G6snOZnuRGvw3izNChImpLmdWtlZelPCELdtDjr3kocpWkUw2mdQZRPeX2oi6TPrC4DHlFY0WhbsPyTBwRYelK3a03Rw1RhVYwuQmOHS2IiqW6Ek/GXfCvowqoMdShE6vJlte87E5zOd4q98fB1OIk9GVw6pWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N4XAJHecF9+OjWi1r/nPhXJtxy3CH4BGX9UCtAASm8=;
 b=S00DqgmaT9LfPwzbJRjO1Igw0W4rNU6dhycDTxFewe0T6b96sJQsgXHBBq6XYBISyWWaI7lTo3MtOxp7s37af3Frp8iqu65JTnZeDt2NyoIRFCU7ihEpFpz/rS7t9pDZsPwBVGl+A5+3o90d2iSGiw9FEZRnZmVa53eujm9d3ssrwzkjSJyrxEJINMLVBQElf523/eWY5UXz6kFy7x5ySDvbXM2K9oYS3/lPFfgtmCo/9ruQ3V2P8DwTVxJ+mOe98pXeaWUfqTDYokuDYl2iBiM1KYjdcP5yDEaCbS7HXhnBdWNSO/LwhH07Lj3W8HWfwUQJVWTP+A8zL6/TbXgApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N4XAJHecF9+OjWi1r/nPhXJtxy3CH4BGX9UCtAASm8=;
 b=GKC3I1MWajM/gf7w6z6ARaEQt3Nh47+9xS4RRoHdYWrWVfvbDyca3BLh77lSYXxPvNXEZKrE6ZR/wSjU4dT+AMCj4tSU/EHTDkF5kU1QC2IFSlu6C86Dspq8tDEzcu3VZp+yK2NWM+/SGku5iyUMr+D34RhNykTfp4Bcn2ZQ74NFJDkMDncztGs3MkqPSkFU1tnV2dWL8Dvs1fuR0ownoCAosAiBwU97kkaVbcP81BKIKl68Fgfu9/qAV5ZhdjgWrp5ynzH4JAvGkC48kAeZRS+xWCBBGYtoDmmiYl8kRHU9qE6ML9j/wUk8rGHUOQlcGHqRo3SV+2BI/mdWo9Hscw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 05:09:57 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 05:09:57 +0000
Message-ID: <c868bce1-9a99-49d9-97cd-ead8d0295504@nvidia.com>
Date: Thu, 11 Jan 2024 10:39:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
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
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <87o7dswjry.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fd2f67-f060-48a9-bfb8-08dc12638dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	78+oz7RXVBJeNzniai4RxnPPQeSbw/BYJFdBOk13gfYM1JJgsqAnQvbbqJxBwnS6xOILf7zez/ZmVfuG8hKLWk5PVHGhy1+jCSntNyzdwc8/tP9DutA/pMfhWQY9Q1gn6MgdDou/HNf+7K6W1erqfspenmgs5mF7u68WoEQ6ktgCpi+Fx81ViJ5/Dazkqotdw1I+mGz7lRvJoJdcjKTZYLAwsq2FGUu0KdKNDdjrwzboxgXgf5c+Y7BgRtiUohfEtUPdDEKyVtPh0U/16CQ02Iawm4cI+WhRrvU5eD8alWKljsovODytgGPzXGDoYWqcy8mbPWfKud59ZgIob1DA7kIQRJE1LEP054zjnzo82d6X9vK2RhqInFzzTeRQ5Q1AZM6xb0R7JAb8Sjm0vFOE/+s6qZcQ65RxwZv4UvEIBiDhqewXBkvApJQtSyynitoT9s2+P8ErqQ+LOOyf2lvUhTpKgn6+r+Wl8jC8ZhmDuf4HzfqIqWQguX2gbZAo6HJ17oBHX5BQskCr2uEoWYybIq/VsmlZJxfzAlsPaA5C+dJRkyFSCJrl5xKKimH6WCzizRb/eeqMw6E/f7f7hyVP52Edf/hGXsraub9Dvip+c75JujHzCo7Bs8j2XOT9x7bJPHGU4Ry9T0dof5qJoVxfu1WU62ZTn3vPM0D4IOh1FLWj9qTGHhaa5r5sHw6YYPA9I7Ex8nw0TSH+31jw69F41JPkJo0xNwRW6cJ1pHEL+Rg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39860400002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31696002)(38100700002)(41300700001)(2906002)(36756003)(86362001)(54906003)(316002)(6506007)(6486002)(53546011)(6512007)(66946007)(66556008)(66476007)(6666004)(8936002)(83380400001)(478600001)(5660300002)(4326008)(26005)(6916009)(2616005)(8676002)(2013699003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azBXdU5ESjNnQndhM2QrZnRRaDJtcmNoNWJ6cnJ6VzBtOXRGWDgwQXEvU2Rp?=
 =?utf-8?B?NEVhUitpYVpScWY3UUFvRHdUNXVvL0M3ZjJhL2FJQXlHeWMyUHpPb3N2K2s4?=
 =?utf-8?B?TkpCQ0hQVGxzZE9YUG1adk5tQVpZanZUczhTTDVWdGVyZ05HMy9TZFZOYWRj?=
 =?utf-8?B?ZGNRVjZWQjB3YzlwYTJFc0xHWXJWaXE1SHYvOFRvWTltaytLQldvc3lCT0JZ?=
 =?utf-8?B?Nk5XVG9mVXZFdTVrLzJmSHBoNWlIQkxESlFTa2dMR2l1SG5LRXp4eDFuWXBl?=
 =?utf-8?B?Uk9vUG0vemtKeEdQU3ZaWGZkQklFNW1KTlFNVDY3V3A4ZStmMHhGclZpbnJz?=
 =?utf-8?B?a0NrU0hGNm9weW5VQ0x4Q2NyOHovL21acnhWTjJzQUNpSkNaazJRVHE1K1J6?=
 =?utf-8?B?Zks1emo3Q01pd2Y1VUhUZVMxQ1ZOSDRsRlJGK0Zab2RPNHlhQjFrUUJuOFVZ?=
 =?utf-8?B?bXYvOTIwSWtaNXV2Y1dibFYzL3ozRStkZ05KZ3lycUlVYU8yZUNtOW9lTFNa?=
 =?utf-8?B?eldoSmdrWURmOWJHWnlpbzBRZHJ2bktjMUVqcXpCZVlMcjczeVBVM2tjZFVQ?=
 =?utf-8?B?MTZGbVJiTFRQaHdhc1ZIRyswOUYreHkzVmtNS3BaSnZqWnNZaERZaFo1aUM2?=
 =?utf-8?B?R1dFckoycEdETElRN3BzeVlRYnJRQzhSOGJTVmplaFpCMFBTSGtMRENLQVJL?=
 =?utf-8?B?L0F6d1Npb0JFd2hFN3kyM2gyNEMrVHltcTlCRko3RVNtSlBGbWJhWU40U3ZP?=
 =?utf-8?B?NWJ0M095a2tOZmc3MGpvUklWRFhDcGVMaWdhQjIrMjJLTk03bHBsNkxtOXNS?=
 =?utf-8?B?SzBOT3NUdUxwcXBTWHdaSVlnU3FyMmdQK3grb1ZkMjBQQWR1aTh6QkVlQlpF?=
 =?utf-8?B?RjNlTTlGcUhsVTB4QkJ4Q1phY0szTDFUSXVrMWJZcTBCa3BNK2VLcG1pTkR5?=
 =?utf-8?B?VFZRTkJnbmgwaWo2YmIyUW9QVHhqaFBPNnJ6ajNDNkZQaml4Ti9NZ1Y0YXVR?=
 =?utf-8?B?QnFudDkzZXJ6UzRzMmdGVWVlQjE0TmtodkpNdy90Tnp4dDgzZG9WbTNwSzZq?=
 =?utf-8?B?eFpLQ3FOUmNKVE5BMzNWYnRScERWSC91SFRHczM3eTRQTmorNWlFczVoaHAr?=
 =?utf-8?B?OTQxNEZGUDJuVlE1c1hUUnJmQkgzTjI5ZVpFazh1ZkRIUlpjM2pLQlJscGt5?=
 =?utf-8?B?Zlp5QWo3NmFTSXk0b3B5UjhQeVdQZFRmcVkyb2FRSFpPMHlPOWRDUFZMVjFs?=
 =?utf-8?B?YU02dXlCUGpmUUU3VlJDTEtZZFdPblZYaURtZUNEMURPWFdwYzZEOHFCd0dV?=
 =?utf-8?B?aXJEbnBoeENSYnBBcVluREdJd3F2aDVkN0NQL2FmUWVQcWVQa2RNYnlEcnFj?=
 =?utf-8?B?TXUra05UYk9ObndqRHh2a0Frckh4VFp4OGVBK1JtQlhydlA1SGRZRWNvOWtm?=
 =?utf-8?B?dzZTRTYrcGpXbGdZaVdWckRoTEplS005NzNrSmg5akhyaWUzQUNRQjN1aEJT?=
 =?utf-8?B?Rjd5SHNGMmtNZkZFY3YvdGtxdGxFSU43ZHU4TWw2UnUrdU9NWTgrdjh0V1N6?=
 =?utf-8?B?N1RPTG0vQ2FGWDZyR2IwdHVKV3liZTFmTTV2YlpVTWZVVittS1hNVldkV2F6?=
 =?utf-8?B?VzhjdzkvZnhWNTB5ZHVQUXpZTEtoTkxUQXlpN21xaDRHQjh5U3VuSHdQUTF2?=
 =?utf-8?B?SUJnWU96ZEFtTW5wY1lUdGJIbEtrRGlKeUFnazlHYUo4M055OS9yM3NjS0pp?=
 =?utf-8?B?QXIyRjhWaFF1QWlZNDNBQmpESlgyWXpGQVpaLytrZjUrbFhHdHRpOTBvOXN0?=
 =?utf-8?B?amsybHpUU01uRXNJYUp6SXpFM3BvY0xkSFdkeXlhWHlVK0NpckJnZGJHLzJp?=
 =?utf-8?B?Y05FVUE2QW9sUno3bjFXNkZaMEl4L1krN3BkSnRPbFFQWjRKaXVmQXhUaUF1?=
 =?utf-8?B?ZytQV3JHUEd2aDRicStuaXgrMzhGT1F5aUN0cmkwNUJUU1JKQmxkSW5uZlhQ?=
 =?utf-8?B?bUkxVllMOEhmRWJDcHBqY052Z2orSzVWQ2hkZk43cnJvOW5pU0FUaU9MZVFi?=
 =?utf-8?B?Lzg3Y0lES3lnZks1Z29mcUQvMGlRN2xYMUxLQ1htMXNnbGdva2tDZ0xSc3p2?=
 =?utf-8?Q?DyLaQij41vu021Bq3aiup5TVs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49fd2f67-f060-48a9-bfb8-08dc12638dcd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 05:09:57.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: divt0C8rZbba+2GKFzShbXHEQj1xtsSXboWJiP6sbnpFKU8+LQ8GjdnLQ5tMivHlNSZ+JdSDisUHd15qbHuEiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126



On 11-01-2024 10:26, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>>>            port {
>>>>>                    cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
>>>>>                    cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
>> You expect this endpoint to be exposed by driver right? Or are you
>> suggesting nothing needs to be done in the driver for this endpoint?
> If you use Card2, and if it is normal Codec (= not HDMI sound)
> basically you need is only DT settings, no driver patch is needed.

Is it possible to have similar behavior with audio-graph-card?


>>> Sample is for 2:3 connection, but it should be OK for 1:2.
>> For 1:N connection, how many DAI links audio-graph-card2 driver creates?
> DAI link max is based on ASoC.
> I think you want to know is connection N max. It is basically no limit
> on Card2

No, that is not what I am looking for. Let me please try to rephrase this.
Does audio-graph-card2 driver creates N+1 DAI links or a single DAI link?

