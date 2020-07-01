Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B06E2112C1
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Jul 2020 20:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732941AbgGAS3I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Jul 2020 14:29:08 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:23290 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731491AbgGAS3H (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Jul 2020 14:29:07 -0400
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.77]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efcd5f00000>; Thu, 02 Jul 2020 02:29:04 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Wed, 01 Jul 2020 11:29:04 -0700
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Wed, 01 Jul 2020 11:29:04 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 18:28:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 1 Jul 2020 18:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glucSAEgGXmN0OAailQjNnqxv1KUbwptN4HnxwMa0xTM5WS1wIO3+/fmurC24+ljwQFYVZAfqe2rJxvgGrTDAkDSM4FfeoV7kirH/jtrIpzPSbBC6aMTS8afuIH3Eiuxoj7But/I589cCWN5Gf53y3MdMH8tTtKZ3vSxPBoBBzDOANqSGmwAtHl5NbZEzdyLRYt/Wjhik5xtgAhHwT3uMjWtv6frE9OONcI0KL5DFyzjc07qRBMfpNflR6Z2YudffkSuoHniElMia8ZHb3XuRwbBpBTCBMudwXEGkMcVsjYwXwxMe58N6hQ/koFiU3ysJYrIHRNfByzlIICoBELezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xGmsIQyx378Ka0zvcKLlLY0LRBQ4IdRw2hONYcURCA=;
 b=Bx3HuD21fSVb2tUu9JszVzIgJgF30RYvMlLAnzN0ev7/Erg77Pg/augICmxsQplH/iq7tl2mnpy6qkKw6zvgprjGfre7j36Nk3qiQOb7FRmdMLemxcYB2zicerIOzrDXIZI68ZuLF6PSdmfU/KQUJQ8h7LkQ/dHglQGxigw7KVmiJcDol0mTV5OAMek1zF+sWYqbm3utpn6JIZ99WLWh6Q+qdjXSsjbe4snhwU3V3a2f0sz6Ci+JsNOQ0nWx7tfVKTeUNN3qRGpR+y+XVzTt3WknN1fuAESr58QnCOIoBy1z/1RjGyneD7IdhWhrkJm8R7cK4hQ/XSpqLtXf7UO4NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BYAPR12MB3575.namprd12.prod.outlook.com (2603:10b6:a03:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Wed, 1 Jul
 2020 18:28:56 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2%2]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 18:28:56 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        "Yu-Huan Hsu" <YHsu@nvidia.com>, Sachin Nikam <Snikam@nvidia.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Bryan Huntsman <bhuntsman@nvidia.com>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>
Subject: RE: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Thread-Topic: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Thread-Index: AQHWTnLtO+c1bLqxQk+6SvUQTirpX6jxFsYAgAH0qfA=
Date:   Wed, 1 Jul 2020 18:28:55 +0000
Message-ID: <BYAPR12MB28222D6ADEBA966AA27FA9ECB36C0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-3-vdumpa@nvidia.com>
 <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
In-Reply-To: <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-07-01T18:28:53.6229888Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=8bbb85db-f166-41aa-8425-8b40b3ee3ffb;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9573370-45a5-4d53-c854-08d81dec9d56
x-ms-traffictypediagnostic: BYAPR12MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB35750064366E0695F8794CA3B36C0@BYAPR12MB3575.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iTZDVxskHget1SgaE5X23IZKUimnGrGhZPrfDAvAj5tt5SXWVZhNsOzVGdC/zfUKR5xHbO2NRvICw7bf/HcWcnAKJH9iz904ezZQsAMGVqdEzSUt02uNMGsyvjes87drhokwYgyWOGtjrMIXTPdSGvQHEQLQ1r2f6roKlFk6q5+7GFR9T4nRaMHFihUnqpJavVWYQciOzU91KwuXQeclDI4mKtiwBD9c2BGI7Ueq0oaayZC4FljfAzfNvQP0iC7Pgrm7gxD++CWU0gTw9EvR6JhrT5Ewy34QXqmh8iD4thT3AMZgjBrwVTXiyixKLuC6lOTbeFy+nTQuB+OUN9K2Wg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(55016002)(8936002)(2906002)(76116006)(66556008)(66476007)(66446008)(64756008)(316002)(66946007)(33656002)(5660300002)(478600001)(52536014)(8676002)(6916009)(71200400001)(54906003)(26005)(6506007)(4744005)(86362001)(186003)(7696005)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: YWf9QKgcNw6MmNSvdD8He+OZuIoYmTND3ewJRknmGwemHJaGG3CVCM0W85/kIV0K/58sV6gsEKAZAT5xlQYJ7NL0drPCb3TP/wGR50vO6QjhNZRzdkDg3lpwPmTRlHKU7mh55VZFzp90w8FPZItJKBCVNuqmzNKpryLO9y61bYUiWlSRA9eTptvqWmWWNm7qVONTNPnLuei/U9lfJsuiOPMMjVUb+Ll80kMKJuONUOArPm5F3oBcMl8nDtGiOeJYmDZdELwqyR+PsQl7YauskEEfeST/rMI6g4Kq7D4l7sm0BldH8b5Bsw5qEPZbCCdIxeE1VeaYQNrlp5LBqC8qDZJ97QFXHErAmmtHcuRCDVAuThsovDdrgl+4p5jOpVyW85dhoUKz6KFNcr1GTqzSich8/YqGcfMOunmDKjcbPFTr23KAervi/cxSihWAsa5XOx8bxSdvAnbcR63ARfaBN4SOdh1NpsKuVvphx30qYeZEtWvY11J6LmMxkSFA83qq
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9573370-45a5-4d53-c854-08d81dec9d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 18:28:55.9974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8RBIFNLUTwMKs7Z/Anh7VK3XyOMeESR2c/wUbmXtMpe0/7Iueup+ciDE4zFX8MPJzqpLN/6xMfTR2uiklZgoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3575
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593628144; bh=0xGmsIQyx378Ka0zvcKLlLY0LRBQ4IdRw2hONYcURCA=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:x-forefront-antispam-report:
         x-ms-exchange-antispam-messagedata:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=EQ3H2l8OmiKEO/Q5trSPUQNo8vXgbwF8fK4AmsL0rXh9iURkOKqVtiVd6jPRi/yFU
         WT5Mm5gwddshIKpWz5oxnfXdVz60cRPTYtyIBLv8hzmJbvXCr/u8xDMtDtzgUBF0eD
         LvphJH4Ns7kzfQc2xu82YcnxOF7zrGpGOJMJYxjj27xiiMizo5oh6mPwBUjDuzHYMh
         +JJqeKufnSjiGMf4kVKH0UNFY8fKvSecI55bmNNzHoBPiZSXXOxVRqZ8GgAzoFA86r
         DXoSAZ/nyF6cWheGW4pbsq5eAN+vGkVo5y99UDetSjtWPrNvItOB0OQuE7eGhWYMCS
         mI6PtD/iGbVSA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IE5WSURJQSBTb0NzIHRoYXQgdXNlIG1vcmUgdGhhbiBv
bmUgImFybSxtbXUtNTAwIg0KPiBIbW0sIHRoZXJlIG11c3QgYmUgYSBiZXR0ZXIgd2F5IHRvIHdv
cmQgdGhhdCB0byBleHByZXNzIHRoYXQgaXQgb25seSBhcHBsaWVzIHRvIHRoZSBzZXRzIG9mIFNN
TVVzIHRoYXQgbXVzdCBiZSBwcm9ncmFtbWVkIGlkZW50aWNhbGx5LCBhbmQgbm90IGFueSBvdGhl
ciBpbmRlcGVuZGVudCBNTVUtNTAwcyB0aGF0IG1pZ2h0IGFsc28gaGFwcGVuIHRvIGJlIGluIHRo
ZSBzYW1lIFNvQy4NCg0KTGV0IG1lIHJld29yZCBpdCB0byAiTlZJRElBIFNvQ3MgdGhhdCBtdXN0
IHByb2dyYW0gbXVsdGlwbGUgTU1VLTUwMHMgaWRlbnRpY2FsbHkiLg0KDQo+PiArICAgICAgICBp
dGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAgLSBudmRpYSx0
ZWdyYTE5NC1zbW11DQo+PiArICAgICAgICAgIC0gY29uc3Q6IGFybSxtbXUtNTAwDQoNCj5JcyB0
aGUgZmFsbGJhY2sgY29tcGF0aWJsZSBhcHByb3ByaWF0ZSBoZXJlPyBJZiBzb2Z0d2FyZSB0cmVh
dHMgdGhpcyBhcyBhIHN0YW5kYXJkIE1NVS01MDAgaXQgd2lsbCBvbmx5IHByb2dyYW0gdGhlIGZp
cnN0IGluc3RhbmNlIChiZWNhdXNlIHRoZSBzZWNvbmQgaXNuJ3QgcHJlc2VudGVkIGFzIGEgc2Vw
YXJhdGUgTU1VLTUwMCkgLSBpcyB0aGVyZSBhbnkgd2F5IHRoYXQgaXNuJ3QgZ29pbmcgdG8gYmxv
dyB1cD8NCg0KV2hlbiBjb21wYXRpYmxlIGlzIHNldCB0byBib3RoIG52aWRpYSx0ZWdyYTE5NC1z
bW11IGFuZCBhcm0sbW11LTUwMCwgaW1wbGVtZW50YXRpb24gb3ZlcnJpZGUgZW5zdXJlIHRoYXQg
Ym90aCBpbnN0YW5jZXMgYXJlIHByb2dyYW1tZWQuIElzbid0IGl0PyBJIGFtIG5vdCBzdXJlIEkg
Zm9sbG93IHlvdXIgY29tbWVudCBmdWxseS4NCg0KLUtSDQoNCg==
