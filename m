Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE8F11078
	for <lists+linux-tegra@lfdr.de>; Thu,  2 May 2019 02:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfEBAGb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 May 2019 20:06:31 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:34958 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfEBAGa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 May 2019 20:06:30 -0400
Received: by mail-it1-f193.google.com with SMTP id l140so452472itb.0;
        Wed, 01 May 2019 17:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pGBiGstvfMyAh6YnTBHeZjjH5Avnyhz+/ybXVskYoA0=;
        b=uIIc40X+6RvP04YZMdYSebOwmHqIaj8d3TPoYY1jV990WxTftK2uVmtSXsSR/+yqDS
         cfiphl/6KgYpyaxJLC1AOOfOdVJrAVpXwFXbIFYtrTyRsoJ1XwEHR3XG4Atz84K0G6bl
         ZwllKq0GcN9mPFvZxFhOMqwvOUUdEdp0ZG/VthA883426CZsRjsUEK+yIiFGCeylDuiz
         emnYS9UTM+Lp8FSKm1DkB+gC5fu3FMdGDXc+X76lRnSy0gOyv3YJK1KN5ndMMNcUVGNC
         CVur5+wnnux1kqdWxAPH2s84fmFCJ+TvvinyOqEy9kq4v5JJfV75yyUSuUjXBB1ebqKS
         /jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pGBiGstvfMyAh6YnTBHeZjjH5Avnyhz+/ybXVskYoA0=;
        b=b5hHhdtS2TaD3gLj+BduwgExm1VMhaJ+NAfNpK8zAc2lR0RztSusFHP9T12rI/RUWD
         iLz68EDNm4CNRzqG8sPk81pfpO0saoXkPAwy0LO9hhyX203v54hxSf0sqS+BtXllxMP2
         T4h9weyTEdwjnIzHKJMbBQHwSkG6oUYu0bJbIT0h8bJ1QVufev0QFYRhzLYat8vDEDlm
         ibWJjoAPVnixAUa6kVsDQB/GFMifLySCi3uimRQdTL2FPkFH7M1PuYTLEhscA4kCYSwN
         d0RD88KRdLlsBSAFXeEsglK9M2WFiN/cCEDglDErlVi9lI77kmQzre1hdlo1Y/uNiTb5
         HC1Q==
X-Gm-Message-State: APjAAAU0lIUBylgH7hBIoeFNbuwMB/HmqmgE74e1njY/ST3r47hp/8Af
        rLYaJtGJiVIck4u2nMFJOkZtrt/D
X-Google-Smtp-Source: APXvYqx9AkNre+C+ZGlfbOiXcCqWuEnJMrQve3+Q4ZoPyBqv6KEW/E6C9Jf65xL9TNRkkV+yCYLaPg==
X-Received: by 2002:a24:ac56:: with SMTP id m22mr318851iti.25.1556755589462;
        Wed, 01 May 2019 17:06:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id v187sm4108904ita.0.2019.05.01.17.06.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 17:06:28 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] dt-bindings: memory: Add binding for NVIDIA
 Tegra30 External Memory Controller
To:     Rob Herring <robh@kernel.org>
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
References: <20190414202009.31268-1-digetx@gmail.com>
 <20190414202009.31268-3-digetx@gmail.com> <20190429220542.GA17924@bogus>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <137c766e-66f6-828a-5c3b-f526d66d37bd@gmail.com>
Date:   Thu, 2 May 2019 03:06:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429220542.GA17924@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.04.2019 1:05, Rob Herring пишет:
> On Sun, Apr 14, 2019 at 11:20:07PM +0300, Dmitry Osipenko wrote:
>> Add device-tree binding for NVIDIA Tegra30 External Memory Controller.
>> The binding is based on the Tegra124 EMC binding since hardware is
>> similar, although there are couple significant differences.
> 
> My comments on Tegra124 binding apply here.

The common timing definition doesn't fully match the definition that is
used by Tegra's Memory Controller, thus the DQS (data strobe) timing
parameter is comprised of multiple sub-parameters that describe how to
generate the strobe in hardware. There are also more additional
parameters that are specific to Tegra and they are individually
characterized for each memory model and clock rate. Hence the common
timing definition isn't usable.
