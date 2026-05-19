Return-Path: <linux-tegra+bounces-14555-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NPZEExPDGqXegUAu9opvQ
	(envelope-from <linux-tegra+bounces-14555-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 13:53:48 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7C57E16D
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 13:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D29393055722
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2026 11:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452D348AE1D;
	Tue, 19 May 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJcFlSg2"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C433A9C4;
	Tue, 19 May 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190885; cv=none; b=ATwDvZI7xWShqiebiv+juCmSvZ57qpx7enUC/kCSet6NNF8fw9OgYw6NR6FqnAcY9xmFCwmzjVoHc1O/xAHgbjoAovKM8k452sNEqqq3chNWTprg8+x+wqE8y8pJyNLqM6+dfDaD2kvWrl3K78S9jnSDVTm17HhlmxJwNyow0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190885; c=relaxed/simple;
	bh=ib9xuq7mz9wkkR2wofm2oAut+oQGRmrHathVnbHHYCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IupjsJw6iYUAHE14EuDl3yM7TWbSrygIEqq+wBmX2SaqvZmUH0NlJIARJ0x5W7iGCT/mePObHZTHt8BzOVtrpM1Av7hqTZY6fMJv56PnpbVkkX9774YfW/UQEsmumSDBlbhFY28ScPh+LUpigQJ9hARnRBLvRefTeENKd0Aofks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJcFlSg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9821C2BCB3;
	Tue, 19 May 2026 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190884;
	bh=ib9xuq7mz9wkkR2wofm2oAut+oQGRmrHathVnbHHYCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJcFlSg2TV6X8YwiNcBW42WILMCCnQupCHhrJ3QN7QQnx6L+SH+oiqdGZ9234bE/J
	 vNG1CSLznWklaAr1qP5KlYIn8iqkxGp1/zfv9D2ZG1/kzmgXuaSXB25RpMLooYey9h
	 KRX7/ow9cMP0BGqlBcHuhbH9dpNvh2NT4A3NGzyxH+xuEHQkETewvOaFotpNYXU5r2
	 BGpykkfz7cpjmxBKi+OiFcXrqNlu+RuTM81ZeRR1k5OPN7Az+uObP5Buo+EUHbJgIe
	 h56GkplHJtSObDS6VVF6kIyj9iAsljGE5Aqi/SPdn8xov881rRbWbuCGzCaP3hAuZq
	 JtM2i7JwrrRDw==
Date: Tue, 19 May 2026 12:41:18 +0100
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: mark.rutland@arm.com, james.clark@linaro.org, yangyccccc@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, treding@nvidia.com,
	jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
	sdonthineni@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com,
	skelley@nvidia.com
Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Message-ID: <agxMXsznrU3mvcfE@willie-the-truck>
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504175204.3122979-1-bwicaksono@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14555-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,gmail.com,lists.infradead.org,vger.kernel.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 44B7C57E16D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 04, 2026 at 05:52:04PM +0000, Besar Wicaksono wrote:
> PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
> PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
> counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
> give results that differ from the programmable counter path.
> 
> Extend the existing PMCCNTR avoidance decision from the SMT case to
> also cover Olympus. Store the result in the common arm_pmu state at
> registration time, so arm_pmuv3 can keep using a single flag when
> deciding whether CPU_CYCLES may use PMCCNTR_EL0.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
> 
> Changes from v1:
>   * add CONFIG_ARM64 check to fix build error found by kernel test robot
>   * add explicit include of <asm/cputype.h>
> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-bwicaksono@nvidia.com/
> 
> Changes from v2:
>   * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
>     common arm_pmu registration path.
>   * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering both
>     the existing SMT restriction and the Olympus MIDR restriction.
>   * Use the cached per-CPU MIDR from cpu_data instead of calling
>     is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
>   * Add the required asm/cpu.h include for cpu_data.
> v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-bwicaksono@nvidia.com/#t
> 
> Changes from v3:
>   * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to make sure
>     the MIDR is retrieved from the correct online CPU.
> v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-bwicaksono@nvidia.com/
> 
> ---
>  drivers/perf/arm_pmu.c       |  7 ++++-
>  drivers/perf/arm_pmuv3.c     | 51 +++++++++++++++++++++++++++++++-----
>  include/linux/perf/arm_pmu.h |  2 +-
>  3 files changed, 51 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 939bcbd433aa..aa1dac0b440f 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
>  	/*
>  	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>  	 * detect the SMT implementation.
> +	 * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clock rather
> +	 * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
>  	 */
> -	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +	pmu->avoid_pmccntr |=
> +		topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>  
>  	if (!pmu->set_event_filter)
>  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 8014ff766cff..1ee4a09d0dcc 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -8,6 +8,7 @@
>   * This code is based heavily on the ARMv7 perf event code.
>   */
>  
> +#include <asm/cputype.h>
>  #include <asm/irq_regs.h>
>  #include <asm/perf_event.h>
>  #include <asm/virt.h>
> @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  	if (has_branch_stack(event))
>  		return false;
>  
> -	/*
> -	 * The PMCCNTR_EL0 increments from the processor clock rather than
> -	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> -	 * counting on a WFI PE if one of its SMT sibling is not idle on a
> -	 * multi-threaded implementation. So don't use it on SMT cores.
> -	 */
> -	if (cpu_pmu->has_smt)
> +	if (cpu_pmu->avoid_pmccntr)
>  		return false;
>  
>  	return true;
> @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct perf_event *event)
>  				       &armv8_vulcan_perf_cache_map);
>  }
>  
> +#ifdef CONFIG_ARM64
> +/*
> + * List of CPUs that should avoid using PMCCNTR_EL0.
> + */
> +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
> +	/*
> +	 * The PMCCNTR_EL0 in Olympus CPU may still increment while in WFI/WFE state.
> +	 * This is an implementation specific behavior and not an erratum.
> +	 *
> +	 * From ARM DDI0487 D14.4:
> +	 *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR count
> +	 *   when the PE is in WFI or WFE state, even if the clocks are not stopped.

So surely the weird part here is that Olypmus chose one behaviour for
PMCCNTR and another for the CPU_CYCLES event? The Arm ARM text isn't
clear to me as to whether that's permitted but I think we should call
it out here.

> +	 * From ARM DDI0487 D24.5.2:
> +	 *   All counters are subject to any changes in clock frequency, including
> +	 *   clock stopping caused by the WFI and WFE instructions.
> +	 *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
> +	 *   PMCCNTR_EL0 continues to increment when clocks are stopped by WFI and
> +	 *   WFE instructions.
> +	 */
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> +	{}
> +};
> +
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
> +}
> +#else
> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  struct armv8pmu_probe_info {
>  	struct arm_pmu *pmu;
>  	bool present;
> @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void *info)
>  	else
>  		cpu_pmu->reg_pmmir = 0;
>  
> +	/*
> +	 * On some CPUs, PMCCNTR_EL0 does not match the behavior of CPU_CYCLES
> +	 * programmable counter, so avoid routing cycles through PMCCNTR_EL0 to
> +	 * prevent inconsistency in the results.
> +	 */
> +	cpu_pmu->avoid_pmccntr |= armv8pmu_is_in_avoid_pmccntr_cpus();

Do we also want to hide the cycle counter from userspace? It sounds like
it's going to get very confused if it tries to use it...

Will

