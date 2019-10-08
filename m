Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B123CF2C3
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2019 08:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbfJHGcg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Oct 2019 02:32:36 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:6151
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729740AbfJHGcg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 8 Oct 2019 02:32:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJ1nmijn5icLiy5hnwSmzH7vm7v9MOFoWhP4d48uo3PW2cjMRlTtdkX9L+A+Vg2N3akE0c/+e9dhXLn1g61X1qEmUGXgk2U2zsewt35ocLP85AoIMXBrfzZiPR2wHUAfAUsvcood40g3TG8ss8Mr2mdv/9cxemOITJ+MwQNZCHCIXMmtU7/umm7Qcy0U2NPs4BtULBxYyiMe+bYh8VnAvRjpbnt5o2rB6n7C2cXVyKxH1+RM9pI6Pk60W/IPa/ROXueYC6X4Vi0OX9I9RnqUdeOHn4lPbzwKIgArLwiOXkMERIzymzZK4GkzjNKJ7CXcXtFAdV5iyGulw6sAHH6SjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oImTneKTaXZRFDudDgsb6lk5uibda/tIeHRzEJr54JM=;
 b=PEUyfWPB2XMzzPTuiJQxxn6FHlo2iR2lQ1nnb5rBM3zdku4G/q3strHyV5KOO9wKcYWYK6JPPZm1Y2VzkRIAZKmJTe5Mk3Lfq6RTTRiyFMMYnQKyeHTQBAp3J/o60zHoym++taSPwH/Uvlf4OBk09PjSYGgmiL1dypdCsHqLBsu2UguorHz9Rhq9UYBHzm8IwocWb+DvXwPKc4o+wTuGiX+RKFNl5OjW+iEzG5/i1I7/bqtykSl4fNf7nHa4wngQ913hHPmxOfc4861oMzYBJCznsNv3pu9q4khgt33xVAhkMc8qy7l1jGOX3N4E13TbkdwduLv7Y1+x29ctdVWLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oImTneKTaXZRFDudDgsb6lk5uibda/tIeHRzEJr54JM=;
 b=CbVt9MmxyDVbKclX8YcOe1Vs4pjMClAf1G/kaB8oQPmvc61ABCW0YL55Z3fDgmzdxqcH985D7bQ2OQC1L7+cbvvXn4ASvccseooqsbaeRX4efddAe7Sky6bCT1Yb4WwG3Vs+iYUZrdGL4FoRrjPQ+ebQqPRnbhScJAwsIaV2QCY=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5326.eurprd04.prod.outlook.com (20.177.52.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 8 Oct 2019 06:32:18 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 06:32:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
Thread-Topic: [PATCH 5/5] usb: chipidea: tegra: enable tegra-udc host mode
Thread-Index: AQHVeMKauxudtDzBGEOqWI5jiuS3zadHOYeAgAALGACAAHqigIAIk2oA
Date:   Tue, 8 Oct 2019 06:32:18 +0000
Message-ID: <20191008063202.GD5670@b29397-desktop>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-6-pgwipeout@gmail.com> <20191002113543.GO3716706@ulmo>
 <CAMdYzYoh9E+BuA_WY+eN3rL9KrBXD3p_otNL-=pYzpxAAWw=4w@mail.gmail.com>
 <9faafaf7-16fd-4989-5614-1bedd9681fdc@gmail.com>
In-Reply-To: <9faafaf7-16fd-4989-5614-1bedd9681fdc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6af5cbc1-dcae-4d0f-0ad3-08d74bb94447
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB5326:
x-microsoft-antispam-prvs: <VI1PR04MB53265174FBC7160A3A343B258B9A0@VI1PR04MB5326.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(7736002)(316002)(186003)(76176011)(26005)(6246003)(81166006)(446003)(11346002)(256004)(14444005)(25786009)(3846002)(6116002)(305945005)(8676002)(5660300002)(8936002)(53546011)(102836004)(1076003)(14454004)(99286004)(81156014)(4326008)(54906003)(6506007)(66066001)(71190400001)(71200400001)(91956017)(76116006)(478600001)(66946007)(66446008)(64756008)(66556008)(66476007)(33716001)(6436002)(44832011)(229853002)(9686003)(33656002)(6512007)(2906002)(1411001)(6486002)(476003)(6916009)(86362001)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5326;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJi2b/vJusRMZW2pi4OpOHc+y3sIfzgrK5/wGzLxhdQQvV5PqsQuXyRH0ZFRwIh+KrnX7muU9pX2dW8lHhVe6zOJ8QadoI/Srjz0lFCb3h8L4ZNLjBNy0yev85S+2zUK1gngDg8p8VfEq4mDfu6mTgE+AZb6Q0Shr2DRkWoTR3WHWTdqVvVfH3pCGn83uk6C1XA3/PH40Ep8+GclHhP9PrITOZI7BDxfZd8hpyJvNSpLNngT9q+bJOc9fqM+SLyswQnvSFWFv2OxbvgCf2C6HK182fnTZVIa47RijPEZWVdpVJnVu/rItlwWIktrXtYyxg9x19Wwb+fa3mekpcJpfIXw5GyjYRDsnXi/aYI6afgFGV+qQei2swcx6YZhg1EnNkYuttOEMki8p1Uffq/roXmOT/PEShZZneIRT2S6fdQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AD26A0D078CA44881A38B1302440EC4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af5cbc1-dcae-4d0f-0ad3-08d74bb94447
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 06:32:18.1414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 43f7Was15A6v7UybAjyvHC4cekVToQgYzasW4gxlFRULnU6mGTxVHM5UQ/RZ4C0ycXgrld1oYlrgZU63NJy7eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

T24gMTktMTAtMDIgMjI6MzQ6MjEsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToNCj4gMDIuMTAuMjAx
OSAxNToxNSwgUGV0ZXIgR2VpcyDQv9C40YjQtdGCOg0KPiA+IE9uIFdlZCwgT2N0IDIsIDIwMTkg
YXQgNzozNSBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPiB3cm90
ZToNCj4gPj4NCj4gPj4gT24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDk6NDE6NTNQTSAtMDQwMCwg
UGV0ZXIgR2VpcyB3cm90ZToNCj4gPj4+IEFkZCB0aGUgZnVuY3Rpb25zIHRvIHRoZSBjaGlwaWRl
YSBob3N0IGRyaXZlciB0byBlbmFibGUgdGVncmEgc3BlY2lmaWMNCj4gPj4+IGRtYSBhbGlnbm1l
bnQgYW5kIHJlc2V0IGhhbmRsZXJzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IEdlaXMgPHBnd2lwZW91dEBnbWFpbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICBkcml2ZXJzL3Vz
Yi9jaGlwaWRlYS9jaV9oZHJjX3RlZ3JhLmMgfCAgNyArKysrKysrDQo+ID4+PiAgZHJpdmVycy91
c2IvY2hpcGlkZWEvaG9zdC5jICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPiA+Pj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX3RlZ3JhLmMgYi9kcml2ZXJzL3VzYi9jaGlw
aWRlYS9jaV9oZHJjX3RlZ3JhLmMNCj4gPj4+IGluZGV4IDI5NDE1YzNhMmY0OC4uMmY3ZDU0MmQy
MjczIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY190ZWdy
YS5jDQo+ID4+PiArKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX3RlZ3JhLmMNCj4g
Pj4+IEBAIC0xMTgsNiArMTE4LDEzIEBAIHN0YXRpYyBpbnQgdGVncmFfdWRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4+PiAgICAgICB1ZGMtPmRhdGEudXNiX3BoeSA9
IHVkYy0+cGh5Ow0KPiA+Pj4gICAgICAgdWRjLT5kYXRhLmNhcG9mZnNldCA9IERFRl9DQVBPRkZT
RVQ7DQo+ID4+Pg0KPiA+Pj4gKyAgICAgLyogY2hlY2sgdGhlIGRvdWJsZSByZXNldCBmbGFnICov
DQo+ID4+PiArICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKHBkZXYtPmRldi5vZl9ub2Rl
LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm52aWRpYSxuZWVkcy1kb3Vi
bGUtcmVzZXQiKSkgew0KPiA+Pj4gKyAgICAgICAgICAgICBkZXZfZGJnKCZwZGV2LT5kZXYsICJz
ZXR0aW5nIGRvdWJsZSByZXNldCBmbGFnXG4iKTsNCj4gPj4+ICsgICAgICAgICAgICAgdWRjLT5k
YXRhLmZsYWdzIHw9IENJX0hEUkNfVEVHUkFfRE9VQkxFX1JFU0VUOw0KPiA+Pj4gKyAgICAgfQ0K
PiA+Pg0KPiA+PiBMaWtlIEkgc2FpZCwgSSB0aGluayBpdCdkIGJlIGJldHRlciB0byBwdXQgdGhp
cyBpbnRvIHRoZSBzYW1lIHBhdGNoIHRoYXQNCj4gPj4gYWRkcyB0aGUgZmxhZy4NCj4gPj4NCj4g
Pj4+ICsNCj4gPj4+ICAgICAgIHVkYy0+ZGV2ID0gY2lfaGRyY19hZGRfZGV2aWNlKCZwZGV2LT5k
ZXYsIHBkZXYtPnJlc291cmNlLA0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGRldi0+bnVtX3Jlc291cmNlcywgJnVkYy0+ZGF0YSk7DQo+ID4+PiAgICAgICBpZiAo
SVNfRVJSKHVkYy0+ZGV2KSkgew0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBp
ZGVhL2hvc3QuYyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2hvc3QuYw0KPiA+Pj4gaW5kZXggYjQ1
Y2ViOTFjNzM1Li5lOTViN2NiOGM1NGQgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL3VzYi9j
aGlwaWRlYS9ob3N0LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2hvc3QuYw0K
PiA+Pj4gQEAgLTIwLDYgKzIwLDcgQEANCj4gPj4+ICAjaW5jbHVkZSAiY2kuaCINCj4gPj4+ICAj
aW5jbHVkZSAiYml0cy5oIg0KPiA+Pj4gICNpbmNsdWRlICJob3N0LmgiDQo+ID4+PiArI2luY2x1
ZGUgInRlZ3JhLmgiDQo+ID4+Pg0KPiA+Pj4gIHN0YXRpYyBzdHJ1Y3QgaGNfZHJpdmVyIF9fcmVh
ZF9tb3N0bHkgY2lfZWhjaV9oY19kcml2ZXI7DQo+ID4+PiAgc3RhdGljIGludCAoKm9yaWdfYnVz
X3N1c3BlbmQpKHN0cnVjdCB1c2JfaGNkICpoY2QpOw0KPiA+Pj4gQEAgLTI3NSw2ICsyNzYsMTMg
QEAgc3RhdGljIGludCBjaV9laGNpX2h1Yl9jb250cm9sKA0KPiA+Pj4gICAgICAgICAgICAgICBn
b3RvIGRvbmU7DQo+ID4+PiAgICAgICB9DQo+ID4+Pg0KPiA+Pj4gKyAgICAgLyogRm9yIFRlZ3Jh
IFVTQjEgcG9ydCB3ZSBuZWVkIHRvIGlzc3VlIFBvcnQgUmVzZXQgdHdpY2UgaW50ZXJuYWxseSAq
Lw0KPiA+Pj4gKyAgICAgaWYgKGNpLT5wbGF0ZGF0YS0+ZmxhZ3MgJiBDSV9IRFJDX1RFR1JBX0RP
VUJMRV9SRVNFVCAmJg0KPiA+Pj4gKyAgICAgKHR5cGVSZXEgPT0gU2V0UG9ydEZlYXR1cmUgJiYg
d1ZhbHVlID09IFVTQl9QT1JUX0ZFQVRfUkVTRVQpKSB7DQo+ID4+PiArICAgICAgICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmVoY2ktPmxvY2ssIGZsYWdzKTsNCj4gPj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIHRlZ3JhX2VoY2lfaW50ZXJuYWxfcG9ydF9yZXNldChlaGNpLCBzdGF0dXNf
cmVnKTsNCj4gPj4+ICsgICAgIH0NCj4gPj4+ICsNCj4gPj4+ICAgICAgIC8qDQo+ID4+PiAgICAg
ICAgKiBBZnRlciByZXN1bWUgaGFzIGZpbmlzaGVkLCBpdCBuZWVkcyBkbyBzb21lIHBvc3QgcmVz
dW1lDQo+ID4+PiAgICAgICAgKiBvcGVyYXRpb24gZm9yIHNvbWUgU29Dcy4NCj4gPj4+IEBAIC0z
NjQsNiArMzcyLDExIEBAIGludCBjaV9oZHJjX2hvc3RfaW5pdChzdHJ1Y3QgY2lfaGRyYyAqY2kp
DQo+ID4+PiAgICAgICByZHJ2LT5uYW1lICAgICAgPSAiaG9zdCI7DQo+ID4+PiAgICAgICBjaS0+
cm9sZXNbQ0lfUk9MRV9IT1NUXSA9IHJkcnY7DQo+ID4+Pg0KPiA+Pj4gKyAgICAgaWYgKGNpLT5w
bGF0ZGF0YS0+ZmxhZ3MgJiBDSV9IRFJDX1RFR1JBX0hPU1QpIHsNCj4gPj4+ICsgICAgICAgICAg
ICAgY2lfZWhjaV9oY19kcml2ZXIubWFwX3VyYl9mb3JfZG1hID0gdGVncmFfZWhjaV9tYXBfdXJi
X2Zvcl9kbWE7DQo+ID4+PiArICAgICAgICAgICAgIGNpX2VoY2lfaGNfZHJpdmVyLnVubWFwX3Vy
Yl9mb3JfZG1hID0gdGVncmFfZWhjaV91bm1hcF91cmJfZm9yX2RtYTsNCj4gPj4+ICsgICAgIH0N
Cj4gPj4NCj4gPj4gU2FtZSBoZXJlLg0KPiA+Pg0KPiA+PiBUaGF0IHNhaWQsIHRoZXJlIGFyZSBh
IGZldyBvdGhlciBiaXRzIGluIGVoY2ktdGVncmEuYyB0aGF0IHdlIG1heSBuZWVkLg0KPiA+PiBG
b3IgZXhhbXBsZSwgdGhlIHRlZ3JhX2VoY2lfcmVzZXQoKSBmdW5jdGlvbiBzZXRzIGRpZmZlcmVu
dCB2YWx1ZXMgZm9yDQo+ID4+IHRoZSBUWCBGSUZPIHRocmVzaG9sZCwgd2hpY2ggd2UgZG9uJ3Qg
ZG8gZm9yIENoaXBJZGVhIGFzIGZhciBhcyBJIGNhbg0KPiA+PiB0ZWxsLiBXZSBhbHNvIGRpZmZl
cmVudGlhdGUgYmV0d2VlbiBUZWdyYTIwIGFuZCBsYXRlciBnZW5lcmF0aW9ucyB3aXRoDQo+ID4+
IHJlc3BlY3QgdG8gd2hldGhlciBvciBub3QgdGhleSBoYXZlIHRoZSBIT1NUUEMgcmVnaXN0ZXJz
Lg0KPiA+Pg0KPiA+PiB0ZWdyYV9laGNpX2h1Yl9jb250cm9sKCkgYWxzbyBzZWVtcyB0byBoYXZl
IGEgbnVtYmVyIG9mIG90aGVyIHdvcmstDQo+ID4+IGFyb3VuZHMgdGhhdCBhcmUgbm90IHlldCBw
b3J0ZWQgYXMgcGFydCBvZiB0aGlzIHNlcmllcy4gQW5kIHRoZW4gdGhlcmUNCj4gPj4gaXMgdGhl
IG1hdHRlciBvZiB0ZWdyYV9yZXNldF91c2JfY29udHJvbGxlcigpLiBJIHJlY2FsbCB0aGF0IHRo
aXMgaGFzDQo+ID4+IGNhdXNlZCBzZXZlcmUgaGVhZGFjaGVzIGluIHRoZSBwYXN0LCBzbyB3ZSBu
ZWVkIHRvIGJlIHZlcnkgY2FyZWZ1bCB3aGVuDQo+ID4+IGNoYW5naW5nIHRvIHRoZSBDaGlwSWRl
YSBkcml2ZXIgdGhhdCB3ZSBkb24ndCByZWludHJvZHVjZSBvbGQgYnVncw0KPiA+PiBhZ2Fpbi4N
Cj4gPj4NCj4gPj4gVGhpZXJyeQ0KPiA+IA0KPiA+IEkgc2F3IHRoZSBwYXRjaCBhcm91bmQgVGVn
cmEyMCdzIEZJRk8gcGlwZWxpbmUsIEkgaGF2ZSBhIFRlZ3JhMjANCj4gPiBkZXZpY2UgdG8gdGVz
dCBvbiBzbyBJJ2xsIGxvb2sgaWYgdGhhdCdzIHN0aWxsIG5lY2Vzc2FyeS4NCj4gPiBUaGUgdGVn
cmFfZWhjaSBkcml2ZXIgYXBwZWFyZWQgdG8gaW1wbGVtZW50IG9ubHkgd2hhdCB3YXMgbmVjZXNz
YXJ5IHRvDQo+ID4gbWFrZSB0aGUgY29udHJvbGxlciB3b3JrLCBhcyB0aGVyZSdzIGEgbG90IG9m
IG92ZXJsYXAgd2l0aCB0aGUNCj4gPiBjaGlwaWRlYSBkcml2ZXIuDQo+ID4gU2luY2UgdGhlIHRl
Z3JhLXVkYyBkcml2ZXIgd29ya2VkIHdpdGggdmVyeSBsaXR0bGUgY29kZSwgSSBmaWd1cmVkIHRo
ZQ0KPiA+IGNoaXBpZGVhIGRyaXZlciBoYW5kbGVkIG1vc3QgZXZlcnl0aGluZyBjb3JyZWN0bHkg
YWxyZWFkeS4NCj4gPiANCj4gPiBBcyBzdWNoIEkgbG9va2VkIG1vc3RseSBhdCB0aGUgd29ya2Fy
b3VuZHMgdGhhdCB3ZXJlIHRlZ3JhIHNwZWNpZmljLg0KPiA+IA0KPiA+IFRoaXMgaXMgYWxzbyB3
aHkgSSByZXF1ZXN0ZWQgbXVsdGlwbGUgZXllcywgYXMgSSBkb24ndCBoYXZlIHRoZQ0KPiA+IGJl
bmVmaXQgb2YgaGlzdG9yaWNhbCBjb250ZXh0IGJleW9uZCB0aGUgY29tbWl0IG1lc3NhZ2VzLg0K
PiANCj4gSGEhIEhvc3QgcG9ydCB3b3JrcyBvbiBteSBUZWdyYTIwIHVzaW5nIENJIGRyaXZlciBh
bmQgdGhpcyBzZXJpZXMhIEF0IGxlYXN0IG1vdXNlLA0KPiBrZXlib2FyZCBhbmQgV2lGaSBkb25n
bGUgYXJlIHdvcmtpbmcgZmluZS4gV2VsbCBkb25lLCBsb29raW5nIGZvcndhcmQgdG8gdjIgOikg
V2UgYXJlDQo+IGdldHRpbmcgY2xvc2VyIHRvIGZvbGQgdGVncmEtZWhjaSBhbmQgbW92ZSB0byB0
aGUgQ0kgZHJpdmVyIHVuaWZvcm1seS4NCg0KR3JlYXQsIHdvdWxkIHlvdSBwbGVhc2UgQ0MgbGlu
dXgtdXNiIE1MIGZvciB2Mj8NCg0KLS0gDQoNClRoYW5rcywNClBldGVyIENoZW4=
