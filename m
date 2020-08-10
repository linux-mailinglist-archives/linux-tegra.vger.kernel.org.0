Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D51E24049C
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Aug 2020 12:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgHJKUA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 10 Aug 2020 06:20:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgHJKUA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Aug 2020 06:20:00 -0400
Received: from gaia (unknown [95.146.230.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65823206C3;
        Mon, 10 Aug 2020 10:19:57 +0000 (UTC)
Date:   Mon, 10 Aug 2020 11:19:55 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Will Deacon <will@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hulk Robot <hulkci@huawei.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Bibek Basu <bbasu@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH -next] arm64: Export __cpu_logical_map
Message-ID: <20200810101954.GA9480@gaia>
References: <20200724030433.22287-1-wangkefeng.wang@huawei.com>
 <82f750c4-d423-1ed8-a158-e75153745e07@huawei.com>
 <20200724131059.GB6521@bogus>
 <00cf6e67-16ed-872d-2c16-0ceea6b6f514@nvidia.com>
 <20200727160515.GA8003@bogus>
 <e3a4bc21-c334-4d48-90b5-aab8d187939e@nvidia.com>
 <20200810074956.GB28091@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810074956.GB28091@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Aug 10, 2020 at 08:49:56AM +0100, Sudeep Holla wrote:
> On Sat, Aug 01, 2020 at 05:46:43PM +0530, Sumit Gupta wrote:
> > > > > > > ERROR: modpost: "__cpu_logical_map" [drivers/cpufreq/tegra194-cpufreq.ko] undefined!
> > > > > > >
> > > > > > > ARM64 tegra194-cpufreq driver use cpu_logical_map, export
> > > > > > > __cpu_logical_map to fix build issue.
> > > > > > >
> > > > >
> > > > > I wonder why like other instances in the drivers, the mpidr is not get
> > > > > directly from the cpu. The cpufreq_driver->init call happens when the cpu
> > > > > is being brought online and is executed on the required cpu IIUC.
> > > >
> > > > Yes, this occurs during hotplug case.
> > > > But in the case of system boot, 'cpufreq_driver->init' is called later
> > > > during cpufreq platform driver's probe. The value of CPU in 'policy->cpu'
> > > > can be different from the current CPU. That's why read_cpuid_mpidr() can't
> > > > be used.
> > >
> > > Fair enough, why not do cross call like in set_target ? Since it is one-off
> > > in init, I don't see any issue when you are doing it runtime for set_target.
> > >
> > > > > read_cpuid_mpidr() is inline and avoids having to export the logical_cpu_map.
> > > > > Though we may not add physical hotplug anytime soon, less dependency
> > > > > on this cpu_logical_map is better given that we can resolve this without
> > > > > the need to access the map.
> > >
> > > To be honest, we have tried to remove all the dependency on cluster id
> > > in generic code as it is not well defined. This one is tegra specific
> > > driver so should be fine. But I am still bit nervous to export
> > > cpu_logical_map as we have no clue what that would mean for physical
> > > hotplug.
> >
> > As suggested, I have done below change to get the cluster number using
> > read_cpuid_mpidr(). Please review and suggest if this looks ok?
> > I will send formal patch if the change is fine.
> >
> > diff --git a/drivers/cpufreq/tegra194-cpufreq.c
> > b/drivers/cpufreq/tegra194-cpufreq.c
> > index bae527e..06f5ccf 100644
> > --- a/drivers/cpufreq/tegra194-cpufreq.c
> > +++ b/drivers/cpufreq/tegra194-cpufreq.c
> > @@ -56,9 +56,11 @@ struct read_counters_work {
> >
> >  static struct workqueue_struct *read_counters_wq;
> >
> > -static enum cluster get_cpu_cluster(u8 cpu)
> > +static void get_cpu_cluster(void *cluster)
> >  {
> > -       return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 1);
> > +       u64 mpidr = read_cpuid_mpidr() & MPIDR_HWID_BITMASK;
> > +
> > +       *((uint32_t *) cluster) = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> >  }
> >
> >  /*
> > @@ -186,8 +188,10 @@ static unsigned int tegra194_get_speed(u32 cpu)
> >  static int tegra194_cpufreq_init(struct cpufreq_policy *policy)
> >  {
> >         struct tegra194_cpufreq_data *data = cpufreq_get_driver_data();
> > -       int cl = get_cpu_cluster(policy->cpu);
> >         u32 cpu;
> > +       u32 cl;
> > +
> > +       smp_call_function_single(policy->cpu, get_cpu_cluster, &cl, true);
> 
> Thanks for this, looks good to me. You can add:
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

I already merged Kefeng's __cpu_logical_map fix (commit eaecca9e7710)
but if the above goes in, I can drop the EXPORT_SYMBOL part (and keep
the rest as it's a good refactoring).

-- 
Catalin
