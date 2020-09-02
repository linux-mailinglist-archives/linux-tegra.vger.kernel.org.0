Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D75A25B4D9
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Sep 2020 21:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgIBT4w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Sep 2020 15:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBT4r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Sep 2020 15:56:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5854C061244;
        Wed,  2 Sep 2020 12:56:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id np15so2608226pjb.0;
        Wed, 02 Sep 2020 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kuKGy0nMzCedIxYfbaeRSNCf0OjAifTH7DorC8oMLIc=;
        b=Oryep4f/il09PEeRvkAzCa5yEamHX3IfI4haHnZFqft2sDVyMzWOa2oW6q5r7iV5cP
         4WT9+KMNL0+EhJccY9W2L8b8ZRNf5/yo2w1W4WhJ8XUROyxfdUB59D07znI18+pINr/N
         BcNZBzI0Gy8lVLdV6hEaC0yuvFtHvvTjC55K9Sa9xT2q7JBJXf2m3p90Sa3cB7/q91y0
         ceFFSnakSGrgS6Uk+aqsVKfyHoIJd+8xJXzN2S5xseiX/Z3zDW4R94HHyVGEN+V6jqOz
         ByLYj8x/gERQejNbUXCouYpjDKb2Tvtc67e8dxDbrAFFi+bTIhE6bVbxm/6YTah8KX7G
         xOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kuKGy0nMzCedIxYfbaeRSNCf0OjAifTH7DorC8oMLIc=;
        b=KwuTkCAP5jj1LePyWciFHCHs4MqJq/x9RNvBHXSdGTlCLufgQyfCT2LvOkuCTWqiKY
         6B6/vliucj2x94poi/u72SWQiwUF2IIdC+x5UX2IeYqNeqvJaxIcBRVrzI3Qgof0iaNO
         t0c+wfKYFY6Tp367JtX6nIBRI/yvAM3UyvHrI3vK0I0j+VgSSjG/+Hq2zSV9bJ1U/yTX
         4Nac2ncxdCqy4PRhG7WayvS9gL6m/BCCxUSO98YFH5eXE+432aZlqQaokymW5sET2+hB
         7ZnZ9XCCbVhfkzVoDEhjQK96N2J+XwKQlOu48IrBcmBpEtndhVZjAQDWfsEdWhyEONJ/
         mSvw==
X-Gm-Message-State: AOAM530xg2dH+nhKMEbfjEENKlVKSxrjWvDVfc8t4SSoTUzpLhLJgQE0
        ClK3vG9pxr8KYO15NM98v2b3vofehNQ=
X-Google-Smtp-Source: ABdhPJyEGSaG8BPaN9z2skZyEo+FUnajjLrY5nUupDll1Zmgpd/sTj0J5IIHRSDG1t8oto5PtF2n8Q==
X-Received: by 2002:a17:902:d213:: with SMTP id t19mr111855ply.46.1599076606592;
        Wed, 02 Sep 2020 12:56:46 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t20sm225492pjg.21.2020.09.02.12.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 12:56:45 -0700 (PDT)
Subject: Re: [PATCH 01/11] mmc: bcm2835: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-2-krzk@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <03ecf673-908c-823e-484b-7c442ad16621@gmail.com>
Date:   Wed, 2 Sep 2020 12:56:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902193658.20539-2-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 9/2/2020 12:36 PM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
