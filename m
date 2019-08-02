Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C67F67EAC4
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Aug 2019 05:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbfHBDmE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 1 Aug 2019 23:42:04 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39540 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730553AbfHBDmD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Aug 2019 23:42:03 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so33129021pls.6
        for <linux-tegra@vger.kernel.org>; Thu, 01 Aug 2019 20:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oljc8WAekrnZTIcu4hWL7c8be+0/DK6ZEkq8nHr7SeE=;
        b=PLmzt1p7LCED+jRBIlbDHX2FR3TASeXk1LneXvX5L+v3ckSfIU76VgWFwNGv2IpIAP
         ZRlgpbPFzbHANRXyVseRekP81v3K6DUqEKMdNYuBVOMjnrGTnR3ktAM7ygte6snUvMAA
         ajMQSunCoZAvG2PYzD3YcKosAos6VC+nxjDS8Sc5f2PoOnpU6yVQchpP4oDxMzkJg89E
         WK28bQ4vWevF9rCGQsq9Hq1Du24h7Djd0ebxRhT0lTfZOKdZl9XFQYrxi7UfRfimEyxx
         mT6Qa+ZLK1+vg/B72q+E3XuOpqmjJd+VbAwc5GKeCj2gdmhbATmLQ6pWhsN0XDgfYUvL
         LNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oljc8WAekrnZTIcu4hWL7c8be+0/DK6ZEkq8nHr7SeE=;
        b=f7LhqvUXK9SoIdfjdve72DdxCL1PFqvvVVYtZOSZM4FH3INHUVrzRUe7L9qZ5h5bFj
         IhntT1choFH+uN0TlJpWZ2Vf3Ap8Twyycvv5ZuSTe7aio3KH8dZfVYMiKte28WmxvxWH
         a2kHRFzH2aLN3bHYClhnbFhOwn0H7sK5VLYw3rRNJqBYuDEhj0Wh62MTodkv4097L8k0
         vlKTOAVLdgcQoGFl4X5OxjNXiFnM1PGpTwtjgZNWZDpRu2FRft2U6V/gmINmMG22Vfsg
         AlmmvEgNzukw+r6IiflAdy7KHYqzJbzBQ459Azem3i5rMXRjs5JpQWGsWJNekOVnmzHs
         PpyQ==
X-Gm-Message-State: APjAAAWFA4yWRK///4xYFJcJl5Grkwkm/h6QCEDP1WL16LC63s+Q/2KW
        YWUin6ISmV+J3PEddlsXHV2Pzg==
X-Google-Smtp-Source: APXvYqxkFHPbNbT09CdGUOr+LbVd9UcCOOrWPDNAK31ZrN4/1fb5cBrqjBPqkpBxHYaWNbDRL8CdcQ==
X-Received: by 2002:a17:902:9041:: with SMTP id w1mr15711312plz.132.1564717322425;
        Thu, 01 Aug 2019 20:42:02 -0700 (PDT)
Received: from localhost ([122.172.28.117])
        by smtp.gmail.com with ESMTPSA id q198sm76984199pfq.155.2019.08.01.20.42.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 20:42:00 -0700 (PDT)
Date:   Fri, 2 Aug 2019 09:11:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com,
        pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 11/20] cpufreq: tegra124: Add suspend and resume
 support
Message-ID: <20190802034158.gcb7o3o23fe5wtsz@vireshk-i7>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-12-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564607463-28802-12-git-send-email-skomatineni@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-07-19, 14:10, Sowjanya Komatineni wrote:
> This patch adds suspend and resume pm ops for cpufreq driver.
> 
> PLLP is the safe clock source for CPU during system suspend and
> resume as PLLP rate is below the CPU Fmax at Vmin.
> 
> CPUFreq driver suspend switches the CPU clock source to PLLP and
> disables the DFLL clock.
> 
> During system resume, warmboot code powers up the CPU with PLLP
> clock source. So CPUFreq driver resume enabled DFLL clock and
> switches CPU back to DFLL clock source.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 60 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
