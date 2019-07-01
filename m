Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB1AEC6A
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2019 00:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729498AbfD2WFp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Apr 2019 18:05:45 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45530 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729437AbfD2WFp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Apr 2019 18:05:45 -0400
Received: by mail-oi1-f193.google.com with SMTP id t189so6622846oih.12;
        Mon, 29 Apr 2019 15:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NqqUvI8ozIYLQ4d/GuKEHP8sALx3PYdlLGZJSzshmEI=;
        b=bUV1rczi22taJVws3Otr0g1aVfzPan9fh9yjWj1LUC8X95H4PeUTCjeTAJk7AstwQg
         4hijvEXujAjnU7D9meuXJvks/PlQkF3cAgSTaqali2Hj0xtno9kkCnGJcmsQWb/ww7wl
         2ieQu6ac5PhTipygTjKyhMycOqe0YsEErteyAiBSegaLsIujT/VAn0bYUaZHSWyWEho+
         DHFlFMjzxgCsdc2EXr9n/+72E5pOrOonjZfw7o/q4QJfOdp6YsoaVYY8NH3fTKLbHqKo
         z48lBLBFDdCuA8+SfO5FWILnEp3KglnDOMdKVg/YKwGH55LTffYIceGq2V2wciWri4vy
         fqYA==
X-Gm-Message-State: APjAAAX4pY4bILeEK5jaMN1Q7lNt5kA9xIKy8Ya7PequKXi+5eDLuFjt
        TaHzPGSvv/KnaxAdGsQ5dw==
X-Google-Smtp-Source: APXvYqyUgr9Px81sKHtSP+7CZcQbfQ7hAfxA751GonSFy+nyurN+Oj7Tr+NkXDAyDlFf3zO54kzuNg==
X-Received: by 2002:aca:c4c3:: with SMTP id u186mr986160oif.82.1556575544019;
        Mon, 29 Apr 2019 15:05:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j7sm13873345otr.50.2019.04.29.15.05.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 15:05:43 -0700 (PDT)
Date:   Mon, 29 Apr 2019 17:05:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
Message-ID: <20190429220542.GA17924@bogus>
References: <20190414202009.31268-1-digetx@gmail.com>
 <20190414202009.31268-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190414202009.31268-3-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Apr 14, 2019 at 11:20:07PM +0300, Dmitry Osipenko wrote:
> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
> The binding is based on the Tegra124 EMC binding since hardware is
> similar, although there are couple significant differences.

My comments on Tegra124 binding apply here.

> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra30-emc.txt | 257 ++++++++++++++++++
>  1 file changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.txt
