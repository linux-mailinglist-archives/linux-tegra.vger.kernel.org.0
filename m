Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03AC8CF243
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2019 07:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfJHFy2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Oct 2019 01:54:28 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:37379
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728297AbfJHFy1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 8 Oct 2019 01:54:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeEntXMeUFyil9Dn9o9bVuKFeK+2QCscUahpphoDyeA7fEa0/ogC2blYX5POBelDfqjBpIfPxTcXCvSShDD2FHOV0sg20urXhaX9bSY33iu0+SJ+k3lp7Smd3e8iYp2zG6ssn+/RSIBVR9oX+7Ri7VTvJ56tC72Ww+44HA9v4/s+PtXtDZRne9znJrX6vFdHERBINHP1hyRTZbGSe9akRYScCepiTnjz9SJ7ckoxS/F0wOL1gOZlwJisSTD52TNedNYRghhN8+/S3i+8iwTaxaEQa3/sdl2a5KjBcPvieB+y6RQlBk8RRl0vEeP3Cqy2emkLW3khXIYBL34T5PTyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecb8uhxVKYv1tyGn/nAWC9nJahyCSh23NNGYbWNxMuc=;
 b=inhgus5UFbAzaRQL3+M9xxy18zzLMfyQyR14h9HqgmWWGHz2rIHq6jBW9nmJOAcUnYfTYcuCib5DBg8Tm7btjM+cxtdulSviC61onwZAuuu09/ncJ1NQHZe4ti6cJ9OOcBfEkEW4zwFyNufg5RTb0loORQeOGJfWPX8lCquv1DSf+S2Il3DH7N2vhTWKvl2UR6CFHGXsJic0BmXYTZA5yDoAiQRgvYG703EoBr2gGdClwTqLuQXnr+qx3l5KjAjLv9nDtKfVuFQfw6qjBSAe68kGpXhFd4mqbmzAhM0FbMF3qnuXRx/qVR3FWxTWEIaDVRexyFdQuX4oJV8p1fCL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecb8uhxVKYv1tyGn/nAWC9nJahyCSh23NNGYbWNxMuc=;
 b=ptoChryonTQvrSRYj0aU+MEoDTV8qa8V/XovzsqzmbE/ZMPQXJTcXR5t0BBzYA3RnkVH5YIZ9kiG/WkOEBcW9F8SX/rBM9AvOcqffi4qq/Un5si3UtKZ4vDqHFv2QuyNMXEJKX0vBBuTISQf1FHf+bOr2CX2zmBmoFF6tnR2tU4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4591.eurprd04.prod.outlook.com (20.177.55.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 05:54:23 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 05:54:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Thread-Topic: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Thread-Index: AQHVdjuQtxVyaJ/GUEuv7x3ZRMlLtqdCALiwgAE5qwCAACabAIAA7j+AgAATEQCAAB4IgIAAATcAgAACiQCAACQpAIAADfCAgAAJJACAC41U8A==
Date:   Tue, 8 Oct 2019 05:54:23 +0000
Message-ID: <VI1PR04MB5327EDA625D61DA2A8763A598B9A0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
 <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
 <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
 <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
 <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com>
 <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
In-Reply-To: <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f715688-2feb-4560-7f33-08d74bb3f83a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB4591:
x-microsoft-antispam-prvs: <VI1PR04MB4591EAA767F649896047B6F68B9A0@VI1PR04MB4591.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(189003)(199004)(25786009)(55016002)(256004)(5024004)(486006)(33656002)(6436002)(66066001)(99286004)(74316002)(44832011)(9686003)(26005)(7736002)(54906003)(478600001)(71190400001)(110136005)(8676002)(71200400001)(305945005)(316002)(186003)(81166006)(66476007)(6116002)(53546011)(6506007)(7696005)(64756008)(66946007)(3846002)(52536014)(102836004)(2906002)(81156014)(14454004)(66556008)(6246003)(229853002)(76176011)(66446008)(476003)(76116006)(86362001)(11346002)(446003)(4326008)(8936002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4591;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pQjS5Xe7qfkLm3zTV3YfAoxfLhTuhVdEK+nU5QKBSHTPOSgTDfMXa7pNkMmSfzXnUYVRvYbhMtWzxa/RcehZl8RIv8/JORP++hWH9R5R0Fu+i1dEaLfroRm+ziCEcag9GR3PKILve5ji7ieo587SLM+hc2eQcCgZhtVeH5GwXZAx7PcZZNGGbICREzzcSsVUuO3FegAVk9M+Ku6q2oi6R0JQde+G+P9L+cVjdlDGn9aWU8mFCxcPSwpNV72U85loodaFa+4+0AF+ZJnHG5b6rVoCrAyxgck1XL2ywCt9aHN+SInB6T0v9yIoN8984iL/oO3GbeILHMYKbTebzsisme2fJ5LVZFOZaOcsAoKaV3FRvBz4sWuAdNcu1ks/rBcI4qV1DFyhXXJk/+QsHJr1Z+61A/ASpEuA3ppZvHMX/Q4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f715688-2feb-4560-7f33-08d74bb3f83a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 05:54:23.0357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZ9eZwefwDnt+8a18X6fe82DvAixtVsZ4ejBts3q40MQeLvS6wKlLjEHsxoljk2na0ffZQgWZRATfiUx+f2o8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4591
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

IA0KPiA+Pg0KPiA+PiBJIGhhdmUgcHJlcHBlZCB0aGUgcGF0Y2ggZm9yIHRoZSB0ZWdyYS11ZGMg
ZHJpdmVyIHRvIGZhaWwgb3V0IGluIGhvc3QNCj4gPj4gbW9kZSBhbmQgbG9hZCBhcyBhIHBlcmlw
aGVyYWwgaW4gb3RnIG1vZGUuDQo+IA0KPiBKdXN0IHRvIGJlIGNsZWFyLCB0aGlzIHBhcnQgaXMg
Z29vZCB0byBtZS4gQWx0aG91Z2gsIGRvZXNuJ3QgQ0kgZHJpdmVyIG9wZXJhdGVzIGJ5DQo+IGRl
ZmF1bHQgaW4gYSBwZXJpcGhlcmFsIG1vZGUgd2hlbiBkcm1fbW9kZT1vdGc/DQo+IA0KDQpTb3Jy
eSB0byByZXBseSBsYXRlIGR1ZSB0byBOYXRpb25hbCBIb2xpZGF5LiBUaGUgQ0kgZHJpdmVyIHdp
bGwgbm90IGNvbmZpZ3VyZSBhbnkNCm1vZGVzIGlmIGRyX21vZGUgPSBvdGcsIGFuZCB0aGUgVkJ1
cyBhbmQgSWQgaW50ZXJydXB0IHdpbGwgYmUgZW5hYmxlZCB0byB3YWl0DQpleHRlcm5hbCBldmVu
dHMuDQoNClBldGVyDQoNCj4gPj4gTXkgcmVhc29uaW5nIGZvciB0aGlzIGlzIGFzIGZvbGxvd3M6
DQo+ID4+IGhvc3QgbW9kZSBhbGxvd3MgZGV2aWNlcyB0byBlbnVtZXJhdGUsIGJ1dCBkYXRhIGNh
bm5vdCB0cmFuc21pdA0KPiA+PiBjb3JyZWN0bHkgb3RnIG1vZGUgYWxsb3dzIG1vZGUgc3dpdGNo
aW5nIHdoaWNoIGlzIGJyb2tlbiBhbmQgd2FzDQo+ID4+IG5ldmVyIHN1cHBvcnRlZCBwZXJpcGhl
cmFsIG1vZGUgaXMgdGhlIG9ubHkgZnVuY3Rpb24gdGhhdCBiZWhhdmVzDQo+ID4+IGNvcnJlY3Rs
eQ0KPiA+Pg0KPiA+PiBNeSBwcmVzdW1wdGlvbiBpcyB0aGlzIGlzIGNhdXNlZCBieSB0aGUgY2hp
cGlkZWEgZHJpdmVyIG5vdCBoYW5kbGluZw0KPiA+PiB0aGUgdGVncmEgc3BlY2lmaWMgcXVpcmtz
Lg0KPiA+PiBSZWFkaW5nIHRocm91Z2ggaG93IG5pY2UgYW5kIGNsZWFuIHRoZSB0ZWdyYS1laGNp
IGRyaXZlciBpcywgSSdtDQo+ID4+IHdvbmRlcmluZyBpZiBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
c2ltcGx5IHB1bGwgdGhlIHJlcXVpc2l0ZSBnYWRnZXQNCj4gPj4gc3R1ZmYgaW50byB0aGUgZWhj
aSBkcml2ZXIsIHZpY2UgdHJ5aW5nIHRvIHdlZGdlIGludG8gdGhlIGNoaXBpZGVhDQo+ID4+IGRy
aXZlci4NCj4gPj4NCj4gPj4gV2hhdCBkbyB5J2FsbCB0aGluaz8NCj4gPg0KPiA+IE5vdCBwb3Nz
aWJsZS4gVGhlIENoaXBJZGVhIGRyaXZlciBzdXBwb3J0cyBtdWx0aXBsZSB2ZW5kb3JzLCBpdCBp
cw0KPiA+IHVuaXZlcnNhbCBhbmQgc2hvdWxkIGhhdmUgYWxsIGZ1bmN0aW9uYWxpdHkgbmVlZGVk
IGJ5IHRoZSBob3N0IG1vZGUuDQo+ID4gVGhlcmUgaXMgbm8gcG9pbnQgaW4gZHVwbGljYXRpbmcg
dGhlIGVmZm9ydC4NCj4gPg0KPiA+IExvb2tpbmcgYXQgaG9zdC5jIG9mIENJIGRyaXZlciBJIGV2
ZW4gc2VlIHRoYXQgaXQgaGFzIHJlZmVyZW5jZXMgdG8NCj4gPiB0aGUgdGVncmEtZWhjaSBkcml2
ZXIuIEkgbWF5IHRha2UgYSBsb29rIGF0IHdoYXQgaXQgd291bGQgdGFrZSB0bw0KPiA+IHJlcGxh
Y2UgdGVncmEtZWhjaSBkcml2ZXIgd2l0aCB0aGUgQ0ksIHRoZW4gdGhlcmUgd2lsbCBvbmUgbGVz
cyBVU0INCj4gPiBkcml2ZXIgZm9yIHRoZSBzYW1lIGhhcmR3YXJlIChJSVJDLCB0aGUgZnNsLXVz
YjItdWRjIGFsc28gcG90ZW50aWFsbHkNCj4gPiBjb3VsZCBiZSBzcXVhc2hlZCBpbnRvIHRoZSBD
SSBkcml2ZXIpLg0KPiA+DQo+ID4+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDE6NTUgUE0gRG1p
dHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3cm90ZToNCj4gPj4+DQo+ID4+PiAzMC4w
OS4yMDE5IDIwOjQ2LCBQZXRlciBHZWlzINC/0LjRiNC10YI6DQo+ID4+Pj4gT24gTW9uLCBTZXAg
MzAsIDIwMTkgYXQgMTo0MiBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+DQo+
IHdyb3RlOg0KPiA+Pj4+Pg0KPiA+Pj4+PiAzMC4wOS4yMDE5IDE4OjU0LCBQZXRlciBHZWlzINC/
0LjRiNC10YI6DQo+ID4+Pj4+PiBEbWl0cnksDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQXMgZmFyIGFz
IEkgY2FuIHRlbGwgdGhlIGNwdWlkbGUgZHJpdmVycyB3b3JrIHBlcmZlY3RseSwgYnV0IEkNCj4g
Pj4+Pj4+IGRvbid0IGhhdmUgZnVsbCBwb3dlciBtYW5hZ2VtZW50IHlldCBvbiBlaXRoZXIgbXkg
VDIwIGRldmljZSBub3INCj4gPj4+Pj4+IG15IFQzMCBkZXZpY2UuDQo+ID4+Pj4+PiBUaGV5IGFy
ZW4ndCB0aGUgY2F1c2Ugb2YgdGhpcyB0aG91Z2guDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gSSd2ZSBi
ZWVuIHN0aWNraW5nIHRvIHRoZSBtYWlubGluZSByZWxlYXNlIGNvZGUgc2luY2UgNS4zIGxhbmRl
ZCwNCj4gPj4+Pj4+IGFzIHNvbWV0aGluZyB3YXMgbWVyZ2VkIGludG8gbGludXgtbmV4dCB0aGF0
IGJyZWFrcw0KPiA+Pj4+Pj4gYnJjbTQzMjkvYnJjbTQzMzAgZmlybXdhcmUgbG9hZGluZy4NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBKdW1waW5nIHRvIGxpbnV4LW5leHQgdG8gdGVzdCB5b3VyIGRyaXZl
ciBqdXN0IHJldmVhbGVkIHRoZSBiZWhhdmlvci4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBPbiBteSBU
MjAgZGV2aWNlIEkgaGF2ZW4ndCBlbmNvdW50ZXJlZCBpc3N1ZXMsIGJ1dCB0aGF0IG9wZXJhdGVz
DQo+ID4+Pj4+PiBhbG1vc3QgZXhjbHVzaXZlbHkgaW4gZ2FkZ2V0IG1vZGUuDQo+ID4+Pj4+PiBP
biBteSBUMzAgZGV2aWNlIHRlZ3JhLXVkYyBpcyBtaXNiZWhhdmluZywgZXNwZWNpYWxseSBvbiBs
aW51eC1uZXh0Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEJ5IHJlbW92aW5nIHRoZSBoYXJkY29kZWQg
TExfREVCVUcgY29uZmlnIGFuZCBtb3ZpbmcgdG8gYSBjb21tYW5kDQo+ID4+Pj4+PiBsaW5lIGVh
cmx5Y29uIHN0YXRlbWVudCwgSSBzZWVtIHRvIGJlIG1ha2luZyBwcm9ncmVzcyBpbg0KPiA+Pj4+
Pj4gY2FwdHVyaW5nIHdoYXQncyBnb2luZyBvbi4NCj4gPj4+Pj4+IFdpdGggdGhlIGZvbGxvd2lu
ZyBhY3Rpb25zLCBJIGdvdCBhIHBhbmljIGNyYXNoIGR1bXA6DQo+ID4+Pj4+PiBwaHkgc2V0IHRv
IHBlcmlwaGVyYWwsIGJvb3Qgd2l0aCB0ZWdyYS1laGNpIGluIGhvc3QgbW9kZSwgdXNiIGh1YiBw
bHVnZ2VkDQo+IGluLg0KPiA+Pj4+Pj4gQm9vdGVkIHN1Y2Nlc3NmdWxseSwgaHViIGVudW1lcmF0
ZWQsIHBhc3NlZCBkYXRhIHRocm91Z2ggYXR0YWNoZWQNCj4gPj4+Pj4+IGV0aGVybmV0IGRldmlj
ZS4NCj4gPj4+Pj4+IFVuYmluZCB0aGUgdGVncmEtZWhjaSBkcml2ZXIsIGJpbmQgdGhlIHRlZ3Jh
LXVkYyBkcml2ZXIuDQo+ID4+Pj4+PiBIdWIgZW51bWVyYXRlcywgYXMgd2VsbCBhcyBhdHRhY2hl
ZCBldGhlcm5ldCBkZXZpY2UsIGJ1dCB3cml0ZXMNCj4gPj4+Pj4+IHRvIHRoZSBkZXZpY2UgdGhy
b3cgY29uc3RhbnQgZXJyb3JzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJcyB0aGUgaG9zdCBtb2RlIHdv
cmtpbmcgcHJvcGVybHkgd2hlbiBib290aW5nIHdpdGggdGhlIHRlZ3JhLXVkYw0KPiA+Pj4+PiBh
cyBhIHByaW1hcnkgZHJpdmVyPw0KPiA+Pj4+DQo+ID4+Pj4gSSBhY3R1YWxseSBnb3QgaXQgd29y
a2luZyA8b25jZT4uDQo+ID4+Pj4gSXQgdGhyZXcgY29uc3RhbnQgcmVzZXQgZXJyb3JzIHRob3Vn
aC4NCj4gPj4+PiBBZnRlcndhcmRzIGEgc29mdCByZWJvb3QgY2F1c2VkIHRoZSBrZXJuZWwgdG8g
Y3Jhc2ggd2l0aCBhbiBpcnEtaW5pdCBlcnJvci4NCj4gPj4+PiB0ZWdyYS1laGNpIGlzIHRoZSBv
bmx5IHN0YWJsZSBob3N0IGRyaXZlci4NCj4gPj4+DQo+ID4+PiBPa2F5LCBJIGd1ZXNzIHRoZSBo
b3N0IG1vZGUgcmVxdWlyZXMgc29tZSBleHRyYSBjb25maWd1cmF0aW9uIChvcg0KPiA+Pj4gc29t
ZQ0KPiA+Pj4gcXVpcmspIHRoYXQgaXMgY3VycmVudGx5IG1pc3NpbmcgaW4gdGhlIHRlZ3JhLXVk
Yy4gWW91IG1heSB0cnkgdG8NCj4gPj4+IGNvbXBhcmUgd2hhdCB0ZWdyYS1laGNpIGFuZCB0ZWdy
YS11ZGMgZG8gZGlmZmVyZW50bHkgYW5kIHRoZW4gZmlndXJlDQo+ID4+PiBvdXQgaG93IG1ha2Ug
aXQgdG8gd29yaywgZm9yIG5vdyBJIGRvbid0IGhhdmUgYW55IGJldHRlciBhZHZpc2VzLg0KPiA+
Pj4NCj4gPj4+Pj4+IFVuYmluZCB0aGUgdGVncmEtdWRjIGRyaXZlciwgcHJvZHVjZXMgdGhlIGZv
bGxvd2luZyBwYW5pYzoNCj4gPj4+Pj4NCj4gPj4+Pj4gTG9va3MgbGlrZSBpdCBpcyBhIENJIGRy
aXZlciBidWcsIHBlcmhhcHMgdGltZXIncyB0ZWFyIGRvd24gaXNuJ3QNCj4gPj4+Pj4gcGVyZm9y
bWVkIGNvcnJlY3RseS4gTWF5YmUgaXQgaXMgcmVsYXRlZCB0byB0aGUgZXJyb3JzIHlvdSdyZQ0K
PiA+Pj4+PiBzZWVpbmcgYW5kIHNvbWV0aGluZyBnZXR0aW5nIHN0dWNrIHdpdGggdGhlIG9mZmVu
ZGluZyB0aW1lciBiZWluZw0KPiA+Pj4+PiBhY3RpdmUgZHVyaW5nIG9mIHRoZSBkcml2ZXIncyB1
bmJpbmRpbmcuLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBQcm9iYWJseSBQZXRlciBDaGVuIGNvdWxkIGhl
bHAgd2l0aCB0aGF0Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBbc25pcF0NCj4gPj4+DQo+ID4NCg0K
