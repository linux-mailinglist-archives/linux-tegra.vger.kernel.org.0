Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFB66D6FF7
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Apr 2023 00:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbjDDWOy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Apr 2023 18:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjDDWOw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 18:14:52 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9DE40FD;
        Tue,  4 Apr 2023 15:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOIN+u+0yk9QCQAHbVFdgrg/qoTf+QeamSjcS5kUuHxxAs3Y4ze2veTrT0/xa2H6S03dIk8roeFovRLtVHHjGqWzEoek1KUy0kME9KevehbbBSy51MwSnse/ln2Lcm0Tg7LHa2IEaOYZHRMx4qBzcLCjdCQFpXJ4e+2A2PnvNJ9mKRJYhxU+d4OBUUtK1OxCsvTpw1eddP0I03bsTTgaB+gibZPU0fOECp3F2a+lbcVgJdPljnOoauTHor9fwI9dTCaa5rr3Y0nRtjVXqCBo1Ue0lrT81rfe/kAQF/y4/uGvknoIjIHEQIZM10rJWg//ph20YpV0YumKpuf/UpVd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q88iKIkLkwtUxB5tCBeWn6TluLrHvxINio1W/nzAkAE=;
 b=dn3uYy3aAzj7sUthyg8u9TnTeIfeD5vunWQnC/WXN42eIoIGO2O7xjDms9OGFBHVKUE+ZleKLyM+Rm2HjZ77OHP8PjwWO3um/KDRLj9mOTmT6svPpUBHjgVwKqI3yYOislR0shpDDVFyFrJ7O20UVrq3RyjDq86YZwL3/w2WK3vvyev9ZbS0TPIK8ok1M+uu7R6HQScV/7ZHtrPUcSJW9FkfA0HeJrB3M+RL19aaaQXHsfJXh2yGV/BplAv1yqHkQg2CaGVk2kh2NAYrx4ZqK7ONns/JLCnn3lJeJAgQHnLafBSRrZo5cAQX2Nauf070zNqVXx06rfiy+WVMoij7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q88iKIkLkwtUxB5tCBeWn6TluLrHvxINio1W/nzAkAE=;
 b=ZDNsQJuBWqApXZWajl7XRVK7YGTaOWEZ3+jfrA8WUR04/lssTCSR2CY6rns21PltaXYDEqIjs7Gs24wXem8Ww1SvnEd1kpW9Xm3Pbp4CM3K9vLqT/rAjwwOlTZKBvfU2FAKqx1hRqjWpFXqaYtVrmLMKWY4PoSqc4U03LHoYx1lkKMTJqp/2PnDwF42th3ZpPTN6TjifxxTT/gueXCxoOUEIAHoUspLT1Y8hZkQROnWNebVmVR91cdTOfy6kBjh2DwvOww2jDWjYGOIm400q/DzxHHJ51FiLHm5NceicQb8skSlZbWYPMAT6cgXdJvzCqi+e8VsOlaTyXqrTBGx1mA==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by PH7PR12MB8107.namprd12.prod.outlook.com (2603:10b6:510:2bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 22:14:48 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::443c:612d:48d1:f1f7]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::443c:612d:48d1:f1f7%3]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 22:14:48 +0000
From:   Besar Wicaksono <bwicaksono@nvidia.com>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vikram Sethi <vsethi@nvidia.com>,
        Richard Wiley <rwiley@nvidia.com>,
        Eric Funsten <efunsten@nvidia.com>
Subject: RE: [PATCH] perf: arm_cspmu: Separate Arm and vendor module
Thread-Topic: [PATCH] perf: arm_cspmu: Separate Arm and vendor module
Thread-Index: AQHZZkrkENrmfU/3g0KeLW3zRg3DFK8a7keAgADBrYA=
Date:   Tue, 4 Apr 2023 22:14:48 +0000
Message-ID: <SJ0PR12MB56763839F03B0D9FC90B1742A0939@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20230403163905.20354-1-bwicaksono@nvidia.com>
 <3f8147b6-3362-c35b-3605-45e63cb2ddc6@arm.com>
In-Reply-To: <3f8147b6-3362-c35b-3605-45e63cb2ddc6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|PH7PR12MB8107:EE_
x-ms-office365-filtering-correlation-id: 0f6a64c0-a682-4e3c-d76f-08db355a00e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JyVjaVfgwZck6GsRqmaBgzsVzZ2rj2ILGHqQmuGqJcKEMOGF5R/Pg9cDYqwZJDodMDG/mSbwIwTrixJIt3cUCsc97RMSdcBJg/pe207if+zaJBmqcsO9r8wIGjurS7dOMPKEp876zcSWeQNpTKF6u8IsV7hBaC2oL1WwgGxrKw68WgFmOgW8SZVx7RSebd+e4W0NaNmXNWpUyLKk0ysHAVuBbOo8LmfFJCmJ9TDEUhcpHdE6L0vY+gSExnw23lv9BRDLOZbZBy0wyGqZVSaU/r48JzMDu+HTkUcbR4xJ910tF998K8W3Z7hPle8y0z5ouxp7VAJ0teBmfNutsLLLUPOWqL9nhm53lQgMUkzE2YVC3gMrrsd2SvSt+urvxd9kGIFA18Ypcuy8Et8vz/n8emfWQNGRTQvJpIu+7AwSKecQJv2p/oMZxO7jeuhiSDcYaHjXyK/MUT62n9sh7/btkPdGghgMRA2IAt7+QnUICEgAjmCAZ0V2L6yDQzWTqMC1kodbauCxq/1hKAaDhA0GIORi5bc7IoOkDLNHcD87x2+290O3Frf0g0ibgfiZe5cewbvKkhYpm4VvOuZ8VRyqzwwZxWXrcfhGRkjjYWjIYphyJnc+IFo+HyRFCPL6WJp0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199021)(33656002)(38070700005)(86362001)(76116006)(71200400001)(66476007)(66946007)(66446008)(316002)(41300700001)(64756008)(110136005)(7696005)(4326008)(478600001)(66556008)(54906003)(53546011)(55016003)(52536014)(5660300002)(2906002)(30864003)(8676002)(38100700002)(122000001)(9686003)(186003)(107886003)(83380400001)(26005)(8936002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXlWT3NuMCtRZk1vMzBNNTJyaUV5eEZ3VStOKzNVNXlrOEJGeDVJQkpIdXNk?=
 =?utf-8?B?b3hWaWtXMEt2VlpqNm0wUnFpZlBUbDZNckdzV1RZVjBjL1gyTm9Yb0ZxTnpP?=
 =?utf-8?B?dlJYd3NzeFovb1I4UXoxc1RsSTAxa0p1YlpQK2JScXFlc1dvMnNvMy9ZTy9I?=
 =?utf-8?B?V1pqNTVta0dTRFk4bzNEZ0lRTGNNdnh1Z3pHWTRuY2FCaGxmVkJxZTI2WTcw?=
 =?utf-8?B?ZWxoRE43K3BHS1doMjFwOVNqbFF6a2VuKzNYWStkcUJnVGoxOHVCRTZkcXBN?=
 =?utf-8?B?ZU94THltbTRqUkx4R2Y0NHp2NTR0TjRnWUxqYnUyanpSYVY3bVgvek1GdTgx?=
 =?utf-8?B?aGhyd3dxSFRGRlVqaHZpOWtGZ3EzMkVmR1ZyaktkM0VoZGx0QzY5bVZza0ZE?=
 =?utf-8?B?WDh6b3VjSEtjc01QeHF6SHVkMG90d0JIMW84YlQzOWUvc09rS2RzeVBNUGNX?=
 =?utf-8?B?ZVRoV2ZOOWhlYXpsdUtKRFlNdWJRN200bzF4eExZSWZxM3pvYUFMMWZIN3FL?=
 =?utf-8?B?QzJJK2JCanlocVdEaHl3TTJMTVRsYWhRbGMzUnFCTUdCa1AwaEJ6UjB2MHd2?=
 =?utf-8?B?N0pyZ1JHekZ5QWlMTkZ0V01rb1JZV0drbFAzalhydm1IWnpKcHc5bVMxbFdF?=
 =?utf-8?B?c3RsQ2tMdzRtc05OYmVtV1NOd3lTaWxCNjMwclRwS09IR2lHWW00dis3WFNN?=
 =?utf-8?B?TTA0UDVhYnNCSmNGU1B6cXVpNkxEcU1EeTJLU3N5RVB6ZHFIaFp5N21ZbDI5?=
 =?utf-8?B?OHFrR29qV0FRd3J2QURVUE5UcnhzeCtienVib2FBWmVYZVZiWDFJZTFCN044?=
 =?utf-8?B?ZmFQSmVFY28zd0hSMEJhOVBMRkNNT1R3SjZyd0hmYTdrdUpVRU5OTmN5ZElq?=
 =?utf-8?B?QS9GSkQyWElmY1RnVEFNb0o0YVlHd0JqT1FraFV6cjJlc25XVXk2WEY0djJ0?=
 =?utf-8?B?WXVlUjJ0NG9SU2srZ0FnWklTMkRqbmFIWUxBSHZFcXRPanV2YnYrZW5iM0I4?=
 =?utf-8?B?aHgvRTZadCtTV2k2STlKK1BlUmMyd2dVVVpPdTBJeFZXYWg3Z3ZNd1JTVXIy?=
 =?utf-8?B?eWdSZ3lRYlhYZzZwZktJb1JwUjBhNmhpdEpPTi9sY3JlTVVSVkNXUG9YTW0v?=
 =?utf-8?B?VVo1Ryt0TU9SK0prbVV5bHg5ZTdWOXJVcWdCSjdhOHJZMzkrK2tqRlVqUXgv?=
 =?utf-8?B?bjdPcWlZdE0wSDlKODBwZmdOT202TTB4RG1EVXBDOVFFQ0IzeHJWUGdKdHg0?=
 =?utf-8?B?R29BdEVhbFpvalRHYlpaRjVrMHlzdTRxWGp2NGlyUE5lb2grdFUxSTlrNlVQ?=
 =?utf-8?B?WEVBUFVWSHhLQWRxSXFMOTdZSXVpcHJMdWU0a0J2TE5DRzAwNjdRRldKZk9t?=
 =?utf-8?B?bDhnMFQ4TGJIcXZBditaNVBsRHM0eGd2OGcvaWlkSlh3bHFCNXptL2RKbWtx?=
 =?utf-8?B?TEhnQ0hGVXllTkY1WGZUZDFESFNteTMwTzFMOFNUb0h4L2RzU1NkNGN4bVNN?=
 =?utf-8?B?T3Q3N3NQQXByQ3g4VFNEUGNpL1cvQXNEMU5xYTFPK3dNOGovNXZtbm9hSnJQ?=
 =?utf-8?B?bVRQS2JIVEtsWEpvaXFsR0RVOVROc1Btd2NQZWRvcUNhS05zWjVsWHNlc1JR?=
 =?utf-8?B?bG1vNC9ySmxTb2w5ZVVOdUloRWp4YURuZ2lVbWc3cHh5b2dQbGh0dVdBSlRH?=
 =?utf-8?B?dFlBUVJtQmkxM0hmNHUvVHAzczhTeWtrYktTZ1FOaURZOW0yZHRld0tnRUZQ?=
 =?utf-8?B?S3VnMklCSTNzVlJGUlF0OU4wQUxzUjlnUTlWUThPRUl0OFRJdVkwZDlFWW5Z?=
 =?utf-8?B?MnU0T0Y5WmhqYTBkcWtDWHZ2STVuOXR2YjF0U3BMNkJrcy85bjhIeEFsTnVx?=
 =?utf-8?B?bVc5akRPR3MzM1o2cVNZbHdTSmx6TWlnc3RWMnZNVW1BMExBenlyS2pkcmxz?=
 =?utf-8?B?ei9pc0JOY2xKdndYSS9HNkZudlM1WDJPcmlhdi82L21pRWV5L1V5eWNheGNr?=
 =?utf-8?B?Mi93N3ZSeDBnblZKU1JBMTdydEtlcEx5OXhBL0xwRUF3ZWZrdW5HYjQrRmgw?=
 =?utf-8?B?UnJFUk9HckNiWU9DYWpkT2tEMnFZZnZyQzdaY283ekUxUzUzVm1zS3lmNmds?=
 =?utf-8?Q?PEnu8i/NnY0PkDdsO7e0nITb4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6a64c0-a682-4e3c-d76f-08db355a00e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 22:14:48.0870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sGcMfeBIMOU9EmMHARzfjkVvb/FDnwKy63eF+QWBwkAvBd0rVyX2WWQDLTMQe8gciibcDntk9nMoEL7A/ORnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8107
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGkgU3V6dWtpLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN1enVr
aSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEFw
cmlsIDQsIDIwMjMgNTowOSBBTQ0KPiBUbzogQmVzYXIgV2ljYWtzb25vIDxid2ljYWtzb25vQG52
aWRpYS5jb20+OyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbTsNCj4gd2lsbEBrZXJuZWwub3JnOyBt
YXJrLnJ1dGxhbmRAYXJtLmNvbQ0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC10ZWdyYUB2Z2Vy
Lmtlcm5lbC5vcmc7IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ow0KPiBKb25h
dGhhbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlkaWEuY29tPjsgVmlrcmFtIFNldGhpDQo+IDx2c2V0
aGlAbnZpZGlhLmNvbT47IFJpY2hhcmQgV2lsZXkgPHJ3aWxleUBudmlkaWEuY29tPjsgRXJpYyBG
dW5zdGVuDQo+IDxlZnVuc3RlbkBudmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBw
ZXJmOiBhcm1fY3NwbXU6IFNlcGFyYXRlIEFybSBhbmQgdmVuZG9yIG1vZHVsZQ0KPiANCj4gRXh0
ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4g
DQo+IA0KPiBIaSBCZXNhcg0KPiANCj4gDQo+IE9uIDAzLzA0LzIwMjMgMTc6MzksIEJlc2FyIFdp
Y2Frc29ubyB3cm90ZToNCj4gPiBBcm0gQ29yZXNpZ2h0IFBNVSBkcml2ZXIgY29uc2lzdHMgb2Yg
bWFpbiBzdGFuZGFyZCBjb2RlIGFuZCB2ZW5kb3INCj4gPiBiYWNrZW5kIGNvZGUuIEJvdGggYXJl
IGN1cnJlbnRseSBidWlsdCBhcyBhIHNpbmdsZSBtb2R1bGUuDQo+ID4gVGhpcyBwYXRjaCBhZGRz
IHZlbmRvciByZWdpc3RyYXRpb24gQVBJIHRvIHNlcGFyYXRlIHRoZSB0d28gdG8NCj4gPiBrZWVw
IHRoaW5ncyBtb2R1bGFyLiBWZW5kb3IgbW9kdWxlIHNoYWxsIHJlZ2lzdGVyIHRvIHRoZSBtYWlu
DQo+ID4gbW9kdWxlIG9uIGxvYWRpbmcgYW5kIHRyaWdnZXIgZGV2aWNlIHJlcHJvYmUuDQo+IA0K
PiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcy4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCZXNhciBXaWNha3Nvbm8gPGJ3aWNha3Nvbm9AbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvcGVyZi9hcm1fY3NwbXUvTWFrZWZpbGUgICAgICAgfCAgIDMgKy0NCj4gPiAgIGRy
aXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11LmMgICAgfCAxMTMNCj4gKysrKysrKysrKysr
KysrKysrKysrLS0tLS0NCj4gPiAgIGRyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11Lmgg
ICAgfCAgMTAgKystDQo+ID4gICBkcml2ZXJzL3BlcmYvYXJtX2NzcG11L252aWRpYV9jc3BtdS5j
IHwgIDI0ICsrKysrLQ0KPiA+ICAgZHJpdmVycy9wZXJmL2FybV9jc3BtdS9udmlkaWFfY3NwbXUu
aCB8ICAxNyAtLS0tDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCA0
MyBkZWxldGlvbnMoLSkNCj4gPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlcmYvYXJt
X2NzcG11L252aWRpYV9jc3BtdS5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJm
L2FybV9jc3BtdS9NYWtlZmlsZQ0KPiBiL2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvTWFrZWZpbGUN
Cj4gPiBpbmRleCBmZWRiMTdkZjk4MmQuLjI1MTRhZDM0YWFmMCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BlcmYvYXJtX2NzcG11L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9wZXJmL2Fy
bV9jc3BtdS9NYWtlZmlsZQ0KPiA+IEBAIC0yLDUgKzIsNCBAQA0KPiA+ICAgIw0KPiA+ICAgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+DQo+ID4gLW9iai0kKENPTkZJR19B
Uk1fQ09SRVNJR0hUX1BNVV9BUkNIX1NZU1RFTV9QTVUpICs9DQo+IGFybV9jc3BtdV9tb2R1bGUu
bw0KPiA+IC1hcm1fY3NwbXVfbW9kdWxlLXkgOj0gYXJtX2NzcG11Lm8gbnZpZGlhX2NzcG11Lm8N
Cj4gPiArb2JqLSQoQ09ORklHX0FSTV9DT1JFU0lHSFRfUE1VX0FSQ0hfU1lTVEVNX1BNVSkgKz0N
Cj4gYXJtX2NzcG11Lm8gbnZpZGlhX2NzcG11Lm8NCj4gDQo+IE5vdyB0aGF0IHdlIGhhdmUgYSBt
ZWNoYW5pc20gdG8gYWRkIHRoZSBOVklESUEgQ1NQTVUgZHJpdmVyLCBwbGVhc2UNCj4gY291bGQg
d2UgbWFrZSBpdCBhIHNlcGFyYXRlIEtjb25maWcgPw0KDQpTdXJlLCBJIHdpbGwgYWRkIG9uZSBm
b3IgTnZpZGlhIGJhY2tlbmQuDQoNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9h
cm1fY3NwbXUvYXJtX2NzcG11LmMNCj4gYi9kcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3Bt
dS5jDQo+ID4gaW5kZXggZTMxMzAyYWI3ZTM3Li42ZGJjZDQ2ZDlmZGYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9hcm1fY3NwbXUuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
cGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11LmMNCj4gPiBAQCAtMTYsNyArMTYsNyBAQA0KPiA+ICAg
ICogVGhlIHVzZXIgc2hvdWxkIHJlZmVyIHRvIHRoZSB2ZW5kb3IgdGVjaG5pY2FsIGRvY3VtZW50
YXRpb24gdG8gZ2V0DQo+IGRldGFpbHMNCj4gPiAgICAqIGFib3V0IHRoZSBzdXBwb3J0ZWQgZXZl
bnRzLg0KPiA+ICAgICoNCj4gPiAtICogQ29weXJpZ2h0IChjKSAyMDIyLCBOVklESUEgQ09SUE9S
QVRJT04gJiBBRkZJTElBVEVTLiBBbGwgcmlnaHRzDQo+IHJlc2VydmVkLg0KPiA+ICsgKiBDb3B5
cmlnaHQgKGMpIDIwMjItMjAyMywgTlZJRElBIENPUlBPUkFUSU9OICYgQUZGSUxJQVRFUy4gQWxs
IHJpZ2h0cw0KPiByZXNlcnZlZC4NCj4gPiAgICAqDQo+ID4gICAgKi8NCj4gPg0KPiA+IEBAIC0y
NSwxMyArMjUsMTMgQEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2lvLTY0LW5v
bmF0b21pYy1sby1oaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbGlzdC5oPg0KPiA+ICAgI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQu
aD4NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gPiAgICNpbmNs
dWRlIDxhY3BpL3Byb2Nlc3Nvci5oPg0KPiA+DQo+ID4gICAjaW5jbHVkZSAiYXJtX2NzcG11Lmgi
DQo+ID4gLSNpbmNsdWRlICJudmlkaWFfY3NwbXUuaCINCj4gPg0KPiA+ICAgI2RlZmluZSBQTVVO
QU1FICJhcm1fY3NwbXUiDQo+ID4gICAjZGVmaW5lIERSVk5BTUUgImFybS1jcy1hcmNoLXBtdSIN
Cj4gPiBAQCAtMTE3LDExICsxMTcsMTQgQEANCj4gPiAgICAqLw0KPiA+ICAgI2RlZmluZSBISUxP
SElfTUFYX1BPTEwgICAgIDEwMDANCj4gPg0KPiA+IC0vKiBKRURFQy1hc3NpZ25lZCBKRVAxMDYg
aWRlbnRpZmljYXRpb24gY29kZSAqLw0KPiA+IC0jZGVmaW5lIEFSTV9DU1BNVV9JTVBMX0lEX05W
SURJQSAgICAgICAgICAgICAweDM2Qg0KPiA+IC0NCj4gPiAgIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGFybV9jc3BtdV9jcHVocF9zdGF0ZTsNCj4gPg0KPiA+ICsvKiBMaXN0IG9mIENvcmVzaWdodCBQ
TVUgaW5zdGFuY2VzIGluIHRoZSBzeXN0ZW0uICovDQo+ID4gK3N0YXRpYyBMSVNUX0hFQUQoY3Nw
bXVzKTsNCj4gPiArDQo+ID4gKy8qIExpc3Qgb2YgcmVnaXN0ZXJlZCB2ZW5kb3IgYmFja2VuZHMu
ICovDQo+ID4gK3N0YXRpYyBMSVNUX0hFQUQoY3NwbXVfaW1wbHMpOw0KPiA+ICsNCj4gPiAgIC8q
DQo+ID4gICAgKiBJbiBDb3JlU2lnaHQgUE1VIGFyY2hpdGVjdHVyZSwgYWxsIG9mIHRoZSBNTUlP
IHJlZ2lzdGVycyBhcmUgMzItYml0DQo+IGV4Y2VwdA0KPiA+ICAgICogY291bnRlciByZWdpc3Rl
ci4gVGhlIGNvdW50ZXIgcmVnaXN0ZXIgY2FuIGJlIGltcGxlbWVudGVkIGFzIDMyLWJpdCBvcg0K
PiA2NC1iaXQNCj4gPiBAQCAtMzgwLDI2ICszODMsOTQgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1
dGVfZ3JvdXANCj4gYXJtX2NzcG11X2NwdW1hc2tfYXR0cl9ncm91cCA9IHsNCj4gPiAgIH07DQo+
ID4NCj4gPiAgIHN0cnVjdCBpbXBsX21hdGNoIHsNCj4gPiAtICAgICB1MzIgcG1paWRyOw0KPiA+
IC0gICAgIHUzMiBtYXNrOw0KPiA+ICsgICAgIHN0cnVjdCBsaXN0X2hlYWQgbmV4dDsNCj4gPiAr
ICAgICB1MzIgcG1paWRyX2ltcGw7DQo+IA0KPiBEbyB3ZSBuZWVkIHNvbWV0aGluZyBtb3JlIGZs
ZXhpYmxlIGhlcmUgPyBpLmUuLA0KPiANCj4gdTMyIHBtaWlkcl92YWw7DQo+IHUzMiBwbWlpZHJf
bWFzazsNCj4gDQo+IFNvIHRoYXQsIGEgc2luZ2xlIGJhY2tlbmQgY291bGQgc3VwcG9ydCBtdWx0
aXBsZS9yZWR1Y2VkDQo+IHNldCBvZiBkZXZpY2VzLg0KPiANCg0KSSB3YXMgdGhpbmtpbmcgdGhh
dCB2ZW5kb3IgYmFja2VuZCBkb2VzIGZ1cnRoZXIgZmlsdGVyaW5nLg0KQnV0IHllcywgaXQgZG9l
c24ndCBodXJ0IHRvIGhhdmUgdGhlIG1hc2sgYmFjay4NCg0KPiANCj4gPiAgICAgICBpbnQgKCpp
bXBsX2luaXRfb3BzKShzdHJ1Y3QgYXJtX2NzcG11ICpjc3BtdSk7ID4gICB9Ow0KPiA+DQo+ID4g
LXN0YXRpYyBjb25zdCBzdHJ1Y3QgaW1wbF9tYXRjaCBpbXBsX21hdGNoW10gPSB7DQo+ID4gLSAg
ICAgew0KPiA+IC0gICAgICAgLnBtaWlkciA9IEFSTV9DU1BNVV9JTVBMX0lEX05WSURJQSwNCj4g
PiAtICAgICAgIC5tYXNrID0gQVJNX0NTUE1VX1BNSUlEUl9JTVBMRU1FTlRFUiwNCj4gPiAtICAg
ICAgIC5pbXBsX2luaXRfb3BzID0gbnZfY3NwbXVfaW5pdF9vcHMNCj4gPiAtICAgICB9LA0KPiA+
IC0gICAgIHt9DQo+ID4gLX07DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgaW1wbF9tYXRjaCAqYXJtX2Nz
cG11X2dldF9pbXBsX21hdGNoKHUzMiBwbWlpZHJfaW1wbCkNCj4gPiArew0KPiA+ICsgICAgIHN0
cnVjdCBpbXBsX21hdGNoICppbXBsX21hdGNoOw0KPiA+ICsNCj4gPiArICAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KGltcGxfbWF0Y2gsICZjc3BtdV9pbXBscywgbmV4dCkgew0KPiA+ICsgICAgICAg
ICAgICAgaWYgKGltcGxfbWF0Y2gtPnBtaWlkcl9pbXBsID09IHBtaWlkcl9pbXBsKQ0KPiANCj4g
QW5kIHRoaXMgY291bGQgYmU6DQo+ICAgICAgICAgKChwbWlpZHJfaW1wbCAmIGltcGxfbWF0Y2gt
PnBtaWlkcl9tYXNrKSA9PSBtYXRjaC0+cG1paWRyX3ZhbCkNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGltcGxfbWF0Y2g7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICBy
ZXR1cm4gTlVMTDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBhcm1fY3NwbXVfZGV2
aWNlX3JlcHJvYmUodTMyIHBtaWlkcl9pbXBsKQ0KPiA+ICt7DQo+ID4gKyAgICAgaW50IHJldDsN
Cj4gPiArICAgICBzdHJ1Y3QgYXJtX2NzcG11ICpjc3BtdSwgKnRlbXA7DQo+ID4gKw0KPiA+ICsg
ICAgIC8qIFJlcHJvYmUgYWxsIGFybV9jc3BtdSBkZXZpY2VzIGFzc29jaWF0ZWQgd2l0aCBpbXBs
ZW1lbnRlciBpZC4gKi8NCj4gPiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY3NwbXUs
IHRlbXAsICZjc3BtdXMsIG5leHQpIHsNCj4gPiArICAgICAgICAgICAgIGNvbnN0IHUzMiBpbXBs
X2lkID0NCj4gRklFTERfR0VUKEFSTV9DU1BNVV9QTUlJRFJfSU1QTEVNRU5URVIsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjc3BtdS0+aW1wbC5wbWlpZHIpOw0K
PiA+ICsNCj4gPiArICAgICAgICAgICAgIGlmIChwbWlpZHJfaW1wbCA9PSBpbXBsX2lkKSB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldCA9IGRldmljZV9yZXByb2JlKGNzcG11LT5kZXYp
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X2Vycihjc3BtdS0+ZGV2LCAiRmFpbGVkIHJlcHJvYmUgJXNc
biIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjc3BtdS0+bmFt
ZSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWsgaGVyZSAgPw0KDQpObywgd2UgbmVlZCB0byBjb250aW51ZSB0aGUgaXRlcmF0aW9uIHRvIG1h
a2Ugc3VyZSB3ZSByZXByb2JlIGFsbCBkZXZpY2VzDQp3aXRoIG1hdGNoaW5nIGJhY2tlbmQuDQoN
Cj4gDQo+ID4gKyAgICAgICAgICAgICB9DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICBy
ZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IGFybV9jc3BtdV9pbXBsX3JlZ2lzdGVy
KHUzMiBwbWlpZHJfaW1wbCwNCj4gPiArICAgICBpbnQgKCppbXBsX2luaXRfb3BzKShzdHJ1Y3Qg
YXJtX2NzcG11ICpjc3BtdSkpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgaW1wbF9tYXRjaCAq
aW1wbDsNCj4gPiArDQo+ID4gKyAgICAgaWYgKGFybV9jc3BtdV9nZXRfaW1wbF9tYXRjaChwbWlp
ZHJfaW1wbCkpIHsNCj4gPiArICAgICAgICAgICAgIHByX2VycigiQVJNIENTUE1VIGltcGxlbWVu
dGVyOiAweCV4IGlzIGFscmVhZHkgcmVnaXN0ZXJlZFxuIiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgcG1paWRyX2ltcGwpOw0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FRVhJU1Q7DQo+
ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICBpbXBsID0ga3phbGxvYyhzaXplb2Yoc3RydWN0
IGltcGxfbWF0Y2gpLCBHRlBfS0VSTkVMKTsNCj4gPiArDQo+ID4gKyAgICAgbGlzdF9hZGQoJmlt
cGwtPm5leHQsICZjc3BtdV9pbXBscyk7DQo+IA0KPiBEb24ndCB3ZSBuZWVkIGEgbG9jayBwcm90
ZWN0IHRoaXMgb25lID8NCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCwgSSB3aWxsIGFk
ZCB0aGUgbG9jay4NCg0KPiANCj4gPiArDQo+ID4gKyAgICAgaW1wbC0+cG1paWRyX2ltcGwgPSBw
bWlpZHJfaW1wbDsNCj4gPiArICAgICBpbXBsLT5pbXBsX2luaXRfb3BzID0gaW1wbF9pbml0X29w
czsNCj4gDQo+IFdvdWxkIGJlIGdvb2QgdG8gZG8gdGhlc2Ugc3RlcHMgYmVmb3JlIHdlIGFjdHVh
bGx5IGFkZCBpdCB0byB0aGUNCj4gbGlzdC4gQW55d2F5cywgdGhlIGxvY2sgaXMgc3RpbGwgbmVl
ZGVkIHRvIHByZXZlbnQgcmFjZXMuDQo+IA0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gYXJtX2Nz
cG11X2RldmljZV9yZXByb2JlKHBtaWlkcl9pbXBsKTsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lN
Qk9MX0dQTChhcm1fY3NwbXVfaW1wbF9yZWdpc3Rlcik7DQo+ID4gKw0KPiA+ICt2b2lkIGFybV9j
c3BtdV9pbXBsX3VucmVnaXN0ZXIodTMyIHBtaWlkcl9pbXBsKQ0KPiA+ICt7DQo+ID4gKyAgICAg
c3RydWN0IGltcGxfbWF0Y2ggKmltcGw7DQo+ID4gKw0KPiA+ICsgICAgIGltcGwgPSBhcm1fY3Nw
bXVfZ2V0X2ltcGxfbWF0Y2gocG1paWRyX2ltcGwpOw0KPiA+ICsgICAgIGlmICghaW1wbCkgew0K
PiA+ICsgICAgICAgICAgICAgcHJfZXJyKCJVbmFibGUgdG8gZmluZCBBUk0gQ1NQTVUgaW1wbGVt
ZW50ZXI6IDB4JXhcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBtaWlkcl9pbXBsKTsN
Cj4gPiArICAgICAgICAgICAgIHJldHVybjsNCj4gPiArICAgICB9DQo+ID4gKw0KPiA+ICsgICAg
IGxpc3RfZGVsKCZpbXBsLT5uZXh0KTsNCj4gPiArICAgICBrZnJlZShpbXBsKTsNCj4gPiArDQo+
ID4gKyAgICAgaWYgKGFybV9jc3BtdV9kZXZpY2VfcmVwcm9iZShwbWlpZHJfaW1wbCkpDQo+ID4g
KyAgICAgICAgICAgICBwcl9lcnIoIkFSTSBDU1BNVSBmYWlsZWQgcmVwcm9iZSBpbXBsZW1lbnRl
cjogMHgleFxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcG1paWRyX2ltcGwpOw0KPiAN
Cj4gSXMgdGhpcyBmb3IgZmFsbGluZyBiYWNrIHRvIHRoZSBnZW5lcmljIGRyaXZlciA/DQoNClll
cywgY29ycmVjdC4gSSB3aWxsIGFkZCBhIGNvbW1lbnQgdG8gY2xhcmlmeS4NCg0KPiANCj4gPiAr
fQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChhcm1fY3NwbXVfaW1wbF91bnJlZ2lzdGVyKTsNCj4g
Pg0KPiA+ICAgc3RhdGljIGludCBhcm1fY3NwbXVfaW5pdF9pbXBsX29wcyhzdHJ1Y3QgYXJtX2Nz
cG11ICpjc3BtdSkNCj4gPiAgIHsNCj4gPiAgICAgICBpbnQgcmV0Ow0KPiA+ICAgICAgIHN0cnVj
dCBhY3BpX2FwbXRfbm9kZSAqYXBtdF9ub2RlID0gY3NwbXUtPmFwbXRfbm9kZTsNCj4gPiAgICAg
ICBzdHJ1Y3QgYXJtX2NzcG11X2ltcGxfb3BzICppbXBsX29wcyA9ICZjc3BtdS0+aW1wbC5vcHM7
DQo+ID4gLSAgICAgY29uc3Qgc3RydWN0IGltcGxfbWF0Y2ggKm1hdGNoID0gaW1wbF9tYXRjaDsN
Cj4gPiArICAgICBjb25zdCBzdHJ1Y3QgaW1wbF9tYXRjaCAqbWF0Y2g7DQo+ID4NCj4gPiAgICAg
ICAvKg0KPiA+ICAgICAgICAqIEdldCBQTVUgaW1wbGVtZW50ZXIgYW5kIHByb2R1Y3QgaWQgZnJv
bSBBUE1UIG5vZGUuDQo+ID4gQEAgLTQxMSwxMCArNDgyLDExIEBAIHN0YXRpYyBpbnQgYXJtX2Nz
cG11X2luaXRfaW1wbF9vcHMoc3RydWN0DQo+IGFybV9jc3BtdSAqY3NwbXUpDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRsKGNzcG11LT5iYXNlMCArIFBNSUlE
Uik7DQo+ID4NCj4gPiAgICAgICAvKiBGaW5kIGltcGxlbWVudGVyIHNwZWNpZmljIGF0dHJpYnV0
ZSBvcHMuICovDQo+ID4gLSAgICAgZm9yICg7IG1hdGNoLT5wbWlpZHI7IG1hdGNoKyspIHsNCj4g
PiAtICAgICAgICAgICAgIGNvbnN0IHUzMiBtYXNrID0gbWF0Y2gtPm1hc2s7DQo+ID4gKyAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeShtYXRjaCwgJmNzcG11X2ltcGxzLCBuZXh0KSB7DQo+ID4gKyAg
ICAgICAgICAgICBjb25zdCB1MzIgaW1wbF9pZCA9DQo+IEZJRUxEX0dFVChBUk1fQ1NQTVVfUE1J
SURSX0lNUExFTUVOVEVSLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjc3BtdS0+aW1wbC5wbWlpZHIpOw0KPiA+DQo+ID4gLSAgICAgICAgICAgICBp
ZiAoKG1hdGNoLT5wbWlpZHIgJiBtYXNrKSA9PSAoY3NwbXUtPmltcGwucG1paWRyICYgbWFzaykp
IHsNCj4gPiArICAgICAgICAgICAgIGlmIChtYXRjaC0+cG1paWRyX2ltcGwgPT0gaW1wbF9pZCkg
ew0KPiANCj4gbWF0Y2ggPSBhcm1fY3NwbXVfZ2V0X2ltcGxfbWF0Y2goKTsgPw0KDQpJIG1pc3Nl
ZCB0aGlzLCB0aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQo+IA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBtYXRjaC0+aW1wbF9pbml0X29wcyhjc3BtdSk7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGlmIChyZXQpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiBAQCAtOTI0LDYgKzk5Niw4IEBAIHN0YXRpYyBzdHJ1Y3Qg
YXJtX2NzcG11ICphcm1fY3NwbXVfYWxsb2Moc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiAgICAgICBpZiAoIWNzcG11KQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7
DQo+ID4NCj4gPiArICAgICBsaXN0X2FkZCgmY3NwbXUtPm5leHQsICZjc3BtdXMpOw0KPiA+ICsN
Cj4gPiAgICAgICBjc3BtdS0+ZGV2ID0gZGV2Ow0KPiA+ICAgICAgIGNzcG11LT5hcG10X25vZGUg
PSBhcG10X25vZGU7DQo+ID4NCj4gPiBAQCAtMTIxNCw2ICsxMjg4LDcgQEAgc3RhdGljIGludCBh
cm1fY3NwbXVfZGV2aWNlX3JlbW92ZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiA+DQo+ID4gICAgICAgcGVyZl9wbXVfdW5yZWdpc3RlcigmY3NwbXUtPnBtdSk7DQo+ID4gICAg
ICAgY3B1aHBfc3RhdGVfcmVtb3ZlX2luc3RhbmNlKGFybV9jc3BtdV9jcHVocF9zdGF0ZSwgJmNz
cG11LQ0KPiA+Y3B1aHBfbm9kZSk7DQo+ID4gKyAgICAgbGlzdF9kZWwoJmNzcG11LT5uZXh0KTsN
Cj4gPg0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5oDQo+IGIvZHJpdmVycy9wZXJmL2FybV9jc3Bt
dS9hcm1fY3NwbXUuaA0KPiA+IGluZGV4IDUxMzIzYjE3NWE0YS4uNjRjM2I1NjVmMWIxIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvYXJtX2NzcG11LmgNCj4gPiArKysg
Yi9kcml2ZXJzL3BlcmYvYXJtX2NzcG11L2FybV9jc3BtdS5oDQo+ID4gQEAgLTEsNyArMSw3IEBA
DQo+ID4gICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICAgICoNCj4g
PiAgICAqIEFSTSBDb3JlU2lnaHQgQXJjaGl0ZWN0dXJlIFBNVSBkcml2ZXIuDQo+ID4gLSAqIENv
cHlyaWdodCAoYykgMjAyMiwgTlZJRElBIENPUlBPUkFUSU9OICYgQUZGSUxJQVRFUy4gQWxsIHJp
Z2h0cw0KPiByZXNlcnZlZC4NCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDIyLTIwMjMsIE5WSURJ
QSBDT1JQT1JBVElPTiAmIEFGRklMSUFURVMuIEFsbCByaWdodHMNCj4gcmVzZXJ2ZWQuDQo+ID4g
ICAgKg0KPiA+ICAgICovDQo+ID4NCj4gPiBAQCAtMTE2LDYgKzExNiw3IEBAIHN0cnVjdCBhcm1f
Y3NwbXVfaW1wbCB7DQo+ID4NCj4gPiAgIC8qIENvcmVzaWdodCBQTVUgZGVzY3JpcHRvci4gKi8N
Cj4gPiAgIHN0cnVjdCBhcm1fY3NwbXUgew0KPiA+ICsgICAgIHN0cnVjdCBsaXN0X2hlYWQgbmV4
dDsNCj4gPiAgICAgICBzdHJ1Y3QgcG11IHBtdTsNCj4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXY7DQo+ID4gICAgICAgc3RydWN0IGFjcGlfYXBtdF9ub2RlICphcG10X25vZGU7DQo+ID4gQEAg
LTE0OCw0ICsxNDksMTEgQEAgc3NpemVfdCBhcm1fY3NwbXVfc3lzZnNfZm9ybWF0X3Nob3coc3Ry
dWN0DQo+IGRldmljZSAqZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2hhciAqYnVmKTsNCj4gPg0KPiA+ICsvKiBSZWdpc3RlciB2ZW5kb3Ig
YmFja2VuZC4gKi8NCj4gPiAraW50IGFybV9jc3BtdV9pbXBsX3JlZ2lzdGVyKHUzMiBwbWlpZHJf
aW1wbCwNCj4gPiArICAgICBpbnQgKCppbXBsX2luaXRfb3BzKShzdHJ1Y3QgYXJtX2NzcG11ICpj
c3BtdSkpOw0KPiANCj4gTWF5IGJlIHBhY2sgaXQgaW4gdGhlIHN0cnVjdHVyZSA/DQoNClN1cmUs
IHdpbGwgZG8uDQoNClRoYW5rcywNCkJlc2FyDQoNCj4gDQo+IA0KPiBTdXp1a2kNCj4gDQo+ID4g
Kw0KPiA+ICsvKiBVbnJlZ2lzdGVyIHZlbmRvciBiYWNrZW5kLiAqLw0KPiA+ICt2b2lkIGFybV9j
c3BtdV9pbXBsX3VucmVnaXN0ZXIodTMyIHBtaWlkcl9pbXBsKTsNCj4gPiArDQo+ID4gICAjZW5k
aWYgLyogX19BUk1fQ1NQTVVfSF9fICovDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9h
cm1fY3NwbXUvbnZpZGlhX2NzcG11LmMNCj4gYi9kcml2ZXJzL3BlcmYvYXJtX2NzcG11L252aWRp
YV9jc3BtdS5jDQo+ID4gaW5kZXggNzJlZjgwY2FhM2M4Li5kNzA4M2ZlZDEzNWQgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9wZXJmL2FybV9jc3BtdS9udmlkaWFfY3NwbXUuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGVyZi9hcm1fY3NwbXUvbnZpZGlhX2NzcG11LmMNCj4gPiBAQCAtMSw2ICsxLDYg
QEANCj4gPiAgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gICAvKg0K
PiA+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMjIsIE5WSURJQSBDT1JQT1JBVElPTiAmIEFGRklMSUFU
RVMuIEFsbCByaWdodHMNCj4gcmVzZXJ2ZWQuDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAyMi0y
MDIzLCBOVklESUEgQ09SUE9SQVRJT04gJiBBRkZJTElBVEVTLiBBbGwgcmlnaHRzDQo+IHJlc2Vy
dmVkLg0KPiA+ICAgICoNCj4gPiAgICAqLw0KPiA+DQo+ID4gQEAgLTgsNyArOCwxMCBAQA0KPiA+
DQo+ID4gICAjaW5jbHVkZSA8bGludXgvdG9wb2xvZ3kuaD4NCj4gPg0KPiA+IC0jaW5jbHVkZSAi
bnZpZGlhX2NzcG11LmgiDQo+ID4gKyNpbmNsdWRlICJhcm1fY3NwbXUuaCINCj4gPiArDQo+ID4g
Ky8qIEpFREVDLWFzc2lnbmVkIEpFUDEwNiBpZGVudGlmaWNhdGlvbiBjb2RlICovDQo+ID4gKyNk
ZWZpbmUgQVJNX0NTUE1VX0lNUExfSURfTlZJRElBICAgICAweDM2Qg0KPiA+DQo+ID4gICAjZGVm
aW5lIE5WX1BDSUVfUE9SVF9DT1VOVCAgICAgICAgICAgMTBVTEwNCj4gPiAgICNkZWZpbmUgTlZf
UENJRV9GSUxURVJfSURfTUFTSw0KPiBHRU5NQVNLX1VMTChOVl9QQ0lFX1BPUlRfQ09VTlQgLSAx
LCAwKQ0KPiA+IEBAIC0zNTEsNyArMzU0LDcgQEAgc3RhdGljIGNoYXIgKm52X2NzcG11X2Zvcm1h
dF9uYW1lKGNvbnN0IHN0cnVjdA0KPiBhcm1fY3NwbXUgKmNzcG11LA0KPiA+ICAgICAgIHJldHVy
biBuYW1lOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLWludCBudl9jc3BtdV9pbml0X29wcyhzdHJ1Y3Qg
YXJtX2NzcG11ICpjc3BtdSkNCj4gPiArc3RhdGljIGludCBudl9jc3BtdV9pbml0X29wcyhzdHJ1
Y3QgYXJtX2NzcG11ICpjc3BtdSkNCj4gPiAgIHsNCj4gPiAgICAgICB1MzIgcHJvZGlkOw0KPiA+
ICAgICAgIHN0cnVjdCBudl9jc3BtdV9jdHggKmN0eDsNCj4gPiBAQCAtMzk1LDYgKzM5OCwxOSBA
QCBpbnQgbnZfY3NwbXVfaW5pdF9vcHMoc3RydWN0IGFybV9jc3BtdSAqY3NwbXUpDQo+ID4NCj4g
PiAgICAgICByZXR1cm4gMDsNCj4gPiAgIH0NCj4gPiAtRVhQT1JUX1NZTUJPTF9HUEwobnZfY3Nw
bXVfaW5pdF9vcHMpOw0KPiA+ICsNCj4gPiArc3RhdGljIGludCBfX2luaXQgbnZpZGlhX2NzcG11
X2luaXQodm9pZCkNCj4gPiArew0KPiA+ICsgICAgIHJldHVybiBhcm1fY3NwbXVfaW1wbF9yZWdp
c3RlcihBUk1fQ1NQTVVfSU1QTF9JRF9OVklESUEsDQo+ID4gKyAgICAgICAgICAgICBudl9jc3Bt
dV9pbml0X29wcyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIF9fZXhpdCBudmlk
aWFfY3NwbXVfZXhpdCh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICAgYXJtX2NzcG11X2ltcGxfdW5y
ZWdpc3RlcihBUk1fQ1NQTVVfSU1QTF9JRF9OVklESUEpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtt
b2R1bGVfaW5pdChudmlkaWFfY3NwbXVfaW5pdCk7DQo+ID4gK21vZHVsZV9leGl0KG52aWRpYV9j
c3BtdV9leGl0KTsNCj4gPg0KPiA+ICAgTU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvYXJtX2NzcG11L252aWRpYV9jc3BtdS5oDQo+IGIvZHJp
dmVycy9wZXJmL2FybV9jc3BtdS9udmlkaWFfY3NwbXUuaA0KPiA+IGRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDcxZTE4ZjBkYzUwYi4uMDAwMDAwMDAwMDAwDQo+ID4gLS0tIGEv
ZHJpdmVycy9wZXJmL2FybV9jc3BtdS9udmlkaWFfY3NwbXUuaA0KPiA+ICsrKyAvZGV2L251bGwN
Cj4gPiBAQCAtMSwxNyArMCwwIEBADQo+ID4gLS8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wDQo+ID4gLSAqDQo+ID4gLSAqIENvcHlyaWdodCAoYykgMjAyMiwgTlZJRElBIENPUlBP
UkFUSU9OICYgQUZGSUxJQVRFUy4gQWxsIHJpZ2h0cw0KPiByZXNlcnZlZC4NCj4gPiAtICoNCj4g
PiAtICovDQo+ID4gLQ0KPiA+IC0vKiBTdXBwb3J0IGZvciBOVklESUEgc3BlY2lmaWMgYXR0cmli
dXRlcy4gKi8NCj4gPiAtDQo+ID4gLSNpZm5kZWYgX19OVklESUFfQ1NQTVVfSF9fDQo+ID4gLSNk
ZWZpbmUgX19OVklESUFfQ1NQTVVfSF9fDQo+ID4gLQ0KPiA+IC0jaW5jbHVkZSAiYXJtX2NzcG11
LmgiDQo+ID4gLQ0KPiA+IC0vKiBBbGxvY2F0ZSBOVklESUEgZGVzY3JpcHRvci4gKi8NCj4gPiAt
aW50IG52X2NzcG11X2luaXRfb3BzKHN0cnVjdCBhcm1fY3NwbXUgKmNzcG11KTsNCj4gPiAtDQo+
ID4gLSNlbmRpZiAvKiBfX05WSURJQV9DU1BNVV9IX18gKi8NCj4gPg0KPiA+IGJhc2UtY29tbWl0
OiA3M2YyYzJhN2UxZDJiMzFmZGQ1ZmFhNmRmYTE1MWM0MzdhNmMwYTVhDQo+ID4gcHJlcmVxdWlz
aXRlLXBhdGNoLWlkOiBmYjY5MWRjMDFkODc1OTdiY2JhYTRkMzUyMDczMzA0Mjg3YzIwZjczDQoN
Cg==
