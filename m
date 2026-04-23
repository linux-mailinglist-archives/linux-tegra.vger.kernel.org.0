Return-Path: <linux-tegra+bounces-13853-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APNKIVHZ6WmglQIAu9opvQ
	(envelope-from <linux-tegra+bounces-13853-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Apr 2026 10:33:21 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58944E92F
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Apr 2026 10:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB0A3006B34
	for <lists+linux-tegra@lfdr.de>; Thu, 23 Apr 2026 08:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E61F3BE161;
	Thu, 23 Apr 2026 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LWYSpM2R"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606237C901
	for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932987; cv=none; b=MBmx3PpfplXCH3XTGt6osfUVcoX7Dg0iOYKWg7mgZ1x92U6D9HBktBINTgIE0j0az95vkAUhUhL7LzpD0P4oYqZC3qom0dJHBcXQyqnO4cxYyDRyPsLI71U19ts6e773mUb7IV4qMMIh+NHg00fuFu9zPgE64l1xuZ7BtD29kKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932987; c=relaxed/simple;
	bh=lbpqo6vDxDFBh4nHrSYB6BNkF8fjuhE8x0fGmQIogZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jyxkw5Lfybp9dwrfnpQ/3rd83rQs70jPditpa9kr2wDgONeH4AfUS9Jcfp5kbMDO8JCyzxLMcNVuJb0mHZZHufJno/YVBaAjV4W0spubIGpu02bZ/wBA1aHtRFYIDh2wzjNavunyt8Q+8sh9PwSUgJRvtVu1u4NZSdpRq1ZB8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LWYSpM2R; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfce3a195so3707087f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 23 Apr 2026 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776932984; x=1777537784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AENNTTd3R/9cLJM0CQS1RbWnKVbNQXFO4xjBrlLHig=;
        b=LWYSpM2Rlxtuw0WH4ND02rvjb6Q41vxo+hqcbdsM3Oylk7udgqR4KeRMip43EaFt9X
         XT2hddJw+9VtaDmYiwjJdO901/tJ97XDbSkThWm9OyB/+pZNlrjRqaaWUMgw1TMAY4cn
         EvMOm7xx22K7hILTOjrM0hLFduJS9hQesDNn8yBiLkWpu2MNbPfhTtIJ94D/KBRAEMMn
         sJkniQP4XHfoH+QcR6dWNy34spxsznewqBJr9/H71CgFPI6bzvbvukTUs5W8CrJaCuvJ
         c/02WBUq6KD4t7fbHyifBZNZ2YMd3IxfpB0ZZLlNsyt5NQIrj/JL9fwiBaMZ4mtNxHUb
         KhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932984; x=1777537784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AENNTTd3R/9cLJM0CQS1RbWnKVbNQXFO4xjBrlLHig=;
        b=NqACXniRdhcJCNvUZXleJ9WbTlh2teVhArNyR0Mb5d7On76GCsr9L6trrya9WfUDSR
         nTWDXdESkGo5NcvYmPabu5S1R1uwUKqtYnD47JWQL+5wAPArHHdhd1IJX8wDCndx2j/J
         mA1VRlEcjgVup6J6ZsQG1HKyOG9EIcXAxLaK2wa2lkSwnUzGm2RQEV2tu4aQbHzd6p/O
         nbN7ORFou/GPIyeKugG+j9mMILblH2bjiNbCMrE/NGUt1MmIxrOqegwcogcsfu/0/FhF
         nQgfbq4N720J8CImK16xDybvIe8kqzhJNz4cAAJWdK5V03NtwXYIeNZ+176y7hq5g8Jp
         qYBg==
X-Forwarded-Encrypted: i=1; AFNElJ/WN36xIta9a38AhZP4SkZHoi19npmuAjH+9DGMAMjnWLkH88bWEqgxKIcse19Wvdk3Mkxws+8O5PIChA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/scBke5F/r1CbZBBxgWxa54Mt4sQluvuRyUgYTliWtD0fjifS
	G9HPxExnGr4y0S5+Zv5+LslMIiLfKrDk8aIMnhxQ+xoetuMvSvsVsWuNBlCs1aOM7PU=
X-Gm-Gg: AeBDiet53Fk/2ySmDhcX/Y/5kgJ8ol/J4PRf2+x6/95+R3DcGprjE6Bh+KHU48Pl++f
	uQiZh1eRN6dghQKCuD2cTs/pC1FIZ3zC393g+hGJUOh5FGTW0FLbtJw3327l4QIH1aDsNcrTGh5
	EiiHDoez4b5BRodIKbvRlr4D42W6guVekjXXt0RhNoPBDiu8MDv4KE6wPz4XZnsPOo/uvqFK+bG
	uc9eoS/n9te9puNHCuXHZvh4N6fOd2WmgpHEk8BZyCct+KTTkCwDzWaw72wiGLFJSgHsPEBUWZ7
	z2p54NO1y9DagmuKhfpxK8rmCOc711Czbvk52GbAL05IYAv2fuYN/pWvOJLW4/UjacIx4uFzqq9
	14VnfEgzFbHbDFmf9iQTnGMibodAfL8q7I4CnwY2BaCLQBJ3aOdOnoLoNMcT1yu9kpKKYNDfspY
	2VIH95WegwPga1cv2AG88CSSYa9+6bwq2jmiR9saGarj8=
X-Received: by 2002:a05:6000:4287:b0:43f:e7c9:2402 with SMTP id ffacd0b85a97d-43fe7c9254bmr41064062f8f.3.1776932983879;
        Thu, 23 Apr 2026 01:29:43 -0700 (PDT)
Received: from [192.168.178.64] ([84.246.200.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm3135708f8f.26.2026.04.23.01.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:29:43 -0700 (PDT)
Message-ID: <5cc2f7b0-852d-4feb-8d47-39aac44e0093@linaro.org>
Date: Thu, 23 Apr 2026 09:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, Sean Kelley <skelley@nvidia.com>,
 "will@kernel.org" <will@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>
References: <20260421203856.3539186-1-bwicaksono@nvidia.com>
 <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
 <SN7PR12MB722693E924425893F4A62D54A02D2@SN7PR12MB7226.namprd12.prod.outlook.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <SN7PR12MB722693E924425893F4A62D54A02D2@SN7PR12MB7226.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13853-lists,linux-tegra=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[james.clark@linaro.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,nvidia.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: DB58944E92F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22/04/2026 21:17, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: James Clark <james.clark@linaro.org>
>> Sent: Wednesday, April 22, 2026 5:33 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> mark.rutland@arm.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
>> <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
>> <rwiley@nvidia.com>; Shanker Donthineni <sdonthineni@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Nirmoy Das <nirmoyd@nvidia.com>; Sean Kelley
>> <skelley@nvidia.com>
>> Subject: Re: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA
>> Olympus
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 21/04/2026 21:38, Besar Wicaksono wrote:
>>> The PMCCNTR_EL0 in NVIDIA Olympus CPU may increment while
>>> in WFI/WFE, which does not align with counting CPU_CYCLES
>>> on a programmable counter. Add a MIDR range entry and
>>> refuse PMCCNTR_EL0 for cycle events on affected parts so
>>> perf does not mix the two behaviors.
>>>
>>> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
>>> ---
>>>
>>> Changes from v1:
>>>     * add CONFIG_ARM64 check to fix build error found by kernel test robot
>>>     * add explicit include of <asm/cputype.h>
>>> v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-
>> bwicaksono@nvidia.com/
>>>
>>> ---
>>>    drivers/perf/arm_pmuv3.c | 44
>> ++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>>> index 8014ff766cff..7c39d0804b9f 100644
>>> --- a/drivers/perf/arm_pmuv3.c
>>> +++ b/drivers/perf/arm_pmuv3.c
>>> @@ -8,6 +8,7 @@
>>>     * This code is based heavily on the ARMv7 perf event code.
>>>     */
>>>
>>> +#include <asm/cputype.h>
>>>    #include <asm/irq_regs.h>
>>>    #include <asm/perf_event.h>
>>>    #include <asm/virt.h>
>>> @@ -978,6 +979,41 @@ static int armv8pmu_get_chain_idx(struct
>> pmu_hw_events *cpuc,
>>>        return -EAGAIN;
>>>    }
>>>
>>> +#ifdef CONFIG_ARM64
>>> +/*
>>> + * List of CPUs that should avoid using PMCCNTR_EL0.
>>> + */
>>> +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] = {
>>> +     /*
>>> +      * The PMCCNTR_EL0 in Olympus CPU may still increment while in
>> WFI/WFE state.
>>> +      * This is an implementation specific behavior and not an erratum.
>>> +      *
>>> +      * From ARM DDI0487 D14.4:
>>> +      *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR
>> count
>>> +      *   when the PE is in WFI or WFE state, even if the clocks are not stopped.
>>> +      *
>>> +      * From ARM DDI0487 D24.5.2:
>>> +      *   All counters are subject to any changes in clock frequency, including
>>> +      *   clock stopping caused by the WFI and WFE instructions.
>>> +      *   This means that it is CONSTRAINED UNPREDICTABLE whether or not
>>> +      *   PMCCNTR_EL0 continues to increment when clocks are stopped by
>> WFI and
>>> +      *   WFE instructions.
>>> +      */
>>> +     MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>>> +     {}
>>> +};
>>> +
>>> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
>>> +{
>>> +     return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
>>> +}
>>> +#else
>>> +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
>>> +{
>>> +     return false;
>>> +}
>>> +#endif
>>> +
>>>    static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>>>                                     struct perf_event *event)
>>>    {
>>> @@ -1011,6 +1047,14 @@ static bool armv8pmu_can_use_pmccntr(struct
>> pmu_hw_events *cpuc,
>>>        if (cpu_pmu->has_smt)
>>>                return false;
>>>
>>> +     /*
>>> +      * On some CPUs, PMCCNTR_EL0 does not match the behavior of
>> CPU_CYCLES
>>> +      * programmable counter, so avoid routing cycles through PMCCNTR_EL0
>> to
>>> +      * prevent inconsistency in the results.
>>> +      */
>>> +     if (armv8pmu_is_in_avoid_pmccntr_cpus())
>>> +             return false;
>>> +
>>
>> Hi Besar,
>>
>> This is called from armpmu_event_init() before the event is scheduled on
>> the CPU so I don't think reading the MIDR at this point is safe.
>>
>> When the PMU is probed you probably need to do an SMP call to get the
>> MIDR of CPUs in that PMU's mask and then cache the "avoid pmccntr"
>> result like has_smt. Or even rename has_smt to avoid_pmccntr and combine
>> the two results there.
>>
>> I don't know what will happen if none of those CPUs are online when the
>> PMU is probed though...
>>
> 
> Hi James,
> 
> has_smt, iiuc, is common to all the supported CPUs of the PMU context.
> It is configured based on the first CPU in supported cpu list.
> 
>      pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> 
> Is it okay to use same approach? Can we assume all CPUs in supported_cpus have same midr?
> 

They should have the same MIDR otherwise it would be misconfigured, or 
at least the PMUs should behave exactly the same way for all CPUs in the 
mask. I think the whole point of separate PMUs is for heterogeneous systems.

As long as all CPUs in that mask behave the same way, then reading the 
MIDR from any CPU in that mask should be ok. We do it that way for SPE 
as well:

   /* Make sure we probe the hardware on a relevant CPU */
   ret = smp_call_function_any(mask,  __arm_spe_pmu_dev_probe, spe_pmu, 1);


> Thanks,
> Besar
> 
> 
> 
> 


