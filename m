Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B35172ABB
	for <lists+linux-tegra@lfdr.de>; Wed, 24 Jul 2019 10:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfGXIyd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jul 2019 04:54:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35181 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfGXIyd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jul 2019 04:54:33 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so40828759wmg.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jul 2019 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AxqsUQ9ydrbktURKrd3ST6ajH38XaMBsfLuUUxN1ep8=;
        b=Ijet24iFgEAcUFy4oNncn1QCmXqFqnMwKUvJmypA9g9ZUOTrpsLOw5etR1uVg7ATTp
         YAn2QdqOdk2Kva+Ac9H9mVP2TawOeadELXg1L+AtWlZQolQbvvLD7AgT4OdZ3YNUSDsI
         jFGOygNEhoA2cFVA+GlXwksPVGI8AuuJ7HjKsxBAlYRVJLSpUgIuNw2yUeIoqglwjsmA
         ZwFk9wWF7qaq2kRvZ8PmI5EsggSOEdTrvlqB9FtAOC1WGr25mgL0HSEk+8yKIdZOG41q
         G/BmZD06mgeO3Ar8E9X99SyEaURO2d1z2bUGuVsopZIGN1Vor0+HIUC2KKGPIIvdmsV1
         Fk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AxqsUQ9ydrbktURKrd3ST6ajH38XaMBsfLuUUxN1ep8=;
        b=WpOH6UBvjumhabpzDQOwBDV7pvXnGCBCyB0Znewn3+FMlFP6/av8xrsPaMZOyfiLGf
         FHTm2K+axYEYBUyYABp8YcvKpxMPzfFr3reo15Ir/JlS/h+Ix5cgqJ6fw2vmN/JbFXZu
         vjsh4aY+/6pi1Kt9pvIjWniFtH61flW0obht4C8uonlvze4RrFex9nxaTdL3h+ibg8Md
         UMPYQt7V1EILnhJslQ61miHDg0fyNZdiOENVvu1bUa2XVr3xObOajp/krsYj82OqefcJ
         s567vVls5msu7Jqre0bWUr/gbau2Z1MCbrDeY7bpnxtZjrDUM/VeXRjqcmGbUifu7EI3
         z9tg==
X-Gm-Message-State: APjAAAVaNfU5YFvhEhmQgOYfLOVA6HbKgzZS1rvvfriempGe3y7bOsy8
        Ox0uSWP8iOC/UZg/hzLqcaIbfQ==
X-Google-Smtp-Source: APXvYqwKIfUp/OjDiKIW3yUhz1A3lTcNVQMvMoMH8vowJ8g0DRAQsyJ5Lf4T9NdyDaRbrUzSg97b6Q==
X-Received: by 2002:a1c:6454:: with SMTP id y81mr48189531wmb.105.1563958471195;
        Wed, 24 Jul 2019 01:54:31 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
        by smtp.gmail.com with ESMTPSA id x16sm33903820wmj.4.2019.07.24.01.54.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 01:54:30 -0700 (PDT)
Date:   Wed, 24 Jul 2019 11:54:27 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     David Miller <davem@davemloft.net>
Cc:     jonathanh@nvidia.com, robin.murphy@arm.com,
        Jose.Abreu@synopsys.com, lists@bofh.nu, Joao.Pinto@synopsys.com,
        alexandre.torgue@st.com, maxime.ripard@bootlin.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, wens@csie.org,
        mcoquelin.stm32@gmail.com, linux-tegra@vger.kernel.org,
        peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Message-ID: <20190724085427.GA10736@apalos>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723.115112.1824255524103179323.davem@davemloft.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi David, 

> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Tue, 23 Jul 2019 13:09:00 +0100
> 
> > Setting "iommu.passthrough=1" works for me. However, I am not sure where
> > to go from here, so any ideas you have would be great.
> 
> Then definitely we are accessing outside of a valid IOMMU mapping due
> to the page pool support changes.

Yes. On the netsec driver i did test with and without SMMU to make sure i am not
breaking anything.
Since we map the whole page on the API i think some offset on the driver causes
that. In any case i'll have another look on page_pool to make sure we are not
missing anything. 

> 
> Such a problem should be spotted with swiommu enabled with debugging.

Thanks
/Ilias
