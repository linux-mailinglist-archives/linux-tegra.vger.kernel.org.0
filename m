Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC386E6916
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Apr 2023 18:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjDRQNm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Apr 2023 12:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjDRQNl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Apr 2023 12:13:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8819037
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 09:13:38 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kt6so36432365ejb.0
        for <linux-tegra@vger.kernel.org>; Tue, 18 Apr 2023 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681834417; x=1684426417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAv9XfH/Gcbn1WieuwEvWfpJNF3KgicHWHVmjLoU5QE=;
        b=MOZwPa2rZB8kg7oVKePNVH/IS83tGzcDvxbHwZxW5aRMpXwgvke/oJZec/7r9KPsY3
         /E8Ce3dkKnCCrUxgibxQN16BRAxOMC4RmGaeBGabXCiF6zMrlK47/JZpIeI8/5JmPZEz
         NZ4yPoOe1Ry1UEt9Z2sG5hi5WriW2nMsXn+bTnPUjiF+harlrfN+Bk5hrpjjz9JiQzPF
         xuVCtk/vM5L0Fra6G3Uc4z4BB8VZNTYHoJVlJ+8BBbADzpoS09u48P0ahanKIlzrgM/S
         JQlgY4PfvsdS+AjVCjQ4jZvDcqZQ513NQrJip4eUyPIJkhoQJVnoFbej9rJYei4K9HYu
         AP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681834417; x=1684426417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAv9XfH/Gcbn1WieuwEvWfpJNF3KgicHWHVmjLoU5QE=;
        b=Uls6xlh+XYVLy/pIeqcH8PKrNFQrq8Me7VLaX1LDLU0z6Kpv2OuW8hwfSgtS++18B7
         uEQu8pisY3GtIfibwoi8LEdXqHlaPl/5TwCNNQFrrkARYjZ2rqsiqvC4loWAipInLrbk
         8sU5SYztNuNjg+TxXZJgXNeo4WRh9VzyxlzU6TfmXnBXR8/EmwhXqVs1APfrL9m6ycRY
         Jnr7toDPQFS8fjibRvB+9wqElJqSou/2qEFsjfHuPgakjK0Ymxdh7qJWO5wzHvWvkSAs
         7/5MEmSBZ27CEqlitHmc8gmwqthNExKx28Sg3F22XHSCdy15nrlOBZFWgA8n8Jg8uQNx
         7nwA==
X-Gm-Message-State: AAQBX9dSmhE29CL+eIgNW4ipQFVL4yza0Lvq5fspnYyc2nrPoKme7PQu
        S1uhp6g+mQNE10fymK0Pnh97YlQRKJi6JD8FRW5Tsw==
X-Google-Smtp-Source: AKy350byU7g05KQNnXaqyBGpF+lgnwfZRRpo4F2yMSsK2H8utAP+tW7wFMY1VbL1Ti9JpKY1Kq+r0Q==
X-Received: by 2002:a17:907:9197:b0:94f:553:6fd6 with SMTP id bp23-20020a170907919700b0094f05536fd6mr10080280ejb.24.1681834417139;
        Tue, 18 Apr 2023 09:13:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id xd10-20020a170907078a00b0095328ce9c8bsm729247ejb.67.2023.04.18.09.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 09:13:36 -0700 (PDT)
Message-ID: <df267337-f258-4fbc-0fdb-ddfe31761ffa@linaro.org>
Date:   Tue, 18 Apr 2023 18:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/10] dt-bindings: thermal: tegra: Document throttle
 temperature
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230414125721.1043589-1-thierry.reding@gmail.com>
 <20230414125721.1043589-2-thierry.reding@gmail.com>
 <187d51b3-6fec-7a25-e472-3d9020c12db5@linaro.org> <ZD0KdAXyi0Ex1JOU@orome>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZD0KdAXyi0Ex1JOU@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17/04/2023 10:59, Thierry Reding wrote:
> On Fri, Apr 14, 2023 at 11:47:56PM +0200, Krzysztof Kozlowski wrote:
>> On 14/04/2023 14:57, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Each throttling configuration needs to specify the temperature threshold
>>> at which it should start throttling. Previously this was tied to a given
>>> trip point as a cooling device and used the temperature specified for
>>> that trip point. This doesn't work well because the throttling mechanism
>>> is not a cooling device in the traditional sense.
>>>
>>> Instead, allow device trees to specify the throttle temperature in the
>>> throttle configuration directly so that the throttle doesn't need to be
>>> exposed as a cooling device.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  .../bindings/thermal/nvidia,tegra124-soctherm.yaml         | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
>>> index 4677ad6645a5..37dac851f486 100644
>>> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
>>> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
>>
>> File does not exist in next and no dependency is mentioned, so tricky to
>> review and figure out context. Without context the comment is:
> 
> Apologies, I have a conversion series for these thermal bindings. I'll
> send those out first.
> 
>>> @@ -120,6 +120,13 @@ properties:
>>>                # high (85%, TEGRA_SOCTHERM_THROT_LEVEL_HIGH)
>>>                - 3
>>>  
>>> +          temperature:
>>> +            $ref: /schemas/types.yaml#/definitions/int32
>>
>> Use -millicelsius suffix instead:
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
> 
> Okay.
> 
>>> +            minimum: -273000
>>> +            maximum: 200000
>>> +            description: The temperature threshold (in millicelsius) that,
>>> +              when crossed, will trigger the configured automatic throttling.
>>
>> Don't you want some hysteresis? Or is it already using trips binding?
>> But in that case you should skip the $ref and maximum - they come from
>> thermal-zones, don't they?
> 
> We don't use a hysteresis at the moment, but checking the register
> documentation, there's indeed "up" and "down" thresholds, so we can add
> another property for that.
> 
> This doesn't use the trips binding and in fact, one of the reasons for
> this change is because we want to make this separate from trip points.
> Trip points are usually associated with cooling devices and this
> throttling mechanism doesn't really fit that concept because it is an
> automatic mechanism that is triggered when a given temperature threshold
> is crossed, rather than a manually activated mechanism, which is what a
> cooling device would be.

OK, I just wasn't sure if the binding already includes trips, which
would mean you should use existing 'temperature' property.

In such case, I think it's better to switch to property with common unit
- millicelsius, either low/high ranges or with hysteresis.

Best regards,
Krzysztof

