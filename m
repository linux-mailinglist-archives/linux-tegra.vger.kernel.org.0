Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47893CBB37
	for <lists+linux-tegra@lfdr.de>; Fri,  4 Oct 2019 15:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388114AbfJDNHC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 4 Oct 2019 09:07:02 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38617 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387573AbfJDNHC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 4 Oct 2019 09:07:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so5785742wmi.3
        for <linux-tegra@vger.kernel.org>; Fri, 04 Oct 2019 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vm1z/uavvzcNco78li22aMT/8VH/CtOLHUXqjy3VNvw=;
        b=qggUU/7xYmDTCv7Y+bDIRHpqkB+cqLUC3OFFqYf06cXZfsRlx1/wZQ8SJ0zh+z5b2U
         uWzb9k7BqFVf7x4mTuCm0gUhDXnHKlbcbscX79y2Fs4BIw9ct1QABAO/2AMKnRPub1uh
         C8N2VXEhtb9T1XSXEQfQ+gDDp8zXKzLixknHBaQoWl0rkHjWmBLpfPdLieiDLgdkRKAi
         FZqzaijmit9MS+AxtJtDP/KykYEXKKF8OyJaz7rI6Y+bnHwfMOkthg4t+fayN/M1yI+T
         TZFSXOtl510wUxDaHkCArbGqERUoGfOtwv+VGxLDyO9DlvoeCbNv+hoeExOCFs1zt4qZ
         mkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vm1z/uavvzcNco78li22aMT/8VH/CtOLHUXqjy3VNvw=;
        b=R0K+CmNCKMpqEu5BQQpmYEIeqjlOKpgzvmbQfxqrRXJxHbCanvcVGyx6aYjO+Irw/i
         5rgv/5W1QioL1x4xfoPjoag9aRrSreSdeltUAVSZ2SUJFMp11zTrnuWEsqdeERehugaH
         HgObiVKkj1G14xdRE8xCjLp5urOuwcWFvO+cht53P/EG21izQBVWiwB/4Jp0upnvP7pt
         DPAjS5gJanQ0WWSgRxuNESUIQExyWjbe7cOCXiCM8JYl7C2/IiZi4+AxhDuTE00rTLZU
         lhA2lfw5WKEEiBO3WWfHZzt153c9CBxN8Si2ZxAkPTu2yO8eKmPJmrqgIZ33llFuu7Vl
         XCXA==
X-Gm-Message-State: APjAAAWhkddw5xYFYoFcA71b4Ikd/Fy8cnU7FElHa3eEj1qJil/nf/Wa
        yCFOf+h3lVIKKmmRCFLbqGvlOTtilGJ/4Q==
X-Google-Smtp-Source: APXvYqydSCtT240YRFgQvQdRocBC3c84kZeadLtRSR5bdU9q4nIXOHFn/z4L9h8kkgZYx7fLb04t4A==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr11432427wmi.39.1570194419241;
        Fri, 04 Oct 2019 06:06:59 -0700 (PDT)
Received: from [192.168.0.136] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id o4sm573201wre.91.2019.10.04.06.06.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 06:06:58 -0700 (PDT)
Subject: Re: [PATCH] arm64: tegra: Set dma-ranges for memory subsystem
To:     Thierry Reding <thierry.reding@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>
References: <20191002154654.225690-1-thierry.reding@gmail.com>
 <20191002154946.GA225802@ulmo>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 mQINBFjTuRcBEACyAOVzghvyN19Sa/Nit4LPBWkICi5W20p6bwiZvdjhtuh50H5q4ktyxJtp
 1+s8dMSa/j58hAWhrc2SNL3fttOCo+MM1bQWwe8uMBQJP4swgXf5ZUYkSssQlXxGKqBSbWLB
 uFHOOBTzaQBaNgsdXo+mQ1h8UCgM0zQOmbs2ort8aHnH2i65oLs5/Xgv/Qivde/FcFtvEFaL
 0TZ7odM67u+M32VetH5nBVPESmnEDjRBPw/DOPhFBPXtal53ZFiiRr6Bm1qKVu3dOEYXHHDt
 nF13gB+vBZ6x5pjl02NUEucSHQiuCc2Aaavo6xnuBc3lnd4z/xk6GLBqFP3P/eJ56eJv4d0B
 0LLgQ7c1T3fU4/5NDRRCnyk6HJ5+HSxD4KVuluj0jnXW4CKzFkKaTxOp7jE6ZD/9Sh74DM8v
 etN8uwDjtYsM07I3Szlh/I+iThxe/4zVtUQsvgXjwuoOOBWWc4m4KKg+W4zm8bSCqrd1DUgL
 f67WiEZgvN7tPXEzi84zT1PiUOM98dOnmREIamSpKOKFereIrKX2IcnZn8jyycE12zMkk+Sc
 ASMfXhfywB0tXRNmzsywdxQFcJ6jblPNxscnGMh2VlY2rezmqJdcK4G4Lprkc0jOHotV/6oJ
 mj9h95Ouvbq5TDHx+ERn8uytPygDBR67kNHs18LkvrEex/Z1cQARAQABtChHZW9yZ2kgRGph
 a292IDxnZW9yZ2kuZGpha292QGxpbmFyby5vcmc+iQI+BBMBAgAoBQJY07kXAhsDBQkHhM4A
 BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyi/eZcnWWUuvsD/4miikUeAO6fU2Xy3fT
 l7RUCeb2Uuh1/nxYoE1vtXcow6SyAvIVTD32kHXucJJfYy2zFzptWpvD6Sa0Sc58qe4iLY4j
 M54ugOYK7XeRKkQHFqqR2T3g/toVG1BOLS2atooXEU+8OFbpLkBXbIdItqJ1M1SEw8YgKmmr
 JlLAaKMq3hMb5bDQx9erq7PqEKOB/Va0nNu17IL58q+Q5Om7S1x54Oj6LiG/9kNOxQTklOQZ
 t61oW1Ewjbl325fW0/Lk0QzmfLCrmGXXiedFEMRLCJbVImXVKdIt/Ubk6SAAUrA5dFVNBzm2
 L8r+HxJcfDeEpdOZJzuwRyFnH96u1Xz+7X2V26zMU6Wl2+lhvr2Tj7spxjppR+nuFiybQq7k
 MIwyEF0mb75RLhW33sdGStCZ/nBsXIGAUS7OBj+a5fm47vQKv6ekg60oRTHWysFSJm1mlRyq
 exhI6GwUo5GM/vE36rIPSJFRRgkt6nynoba/1c4VXxfhok2rkP0x3CApJ5RimbvITTnINY0o
 CU6f1ng1I0A1UTi2YcLjFq/gmCdOHExT4huywfu1DDf0p1xDyPA1FJaii/gJ32bBP3zK53hM
 dj5S7miqN7F6ZpvGSGXgahQzkGyYpBR5pda0m0k8drV2IQn+0W8Qwh4XZ6/YdfI81+xyFlXc
 CJjljqsMCJW6PdgEH7kCDQRY07kXARAAvupGd4Jdd8zRRiF+jMpv6ZGz8L55Di1fl1YRth6m
 lIxYTLwGf0/p0oDLIRldKswena3fbWh5bbTMkJmRiOQ/hffhPSNSyyh+WQeLY2kzl6geiHxD
 zbw37e2hd3rWAEfVFEXOLnmenaUeJFyhA3Wd8OLdRMuoV+RaLhNfeHctiEn1YGy2gLCq4VNb
 4Wj5hEzABGO7+LZ14hdw3hJIEGKtQC65Jh/vTayGD+qdwedhINnIqslk9tCQ33a+jPrCjXLW
 X29rcgqigzsLHH7iVHWA9R5Aq7pCy5hSFsl4NBn1uV6UHlyOBUuiHBDVwTIAUnZ4S8EQiwgv
 WQxEkXEWLM850V+G6R593yZndTr3yydPgYv0xEDACd6GcNLR/x8mawmHKzNmnRJoOh6Rkfw2
 fSiVGesGo83+iYq0NZASrXHAjWgtZXO1YwjW9gCQ2jYu9RGuQM8zIPY1VDpQ6wJtjO/KaOLm
 NehSR2R6tgBJK7XD9it79LdbPKDKoFSqxaAvXwWgXBj0Oz+Y0BqfClnAbxx3kYlSwfPHDFYc
 R/ppSgnbR5j0Rjz/N6Lua3S42MDhQGoTlVkgAi1btbdV3qpFE6jglJsJUDlqnEnwf03EgjdJ
 6KEh0z57lyVcy5F/EUKfTAMZweBnkPo+BF2LBYn3Qd+CS6haZAWaG7vzVJu4W/mPQzsAEQEA
 AYkCJQQYAQIADwUCWNO5FwIbDAUJB4TOAAAKCRCyi/eZcnWWUhlHD/0VE/2x6lKh2FGP+QHH
 UTKmiiwtMurYKJsSJlQx0T+j/1f+zYkY3MDX+gXa0d0xb4eFv8WNlEjkcpSPFr+pQ7CiAI33
 99kAVMQEip/MwoTYvM9NXSMTpyRJ/asnLeqa0WU6l6Z9mQ41lLzPFBAJ21/ddT4xeBDv0dxM
 GqaH2C6bSnJkhSfSja9OxBe+F6LIAZgCFzlogbmSWmUdLBg+sh3K6aiBDAdZPUMvGHzHK3fj
 gHK4GqGCFK76bFrHQYgiBOrcR4GDklj4Gk9osIfdXIAkBvRGw8zg1zzUYwMYk+A6v40gBn00
 OOB13qJe9zyKpReWMAhg7BYPBKIm/qSr82aIQc4+FlDX2Ot6T/4tGUDr9MAHaBKFtVyIqXBO
 xOf0vQEokkUGRKWBE0uA3zFVRfLiT6NUjDQ0vdphTnsdA7h01MliZLQ2lLL2Mt5lsqU+6sup
 Tfql1omgEpjnFsPsyFebzcKGbdEr6vySGa3Cof+miX06hQXKe99a5+eHNhtZJcMAIO89wZmj
 7ayYJIXFqjl/X0KBcCbiAl4vbdBw1bqFnO4zd1lMXKVoa29UHqby4MPbQhjWNVv9kqp8A39+
 E9xw890l1xdERkjVKX6IEJu2hf7X3MMl9tOjBK6MvdOUxvh1bNNmXh7OlBL1MpJYY/ydIm3B
 KEmKjLDvB0pePJkdTw==
Message-ID: <3eaff5c9-ee6d-faa2-4771-7eeb9f759c8b@linaro.org>
Date:   Fri, 4 Oct 2019 16:06:57 +0300
MIME-Version: 1.0
In-Reply-To: <20191002154946.GA225802@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/2/19 18:49, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 05:46:54PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> On Tegra194, all clients of the memory subsystem can generally address
>> 40 bits of system memory. However, bit 39 has special meaning and will
>> cause the memory controller to reorder sectors for block-linear buffer
>> formats. This is primarily useful for graphics-related devices.
>>
>> Use of bit 39 must be controlled on a case-by-case basis. Buffers that
>> are used with bit 39 set by one device may be used with bit 39 cleared
>> by other devices.
>>
>> Care must be taken to allocate buffers at addresses that do not require
>> bit 39 to be set. This is normally not an issue for system memory since
>> there are no Tegra-based systems with enough RAM to exhaust the 39-bit
>> physical address space. However, when a device is behind an IOMMU, such
>> as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
>> IOVA allocations to happen in this region. This is for example the case
>> when an operating system implements a top-down allocation policy for IO
>> virtual addresses.
>>
>> To account for this, describe the path that memory accesses take through
>> the system. Memory clients will send requests to the memory controller,
>> which forwards bits [38:0] of the address either to the external memory
>> controller or the SMMU, depending on the stream ID of the access. A good
>> way to describe this is using the interconnects bindings, see:
>>
>> 	Documentation/devicetree/bindings/interconnect/interconnect.txt
>>
>> The standard "dma-mem" path is used to describe the path towards system
>> memory via the memory controller. A dma-ranges property in the memory
>> controller's device tree node limits the range of DMA addresses that the
>> memory clients can use to bits [38:0], ensuring that bit 39 is not used.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Arnd, Rob, Robin,
>>
>> This is what I came up with after our discussion on this thread:
>>
>> 	[PATCH 00/11] of: dma-ranges fixes and improvements
>>
>> Please take a look and see if that sounds reasonable. I'm slightly
>> unsure about the interconnects bindings as I used them here. According
>> to the bindings there's always supposed to be a pair of interconnect
>> paths, so this patch is not exactly compliant. It does work fine with
>> the __of_get_dma_parent() code that Maxime introduced a couple of months
>> ago and really very neatly describes the hardware. Interestingly this
>> will come in handy very soon now since we're starting work on a proper
>> interconnect provider (the memory controller driver is the natural fit
>> for this because it has additional knobs to configure latency and
>> priorities, etc.) to implement external memory frequency scaling based
>> on bandwidth requests from memory clients. So this all fits together
>> very nicely. But as I said, I'm not exactly sure what to add as a second
>> entry in "interconnects" to make this compliant with the bindings.
>>

Sounds good to me. The bindings define the two endpoints, but the dma-mem is a
special case and just a single phandle + specifier is fine. Maybe we should
explicitly mention this in the interconnect binding docs. You can look at how
Maxime is using it now in sun5i.dtsi.

Thanks,
Georgi
