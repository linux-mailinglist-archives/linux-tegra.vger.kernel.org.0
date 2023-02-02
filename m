Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3BF687BDE
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Feb 2023 12:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBBLNk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Feb 2023 06:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjBBLNj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 06:13:39 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C55B87D1C
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 03:13:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id t6-20020a1c7706000000b003dfdaa1d998so704680wmi.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 03:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eyViLD6E5jWQUyig/4yWOniALXO9ZkrdBk4rdwCVU3U=;
        b=DYHClRngcqEE1zDJ0lS0ihNs5fy2CIGpITprFV0BuWpU//9ue4k4yx4vIm4jxJqJsu
         RIeiasaRH9g8y+pGGIh95QCCJlMI4ycpZ7KlZKUhrBsa9RVDIrXcYhXdUgTUBGpAz4bo
         JZwuyu0y9FZeBvXdlslShFgdRHvIjEo5G6euQEEw0MseOjNJD1Ue1l3CDm1hVaQgeOBo
         qRrnlcc+SJ4ET8VQlW9msUD0sfNCixZUZ3mcd/CLJAlIb5WsiNOb9btuwz0797JhprdN
         vQuEAhyVUm3nfutPmd6AfpPp+GL8qnAuokaV+r9qm0+XbtJ+CrCfmMlI+j1iOwtHPi3u
         Ct1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eyViLD6E5jWQUyig/4yWOniALXO9ZkrdBk4rdwCVU3U=;
        b=EhZTK7rNG+hWBjt+2TWwOCmwF2lriBrSj0AKQXswE0M4bmUuH7ulusv2sM4B8cYiBt
         /ZPTmZdhQFOktZhA74GRvy5yhiRw9JumpvtPVkdz1i31K5hnp+Fn+EFhl1mNL+tcIsMU
         Jx3IgqgGSCEZj8fFmZo4jLukZosYdj37lnVwjvoh+AtYHQurkvz2qnoeOAvqjLi6Tyl7
         kflInWfa0T1u5U7xHHInYwDClgWa7CzouC749La4mDv5ErbUGxxn0BzecZ6+ZTe9kaQp
         uxwS2ra/Dh8a8Md76hCNWdDbAKndk/ZWGPewjXF3bsEM3o1rIJI8C6DxjdFUlWO/wSId
         unqA==
X-Gm-Message-State: AO0yUKVWAFEGv5AROqF1m0cci2wBdiAHEG4G/5D7qVyFob8j9/r6+LyV
        6Bzzg9MjIgVMet8pDIWCcWV7Kg==
X-Google-Smtp-Source: AK7set/MyADSM2GxOa7cX3Nl14EN2MXbfx5PvgBCExukm1vrfPZ/qnHvzT1fTuQac1PO0alosodmAg==
X-Received: by 2002:a7b:ce11:0:b0:3dd:37a5:dc90 with SMTP id m17-20020a7bce11000000b003dd37a5dc90mr5483376wmc.32.1675336416011;
        Thu, 02 Feb 2023 03:13:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u1-20020a05600c00c100b003a3442f1229sm4416676wmm.29.2023.02.02.03.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:13:35 -0800 (PST)
Message-ID: <57dbcbc6-b497-53db-5a45-abce0e4dcf37@linaro.org>
Date:   Thu, 2 Feb 2023 12:13:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/23] interconnect: fix racy provider registration
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> The current interconnect provider interface is inherently racy as
> providers are expected to be registered before being fully initialised.
> 
> This can specifically cause racing DT lookups to fail as I recently
> noticed when the Qualcomm cpufreq driver failed to probe:
> 
> 	of_icc_xlate_onecell: invalid index 0
>         cpu cpu0: error -EINVAL: error finding src node
>         cpu cpu0: dev_pm_opp_of_find_icc_paths: Unable to get path0: -22
>         qcom-cpufreq-hw: probe of 18591000.cpufreq failed with error -22
> 
> This only happens very rarely, but the bug is easily reproduced by
> increasing the race window by adding an msleep() after registering
> osm-l3 interconnect provider.
> 
> Note that the Qualcomm cpufreq driver is especially susceptible to this
> race as the interconnect path is looked up from the CPU nodes so that
> driver core does not guarantee the probe order even when device links
> are enabled (which they not always are).
> 
> This series adds a new interconnect provider registration API which is
> used to fix up the interconnect drivers before removing the old racy
> API.
> 

So is there a dependency or not? Can you make it clear that I shouldn't
take memory controller bits?

Best regards,
Krzysztof

