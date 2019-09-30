Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48405C2395
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Sep 2019 16:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731561AbfI3Oqh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Sep 2019 10:46:37 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:38629 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfI3Oqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Sep 2019 10:46:37 -0400
Received: by mail-lj1-f182.google.com with SMTP id b20so9790904ljj.5
        for <linux-tegra@vger.kernel.org>; Mon, 30 Sep 2019 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RhZLUCf3xmRuQlJ6rsmn8mMVhhGPPIEfdV2LXcocSFg=;
        b=RzfRYMBjWg+yAiPk+RhSEfFaMuQV2wyFQoN9QhRpPY1IIoChoOEodHnRm7rvVXfn5a
         L45h94ZeNrxKmCqVcOuQoy1lbZReZQ6uwlQXmPmmm8VqrDMet6xN7FzWk5xSRI424EeQ
         PfiE2SZzh/BjSRsn91/UZCPGjEoZsIuWO5T9ZHMM9ILFp5cn+mAqIDOnVOJgh55BO+1l
         h/yQOvQ7IiKlAvmgXzI/F2tgSajchlOgotCmsdYf0Na/BSkWEuCiuTIupZcZ5IoVoMIl
         6U98RL6wU3HMTWyhgpvIP56WouBnLzbhGdnAq3WmpMRrRQOofsqfpEbx/eBbArJfKF86
         bBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RhZLUCf3xmRuQlJ6rsmn8mMVhhGPPIEfdV2LXcocSFg=;
        b=iBAiutj4DLg+7Hg+FvG31qsHT4LQ2NLAJetaVYTnNvAzY/3NCOAtbJEk1q2U6e94mW
         J3qevKhQeZWgG+g2SjAlf1nDvkKKCH5xOGOf9oon8lnEG6u/wjJUrNF07NPa87f1VBg8
         +tvqEze62Hiz04aZX3mm+UpvOe9UzuojODmwaSxWNwPey+38Z3qrNRs9XSr57XByEhWb
         q43tNpluv9Tl0i7bmher1NwtvzlGP/LbL3lGUqJgcR6ekXFgL1DM7OCRWRLVGi523RlM
         Orh3qusTE6vXzoFa1Btnu4LdGqcCgmNlXjwrVK3zA6xgZamn8B6qAb7iJz3soN5gXTdv
         /mVg==
X-Gm-Message-State: APjAAAXJDj4shMKbVDXGBKBwxVHkkeqh/KzSzB72n9eUt5W51KY7f3ua
        TqHeAaPQYMZiiB4beuAJN1BO/CFy
X-Google-Smtp-Source: APXvYqxAEh6bTrfi23BniJ/SUxjxwK6keSfwyfesSS7BEzb6QE2wW2VMqah3bNS8rIBUqU9G5tMPqg==
X-Received: by 2002:a2e:2bda:: with SMTP id r87mr12344582ljr.3.1569854794805;
        Mon, 30 Sep 2019 07:46:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id o13sm3477783lji.31.2019.09.30.07.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 07:46:34 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Geis <pgwipeout@gmail.com>, Peter Chen <peter.chen@nxp.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
Date:   Mon, 30 Sep 2019 17:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.09.2019 03:33, Peter Geis пишет:
> Good Evening,
> 
> While testing Dmitry's cpuidle driver I found that tegra-udc is broken
> completely on linux-next.
> Even in peripheral mode, disconnected from the host, it locks at the same place.
> 
> [    2.864983] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.871723] tegra-ehci: Tegra EHCI driver
> [    2.880593] tegra-ehci 7d004000.usb: EHCI Host Controller
> [    2.886484] tegra-ehci 7d004000.usb: new USB bus registered,
> assigned bus number 1
> [    2.895250] tegra-ehci 7d004000.usb: irq 88, io mem 0x7d004000
> [    2.916528] tegra-ehci 7d004000.usb: USB 2.0 started, EHCI 1.00
> [    2.927441] hub 1-0:1.0: USB hub found
> [    2.931479] hub 1-0:1.0: 1 port detected
> [    2.939124] usbcore: registered new interface driver cdc_acm
> [    2.944889] cdc_acm: USB Abstract Control Model driver for USB
> modems and ISDN adapters
> [    2.953185] usbcore: registered new interface driver cdc_wdm
> [    2.959107] usbcore: registered new interface driver uas
> [    2.964824] usbcore: registered new interface driver usb-storage
> [    2.974726] tegra-udc 7d000000.usb: 7d000000.usb supply vbus not
> found, using dummy regulator
> [    2.990506] ci_hdrc ci_hdrc.0: EHCI Host Controller
> [    2.992320] udc ci_hdrc.0: registering UDC driver [g_ncm]
> [    2.995708] ci_hdrc ci_hdrc.0: new USB bus registered, assigned bus number 2
> [    3.001232] using random self ethernet address
> [    3.012631] using random host ethernet address
> [    3.017190] g_ncm gadget: adding config #1 'CDC Ethernet (NCM)'/(ptrval)
> [    3.020523] ci_hdrc ci_hdrc.0: USB 2.0 started, EHCI 1.00
> [    3.024058] g_ncm gadget: adding 'cdc_network'/(ptrval) to config
> 'CDC Ethernet (NCM)'/(ptrval)
> [    3.033578] hub 2-0:1.0: USB hub found
> [    3.041721] usb0: HOST MAC 9e:a2:94:94:76:53
> [    3.042085] hub 2-0:1.0: 1 port detected
> [    3.046706] usb0: MAC b2:13:8e:20:a9:fa
> [    3.054215] g_ncm gadget: CDC Network: dual speed IN/ep1in
> OUT/ep1out NOTIFY/ep2in
> [    3.061861] g_ncm gadget: cfg 1/(ptrval) speeds: high full
> [    3.067402] g_ncm gadget:   interface 0 = cdc_network/(ptrval)
> [    3.073292] g_ncm gadget:   interface 1 = cdc_network/(ptrval)
> [    3.079206] g_ncm gadget: NCM Gadget
> [    3.082843] g_ncm gadget: g_ncm ready
> [    3.091020] rtc rtc1: alarm rollover: day
> [    3.096710] tegra_rtc 7000e000.rtc: char device (253:1)
> [    3.102059] tegra_rtc 7000e000.rtc: registered as rtc1
> [    3.107257] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
> [    3.114270] i2c /dev entries driver
> [    3.118781] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
> [    3.128234] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
> [    3.135069] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 busy
> [    3.141875] tegra-apbdma 6000a000.dma: private_candidate: dma0chan0 busy
> [    3.148644] tegra-apbdma 6000a000.dma: private_candidate: dma0chan1 busy
> [    3.155402] tegra-apbdma 6000a000.dma: private_candidate: dma0c
> 
> Thank you for your time,
> Peter
> 

Do you mean that it works when:

a) the cpuidle patches are *not* applied
b) with cpuidle patches applied and USB driver being disabled

The UDC driver works perfectly fine for me, I'm using it all the time on
T20 and T30.
