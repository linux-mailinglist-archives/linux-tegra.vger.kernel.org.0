Return-Path: <linux-tegra+bounces-34-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958E7FAE46
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Nov 2023 00:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCD98B211F2
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Nov 2023 23:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75812495EC;
	Mon, 27 Nov 2023 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dWpHsOmE"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300851B6;
	Mon, 27 Nov 2023 15:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYsIuH/7h/x4VqDhgaSDEgKLN53+4LA25fQriKi5QZj8zweiZGfWAEXmgyj1NTojctQzkZSgXi3SiQhrEUNkLHWxUBQbSlXwUW4mXgxnLtyL5Dg5qNjms29Wc7OcRtlfDsIKijUH0CMvY/GVB1m4DnAEuBxPBjaiSS0ZzBpyHKm+P6tgKH8VE8DjmWzMIMB2LlrgVVt/bANAYT4dPeElr8v7S4qzduvoIxTAosxyf4Qa5VZa05hxRxqV6cfaFZb+W09a1cRFJ6xpFgEHMucPgSrqdhZ+JESVyIL6lhMonVs35i5839rF8NtV0UvqGqh9ykc9xMYiQ/dRYdrfyX+6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toDNEojqCwYKaBezF4SPFk/3zXU7pcj1AfpWDCipQdE=;
 b=jp0h0Vb80R189Uwwm0gsGMAK9TEOhV4okYpryByx0UUsMM4DzyyGuAx5/37ICBMOYub8EJm1jSPt+/9N0kctjF8RFRPTFl/nsfMApEqO5vojMBGOhtC/EvgIs6stO7KEw0+RV0rnOEggIM8GeO+FNKKFJND5KCfmw3ivZDXKfV32x+zkEwZvPFWci7RjlrI8E53qBekoVnYZDiSPdDULJGmAG6FDW1P7LDRYmowjAIc3fleaZQuFULuh49K6pZ/YZvZXY6dbLcAsUGezIb6jHF5FZEZp/Xg1iwuoBHFZaDDNMuaLDPpE7bE0qaD43HI+IxTuJdCJua0hfU6jyoN7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toDNEojqCwYKaBezF4SPFk/3zXU7pcj1AfpWDCipQdE=;
 b=dWpHsOmEHX06LRt7xYTTwtKwNsvz3ae45mpstJI42zOMbZncDjdPbIDaeqyZuUyijce8y8gG0YuSHwrSjdCquufyoZbmWplBFbfU/BIn3Fte3RBWFRee6t6rNJIhwiV/niQTkuRPTDURO0HM5Th/5xm1mobUBs4F1q7QunR887PdUFMdXnTgKW6YHchhGrjOceJZTXX7gzt4qFe7ylhfz6NLTzcHKyiw3BwGTBAbaTS9x9rCsD1BfQNnA/ISlcMZxC6l/g7K0jeqTKVbsQczzrj1T1XwBkdWpsxbmq0es0sVGIbK/DOmCr1BhGMiCSg7fSnRtRjqHvcddXk6189Svg==
Received: from DM6PR02CA0047.namprd02.prod.outlook.com (2603:10b6:5:177::24)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 23:26:09 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:177:cafe::78) by DM6PR02CA0047.outlook.office365.com
 (2603:10b6:5:177::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Mon, 27 Nov 2023 23:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 23:26:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Nov
 2023 15:25:58 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Nov
 2023 15:25:58 -0800
Received: from jonathanh-vm-01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41 via Frontend
 Transport; Mon, 27 Nov 2023 15:25:58 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
	<linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
	<lkft-triage@lists.linaro.org>, <pavel@denx.de>, <jonathanh@nvidia.com>,
	<f.fainelli@gmail.com>, <sudipm.mukherjee@gmail.com>, <srw@sladewatkins.net>,
	<rwarsow@gmx.de>, <conor@kernel.org>, <allen.lkml@gmail.com>,
	<linux-tegra@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 4.14 00/53] 4.14.331-rc2 review
In-Reply-To: <20231125163059.878143365@linuxfoundation.org>
References: <20231125163059.878143365@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <73bf759c-1802-40b0-a85c-f7afd574640e@rnnvmail205.nvidia.com>
Date: Mon, 27 Nov 2023 15:25:58 -0800
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: d078ef3b-0de5-48e7-45ae-08dbefa03cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u0v4p7650EFWla0xuStpMofrOoS09e2ZVX2/FhcEM3ce5n+Ga7r3eou57/PTMjGX+XaORUzwdjl6owLnwIOJ7HnlUJfATv7p1rMI+3hcQpP4M2bVIL/hoC7MDJV+1PWFsKZxGeumROUf+SMi4mXEyLpkpKCRupJ3MCc3yatB1piYSO6N/W7xiwCBeW7w7sMYHb7FBtZLri+V3wyBJJqZb4Q0KiDP7MF2/EnuE1YJY6cAQMmy81S6ZAgWf/Ax8FZtLDlaCCKVRJfrgKy93soIHGbYYkqNVPLMiIHHsIgTKRklG/uDAb9Z773l3ct3uRCPKUBdM9GMi3l0MMnuZtZUKGtjbV8xSmTSmopL6MKsMn3uLNNLqAaatX9nYN7f/BdyOV6J9ufKp3Nh/7KV/gBKlvfFYWBk5xfPW+qWWbq7AK/xdg65mSJrQiOBTx4inY43DyCkTIHTjhJO6OzJuzNaxepVEYUAhV9FXyjqYmg8vuBIP8zTBN8Pt5mbYal53ciHjRZSF5DaI3C3NtjIyuogqEsPZEhGKPqnGqwGffXqJm7r/su5aCsIe8hXEq1OtErniU5/gMP1sxtxV171B0RnGRH+4oOtBG1j16xG1VaFm0K99SwdYjV9jp63e3FovX8lM9JWhGVP7xHED0QxnuFuIUJ5BI3m4bhhGms0OWPwh2mDWl7jmmTNwweB8RMgecjXUKtBPXzY4L7TcGVuupAqoxkuWVul9X5y62DFC4wfUgZ38vq+TeFJ+ExXQsfpUk2cqYx1POn2md/i8WrOBRVHW7rDFkKtTfLCTC7XXBeUEiM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(26005)(426003)(336012)(82740400003)(8676002)(8936002)(4326008)(5660300002)(7416002)(86362001)(31696002)(478600001)(966005)(6916009)(316002)(70586007)(70206006)(54906003)(36860700001)(47076005)(7636003)(356005)(31686004)(41300700001)(40480700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 23:26:09.4927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d078ef3b-0de5-48e7-45ae-08dbefa03cc6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357

On Sat, 25 Nov 2023 16:32:43 +0000, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 4.14.331 release.
> There are 53 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Mon, 27 Nov 2023 16:30:48 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.14.331-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v4.14:
    10 builds:	10 pass, 0 fail
    16 boots:	16 pass, 0 fail
    32 tests:	32 pass, 0 fail

Linux version:	4.14.331-rc2-g0957336c00be
Boards tested:	tegra124-jetson-tk1, tegra20-ventana,
                tegra210-p2371-2180, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon

