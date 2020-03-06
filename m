Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C8317C349
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Mar 2020 17:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgCFQxB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 6 Mar 2020 11:53:01 -0500
Received: from avon.wwwdotorg.org ([104.237.132.123]:42428 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgCFQxB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Mar 2020 11:53:01 -0500
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id DD1AD1C01BF;
        Fri,  6 Mar 2020 09:52:58 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.1 at avon.wwwdotorg.org
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Billy Laws <blaws05@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Andrey Danin <danindrey@mail.ru>,
        Gilles Grandou <gilles@grandou.net>,
        Ryan Grachek <ryan@edited.us>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
 <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
 <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
 <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <6fe6d262-c6b0-52d8-0150-4c32a4c36cbd@wwwdotorg.org>
Date:   Fri, 6 Mar 2020 09:52:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 3/6/20 6:37 AM, Ulf Hansson wrote:
> On Wed, 4 Mar 2020 at 18:09, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 04.03.2020 19:36, Ulf Hansson пишет:
>>> On Tue, 25 Feb 2020 at 01:20, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>>
>>>> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
>>>>> All NVIDIA Tegra devices use a special partition table format for the
>>>>> internal storage partitioning. Most of Tegra devices have GPT partition
>>>>> in addition to TegraPT, but some older Android consumer-grade devices do
>>>>> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
>>>>> in order to support these devices properly in the upstream kernel. This
>>>>> patch adds support for NVIDIA Tegra Partition Table format that is used
>>>>> at least by all NVIDIA Tegra20 and Tegra30 devices.
>>>>
>>>>> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
>>>>
>>>>> +static void __init tegra_boot_config_table_init(void)
>>>>> +{
>>>>> +     void __iomem *bct_base;
>>>>> +     u16 pt_addr, pt_size;
>>>>> +
>>>>> +     bct_base = IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSET;
>>>>
>>>> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
>>>> Information Table) to a fixed location in IRAM, and there's some value
>>>> in the BIT that points to where the BCT is in IRAM. In practice, it
>>>> might work out that the BCT is always at the same place in IRAM, but
>>>> this certainly isn't guaranteed. I think there's code in U-Boot which
>>>> extracts the BCT location from the BIT? Yes, see
>>>> arch/arm/mach-tegra/ap.c:get_odmdata().
>>>
>>> So, have you considered using the command line partition option,
>>> rather than adding yet another partition scheme to the kernel?
>>>
>>> In principle, you would let the boot loader scan for the partitions,
>>> likely from machine specific code in U-boot. Then you append these to
>>> the kernel command line and let block/partitions/cmdline.c scan for
>>> it.
>>
>> The bootloader is usually locked-down on a consumer Tegra machines (it's
>> signed / encrypted).
> 
> Right, you are you talking about this from a developer point of view,
> not from an end product user?
> 
> I mean, for sure you can upgrade the bootloader on Nvidia products? No, really?

For developer-oriented products like Jetson developer kits, you can 
upgrade the bootloader, and luckily they haven't used this partition 
table format for many versions.

However, commercial Android products typically have secure boot enabled, 
so you can't replace the bootloader unless you know the secure boot 
keys, which only the manufacturer knows. Dmitry is working on 
re-purposing such products.
