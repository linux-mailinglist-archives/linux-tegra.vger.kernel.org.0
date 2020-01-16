Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622BB13F979
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jan 2020 20:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAPT2T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jan 2020 14:28:19 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33903 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729044AbgAPT2T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jan 2020 14:28:19 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so19925601oig.1;
        Thu, 16 Jan 2020 11:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s9ySBmI8nXQ+bF22E4xYEdRr9RYd04NGiWsltnu/tOc=;
        b=PsXGIUjVyHtcKbd7Zhtj12Gf5Dr5asbf5BJ1CkSnZVpFUESklx+MeEDzKC5nTcFJuz
         w8QnzlW/ZGLY37qX79du4lYtp3UQaXIhV63Qi/oUHX3mIimZClvlmsExEyNTJGE7Pjwi
         45EmqSEjjaHtU0VVUs6b9mOfYuuOD2NvmzJE/2zqlgovgC9o+JFhVSXoQFyX+T9+y/WT
         11OJCCmCpjHDljYBBJnFZHEScCVBDPZoqY8APju0W9Z/8KSQpFv0ysKziV08+BTx8Wer
         uzoASf01H3SrzlLm6GMKSC43FOWKUsEHOK949ILqWnDe4uqm0LaEIBqLH4TSWGMwOBhH
         gBAQ==
X-Gm-Message-State: APjAAAWRreEXaebLtnIOjBPec27ikdcQ3lqXUVljPqiBHUnSXtv4ip3x
        5ghvOMlXbk38m22Qtt/NVaEtVcc=
X-Google-Smtp-Source: APXvYqzt8nZ3Xn313YfRF+1+nMRvXGur1W2g2Mc1Taq1ODlDnFUkPtUl6KBDusR8rcwwb7raokRS2A==
X-Received: by 2002:a05:6808:5d0:: with SMTP id d16mr515827oij.45.1579202898396;
        Thu, 16 Jan 2020 11:28:18 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n6sm6713620otl.67.2020.01.16.11.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 11:28:17 -0800 (PST)
Received: (nullmailer pid 32576 invoked by uid 1000);
        Thu, 16 Jan 2020 19:28:17 -0000
Date:   Thu, 16 Jan 2020 13:28:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: firmware: Convert Tegra186 BPMP
 bindings to json-schema
Message-ID: <20200116192817.GA30287@bogus>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114181519.3402385-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 14 Jan 2020 19:15:18 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra186 BPMP bindings from the old free-form text format to
> a json-schema and fix things up so that existing device trees properly
> validate.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 107 ---------
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 209 ++++++++++++++++++
>  2 files changed, 209 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dts:52.29-30 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1222983
Please check and re-submit.
