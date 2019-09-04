Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45609A963B
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Sep 2019 00:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbfIDWU4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 18:20:56 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45769 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729921AbfIDWU4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Sep 2019 18:20:56 -0400
Received: by mail-io1-f68.google.com with SMTP id f12so38921iog.12
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2019 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Zowdg/ishiFEueHxdJMXvAIwGsQhibYjxDCAVWpyEho=;
        b=iOcKuZTq9FDfs5ITnO4xksSDEIMyzoGb5YPgw8Ox6aLOAXSjQNZISIBe+DGXG0wk+N
         pN7WO1WaobfW1ilOv5uELMQvO+nSuoR7tNluOhbT9/2xknUwlNotF9HSzpKF+zhfOKyD
         RdHIk4iXBpphh/wRSSgCGcGU10Yt0WCa9ez/H4N+wOrHNN3BQSrKkD2BFG7Y0guEXbeT
         rA0PnCKb2Twqdi+UgnSRkvTBlRJwqyUq/c/Ev821qe+5dWW+wT6OpAdH9nSxC28lKSSh
         SiX9qbh4yEGo5m1dKL5rDe4UMXPJVslnIvcyppmVppnReIEa/5QKGvqe03sftx7YNooF
         0LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Zowdg/ishiFEueHxdJMXvAIwGsQhibYjxDCAVWpyEho=;
        b=JhguCL3MOsQxsiciYVcufUMYNHtg3+9Y2G0q6fbPfXVKysyQMFh7wB85rYUSj22S9V
         BlKJeJxiwd/dl4oTyfbnZcwFIwRjX/c6ohfBeCFnjcPjwNan7K1GjO5VBulKUxpJiK/U
         iDvJ0DJNMwPTrGlTSLUZ1Zfo1TqA6nfxMMVreMUGwlVSMHbC1kVMnkLxgFXqlphkadwm
         epbl+6DU81AnHOKREq/wf7SUf3PB3MB+0lh35kedNXuL6AlDr3EyLjJg/k+/eBk05X0x
         6gvipx7KKmi5tkrkDAutxm5SD65YV2NKFaQXFa6Ahc2rOHwUXInyCOVcAoNrUpnC61UL
         OAzQ==
X-Gm-Message-State: APjAAAVizWU51kh+yZFHO/jqvfp36SZnu0NagxQ1N25yS29kiy1WXFI4
        0kVEYxN+GnLKCkg49NIoZbEdew==
X-Google-Smtp-Source: APXvYqw9/y1/6WIH+gVV0I2I+QTpotyWZ/nsXPQb3XqbV/RMNA9f7RjbusMAA0XrA/3pIxTjnIZqvA==
X-Received: by 2002:a05:6638:73d:: with SMTP id j29mr603576jad.21.1567635654784;
        Wed, 04 Sep 2019 15:20:54 -0700 (PDT)
Received: from localhost (75-161-11-128.albq.qwest.net. [75.161.11.128])
        by smtp.gmail.com with ESMTPSA id u3sm281389iog.36.2019.09.04.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 15:20:54 -0700 (PDT)
Date:   Wed, 4 Sep 2019 15:20:53 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     YueHaibing <yuehaibing@huawei.com>
cc:     broonie@kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, eric@anholt.net, wahrenst@gmx.net,
        shc_work@mail.ru, agross@kernel.org, khilman@baylibre.com,
        matthias.bgg@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, avifishman70@gmail.com, tmaimon77@gmail.com,
        tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, kgene@kernel.org, krzk@kernel.org,
        andi@etezian.org, palmer@sifive.com, baohua@kernel.org,
        mripard@kernel.org, wens@csie.org, ldewangan@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        yamada.masahiro@socionext.com, michal.simek@xilinx.com,
        bcm-kernel-feedback-list@broadcom.com, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next 26/36] spi: sifive: use devm_platform_ioremap_resource()
 to simplify code
In-Reply-To: <20190904135918.25352-27-yuehaibing@huawei.com>
Message-ID: <alpine.DEB.2.21.9999.1909041520130.13502@viisi.sifive.com>
References: <20190904135918.25352-1-yuehaibing@huawei.com> <20190904135918.25352-27-yuehaibing@huawei.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 4 Sep 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul
