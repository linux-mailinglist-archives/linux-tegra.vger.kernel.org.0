Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7841781B7A
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Aug 2023 02:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjHTAKc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 19 Aug 2023 20:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjHTAKP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Aug 2023 20:10:15 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0939FC60;
        Sat, 19 Aug 2023 13:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RePDSLpiAVKzrKRyJIj1p0VxfPOOUI6HPsSl6D31Z+/vfdY8ENLTI5g8mxy/k55i0MzVO5o/eNEIAXoWVSWzET/oR6s9pnTdLoN6LoWdi1t9RH0p6ojrLQzfVtZTZQAs6DCg4fKjjo8bdttol1U/B7NIPErnwCWjiuPXdJK6fcHqpzO1CEYplGtQtuF7DFOGINbFr1tDmZwpdeVKoRioShwfgv6dUd9U1B0De1Y/qBkZU5ZCSxBaLyQjej01soDUYoS/MNSjWY/tKTWCY/BFfi07V+qdbc0WnAMamCWyhLeV44PWJcphBkGIk3QkprLOjkvsqlkriJpspk5kHQEtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru7k6fBGUtrZ7lAUi53SI5Nj/7ElB35HGh+c8JHDyWY=;
 b=DBEDUjjVLJYeXa6sVlsrdsiGyjdSV4lC8uoHta/ceW+Zb5d/jlBF1P0+wJ/tN8hmvKBOi96hKN+CBQsiYob1WZ48KAAqNR+jSGOqUvtG4SS9aywXC1mGQ5WxCJ95SvEljTR3iZlAe9IK2g0d6rpdRCy1ayWk3sNbTTzdnc23DPtZE1gHxl4P8dMJj51geSZPGEebyiUQrLbrkRIerHlWVqVtxiqEeUncaH6gOsyKIV+qqZma+auhvjGrdA+zJiSz4PAFWb5OB7JVIjFqlSgn9rCZH1w87FaUbMix11hwR2MnA4Dwk0JWboF9EJy3UdBGibX9Pu+uIIn6seGiRmpyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru7k6fBGUtrZ7lAUi53SI5Nj/7ElB35HGh+c8JHDyWY=;
 b=V0uOFCfOyoLoOoHDrfb7k0lv14t460tCkrOkbnNYBgYPhwlR9BbEV+MNhnRZMa5deTXkyVYLCUCv33mSIw0pfKMc2SQ+ZLoiVCkCSRmrhT5LE/Qd/zQdEz3406+T/30p9/anssfNAtaagF7ICXLFK5ihrtK8BxZgRZpAnt3u6ECD7X8AO0E4oN04doEo6M/T+B1opqNQHNXAFKuZEM1vWsqkjaUcg2Zc6MP4Nxh02rYK9qzNsfpN4PqrjVhEDOsER1heYr6idv0IGrWR8IhemJQwupTTGMxB2+xaLTl9TQbRSJ9cbQ+d8pBoY807WG8Yz/wzXkRiYhRJjo/o5eY+LQ==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sat, 19 Aug
 2023 20:11:12 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::9e01:4d19:224d:219]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::9e01:4d19:224d:219%7]) with mapi id 15.20.6699.020; Sat, 19 Aug 2023
 20:11:11 +0000
From:   Besar Wicaksono <bwicaksono@nvidia.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
CC:     "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vikram Sethi <vsethi@nvidia.com>,
        Richard Wiley <rwiley@nvidia.com>,
        Eric Funsten <efunsten@nvidia.com>
Subject: RE: [PATCH v5] perf: arm_cspmu: Separate Arm and vendor module
Thread-Topic: [PATCH v5] perf: arm_cspmu: Separate Arm and vendor module
Thread-Index: AQHZry4xzcjbD21RhUuAD3F0nYoHCq/lL6YAgA0cbOA=
Date:   Sat, 19 Aug 2023 20:11:11 +0000
Message-ID: <SJ0PR12MB5676F7D0749A35DCB185452EA018A@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20230705104745.52255-1-bwicaksono@nvidia.com>
 <e98abbc3-dab6-414d-8ce7-8b9572be41a0@arm.com>
In-Reply-To: <e98abbc3-dab6-414d-8ce7-8b9572be41a0@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|SA1PR12MB8917:EE_
x-ms-office365-filtering-correlation-id: a6374c5d-8cb8-44a8-fbce-08dba0f06ecd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bcyxh4g45Va+TAwVBugjmR+NkeehmYYPV+NQSf3unOaNScqOPdlPWUuYD9He/dsMuDHW+jg6RdiiPBXRDxjIfD/6Z+CbZfc07Tce+UphdCmYq93lpd4Zf3aDQA0LwvTPqkFPa0REmttVJruxAQDtIZM0V0NYtnLuj5dl+oY6uqQv+H+nJK+7x7OBcgbjO8Ix2cKDwtdgHQ+XkwRTo+PtD/U0KgA/hNTOoCboNLvXJGiMyqCN2dmpYGftm128COjqV/feIOqdi+SVL8dCX1+GPstPFd+WL4D9qPTSKeJRmOoVpIOvU4GiaeITiBuvzSzLk4LFquKrOAlC+7F2l2w0imkZSKzSqXb48VKA61shpGTa2to7hUQ92miPL/s8+rgasRLHnrhpXGv2ROB/2frJmranyCWWzwQWwCOFf4Ts5EVvr8CukKWuhAf4vYGB7yfJDo/8nuK8A32/rssZDFrbygRmlYTofJ4oIztV4Ytk4RXfdRVv3j9jWa4bUjuNOKMSHbuKPOB4X8uXWQ03V3744TaFR0n137FJDDiHm7idq2nr5Tr7kLLjXcKGLaBHIQXjK0VW85pmgiPenKOOPhF9wcoUC9x6SarQ1g0Owi4hilIP9EGRzZpLQz6nncRr8vJTDf5hmSV7ehr1pT+LLxae/70j7agFL38IwECd4wUh+X8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(66446008)(66476007)(64756008)(6916009)(54906003)(76116006)(66556008)(66946007)(316002)(9686003)(8676002)(8936002)(4326008)(107886003)(41300700001)(122000001)(478600001)(966005)(71200400001)(55016003)(38070700005)(7696005)(38100700002)(53546011)(6506007)(30864003)(2906002)(83380400001)(86362001)(5660300002)(33656002)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNrLzMzREJUTWhXdHRueElyUnZ0RkFja1NHbmFjT1FBbisrUTVINkRPR0Q2?=
 =?utf-8?B?b2g2aXFBL3l6U1JyRUNadkJDcEd3N0Y5U0E1WTUxU3ZkQWlPTm5nbG1za1dl?=
 =?utf-8?B?M2NPSVBtVTNDY0FxZ3BjWHF1ZjlRTmoreHhKSGloaTZPQ2NjUmNxMTl0NlRw?=
 =?utf-8?B?NTgrbHVGNjhoSjk0VjZ2Z2k2U3dUVElSd29mVFN6U2ViakZWdzdkWmE5aXN4?=
 =?utf-8?B?N3owWGNGUllhQU91cFc5V0x4RlVCanE0ZVBIS0NrenQvQ1RYMWFhWHdMMmFV?=
 =?utf-8?B?cjVzcHp4dHRwZjAvd294U2k4aDNKWjdrWVBkVW51VXB0SHp6S2Z6WTNhUldh?=
 =?utf-8?B?aE5oaGFxc3MyMXRMcTQ5dFh5WXJ5TUczNFRRT0ZJTEFRUjBaMlZLNEkvajNL?=
 =?utf-8?B?TzlIMmcrMFdhcEZZd0FyM1pleDhEVVBsMG9PUVdLc0RLUkUxbm1WcFgzTEdP?=
 =?utf-8?B?U0tCYkNjMWp5NnI1TXlNSzhVdE41VzRBL3Q2Nm5ncjNFeDl1dW9Pd0k1bm1o?=
 =?utf-8?B?cDBLejhlckRvNUx2UlhydEVzUVVWRFZNNWNGVnU5S0NwNHMwTWtpZ3lTdHo3?=
 =?utf-8?B?UlI0Q3ZMQnJuRytsTHQ5aThsT1ZCNGhUdVlPcmEzR2p1OHpaSlZBYWoyUXNv?=
 =?utf-8?B?NlJjaVpIY1ltNzFSTVVObE5senlnOGlObVRHMDF6V2R0TDQrWGJESlhtbFBu?=
 =?utf-8?B?ZTBjMnp6cWQ1VFIwcjdnUngxZmRsQjNOYWVBeUFOUUVDL0daUjJpS0pJbE12?=
 =?utf-8?B?M2UydkdRbHFsSVJiZSs5K3VUQVl2a1FZR3orNldRekw2Vy80RVdWenp4dXk3?=
 =?utf-8?B?ZjZsaEdKclF0c29XK1BnTWRjRU1OaWZieXpoUWt0eW1HUUNNWUJ4L1NtNk1j?=
 =?utf-8?B?UWN3NUdWRjY4bkhxLzJBSTNtZ1FTOU54V0h6WkZNYUtXRU9NellaMElRaldu?=
 =?utf-8?B?amdBazFWUW1OdFl4R2NadENvQVQxNVVWRzlhZWkwekZoOFM1dmMzOXpxMEpM?=
 =?utf-8?B?THhrbHdyQzhQT3k0K1d5cmlKaWE2U0M0dldZVUh6R0FTSVp1RzVGVUhhT01t?=
 =?utf-8?B?aE0vTlJJVmEzMG9PV08vWGk1R0J0QkVUVVhBMHQ1bmo0ejN1Nk9BMFVPY1dG?=
 =?utf-8?B?MWhaNExERFNUQ1lwdUFNUmt0WjRiZTdQN0paSEd3Sm05dzIvN2hLYit3U2tH?=
 =?utf-8?B?QVpIZFJmb2NsQ0xXTndleXExUDRNUDhrMnFPaFdnVnpXVFJ2N1BEdEREYk0r?=
 =?utf-8?B?UHplR3hYTDQyb2FGUnpiUjZDSS93S0M3b2p4SkFZVUYwUlY2elNBRFBPK1Uy?=
 =?utf-8?B?VjlrRk9FRHJ1OHI4Qzl6MVBPMjlGckVBQjNtUFdqNnROVi9DUXJmZDJGbldZ?=
 =?utf-8?B?VWdFbUczUU5IN2VFOXF4bjNrdGxVbnFUcWUzV09pV0kralozT01lejhnUlM0?=
 =?utf-8?B?dEE3T0dPck53TkplUEZsY3oybExHNVZOeXA5Uys5aUJFTW0zV1U3ZkVwVURo?=
 =?utf-8?B?VHFocTd5USsxYU80Si9sRmxLYmdoeEMrREJsbmRtUXArcWdzd2ZQaTFzT2FI?=
 =?utf-8?B?LzRzQTg4M3lqbjh3bkxoT1Y2N2V2YjdVMUVkenVTTjc4L3Fac0VKRGY1cFhY?=
 =?utf-8?B?WkVXckd6R01Td1VhdmtVMHJiYXFpVVRrMzVQOVE0Rm8zTis0bmRCL01xVDBT?=
 =?utf-8?B?cmwyNU84eXZIQnNnc1I1VU82bFg2M3dyb05mTXlPOUliQ0lWc0FIQlljeUpM?=
 =?utf-8?B?cWRWREd6QlQwYnROWmFrN1JWQWlmQloxRUk0eW9maDV2R3Fyb2RWS2l2bnNi?=
 =?utf-8?B?VUJoTXBJSHZpeitMWVpsZDkvQWZ2RkpmSGpnNmJwUTlpejZINWZ4YVAwcWZ4?=
 =?utf-8?B?Ykl3aDJMbEhFMnJENjZoVFdUcWFoTkt4ZXMvQk83N0NwaHVYRTRYb0VLb1N2?=
 =?utf-8?B?K05OUkZTcXNERy9sc0JodXpIc2k2cnpkOUpFdFBHdEI1U244QXZ4ZXNkY2h5?=
 =?utf-8?B?dytjTUcwS3d5QWJJS2tLOW0vekMrYklIeHNUcWlSVU9qcnlmN2p0Q1hnV0Qz?=
 =?utf-8?B?K1RzckkwOUJzb21qYTRCQitNZ3NZclNHNm1VMVdtWTF5NkJXMzM4MlNieWhZ?=
 =?utf-8?Q?ooNgGyhvrad/DSpiRxCcpg714?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6374c5d-8cb8-44a8-fbce-08dba0f06ecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2023 20:11:11.4467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2jkph4szxkFS/XSQtB4bZ9kpY1pDeq1oW795bvLuH+A6JAJmt2TosoAwuATur7D0+JhfqJK95lkiUYM0N0DErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGkgU3V6dWtpLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3V6
dWtpIEsgUG91bG9zZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4NCj4gU2VudDogRnJpZGF5LCBB
dWd1c3QgMTEsIDIwMjMgNjoyOSBBTQ0KPiBUbzogQmVzYXIgV2ljYWtzb25vIDxid2ljYWtzb25v
QG52aWRpYS5jb20+OyByb2Jpbi5tdXJwaHlAYXJtLmNvbTsNCj4gaWxra2FAb3MuYW1wZXJlY29t
cHV0aW5nLmNvbTsgY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdpbGxAa2VybmVsLm9yZzsNCj4g
bWFyay5ydXRsYW5kQGFybS5jb20NCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IHRlZ3JhQHZn
ZXIua2VybmVsLm9yZzsgVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT47IEpvbmF0
aGFuDQo+IEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+OyBWaWtyYW0gU2V0aGkgPHZzZXRo
aUBudmlkaWEuY29tPjsgUmljaGFyZA0KPiBXaWxleSA8cndpbGV5QG52aWRpYS5jb20+OyBFcmlj
IEZ1bnN0ZW4gPGVmdW5zdGVuQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjVd
IHBlcmY6IGFybV9jc3BtdTogU2VwYXJhdGUgQXJtIGFuZCB2ZW5kb3IgbW9kdWxlDQo+IA0KPiBF
eHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0K
PiANCj4gDQo+IE9uIDA1LzA3LzIwMjMgMTE6NDcsIEJlc2FyIFdpY2Frc29ubyB3cm90ZToNCj4g
PiBBcm0gQ29yZXNpZ2h0IFBNVSBkcml2ZXIgY29uc2lzdHMgb2YgbWFpbiBzdGFuZGFyZCBjb2Rl
IGFuZA0KPiA+IHZlbmRvciBiYWNrZW5kIGNvZGUuIEJvdGggYXJlIGN1cnJlbnRseSBidWlsdCBh
cyBhIHNpbmdsZSBtb2R1bGUuDQo+ID4gVGhpcyBwYXRjaCBhZGRzIHZlbmRvciByZWdpc3RyYXRp
b24gQVBJIHRvIHNlcGFyYXRlIHRoZSB0d28gdG8NCj4gPiBrZWVwIHRoaW5ncyBtb2R1bGFyLiBU
aGUgbWFpbiBkcml2ZXIgcmVxdWVzdHMgZWFjaCBrbm93biBiYWNrZW5kDQo+ID4gbW9kdWxlIGR1
cmluZyBpbml0aWFsaXphdGlvbiBhbmQgZGVmZXIgZGV2aWNlIGJpbmRpbmcgcHJvY2Vzcy4NCj4g
PiBUaGUgYmFja2VuZCBtb2R1bGUgdGhlbiByZWdpc3RlcnMgYW4gaW5pdCBjYWxsYmFjayB0byB0
aGUgbWFpbg0KPiA+IGRyaXZlciBhbmQgY29udGludWUgdGhlIGRldmljZSBkcml2ZXIgYmluZGlu
ZyBwcm9jZXNzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmVzYXIgV2ljYWtzb25vIDxid2lj
YWtzb25vQG52aWRpYS5jb20+DQo+IA0KPiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4NCj4gDQo+
ID4gLS0tDQo+ID4NCj4gPiBDaGFuZ2VzIGZyb20gdjQ6DQo+ID4gICAqIEZpeCB3YXJuaW5nIHJl
cG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90DQo+ID4gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzA2MjAwNDE0MzguMzI1MTQtMS0NCj4gYndpY2Frc29u
b0BudmlkaWEuY29tL1QvI3UNCj4gPg0KPiA+IENoYW5nZXMgZnJvbSB2MzoNCj4gPiAgICogTW92
ZSBpbXBsIHJlZ2lzdHJhdGlvbiBtb2R1bGUgYmFjayB0byBtYWluIGRyaXZlciBtb2R1bGUuDQo+
ID4gICAqIFJlYmFzZSBmcm9tIHdpbGwgKGZvci1uZXh0L3BlcmYpDQo+ID4gVGhhbmtzIHRvIFJv
YmluIGZvciB0aGUgZmVlZGJhY2suDQo+ID4gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWFybS1rZXJuZWwvMjAyMzA1MDUwMDU5NTYuMjI4MzctMS0NCj4gYndpY2Frc29ub0Budmlk
aWEuY29tL1QvI3UNCj4gPg0KPiA+IENoYW5nZXMgZnJvbSB2MjoNCj4gPiAgICogTW92ZSBzeXNm
c19ldmVudC9mb3JtYXRfc2hvdyBkZWZpbml0aW9uIHRvIGFybV9jc3BtdS5oIGFuZCBtb3ZlDQo+
IGltcGwNCj4gPiAgICAgcmVnaXN0cmF0aW9uIEFQSSBkZWZpbml0aW9uIHRvIGEgc2VwYXJhdGUg
bW9kdWxlIHNvIG1haW4gZHJpdmVyIGFuZCB2ZW5kb3INCj4gPiAgICAgbW9kdWxlIGFyZSBpbmRl
cGVuZGVudC4NCj4gPiAgICogVGhlIHJlZ2lzdHJhdGlvbiBBUEkgbm93IGp1c3Qgc2V0cyB0aGUg
aW1wbF9pbml0X29wcyBjYWxsYmFjaywgbm8gcmVwcm9iZS4NCj4gPiAgICogQWRkIFBNSUlEUiB0
YWJsZSB0aGF0IG1hcHMgdG8gdGhlIHZlbmRvciBtb2R1bGUgbmFtZS4gRHVyaW5nIGRldmljZQ0K
PiBwcm9iZSwNCj4gPiAgICAgbWFpbiBkcml2ZXIgcmVxdWVzdHMgdGhlIHZlbmRvciBtb2R1bGUg
aWYgUE1JSURSIGlzIG1hdGNoaW5nLg0KPiA+ICAgKiBLZWVwaW5nIHRoZSBuYW1lIG9mIHRoZSBt
YWluIGRyaXZlciBtb2R1bGUgYXMgYXJtX2NzcG11X21vZHVsZS4NCj4gPiBUaGFua3MgdG8gUm9i
aW4gYW5kIFN1enVraSBmb3IgdGhlIGZlZWRiYWNrLg0KPiA+IHYyOiAgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIzMDQxODA2MjAzMC40NTYyMC0xLQ0KPiBid2lj
YWtzb25vQG52aWRpYS5jb20vVC8jdQ0KPiA+DQo+ID4gQ2hhbmdlcyBmcm9tIHYxOg0KPiA+ICAg
KiBBZGRlZCBzZXBhcmF0ZSBLY29uZmlnIGVudHJ5IGZvciBudmlkaWEgYmFja2VuZA0KPiA+ICAg
KiBBZGRlZCBsb2NrIHRvIHByb3RlY3QgYWNjZXNzZXMgdG8gdGhlIGxpc3RzDQo+ID4gICAqIEFk
ZGVkIHN1cHBvcnQgZm9yIG1hdGNoaW5nIHN1YnNldCBkZXZpY2VzIGZyb20gYSB2ZW5kb3INCj4g
PiAgICogQWRkZWQgc3RhdGUgdHJhY2tpbmcgdG8gYXZvaWQgcmVwcm9iZSB3aGVuIGEgZGV2aWNl
IGlzIGluIHVzZQ0KPiA+IFRoYW5rcyB0byBTdXp1a2kgZm9yIHRoZSBmZWVkYmFjay4NCj4gPiB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIzMDQwMzE2Mzkw
NS4yMDM1NC0xLQ0KPiBid2ljYWtzb25vQG52aWRpYS5jb20vVC8jdQ0KPiA+DQo+ID4gLS0tDQo+
ID4gICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L0tjb25maWcgICAgICAgIHwgICA5ICstDQo+ID4g
ICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L01ha2VmaWxlICAgICAgIHwgICA2ICstDQo+ID4gICBk
cml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5jICAgIHwgMTY2DQo+ICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tDQo+ID4gICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5o
ICAgIHwgIDI0ICsrKy0NCj4gPiAgIGRyaXZlcnMvcGVyZi9hcm1fY3NwbXUvbnZpZGlhX2NzcG11
LmMgfCAgMzQgKysrKystDQo+ID4gICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L252aWRpYV9jc3Bt
dS5oIHwgIDE3IC0tLQ0KPiA+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxOTkgaW5zZXJ0aW9ucygrKSwg
NTcgZGVsZXRpb25zKC0pDQo+ID4gICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZXJmL2Fy
bV9jc3BtdS9udmlkaWFfY3NwbXUuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVy
Zi9hcm1fY3NwbXUvS2NvbmZpZw0KPiBiL2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvS2NvbmZpZw0K
PiA+IGluZGV4IDI1ZDI1ZGVkMDk4My4uZDVmNzg3ZDIyMjM0IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvcGVyZi9hcm1fY3NwbXUvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvcGVyZi9hcm1f
Y3NwbXUvS2NvbmZpZw0KPiA+IEBAIC0xLDYgKzEsNiBAQA0KPiA+ICAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICAgIw0KPiA+IC0jIENvcHlyaWdodCAoYykgMjAyMiwg
TlZJRElBIENPUlBPUkFUSU9OICYgQUZGSUxJQVRFUy4gQWxsIHJpZ2h0cw0KPiByZXNlcnZlZC4N
Cj4gPiArIyBDb3B5cmlnaHQgKGMpIDIwMjItMjAyMywgTlZJRElBIENPUlBPUkFUSU9OICYgQUZG
SUxJQVRFUy4gQWxsIHJpZ2h0cw0KPiByZXNlcnZlZC4NCj4gPg0KPiA+ICAgY29uZmlnIEFSTV9D
T1JFU0lHSFRfUE1VX0FSQ0hfU1lTVEVNX1BNVQ0KPiA+ICAgICAgIHRyaXN0YXRlICJBUk0gQ29y
ZXNpZ2h0IEFyY2hpdGVjdHVyZSBQTVUiDQo+ID4gQEAgLTEwLDMgKzEwLDEwIEBAIGNvbmZpZyBB
Uk1fQ09SRVNJR0hUX1BNVV9BUkNIX1NZU1RFTV9QTVUNCj4gPiAgICAgICAgIGJhc2VkIG9uIEFS
TSBDb3JlU2lnaHQgUE1VIGFyY2hpdGVjdHVyZS4gTm90ZSB0aGF0IHRoaXMgUE1VDQo+ID4gICAg
ICAgICBhcmNoaXRlY3R1cmUgZG9lcyBub3QgaGF2ZSByZWxhdGlvbnNoaXAgd2l0aCB0aGUgQVJN
IENvcmVTaWdodA0KPiA+ICAgICAgICAgU2VsZi1Ib3N0ZWQgVHJhY2luZy4NCj4gPiArDQo+ID4g
K2NvbmZpZyBOVklESUFfQ09SRVNJR0hUX1BNVV9BUkNIX1NZU1RFTV9QTVUNCj4gPiArICAgICB0
cmlzdGF0ZSAiTlZJRElBIENvcmVzaWdodCBBcmNoaXRlY3R1cmUgUE1VIg0KPiA+ICsgICAgIGRl
cGVuZHMgb24gQVJNX0NPUkVTSUdIVF9QTVVfQVJDSF9TWVNURU1fUE1VDQo+ID4gKyAgICAgaGVs
cA0KPiA+ICsgICAgICAgUHJvdmlkZXMgTlZJRElBIHNwZWNpZmljIGF0dHJpYnV0ZXMgZm9yIHBl
cmZvcm1hbmNlIG1vbml0b3JpbmcgdW5pdA0KPiA+ICsgICAgICAgKFBNVSkgZGV2aWNlcyBiYXNl
ZCBvbiBBUk0gQ29yZVNpZ2h0IFBNVSBhcmNoaXRlY3R1cmUuDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGVyZi9hcm1fY3NwbXUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL3BlcmYvYXJtX2NzcG11
L01ha2VmaWxlDQo+ID4gaW5kZXggZmVkYjE3ZGY5ODJkLi4wMzA5ZDJmZjI2NGEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZl
cnMvcGVyZi9hcm1fY3NwbXUvTWFrZWZpbGUNCj4gPiBAQCAtMSw2ICsxLDggQEANCj4gPiAtIyBD
b3B5cmlnaHQgKGMpIDIwMjIsIE5WSURJQSBDT1JQT1JBVElPTiAmIEFGRklMSUFURVMuIEFsbCBy
aWdodHMNCj4gcmVzZXJ2ZWQuDQo+ID4gKyMgQ29weXJpZ2h0IChjKSAyMDIyLTIwMjMsIE5WSURJ
QSBDT1JQT1JBVElPTiAmIEFGRklMSUFURVMuIEFsbCByaWdodHMNCj4gcmVzZXJ2ZWQuDQo+ID4g
ICAjDQo+ID4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4NCj4gPiAg
IG9iai0kKENPTkZJR19BUk1fQ09SRVNJR0hUX1BNVV9BUkNIX1NZU1RFTV9QTVUpICs9DQo+IGFy
bV9jc3BtdV9tb2R1bGUubw0KPiA+IC1hcm1fY3NwbXVfbW9kdWxlLXkgOj0gYXJtX2NzcG11Lm8g
bnZpZGlhX2NzcG11Lm8NCj4gPiArYXJtX2NzcG11X21vZHVsZS15IDo9IGFybV9jc3BtdS5vDQo+
ID4gKw0KPiA+ICtvYmotJChDT05GSUdfTlZJRElBX0NPUkVTSUdIVF9QTVVfQVJDSF9TWVNURU1f
UE1VKSArPQ0KPiBudmlkaWFfY3NwbXUubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYv
YXJtX2NzcG11L2FybV9jc3BtdS5jDQo+IGIvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9hcm1fY3Nw
bXUuYw0KPiA+IGluZGV4IGUyYjc4MjdjNDU2My4uMDRiZTk0YjRhYTQ4IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11LmMNCj4gPiArKysgYi9kcml2ZXJz
L3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5jDQo+ID4gQEAgLTE2LDcgKzE2LDcgQEANCj4gPiAg
ICAqIFRoZSB1c2VyIHNob3VsZCByZWZlciB0byB0aGUgdmVuZG9yIHRlY2huaWNhbCBkb2N1bWVu
dGF0aW9uIHRvIGdldA0KPiBkZXRhaWxzDQo+ID4gICAgKiBhYm91dCB0aGUgc3VwcG9ydGVkIGV2
ZW50cy4NCj4gPiAgICAqDQo+ID4gLSAqIENvcHlyaWdodCAoYykgMjAyMiwgTlZJRElBIENPUlBP
UkFUSU9OICYgQUZGSUxJQVRFUy4gQWxsIHJpZ2h0cw0KPiByZXNlcnZlZC4NCj4gPiArICogQ29w
eXJpZ2h0IChjKSAyMDIyLTIwMjMsIE5WSURJQSBDT1JQT1JBVElPTiAmIEFGRklMSUFURVMuIEFs
bCByaWdodHMNCj4gcmVzZXJ2ZWQuDQo+ID4gICAgKg0KPiA+ICAgICovDQo+ID4NCj4gPiBAQCAt
MjYsMTEgKzI2LDExIEBADQo+ID4gICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ID4g
ICAjaW5jbHVkZSA8bGludXgvaW8tNjQtbm9uYXRvbWljLWxvLWhpLmg+DQo+ID4gICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0KPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQuaD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4NCj4gPg0KPiA+ICAgI2luY2x1ZGUgImFybV9jc3BtdS5oIg0KPiA+IC0j
aW5jbHVkZSAibnZpZGlhX2NzcG11LmgiDQo+ID4NCj4gPiAgICNkZWZpbmUgUE1VTkFNRSAiYXJt
X2NzcG11Ig0KPiA+ICAgI2RlZmluZSBEUlZOQU1FICJhcm0tY3MtYXJjaC1wbXUiDQo+ID4gQEAg
LTExMiwxMSArMTEyLDEwIEBADQo+ID4gICAgKi8NCj4gPiAgICNkZWZpbmUgSElMT0hJX01BWF9Q
T0xMICAgICAxMDAwDQo+ID4NCj4gPiAtLyogSkVERUMtYXNzaWduZWQgSkVQMTA2IGlkZW50aWZp
Y2F0aW9uIGNvZGUgKi8NCj4gPiAtI2RlZmluZSBBUk1fQ1NQTVVfSU1QTF9JRF9OVklESUEgICAg
ICAgICAgICAgMHgzNkINCj4gPiAtDQo+ID4gICBzdGF0aWMgdW5zaWduZWQgbG9uZyBhcm1fY3Nw
bXVfY3B1aHBfc3RhdGU7DQo+ID4NCj4gPiArc3RhdGljIERFRklORV9NVVRFWChhcm1fY3NwbXVf
bG9jayk7DQo+ID4gKw0KPiA+ICAgc3RhdGljIHN0cnVjdCBhY3BpX2FwbXRfbm9kZSAqYXJtX2Nz
cG11X2FwbXRfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICB7DQo+ID4gICAgICAgcmV0
dXJuICooc3RydWN0IGFjcGlfYXBtdF9ub2RlICoqKWRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4g
PiBAQCAtMzczLDI3ICszNzIsMzcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXANCj4g
YXJtX2NzcG11X2NwdW1hc2tfYXR0cl9ncm91cCA9IHsNCj4gPiAgICAgICAuYXR0cnMgPSBhcm1f
Y3NwbXVfY3B1bWFza19hdHRycywNCj4gPiAgIH07DQo+ID4NCj4gPiAtc3RydWN0IGltcGxfbWF0
Y2ggew0KPiA+IC0gICAgIHUzMiBwbWlpZHI7DQo+ID4gLSAgICAgdTMyIG1hc2s7DQo+ID4gLSAg
ICAgaW50ICgqaW1wbF9pbml0X29wcykoc3RydWN0IGFybV9jc3BtdSAqY3NwbXUpOw0KPiA+IC19
Ow0KPiA+IC0NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBpbXBsX21hdGNoIGltcGxfbWF0Y2hb
XSA9IHsNCj4gPiArc3RhdGljIHN0cnVjdCBhcm1fY3NwbXVfaW1wbF9tYXRjaCBpbXBsX21hdGNo
W10gPSB7DQo+ID4gICAgICAgew0KPiA+IC0gICAgICAgLnBtaWlkciA9IEFSTV9DU1BNVV9JTVBM
X0lEX05WSURJQSwNCj4gPiAtICAgICAgIC5tYXNrID0gQVJNX0NTUE1VX1BNSUlEUl9JTVBMRU1F
TlRFUiwNCj4gPiAtICAgICAgIC5pbXBsX2luaXRfb3BzID0gbnZfY3NwbXVfaW5pdF9vcHMNCj4g
PiArICAgICAgICAgICAgIC5tb2R1bGVfbmFtZSAgICA9ICJudmlkaWFfY3NwbXUiLA0KPiA+ICsg
ICAgICAgICAgICAgLnBtaWlkcl92YWwgICAgID0gQVJNX0NTUE1VX0lNUExfSURfTlZJRElBLA0K
PiA+ICsgICAgICAgICAgICAgLnBtaWlkcl9tYXNrICAgID0gQVJNX0NTUE1VX1BNSUlEUl9JTVBM
RU1FTlRFUiwNCj4gPiArICAgICAgICAgICAgIC5tb2R1bGUgICAgICAgICA9IE5VTEwsDQo+ID4g
KyAgICAgICAgICAgICAuaW1wbF9pbml0X29wcyAgPSBOVUxMLA0KPiA+ICAgICAgIH0sDQo+ID4g
LSAgICAge30NCj4gPiArICAgICB7MH0NCj4gPiAgIH07DQo+ID4NCj4gPiArc3RhdGljIHN0cnVj
dCBhcm1fY3NwbXVfaW1wbF9tYXRjaCAqYXJtX2NzcG11X2ltcGxfbWF0Y2hfZ2V0KHUzMg0KPiBw
bWlpZHIpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgYXJtX2NzcG11X2ltcGxfbWF0Y2ggKm1h
dGNoID0gaW1wbF9tYXRjaDsNCj4gPiArDQo+ID4gKyAgICAgZm9yICg7IG1hdGNoLT5wbWlpZHJf
dmFsOyBtYXRjaCsrKSB7DQo+ID4gKyAgICAgICAgICAgICB1MzIgbWFzayA9IG1hdGNoLT5wbWlp
ZHJfbWFzazsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBpZiAoKG1hdGNoLT5wbWlpZHJfdmFs
ICYgbWFzaykgPT0gKHBtaWlkciAmIG1hc2spKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiBtYXRjaDsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgYXJtX2NzcG11X2luaXRfaW1wbF9vcHMoc3RydWN0
IGFybV9jc3BtdSAqY3NwbXUpDQo+ID4gICB7DQo+ID4gLSAgICAgaW50IHJldDsNCj4gPiArICAg
ICBpbnQgcmV0ID0gMDsNCj4gPiAgICAgICBzdHJ1Y3QgYXJtX2NzcG11X2ltcGxfb3BzICppbXBs
X29wcyA9ICZjc3BtdS0+aW1wbC5vcHM7DQo+ID4gICAgICAgc3RydWN0IGFjcGlfYXBtdF9ub2Rl
ICphcG10X25vZGUgPSBhcm1fY3NwbXVfYXBtdF9ub2RlKGNzcG11LQ0KPiA+ZGV2KTsNCj4gPiAt
ICAgICBjb25zdCBzdHJ1Y3QgaW1wbF9tYXRjaCAqbWF0Y2ggPSBpbXBsX21hdGNoOw0KPiA+ICsg
ICAgIHN0cnVjdCBhcm1fY3NwbXVfaW1wbF9tYXRjaCAqbWF0Y2g7DQo+ID4NCj4gPiAgICAgICAv
Kg0KPiA+ICAgICAgICAqIEdldCBQTVUgaW1wbGVtZW50ZXIgYW5kIHByb2R1Y3QgaWQgZnJvbSBB
UE1UIG5vZGUuDQo+ID4gQEAgLTQwNSwxNiArNDE0LDMxIEBAIHN0YXRpYyBpbnQgYXJtX2NzcG11
X2luaXRfaW1wbF9vcHMoc3RydWN0DQo+IGFybV9jc3BtdSAqY3NwbXUpDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRsKGNzcG11LT5iYXNlMCArIFBNSUlEUik7
DQo+ID4NCj4gPiAgICAgICAvKiBGaW5kIGltcGxlbWVudGVyIHNwZWNpZmljIGF0dHJpYnV0ZSBv
cHMuICovDQo+ID4gLSAgICAgZm9yICg7IG1hdGNoLT5wbWlpZHI7IG1hdGNoKyspIHsNCj4gPiAt
ICAgICAgICAgICAgIGNvbnN0IHUzMiBtYXNrID0gbWF0Y2gtPm1hc2s7DQo+ID4gKyAgICAgbWF0
Y2ggPSBhcm1fY3NwbXVfaW1wbF9tYXRjaF9nZXQoY3NwbXUtPmltcGwucG1paWRyKTsNCj4gPiAr
DQo+ID4gKyAgICAgLyogTG9hZCBpbXBsZW1lbnRlciBtb2R1bGUgYW5kIGluaXRpYWxpemUgdGhl
IGNhbGxiYWNrcy4gKi8NCj4gPiArICAgICBpZiAobWF0Y2gpIHsNCj4gPiArICAgICAgICAgICAg
IG11dGV4X2xvY2soJmFybV9jc3BtdV9sb2NrKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBp
ZiAobWF0Y2gtPmltcGxfaW5pdF9vcHMpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYg
KHRyeV9tb2R1bGVfZ2V0KG1hdGNoLT5tb2R1bGUpKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3NwbXUtPmltcGwubWF0Y2ggPSBtYXRjaDsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPSBtYXRjaC0+aW1wbF9pbml0X29wcyhjc3BtdSk7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kdWxlX3B1dChtYXRjaC0+bW9kdWxlKTsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBXQVJOKDEsICJhcm1fY3NwbXUgZmFpbGVkIHRvIGdldCBtb2R1bGU6ICVz
XG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF0Y2gtPm1v
ZHVsZV9uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlO
VkFMOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgICB9IGVs
c2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXF1ZXN0X21vZHVsZV9ub3dhaXQobWF0
Y2gtPm1vZHVsZV9uYW1lKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVQUk9C
RV9ERUZFUjsNCj4gPiArICAgICAgICAgICAgIH0NCj4gPg0KPiA+IC0gICAgICAgICAgICAgaWYg
KChtYXRjaC0+cG1paWRyICYgbWFzaykgPT0gKGNzcG11LT5pbXBsLnBtaWlkciAmIG1hc2spKSB7
DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIHJldCA9IG1hdGNoLT5pbXBsX2luaXRfb3BzKGNz
cG11KTsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgICAgICAgbXV0ZXhf
dW5sb2NrKCZhcm1fY3NwbXVfbG9jayk7DQo+ID4NCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ID4gLSAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgICAgIH0NCj4gPg0K
PiA+ICAgICAgIC8qIFVzZSBkZWZhdWx0IGNhbGxiYWNrcyBpZiBpbXBsZW1lbnRlciBkb2Vzbid0
IHByb3ZpZGUgb25lLiAqLw0KPiA+IEBAIC00NzgsMTEgKzUwMiw2IEBAIGFybV9jc3BtdV9hbGxv
Y19hdHRyX2dyb3VwKHN0cnVjdCBhcm1fY3NwbXUNCj4gKmNzcG11KQ0KPiA+ICAgICAgIHN0cnVj
dCBhdHRyaWJ1dGVfZ3JvdXAgKiphdHRyX2dyb3VwcyA9IE5VTEw7DQo+ID4gICAgICAgc3RydWN0
IGRldmljZSAqZGV2ID0gY3NwbXUtPmRldjsNCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgYXJtX2Nz
cG11X2ltcGxfb3BzICppbXBsX29wcyA9ICZjc3BtdS0+aW1wbC5vcHM7DQo+ID4gLSAgICAgaW50
IHJldDsNCj4gPiAtDQo+ID4gLSAgICAgcmV0ID0gYXJtX2NzcG11X2luaXRfaW1wbF9vcHMoY3Nw
bXUpOw0KPiA+IC0gICAgIGlmIChyZXQpDQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gTlVMTDsN
Cj4gPg0KPiA+ICAgICAgIGNzcG11LT5pZGVudGlmaWVyID0gaW1wbF9vcHMtPmdldF9pZGVudGlm
aWVyKGNzcG11KTsNCj4gPiAgICAgICBjc3BtdS0+bmFtZSA9IGltcGxfb3BzLT5nZXRfbmFtZShj
c3BtdSk7DQo+ID4gQEAgLTExMjksNiArMTE0OCwxMSBAQCBzdGF0aWMgaW50IGFybV9jc3BtdV9n
ZXRfY3B1cyhzdHJ1Y3QNCj4gYXJtX2NzcG11ICpjc3BtdSkNCj4gPiAgICAgICByZXR1cm4gYXJt
X2NzcG11X2FjcGlfZ2V0X2NwdXMoY3NwbXUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBp
bmxpbmUgc3RydWN0IG1vZHVsZSAqYXJtX2NzcG11X2dldF9tb2R1bGUoc3RydWN0IGFybV9jc3Bt
dQ0KPiAqY3NwbXUpDQo+ID4gK3sNCj4gPiArICAgICByZXR1cm4gKGNzcG11LT5pbXBsLm1hdGNo
KSA/IGNzcG11LT5pbXBsLm1hdGNoLT5tb2R1bGUgOg0KPiBUSElTX01PRFVMRTsNCj4gPiArfQ0K
PiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgYXJtX2NzcG11X3JlZ2lzdGVyX3BtdShzdHJ1Y3QgYXJt
X2NzcG11ICpjc3BtdSkNCj4gPiAgIHsNCj4gPiAgICAgICBpbnQgcmV0LCBjYXBhYmlsaXRpZXM7
DQo+ID4gQEAgLTExNDksNyArMTE3Myw3IEBAIHN0YXRpYyBpbnQgYXJtX2NzcG11X3JlZ2lzdGVy
X3BtdShzdHJ1Y3QNCj4gYXJtX2NzcG11ICpjc3BtdSkNCj4gPg0KPiA+ICAgICAgIGNzcG11LT5w
bXUgPSAoc3RydWN0IHBtdSl7DQo+ID4gICAgICAgICAgICAgICAudGFza19jdHhfbnIgICAgPSBw
ZXJmX2ludmFsaWRfY29udGV4dCwNCj4gPiAtICAgICAgICAgICAgIC5tb2R1bGUgICAgICAgICA9
IFRISVNfTU9EVUxFLA0KPiA+ICsgICAgICAgICAgICAgLm1vZHVsZSAgICAgICAgID0gYXJtX2Nz
cG11X2dldF9tb2R1bGUoY3NwbXUpLA0KPiANCj4gV2UgYXJlIGFjY2Vzc2luZyB0aGUgbW9kdWxl
IGZpZWxkIHdpdGhvdXQgdGhlIG11dGV4IGFuZCB0aGUNCj4gaW1wbC5tYXRjaC0+bW9kdWxlIGNv
dWxkIGJlIHJlc2V0ID8NCg0KDQpHb29kIGNhdGNoLCBpdCB3aWxsIGJlIGZpeGVkIG9uIHY2Lg0K
DQoNCj4gDQo+ID4gICAgICAgICAgICAgICAucG11X2VuYWJsZSAgICAgPSBhcm1fY3NwbXVfZW5h
YmxlLA0KPiA+ICAgICAgICAgICAgICAgLnBtdV9kaXNhYmxlICAgID0gYXJtX2NzcG11X2Rpc2Fi
bGUsDQo+ID4gICAgICAgICAgICAgICAuZXZlbnRfaW5pdCAgICAgPSBhcm1fY3NwbXVfZXZlbnRf
aW5pdCwNCj4gPiBAQCAtMTE5Niw2ICsxMjIwLDEwIEBAIHN0YXRpYyBpbnQgYXJtX2NzcG11X2Rl
dmljZV9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgIGlm
IChyZXQpDQo+ID4gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+DQo+ID4gKyAgICAgcmV0
ID0gYXJtX2NzcG11X2luaXRfaW1wbF9vcHMoY3NwbXUpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+
ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiAgICAgICByZXQgPSBhcm1f
Y3NwbXVfcmVnaXN0ZXJfcG11KGNzcG11KTsNCj4gPiAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiBAQCAtMTMwMCw2ICsxMzI4LDgwIEBAIHN0YXRpYyB2
b2lkIF9fZXhpdCBhcm1fY3NwbXVfZXhpdCh2b2lkKQ0KPiA+ICAgICAgIGNwdWhwX3JlbW92ZV9t
dWx0aV9zdGF0ZShhcm1fY3NwbXVfY3B1aHBfc3RhdGUpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK2lu
dCBhcm1fY3NwbXVfaW1wbF9yZWdpc3Rlcihjb25zdCBzdHJ1Y3QgYXJtX2NzcG11X2ltcGxfbWF0
Y2gNCj4gKmltcGxfbWF0Y2gpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgYXJtX2NzcG11X2lt
cGxfbWF0Y2ggKm1hdGNoOw0KPiA+ICsgICAgIGludCByZXQgPSAwOw0KPiA+ICsNCj4gPiArICAg
ICBtYXRjaCA9IGFybV9jc3BtdV9pbXBsX21hdGNoX2dldChpbXBsX21hdGNoLT5wbWlpZHJfdmFs
KTsNCj4gPiArDQo+ID4gKyAgICAgaWYgKG1hdGNoKSB7DQo+ID4gKyAgICAgICAgICAgICBtdXRl
eF9sb2NrKCZhcm1fY3NwbXVfbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFt
YXRjaC0+aW1wbF9pbml0X29wcykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBtYXRjaC0+
bW9kdWxlID0gaW1wbF9tYXRjaC0+bW9kdWxlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBt
YXRjaC0+aW1wbF9pbml0X29wcyA9IGltcGxfbWF0Y2gtPmltcGxfaW5pdF9vcHM7DQo+ID4gKyAg
ICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBCcm9rZW4g
bWF0Y2ggdGFibGUgbWF5IGNvbnRhaW4gbm9uLXVuaXF1ZSBlbnRyaWVzICovDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIFdBUk4oMSwgImFybV9jc3BtdSBiYWNrZW5kIGFscmVhZHkgcmVnaXN0
ZXJlZCBmb3IgbW9kdWxlOg0KPiAlcywgcG1paWRyOiAweCV4LCBtYXNrOiAweCV4XG4iLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hdGNoLT5tb2R1bGVfbmFtZSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXRjaC0+cG1paWRyX3ZhbCwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtYXRjaC0+cG1paWRyX21hc2spOw0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsNCj4gPiArICAgICAgICAgICAg
IH0NCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBtdXRleF91bmxvY2soJmFybV9jc3BtdV9sb2Nr
KTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBpZiAoIXJldCkNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gZHJpdmVyX2F0dGFjaCgmYXJtX2NzcG11X2RyaXZlci5kcml2ZXIpOw0K
PiA+ICsgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICBwcl9lcnIoImFybV9jc3BtdSBy
ZWcgZmFpbGVkLCB1bmFibGUgdG8gZmluZCBhIG1hdGNoIGZvciBwbWlpZHI6DQo+IDB4JXhcbiIs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGltcGxfbWF0Y2gtPnBtaWlkcl92YWwpOw0KPiA+
ICsNCj4gPiArICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICByZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGFy
bV9jc3BtdV9pbXBsX3JlZ2lzdGVyKTsNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgYXJtX2NzcG11
X21hdGNoX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKm1hdGNoKQ0KPiA+
ICt7DQo+ID4gKyAgICAgc3RydWN0IGFybV9jc3BtdSAqY3NwbXUgPQ0KPiBwbGF0Zm9ybV9nZXRf
ZHJ2ZGF0YSh0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KSk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVy
biAoY3NwbXUgJiYgY3NwbXUtPmltcGwubWF0Y2ggPT0gbWF0Y2gpID8gMSA6IDA7DQo+ID4gK30N
Cj4gPiArDQo+ID4gK3ZvaWQgYXJtX2NzcG11X2ltcGxfdW5yZWdpc3Rlcihjb25zdCBzdHJ1Y3Qg
YXJtX2NzcG11X2ltcGxfbWF0Y2gNCj4gKmltcGxfbWF0Y2gpDQo+ID4gK3sNCj4gPiArICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4gKyAgICAgc3RydWN0IGFybV9jc3BtdV9pbXBsX21hdGNo
ICptYXRjaDsNCj4gPiArDQo+ID4gKyAgICAgbWF0Y2ggPSBhcm1fY3NwbXVfaW1wbF9tYXRjaF9n
ZXQoaW1wbF9tYXRjaC0+cG1paWRyX3ZhbCk7DQo+ID4gKw0KPiA+ICsgICAgIFdBUk5fT04oIW1h
dGNoKTsNCj4gPiArDQo+ID4gKyAgICAgaWYgKG1hdGNoKSB7DQo+ID4gKyAgICAgICAgICAgICAv
KiBVbmJpbmQgdGhlIGRyaXZlciBmcm9tIGFsbCBtYXRjaGluZyBiYWNrZW5kIGRldmljZXMuICov
DQo+ID4gK2Rldl9yZWxlYXNlOg0KPiA+ICsgICAgICAgICAgICAgZGV2ID0gZHJpdmVyX2ZpbmRf
ZGV2aWNlKCZhcm1fY3NwbXVfZHJpdmVyLmRyaXZlciwgTlVMTCwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgbWF0Y2gsIGFybV9jc3BtdV9tYXRjaF9kZXZpY2UpOw0KPiA+ICsgICAgICAgICAg
ICAgaWYgKGRldikgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfcmVsZWFzZV9k
cml2ZXIoZGV2KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBkZXZfcmVsZWFzZTsN
Cj4gPiArICAgICAgICAgICAgIH0NCj4gDQo+IG1pbm9yIG5pdDogV2UgY291bGQgc2ltcGx5IGRv
IDoNCj4gDQo+IHN0YXRpYyBpbnQgYXJtX2NzcG11X3JlbGVhc2VfZHJpdmVyKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSkNCj4gew0KPiAgICAgICAgIHN0cnVjdCBhcm1fY3NwbXUgKmNz
cG11ID0NCj4gcGxhdGZvcm1fZ2V0X2RydmRhdGEodG9fcGxhdGZvcm1fZGV2aWNlKGRldikpOw0K
PiANCj4gICAgICAgICBpZiAoY3NwbXUgJiYgY3NwbXUtPmltcGwubWF0Y2ggPT0gbWF0Y2gpDQo+
ICAgICAgICAgICAgICAgICBkZXZpY2VfcmVsZWFzZV9kcml2ZXIoZGV2KTsNCj4gICAgICAgICBy
ZXR1cm4gMDsNCj4gfQ0KPiANCj4gICAgICAgICAgICAgICAgIHJldCA9IGRyaXZlcl9mb3JfZWFj
aF9kZXZpY2UoJmRyaXZlciwgTlVMTCwgbWF0Y2gsDQo+IGFybV9jc21wdV9yZWxlYXNlX2RyaXZl
cik7DQo+IA0KDQpJdCBkb2VzbuKAmXQgc2VlbSB0byB3b3JrIGZvciBtZS4NCklzIGl0IHNhZmUg
dG8gcmVsZWFzZSB3aGlsZSBpdGVyYXRpbmcgdmlhIGRyaXZlcl9mb3JfZWFjaF9kZXZpY2UgPw0K
DQpSZWdhcmRzLA0KQmVzYXINCg==
