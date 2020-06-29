Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC1020E8EA
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 01:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgF2Wtl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 18:49:41 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:57638 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgF2Wtk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 18:49:40 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efa70000000>; Tue, 30 Jun 2020 06:49:36 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 15:49:36 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 29 Jun 2020 15:49:36 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 22:49:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 29 Jun 2020 22:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+W3L2aQLF/+gCBvY1dsNw52GYDx6mK5EMQDDPalXMvf2YuXggytZoihXyhWyNGduiCq5HVpP1wSdFBbJleFLua6cMLMElMv6XJtmNWT+7I6Zxcn7bmfqoC4WUcojJVde2wVPLZLIt2IkuwMHopAtn9QFnxgQm7ZNTZEmaOy+4Fe7Ald1pTH+K0PIsgVOWql5Eywj52TN01hFBCMYVRowtmdXxZ+g0Uz+6+77s3dLpdbaPS+bf259/N703gQkTTugqnbQmXp8x+WBsKxJf7eoSKiBiImhPDmMue/A/WYkwDJS4uHpfhseBu8+Yt1ydxN9oh1Fc9mHYhGiZGXslrmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMdq0jcxClCvw1XMup4Zj0QigQxmMhEszOOyvIDfYro=;
 b=YOWneq93OF6koeMCXg9A2pd3SJDAIa+oSurSWe1Zrow+iEOwwvmsisQmmzc03gzpxvLf87KnVvMnSTqdcPoFS2o5wwXYCYSNciL1jU28D5S9UEdyHOPerDiiUNOr+R1sWvtjqBFE7E2dES4efBWKOcc3jWmvSqDCz5AsBAWOlJl4CS9gnixFfbWz0BIYoTPEaR9bhtQ854xne83D+G2WgooMqY/rz1foIXVK2yBrQHHIZogxCsG1vWIz6Kv4wWTWThnvZB90JFY4sqqK6BVIhMnSSndZyzWuJs0b2MUSiID4hcROWJLBwsCiYk/gun7IOGbsud8gLjmfdbNR3cEv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BY5PR12MB3794.namprd12.prod.outlook.com (2603:10b6:a03:1aa::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Mon, 29 Jun
 2020 22:49:31 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2%2]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 22:49:31 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
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
        Bryan Huntsman <bhuntsman@nvidia.com>
Subject: RE: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Thread-Topic: [PATCH v7 1/3] iommu/arm-smmu: add NVIDIA implementation for
 dual ARM MMU-500 usage
Thread-Index: AQHWTb0G2UEMAqNHrkOgcRrhP8CA7qjwI2MAgAAPBoA=
Date:   Mon, 29 Jun 2020 22:49:31 +0000
Message-ID: <BYAPR12MB2822B08564C7BD7212DCCEFEB36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-2-vdumpa@nvidia.com>
 <20200629215124.GD27967@Asurada-Nvidia>
In-Reply-To: <20200629215124.GD27967@Asurada-Nvidia>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-06-29T22:49:29.8686239Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=a052f27e-78de-44b4-b458-4c70cf5aabda;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [71.202.129.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aabfaf4-ec45-4f73-ffb5-08d81c7eb01d
x-ms-traffictypediagnostic: BY5PR12MB3794:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3794AAB75EC6068C9A91930AB36E0@BY5PR12MB3794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xfZ5ge8rYKhSGk4l41in1luJgLOBSCKFrDIw20ZBo805lky0WMmoXsWZ1OJWbcFr+m3ZUEfruxsKDW8L3zL6nQlx5gWSdNOwlsi5YOQMiisGmQ3wqWd4BzXJZWcHFBiOdISsq4j7ZW+bY0zssQyl8OCYHBXyPCGvLr96fCTFzNWil9BxhA3ZW1tomucwej0+cyB1VASN7kqPzHgUDOw1cyj27YaQOaLmys379Ajx1gS848+epmQZxMe3bi4OwUtkYKxQjdNM2FtillTCWgwl73NtCWSWGO8TQDzxuchAQtgXtUdA715qgkvFzaTvv4Ro7XwfJxisyaMeKsGe/xkrBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(26005)(66556008)(66946007)(4326008)(6916009)(64756008)(54906003)(66446008)(186003)(86362001)(8936002)(8676002)(66476007)(76116006)(7696005)(316002)(4744005)(71200400001)(478600001)(83380400001)(9686003)(107886003)(52536014)(2906002)(33656002)(55016002)(6506007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: T29X3EMXOWZ9sj5Pazw/b8vd+Y3UCvd+YeP0VeAdhWHLTFpWziaDGeebDsycEod1zni1Rj8hpPo4a4xXaYxWIQcSpS9joKj5E+lawtVBfHgwPG/a3k0a98PHSJZ8fqwFyI1OZHiBlV9NrhgN4aNjPIacuVFwGhaxC3zV19EPWPw5NZH+JfZuMffyMxq9dB9LVGkOKxR1g42EnFxe8PNinEp98Fb/4S/80p+5nFZK2b5KmBgXt6tnFfT2x/7bXULamkBMyNlGOvSGLEgJssXyNqL2tMLD9W5dj5RCVZV6YIb1wM/6Fc2LM0s/x8zoNLyd9B5CQxQtN9aCBz1Txv71MIWy53nXTtILsMO87RpFYI7yvNEHWW6dOQo3n4h6rWkfQtFCOiQvN5opgyiFzKdSlLPLj9ZOgU3jIXDV1Bnoep+iB6nE8Za/fIEg7fV129QG3OUbb/SmFCjfO2t6B2IJA4OboMR+VOreX6PMc5CRUJA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aabfaf4-ec45-4f73-ffb5-08d81c7eb01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 22:49:31.8678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPqsMVJn3MmD1iDuXnOHh4vpaOxOVCgkiaa1TzuU709qq1EyQ/PlvQ8qJN6SvtxlkHqt3qBGhFXxyk27O6u+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3794
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593470976; bh=rMdq0jcxClCvw1XMup4Zj0QigQxmMhEszOOyvIDfYro=;
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
        b=Mfb92SXj7dRCu/0OuV9WJI1G1+Pfl/1uY7DMkS7Wd1vj2MO5GKQEX5zXhUo3YYaTm
         xgYxXu5THzvzUUQkD6UmaDT9Pls/jsVdXiIXS4Ybq3q+D3rlkNKqMHQFu/onX0iDV0
         3cI/c8lZENbQgJ7cIiA92AnXtqJtry7xynA1kxWxce0gqaBy7rQnbMhkzY9ImIzSrQ
         E0pTejRrgShEnKO9ITgt+wlGxKz2psgtCIJTxrcRuJgvZ5fPTGiTvFIFmmrzLXV2fw
         bkCtpKUPOIjld5YvTAnN14SoEIQfuvWcYYEty72v2DyC8bOQy820vWvtlddJfAiS7E
         Ai0PB4vNFesTw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>> +     if (!nvidia_smmu->bases[0])
>> +             nvidia_smmu->bases[0] =3D smmu->base;
>> +
>> +     return nvidia_smmu->bases[inst] + (page << smmu->pgshift); }

>Not critical -- just a nit: why not put the bases[0] in init()?

smmu->base is not available during nvidia_smmu_impl_init() call. It is set =
afterwards in arm-smmu.c.
It can't be avoided without changing the devm_ioremap() and impl_init() cal=
l order in arm-smmu.c.=20

-KR
