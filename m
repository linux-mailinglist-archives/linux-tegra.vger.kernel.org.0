Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E7920E952
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 01:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgF2X20 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 19:28:26 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17221 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgF2X2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 19:28:25 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efa78b70001>; Mon, 29 Jun 2020 16:26:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 16:28:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 29 Jun 2020 16:28:25 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 23:28:20 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.55) by
 HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 29 Jun 2020 23:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4L8zTql4pggqbSoyFP0NBMjSC1Gh9o+f/+fxbf1Grh0eUvz7qMTSiZEab0uujJ9LIcakyndPOHXfUz6C2b6wlUuBh+tEDsi59DxSr+sZAb0P20GwlM734FJA6ioyxkuQiUTwwFOBdKcWyoYyWlXyT7kYs19VYg9t/NfXUgcfX2E1JaaWbz20XQp9YdCiFEPWGPAPfvrVXbtgn8LnoGHpeG9d1ePl90nzb4mzDsXLqa5cDuaPhk29TldxIoHB/s6u20HXjOvyWdTssTw1G1CwDp5+NhuP0UVPYOcW4PM9r7Rpnk6kKkLFOlosayiIxGgFYkWNByaVMwUIyRQGgI3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3112PNbV2Ns5QnHX7+bYyFcWV9NgmH6lr+14Yz6oybk=;
 b=InifwBrBao/4JJGfOPCMSciDL+5W5bHPd7tSm0xltJTfh+FJeHkQ8ZOX42ffX0EJmKHX6HifRxhAG/D1BMmBXepHdYuAIP5HM0UkUINoPvmBT5MjXflExcSASTZtcrn82pQb9FOYGFGWU6VIi42eeXKJnWVzRu4hh+JWlCh04sqgLIrwlucX+OMlxysFq+FPHRE17wVYd9mGwV9ID+do06w+0q1IcmDwVo4uWPBrKH9ls/6QPLsZFgxU46QVPeRj4FWAXG5/sEH72LcqevE0zOOpd47BBOjCqNykOIPFu10B0uheF9MSHk9AWB4jivcr2TVqiGkmJjrUISM5czF6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2822.namprd12.prod.outlook.com (2603:10b6:a03:9a::17)
 by BY5PR12MB3873.namprd12.prod.outlook.com (2603:10b6:a03:1a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 23:28:19 +0000
Received: from BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2]) by BYAPR12MB2822.namprd12.prod.outlook.com
 ([fe80::70bd:803f:78b6:ebf2%2]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 23:28:19 +0000
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
Subject: RE: [PATCH v7 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Thread-Topic: [PATCH v7 3/3] iommu/arm-smmu: Add global/context fault
 implementation hooks
Thread-Index: AQHWTb0Ety8U6ibXVEuGXk08ybxc/KjwMJAAgAAIsbA=
Date:   Mon, 29 Jun 2020 23:28:19 +0000
Message-ID: <BYAPR12MB2822A3F6C11C5A8EFB2DEC48B36E0@BYAPR12MB2822.namprd12.prod.outlook.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
 <20200629022838.29628-4-vdumpa@nvidia.com>
 <20200629223833.GE27967@Asurada-Nvidia>
In-Reply-To: <20200629223833.GE27967@Asurada-Nvidia>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-06-29T23:28:15.7074015Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=03e49c95-ae8b-4e10-8bec-dba02f78e9b7;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [71.202.129.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bd460df-8887-4aa0-b232-08d81c841b79
x-ms-traffictypediagnostic: BY5PR12MB3873:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB387323597A7DFD46BA168EC0B36E0@BY5PR12MB3873.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2CoDy5duQta1AfqbnfX2q6EA0JXcOdNuycqwzQ3xglm0pCEdD7C3J6LsmFFu3Rn7hPvLLI0kk1HEhZqZLqFpUOF5+ExbuvDb+MtPtVsX2anXfxNOGCN2SoEecb0RtmMGlh3Ve7WSKIXZlo8IEAUSAdHYyM0+Zz4d19ufZD7/+xZgxYvgf633TcYtCWg0GyRT7IgVfa5HO1bY9c0xv/8D8gGosvj+gPypwENEzKnoOM2aa9hlfD/web/hOQSQie+A4EMzzdf0kzlLnba8G8UTEKwdYjJ5y1UMbxhynXj55G8rXzTHTL1tX4ZAJluvH9SkMSp3/w8mMtlDFcJjgLZMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2822.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(66556008)(64756008)(66446008)(66476007)(83380400001)(66946007)(76116006)(86362001)(316002)(4744005)(55016002)(5660300002)(107886003)(9686003)(33656002)(4326008)(52536014)(54906003)(8676002)(186003)(6506007)(26005)(2906002)(7696005)(8936002)(71200400001)(6916009)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: rJSOdex6P9wTREbjm6dOMiDkLc5KKk0NvaQ+47iOrVzSrpTiyAvJHkAC50mm2MLNmCEyDkNXaEpVO0FAC82eRCoTsQbjEmZdnbubcntFw0wkxowo3ZYsWaR9rIFePcsRe3iH/+FpcGIQ7O7UVFaLsrb2MNddPswxXYiwkgHq4TGgZsfhKJMVfxp92inOXCr9HLF0NVwS7uj+neoPsHi04bJqAuentgq4ge9FXKyTAKMTc5FYhSrZXMmjjoPqDue0gr5e7bYASUkGBXQDPhGzjayh5PKZGwx2FDoNwmxr7UiiZoqGiqBg2ZlGaK7O5QiB8WfPDVCAiEn5xKkO9NnSeOpVAL96guMiyqec4GTn/3ctGvywG3QjH+ymJ8WQVFgOWpMyneiskMmKCE2JvrN8LKKE2QJrdVYyrPKNabsEIXxMKw54VXe3manxTTtBjEwaD0YSpCoxO5vEz8C6j/2tc3mfBkYK+3xvUJIBk+/PNOM=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2822.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd460df-8887-4aa0-b232-08d81c841b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 23:28:19.4256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEXCGHSxP4WjOvCC1DUaIC991LEcRTCILxDtCA8e6VqVIXbNhyxFRhcog7fT7rglCCUYxU4GLWSqheadojn3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3873
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593473207; bh=3112PNbV2Ns5QnHX7+bYyFcWV9NgmH6lr+14Yz6oybk=;
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
        b=NEuy3BMvobD6ZNW3AeJG9atFlC778SvJ/EWIjYoyVRBVI1GxAWKe69zugsLQJn86A
         fc0T3le/kit9jy7CAF/5ncxqI8WvoKyTO5cU2pmBaR/j2MAPeNywkulZooPHboVKUe
         nOq9yhkOyAEi5avdyeKErNcUIE4Wkq657rSOmTEsJNNvlSelPtc3fAby4id+FQJaIM
         9UN6nzf6Zvq0EKnlLsxY/yu+yWuZHoYzExOuCgjjpe/pChxl5pzF822523B/QkoDgB
         5NPmBvhcff5kX1sbREsm3ieWiyspxOFF8rsgiS3GQdRL9W3w/m1Na+gWrWmFJ57De2
         0pIR7Q5a7jzWQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>> +static irqreturn_t nvidia_smmu_context_fault_bank(int irq,

>> +     void __iomem *cb_base =3D nvidia_smmu_page(smmu, inst,=20
>> + smmu->numpage + idx);
[...]
>> +     fsr =3D arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
[...]
>> +     writel_relaxed(fsr, cb_base + ARM_SMMU_CB_FSR);

>It reads FSR of the default inst (1st), but clears the FSR of correspondin=
g inst -- just want to make sure that this is okay and intended.

FSR should be read from corresponding inst. Not from instance 0.=20
Let me post updated patch.

-KR
