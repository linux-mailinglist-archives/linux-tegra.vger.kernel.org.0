Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73B8170A2
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 07:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfEHF71 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 01:59:27 -0400
Received: from miraculix.kubu.at ([185.93.212.77]:42482 "EHLO
        miraculix.kubu.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfEHF70 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 01:59:26 -0400
Received: from [185.93.212.77] (miraculix.kubu.at [185.93.212.77])
        (authenticated bits=0)
        by miraculix.kubu.at (8.15.2/8.15.2/Debian-8) with ESMTPSA id x485xLXx002127
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-tegra@vger.kernel.org>; Wed, 8 May 2019 07:59:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kubu.at; s=dkim;
        t=1557295162; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:autocrypt;
        bh=8j3OYzC6qMz3HHG946wbAdvPLqLuUOjGu2S2WG0fHgc=;
        b=YBbHW+3lYwWcXO1CyZb6qpNzrHXG/QknoqVF4jaNZOhq7dpY6HUMMfwM6J2KSn9Jz/eZ3T
        UL0vs65tWb46m5cmNnjvLKrXOhoy9uO8Tw7ZmDKAr7hff3bml5sXkXMIPdYaBTCzUCYwVJ
        YlnnJKuPh/VqaaqsGmcNJP9VFcixqFkFM0iV6E9mDeLxPx+XK7y1JBqAsjwg7Eiv0qOhir
        5ij2GWJGmx0hygyuszfG5u2uIInktMGyGeatLqThkrhEaeS6HRd7k9gxWXhTl85R/u5vWp
        rcMUkq7Vul2bJ/McMdPNcat9I6AunBNmoD2Gk9rYCtpF5h7as6lFfZzj/+vpag==
Subject: Re: Patch: PCI: tegra: Use generic accessors where possible
References: <c4c235a9-89a8-736b-718a-b38861deb470@kubu.at>
To:     linux-tegra@vger.kernel.org
From:   Bernd Kubu <bernd@kubu.at>
X-Forwarded-Message-Id: <c4c235a9-89a8-736b-718a-b38861deb470@kubu.at>
Message-ID: <848c42af-30fa-5421-8a8a-e1a619ffee4c@kubu.at>
Date:   Wed, 8 May 2019 07:59:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c4c235a9-89a8-736b-718a-b38861deb470@kubu.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-AT
X-Virus-Scanned: clamav-milter 0.100.3 at miraculix
X-Virus-Status: Clean
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


-------- Weitergeleitete Nachricht --------
Betreff: 	Re: Patch: PCI: tegra: Use generic accessors where possible
Datum: 	Wed, 8 May 2019 07:40:51 +0200
Von: 	Bernd Kubu <bernd@kubu.at>
An: 	Thierry Reding <treding@nvidia.com>
Kopie (CC): 	Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
linux-tegra@vger.kernel.org



Hi Thierry,

I try to be a bit more specific with this mail:

My hardware is a "Toradex Apalis TK1 2GB V1.1A".
I work on the current Ubuntu Bionic-Kernel (18.04) [1], which is a 4.15 
kernel.
As you already mentioned, the patch [2] was added in 4.15. The 
Toradex-patchset [3] was originally for 4.14. I applied this patchset 
[3] to the bionic-kernel. A minor modification was necessary to get it 
to work [4]. (I am currently testing with the other toradex-peripherals)

With this setup, the igb-driver for the onboard Intel ethernet network 
controller [8086:157b] does not initialize correctly. I get the 
following messages in dmesg:

[    4.913881] pci 0000:01:00.0: [8086:157b] type 10 class 0x020000
[    4.913913] pci 0000:01:00.0: unknown header type 10, ignoring device

It seems, the reading of the pci-header-type is not correct. It reads 
"0x10" instead of "0x00" reproduceable. After comparing the kernel 
changes between 4.14 and 4.15, I found the changes of patch [2] and 
removed it for a test. Without this patch, the igb-driver initialized 
correctly and the network controller worked. So, I assume, there is 
still an issue with other than "pci_generic_config_read32" access.

So, I want to say, that if I use pci_generic_config_{read,write}32() for 
all accesses, the network controller works for me. And it doesn't work, 
if I use the tegra_pcie_config_{read,write}() functions for accesses.

I didn´t try it with a recent kernel. I assume, more modifications of 
the Toradex-patchset are necessary to get it to work. If you intend to 
track this issue for the recent kernel, I could give it a try..

     Bernd

[1] git://kernel.ubuntu.com/ubuntu/ubuntu-bionic.git
[2] https://patchwork.kernel.org/patch/9967399/
[3] 
http://git.toradex.com/cgit/meta-toradex-tegra.git/tree/recipes-kernel/linux/linux-toradex-mainline-4.14?h=rocko)
[4] patch1 below

--- patch1 ---
diff --git a/drivers/iio/adc/apalis-tk1-k20_adc.c 
b/drivers/iio/adc/apalis-tk1-k20_adc.c
index b45e51df5c81..8a9d90b2f77d 100644
--- a/drivers/iio/adc/apalis-tk1-k20_adc.c
+++ b/drivers/iio/adc/apalis-tk1-k20_adc.c
@@ -87,7 +87,7 @@ static int apalis_tk1_k20_adc_read_raw(struct iio_dev 
*indio_dev,

  static const struct iio_info apalis_tk1_k20_adc_info = {
         .read_raw = &apalis_tk1_k20_adc_read_raw,
-       .driver_module = THIS_MODULE,
  };
--- patch1 ---

Am 07.05.2019 um 21:39 schrieb Thierry Reding:
> On Tue, May 07, 2019 at 04:03:37PM +0200, Bernd Kubu wrote:
>> Hello Thierry,
>>
>> I have troubles with this patch:https://patchwork.kernel.org/patch/9967399/
>>
>> My Intel Ethernet Network Controller (igb [8086:157b]) on the "Toradex Apalis
>> TK1 2GB V1.1A" does not work with the current Ubuntu Bionic Kernel (with
>> patches fromhttp://git.toradex.com/cgit/meta-toradex-tegra.git/tree/
>> recipes-kernel/linux/linux-toradex-mainline-4.14?h=rocko).
> Looks like the baseline for that is 4.14. The patch that you referenced
> above was applied to 4.15 and is not part of that Toradex patchset
> either, so...
>
>> I get the following messages in dmesg:
>> [    4.913881] pci 0000:01:00.0: [8086:157b] type 10 class 0x020000
>> [    4.913913] pci 0000:01:00.0: unknown header type 10, ignoring device
>>
>> After removing the changes from the patchhttps://patchwork.kernel.org/patch/
>> 9967399/
>> ---------
>>
>>> +}
>>> +
>>>   static struct pci_ops tegra_pcie_ops = {
>>>          .add_bus = tegra_pcie_add_bus,
>>>          .remove_bus = tegra_pcie_remove_bus,
>>>          .map_bus = tegra_pcie_map_bus,
>>> -       .read = pci_generic_config_read32,
>>> -       .write = pci_generic_config_write32,
>>> +       .read = tegra_pcie_config_read,
>>> +       .write = tegra_pcie_config_write,
>>>   };
>>>
>> ------
>>
>> the Network Controller work.
>> So it seems this model has issues with other than 32-bit access.
> ... I'm not sure how that would be related here. Unless I'm misunder-
> standing what you're saying. You are saying that if you use
> pci_generic_config_{read,write}32() for all accesses, that the network
> controller works for you? And it doesn't work if you use the
> tegra_pcie_config_{read,write}() functions for accesses?
>
> I'd be somewhat surprised if this wasn't working. I'm not aware of any
> similar reports against the upstream kernel. Have you tried building a
> recent linux-next, or -rc or something like the latest release (5.1)?
>
> Adding Marcel here, perhaps he's encountered a similar issue. Also
> adding the linux-tegra mailing list for broader visibility.
>
> Thierry
>
>> Best regards,
>>
>>      Bernd
>>
>> --
>> Bernd Kubu - IT Services
>>
>> Heufeldstrasse 24
>> A-2640 Gloggnitz
>>
>> Tel.: +43-699-13002768
>> E-Mail:mailto:bernd@kubu.at
>>

