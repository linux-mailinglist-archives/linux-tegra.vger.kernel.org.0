Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68B920EDE2
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 07:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgF3Fyx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 01:54:53 -0400
Received: from nat-hk.nvidia.com ([203.18.50.4]:61324 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgF3Fyw (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 01:54:52 -0400
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efad3a90000>; Tue, 30 Jun 2020 13:54:49 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
  by hkpgpgate102.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 22:54:49 -0700
X-PGP-Universal: processed;
        by hkpgpgate102.nvidia.com on Mon, 29 Jun 2020 22:54:49 -0700
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 05:54:47 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 30 Jun 2020 05:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7c6FOkVbxVkV2wJbmtDrNfLdmRKrgHJHorEsuROkugmlaHDTN9NlmWn/5uYMt4oceIH4J2hBWncziMWthWSwWjNYVV/Q84DAaHaPoNVC0U+oFoO2KC4G84Ma8S3Au6CsQqxh4CyWVX23HmQA/4hiXZSuSEYFb+S9zHrDZHmkknlNBRb96qAM0HqDBa46aU334NceKcMTg3ZcEZRtfSKK7IyLKqNzFoxByeYpfgShg/htI+9PC0X7Ec1HwfEAqorXc0PNg8OG75fX5N9/efvivLpgFWbaQMfVvVeDQONuZ9swOIOo+utnJKf+hhF+mt5dXrziPT7P2EAKbp+3dHIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+nYYhidqPppFAQ7D8oopRQoLHOd+ny2kwKFIIHF+Qw=;
 b=QVIx4HXPx512JjEtdTIMIED4+kHz1K714T+JiEM/Gm70dxXuxRJSWincZe9/6kTf55Sv2vzqeq8qPeRIQ3R+aDKC0rrCd6rsk5La+8EfliI0ryPsuKBNPE+sker+0Lb/H5msnu4EqIH7qcWdWwg4K6GoolHP/7K7xhWJTN53uNyXX9nIy11nBJh9rwMs7SHAeEXRWdt8e0N7BrJie30jKaQ99zjVYdUkOskoHv6RifQERrijmfTEXZfLHS2iyicDqnWH1EAVix16DZa9mtpLHfguSTrT1CJ3j0ZMWg9TQAyAtlYu8xyN5KlBMO824usayBuxCjBUlF9bsUMvmgXfpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from CY4PR12MB1688.namprd12.prod.outlook.com (2603:10b6:910:8::15)
 by CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Tue, 30 Jun
 2020 05:54:45 +0000
Received: from CY4PR12MB1688.namprd12.prod.outlook.com
 ([fe80::a976:61a8:970b:d874]) by CY4PR12MB1688.namprd12.prod.outlook.com
 ([fe80::a976:61a8:970b:d874%11]) with mapi id 15.20.3131.028; Tue, 30 Jun
 2020 05:54:45 +0000
From:   Pritesh Raithatha <praithatha@nvidia.com>
To:     Krishna Reddy <vdumpa@nvidia.com>
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
        Timo Alho <talho@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Bryan Huntsman <bhuntsman@nvidia.com>,
        "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>
Subject: RE: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Thread-Topic: [PATCH v8 1/3] iommu/arm-smmu: add NVIDIA implementation for
 dual ARM MMU-500 usage
Thread-Index: AQHWTnLsU6VMf9PQoUKznHa4uGpI5ajwqM8Q
Date:   Tue, 30 Jun 2020 05:54:44 +0000
Message-ID: <CY4PR12MB168833FC05B6A9F3CCD72210A26F0@CY4PR12MB1688.namprd12.prod.outlook.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-2-vdumpa@nvidia.com>
In-Reply-To: <20200630001051.12350-2-vdumpa@nvidia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=PRAITHATHA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-06-30T05:54:42.5211466Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=4b921caa-18df-4b3e-b74e-f9e7e2d9c197;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [202.164.25.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99178a54-3213-402b-daf5-08d81cba1733
x-ms-traffictypediagnostic: CY4PR1201MB0072:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00727B905139EF72946E5ED2A26F0@CY4PR1201MB0072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VroZ2dOd9kBbN1LO4fQJzCrqJsykIk6i7Vm/2t+KECkR4Gz7iExCq0yrNFz86ClTck59Zcgs8vD0t8ulPXmD/QTZCBROTkZm8vw3NRLWXGrsKWR7mqz/HgB5SA/21DAMNzuCXvq/RqczX6uzaH0pL2PCjb7MkOpWotkK6Bg6O0azCkZMSwXkBZr0wyRwzy3XYQa27w6VEuQ37IAZ9Guw+jSlJ1w6O63IpFiErZLaZhhNmW5fX6zJYqiaWx8w1ck8MLklGThz5Y4Klu0f2hRgasZc8kut9pPKYvgqy9gyHrLL5k4nIF/55npg51a6co8nSYjMWakL0KmEyBRGychaCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1688.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(2906002)(71200400001)(64756008)(66556008)(66476007)(6862004)(76116006)(66946007)(8936002)(66446008)(558084003)(8676002)(4326008)(7696005)(186003)(6506007)(26005)(54906003)(316002)(478600001)(6636002)(52536014)(5660300002)(83380400001)(33656002)(55016002)(9686003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hQH/V1RrnUBNo5rEKj86o3AFTPT0ijuRAy6ie1G51h1ujSRdm5no8praeBf1JnZnq/qdhs+wCD+IKvT8ZMe3M1KLpJToHxTda7VamZ2xXvIPp0skh3AfVST/9SPrTj/PJuFgvP1xDxOTyPZ6URP2ZlyWPDmU0+pfgYHwTonZq7syPjoBd3b++qe9+Cnz+tDFA/u1i6e7H+00Ct3d6m9XpPfTR7Y6EvtkJaU4C3e+QaUXfuqyRaY82+HGs+oW25CBHZYZu9kY0y0yWTLU194JbeC1iit5iSG7Sj+LqVoqPVS7O8czI/xXZ76i644vGGeqrRm6cGP9XJsgU4TehRdc5FKucyJ3GlHkYc3LK8jNnDr6GCiAZ9omfAJv+NEY/D+UnRj75cAy63ZMVs2Go62UvaV0U+xRCmias876VFkRfDFG0FXjLVXsk3S7vk+hSVWSUDxGCKG6xtaM4SWl6+7hoGTkJpdqbyDG94DR/Z7O5R4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1688.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99178a54-3213-402b-daf5-08d81cba1733
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 05:54:44.9455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5A+qWsHQ0Gmzo4d2V2G2KdtSoWiZKrLDyzHgA7ZDsYCKA5MDMxefq5sswuWYYs7jzQxiBYikd9+tat0/BE3WIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593496489; bh=L+nYYhidqPppFAQ7D8oopRQoLHOd+ny2kwKFIIHF+Qw=;
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
        b=hpxwY3J3MRRKi2M9kYozgVrDyddkAYTzbfC+abRSKVJSduu1H5VlIhtVAsJPvRwY8
         u8VCj26OxYaIcPx89HPp8zWYAp7QaxyLz6NUNjp8aUDSbc0peKNie3tr1wT97W0aTH
         ctXPbl6g13beyrxE47I0nuKuE1P8JdILIoat/pmw0ibc1A6rWOwP824JbqXsAaULPs
         42M3aCV/IZxhAm9helWe4rW5a5LgBDIgTDVOoX8/nrgcQTnfn0sW3BhjV5KAL8NJb0
         HLKe42ily1DgtgbUPwhhTivnWkJ22AwTfsxwZrZFc+t5EaSvylDfnp00AYXVkIdQYQ
         uVjhRwCpxfT0Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> NVIDIA's Tegra194 SoC uses two ARM MMU-500s together to interleave IOVA
> accesses across them.
> Add NVIDIA implementation for dual ARM MMU-500s and add new compatible
> string for Tegra194 SoC SMMU topology.
>=20
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>

Reviewed-by: Pritesh Raithatha <praithatha@nvidia.com>
