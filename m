Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA986FDA2
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Jul 2019 12:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfGVKSl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jul 2019 06:18:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36441 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729295AbfGVKSg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jul 2019 06:18:36 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so30624337wme.1
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jul 2019 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+GcrJc5mWQ55cEUCcfbBZGMvLQ78HJvPwtodMDzyle8=;
        b=G/KTQPys8CcucScPfqsgmQtz62QdZqLEo1kJwQNA+4eLiF2asiNiddgtT/h14Ix94U
         /CdTawyAL79G+1ILA0FvrmO8i2FryDf4LH9+Yj6o4XGqgEMRSjeMmCPzYQxKNpoZorLo
         z+SV+ac1Cei6AWdxZ6IceFB28kHbysTzIUNOHaUoxyQYbqkiAlOpN1troV3WXeI636me
         pZqpRxgTA+gDotUsJGcbBrxF3vsWRMbB6fLgmFb0seU6n83Fjiw5lyPCsGhKFl5VBVtA
         j6RauOuX7Z0lH14cBe9PTdWl14HxQfSyO24r5I9K866EX/AQa4BQydrhG1rhbyb9i/j+
         VvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+GcrJc5mWQ55cEUCcfbBZGMvLQ78HJvPwtodMDzyle8=;
        b=R+pH5291KPMNvERx3Q+UO1P2qQrD9PhOIKotOJRAQVRId/bitmNd4x3w8wU9mkgtBP
         X4b3XsuZBC0rz3spel8FNKOMlwE+vckupVbXXzoqktnOUKwN5MMZ4ryi3tQDnBRcR2EY
         tpMVY27yATn3o+T5QfnkwYSdgQCllX7SoBdS6qhvo0Udri59i7bdOCvMSSN7PDNYvKH9
         tlynzkn5QnPTvgPfso7Q/Q60+1NBKg8tix47JSMbSUXlACrumxorZVVkeI06XzLhZyuh
         jge64K4DiDyOmrqO+XOnYwhNoiQdpfsMDNn0p7q5wDRIkZLDROh1fT57wDBEySwCaiUQ
         RfGg==
X-Gm-Message-State: APjAAAWdo5sy4Rtah25P6Rnsoir6A8yFbKtDlPvk+XNgQoP6f96HaMk2
        xjtNmM13gG4fDkMzdWNG/aoTyQ==
X-Google-Smtp-Source: APXvYqwWpeo4gQ4edBUy9N5k3STiDsB6fnGJqOqO58p5YopawrIHfEaaX/V07cjOuiVOf8ftj5mijg==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr64661606wma.120.1563790714647;
        Mon, 22 Jul 2019 03:18:34 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
        by smtp.gmail.com with ESMTPSA id f17sm34005987wmf.27.2019.07.22.03.18.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 03:18:33 -0700 (PDT)
Date:   Mon, 22 Jul 2019 13:18:30 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Jose Abreu <Jose.Abreu@synopsys.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Joao Pinto <Joao.Pinto@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Message-ID: <20190722101830.GA24948@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jul 18, 2019 at 07:48:04AM +0000, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/17/2019, 19:58:53 (UTC+00:00)
> 
> > Let me know if you have any thoughts.
> 
> Can you try attached patch ?
> 

The log says  someone calls panic() right?
Can we trye and figure were that happens during the stmmac init phase?

Thanks
/Ilias

