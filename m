Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D43A1445AC
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Jan 2020 21:12:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgAUUMR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Jan 2020 15:12:17 -0500
Received: from mail-ed1-f54.google.com ([209.85.208.54]:33392 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgAUUMR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Jan 2020 15:12:17 -0500
Received: by mail-ed1-f54.google.com with SMTP id r21so4381504edq.0;
        Tue, 21 Jan 2020 12:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OLMvn6qeOr15jGIjyjZjXJ6NUS+PfMqPuEabnOb39AQ=;
        b=pPsuwgqaLnKUQ+KkW5cZMrESXmYrTs8BCgw4VHkxOo7GTrpRQeKj3RDMsBUgayS2Eu
         gmibZooVmOu2Yy7cWwBg9h1LszRrqnTconCFTzuSboP0JYEAXZ2xFNbcHWgHnT93ZQ0x
         Ul/368z+8ILUu7lquLvOv9IWJwR0Tc2RZp1wJGQ9UuvHuAhRI5hKVAU0W/colFWNiljF
         0TSRqGHS5e/EIr1WVrnsSAxxFjt7xjr53yCBFJTS03Yc16gh7tG1uhxxRo658XG6Hc6K
         qLIYLGggwPYeGBi3YSj0Cmwt/Kvra/f/JXkc1IJNefv36zx3nwtUJnYF47d6CTotgMjG
         OHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OLMvn6qeOr15jGIjyjZjXJ6NUS+PfMqPuEabnOb39AQ=;
        b=MWuXEB04efuM30AM0HrV5te7L74zro12aNB31IpOxCMFwY+oDJp3xNVrXdjGqop94z
         sT+Vl6dU/RiScX3Z7RMnkyEQSuLH30XrFlggotrXcheSo19o10Yhbc+RU6AFGhRuQ4Y8
         De6RGc5P3oHVyu4pEFRoViRP+EFr0qGJZ8eCmn6WI/2mWMm35JaVD8x6hJmOm695qxjF
         YWSBV2QihI7Y2BzvxPJRKZhZscCillSFKdDVzlaDP49NfxUdXo5R6+JUXYEqWg0oTzV2
         uPjmNMP3mkXmnkM197f7uXfTGIm69S8xx51Bo7V2bgJzD5Bd7uOtasE8j8KlvfmVsqv2
         y4YA==
X-Gm-Message-State: APjAAAV5rbjLc5RWi4DEQlFyouezPcQmwzH0NEpO0cZp7xMC5UMHyflb
        1JXkkQc6dguCaIBeUvd50WHZVAY2
X-Google-Smtp-Source: APXvYqynFhrGtqU03CqFM5l76JkmVk0ezg/LO1hLHZOEy5T6L8435G6v+u8bUWHgo4NNSfsEj/4lfg==
X-Received: by 2002:a17:906:5210:: with SMTP id g16mr5885432ejm.305.1579637534590;
        Tue, 21 Jan 2020 12:12:14 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q18sm1192844eje.34.2020.01.21.12.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 12:12:13 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
Date:   Tue, 21 Jan 2020 23:12:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200121155432.GA912205@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.01.2020 18:54, Thierry Reding пишет:
> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
>> On 1/21/20 16:10, Thierry Reding wrote:
>>> On Tue, Jan 21, 2020 at 09:53:48AM +0300, Dmitry Osipenko wrote:
>>>> 20.01.2020 18:06, Thierry Reding пишет:
>>>>> On Fri, Jan 17, 2020 at 05:23:43PM +0200, Georgi Djakov wrote:
>>>>>> Hi Thierry,
>>>>>>
>>>>>> Thanks for the patch!
>>>>>>
>>>>>> On 1/14/20 20:15, Thierry Reding wrote:
>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>
>>>>>>> Document the interconnects property that is used to describe the paths
>>>>>>> from and to system memory from and to the BPMP.
>>>>>>>
>>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>>> ---
>>>>>>> Rob, Georgi,
>>>>>>>
>>>>>>> after the initial RFC that I did for adding interconnect properties on
>>>>>>> Tegra, I realized that the description wasn't complete. This is an
>>>>>>> attempt at a more accurate description, but unfortunately I'm not sure
>>>>>>> if it's even correct in terms of the interconnect bindings.
>>>>>>>
>>>>>>> The problem here is that on Tegra, each device has multiple paths to
>>>>>>> system memory, and I have no good idea on what to pick as the default.
>>>>>>> They are all basically the same path, but each provides extra controls
>>>>>>> to configure the "interconnect".
>>>>>>
>>>>>> Are these multiple paths between a device and system memory used simultaneously
>>>>>> for load-balancing, or who makes the decision about which path would be used?
>>>>>
>>>>> It varies. The vast majority of these paths are read/write pairs, which
>>>>> can be configured separately. There are also cases where multiple paths
>>>>> are used for load-balancing and I don't think there's any direct
>>>>> software control over which path will be used.
>>>>>
>>>>> A third class is where you have one device, but two read/write pairs,
>>>>> one which is tied to a microcontroller that's part of the device, and
>>>>> another read/write pair that is used for DMA to/from the device.
>>>>>
>>>>> Often in the latter case, the microcontroller memory client interfaces
>>>>> will be used by the microcontroller to read firmware and once the micro-
>>>>> controller has booted up, the DMA memory client interfaces will be used
>>>>> to read/write system memory with bulk data (like frame buffers, etc.).
>>>>>
>>>>>> Is this based on the client/stream ID that you mentioned previously?
>>>>>
>>>>> These are now all what's call memory client IDs, which identify the
>>>>> corresponding interface to the memory controller. Stream IDs are
>>>>> slightly higher-level and typically identify the "module" that uses
>>>>> the SMMU. Generally a stream ID is mapped to one or more memory client
>>>>> IDs.
>>>>>
>>>>>> Looking at the the binding below, it seems to me like there are different
>>>>>> master/slave pairs between MC and EMC and each link is used for
>>>>>> unidirectional traffic only. In terms of the interconnect API, both read
>>>>>> and write paths have the same direction.
>>>>
>>>> Yes, that definition should be incorrect.
>>>>
>>>>> I'm not sure I understand what you mean by this last sentence. Are you
>>>>> saying that each path in terms of the interconnect API is a always a
>>>>> bidirectional link?
>>>>
>>>> Please see more below.
>>>>
>>>>>> Is the EMC really an interconnect provider or is it just a slave port? Can
>>>>>> we scale both EMC and MC independently?
>>>>>
>>>>> The EMC is the only one where we can scale the frequency, but the MC has
>>>>> various knobs that can be used to fine-tune arbitration, set maximum
>>>>> latency, etc.
>>>>
>>>> Yes..
>>>>
>>>>
>>>> EMC controls the total amount of available memory bandwidth, things like
>>>> DRAM timing and EMC-DRAM channel's performance. EMC is facing MC from
>>>> one side and DRAM (EMEM) from the other.
>>>>
>>
>> Right, so we can use the icc framework here to aggregate the requested bandwidth
>> from all clients and scale the frequency/voltage of EMC.
> 
> Yeah, that was the plan. Dmitry's patches implement most of that. Note
> that we're working on this from two sides: on one hand we need to figure
> out the bindings so that we can set up the interconnect paths, then the
> memory controller and external memory controller drivers need to be made
> interconnect providers so that we can actually implement the dynamic
> scaling (and then finally all memory client drivers need to be updated
> to actually use these ICC framework to request bandwidth).
> 
> I'm prioritizing the first issue right now because that's currently a
> blocker for enabling SMMU support on Tegra194 where we need to set the
> DMA mask based on the "bus" (i.e. DMA parent, i.e. the MC) because there
> are additional restrictions that don't exist on prior generations where
> we can simply set the DMA mask to the device's "native" DMA mask.
> 
> EMC frequency scaling is slightly lower on my priority list because in
> most use-cases there is enough bandwidth at the default EMC frequency.
> 
>>>> MC controls allocation of that total bandwidth between the memory
>>>> clients. It has knobs to prioritize clients, the knobs are per
>>>> read/write port. MC is facing memory clients from one side and EMC from
>>>> the other.
>>>>
>>
>> Thanks for clarifying! So are these QoS knobs (priority, latency etc.) tuned
>> dynamically during runtime or is it more like a static configuration that is
>> done for example just once during system boot?
> 
> The hardware defaults are usually sufficient unless the system is under
> very high memory pressure. I'm only aware of one case where we actually
> need to override the hardware default on boot and it's exotic enough to
> not be upstream yet.
> 
> Ultimately we want to tune these at runtime, typically together with and
> depending on the EMC frequency. Under memory pressure you can use the
> "latency allowance" registers to prioritize memory requests from
> isochronous clients (like display controllers) to ensure they don't
> underrun.

Perhaps USB could be one example of a memory client that may need ISO
transfers for multimedia things (live audio/video), while ISO not needed
for file transfers.

> Given that we only have to tune these under somewhat extreme conditions,
> I think these are lower priority from an implementation point of view
> than the EMC frequency scaling, but the registers are based on the
> memory client IDs, so I think it's convenient to have those be part of
> the bindings in the first place.
> 
>>>>> I vaguely recall Dmitry mentioning that the EMC in early generations of
>>>>> Tegra used to have controls for individual memory clients, but I don't
>>>>> see that in more recent generations.
>>>>
>>>> EMC doesn't have direct controls over memory clients on all Tegra SoCs,
>>>> but it may have some extra knobs for the MC arbitration config.
>>>>
>>>> The MC bandwidth allocation logic and hardware programming interface
>>>> differs among SoC generations, but the basic principle is the same.
>>>>
>>>>>>> Any ideas on how to resolve this? Let me know if the DT bindings and
>>>>>>> example don't make things clear enough.
>>>>
>>>> I'm also interested in the answer to this question.
>>>>
>>>> A quick thought.. maybe it could be some new ICC DT property which tells
>>>> that all paths are the "dma-mem":
>>>>
>>>> 	interconnects-all-dma-mem;
>>>
>>> There could easily be cases where multiple interconnects are to system
>>> memory but there are additional ones which aren't, so the above wouldn't
>>> be able to represent such cases.
>>
>> Yes, true.

Sure, but then that property shouldn't be used.

Anyways, I think Thierry's suggestion about the generic memory
controller API sounds more attractive.

>>>>>>>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
>>>>>>>  1 file changed, 59 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>>>> index dabf1c1aec2f..d40fcd836e90 100644
>>>>>>> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
>>>>>>> @@ -43,6 +43,24 @@ properties:
>>>>>>>        - enum:
>>>>>>>            - nvidia,tegra186-bpmp
>>>>>>>  
>>>>>>> +  interconnects:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>> +    description: A list of phandle and specifier pairs that describe the
>>>>>>> +      interconnect paths to and from the BPMP.
>>>>>>> +
>>>>>>> +  interconnect-names:
>>>>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>>>>>> +    description: One string for each pair of phandle and specifier in the
>>>>>>> +      "interconnects" property.
>>>>>>> +    # XXX We need at least one of these to be named dma-mem so that the core
>>>>>>> +    # will set the DMA mask based on the DMA parent, but all of these go to
>>>>>>> +    # system memory eventually.
>>>>>>> +    items:
>>>>>>> +      - const: dma-mem
>>>>>>> +      - const: dma-mem
>>>>>>> +      - const: dma-mem
>>>>>>> +      - const: dma-mem
>>>>
>>>> Names should be unique, otherwise it's not possible to retrieve ICC path
>>>> other than the first one.
>>>
>>> Yeah, I know, that's why there's an XXX comment. =) I just wasn't sure
>>> what else to put there and thought this kinda made it clear that it was
>>> only half-baked.
>>>
>>>>>>>    iommus:
>>>>>>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>      description: |
>>>>>>> @@ -152,8 +170,43 @@ additionalProperties: false
>>>>>>>  
>>>>>>>  examples:
>>>>>>>    - |
>>>>>>> +    #include <dt-bindings/clock/tegra186-clock.h>
>>>>>>>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>>>      #include <dt-bindings/mailbox/tegra186-hsp.h>
>>>>>>> +    #include <dt-bindings/memory/tegra186-mc.h>
>>>>>>> +
>>>>>>> +    mc: memory-controller@2c00000 {
>>>>>>> +        compatible = "nvidia,tegra186-mc";
>>>>>>> +        reg = <0x02c00000 0xb0000>;
>>>>>>> +        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> +        status = "disabled";
>>>>>>> +
>>>>>>> +        #interconnect-cells = <1>;
>>>>>>> +        #address-cells = <2>;
>>>>>>> +        #size-cells = <2>;
>>>>>>> +
>>>>>>> +        ranges = <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * Memory clients have access to all 40 bits that the memory
>>>>>>> +         * controller can address.
>>>>>>> +         */
>>>>>>> +        dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
>>>>>>> +
>>>>>>> +        #memory-controller-cells = <0>;
>>>>>>> +
>>>>>>> +        emc: external-memory-controller@2c60000 {
>>>>>>> +            compatible = "nvidia,tegra186-emc";
>>>>>>> +            reg = <0x0 0x02c60000 0x0 0x50000>;
>>>>>>> +            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>>>>>>> +            clocks = <&bpmp TEGRA186_CLK_EMC>;
>>>>>>> +            clock-names = "emc";
>>>>>>> +
>>>>>>> +            #interconnect-cells = <0>;
>>>>>>> +
>>>>>>> +            nvidia,bpmp = <&bpmp>;
>>>>>>> +        };
>>>>>>> +    };
>>>>>>>  
>>>>>>>      hsp_top0: hsp@3c00000 {
>>>>>>>          compatible = "nvidia,tegra186-hsp";
>>>>>>> @@ -187,6 +240,12 @@ examples:
>>>>>>>  
>>>>>>>      bpmp {
>>>>>>>          compatible = "nvidia,tegra186-bpmp";
>>>>>>> +        interconnects = <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>>>>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
>>>>>>> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>>>>>>> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
>>>>
>>>> I don't think this is a correct definition of the ICC paths because the
>>>> first node-MC_ID pair should define the source, second pair is the final
>>>> destination. Then the interconnect core builds (by itself) the path from
>>>> MC client to MC and finally to EMC based on the given source /
>>>> destination. Please see my v1 patchset for the example.
>>>
>>> Okay, sounds like "source" in this case means the initiator of the
>>> transaction and destination is the target of the transaction. I had
>>> interpreted the "source" as the "source location" of the transaction (so
>>> for reads the source would be the system memory via the EMC, and for
>>> writes the source would be the memory client interface).
>>
>> Yes, exactly. Maybe it would be more correct to call these pairs
>> initiator/target or master/slave.
> 
> Do you want me to extend the bindings documentation to mention these
> alternative names?
> 
>>> Yeah, I think that makes sense. It was also pointed out to me (offline)
>>> that the above doesn't work as intented for the use-case where I really
>>> need it. The primary reason why I need these "dma-mem" interconnect
>>> paths is so that the memory controller is specified as the "DMA parent"
>>> for these devices, which is important so that the DMA masks can be
>>> correctly set. Having the &emc reference in the first slot breaks that.
>>> Your suggestion makes sense when interpreting the terminology
>>> differently and it fixes the DMA parent issue (at least partially).
>>>
>>>> It should look somewhat like this:
>>>>
>>>> interconnects =
>>>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc TEGRA_ICC_EMEM>,
>>>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc TEGRA_ICC_EMEM>,
>>>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc TEGRA_ICC_EMEM>,
>>>>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc TEGRA_ICC_EMEM>;
>>>>
>>>> interconnect-names = "bpmpr", "bpmpw", "bpmpdmar", "bpmpdmaw";
>>
>> This looks better to me.
>>
>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's always
>>> going to be the same and it's arbitrarily defined, so it's effectively
>>> useless. But other than that it looks good.
>>
>> Well, in most cases the target would be the EMEM, so that's fine. I have seen
>> that other vendors that may have an additional internal memory, especially
>> dedicated to some DSPs and in such cases the bandwidth needs are different for
>> the two paths (to internal memory and DDR).
> 
> Most chips have a small internal memory that can be used, though it
> seldomly is. However, in that case I would expect the target to be a
> completely different device, so it'd look more like this:
> 
> 	interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
> 			...;
> 
> I don't think EMEM has any "downstream" other than external memory.

The node ID should be mandatory in terms of interconnect, even if it's a
single node. EMC (provider) != EMEM (endpoint).
