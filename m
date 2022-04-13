Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3334F5000AF
	for <lists+linux-tegra@lfdr.de>; Wed, 13 Apr 2022 23:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbiDMVMQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 13 Apr 2022 17:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiDMVMP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 17:12:15 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD68396AF;
        Wed, 13 Apr 2022 14:09:53 -0700 (PDT)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4EAD71F473D2;
        Wed, 13 Apr 2022 22:09:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1649884191;
        bh=NXfE3m0blQYAD216srx6k3KFQ3FlsjslFM9iENtE754=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mCiS9x/nrN+iDb4jLyyUkpSwyw9Uf4yjAlK3Y/EeQfwteUPpNKKrJAsVDuNnrtbNB
         EKNQqyqcAK2IQu9n3xq1nUChJc1lAdxU2qFI6J/kQs6tZJyR0aY2BIzmPoYDdyjSCj
         D0xq4MqsCSQVmUt+Qyptlxhw1lCHABoCpnlRBl/auehQQLAJaItT7NSoKGQgLBN2GU
         8egbvpU3+vACEA4ROoOxja74Mq120XqN2Gscb3/bn3Z00+WnzXFo7ZfPSbQ45OQct8
         QMwzr6UOO0LHHv+pzqpoikcwYkHXdl2bsRrhw8Zdynfxwy9oNsAhAoSlRWy8p29kn6
         6O/TPiq1nrVPA==
Message-ID: <ae1d1098-f8b5-f41a-c33b-0f4863a43d5e@collabora.com>
Date:   Thu, 14 Apr 2022 00:09:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Patch v7 3/4] dt-bindings: memory: Update reg/reg-names
 validation
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, Rob Herring <robh@kernel.org>
Cc:     digetx@gmail.com, krzysztof.kozlowski@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220413094012.13589-1-amhetre@nvidia.com>
 <20220413094012.13589-4-amhetre@nvidia.com>
 <YlbSGEBKgpVC51dZ@robh.at.kernel.org>
 <b050247d-a62c-62e7-7750-24cefcc93506@collabora.com>
 <71fc3efb-5110-287e-0422-10c1ae90139c@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <71fc3efb-5110-287e-0422-10c1ae90139c@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 4/13/22 19:17, Ashish Mhetre wrote:
> 
> 
> On 4/13/2022 7:34 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 4/13/22 16:37, Rob Herring wrote:
>>> On Wed, Apr 13, 2022 at 03:10:11PM +0530, Ashish Mhetre wrote:
>>>>  From tegra186 onwards, memory controller support multiple channels.
>>>> Reg items are updated with address and size of these channels.
>>>> Tegra186 has overall 5 memory controller channels. Tegra194 and
>>>> tegra234
>>>> have overall 17 memory controller channels each.
>>>> There is 1 reg item for memory controller stream-id registers.
>>>> So update the reg maxItems to 18 in tegra186 devicetree documentation.
>>>> Also update validation for reg-names added for these corresponding reg
>>>> items.
>>>
>>> Somehow your subject should indicate this is for Tegra.
>>>
>>>>
>>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>>> ---
>>>>   .../nvidia,tegra186-mc.yaml                   | 80
>>>> +++++++++++++++++--
>>>>   1 file changed, 74 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>>>>
>>>> index 13c4c82fd0d3..c7cfa6c2cd81 100644
>>>> ---
>>>> a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>>>>
>>>> +++
>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
>>>>
>>>> @@ -34,8 +34,12 @@ properties:
>>>>             - nvidia,tegra234-mc
>>>>
>>>>     reg:
>>>> -    minItems: 1
>>>> -    maxItems: 3
>>>> +    minItems: 6
>>>
>>> You just broke current users.
>>>
>>>> +    maxItems: 18
>>>> +
>>>> +  reg-names:
>>>> +    minItems: 6
>>>> +    maxItems: 18
>>>>
>>>>     interrupts:
>>>>       items:
>>>> @@ -142,7 +146,18 @@ allOf:
>>>>       then:
>>>>         properties:
>>>>           reg:
>>>> -          maxItems: 1
>>>> +          maxItems: 6
>>>> +          description: 5 memory controller channels and 1 for
>>>> stream-id registers
>>>> +
>>>> +        reg-names:
>>>> +          maxItems: 6
>>>> +          items:
>>>> +            - const: sid
>>>> +            - const: broadcast
>>>> +            - const: ch0
>>>> +            - const: ch1
>>>> +            - const: ch2
>>>> +            - const: ch3
>>>>
>>>>     - if:
>>>>         properties:
>>>> @@ -151,7 +166,30 @@ allOf:
>>>>       then:
>>>>         properties:
>>>>           reg:
>>>> -          minItems: 3
>>>> +          minItems: 18
>>>> +          description: 17 memory controller channels and 1 for
>>>> stream-id registers
>>>> +
>>>> +        reg-names:
>>>> +          minItems: 18
>>>> +          items:
>>>> +            - const: sid
>>>> +            - const: broadcast
>>>> +            - const: ch0
>>>> +            - const: ch1
>>>> +            - const: ch2
>>>> +            - const: ch3
>>>> +            - const: ch4
>>>> +            - const: ch5
>>>> +            - const: ch6
>>>> +            - const: ch7
>>>> +            - const: ch8
>>>> +            - const: ch9
>>>> +            - const: ch10
>>>> +            - const: ch11
>>>> +            - const: ch12
>>>> +            - const: ch13
>>>> +            - const: ch14
>>>> +            - const: ch15
>>>>
>>>>     - if:
>>>>         properties:
>>>> @@ -160,13 +198,37 @@ allOf:
>>>>       then:
>>>>         properties:
>>>>           reg:
>>>> -          minItems: 3
>>>> +          minItems: 18
>>>> +          description: 17 memory controller channels and 1 for
>>>> stream-id registers
>>>> +
>>>> +        reg-names:
>>>> +          minItems: 18
>>>> +          items:
>>>> +            - const: sid
>>>> +            - const: broadcast
>>>> +            - const: ch0
>>>> +            - const: ch1
>>>> +            - const: ch2
>>>> +            - const: ch3
>>>> +            - const: ch4
>>>> +            - const: ch5
>>>> +            - const: ch6
>>>> +            - const: ch7
>>>> +            - const: ch8
>>>> +            - const: ch9
>>>> +            - const: ch10
>>>> +            - const: ch11
>>>> +            - const: ch12
>>>> +            - const: ch13
>>>> +            - const: ch14
>>>> +            - const: ch15
>>>>
>>>>   additionalProperties: false
>>>>
>>>>   required:
>>>>     - compatible
>>>>     - reg
>>>> +  - reg-names
>>>
>>> New, added properties cannot be required. That's an ABI break.
>>>
>>>>     - interrupts
>>>>     - "#address-cells"
>>>>     - "#size-cells"
>>>> @@ -182,7 +244,13 @@ examples:
>>>>
>>>>           memory-controller@2c00000 {
>>>>               compatible = "nvidia,tegra186-mc";
>>>> -            reg = <0x0 0x02c00000 0x0 0xb0000>;
>>>> +            reg = <0x0 0x02c00000 0x0 0x10000>,    /* MC-SID */
>>>> +                  <0x0 0x02c10000 0x0 0x10000>,    /* Broadcast
>>>> channel */
>>>> +                  <0x0 0x02c20000 0x0 0x10000>,    /* MC0 */
>>>> +                  <0x0 0x02c30000 0x0 0x10000>,    /* MC1 */
>>>> +                  <0x0 0x02c40000 0x0 0x10000>,    /* MC2 */
>>>> +                  <0x0 0x02c50000 0x0 0x10000>;    /* MC3 */
>>>> +            reg-names = "sid", "broadcast", "ch0", "ch1", "ch2",
>>>> "ch3";
>>>>               interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>>>>
>>>>               #address-cells = <2>;
>>>> -- 
>>>> 2.17.1
>>>>
>>
>> Oh, wait.. I didn't notice that the new reg ranges are only splitting up
>> the old ranges. Previously it appeared to me that these are the new
>> ranges.
>>  > Ashish, in this case you don't need to change the regs in the DT at
>> all.
>> Instead, you need to specify the per-channel reg-base offsets in the
>> driver code.
> 
> Yes, it's kind of splitting up the old ranges and straight forward for
> Tegra186. But on Tegra194 and Tegra234 the old address is not in single
> range. It's already split across 3 ranges. We have to choose right range
> and add channel offsets to that range in order to read interrupts.
> So I went with the approach of splitting the regs in DT itself as per
> the channels because that way they can be mapped in a single loop and
> used easily.
> If we want to specify per-channel reg-base offsets then that would be
> per-SOC. Also we would need to choose correct reg-range for Tegra194 and
> Tegra234 and have a way to maintain offsets of channels from those
> respective reg-ranges.

That is not nice too. Should be better to switch to the new DT scheme,
since those channels weren't used by older kernels. It's okay to change
the binding ABI in this case then, driver will continue to work for the
older dtbs. Have you tested driver using the older dtbs?
