Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 004386659DF
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Jan 2023 12:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjAKLSW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Jan 2023 06:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjAKLSH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:18:07 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDBED2C2;
        Wed, 11 Jan 2023 03:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnElb/yeigB894jCwr1cEJuhuKTlWVDeU7TzLcC0Lr8zaRuM/XLMgyhzZpdzVoTbzlPrr3sAT0AZfPi3WshZLMvektD+YIpkK3zIVVSsc7GUCsY/bjK064U95Xf2bwhSK4281sbDSyFmu0SKKC79TR6KqVbJpZSs7KXQHzyIDn+D4ylORqZeqR6lrm1JTq7OM4UXemsWegiMfIldVxdNUozXp/Ar/7a/h1atCLN7h6JuCfCNfsgugq2GVlvmiFbCyq0s6QC4nQUm+9gkpKFe5nQxYN6oXZzfWcNQXir+PxdrfM+uU84vYu7GLZ9qDRuK+vmzl0vg7hXG4FMXr6l/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuDOSvfS9Cth5Xq+4GE1yqvNKZlN1ZxoBbki7Kox7A0=;
 b=ZVQEavEvPMWRCfRcPfTcv8Os6y/p/cX+3KqxfPu5gTYHSQNgKlr72j8TjwxHkUPH5K7757OnrqjefeMgPNosMhuK8Yg4NxdB9GCdjqdGcbUP4Z1fB/rCNdf5WrbWGDY5Bb2C+R+535EAc4JCnVK450IysqLnonFTPTR9yHfqpdi81fYEvK4CJUEuKmW8uUJ1ulhVAxBC6OvQgxx82LQ+MlVBqR1Vtk4Aa+YlZHj6FzAzkvZ1uQmVD6oB32gGQoGP0hypczroptBiPCG7O2RXmh36/pEEE5gPzK+cCUQg2nk/EdXIM+RuZI+f6pUJwszY3fBenW/QzyjW9u13evq4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuDOSvfS9Cth5Xq+4GE1yqvNKZlN1ZxoBbki7Kox7A0=;
 b=lkLhYypoFm8mYp6O05qQZZqyBQF0nKjluNryQTl4Ns0l6+A3iIMFh7L96Zl7USQ5otNs0xfMPqo40r1RRke2y7LGcQgkTIMOgaXkzoM41Nb6NCJV92h0CiKsnTIeFz7NnQ4FELh87sm93fPt4GMrcLXBVY11T7ZF9PI/hE/CTzi64a7Cwe7n48EGiLyG1i6ATYi4zc7w5WeHQ96Hxxt8uMGzciiK7SqHcKGba98BqkW99vWJpsGEiNiTZy2aBcaY9ZaM5uWVLjpxGHFCMOtvhVIN6urEzMNeBX4gY64rGl77Wj9/xbTrGTgPKv8w2GBNalGKKdmI2qpMH+AE58kyIA==
Received: from MN2PR14CA0022.namprd14.prod.outlook.com (2603:10b6:208:23e::27)
 by DS0PR12MB7557.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:18:02 +0000
Received: from BL02EPF000108E8.namprd05.prod.outlook.com
 (2603:10b6:208:23e:cafe::d2) by MN2PR14CA0022.outlook.office365.com
 (2603:10b6:208:23e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF000108E8.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Wed, 11 Jan 2023 11:18:02 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:17:45 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:17:45 -0800
Received: from jonathanh-vm-01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:17:45 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <torvalds@linux-foundation.org>, <akpm@linux-foundation.org>,
        <linux@roeck-us.net>, <shuah@kernel.org>, <patches@kernelci.org>,
        <lkft-triage@lists.linaro.org>, <pavel@denx.de>,
        <jonathanh@nvidia.com>, <f.fainelli@gmail.com>,
        <sudipm.mukherjee@gmail.com>, <srw@sladewatkins.net>,
        <rwarsow@gmx.de>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 6.0 000/148] 6.0.19-rc1 review
In-Reply-To: <20230110180017.145591678@linuxfoundation.org>
References: <20230110180017.145591678@linuxfoundation.org>
X-NVConfidentiality: public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Message-ID: <46a17533-142f-4952-b9f4-760b7ea4642d@rnnvmail205.nvidia.com>
Date:   Wed, 11 Jan 2023 03:17:45 -0800
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E8:EE_|DS0PR12MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 714150d3-38c4-4835-bd34-08daf3c58136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Hoy1dfRCNTtgKqgFipfjg1i+qFNOX8DZBvWCF2YU92+PxCO9Jj9cRvI701xucAqtPrKQZQk0ynXbOvIdoYlrJVAyuXsebyf/btQUuNCy83DW/YH/EPN+5I889Ka4qDMFn+g+HyPYy0maU/Aj/S6UAZbEaT7wVeP48D6ngoGWjxgCLPdQGAHdTn5Q0XBSbSZdmSf0JH1wTd+tJ+gqpkU4QzTPG7Tn5z1OjRAJXoWYq8R8Rqv+zEMBXJpIFAO5uYDQnSdDc6jC7M9fEBEMrMhJp9aSYvuToaKbNSAshtbDdPeqqKtpinv8ado7iZmpm5fI++scxbWD6gBaUJfz/fe9LHQ5eVv/ikL4BkSxcqygtw8+KPoDIEzQbDUsE+Xae65OyOg9ZO+f/LEynRwiXBcwM3Jw0FuZlDrCkoSxDMHVSOSA47gLwQuUc9faiVyrhCDNyuMK6fqmLvQdM4umd35LVhYtU/zbMWZUW9jIly8i0kNsjL29p/PZ3vCpO9gZoyjZVVvqcnXu0bWU/sGN0GhH4Q/nPlH1ZJYN3R34MwOV8uOFv6PdnQGhUxGnTtrVFVxofh7H+rP+CgB4eur5GbRdrWa2na3WggNgNOIo9+hJTQE/BK/hKROL5xnQHsIPEhbmA/CUV0Te9XPBgTBMv0mHyvroPFYmaxeDUYjWkp7aTRknit2wp8wDafX0luiar5aerDWPRQVqBgWCoz1/QKf2hdXPkVBbDVkLNwzpwC7W8/4GfnY694pSP2vRlROaOCScX6LCABVoMlqdR7wH9h1bJWJwOClzqYfamUIaArD/Vs=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(186003)(40480700001)(316002)(5660300002)(26005)(966005)(7416002)(478600001)(40460700003)(47076005)(4326008)(336012)(6916009)(54906003)(8676002)(41300700001)(70206006)(70586007)(82310400005)(8936002)(31696002)(86362001)(426003)(31686004)(36860700001)(82740400003)(356005)(2906002)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:18:02.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 714150d3-38c4-4835-bd34-08daf3c58136
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7557
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 10 Jan 2023 19:01:44 +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.0.19 release.
> There are 148 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> NOTE, this will probably be the LAST 6.0.y release.  If there is
> anything preventing you from moving to 6.1.y right now, please let me
> know.
> 
> Responses should be made by Thu, 12 Jan 2023 17:59:42 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.0.19-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.0.y
> and the diffstat can be found below.
> 
> thanks,
> 
> greg k-h

All tests passing for Tegra ...

Test results for stable-v6.0:
    11 builds:	11 pass, 0 fail
    28 boots:	28 pass, 0 fail
    130 tests:	130 pass, 0 fail

Linux version:	6.0.19-rc1-ga7ffaeeaf9bb
Boards tested:	tegra124-jetson-tk1, tegra186-p2771-0000,
                tegra194-p2972-0000, tegra194-p3509-0000+p3668-0000,
                tegra20-ventana, tegra210-p2371-2180,
                tegra210-p3450-0000, tegra30-cardhu-a04

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon
