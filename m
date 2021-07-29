Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD913D9BD4
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Jul 2021 04:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233436AbhG2CdV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 28 Jul 2021 22:33:21 -0400
Received: from mail-dm6nam11on2059.outbound.protection.outlook.com ([40.107.223.59]:49761
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233256AbhG2CdU (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Jul 2021 22:33:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAC/9qNCtzaAiwB61H7imPZW0WavxzvDwNyaQaPArWz3AVJcsCixDiSezytJDN+rB3RgQMCq9vA3yk+QjNlxuwesYfJbokCyFJkvFTDoMhLgp9D0fZL2PzdqIajhsN15xl0WsyiSZva++vBuH/CCaDB/5oTfi61qZXdVuEAQSv0maLTuUsPP+yddQkqkw3vuX5l2N302ZT7wWpGqvbGr0uoYpsSbomHlSPdQvGXs5BvR4+cHVdp+AxAuZ387yNcAAZckzluMLk7/JKnd8RinsPbosb4w+X720Br2+2fy8BwhNS+eigprWYjV6mB7kf0z7gxcDVEjbvoUBIlDMMBcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5ObciQMoW3B9j1W70ASyPZIOGcpEIebsZY4Vjr0riA=;
 b=AiDMXxo9j/mBcI2nv6Xjpg4OVlqK4+yO22vpFfGa8ptytWIty9OSwdc9+XNsWG2MaLNjGtI/2e5Ofz84UduDUaRJFbU2XGDqdGxY07UQ1qOP5ClLUOFvI8R8MkiX5eyjT3B0Y1y2lN8BTdIT+mYgFL7OtLGQ5qPkbqVxC3gmO1oYX5qZmp7z8HBADH8S5CHMhou3aE5pQSrU4hxhsGesVsl6hQDnlWMtDkFWGzTpP5KUQ7Km7VesaHQktsFGjeWaxntSmZvfwr3KfKqv7yp4qq0OQthSYluWdZV/XpLkPihOwIBLk/hpaewmKtfMv0Cp6En+DS8luGos1k8lFqIPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5ObciQMoW3B9j1W70ASyPZIOGcpEIebsZY4Vjr0riA=;
 b=h3iaXT/MxbZ4UV+i7xS7IEIjr1rggnczqqxhNyYRdGHNf4kkoHdJ+1ZQYmbI+NHavBK9pUeK2G8KxxO1ko74ssYTWQZrDnsEJlsN8NaJO/xOTqRZ8j6qbhbVcsgxOA+0O41LQx6hPmCFr+59nifIJF238tyXBC3m5iuz/T3C7TT2MKOnOd4wklvRZEYDmqRisX7pZu8w4DCBH21k92q+CFzaNrzTk/VPphz6KbyNt9tjfo6fwiaTIMeQAUcUGo1SyR04S196BTsyEcUthVWd2PyfJ7QJjx6bFXBTOMOdWgERDz+gGPviwyE/XTBTDAfwxeMKhH3aiURJv7vpk4/h3g==
Received: from BN6PR13CA0009.namprd13.prod.outlook.com (2603:10b6:404:10a::19)
 by BN9PR12MB5340.namprd12.prod.outlook.com (2603:10b6:408:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 02:33:16 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::f2) by BN6PR13CA0009.outlook.office365.com
 (2603:10b6:404:10a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.6 via Frontend
 Transport; Thu, 29 Jul 2021 02:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 02:33:16 +0000
Received: from [172.17.173.69] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Jul
 2021 02:33:15 +0000
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
To:     Jonathan Cameron <jic23@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
 <20210704212704.26f5653b@jic23-huawei>
X-Nvconfidentiality: public
From:   Dipen Patel <dipenp@nvidia.com>
Message-ID: <33acfb91-d0e0-b45d-c324-d3b3032bc557@nvidia.com>
Date:   Wed, 28 Jul 2021 19:42:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704212704.26f5653b@jic23-huawei>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 779726dd-c303-4ba8-a6e3-08d952393876
X-MS-TrafficTypeDiagnostic: BN9PR12MB5340:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5340458EB90E6DF9FCD85E46AEEB9@BN9PR12MB5340.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKeDf4F+3I6C1ktUY4honrQaGcG1LPABoeQbP1jcTjbbfU1aCNUVHQ20tAa4vtIj3UygdXkcH+LTCi1eXciCbLpX6VYIJR5eM6bP93Ucbq9jyJXcGlshqg0/cW1o/qd2jlguq+HDJocX9BvJ1dr1apPx0fzxsoESPc6mwktXQrQb7TAC59b3SG5L5mzjV1RWOMWwZPy1S8KJBB6RpUM+v9v+skFYgkQz3SKhh6lxVoMh0wRknn0Ne7Rm1d5bFFOVLrJeYIFxR3RFCfIZ/EbI3N5xHmOkE6PcmCclMJZ1EgRaUaF68QlZ8h/uHjnsKDunzANJ44azYOPfTSl9FmbydYBxoEkrDrIXolMIpdHrvhCOPm5YcVsKzBCYpGZ+ZsOVgyyMJ3rVvIfG8RJxtwnzWZ58paEMZNe5WM1RWnxFh4jPmxDWSTAbth8TkbNt5mAxXv247B9A3P5ATVFdBxxUpMgV144UlKAcmBu0/SELT0XXJGZEAhK3OslklVi/lME66Skt8+bIFQDlc4FnTRhV1bImKn6+AcIZcFBbOdmxoqa+t3AmAHb6y37RihwpcdfJov0bkcV1hwKvFcV9QABFpigStaH+I/xpaF/h+3OM4MEUy/sE8sMKjBYpZohCYLO1vjrnZwH9gL7DoL6nZqAvmTn4neSekppQbISp+0irrZkp1dLZ365LotHxgM2FWCelkHdsBMCAKMFdG4RhgTpa+o8XZ/BK0wzx42g9LirYfXY=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(36906005)(5660300002)(53546011)(31686004)(82310400003)(8936002)(478600001)(16526019)(7636003)(31696002)(336012)(2616005)(426003)(4326008)(86362001)(8676002)(82740400003)(2906002)(47076005)(30864003)(356005)(36756003)(7416002)(316002)(16576012)(70586007)(186003)(70206006)(6916009)(54906003)(36860700001)(26005)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 02:33:16.1920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 779726dd-c303-4ba8-a6e3-08d952393876
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5340
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Thanks Jonathan, I accept all your comments, will be reflected in next RFC patch series.

Thanks for taking time to review and comment.


Best Regards,

Dipen Patel

On 7/4/21 1:27 PM, Jonathan Cameron wrote:
> On Fri, 25 Jun 2021 16:55:24 -0700
> Dipen Patel <dipenp@nvidia.com> wrote:
>
>> Tegra194 device has multiple HTE instances also known as GTE
>> (Generic hardware Timestamping Engine) which can timestamp subset of
>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
>> and exposes timestamping ability on those lines to the consumers
>> through HTE subsystem.
>>
>> Also, with this patch, added:
>> - documentation about this provider and its capabilities at
>> Documentation/hte.
>> - Compilation support in Makefile and Kconfig
>>
>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> A few comments inline,
>
> J
>> ---
>>  Documentation/hte/index.rst        |  21 ++
>>  Documentation/hte/tegra194-hte.rst |  65 ++++
>>  Documentation/index.rst            |   1 +
>>  drivers/hte/Kconfig                |  12 +
>>  drivers/hte/Makefile               |   1 +
>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
>>  6 files changed, 654 insertions(+)
>>  create mode 100644 Documentation/hte/index.rst
>>  create mode 100644 Documentation/hte/tegra194-hte.rst
>>  create mode 100644 drivers/hte/hte-tegra194.c
>>
>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
>> new file mode 100644
>> index 000000000000..f311ebec6b47
>> --- /dev/null
>> +++ b/Documentation/hte/index.rst
>> @@ -0,0 +1,21 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +============================================
>> +The Linux Hardware Timestamping Engine (HTE)
>> +============================================
>> +
>> +The HTE Subsystem
>> +=================
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   hte
>> +
>> +HTE Tegra Provider
>> +==================
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   tegra194-hte
>> \ No newline at end of file
>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
>> new file mode 100644
>> index 000000000000..c23eaafcf080
>> --- /dev/null
>> +++ b/Documentation/hte/tegra194-hte.rst
>> @@ -0,0 +1,65 @@
>> +HTE Kernel provider driver
>> +==========================
>> +
>> +Description
>> +-----------
>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
>> +known as generic timestamping engine (GTE). This provider driver implements
>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
>> +driver converts clock tick rate to nano seconds before storing it as timestamp
>> +value.
>> +
>> +GPIO GTE
>> +--------
>> +
>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
>> +always on (AON) gpio controller instance supports timestamping GPIOs in
>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
>> +controller as it requires very specific bits to be set in GPIO config register.
>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
>> +subsystem and GPIO GTE for in kernel consumers.
>> +
>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
>> +
>> +	To enable HTE on given GPIO line.
>> +
>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
>> +
>> +	To retrieve hardwre timestamp in nano seconds.
>> +
>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
>> +
>> +	To query if HTE is enabled on the given GPIO.
>> +
>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
>> +in nano second.
>> +
>> +IRQ GTE
>> +--------
>> +
>> +This GTE instance helps timestamp LIC IRQ lines in real time. There are 352 IRQ
>> +lines which this instance can help timestamp realtime. The hte devicetree
>> +binding described at ``Documentation/devicetree/bindings/hte/`` gives out
>> +example how consumer can request IRQ line, since it is one to one mapping,
>> +consumers can simply specify IRQ number that they are interested in. There is
>> +no userspace consumer support for this GTE instance. The sample test code
>> +hte-tegra194-irq-test.c, located in ``drivers/hte/`` directory,
>> +demonstrates how to use IRQ GTE instance. The below is sample device tree
>> +snippet code for the test driver::
>> +
>> + tegra_hte_irq_test {
>> +        compatible = "nvidia,tegra194-hte-irq-test";
>> +        htes = <&tegra_hte_lic 0x19>;
>> +        hte-names = "hte-lic";
>> + };
>> +
>> +The source code of the driver both IRQ and GPIO GTE is locate at
>> +``drivers/hte/hte-tegra194.c``.
>> \ No newline at end of file
>> diff --git a/Documentation/index.rst b/Documentation/index.rst
>> index 1b13c2445e87..b41118577fe6 100644
>> --- a/Documentation/index.rst
>> +++ b/Documentation/index.rst
>> @@ -138,6 +138,7 @@ needed).
>>     misc-devices/index
>>     scheduler/index
>>     mhi/index
>> +   hte/index
>>  
>>  Architecture-agnostic documentation
>>  -----------------------------------
>> diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
>> index 394e112f7dfb..f7b01fcc7190 100644
>> --- a/drivers/hte/Kconfig
>> +++ b/drivers/hte/Kconfig
>> @@ -20,3 +20,15 @@ menuconfig HTE
>>  
>>            If unsure, say no.
>>  
>> +if HTE
>> +
>> +config HTE_TEGRA194
>> +	tristate "NVIDIA Tegra194 HTE Support"
>> +	depends on ARCH_TEGRA_194_SOC
>> +	help
>> +	  Enable this option for integrated hardware timestamping engine also
>> +	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
>> +	  systems-on-chip. The driver supports 352 LIC IRQs and 39 AON GPIOs
>> +	  lines for timestamping in realtime.
>> +
>> +endif
>> diff --git a/drivers/hte/Makefile b/drivers/hte/Makefile
>> index 9899dbe516f7..52f978cfc913 100644
>> --- a/drivers/hte/Makefile
>> +++ b/drivers/hte/Makefile
>> @@ -1 +1,2 @@
>>  obj-$(CONFIG_HTE)		+= hte.o
>> +obj-$(CONFIG_HTE_TEGRA194)	+= hte-tegra194.o
>> \ No newline at end of file
> fix that
>
>> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
>> new file mode 100644
>> index 000000000000..8ad10efd3641
>> --- /dev/null
>> +++ b/drivers/hte/hte-tegra194.c
>> @@ -0,0 +1,554 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2021 NVIDIA Corporation
>> + *
>> + * Author: Dipen Patel <dipenp@nvidia.com>
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/stat.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/hte.h>
>> +#include <linux/uaccess.h>
>> +
>> +#define HTE_SUSPEND	0
>> +
>> +/* HTE source clock TSC is 31.25MHz */
>> +#define HTE_TS_CLK_RATE_HZ	31250000ULL
>> +#define HTE_CLK_RATE_NS		32
>> +#define HTE_TS_NS_SHIFT	__builtin_ctz(HTE_CLK_RATE_NS)
>> +
>> +#define NV_AON_SLICE_INVALID	-1
>> +
>> +/* AON HTE line map For slice 1 */
>> +#define NV_AON_HTE_SLICE1_IRQ_GPIO_28	12
>> +#define NV_AON_HTE_SLICE1_IRQ_GPIO_29	13
>> +
>> +/* AON HTE line map For slice 2 */
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_0	0
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_1	1
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_2	2
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_3	3
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_4	4
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_5	5
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_6	6
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_7	7
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_8	8
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_9	9
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_10	10
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_11	11
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_12	12
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_13	13
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_14	14
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_15	15
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_16	16
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_17	17
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_18	18
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_19	19
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_20	20
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_21	21
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_22	22
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_23	23
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_24	24
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_25	25
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_26	26
>> +#define NV_AON_HTE_SLICE2_IRQ_GPIO_27	27
>> +
>> +/* AON GPIO port AA pins */
>> +#define NV_AON_GPIO_PORT_AA_0		0
>> +#define NV_AON_GPIO_PORT_AA_1		1
>> +#define NV_AON_GPIO_PORT_AA_2		2
>> +#define NV_AON_GPIO_PORT_AA_3		3
>> +#define NV_AON_GPIO_PORT_AA_4		4
>> +#define NV_AON_GPIO_PORT_AA_5		5
>> +#define NV_AON_GPIO_PORT_AA_6		6
>> +#define NV_AON_GPIO_PORT_AA_7		7
>> +
>> +/* AON GPIO port BB pins */
>> +#define NV_AON_GPIO_PORT_BB_0		8
>> +#define NV_AON_GPIO_PORT_BB_1		9
>> +#define NV_AON_GPIO_PORT_BB_2		10
>> +#define NV_AON_GPIO_PORT_BB_3		11
>> +
>> +/* AON GPIO port CC pins */
>> +#define NV_AON_GPIO_PORT_CC_0		16
>> +#define NV_AON_GPIO_PORT_CC_1		17
>> +#define NV_AON_GPIO_PORT_CC_2		18
>> +#define NV_AON_GPIO_PORT_CC_3		19
>> +#define NV_AON_GPIO_PORT_CC_4		20
>> +#define NV_AON_GPIO_PORT_CC_5		21
>> +#define NV_AON_GPIO_PORT_CC_6		22
>> +#define NV_AON_GPIO_PORT_CC_7		23
>> +
>> +/* AON GPIO port DD pins */
>> +#define NV_AON_GPIO_PORT_DD_0		24
>> +#define NV_AON_GPIO_PORT_DD_1		25
>> +#define NV_AON_GPIO_PORT_DD_2		26
>> +
>> +/* AON GPIO port EE pins */
>> +#define NV_AON_GPIO_PORT_EE_0		32
>> +#define NV_AON_GPIO_PORT_EE_1		33
>> +#define NV_AON_GPIO_PORT_EE_2		34
>> +#define NV_AON_GPIO_PORT_EE_3		35
>> +#define NV_AON_GPIO_PORT_EE_4		36
>> +#define NV_AON_GPIO_PORT_EE_5		37
>> +#define NV_AON_GPIO_PORT_EE_6		38
>> +
>> +
>> +#define HTE_TECTRL		0x0
>> +#define HTE_TETSCH		0x4
>> +#define HTE_TETSCL		0x8
>> +#define HTE_TESRC		0xC
>> +#define HTE_TECCV		0x10
>> +#define HTE_TEPCV		0x14
>> +#define HTE_TECMD		0x1C
>> +#define HTE_TESTATUS		0x20
>> +#define HTE_SLICE0_TETEN	0x40
>> +#define HTE_SLICE1_TETEN	0x60
>> +
>> +#define HTE_SLICE_SIZE		(HTE_SLICE1_TETEN - HTE_SLICE0_TETEN)
>> +
>> +#define HTE_TECTRL_ENABLE_ENABLE	0x1
>> +
>> +#define HTE_TECTRL_OCCU_SHIFT		0x8
>> +#define HTE_TECTRL_INTR_SHIFT		0x1
>> +#define HTE_TECTRL_INTR_ENABLE		0x1
>> +
>> +#define HTE_TESRC_SLICE_SHIFT		16
>> +#define HTE_TESRC_SLICE_DEFAULT_MASK	0xFF
>> +
>> +#define HTE_TECMD_CMD_POP		0x1
>> +
>> +#define HTE_TESTATUS_OCCUPANCY_SHIFT	8
>> +#define HTE_TESTATUS_OCCUPANCY_MASK	0xFF
>> +
>> +struct hte_slices {
>> +	u32 r_val;
>> +	unsigned long flags;
>> +	/* to prevent lines mapped to same slice updating its register */
>> +	spinlock_t s_lock;
>> +};
>> +
>> +struct tegra_hte_line_mapped {
>> +	int slice;
>> +	u32 bit_index;
>> +};
>> +
>> +struct tegra_hte_line_table {
>> +	int map_sz;
>> +	const struct tegra_hte_line_mapped *map;
>> +};
>> +
>> +struct tegra_hte_soc {
>> +	int hte_irq;
>> +	u32 itr_thrshld;
>> +	u32 conf_rval;
>> +	struct hte_slices *sl;
>> +	const struct tegra_hte_line_table *line_map;
>> +	struct hte_chip *chip;
>> +	void __iomem *regs;
>> +};
>> +
>> +static const struct tegra_hte_line_mapped tegra194_aon_gpio_map[] = {
>> +	/* gpio, slice, bit_index */
>> +	[NV_AON_GPIO_PORT_AA_0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
>> +	[NV_AON_GPIO_PORT_AA_1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
>> +	[NV_AON_GPIO_PORT_AA_2]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
>> +	[NV_AON_GPIO_PORT_AA_3]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
>> +	[NV_AON_GPIO_PORT_AA_4]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
>> +	[NV_AON_GPIO_PORT_AA_5]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
>> +	[NV_AON_GPIO_PORT_AA_6]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
>> +	[NV_AON_GPIO_PORT_AA_7]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
>> +	[NV_AON_GPIO_PORT_BB_0]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
>> +	[NV_AON_GPIO_PORT_BB_1]  = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
>> +	[NV_AON_GPIO_PORT_BB_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
>> +	[NV_AON_GPIO_PORT_BB_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
>> +	[12] = {NV_AON_SLICE_INVALID, 0},
>> +	[13] = {NV_AON_SLICE_INVALID, 0},
>> +	[14] = {NV_AON_SLICE_INVALID, 0},
>> +	[15] = {NV_AON_SLICE_INVALID, 0},
>> +	[NV_AON_GPIO_PORT_CC_0] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
>> +	[NV_AON_GPIO_PORT_CC_1] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
>> +	[NV_AON_GPIO_PORT_CC_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
>> +	[NV_AON_GPIO_PORT_CC_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
>> +	[NV_AON_GPIO_PORT_CC_4] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
>> +	[NV_AON_GPIO_PORT_CC_5] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
>> +	[NV_AON_GPIO_PORT_CC_6] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
>> +	[NV_AON_GPIO_PORT_CC_7] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
>> +	[NV_AON_GPIO_PORT_DD_0] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
>> +	[NV_AON_GPIO_PORT_DD_1] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
>> +	[NV_AON_GPIO_PORT_DD_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
>> +	[27] = {NV_AON_SLICE_INVALID, 0},
>> +	[28] = {NV_AON_SLICE_INVALID, 0},
>> +	[29] = {NV_AON_SLICE_INVALID, 0},
>> +	[30] = {NV_AON_SLICE_INVALID, 0},
>> +	[31] = {NV_AON_SLICE_INVALID, 0},
>> +	[NV_AON_GPIO_PORT_EE_0] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_29},
>> +	[NV_AON_GPIO_PORT_EE_1] = {1, NV_AON_HTE_SLICE1_IRQ_GPIO_28},
>> +	[NV_AON_GPIO_PORT_EE_2] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
>> +	[NV_AON_GPIO_PORT_EE_3] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
>> +	[NV_AON_GPIO_PORT_EE_4] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
>> +	[NV_AON_GPIO_PORT_EE_5] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
>> +	[NV_AON_GPIO_PORT_EE_6] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
>> +};
>> +
>> +static const struct tegra_hte_line_table aon_hte_map = {
>> +	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
>> +	.map = tegra194_aon_gpio_map,
>> +};
>> +
>> +static inline u32 tegra_hte_readl(struct tegra_hte_soc *hte, u32 reg)
>> +{
>> +	return readl(hte->regs + reg);
>> +}
>> +
>> +static inline void tegra_hte_writel(struct tegra_hte_soc *hte, u32 reg,
>> +				    u32 val)
>> +{
>> +	writel(val, hte->regs + reg);
>> +}
>> +
>> +static inline int tegra_hte_map_to_line_id(u32 eid, struct tegra_hte_soc *gs,
>> +					  u32 *mapped)
>> +{
>> +	const struct tegra_hte_line_mapped *m;
>> +
>> +	if (gs->line_map) {
>> +		m = gs->line_map->map;
>> +		if (eid > gs->line_map->map_sz)
>> +			return -EINVAL;
>> +		if (m[eid].slice == NV_AON_SLICE_INVALID)
>> +			return -EINVAL;
>> +
>> +		*mapped = (m[eid].slice << 5) + m[eid].bit_index;
>> +	} else {
>> +		*mapped = eid;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_hte_line_xlate(struct hte_chip *gc,
>> +				 const struct of_phandle_args *args,
>> +				 struct hte_ts_desc *desc, u32 *xlated_id)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!gc || !desc || !xlated_id)
>> +		return -EINVAL;
>> +
>> +	if (args) {
>> +		if (gc->of_hte_n_cells < 1)
>> +			return -EINVAL;
>> +
>> +		if (args->args_count != gc->of_hte_n_cells)
>> +			return -EINVAL;
>> +
>> +		desc->con_id = args->args[0];
>> +	}
>> +
>> +	ret = tegra_hte_map_to_line_id(desc->con_id, gc->data,
>> +				       xlated_id);
>> +	if (ret < 0) {
>> +		dev_dbg(gc->dev, "con_id:%u mapping failed\n",
>> +			desc->con_id);
>> +		return ret;
>> +	}
>> +
>> +	if (*xlated_id > gc->nlines)
>> +		return -EINVAL;
>> +
>> +	dev_dbg(gc->dev, "requested id:%u, xlated id:%u\n",
>> +		desc->con_id, *xlated_id);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_hte_en_dis_common(struct hte_chip *chip, u32 line_id, bool en)
>> +{
>> +	u32 slice, sl_bit_shift, line_bit, val, reg;
>> +	struct tegra_hte_soc *gs;
>> +
>> +	sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
>> +
>> +	if (!chip)
>> +		return -EINVAL;
>> +
>> +	gs = (struct tegra_hte_soc *)chip->data;
>> +
>> +	if (line_id > chip->nlines) {
>> +		dev_err(chip->dev,
>> +			"line id: %u is not supported by this controller\n",
>> +			line_id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	slice = line_id >> sl_bit_shift;
>> +	line_bit = line_id & (HTE_SLICE_SIZE - 1);
>> +	reg = (slice << sl_bit_shift) + HTE_SLICE0_TETEN;
>> +
>> +	spin_lock(&gs->sl[slice].s_lock);
>> +
>> +	if (test_bit(HTE_SUSPEND, &gs->sl[slice].flags)) {
>> +		spin_unlock(&gs->sl[slice].s_lock);
>> +		dev_dbg(chip->dev, "device suspended");
>> +		return -EBUSY;
>> +	}
>> +
>> +	val = tegra_hte_readl(gs, reg);
>> +	if (en)
>> +		val = val | (1 << line_bit);
>> +	else
>> +		val = val & (~(1 << line_bit));
>> +	tegra_hte_writel(gs, reg, val);
>> +
>> +	spin_unlock(&gs->sl[slice].s_lock);
>> +
>> +	dev_dbg(chip->dev, "line: %u, slice %u, line_bit %u, reg:0x%x\n",
>> +		line_id, slice, line_bit, reg);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_hte_request(struct hte_chip *chip, u32 line_id)
>> +{
>> +	return tegra_hte_en_dis_common(chip, line_id, true);
>> +}
>> +
>> +static int tegra_hte_release(struct hte_chip *chip, u32 line_id)
>> +{
>> +	return tegra_hte_en_dis_common(chip, line_id, false);
>> +}
>> +
>> +static int tegra_hte_clk_src_info(struct hte_chip *chip,
>> +				  struct hte_clk_info *ci)
>> +{
>> +	(void)chip;
>> +
>> +	ci->hz = HTE_TS_CLK_RATE_HZ;
>> +	ci->type = CLOCK_MONOTONIC;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>> +{
>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>> +	u64 tsc;
>> +	int dir;
>> +	struct hte_ts_data el;
>> +
>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
>> +		tsc = (((u64)tsh << 32) | tsl);
>> +
>> +		src = tegra_hte_readl(gs, HTE_TESRC);
>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
>> +
>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
>> +		acv = pv ^ cv;
>> +		while (acv) {
>> +			bit_index = __builtin_ctz(acv);
>> +			if ((pv >> bit_index) & BIT(0))
>> +				dir = HTE_EVENT_RISING_EDGE;
>> +			else
>> +				dir = HTE_EVENT_FALLING_EDGE;
>> +
>> +			line_id = bit_index + (slice << 5);
>> +			el.dir = dir;
>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
>> +					      sizeof(el));
>> +			acv &= ~BIT(bit_index);
>> +		}
>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
>> +	}
>> +}
>> +
>> +static irqreturn_t tegra_hte_isr(int irq, void *dev_id)
>> +{
>> +	struct tegra_hte_soc *gs = dev_id;
>> +
>> +	tegra_hte_read_fifo(gs);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static const struct of_device_id tegra_hte_of_match[] = {
>> +	{ .compatible = "nvidia,tegra194-gte-lic"},
>> +	{ .compatible = "nvidia,tegra194-gte-aon", .data = &aon_hte_map},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
>> +
>> +static const struct hte_ops g_ops = {
>> +	.request = tegra_hte_request,
>> +	.release = tegra_hte_release,
>> +	.enable = tegra_hte_request,
>> +	.disable = tegra_hte_release,
>> +	.get_clk_src_info = tegra_hte_clk_src_info,
>> +};
>> +
>> +static int tegra_hte_probe(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +	u32 i, slices, val = 0;
>> +	struct device *dev;
>> +	struct tegra_hte_soc *hte_dev;
>> +	struct hte_chip *gc;
>> +
>> +	dev = &pdev->dev;
>> +
>> +	hte_dev = devm_kzalloc(dev, sizeof(*hte_dev), GFP_KERNEL);
>> +	if (!hte_dev)
>> +		return -ENOMEM;
>> +
>> +	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
>> +	if (!gc)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&pdev->dev, hte_dev);
>> +	hte_dev->line_map = of_device_get_match_data(&pdev->dev);
>> +
>> +	hte_dev->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(hte_dev->regs))
>> +		return PTR_ERR(hte_dev->regs);
>> +
>> +	ret = of_property_read_u32(dev->of_node, "int-threshold",
>> +				   &hte_dev->itr_thrshld);
>> +	if (ret != 0)
>> +		hte_dev->itr_thrshld = 1;
>> +
>> +	ret = of_property_read_u32(dev->of_node, "slices", &slices);
>> +	if (ret != 0) {
>> +		dev_err(dev, "Could not read slices\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	hte_dev->sl = devm_kzalloc(dev, sizeof(struct hte_slices) * slices,
> Preference for sizeof(*hte_dev->sl) as it saves me checking the size is correct
> for the type.
>
>> +				   GFP_KERNEL);
>> +	if (!hte_dev->sl)
>> +		return -ENOMEM;
>> +
>> +	ret = platform_get_irq(pdev, 0);
>> +	if (ret < 0) {
>> +		dev_err(dev, "get irq failed.\n");
> dev_err_probe() probably so you don't print the message if deferred probing is
> going on.
>
>> +		return ret;
>> +	}
>> +	hte_dev->hte_irq = ret;
>> +	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
>> +			       dev_name(dev), hte_dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "request irq failed.\n");
>> +		return ret;
>> +	}
>> +
>> +	gc->nlines = slices << 5;
>> +	gc->ops = &g_ops;
>> +	gc->dev = dev;
>> +	hte_dev->chip = gc;
>> +	gc->data = (void *)hte_dev;
> Don't case to void * - cast to the actual type if necessary.
> If it is a void * then most likely it shouldn't be if we always put something
> in particular it in it.
>
>> +	gc->xlate = tegra_hte_line_xlate;
>> +	gc->of_hte_n_cells = 1;
>> +
>> +	ret = hte_register_chip(hte_dev->chip);
>> +
> No blank line before error handler.  Under the circumstances is that not
> fatal?
>
>> +	if (ret)
>> +		dev_err(gc->dev, "hte chip register failed");
>> +
>> +	for (i = 0; i < slices; i++) {
>> +		hte_dev->sl[i].flags = 0;
>> +		spin_lock_init(&hte_dev->sl[i].s_lock);
>> +	}
>> +
>> +	val = HTE_TECTRL_ENABLE_ENABLE |
>> +	      (HTE_TECTRL_INTR_ENABLE << HTE_TECTRL_INTR_SHIFT) |
>> +	      (hte_dev->itr_thrshld << HTE_TECTRL_OCCU_SHIFT);
>> +	tegra_hte_writel(hte_dev, HTE_TECTRL, val);
> You could use a devm_add_action_or_reset() to deal with unwinding this
> plus add a devm_hte_register_chip() and then you can get rid of remove
> entirely which is always nice.
>
>> +
>> +	dev_dbg(gc->dev, "lines: %d, slices:%d", gc->nlines, slices);
>> +	return 0;
>> +}
>> +
>> +static int tegra_hte_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_hte_soc *gs = dev_get_drvdata(&pdev->dev);
>> +
>> +	tegra_hte_writel(gs, HTE_TECTRL, 0);
>> +
>> +	return hte_unregister_chip(gs->chip);
>> +}
>> +
>> +#ifdef CONFIG_PM_SLEEP
> Personally I prefer the approach of marking PM functions
> __maybe_unused and dropping the ifdef protections.
> There have been a lot of subtle issues in the build system in the
> past around those and it's much easier to just let the compiler
> drop them if they are unused.
>
>> +static int tegra_hte_resume_early(struct device *dev)
>> +{
>> +	u32 i;
>> +	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
>> +	u32 slices = gs->chip->nlines >> 5;
> Whilst it's the same thing, I'd prefer a divide there by however lines there are in a slice.
>
>> +	u32 sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
>> +
>> +	tegra_hte_writel(gs, HTE_TECTRL, gs->conf_rval);
>> +
>> +	for (i = 0; i < slices; i++) {
>> +		spin_lock(&gs->sl[i].s_lock);
>> +		tegra_hte_writel(gs,
>> +				 ((i << sl_bit_shift) + HTE_SLICE0_TETEN),
>> +				 gs->sl[i].r_val);
>> +		clear_bit(HTE_SUSPEND, &gs->sl[i].flags);
>> +		spin_unlock(&gs->sl[i].s_lock);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_hte_suspend_late(struct device *dev)
>> +{
>> +	u32 i;
>> +	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
>> +	u32 slices = gs->chip->nlines >> 5;
>> +	u32 sl_bit_shift = __builtin_ctz(HTE_SLICE_SIZE);
>> +
>> +	gs->conf_rval = tegra_hte_readl(gs, HTE_TECTRL);
>> +	for (i = 0; i < slices; i++) {
>> +		spin_lock(&gs->sl[i].s_lock);
>> +		gs->sl[i].r_val = tegra_hte_readl(gs,
>> +				((i << sl_bit_shift) + HTE_SLICE0_TETEN));
>> +		set_bit(HTE_SUSPEND, &gs->sl[i].flags);
>> +		spin_unlock(&gs->sl[i].s_lock);
>> +	}
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops tegra_hte_pm = {
>> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(tegra_hte_suspend_late,
>> +				     tegra_hte_resume_early)
>> +};
>> +
>> +static struct platform_driver tegra_hte_driver = {
>> +	.probe = tegra_hte_probe,
>> +	.remove = tegra_hte_remove,
>> +	.driver = {
>> +		.name = "tegra_hte",
>> +		.pm = &tegra_hte_pm,
>> +		.of_match_table = tegra_hte_of_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(tegra_hte_driver);
>> +
>> +MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) driver");
>> +MODULE_LICENSE("GPL v2");
