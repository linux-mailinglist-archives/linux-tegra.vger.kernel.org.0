Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5D83C234A
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Jul 2021 14:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhGIMLP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Jul 2021 08:11:15 -0400
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:18528
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230209AbhGIMLO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 9 Jul 2021 08:11:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdrjA/S4YnPivEJuTgmRlFmcb7TxrguJWvZlsyOMkFtjaDBKG3h30bR8qLLvgJ4d7lcDNhHeZkLP72xEdOYSIKrVB6kw+WZPX61U38x0hEc9geeoBzR6Nxa8QhqdkbSn3qrWgd6Uis2fdy3rMs3XLoV8wrsLG2LLSiXiSJ7daJd7F3w4Y79cJL8kEu2CkWiC1HjR3HHLtTaHOWIAab4Qxx8MayD+g8fImuPvmkWfULAryPF/pGoeBSux3G7+BTzJE5KedtlDM8OUldsw+3ZZhhaj6LudnOFAfXXvn1oADmRmwwqW46q8xaMwFmC1X9z7b5sWAtA+0S3uTSiJG/Aq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nfH7ZJtOZ5XU0/xmrGM+WQ+v7fFrv+n9ux4cU3QLwA=;
 b=kkQgnq9AE3ClUEWIoMUQTViGhonk8ZIlKWievFo3262ZsBO7R1zcsAxXtozjhyi8b/IHFqCoZMLFCWbnsBpyLy+4JHeyXCaj856uadPIV52rlqaZ+UC6Qfo/9wmdz9DW4qLxh/GoCdziUPqYqr6eUwEcZNvDcbtrUcXJuB5xsqrEPfbNZaQgrVjgE2kv6i2hebstQqwmvTMsQS2E6inoAPjCTiEAxHkETFisGgS0q7T+O8U8Hv5Z3XQB5a2APbqilp37GdKl+71iADBJxQiA1KpibmM0OE2h4hk+7VmYnpwNWIINmZpU1i9BjzhNXoRTfu+AXh4XYyvBaAIZOpG7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nfH7ZJtOZ5XU0/xmrGM+WQ+v7fFrv+n9ux4cU3QLwA=;
 b=cCxu4yn2iV1Oi3LFwaccB9pOX/GsDBgbqTragz23ujr5eBRNAl8TDeNuZP8cdD70gJW9o+BoeAKKqLJHD49lWQYY7mBPgFUMP/yZjYmjaYyepHW904icpk91L1i97a9/omGQZYfFOy7TFt8UcdDXQ3OLzABJlWbHLME9L/aipIc5/5G0XzC0iatHFeEKlgIPavYuXr+qtK0ELKO+7TpuZaQHErh3P+kdw/WoIZTA+Y9El044/GB2cwew4Ymht49ey6YjfGfh1RQpi/iAR/TgGydXGSMkmK380Gmf/RbhbEj4pCgJgeN2hq/OGhXCiO6lPC8E0cLsXmNnGh8SfEk7CQ==
Received: from MW4PR04CA0159.namprd04.prod.outlook.com (2603:10b6:303:85::14)
 by MN2PR12MB3710.namprd12.prod.outlook.com (2603:10b6:208:16d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Fri, 9 Jul
 2021 12:08:29 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::b9) by MW4PR04CA0159.outlook.office365.com
 (2603:10b6:303:85::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 12:08:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 12:08:29 +0000
Received: from [10.26.49.10] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 12:08:28 +0000
Subject: Re: [PATCH] arm64: tegra: Enable audio IOMMU support on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210709120812.2529034-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <dd36fb32-7131-b898-4e74-433895c92b35@nvidia.com>
Date:   Fri, 9 Jul 2021 13:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120812.2529034-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5efbdef9-d396-4281-53c5-08d942d243b5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3710:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3710F7FFA7B66A32011899E2D9189@MN2PR12MB3710.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ma5XydGJcXMTOWw3SsNB2Btaki/ej2zNxO4dMVYaKfDGdh5sDx/zKQH1ZCoZj5hkVjXdOcCWPMVl0i9kW+hXhE/6sGvgU/lXyj4rnZWF6Oz9kMwKhd5V7MVFb+fSh/tMAGDpWydQ8weJIE9G9OnXDe7P9l/DBy6dTZwBnVUY1WUZmsRaQo8o0MJH2ttLB6fVuWSy89qWGpzaQ8uFZrIvSVRX/jvbdfsR5zbxeAOa4apZa+ZOzxdKmhoTcdPPIIcuM8RcK4NYUNfVFVFjo6Yj/X/As9MHQtXPXrIvif5l42jQ00crcttzD/bfEoWR202YPkqP5gysy9gTF3i67ES0dq2EkbcyOLAyFFnJvBvTsXmr12EI88ZFSHsCRgUvDzdAWT8VX3GOtyg4Ia/5k/ZeFjcj3ycEnxNNCl2mTLNegELqkJ4BF+MdIkkfwYEeu6AWKu4adoAlhuR/lTh+9aA+ZKG1ZaaI4twAmdp1IG+5KeGHsZI2sRMkoDHrgIyZH/lIRFMvo/bIVxKz3LDrqbP3oiQ4yAqIwsBiKjVK7QlVEJKXPiKdfM6rEd4p6YH0/yH0kvStkfuWIZ8Ez1pkPxkjs8tF+KTiWd5bC7/Tflw8dz1SstSgOE8Dc/qawZfqSK5F1YN4JcbH1K+ORat20147ssFs8Zu7OSehBkbe3O/5B6BkpjlPKtV8FAgmp8CKjsvoe6Q0wlqgBG7RM6NNX/j9MzxZdZftEMcMxVCppLrHKOJbRUd5Tfxo4SQmHXD7DJfUsgzDyElyOvmGfGG35EUEfA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(336012)(26005)(8676002)(4326008)(36756003)(47076005)(83380400001)(426003)(2616005)(34070700002)(31696002)(356005)(186003)(36860700001)(2906002)(8936002)(5660300002)(316002)(16526019)(7636003)(54906003)(53546011)(86362001)(16576012)(36906005)(82740400003)(478600001)(6916009)(70586007)(31686004)(70206006)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 12:08:29.5158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efbdef9-d396-4281-53c5-08d942d243b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3710
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 09/07/2021 13:08, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add iommus and interconnects properties to the sound device tree node on
> Tegra194. This ensures that the correct SID is used for translation of
> physical to I/O virtual addresses and that the path to system memory is
> properly described, which in turn can impact the range of memory that
> the device can address.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index a6e61d899a27..076d5efc4c3d 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -2477,6 +2477,11 @@ sound {
>  		 * for 8x and 11.025x sample rate streams.
>  		 */
>  		assigned-clock-rates = <258000000>;
> +
> +		interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
> +				<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
> +		interconnect-names = "dma-mem", "write";
> +		iommus = <&smmu TEGRA194_SID_APE>;
>  	};
>  
>  	tcu: tcu {
> 


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
