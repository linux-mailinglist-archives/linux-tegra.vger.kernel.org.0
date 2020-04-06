Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9219119EF59
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Apr 2020 04:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgDFCra (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 5 Apr 2020 22:47:30 -0400
Received: from mail-pj1-f46.google.com ([209.85.216.46]:54442 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFCra (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 Apr 2020 22:47:30 -0400
Received: by mail-pj1-f46.google.com with SMTP id np9so5870918pjb.4
        for <linux-tegra@vger.kernel.org>; Sun, 05 Apr 2020 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L6SxNTH0XCWDO08MCGA5S5MO0ksHJfV/AHJr6LODNPc=;
        b=IU+Y8FC1HgrRO7zZYpgPFhW60uh9eThxh3QDAZ/VQTqk5dBvwQM4tQvblvHBTfbhRF
         h5AWfiNmRda3SCFQCGzNB2HXzyV1DFAcZjmV4utwJ9i5sYoxLC4pvfqTDsGXWRanOHM5
         IjNO//0yKYBuV+cERjO3wVLA28MJQ0BNzhiPmsepcPXuetITV+ToQoLYfNAjgACND7Yz
         /uwVwFCTH4HxhtrAhjKy0sXh885LhUVWkw+c0ljeN9IellHp20qkJ+yJKMphn3+DBuoP
         aw0UVSx6CLLk5wsUnisR1KTsqJG30mclb76p3JOwW8NgevbPP42EAhRhwsUhPPAROSz3
         Ej0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L6SxNTH0XCWDO08MCGA5S5MO0ksHJfV/AHJr6LODNPc=;
        b=lIYjDUvAGTePJts6BB6XJnP+ri79RefGhI2XtnlR/6973fXTuQbcb5gnOt7U9hio/f
         VNkS3cVu6VibRJASr5Dy+R2SST0ZQZEK87FiWmQfPkHSDxP6TYvbAFrVwJ3gsYnZDw4P
         i8jVkIgOxmWU3jhTb3moNhF94lxmNGt5HzYyMTzqWcW7WZgU5wsUU1CR83Zn9+/SGgeW
         Ei2lfE3LDZmNOGYfw78swi0F5Ra3jJtg2rt78Kg1+tGU+Ksp0Jd/DOhmya8sXiol72Gg
         HxVMo4LhVJrczSGwFWIfWYCv4YHF0nNe+Y+Lev6jQpr43X8PPsnpSJdDHEIGKTfZ/R8Q
         H7LQ==
X-Gm-Message-State: AGi0PuYS2ZRvXFaeYoSW6aJyTX88HJISfWbsTaSGt5STCon/WWwAvcxL
        gZAtA6NXJAfbwUdJbbtLkF6J+w==
X-Google-Smtp-Source: APiQypLMEEARny7oaHdWXifOwzMJe8n167aqCyuBqUeiCXSRo4rYgte0KaxMXgcl8IifcQeVl/Iqhw==
X-Received: by 2002:a17:902:7485:: with SMTP id h5mr18244419pll.205.1586141249322;
        Sun, 05 Apr 2020 19:47:29 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id b25sm10385040pfp.201.2020.04.05.19.47.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Apr 2020 19:47:28 -0700 (PDT)
Date:   Mon, 6 Apr 2020 08:17:26 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch v2 0/3] Add cpufreq driver for Tegra194
Message-ID: <20200406024726.sbtutqsv2t2p2gkg@vireshk-i7>
References: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05-04-20, 00:59, Sumit Gupta wrote:
> The patch series adds cpufreq driver for Tegra194 SOC.
> 
> v1[1] -> v2:
> - Remove cpufreq_lock mutex from tegra194_cpufreq_set_target [Viresh].
> - Remove CPUFREQ_ASYNC_NOTIFICATION flag [Viresh].
> - Remove redundant _begin|end() call from tegra194_cpufreq_set_target.
> - Rename opp_table to freq_table [Viresh].

Have we concluded the earlier discussion already ? I posted some
questions where I had doubts and you just answered them and posted a
new version. Please wait for the reviewers to have a chance to reply
to them. Your new version may be okay, but still we can avoid another
set of patches which may be wrong.

-- 
viresh
