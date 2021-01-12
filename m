Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E03C2F3958
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Jan 2021 20:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406123AbhALTBA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Jan 2021 14:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406050AbhALTBA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 14:01:00 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0838BC0617A3;
        Tue, 12 Jan 2021 11:00:16 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id f11so4045792ljm.8;
        Tue, 12 Jan 2021 11:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kSYMm9Qq4N685ShV8dyh50lqZB8G0r2WN+O0NtF4m8E=;
        b=btMwduI6eiU4llK4WLZi/CC8OfizZjUdny3TdO4C1wde+Hfv63VBF1IR23jkF9p/ed
         mNnML2esaPvE8sUMFR+apBBf1x/GzmCNWb7IgM8eLAVHolWTwFKRKV6WFj7HsJgNRYgf
         x8jERTkUCwASRlUTpm0yLCxSUOgGV6hYaz3wuCoRNcdbyj2qMNKex3FMCAFt/72gC7Z2
         4kyxGGP390ZhG33VHZsfpxlmWF/8h+Yj3OGQi+mT+ijGcJst1rY/8MQuJilPexMIZARC
         7v5o0FCwlpBF+L9XNRPAyk29K/H+PNRy86bGlHX8Y5K7zlykjCxj7Uy4PFCmnIx5ITmx
         +4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kSYMm9Qq4N685ShV8dyh50lqZB8G0r2WN+O0NtF4m8E=;
        b=Zou5cEGhkigdQ/dIwSGEKONNJSQ4sDWq3PlVqEq/BETsi+me1FZDu/erT3WMxJq3Ho
         3I2x1vf4z6zj2/liXd7uGluC+gXE6Vasx6KUc6MmMZW50V5q1gP0Rnv5YOmDnmoNejEl
         sIqumm9u2uikM9zbQHcuae0+ml/Ftut1jLhfKGr4TNiz+frbiezTjoj5DFYtJDAqzlVP
         moEBsA3H7sbiT0VfzhANVBo8E/Teur/I8h7NpgZCL/zdw8ze3vGhq5X7Mg4gE+xV89kO
         PHc16F2Q5J2SG8b3k99Gfb76szYdNgtmyd2lgTgIb0lhTNHeYVEMRibz36Zmv2i+bEes
         fLng==
X-Gm-Message-State: AOAM531+PIYPKcW3hU3kqGXudAP022rALHcbOhw+PTwemytOvz0Hvpzn
        35qWT3mTCFgsVmKszbXQGKufhIUEBH0=
X-Google-Smtp-Source: ABdhPJz03AZZ+wQ8mTAcDNUamvMfV+DwMi7wmX/U1o7MrzVR9wknMgdTSdSLuyFa3EFp9f/TvzcJMw==
X-Received: by 2002:a2e:8695:: with SMTP id l21mr270007lji.151.1610478014162;
        Tue, 12 Jan 2021 11:00:14 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id e11sm497952lfn.28.2021.01.12.11.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 11:00:13 -0800 (PST)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <20201105154928.GA485884@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <69705240-a82a-5769-8f43-9f552e70be61@gmail.com>
Date:   Tue, 12 Jan 2021 22:00:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201105154928.GA485884@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.11.2020 18:49, Thierry Reding пишет:
> On Thu, Sep 24, 2020 at 07:23:34PM +0300, Dmitry Osipenko wrote:
>> 24.09.2020 17:01, Thierry Reding пишет:
>>> On Thu, Sep 24, 2020 at 04:23:59PM +0300, Dmitry Osipenko wrote:
>>>> 04.09.2020 15:59, Thierry Reding пишет:
>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>
>>>>> Reserved memory regions can be marked as "active" if hardware is
>>>>> expected to access the regions during boot and before the operating
>>>>> system can take control. One example where this is useful is for the
>>>>> operating system to infer whether the region needs to be identity-
>>>>> mapped through an IOMMU.
>>>>>
>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>> ---
>>>>>  .../bindings/reserved-memory/reserved-memory.txt           | 7 +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>>> index 4dd20de6977f..163d2927e4fc 100644
>>>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>>> @@ -63,6 +63,13 @@ reusable (optional) - empty property
>>>>>        able to reclaim it back. Typically that means that the operating
>>>>>        system can use that region to store volatile or cached data that
>>>>>        can be otherwise regenerated or migrated elsewhere.
>>>>> +active (optional) - empty property
>>>>> +    - If this property is set for a reserved memory region, it indicates
>>>>> +      that some piece of hardware may be actively accessing this region.
>>>>> +      Should the operating system want to enable IOMMU protection for a
>>>>> +      device, all active memory regions must have been identity-mapped
>>>>> +      in order to ensure that non-quiescent hardware during boot can
>>>>> +      continue to access the memory.
>>>>>  
>>>>>  Linux implementation note:
>>>>>  - If a "linux,cma-default" property is present, then Linux will use the
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Could you please explain what devices need this quirk? I see that you're
>>>> targeting Tegra SMMU driver, which means that it should be some pre-T186
>>>> device.
>>>
>>> Primarily I'm looking at Tegra210 and later, because on earlier devices
>>> the bootloader doesn't consistently initialize display. I know that it
>>> does on some devices, but not all of them.
>>
>> AFAIK, all tablet devices starting with Tegra20 that have display panel
>> are initializing display at a boot time for showing splash screen. This
>> includes all T20/T30/T114 tablets that are already supported by upstream
>> kernel.
>>
>>> This same code should also
>>> work on Tegra186 and later (with an ARM SMMU) although the situation is
>>> slightly more complicated there because IOMMU translations will fault by
>>> default long before these identity mappings can be established.
>>>
>>>> Is this reservation needed for some device that has display
>>>> hardwired to a very specific IOMMU domain at the boot time?
>>>
>>> No, this is only used to convey information about the active framebuffer
>>> to the kernel. In practice the DMA/IOMMU code will use this information
>>> to establish a 1:1 mapping on whatever IOMMU domain that was picked for
>>> display.
>>>
>>>> If you're targeting devices that don't have IOMMU enabled by default at
>>>> the boot time, then this approach won't work for the existing devices
>>>> which won't ever get an updated bootloader.
>>>
>>> If the devices don't use an IOMMU, then there should be no problem. The
>>> extra reserved-memory nodes would still be necessary to ensure that the
>>> kernel doesn't reuse the framebuffer memory for the slab allocator, but
>>> if no IOMMU is used, then the display controller accessing the memory
>>> isn't going to cause problems other than perhaps scanning out data that
>>> is no longer a framebuffer.
>>>
>>> There should also be no problem for devices with an old bootloader
>>> because this code is triggered by the presence of a reserved-memory node
>>> referenced via the memory-region property. Devices with an old
>>> bootloader should continue to work as they did before. Although I
>>> suppose they would start faulting once we enable DMA/IOMMU integration
>>> for Tegra SMMU if they have a bootloader that does initialize display to
>>> actively scan out during boot.
>>>
>>>> I think Robin Murphy already suggested that we should simply create
>>>> a dummy "identity" IOMMU domain by default for the DRM/VDE devices and
>>>> then replace it with an explicitly created domain within the drivers.
>>>
>>> I don't recall reading about that suggestion. So does this mean that for
>>> certain devices we'd want to basically passthrough by default and then
>>> at some point during boot take over with a properly managed IOMMU
>>> domain?
>>
>> Yes, my understanding that this is what Robin suggested here:
>>
>> https://lore.kernel.org/linux-iommu/cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com/
>>
>>> The primary goal here is to move towards using the DMA API rather than
>>> the IOMMU API directly, so we don't really have the option of replacing
>>> with an explicitly created domain. Unless we have code in the DMA/IOMMU
>>> code that does this somehow.
>>>
>>> But I'm not sure what would be a good way to mark certain devices as
>>> needing an identity domain by default. Do we still use the reserved-
>>> memory node for that?
>>
>> The reserved-memory indeed shouldn't be needed for resolving the
>> implicit IOMMU problem since we could mark certain devices within the
>> kernel IOMMU driver.
>>
>> I haven't got around to trying to implement the implicit IOMMU support
>> yet, but I suppose we could implement the def_domain_type() hook in the
>> SMMU driver and then return IOMMU_DOMAIN_IDENTITY for the Display/VDE
>> devices. Then the Display/VDE drivers will take over the identity domain
>> and replace it with the explicit domain.
> 
> Actually, the plan (and part of the reason for this patch) is to
> transition the display driver over to using the DMA API rather than
> creating IOMMU domains explicitly.
> 
> Explicit IOMMU usage currently works around this prior to Tegra186
> because IOMMU translations are not enabled until after the device has
> been attached to the IOMMU, at which point a mapping will already have
> been created. It's also part of the reason why we don't support DMA-
> type domains yet on Tegra SMMU, because as soon as we do, this would
> cause a fault storm during boot.
> 
> On Tegra186 this same problem exists because the driver does support DMA
> type domains and hence the kernel will try to set those up for display
> during early boot and before the driver has had a chance to set up
> mappings (or quiesce the display hardware).
> 
>>> That would still require some sort of flag to
>>> specify which reserved-memory regions would need this identity mapping
>>> because, as was pointed out in earlier review, some devices may have
>>> reserved-memory regions that are not meant to be identity mapped.
>>
>> Please note that the reserved-memory approach also creates problem for
>> selection of a large CMA region if FB is located somewhere in a middle
>> of DRAM.
>>
>> I already see that the FB's reserved-memory will break CMA for Nexus 7
>> and Acer A500 because CMA area overlaps with the bootloader's FB :)
>>
>> Also keep in mind that initrd needs a location too and location usually
>> hardwired in a bootloader. Hence it increases pressure on the CMA selection.
> 
> I do understand those issues, but there's really not a lot we can do
> about it. It's wrong for CMA to overlap with the framebuffer from which
> the display hardware just keeps scanning out, so all that these reserved
> memory nodes do is actually fix a long-standing bug (depending on how
> paranoid you are, you might even consider it a security hole).
> 
> For older devices that don't have a bootloader that properly defines
> this memory as reserved, they should be able to continue to use a CMA
> that overlaps with the framebuffer and work just like before.
> 
>>>> Secondly, all NVIDIA bootloaders are passing tegra_fbmem=... via
>>>> kernel's cmdline with the physical location of the framebuffer in
>>>> memory. Maybe we could support this option?
>>>
>>> I'm not a big fan of that command-line option, but I also realize that
>>> for older bootloaders that's probably the only option we have. I don't
>>> suppose all of the devices support U-Boot?
>>
>> Majority of devices in a wild don't use u-boot and they have a
>> locked-down bootloader. Still it's possible to chain-load u-boot or
>> bypass the "security" and replace the bootloader, but these approaches
>> aren't widely supported because they take a lot of effort to be
>> implemented and maintained.
>>
>> Even those devices that use proper u-boot usually never updating it and
>> are running some ancient version. You can't ignore all those people :)
> 
> I'm not trying to ignore all those people, but at the same time I don't
> think legacy devices about which we can't do much should prevent new
> devices from doing the right thing and properly reserving memory that
> the kernel isn't supposed to use.
> 
> You already suggested that we could choose an identity domain by default
> for VDE and display for this. That sounds like a good compromise to me,
> but I think we should do that only on platforms where we can't implement
> this properly.
> 
>>> Because ideally we'd just
>>> translate from tegra_fbmem=... to reserved-memory region there so that
>>> we don't have to carry backwards-compatibility code for these purely
>>> downstream bootloaders.
>>
>> IIRC, in the past Robin Murphy was suggesting to read out hardware state
>> early during kernel boot in order to find what regions are in use by
>> hardware.
>>
>> I think it should be easy to do for the display controller since we
>> could check clock and PD states in order to decide whether DC's IO could
>> be accessed and then read out the FB pointer and size. I guess it should
>> take about hundred lines of code.
>>
>> But the easiest way should be to ignore this trouble for devices that
>> have IOMMU disabled by default and simply allow display to show garbage.
>> Nobody ever complained about this for the past 7+ years :)
>>
>> Hence implementing the dummy-identity domain support should be enough
>> for solving the problem, at least this should work for pre-T186 devices.
> 
> I'd still like to do this properly at least on Tegra210 as well. It
> should be possible to come up with a set of criteria where the dummy
> identity domain should be used and where it shouldn't. I think that's
> the easiest part of this and can easily be implemented as a couple-of-
> lines quirk in some kernel driver.

Any solution should be fine as long as it doesn't break older devices.
If you'll have patches that will needs testing, then please feel free to
ping me.
