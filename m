Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4E721EA0F
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 09:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgGNHb4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 03:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgGNHbz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 03:31:55 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8768C061794
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 00:31:55 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id l6so140741plt.7
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 00:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J3KZkLfKSbC5BZHL1d7yO/DwRivb2bB63Afyu0rAU7c=;
        b=neWIcuYRVYuNZuF10/O3q7zrFJP1sqCxlXB97WQT2VbL3vvBdpupQ/95yQPa2zdUQu
         wWarWnCZZcwf31IYFbOm+0q9QrPLM7Y8VaO6OcTrVRqtC3+QFlWdTwLVX7e0vRZwY6C6
         8gRJ4wKSV1CbCtbXTPTT7XBQRZItRciZ0RyMPlDxmi3EctrZQQPeIYMH7XpPKnCw7z+U
         uEQI4ZGtjktdxDrhh5dbQEkESc+LhHRT/iFVbo8EXDxc8fzcEQD0tleyYa+uyntfo+Rj
         0SRP+ixxeCsrRkMY0LSTqJrx/KJemBooUE5Xz5iB+BuNSrY8NVsn1xi7mDHZ/WeLHUAM
         6J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J3KZkLfKSbC5BZHL1d7yO/DwRivb2bB63Afyu0rAU7c=;
        b=MsiFtmMJgkCF2BOKTzezC6e46UGy9ElblLiJs3KhdhbNnVJ9cT1BQMfm3dd8ajSc8X
         iyx0bu/JO0dz3tHpiTPiYpLEj6nlsDiOqkGq5zF+RW7vqNh+k5B3w17jibXLuEKwkgwz
         z+7co2Ukco3SekZuxRivtb/mesB8W8FBuwYSKnBn2BDFERZf5cwLohYxaNN31CQPyzuo
         Z3RmMh44+4u22vhYO6ZatiWYzB7nmzr8C3LIkyWUD822DXlfns/aG85HWjkJYBsVFByq
         2EsEAJ1+8p5581l2V4BqhmZp41b+q3n410qkdZP8wNh4Z/yzLpKCv17w3a5Ri++2WlAx
         CXEg==
X-Gm-Message-State: AOAM532EXb4ffHlLnD3Cf91TJXCD4ViJLmAKpexDU6yQIEWyf9h5RnzB
        tOan0KsQ1N9DAmx3K0lMln8oKw==
X-Google-Smtp-Source: ABdhPJz4Gu9yn7RPaM4tJg1tqh+c8051L0lJfupoplxt4ZQbS1Uj9OmeRr99/0ypRIpDK6J+yF33xw==
X-Received: by 2002:a17:90b:300d:: with SMTP id hg13mr3447366pjb.212.1594711914895;
        Tue, 14 Jul 2020 00:31:54 -0700 (PDT)
Received: from localhost ([122.172.34.142])
        by smtp.gmail.com with ESMTPSA id g6sm16518336pfr.129.2020.07.14.00.31.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jul 2020 00:31:53 -0700 (PDT)
Date:   Tue, 14 Jul 2020 13:01:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20200714073152.cof7pdgevcaettm2@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200713032554.cykywnygxln6ukrl@vireshk-i7>
 <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
 <20200714034635.2zdv3wzmftjg2t4a@vireshk-i7>
 <aa941c67-1dec-5363-7bd7-5e9d8d324110@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa941c67-1dec-5363-7bd7-5e9d8d324110@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14-07-20, 08:26, Jon Hunter wrote:
> OK, I can add a get callback. However, there are a few other drivers
> that set the current frequency in the init() and don't implement a get()
> callback ...
> 
> drivers/cpufreq/pasemi-cpufreq.c
> drivers/cpufreq/ppc_cbe_cpufreq.c

These are quite old and I am not sure why they didn't do it.

> drivers/cpufreq/intel_pstate.c

With intel-pstate driver, the firmware sets the frequency of the CPUs
and it can be different from what cpufreq core has asked it to. And so
the kernel normally has no idea of what the frequency a CPU is running
at.

-- 
viresh
