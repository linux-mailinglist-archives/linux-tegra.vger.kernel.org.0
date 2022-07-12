Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009F3571440
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Jul 2022 10:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbiGLITY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Jul 2022 04:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiGLITW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jul 2022 04:19:22 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9532CE0A
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:19:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a39so8996226ljq.11
        for <linux-tegra@vger.kernel.org>; Tue, 12 Jul 2022 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mPwiUa/I/QF58z2fuTg90NSWV/C3Pn2OArh1aSAWDBY=;
        b=jLek+wGEDNJr7KlZ2GnQ0XU5mNwTvxszDPPwOGmyicqVu+M1ttCGXYUxjaNlvJWjx2
         ZXn8IakQMQ2Fi3eRnDTj/3Cc9YQluDxcoFFZd0umPFkD/tEFJ33rCGlkvB/PNGRbQnbH
         VvZNbI0OPOlkGSUjHCH36jPbxKpFFHBgPOUHBcJDNcUKUvaDX5mIHojkV/qFPA3w8lWw
         qeQAzVZjcLtLvobTRHJnddCRKeqNNSBlEIBs5ie5MOmkvAfgpPvOHHxI82UKh7KOt45N
         7cmCnjOPWe5EligYe5MdZ8hfVVc3eYF1SNp4dx5N3LoZoPDp1dnzUSYtJX37Qy2mHIAw
         sk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mPwiUa/I/QF58z2fuTg90NSWV/C3Pn2OArh1aSAWDBY=;
        b=mC1UkDjVLAGnMwQOXJgk0ETUCNp7v+UJrtaG3zxlFQLjTTqnAvvPNl3LTKLxs2Z/7k
         Vr/ienJo1FUsCPsyR2HdBRCmlnXp0+YpIw8+cGgn0Uu6aG3At+NKh7UXhur+BMBT7qBr
         4WTX9DGxC+fau/qP/eFe1nSo7EYzE73cQbTSyZQ/8dqqDI5vLLjvvjsDQAGfpeL+4br/
         +dXBMWGvEz0vNlBisHg5SRHXQ5DMdHO4GA6um3gm1xvjM3J6n67ZnVyQ16/DSAimrO0l
         2IKuj3PdNex+IaC/wG2vMSJpBRuSHZwYfBi+m0kslr8rMkz864pZZbDhjvJbSLMoRvr5
         kDZw==
X-Gm-Message-State: AJIora/y+od+EDobMmGbGQYTZkHt7g50vARUQ/nFP0+7K4tB32CzQkfC
        V9DTV6CeY5bzqmfR35TaZXpcdw==
X-Google-Smtp-Source: AGRyM1u0bOgIZMac3Bmr5k6icpSTgbmhYm6M1PQ7kvFztaYK4kYaxEMiNHHj+r1fR6aBeaJ2BqISuQ==
X-Received: by 2002:a05:651c:154a:b0:25d:7a5c:b854 with SMTP id y10-20020a05651c154a00b0025d7a5cb854mr968511ljp.193.1657613959768;
        Tue, 12 Jul 2022 01:19:19 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id s28-20020a05651c201c00b0025d547bf08asm2274689ljo.74.2022.07.12.01.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:19:19 -0700 (PDT)
Message-ID: <600d7287-091c-48b3-9e43-fb2e6bd79042@linaro.org>
Date:   Tue, 12 Jul 2022 10:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/5] dt-bindings: arm: tegra: flowctrl: Convert to
 json-schema
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220711152020.688461-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711152020.688461-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/07/2022 17:20, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra flow controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra20-flowctrl.txt     | 18 --------
>  .../arm/tegra/nvidia,tegra20-flowctrl.yaml    | 41 +++++++++++++++++++

arm directory is for top-level stuff only. SoC components which do not
fit any subsustem, should go to "soc". Can you move it here to "soc" or
to respective subsystem (net?) if there is such?

Rest looks good, so with different directory:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
