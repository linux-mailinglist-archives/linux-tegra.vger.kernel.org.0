Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E31B6C02B0
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Mar 2023 16:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjCSPUL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Mar 2023 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjCSPUJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 11:20:09 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C6A2200E
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 08:19:56 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id eg48so37666930edb.13
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679239194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qc2nZvpFcuHVwHLCLVwrqbjFkrLhao980yrB5e8kC6s=;
        b=QQv5JX22+4+hbeyzGGAYFyijcfI6v0Oj3QOv/kxLz8ETpP3bR471hdf5X4z9f93sYW
         Doshe7Lf0AHD1pz3WGVPnSeJ8SdKCCm0BiUAjtIorgiWJt5fmKYyxYiRThRJKnqHZJ9H
         z53/vC+ijvDCSjsroA5vIt0BtbpQjD2PVBUa3AJyA8GVzH+wTidnrtazPseTQGfrAwtj
         W9tNyiKzhsMspB3ltws8xSESnbTV8jbanWYMC/1i3fVUaWSgNK8NdbtW7vZqL3YVi22n
         igSG0Z8zr0K/bwPhTWL0/QsT/GQxAx+pUM5hA/HrM2A2+lEai+wrNFxfGIwM38pMnoJL
         gsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qc2nZvpFcuHVwHLCLVwrqbjFkrLhao980yrB5e8kC6s=;
        b=Z8C6bTHqoPB3KzzLcSQz88UoV1IPshvZCzoA2LGWQ8F75mflUL8ykKtde2vFwbniVm
         OQA8wvAJdMaQmwt3hJejAtZR30aIfpJeaKK6Q4P9/7jG3S+SBZWyttiT5vgnXtlbHxxI
         Ykw4eNedPvUhJqc0IxF+EQmXK28XZoLQDxVawHqw6VDpKpgLaGrJXSAlZ3su5e+qmofn
         UvDpcsBhrQutDuHZQoefgvWcAfCBrXENytcODghBCLGhOGS9ZsbsZ5N9V4fWZQT15suO
         MGvkF7J7xUjAr9VgiIteoKNw6sCRv+drYLw3Arwe6u9jUIPRgSRcIRHD3kj7fU/xEaFH
         HMtg==
X-Gm-Message-State: AO0yUKUTDZtBIWcnyNm/JAhlmdK8rlEcQqdz0qazVEBdBsDH1ITfs/x5
        YEahv3P/F52fXJmCNJtNf3PFYA==
X-Google-Smtp-Source: AK7set9JIe05OtsEVPSjBNvvPqa37Nl33NR0Yp2pnmjv54h3N/usCJvJ00I8Z6K+qGSCrUHaXKcafA==
X-Received: by 2002:a17:907:10c2:b0:930:310:abc2 with SMTP id rv2-20020a17090710c200b009300310abc2mr6051842ejb.35.1679239194724;
        Sun, 19 Mar 2023 08:19:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170907a04400b0090e0a4e1bacsm3309894ejc.159.2023.03.19.08.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:19:54 -0700 (PDT)
Message-ID: <2eeabd4d-393a-6b0e-9b24-86ac6368920e@linaro.org>
Date:   Sun, 19 Mar 2023 16:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v2 4/9] memory: tegra: add software mc clients in Tegra234
Content-Language: en-US
To:     Sumit Gupta <sumitg@nvidia.com>, treding@nvidia.com,
        dmitry.osipenko@collabora.com, viresh.kumar@linaro.org,
        rafael@kernel.org, jonathanh@nvidia.com, robh+dt@kernel.org,
        lpieralisi@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, mmaddireddy@nvidia.com, kw@linux.com,
        bhelgaas@google.com, vidyas@nvidia.com, sanjayc@nvidia.com,
        ksitaraman@nvidia.com, ishah@nvidia.com, bbasu@nvidia.com
References: <20230220140559.28289-1-sumitg@nvidia.com>
 <20230220140559.28289-5-sumitg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220140559.28289-5-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/02/2023 15:05, Sumit Gupta wrote:
> Add dummy Memory Controller clients to represent CPU clusters.
> They will be used by the CPUFREQ driver to scale DRAM FREQ
> with the CPU FREQ.
> ---
>  drivers/memory/tegra/tegra234.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

