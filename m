Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAA04433C
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731840AbfFMQ2A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:28:00 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:43052 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727271AbfFMQ15 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:57 -0400
X-Greylist: delayed 333 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 12:27:57 EDT
Received: from [10.20.204.51] (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 3310F1C01A0;
        Thu, 13 Jun 2019 10:22:24 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
Subject: Re: [PATCH 1/3] arm64: tegra: Add ethernet alias on Jetson TX1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20190613161517.2837-1-thierry.reding@gmail.com>
From:   Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <04a355c8-a4ae-9275-a85a-791ce5c1b34c@wwwdotorg.org>
Date:   Thu, 13 Jun 2019 10:22:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613161517.2837-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/13/19 10:15 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Adding this alias for the Ethernet interface on Jetson TX1 allows the
> bootloader to pass the MAC address to the Linux kernel.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi

> +	aliases {
> +		ethernet = "/usb@70090000/ethernet@1";
> +	};

Don't aliases require an ID in the property name, i.e shouldn't this be 
"ethernet0" rather than just "ethernet"? This is a bit more obvious in 
the TX2 patch where sdhci0, sdhci1, and serial0 are shown in the diff 
context.

Patch should probably be CC'd to some/all of ARM/DT/... mailing lists?
