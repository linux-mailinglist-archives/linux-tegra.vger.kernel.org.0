Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F23220A83F
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 00:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404360AbgFYWc3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 18:32:29 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13767 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404060AbgFYWc2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 18:32:28 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef525cd0000>; Thu, 25 Jun 2020 15:31:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 25 Jun 2020 15:32:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 25 Jun 2020 15:32:28 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 22:32:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 25 Jun 2020 22:32:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJgRWP/8UBXqYktyBIz0hQENGAMToAU1XyRKiFztCN/YITF3Jn00jDss6cgACdbTtqArsXWpGZLS4RRN3VrDg6QX9WF38baAZ/Dud1Nf9WDVduLoeU5ZoX8zWdmwTY1tja8GvJ4k6gpTPECWINga07ySNenQPH254hxmQoZt60ZJXqEaZq0bs/6JOPLAU0zKfMLxLqZLjZhbbjIC9xHsxQtPplVaH2r82SM+bblmmYw67s+zOEVKWDhFEOvZJfufKFgr/PF63HdIgCHxq7IMvA0UWtPZgGL0ZwzBuEA6/SfMTtOrI4ngIqCMeEsPrJwSVbjFa5wvuOxg08wVnR9WpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBT4oXmAgqHlR4wtELUFVV/DkDUb7NSZEI3m+QnPTaU=;
 b=JKtLKKxOeDQ/OoJMjLvcZXNirE5+slhWnjBr6rMpDVsIcfqd7ALuxUu98s6h/xG5BwdLt72cLNyPeyV7ltldsl+slUr3EfT+GJegCALCcCZdwp2xVCdfOIk0JFU6BxyUjDJvhNrAc/YFEyCd6wekV+MFdfNkSqEONXYG34EaG/bevxb2x6Y86/iiB1eHx/ZzP9/Dkv3A5bmTHLklfQUy64PiXEaAWstZVxWiMBOh8loL0tHH1HZYaQMniPQLXu2aCKoKYNGeKt/EOqclbRTeDGCebZpODYkibTeo7mW+q6CDvlV458NA255l+ZqTU19CjwKNbpBBJAXK9TeelOKYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BYAPR12MB3126.namprd12.prod.outlook.com (2603:10b6:a03:df::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 22:32:25 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2%2]) with mapi id 15.20.3109.026; Thu, 25 Jun 2020
 22:32:25 +0000
From:   Krishna Reddy <vdumpa@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Sachin Nikam <Snikam@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Bryan Huntsman <bhuntsman@nvidia.com>,
        "will@kernel.org" <will@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Yu-Huan Hsu <YHsu@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: RE: [PATCH v6 2/4] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Thread-Topic: [PATCH v6 2/4] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Thread-Index: AQHWOsoatXeRYg22cUKdLG2g64TOnKjl/cCAgAQNp9A=
Date:   Thu, 25 Jun 2020 22:32:25 +0000
Message-ID: <BYAPR12MB28227065EDF92A406A770ECBB3920@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-3-vdumpa@nvidia.com> <20200623083827.GC4098287@ulmo>
In-Reply-To: <20200623083827.GC4098287@ulmo>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-06-25T22:32:21.5028718Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=65d84281-7db6-49a0-bed5-2431a618c7a1;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 346089c7-a281-4665-9351-08d81957a298
x-ms-traffictypediagnostic: BYAPR12MB3126:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3126F22C7BB7C1E1B17EEAC3B3920@BYAPR12MB3126.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+/yCn9iEGOzX9xCfzUbcnNDckJEC9nQ4iQIcmkoWCT1H6BxSy7yH1UpA2n+EdT11qfYBvV/Rj9mR68GX2fyDblAzdCUxzvFO87B+iGO9pxqPW9M6gInIg5hRwK0xW0iFfYgl2M0lRLTS2afr5e/ZbfuROmoZzbvmt3gw9n4xYQkbgHhDjoOlVrvp/OQG49cmRvOZi4KPwJQuik+DkxHuDGAvDZHwX7x1u1cMfPINtwLvqrBoK8HaG+sWu6Cb8ClP+hALsL3dOwczVYoSwPhEaQVCSdIqvJ/J3vOv0TM1jNs23BVVGXeRvBxlqcpzUkVUhR6o/HZoJebcI3UJCjq7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(366004)(396003)(376002)(136003)(33656002)(6506007)(107886003)(316002)(54906003)(26005)(71200400001)(478600001)(7696005)(558084003)(2906002)(186003)(4326008)(52536014)(55016002)(9686003)(86362001)(6916009)(76116006)(66556008)(8936002)(66446008)(66476007)(64756008)(5660300002)(8676002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +k7+tlB9+4EtuKOjx0wjupqMHa3NLwfZhesuo63F6qzQGOyhVA/29dD3l8JpiIsNIIgxZ4APgpMRMdc5lq3dzONjgcTWeh+LgM2Iwyw+n7mzU1X+VzawLVxMxnG6LgCYZ/PoVAby2kJv4PIK0fNrq+Ljy+zerPwFUqqjCKfoF8TgEVmjERx5yygTIv4dLk41biEBA971dZXWrHoS0HPTspqpVbyaSjYGqzeTYuPjOXfBnsSarwf3ZDgtaQ3hMNPYXFVQRh6w+76eoqOWBF28sOxvDFWyo/iOCOHxH6p/jfsjZyzkcbCjFxVVAT8sdzPnLlDPkXSwD2r1gWEuTfxhDO3NZxF5mpOeqVFC+G8+eOJEeZWIJ18slDSGNgO9B08FODP/ooja0F+kWBQ60KnXdLM+fmsqVFrGWzzXnjHYedQadRnrBx7F3MV7bMcGH3Khz0DfV9lrhx7GfAtpIlawCUo0OvF15nJs2juV6thtsVgcsKonOa/WM/ooOh8VgBWO
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346089c7-a281-4665-9351-08d81957a298
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 22:32:25.1533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9lgTtMK6X74OzojGX8XIRz9jz+M8VHmDXOEWXwrDxgbY9mpenI/LGMpyx0fypTyflR3+lHQ44RPMbKAnjLEnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3126
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593124301; bh=BBT4oXmAgqHlR4wtELUFVV/DkDUb7NSZEI3m+QnPTaU=;
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
        b=oHDmyDW8I7GfYIVeLKTsopRdzkvSYz6oOggAIPERlGKHSPBiLBDD1Ad09SACrE4vz
         iigJOH21YDP1hRIgA+WNIgJscg7ElLCPQ6OabVJ7e32plz7oDANSLkmoGyBrkdTBHy
         k3lOIzr7lvHak17aENL3bU0qM4jzbAquhWLF8UWB5BgY3tME7Y0fa2T45hRlJxaKda
         zFkuXoqGqrLT/hp42DMFmZ1vR0MRUiEZtnoXvIZjlDvMdnipVFuyikox3uOuLtfVxl
         LZnpKNXa9h6fXsD0WAhekXX9K4McuBhkWZrCqq1HmsJU907XhchgCPpOIB3+8frZXf
         8T+yzyDpUtdPw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>> +              - nvdia,tegra194-smmu-500
>The -500 suffix here seems a bit redundant since there's no other type of =
SMMU in Tegra194, correct?

Yeah, there is only one type of SMMU supported in T194. It was added to be =
synonymous with mmu-500.  Can be removed.

-KR
