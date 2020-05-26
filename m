Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F221AB644
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 05:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391277AbgDPDhW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Apr 2020 23:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391225AbgDPDhT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Apr 2020 23:37:19 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247B5C061A10
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 20:37:19 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kb16so109007pjb.1
        for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2020 20:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LcBjNCK+rf+2YEVvZPZcsG/AeuTYN98gz3c92chJ7YI=;
        b=N62pR58MzOQlhuf1VXzQKfNlkAe28ps2Bt8L5EhPFsX8/ErCuUSI5IhuhLZ9lPMZmd
         4fv7zApE3he/1DhHZan7KuMcZEMWwp+IYjVqAyT3oeHcIKD+PcmeejcO/8sKarT86ert
         QVi6jh6siT+NHR8Jl67jjHMlF8qduOugqkYjke78fFCESRf64rRWcC/EpNPn4lABmjiZ
         I8uMM3aDZK+rsVSzFl+vX0OPtCPq34gp37JaiW/fs+cxMxplqBiELQX6A0xmEi59cq2I
         tlTKyVcR5aGR1O8fMAoQvlaF9ogOD8KHOruF2CG8CAaGbXxdCDiTn4cl4SHg8QUJytwv
         TKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LcBjNCK+rf+2YEVvZPZcsG/AeuTYN98gz3c92chJ7YI=;
        b=i/w8wdH2xLdjNhjjW6R6Om0QUEjQQUEj/B8SBWLZ3rnT4Mu4Pe+4aLzz7u0zUZtXzS
         YSGNjR3XztnNnXvzsrT2W0TdRCBrGGfX2e4T1m8Z2Uq9VGBoLV7R+d1pR32eQ4BnS6r5
         TyqnlD0qWo27Fenbecoh5nQ00W9TunSJvyem3xiaShJMNEx8itzHQnQhPHfhAmIkE6I7
         Mfn5Zw3g9RnMHS1M3RxSGCiMRfP+4dFx8LZTu8X+HMOOlq1oG5qzr+R8lNpn3Ei+d6lO
         FsleaJSPXRiCMlGWF6a2yAAm9a5VUje4yztyQvICfle2gLJje6RV/RkfcTJaGCRRV8X2
         HTnA==
X-Gm-Message-State: AGi0PuYhtiPr1JkcLKjG8S8aZtfMnhaqNWjds9DnV0PWuT/1pif6Pi8y
        AqrMS5e60nsINdburbQM56uzow==
X-Google-Smtp-Source: APiQypJxmJr4qhcuXMSJJIMqhW62prSNyh3AQwxU2EaTI1aAzDTg8sr0oneUv2CRNeHAM+Dhf3qzxA==
X-Received: by 2002:a17:902:8497:: with SMTP id c23mr8207091plo.335.1587008238452;
        Wed, 15 Apr 2020 20:37:18 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id u8sm14019683pgl.19.2020.04.15.20.37.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 20:37:17 -0700 (PDT)
Date:   Thu, 16 Apr 2020 09:07:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Message-ID: <20200416033715.hscztwkxie2o5i3r@vireshk-i7>
References: <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
 <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
 <08307e54-0e14-14a3-7d6a-d59e1e04a683@nvidia.com>
 <20200409074415.twpzu2n4frqlde7b@vireshk-i7>
 <00390070-38a1-19aa-ca59-42c4658bee7e@nvidia.com>
 <20200413062141.a6hmwipexhv3sctq@vireshk-i7>
 <64b609f1-efb1-425f-a91a-27a492bd3ec4@nvidia.com>
 <20200414054504.e3qn2cnxqur4sclw@vireshk-i7>
 <d6e0eed6-4267-fca9-59e1-02d16e17ff34@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e0eed6-4267-fca9-59e1-02d16e17ff34@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 15-04-20, 16:55, Sumit Gupta wrote:
> 
> 
> On 14/04/20 11:15 AM, Viresh Kumar wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On 13-04-20, 17:50, Sumit Gupta wrote:
> > > This was done considering long delay value as explained previously.
> > > Do you think that smp_call_function_single() would be better than work queue
> > > here?
> > 
> > Don't work with assumptions, you should test both and see which one
> > works better. Workqueue should never be faster than
> > smp_call_function_single() with my understanding.
> Checked the time taken and its almost same in both cases.
> Earlier we used smp_call_function_single(), but delay time period was small
> in that SOC. In T194, the time period was more. So, this is an optimization
> done because using work queue has advantage as interrupts will not be
> disabled for that period.

Hmm, okay, keep the workqueue and mention the required details in a
comment for everyone to understand why the implementation is done that
way.

-- 
viresh
