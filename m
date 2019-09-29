Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88574C12F2
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Sep 2019 05:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbfI2Dgj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 28 Sep 2019 23:36:39 -0400
Received: from mail-eopbgr150043.outbound.protection.outlook.com ([40.107.15.43]:58940
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728666AbfI2Dgj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 28 Sep 2019 23:36:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNDu5k0uhAyvDF344V1UzcUHO/mYF8Ti+AlKjeRTqUlGzqHtEi2WAWQ3mD7JqBeLTk5vsb68xX8k4SSwZ+72AQRIhTAueKMezUx5vyRFbigGtcQTUuBG1iahIOjg/uW0YOxmLkihF8fMbp8yCxxMKLEi73F/bZ4Qz4oEh+4CTLZpBiyRkOE6VQbImyhVC3tDyAlYZflaxzqxrzg8GWqu4GKm0q03K7o49d6TKI4pLXnL0LoNdQOpjwttM67LlENsY8c/UrltxSfZz3DQ42gw/6O3j8TrgSLw7fyBf49GFhY4lwwGhc/DHN+aLHxMlg16fKAYB3TA5VMyqVj/iN57Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1inOus9uyhm7IdB8MO6QydeMraG2tBT+ipuewlft5Co=;
 b=DpLm9Pm9tdB0EqE8jf8RbkV7+C7S//cr7ZIQ47wmtf3RQoP2AVz9Z1b3+MqLrJi7uj/VAdQd50+xT/xzwixVb9b32FIYBAJrRTDJC/lJeVcqSWXtPzx+ghERRs+0+AX5oI5CSIHBqa+szL71I9ZHDEApoWUhVw0gCCCuLcdx+CeyFp4danHT/FejzFtcHTXa762DvotcVtGfQg3cgXezxA5FyVzDNT55PkanFV/5xkXktJSkNa872jOK2kL6hcOk393aT5lKvGCVIN6jh50NIgVbratXJQAjzZl0McDfGNBSTlVwyruAJi1htsgqpBe8IRhNjJitIFxkNjmuLBMDOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1inOus9uyhm7IdB8MO6QydeMraG2tBT+ipuewlft5Co=;
 b=I4GVrtUExew0NDsmyTjFOHd2GBtmcyLT/MCcZbfeqmQ1+hMvkLThvg1tEjSRldv7eosVBKEXc6tOeqxuPBtsDRdPbPocL4eA29coGpd55E0sMrb758lrYVIsTWgrjxQtHnINf12mbKXHu+4TymTCMghoy/LMctVJ9fOluK/2DOs=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4415.eurprd04.prod.outlook.com (20.177.55.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 03:36:35 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2305.017; Sun, 29 Sep 2019
 03:36:35 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Thread-Topic: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
Thread-Index: AQHVdjuQtxVyaJ/GUEuv7x3ZRMlLtqdCALiw
Date:   Sun, 29 Sep 2019 03:36:35 +0000
Message-ID: <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
In-Reply-To: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a131b44-0631-4d47-bdb4-08d7448e3a91
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB4415:
x-microsoft-antispam-prvs: <VI1PR04MB441554FD8BB746317A6E62868B830@VI1PR04MB4415.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 017589626D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(189003)(199004)(51744003)(8936002)(76116006)(66556008)(66446008)(476003)(486006)(71200400001)(71190400001)(110136005)(3846002)(6116002)(5660300002)(11346002)(76176011)(446003)(44832011)(186003)(7696005)(74316002)(99286004)(256004)(64756008)(66946007)(66476007)(14444005)(25786009)(9686003)(81156014)(81166006)(6246003)(102836004)(2906002)(26005)(33656002)(86362001)(66066001)(229853002)(6506007)(478600001)(316002)(55016002)(4326008)(52536014)(6436002)(14454004)(7736002)(305945005)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4415;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mXV5LAhHO9Mhcw/jGUKDLuxIJNS+6PGH0KrFwM8amw4gFzludE5716PQSkOu5IEmz5UaJVFUypVxoAKlPPdgzp0uZAmnPm0cJhK80iFTufoZQckRZIaoB3XxbKC9Cc5OL90klpL3g5xHF3vrctLAcW8niDYF4VU8JmuMAmE5hgybB46JJshfZPk2EAGEZirAhPJ4FSRofwgw7ufhs6+VMK8PexSUKCf60MaFg4dd46XP6luol2Xnbc2h/YAWTqZV3zNc6gtIoxYdqUk90pxCzVDV6mQ2nGVoMFcdjjuXBh7N0V87G/+P9OYjqpdFXbCPNri7deGC7BI/j9m+6Uo34ffcklONBQVpth0QdLXBNUZNGlBjO2PZLTfkJyYdxZiel/DgMRdP7jx0ij7Z4O521FJgnzGGsuzEBSwbuiUnNaE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a131b44-0631-4d47-bdb4-08d7448e3a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2019 03:36:35.3989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GkOdcmoIo8iqSDohElUYSCeJTAy0w1YBa5y/xTsOnD4GshK0QRDtnOA8Ncwn810x8tprfXbecRRK9il9HRPVkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4415
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

IA0KPiANCj4gSSd2ZSBlbmNvdW50ZXJlZCBhbiBvZGQgc2l0dWF0aW9uIHdoZXJlIHRoZSBDSSBE
dWFsIFJvbGUgZHJpdmVyIGhhcmQgbG9ja3MgdGhlDQo+IGtlcm5lbCBvbiB0aGUgT3V5YSAoVGVn
cmEgMykuDQo+IEkgd2FzIGF0dGVtcHRpbmcgdG8gc2V0IHVwIG1hbnVhbCBtb2RlIHN3aXRjaGlu
ZyBpbiB0aGUga2VybmVsLCBhcyB0aGUgT3V5YSBsYWNrcw0KPiBoYXJkd2FyZSBzdXBwb3J0IGZv
ciB0aGUgSUQgcGluIGFuZCBubyB2b2x0YWdlIG91dHB1dCBvbiB0aGF0IHBvcnQuDQo+IEkgZm91
bmQgdGhhdCB0aGUga2VybmVsIHdhcyBoYXJkIGxvY2tpbmcgd2hlbmV2ZXIgSSBoYWQgdGhlIGRy
X21vZGUgPSAib3RnIiBzZXQgaW4NCj4gdGhlIGRldmljZXRyZWUuDQoNCkl0IHNlZW1zIFRlZ3Jh
IGRvZXNuJ3Qgc3VwcG9ydCBob3N0IG1vZGUgdXNpbmcgY2hpcGlkZWEgZHJpdmVyLiBUaGUgY2lf
aGRyY190ZWdyYS5jDQpvbmx5IHN1cHBvcnRzIGRldmljZSBtb2RlLiBUaGllcnJ5LCBjb3VsZCB5
b3UgY29uZmlybSB0aGF0Pw0KDQpQZXRlcg0KDQo+IE5vIGZ1cnRoZXIgb3V0cHV0IHdhcyBzZWVu
IG9uIHRoZSBjb25zb2xlLCBhbmQgc3lzcmVxIGRvZXMgbm90IHJlc3BvbmQuDQo+IEl0IG9jY3Vy
cyBib3RoIGluIG1vZHVsZSBhbmQgYnVpbHRpbiBtb2RlLg0KPiANCj4gSSBoYXZlIGhvd2V2ZXIg
Zm91bmQgYSB3b3JrYXJvdW5kLg0KPiBCeSBzZXR0aW5nIHRoZSBkdWFsIHJvbGUgdXNiIGRldmlj
ZSB0bzoNCj4gY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmEzMC1laGNpIiwgIm52aWRpYSx0ZWdy
YTMwLXVkYyI7IGFuZCBzZXR0aW5nIHRoZSBhc3NpZ25lZA0KPiBwaHkgdG86DQo+IGRyX21vZGUg
PSAicGVyaXBoZXJhbCI7DQo+IEkgY2FuIGFjaGlldmUgcnVkaW1lbnRhcnkgbGl2ZSBzd2l0Y2hp
bmcgb2Ygcm9sZXMuDQo+IFRoZSBkZXZpY2UgZGVmYXVsdHMgdG8gaG9zdCBtb2RlLCBhcyB0aGUg
ZWhjaSBkcml2ZXIgZW51bWVyYXRlcyBmaXJzdC4NCj4gQnkgdW5iaW5kaW5nIHRoZSB0ZWdyYS1l
aGNpIGRyaXZlciBhbmQgYmluZGluZyB0aGUgdGVncmEtdWRjIGRyaXZlciwgSSBjYW4gc3dpdGNo
IHRvDQo+IGdhZGdldCBtb2RlLg0KPiBUaGUgcmV2ZXJzZSBhbHNvIHdvcmtzLg0KPiBUaGUgUEhZ
IGRyaXZlciBkb2VzIG5vdCBhcHBlYXIgdG8gY2FyZSBpZiBpdCBpcyBhbHdheXMgaW4gcGVyaXBo
ZXJhbCBtb2RlLg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHRpbWUsDQo+IFBldGVyIEdlaXMN
Cg==
