Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AB0DA3D2
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Oct 2019 04:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407104AbfJQCdQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 22:33:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44622 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391995AbfJQCdO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 22:33:14 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so588530pfn.11
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 19:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4bXHZivjXNK83YyR7o8F04xtApnhmtFO8YTPizBGIv0=;
        b=RB6eP77bcKvMpl4jlon+UoQHLyGkd7FE6lazP/PctVFclQtYZrpbQKrwaVGxUE1gcJ
         rSVT7+eiZQhILoAzSN66jRjEtOJ4W2wvhDAnfX2ntjDZi8pIEz+HalbDfulJsTOaKHBB
         w7iLuQV8S0OnF6DBnV8JE2TRqvDTjbya6FWXyF6M+taD1UmkxBDHgq4iySOXCpCyL5/m
         e7rWHBiF8qGAiytQlphKHQeDXZhi6qKYmguhf8d4vT7U9a2Qh0z7+1I8SnNaxHTTrXc8
         5ZWdy5JGXSDbTh3HWDH6oDwRgzBJaHRvNX+96He0N7oKaMUA9MWBpFRazrt+RctIeFAJ
         v/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4bXHZivjXNK83YyR7o8F04xtApnhmtFO8YTPizBGIv0=;
        b=exDZPCFBPIrkrNfL8ktUMTUbbDjkxTq2YN5UgX3tqEuumOy+GkrVwj5fpbOWKzt1H2
         fe1JQjFhn7mOBCVHgpm5GXbpZyUtVngTeMo9vDv6zs39VRqc1kF2hmUY1MxdMNSe8zo9
         ZTR42swKsMayzHVPh5WJX4JhHwZiN+MBtoMwF/D8cHcAA/2DLoYgPLrwjifk/1kIbR87
         DeQI0CE1wGfQfNww3Q7ugVKasURKjtoZYdEgx+1S8N/G2Xfgg7jpoUjbvXLJqo0eeQ+D
         +EOUlhGzuwdPzfG55DTQFFLV0KTlYr6QqNnXtxBgCWJOtPjKKlsOy42tAVBd0ECvoWIy
         Fpxg==
X-Gm-Message-State: APjAAAUJmvvn33oK/rUgtlRS12RMAhdgzrnPj00cPXsM4Lq4yBPTIOQb
        bhKS0jdRYKAbJGCBoou1Djg+kw==
X-Google-Smtp-Source: APXvYqwOiOjdMpZ9PniBll51OsUaQTGs9EQrfZvMw/G810VOXNE+j54FHqXnu60/BSBiobzjVpt1gQ==
X-Received: by 2002:aa7:970b:: with SMTP id a11mr949497pfg.37.1571279591767;
        Wed, 16 Oct 2019 19:33:11 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id s18sm462898pji.30.2019.10.16.19.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 19:33:10 -0700 (PDT)
Date:   Thu, 17 Oct 2019 08:03:08 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 12/17] ARM: dts: tegra30: Add CPU Operating
 Performance Points
Message-ID: <20191017023308.se5odhmg2hru4vji@vireshk-i7>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015211618.20758-13-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16-10-19, 00:16, Dmitry Osipenko wrote:
> Operating Point are specified per HW version. The OPP voltages are kept
> in a separate DTSI file because some boards may not define CPU regulator
> in their device-tree if voltage scaling isn't necessary for them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  801 +++++++++++
>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 1202 +++++++++++++++++
>  2 files changed, 2003 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp.dtsi

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
