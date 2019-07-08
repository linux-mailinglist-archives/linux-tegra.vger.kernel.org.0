Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47D7361F3E
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Jul 2019 15:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730972AbfGHNF3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 8 Jul 2019 09:05:29 -0400
Received: from mail-eopbgr70111.outbound.protection.outlook.com ([40.107.7.111]:49889
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729076AbfGHNF3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Jul 2019 09:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJP6TtGaiAUpY/MxsWraHwK63q4SJ2XGBvfnhGdwgI0=;
 b=cdWDhOBBbMO0zHDwcdK6bDlFuE+2NrRJ9EAC4tfpen/9dRSiwlfMHjns6IM/FhgfdSGmZG6Qd5i+8r+UoYLJdhyPImrE0B5GNLzPYCmZOWOxjdzKv3u7eBbtLUW/LRJlzr7hvMkDHFXpR1zt8Q3/lvIG7/0hDMShwn9dY68XSP4=
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com (52.134.7.143) by
 VI1PR0502MB4077.eurprd05.prod.outlook.com (52.134.18.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 13:05:10 +0000
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::edbc:bd02:11d7:aa6a]) by VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::edbc:bd02:11d7:aa6a%3]) with mapi id 15.20.2052.010; Mon, 8 Jul 2019
 13:05:10 +0000
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC:     "richard@sigma-star.at" <richard@sigma-star.at>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: [REGRESSION] ubifs: Don't leak orphans on memory during commit
Thread-Topic: [REGRESSION] ubifs: Don't leak orphans on memory during commit
Thread-Index: AQHVNY3F90AlETdzv0al4GI8EIQzeQ==
Date:   Mon, 8 Jul 2019 13:05:10 +0000
Message-ID: <3e2b525c8c0d9e3ebe13fcfe7b28cc0d3b203d64.camel@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2754d902-7500-49e8-1fa5-08d703a4e86d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:VI1PR0502MB4077;
x-ms-traffictypediagnostic: VI1PR0502MB4077:
x-microsoft-antispam-prvs: <VI1PR0502MB407745828F5DF8B70FE741D6FBF60@VI1PR0502MB4077.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(39840400004)(376002)(346002)(136003)(199004)(189003)(5640700003)(118296001)(81166006)(8936002)(8676002)(81156014)(6512007)(2906002)(36756003)(6916009)(6436002)(53936002)(316002)(68736007)(305945005)(6486002)(54906003)(71190400001)(2351001)(71200400001)(14444005)(3846002)(6116002)(256004)(7736002)(478600001)(2616005)(25786009)(44832011)(14454004)(4326008)(486006)(476003)(45080400002)(102836004)(26005)(86362001)(6506007)(73956011)(66066001)(76116006)(186003)(99286004)(2501003)(66446008)(91956017)(66946007)(5660300002)(66476007)(64756008)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR0502MB4077;H:VI1PR0502MB3648.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sZF6bl1dnqEEgg8In7XRy9/yNN499iRRhc1LlztywLwqtXaL5vQAkKUDI3gP/DshIUC0Mwe+0Ea1MNT5J2Wk6LUt2WCtpKxbSSn9UBvwnRP3PU8Ysb1KiTxJTTr5bYSVea9IqZ1wOhfbdf1on4ykhI0ZfZEcoXuAF7SH4+t2clg+B7udYWMZoI6zVnxpjh6JoxXOgSSYgy2Hlsh2qmfoMU9SN+du7oEOIf/9BOU3tg9IDnPoZo+GIqQtti2RLYuSWXbx8mpoQozngF7/jU7KYBHv0RgoGK+8UzPc2x+3MA0RBuKZmxALpFhgsUMP1/8f6FOnC9HnE3xwFFTDO+fHZr4cQ2raXtzfHfaDZ1PuY7pVmcQsJIo/0+FGh+wBmem7MLYr2iUyUMxXcoQWwCIlcuVQen53Ar/E1S09gwzRhrc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C77934ED65982F4EAC77EAA10446A1BE@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2754d902-7500-49e8-1fa5-08d703a4e86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 13:05:10.3241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4077
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGkgdGhlcmUNCg0KSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgc3RyYW5nZSBVQklGUyBy
b290ZnMgY3Jhc2ggaXNzdWUgc2VlbiBvbg0KQ29saWJyaSBUMjAgYWthIG9uIHRvcCBvZiB0aGUg
dGVncmFfbmFuZCBkcml2ZXIuIEkgYmlzZWN0ZWQgaXQgdG8gdGhlDQpmb2xsb3dpbmcgY29tbWl0
IGMxNmU3MzU4N2FkNiAoInViaWZzOiBEb24ndCBsZWFrIG9ycGhhbnMgb24gbWVtb3J5DQpkdXJp
bmcgY29tbWl0IikgYW5kIGluZGVlZCBqdXN0IHJldmVydGluZyB0aGF0IG9uZSBldmVuIG9uIHRv
cCBvZg0KdG9kYXkncyBsYXRlc3QgLW5leHQgbWFrZXMgaXQgd29yayBhZ2Fpbi4gVGhlIGZvbGxv
d2luZyBpcyB3aGF0IEkgZ2V0DQpkdXJpbmcgYm9vdCBpZiB0aGF0IGNvbW1pdCBpcyBpbmNsdWRl
ZDoNCg0KWyAgIDE0LjQ0MzI1M10gODwtLS0gY3V0IGhlcmUgLS0tDQpbICAgMTQuNDQ2NTE1XSBV
bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsDQphZGRyZXNz
IDZiNmI2YjZiDQpbICAgMTQuNDUzNzc5XSBwZ2QgPSAwMjEwMjJkMA0KWyAgIDE0LjQ1NjUzNV0g
WzZiNmI2YjZiXSAqcGdkPTAwMDAwMDAwDQpbICAgMTQuNDYwMTMxXSBJbnRlcm5hbCBlcnJvcjog
T29wczogNSBbIzFdIFBSRUVNUFQgU01QIEFSTQ0KWyAgIDE0LjQ2NTQ4OF0gTW9kdWxlcyBsaW5r
ZWQgaW46DQpbICAgMTQuNDY4NjEyXSBDUFU6IDEgUElEOiAzMTEgQ29tbTogbHhkbS1iaW5hcnkg
Tm90IHRhaW50ZWQgNS4yLjAtcmM3LQ0KbmV4dC0yMDE5MDcwNC1kaXJ0eSAjMjQNClsgICAxNC40
NzcwMzBdIEhhcmR3YXJlIG5hbWU6IE5WSURJQSBUZWdyYSBTb0MgKEZsYXR0ZW5lZCBEZXZpY2Ug
VHJlZSkNClsgICAxNC40ODMzNzddIFBDIGlzIGF0IHViaWZzX2RlbGV0ZV9vcnBoYW4rMHg3Yy8w
eGQ0DQpbICAgMTQuNDg4MjE1XSBMUiBpcyBhdCAweDZiNmI2YjZiDQpbICAgMTQuNDkxMzk3XSBw
YyA6IFs8YzAzZTI2ZjA+XSAgICBsciA6IFs8NmI2YjZiNmI+XSAgICBwc3I6IDYwMGYwMTEzDQpb
ICAgMTQuNDk3NzE1XSBzcCA6IGQxZGExZWU4ICBpcCA6IGQxZGU0YWMwICBmcCA6IGQyN2IyOWI4
DQpbICAgMTQuNTAyOTg1XSByMTA6IDAwMDAwMDAyICByOSA6IGQyMzM5NmNjICByOCA6IDAwMDAw
MDAwDQpbICAgMTQuNTA4MjYwXSByNyA6IGQyMzM5MGFjICByNiA6IGQyMzM5MDAwICByNSA6IDAw
MDA2M2Q4ICByNCA6DQpkMWRlNGE4MA0KWyAgIDE0LjUxNDg0MV0gcjMgOiA2YjZiNmI2YiAgcjIg
OiBmMzQ0YWEwZCAgcjEgOiAxMjEzZDAwMCAgcjAgOg0KZDFkZTRhODANClsgICAxNC41MjE0MjZd
IEZsYWdzOiBuWkN2ICBJUlFzIG9uICBGSVFzIG9uICBNb2RlIFNWQ18zMiAgDQpJU0EgQVJNICBT
ZWdtZW50IG5vbmUNClsgICAxNC41Mjg2MTldIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogMTFm
MjQwNGEgIERBQzogMDAwMDAwNTENClsgICAxNC41MzQ0MjFdIFByb2Nlc3MgbHhkbS1iaW5hcnkg
KHBpZDogMzExLCBzdGFjayBsaW1pdCA9IDB4M2U2NWI1NmMpDQpbICAgMTQuNTQwODI5XSBTdGFj
azogKDB4ZDFkYTFlZTggdG8gMHhkMWRhMjAwMCkNClsgICAxNC41NDUyNDddIDFlZTA6ICAgICAg
ICAgICAgICAgICAgIGQyN2IyOWI4IGQyMzM5MDAwIDAwMDAwMDAwDQpkMjMzOTBhYyAwMDAwMDAw
MCBmZmZmZmY5Yw0KWyAgIDE0LjU1MzUxMF0gMWYwMDogMDAwMDAwMDIgYzAzY2E4MDQgZDI3YjI5
YjggZDIzMzkwMDAgMDAwMDAwMDANCjAwMDAwMDAwIDAwMDAwMDAwIGMwM2QxZjkwDQpbICAgMTQu
NTYxNzcyXSAxZjIwOiBkMjdiMjliOCBkMjdiMmE3MCBjMGIyNGY2OCBkMWRhMWY2OCAwMDAwMDAw
MA0KYzAyOGVkOGMgZDI3YTI2NDggMDAwMDAwMDANClsgICAxNC41NzAwMzZdIDFmNDA6IGQxZjgz
MDAwIGMwMjgzYjM0IGQxZGExZjY4IGQxZGExZjU4IDYwMGQwMDEzDQpjMTAwNGM0OCAwMDAwMDAw
MCAwMDAwMDAwMA0KWyAgIDE0LjU3ODMwMF0gMWY2MDogZDJjODYwMTAgZDI1YmFhYTggMWFmMTMy
NWEgMDAwMDAwMGMgZDFmODMwMTkNCmQxZGExZWQ0IDAwMDAwMDAwIGYzNDRhYTBkDQpbICAgMTQu
NTg2NTYzXSAxZjgwOiAwMDAwZWNkNCAwMDAwZWNkNCAwMDAwMDAwMCAwMDAwYjFlNCAwMDAwMDAw
YQ0KYzAxMDEyMDQgZDFkYTAwMDAgMDAwMDAwMGENClsgICAxNC41OTQ4MjZdIDFmYTA6IDAwMDAw
MDAwIGMwMTAxMDAwIDAwMDBlY2Q0IDAwMDAwMDAwIDAwMDBmNWNjDQpiZWQ4NmU2NCBiZWQ4NmU2
YyAwMDAwYWUxNQ0KWyAgIDE0LjYwMzA4N10gMWZjMDogMDAwMGVjZDQgMDAwMDAwMDAgMDAwMGIx
ZTQgMDAwMDAwMGEgMDAwMDAwMDANCjAwMDAwMDAwIGI2ZjJlZmFjIDAwMDAwMDAwDQpbICAgMTQu
NjExMzUwXSAxZmUwOiBiNmRhMTdjMCBiZWQ4NmMxNCAwMDAwYjA5NSBiNmRhMTdjYyA2MDBkMDAx
MA0KMDAwMGY1Y2MgMDAwMDAwMDAgMDAwMDAwMDANClsgICAxNC42MTk2NDhdIFs8YzAzZTI2ZjA+
XSAodWJpZnNfZGVsZXRlX29ycGhhbikgZnJvbSBbPGMwM2NhODA0Pl0NCih1Ymlmc19qbmxfZGVs
ZXRlX2lub2RlKzB4ZGMvMHhlMCkNClsgICAxNC42Mjg4MDFdIFs8YzAzY2E4MDQ+XSAodWJpZnNf
am5sX2RlbGV0ZV9pbm9kZSkgZnJvbSBbPGMwM2QxZjkwPl0NCih1Ymlmc19ldmljdF9pbm9kZSsw
eDc4LzB4ZjQpDQpbICAgMTQuNjM3Nzc0XSBbPGMwM2QxZjkwPl0gKHViaWZzX2V2aWN0X2lub2Rl
KSBmcm9tIFs8YzAyOGVkOGM+XQ0KKGV2aWN0KzB4OTgvMHgxNjgpDQpbICAgMTQuNjQ1MzUwXSBb
PGMwMjhlZDhjPl0gKGV2aWN0KSBmcm9tIFs8YzAyODNiMzQ+XQ0KKGRvX3VubGlua2F0KzB4MjI4
LzB4Mjk4KQ0KWyAgIDE0LjY1MjQ4M10gWzxjMDI4M2IzND5dIChkb191bmxpbmthdCkgZnJvbSBb
PGMwMTAxMDAwPl0NCihyZXRfZmFzdF9zeXNjYWxsKzB4MC8weDU0KQ0KWyAgIDE0LjY2MDI5NF0g
RXhjZXB0aW9uIHN0YWNrKDB4ZDFkYTFmYTggdG8gMHhkMWRhMWZmMCkNClsgICAxNC42NjU0MDhd
IDFmYTA6ICAgICAgICAgICAgICAgICAgIDAwMDBlY2Q0IDAwMDAwMDAwIDAwMDBmNWNjDQpiZWQ4
NmU2NCBiZWQ4NmU2YyAwMDAwYWUxNQ0KWyAgIDE0LjY3MzY2OV0gMWZjMDogMDAwMGVjZDQgMDAw
MDAwMDAgMDAwMGIxZTQgMDAwMDAwMGEgMDAwMDAwMDANCjAwMDAwMDAwIGI2ZjJlZmFjIDAwMDAw
MDAwDQpbICAgMTQuNjgxOTE5XSAxZmUwOiBiNmRhMTdjMCBiZWQ4NmMxNCAwMDAwYjA5NSBiNmRh
MTdjYw0KWyAgIDE0LjY4NzAzOF0gQ29kZTogZTFhMDEwMDQgZTFhMDAwMDYgZWJmZmZmODAgZTU5
NDMwMWMgKGU0MTMyMDFjKQ0KWyAgIDE0LjY5MzM1M10gLS0tWyBlbmQgdHJhY2UgZjgxYmUyN2Y2
Yzk5MTFkNCBdLS0tDQoNCkhhcyBhbnlib2R5IGFueSBjbHVlIHdoYXQgbWF5IGJlIGdvaW5nIG9u
PyBJZiB5b3UgbmVlZCBhbnkgbW9yZQ0KaW5mb3JtYXRpb24gZG8gbGV0IG1lIGtub3cuDQoNClRo
YW5rcyENCg0KQ2hlZXJzDQoNCk1hcmNlbA0K
