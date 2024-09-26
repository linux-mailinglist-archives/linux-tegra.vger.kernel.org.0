Return-Path: <linux-tegra+bounces-3811-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BD98719A
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Sep 2024 12:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00F201F27597
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Sep 2024 10:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190671AD3EE;
	Thu, 26 Sep 2024 10:34:33 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638CF1714A3;
	Thu, 26 Sep 2024 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346873; cv=none; b=cEtvwddu/cvImVMl5J5VbZlzI/z/s2kfX8VIDqukRAoHTdlxUPUYvsVT4SdA1ejfCRwkB/SpPdL8C5cxmrv9c37zh2E+kGAPx1kj3+h0m/2QveshS1cFUzB8Q2H7EoharZgxI591oAyI5RP6SUaZ1kkHzFQoO3MAFQmXMq+jb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346873; c=relaxed/simple;
	bh=j9jkgYdjtCg1wz8g8PPmpgAvGOWGQUfsXpHsiwoMrEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcPp/q1Siz1uH3DxyMHS8jm9a1FrKq/5WwTSrIffFRaDd3uPAQibgDTF3HwC40ZQvR1cEaKJlF8q6YAHeZqDyHQElRwR34Fuc7xp/eYh51AGj2S9P0B+zCRITpTzspgEX23Cb0J1Pwc0Xoboi7blNm47+8br0d1emeVCP6E/63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0891212FC;
	Thu, 26 Sep 2024 03:34:58 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A5523F6A8;
	Thu, 26 Sep 2024 03:34:23 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:34:01 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, viresh.kumar@linaro.org,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Bibek Basu <bbasu@nvidia.com>
Subject: Re: [PATCH v7 3/4] arm64: Provide an AMU-based version of
 arch_freq_avg_get_on_cpu
Message-ID: <ZvU4mR_FZa7jXUgk@arm.com>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-4-beata.michalska@arm.com>
 <aa254516-968e-4665-bb5b-981c296ffc35@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa254516-968e-4665-bb5b-981c296ffc35@nvidia.com>

On Tue, Sep 17, 2024 at 05:41:09PM +0530, Sumit Gupta wrote:
> Hi Beata,
Hi Sumit,
> 
> Thank you for the patches.
Thank you for having a look at those.
> 
> On 13/09/24 18:59, Beata Michalska wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > With the Frequency Invariance Engine (FIE) being already wired up with
> > sched tick and making use of relevant (core counter and constant
> > counter) AMU counters, getting the average frequency for a given CPU,
> > can be achieved by utilizing the frequency scale factor which reflects
> > an average CPU frequency for the last tick period length.
> > 
> > The solution is partially based on APERF/MPERF implementation of
> > arch_freq_get_on_cpu.
> > 
> > Suggested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >   arch/arm64/kernel/topology.c | 109 +++++++++++++++++++++++++++++++----
> >   1 file changed, 99 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index cb180684d10d..22e510733336 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -17,6 +17,7 @@
> >   #include <linux/cpufreq.h>
> >   #include <linux/init.h>
> >   #include <linux/percpu.h>
> > +#include <linux/sched/isolation.h>
> > 
> >   #include <asm/cpu.h>
> >   #include <asm/cputype.h>
> > @@ -88,18 +89,28 @@ int __init parse_acpi_topology(void)
> >    * initialized.
> >    */
> >   static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> > -static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
> > -static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
> >   static cpumask_var_t amu_fie_cpus;
> > 
> > +struct amu_cntr_sample {
> > +       u64             arch_const_cycles_prev;
> > +       u64             arch_core_cycles_prev;
> > +       unsigned long   last_scale_update;
> > +};
> > +
> > +static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, cpu_amu_samples);
> > +
> >   void update_freq_counters_refs(void)
> >   {
> > -       this_cpu_write(arch_core_cycles_prev, read_corecnt());
> > -       this_cpu_write(arch_const_cycles_prev, read_constcnt());
> > +       struct amu_cntr_sample *amu_sample = this_cpu_ptr(&cpu_amu_samples);
> > +
> > +       amu_sample->arch_core_cycles_prev = read_corecnt();
> > +       amu_sample->arch_const_cycles_prev = read_constcnt();
> >   }
> > 
> >   static inline bool freq_counters_valid(int cpu)
> >   {
> > +       struct amu_cntr_sample *amu_sample = per_cpu_ptr(&cpu_amu_samples, cpu);
> > +
> >          if ((cpu >= nr_cpu_ids) || !cpumask_test_cpu(cpu, cpu_present_mask))
> >                  return false;
> > 
> > @@ -108,8 +119,8 @@ static inline bool freq_counters_valid(int cpu)
> >                  return false;
> >          }
> > 
> > -       if (unlikely(!per_cpu(arch_const_cycles_prev, cpu) ||
> > -                    !per_cpu(arch_core_cycles_prev, cpu))) {
> > +       if (unlikely(!amu_sample->arch_const_cycles_prev ||
> > +                    !amu_sample->arch_core_cycles_prev)) {
> >                  pr_debug("CPU%d: cycle counters are not enabled.\n", cpu);
> >                  return false;
> >          }
> > @@ -152,17 +163,22 @@ void freq_inv_set_max_ratio(int cpu, u64 max_rate)
> > 
> >   static void amu_scale_freq_tick(void)
> >   {
> > +       struct amu_cntr_sample *amu_sample = this_cpu_ptr(&cpu_amu_samples);
> >          u64 prev_core_cnt, prev_const_cnt;
> >          u64 core_cnt, const_cnt, scale;
> > 
> > -       prev_const_cnt = this_cpu_read(arch_const_cycles_prev);
> > -       prev_core_cnt = this_cpu_read(arch_core_cycles_prev);
> > +       prev_const_cnt = amu_sample->arch_const_cycles_prev;
> > +       prev_core_cnt = amu_sample->arch_core_cycles_prev;
> > 
> >          update_freq_counters_refs();
> > 
> > -       const_cnt = this_cpu_read(arch_const_cycles_prev);
> > -       core_cnt = this_cpu_read(arch_core_cycles_prev);
> > +       const_cnt = amu_sample->arch_const_cycles_prev;
> > +       core_cnt = amu_sample->arch_core_cycles_prev;
> > 
> > +       /*
> > +        * This should not happen unless the AMUs have been reset and the
> > +        * counter values have not been restored - unlikely
> > +        */
> >          if (unlikely(core_cnt <= prev_core_cnt ||
> >                       const_cnt <= prev_const_cnt))
> >                  return;
> > @@ -182,6 +198,8 @@ static void amu_scale_freq_tick(void)
> > 
> >          scale = min_t(unsigned long, scale, SCHED_CAPACITY_SCALE);
> >          this_cpu_write(arch_freq_scale, (unsigned long)scale);
> > +
> > +       amu_sample->last_scale_update = jiffies;
> >   }
> > 
> >   static struct scale_freq_data amu_sfd = {
> > @@ -189,6 +207,77 @@ static struct scale_freq_data amu_sfd = {
> >          .set_freq_scale = amu_scale_freq_tick,
> >   };
> > 
> > +static __always_inline bool amu_fie_cpu_supported(unsigned int cpu)
> > +{
> > +       return cpumask_available(amu_fie_cpus) &&
> > +               cpumask_test_cpu(cpu, amu_fie_cpus);
> > +}
> > +
> > +#define AMU_SAMPLE_EXP_MS      20
> > +
> > +int arch_freq_avg_get_on_cpu(int cpu)
> > +{
> > +       struct amu_cntr_sample *amu_sample;
> > +       unsigned int start_cpu = cpu;
> > +       unsigned long last_update;
> > +       unsigned int freq = 0;
> > +       u64 scale;
> > +
> > +       if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
> > +               return -EOPNOTSUPP;
> > +
> > +retry:
> > +       amu_sample = per_cpu_ptr(&cpu_amu_samples, cpu);
> > +
> > +       last_update = amu_sample->last_scale_update;
> > +
> > +       /*
> > +        * For those CPUs that are in full dynticks mode, and those that have
> 'or those' to match with if condition?
Yeah, might be.
> 
> > +        * not seen tick for a while, try an alternative source for the counters
> > +        * (and thus freq scale), if available, for given policy: this boils
> > +        * down to identifying an active cpu within the same freq domain, if any.
> > +        */
> > +       if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
> > +           time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
> > +               struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> > +               int ref_cpu = cpu;
> > +
> > +               if (!policy)
> > +                       return 0;
> > +
> 
> We can skip the rest of code if policy has a single cpu. AFAIR, one of the
> previous versions had similar check.
> 
>       if (!policy_is_shared(policy)) {
>               cpufreq_cpu_put(policy);
>               goto freq_comput;
>       }
True, we could but then this case is covered by cpumask_next_wrap
which for single-cpu policies will render the ref_cpu invalid,
so policy_is_shared check seemed unnecessary.
> 
> > +               if (!cpumask_intersects(policy->related_cpus,
> > +                                       housekeeping_cpumask(HK_TYPE_TICK))) {
> > +                       cpufreq_cpu_put(policy);
> > +                       return -EOPNOTSUPP;
> > +               }
> > +
> > +
> > +               do {
> > +                       ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> > +                                                   start_cpu, false);
> > +
> > +               } while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> > +
> > +               cpufreq_cpu_put(policy);
> > +
> > +               if (ref_cpu >= nr_cpu_ids)
> > +                       /* No alternative to pull info from */
> > +                       return 0;
> > +
> 
> The 'cpuinfo_avg_freq' node gives 'unknown' value for single CPU per policy
> as 'ref_cpu' increments to 'nr_cpu_ids'. We can use the same CPU instead of
> returning zero if no alternative CPU.
> 
>   # cat /sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_avg_freq
>   <unknown>
> 
>   ----
>       if (ref_cpu >= nr_cpu_ids)
>           /* Use same CPU if no alternative to pull info from */
>           goto freq_comput;
> 
>     ..
>   freq_comput:
>     scale = arch_scale_freq_capacity(cpu);
>     freq = scale * arch_scale_freq_ref(cpu);
>   ----
> 
This boils down to the question what that function, and the information it
provides, represent really. The 'unknown' here simply says the CPU has been idle
for a while and as such the frequency data is a bit stale and it does not
represent the average freq the CPU is actually running at anymore, which is
the intention here really. Or, that the given CPU is a non-housekeeping one.
Either way I believe this is a useful information, instead of providing
stale data with no indication on whether the frequency is really the 'current'
one or not.

If that is somehow undesirable we can discuss this further, though I'd rather
avoid exposing an interface where the feedback provided is open to
interpretation at all times.

---
Best Regards
Beata
> Thank you,
> Sumit Gupta
> 
> P.S. Will be on afk for next 2 weeks with no access to email. Please expect
> a delay in response.
>
> > +               cpu = ref_cpu;
> > +               goto retry;
> > +       }
> > +       /*
> > +        * Reversed computation to the one used to determine
> > +        * the arch_freq_scale value
> > +        * (see amu_scale_freq_tick for details)
> > +        */
> > +       scale = arch_scale_freq_capacity(cpu);
> > +       freq = scale * arch_scale_freq_ref(cpu);
> > +       freq >>= SCHED_CAPACITY_SHIFT;
> > +       return freq;
> > +}
> > +
> 
> >   static void amu_fie_setup(const struct cpumask *cpus)
> >   {
> >          int cpu;
> > --
> > 2.25.1
> > 

