Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2E91FE71D
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jun 2020 04:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgFRCic (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 22:38:32 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39586 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387785AbgFRCi3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 22:38:29 -0400
Received: by mail-io1-f67.google.com with SMTP id c8so5346997iob.6;
        Wed, 17 Jun 2020 19:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wocT9hb5rjpFV+FaWvJBTHDmZ+hLPyEALvZ8AqS2xlM=;
        b=ANuRvBTXF6PF8Qs7FjxssyGY1BHWb/djOjfUUmEoup0+noUlpkJ2WGbvJPD5+WX5N5
         sEd/ynb8drd/vMbQDmiO6s99lJJ16l8IBNI77c5gDj3BRanzNKex3JtynEzSkO6AqupM
         IlppiyYr+ArkHOiNsIG+0YTNiC0k/4xKbtbIBWrG8rZbuFVs/NfiNRygcb2nDvblPM28
         FRc6a6U9eUFEldGqGLcD47Xx2H9/+n9MSD1+A0nZoBzeMRDPWieGlAmPFMys4lfM+1I6
         DlDJCwcG+xQhm7eNWrzxXHlBzq52MumL85hF7mOX0sEaMkD2n+t+LVt56Xj92KVS8wZd
         hsPw==
X-Gm-Message-State: AOAM532K7AcbM0OByrmKer23IdYDV0nINEULt1SJ93ck9As1TrATLXu7
        sUdIpV3O00dLg9REUhLHOA==
X-Google-Smtp-Source: ABdhPJwKXElRw26wcSntPOMhBn3XUNq94TQyw/vRXg7VSPBcUcHDu3ByMYkYaNdfhVLNqowkIfIbtA==
X-Received: by 2002:a05:6602:164f:: with SMTP id y15mr2707850iow.210.1592447907661;
        Wed, 17 Jun 2020 19:38:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id q5sm806664ile.37.2020.06.17.19.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:38:27 -0700 (PDT)
Received: (nullmailer pid 3363238 invoked by uid 1000);
        Thu, 18 Jun 2020 02:38:26 -0000
Date:   Wed, 17 Jun 2020 20:38:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 28/38] dt-bindings: phy: tegra-xusb: Convert to
 json-schema
Message-ID: <20200618023826.GB3343853@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-29-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-29-thierry.reding@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:53PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
>  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
>  2 files changed, 2800 insertions(+), 778 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.yaml

This one I definitely think should be split up into multiple schema 
files. There's very little shared.

Rob
