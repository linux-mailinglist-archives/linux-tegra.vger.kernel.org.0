Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8278120A8A5
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 01:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407719AbgFYXNb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 19:13:31 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6646 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407700AbgFYXNa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 19:13:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef52f8d0000>; Thu, 25 Jun 2020 16:13:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 25 Jun 2020 16:13:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 16:13:30 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 23:13:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 25 Jun 2020 23:13:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKVN0JXqA9LmcvxzlB/rgxMmHZFfIuFDMDrTO8T4zdHffPRS1bJyhB7sbdDdl101bHpWpHUkna2u0NwnRKOUC8yGZz6M0GQnLMR6NkBY/GoxECpGfLswU0GRc3wHXIDtBU2CbjV0EJxlHB4b+uCtNJFR3htzJGo1wrvQOCiRaV/FH7yhtX75fBCMjy3IJtcPf3Ki+w2viMSMqHGjD4yWDwz25nALp85L+2bHCz0hXcjM+0412KrU3l5NCdCNHEqXEXJTAT1LyePemIHUze3pmA7ZUSOM7q2FHzmoLnTiJ1VK/AHFyz0V6rYi+p8LcmxCxrB31PdeiN+rAhlO/ohz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXr0IHT5rfZ8A7MBA7j/Q5vR7/xdmEVEkrWGT0ocueo=;
 b=LtVzy4ZzbLrFwX0J93GG4EaQ2NICYkvjh3dMuZWn94FJl8ENqkgzHPHIQPuUWrX3Vrc46lwJR34vViGUDA1haWMmoOHlZ4Z1yxxxylPxm5fikiVw+bbSPnNf6DBZeQRsV2fn09YZTbQr8HhjkE8Gai0Q1z1E0zlQVgrD5QdtmZW6kY0QHVnQl+4QsU8fI5HZnooD+e69ydBxfUWbmvCgse2QD+pG7tkOb1V6gF8eI6Hd0P1BcGHe0S2K0+QO/k//C8ckFwdMhek9avv9KOEzeKcZ5g71bgRPCDC32iP35zpIrMoeWoJgY+va/4UXs3L8TNgVH2/jHY1ss8eE9mgm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BYAPR12MB3509.namprd12.prod.outlook.com (2603:10b6:a03:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Thu, 25 Jun
 2020 23:13:25 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2%2]) with mapi id 15.20.3109.026; Thu, 25 Jun 2020
 23:13:25 +0000
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
Subject: RE: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for dual
 ARM MMU-500 usage
Thread-Topic: [PATCH v6 1/4] iommu/arm-smmu: add NVIDIA implementation for
 dual ARM MMU-500 usage
Thread-Index: AQHWOsoZSFzbl7gVUU+vg5iuyN0v3KjmHMOAgAP6GSA=
Date:   Thu, 25 Jun 2020 23:13:24 +0000
Message-ID: <BYAPR12MB2822B1D5791811EDAF35C5B2B3920@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
 <20200604234414.21912-2-vdumpa@nvidia.com> <20200623102927.GD4098287@ulmo>
In-Reply-To: <20200623102927.GD4098287@ulmo>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-06-25T23:13:22.0033996Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=d1234e87-784d-42bf-959f-2cb9fd45bd38;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 612f2b2e-8714-4ede-cb2f-08d8195d5cbc
x-ms-traffictypediagnostic: BYAPR12MB3509:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB350972FE4717CE708D826045B3920@BYAPR12MB3509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8MoDDszkVyKsnx1ksdg1/yr6T+9SvmsFfZp2H79LJqvHGJtcVyMKCflT29MnKEDn9wt8nx1H0o0Y2vmHxdKgdbG+vWqsaW571DotdCuMFpOjX2sj3wyBPLXJIj/gC2jCRXe7N5cTVRzqPIXbcjz51I9iSr7a7QyBxAC0UNTmUQZS/t0pwoj7Mn3x7Ub+GcP9XQFXp/JcLiBDmNs0cjLBh/6bVNZPraHZG6mlOIxHZYUk7RTDhjusG4pKexDbwIBeg0z2AgqT6VzDD/E43B2k9Qner4Zl52uZvIJ0TfQua/GxRJtBbvgZWhXNfP51NSgTsnzcotXx8yV8mjB5YIaUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(346002)(396003)(39860400002)(8936002)(54906003)(66446008)(4326008)(5660300002)(64756008)(76116006)(26005)(478600001)(6506007)(66476007)(2906002)(71200400001)(186003)(66556008)(66946007)(83380400001)(316002)(33656002)(7696005)(107886003)(9686003)(55016002)(52536014)(6916009)(8676002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cx7M6D/hPRAPzH2p6iiO2RrNKpzI8MrsO9Apm8JwnPaFqDhDjdowqm2PWm5NhccZVrSDEiM8vYKNnyN+mhwPNXndv4aDVmetWub1Jw44LiYoxH7vqoA31QEZnGelL9MGLeTskGUPe4YVj6cEOp6Nnihfd5I4dU26np9Pq8pJpjRRnwHXeF2QPLKXwM7A2xOTTqqouMNHiMe/G7CB0Bh4YwLw+E/psRkbpfxvledQSVS53ZsoF6KHVejZBwVnlOHoikxkAW8E+2Z1RsGwZPmAVWOgg06M2WLeK5dnbMP+CoieTL1z9uF6MqFNDqnXD5a+oeBxYb+C5aSV0xk+U92FLsw3iqi/upo4EvMWyY7kN9XsU3uRcG+oiKEpWQNnlEslrxuvCg4Jnb4GfHGnOFPkdJVBEF4k/hfplsA2KzIOhCVjgYN5i4dRMuVMBk9ySYD7kkIUvAjwgXN3k8NOiu017fzlizHBO/yrCAxpx4T13Hgq0SjNSqwAqUELaUcAeiGX
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612f2b2e-8714-4ede-cb2f-08d8195d5cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 23:13:25.0046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBWxRh5OtlClLI8n5seBIefnYEWswqTPdfCyK+JW74NJjccuZJ/J/T+FVaXrT7xjMqz2laOrSjeWlocjlSvgug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3509
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593126798; bh=SXr0IHT5rfZ8A7MBA7j/Q5vR7/xdmEVEkrWGT0ocueo=;
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
        b=fFQJx0L9LVajnSRDPZ3VLLZ7eS/rzw/3gNmqv5DwgGww9Raq8fHHn0HtV26uuFRNy
         Ww+d2bxibOutbAgmY7NaJJ8UGrlVIVpWhrch5t7b4G+ix1IBNOYuIBmzh0mpLORNKm
         1IVDl2j8xxoZKxPAbJIkzMu8r8xZ2XoRgA8NjGkSxsQE+7ibouxUqJRxqgaHWgCLtC
         74ovanIJe2MLI0MD27dE9kx6oZniKzNkrjGB6UZkcmJzBjPuVbLQapP8CcLp6m2KVW
         blFafXkg/OhF5sS15PodY5wdy+mvQPQl8gxXXkctWHBS+RrTCLj8k+g3GeyeqU27x7
         eT5qivaSpzcaw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>Should NVIDIA_TEGRA194_SMMU be a separate value for smmu->model, perhaps? =
That way we avoid this somewhat odd check here.

NVIDIA haven't made any changes to arm,mmu-500. It is only used in differen=
t topology.  New model would be mis-leading here.
As suggested by Robin, It can just be moved to end of function.

>> diff --git a/drivers/iommu/arm-smmu-nvidia.c=20
>> b/drivers/iommu/arm-smmu-nvidia.c
>I wonder if it would be better to name this arm-smmu-tegra.c to make it cl=
earer that this is for a Tegra chip. We do have regular expressions in MAIN=
TAINERS that catch anything with "tegra" in it to make this easier.
>Also, the nsmmu_ prefix looks somewhat odd here. You already use struct nv=
idia_smmu as the name of the structure, so why not be consistent and contin=
ue to use nvidia_smmu_ as the prefix for function names?
>Or perhaps even use tegra_smmu_ as the prefix to match the filename change=
 I suggested earlier.

Prefix can be updated to nvidia_smmu as we seem to be okay for now to keep =
file name as arm-smmu-nvidia.c after the vendor name. =20

>> +#define TLB_LOOP_TIMEOUT		1000000	/* 1s! */
>USEC_PER_SEC?

It is not meant for a conversion. Reused Timeout variable from arm-smmu.c f=
or tlb_sync implementation.  Can rename it to TLB_LOOP_TIMEOUT_IN_US.


>> +	}
>> +	dev_err_ratelimited(smmu->dev,
>> +			    "TLB sync timed out -- SMMU may be deadlocked\n");
>Same here.
>Also, is there anything we can do when this happens?

This is never expected to happen on Silicon. This code and message is reuse=
d from arm-smmu.c.


>> +#define nsmmu_page(smmu, inst, page) \
>> +	(((inst) ? to_nvidia_smmu(smmu)->bases[(inst)] : smmu->base) + \
>> +	((page) << smmu->pgshift))

>Can we simply define to_nvidia_smmu(smmu)->bases[0] =3D smmu->base in nvid=
ia_smmu_impl_init()? Then this would become just:
>	to_nvidia_smmu(smmu)->bases[inst] + ((page) << (smmu)->pgshift)
> +
>Maybe add this here to simplify the nsmmu_page() macro above:
>	nsmmu->bases[0] =3D smmu->base;

This preferred to avoid the check in nsmmu_page(). But, smmu->base is not y=
et populated when nvidia_smmu_impl_init() is called. =20
Let me look at the alternative place to set it.

-KR
