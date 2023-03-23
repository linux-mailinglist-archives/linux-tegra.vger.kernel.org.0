Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E6A6C6446
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Mar 2023 11:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjCWKAR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 23 Mar 2023 06:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjCWKAB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Mar 2023 06:00:01 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BC015885
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 02:58:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id h8so83918057ede.8
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679565500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uE1v6Sp7zrfqf63ssth0pWpk316QqXw98EyjzxI20II=;
        b=FzEwlLwqESso6vMuhhm7lR1SgJKiheVHYYX3fv8gxzuDWUF6ZFikST24fWNb5GrBm5
         5/je9kg+hU/9f1i3oNuE8uvOv5yMhaCfMTZf2HTRCpXAsNlQliF9fpdoecv8d9WeIP9a
         Fld52AvyRL4FC2wVU9XSeezjSFlRlgGilKzMYJGL1pguLlneXI0NuQniYzrupfm4a1Kc
         Mp2fwic586QWjyM3Ftny0LnIuHT91yaimmvOIAjQlUQrsBR+q4q+APy0CNAWA+KP/zp6
         j05QDEENtC4R87woNepbhZpOfrbsGdAtSiffaGPHewckf3e60rvLkAADkIxBabOD019l
         mVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679565500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uE1v6Sp7zrfqf63ssth0pWpk316QqXw98EyjzxI20II=;
        b=dMPT0GzsYrLCrDaC1c1DThFhkA5wC1Rf7upHrh87EJ00YF1dtUqjtp50f34ONjOdNt
         mIQ/DP6SAalTCsrA4I34TsvcB7GbNOHMysCvdVKMNKcIjt5VJtl5BskkN3mgmZe7BY8X
         SQuxwKZp5cV3egD8t9VrBkNClVKxJz7oDMKxNkSx65K8wDx2XQIu7nevCbNQs3aW7lSm
         GO6uu98rseQptTAa0auL3+yRYhP7a9EYEGKwxI7LvLqtXi1lM+VXp02BbrVf+VLrIFEu
         SHUwVWbhk27+F6mc5VgYiiVlu8qtQ4obK8+V/23D+b3MXV62wR3BvNDVQD36A7EXBRI4
         g/yQ==
X-Gm-Message-State: AO0yUKVfnXLHYdDXAb7wynd7lZwa3pQA3+9mllubM3XlkmUtYM3rXKOb
        KFo3ytSMlF6lwkqtPj2/+tK/Cg==
X-Google-Smtp-Source: AK7set9qeRkqIGogA/WXb/VvBg89Kje0KWuOofqgGdF/RFXcmW1sgv/LvbHdaRsNCnhkIUKVkTw4dw==
X-Received: by 2002:aa7:dc0e:0:b0:4fc:9c79:86bc with SMTP id b14-20020aa7dc0e000000b004fc9c7986bcmr11526352edu.42.1679565500319;
        Thu, 23 Mar 2023 02:58:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id r3-20020a50aac3000000b004fccef39ec9sm8994955edc.70.2023.03.23.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 02:58:19 -0700 (PDT)
Message-ID: <65352fe3-6fb8-cb84-37b8-c9f59e26d3f9@linaro.org>
Date:   Thu, 23 Mar 2023 10:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v3 10/11] memory: tegra: handle no BWMGR MRQ support in
 BPMP
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        mmaddireddy@nvidia.com, kw@linux.com, bhelgaas@google.com,
        vidyas@nvidia.com, sanjayc@nvidia.com, ksitaraman@nvidia.com,
        ishah@nvidia.com, bbasu@nvidia.com
References: <20230320182441.11904-1-sumitg@nvidia.com>
 <20230320182441.11904-11-sumitg@nvidia.com>
 <dd6257a9-1a12-23f9-e770-0809aaa7ed0e@linaro.org> <ZBwiFEJ1bTMy6yTf@orome>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZBwiFEJ1bTMy6yTf@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 23/03/2023 10:55, Thierry Reding wrote:
> On Wed, Mar 22, 2023 at 06:50:23PM +0100, Krzysztof Kozlowski wrote:
>> On 20/03/2023 19:24, Sumit Gupta wrote:
>>> If BPMP-FW doesn't support 'MRQ_BWMGR_INT', then the MC Client driver
>>> probe fails with 'EPROBE_DEFER' which it receives on calling the func
>>> 'devm_of_icc_get()'. Fix this by initializing the ICC even if the MRQ
>>> is missing and return 'EINVAL' from 'icc_set_bw()' instead of passing
>>> the request to BPMP-FW later when the BW request is made by client.
>>>
>>> Fixes: ("memory: tegra: add interconnect support for DRAM scaling in Tegra234")
>>
>> That's not correct tag.
>>
>> Anyway, send fixes separately.
> 
> I think this was a bit confusing. This fixes an issue that was
> introduced in a patch earlier in this series, so it's probably better to
> squash it into that patch rather than have a separate fix patch in the
> same series.
> 

Yeah, it is quite confusing to send buggy code and immediately fix it...
Introducing known bugs is actually non-bisectable and harming.

Best regards,
Krzysztof

