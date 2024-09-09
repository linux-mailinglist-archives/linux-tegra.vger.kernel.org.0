Return-Path: <linux-tegra+bounces-3668-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029F971A90
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 15:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E59A1F23C35
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Sep 2024 13:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DCA1B86DB;
	Mon,  9 Sep 2024 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="HT4WVn2r"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44E1779BD
	for <linux-tegra@vger.kernel.org>; Mon,  9 Sep 2024 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887711; cv=none; b=BFCkNTyVIgueiSLGZoqRUsPBbYkloa31HJWY+AJXlf8/e0ng+JxytPNJRxSYmvY/eCAQz4K766W69FM7007L0IbTyz01mBISo8JB1JrV9U3WuyzGX7a4Z+b1wgDm57uUqpumd9Wvn7DtYl65RHp1Y3GXg8AUufK3PaxYFtqiIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887711; c=relaxed/simple;
	bh=6mdNTEsjiQN5pqvgQZf5ZMa+SrjewyKRq3O8UeBPb4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VU8wDOgx6UgXnobAz0hBC/M76h/h6dft6kmlJOcSq6AQMld0I3TZ6h5z94W1QZ6Yj4eMlSOFpPgwhzbH79P3qdBbuelgQ5ANe9cViHgAez8sf0P7OAhjbb+LR3d8iBlExaizo874WGID122oJUxIIUBScge734IR4tGufvs7jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=HT4WVn2r; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 15DE73F5B9
	for <linux-tegra@vger.kernel.org>; Mon,  9 Sep 2024 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725887703;
	bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=HT4WVn2rEU7HcMBi6vRbg1CDjyLTWWPisIhhwiU1vcfG2PzbYzWZmmw0HzQn52u2c
	 aimgQcgpG5JIqgLZCyrn91Q4QsVB9U7LEoBXiHog54am0afdj+3bc9EQoj8uYu/X3o
	 EixN/HJGlObWFQ1icAw6EsEOswmKZGCfDYPP8cJB5SZGCPa3bt+kKf6l1Nl+IvU37G
	 G1XBG2gtjiB/8vWGkHEtUZM+zOrlrRJgkASPl8zZnkj1QqVY9fZuS+9G/tOgcWBT2t
	 mpq+tx5GwwyFxIk1ULyko+H1DGzfYejR2/Aeh475Jtlh6jpyXpwhV/tXmQNhgH+0Y3
	 fdB2CZKwF9Sjg==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cbcf60722so362065e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Sep 2024 06:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725887700; x=1726492500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1n/O2W+LcrKETL5zYIpc+SVEc0AbjVbXS3O8zNwBEk=;
        b=bBxxCp7u8TNIMmS0CGhz7NY0Np3yj6IqxamCYx35PwSbXncDRxetTYc/QzO/hmocAF
         xcdWrKeorfG4wIp8lm9pV7fAdBj1wkKe7hMQVi/hluUutacC7YwR8ZyTvfTuyNgaaovb
         1Hrws50Gsq9QfW9ysZfx51SVCGBhYYWCuUkRak7tcLN5BhthffyIiIAFmNa0RN5PmXTH
         paZ6ExFkiJOcOlB1WL/ADkZxdBmAdZ8LKovsjkpAVQx8EtbElGSk2KCpDR68e/ug0K9l
         3VfjbMn7gEuuHjOpFsvjlZt7A3UkJ1P8agVHvBu8mQgCGIet6ua3hvFZM4Y/o4HzM9WR
         0QsA==
X-Forwarded-Encrypted: i=1; AJvYcCU5DsnzLI4IHSnOx+bKz0pXE5wC3HkVTaxixXqDynn4zEIXwnkXOmHPN3tW19mRAZXeP8NRE8lXTf/1Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPrZc7Ars8NDjiXwC1hYXWQ5jRFU/rGTtvLr52P3xW+cDtVnA
	hVq/dHmnWn9MXBBp9n+KhdxUCAIq1o4mgQItvLI5wLzbsLaD9oje8ZjESWE5dBc1k2l+Krx9WrW
	Cer+CzkoVRoKlQfRtuSuz9z2rDfm3edRyovcmYZMDd3Z2ikNa1V+f82GaXehGmWCcyc9qubempL
	FH
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9334065e9.12.1725887699783;
        Mon, 09 Sep 2024 06:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOh5t4UDivktvUt6K0PPRZ2R1nhw2jQHB3U8gDmn4MVIqBX9sh6eOQO6zR51vh8x/9pGonlw==
X-Received: by 2002:a05:600c:1d22:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cbaf9c20dmr9333485e9.12.1725887698729;
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Received: from [192.168.103.101] (dynamic-046-114-195-052.46.114.pool.telefonica.de. [46.114.195.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7f1sm77309945e9.48.2024.09.09.06.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:14:58 -0700 (PDT)
Message-ID: <139cd6c2-45e7-46c9-ad17-4d617673fc80@canonical.com>
Date: Mon, 9 Sep 2024 15:14:53 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
To: Celeste Liu <coelacanthushex@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.09.24 14:14, Celeste Liu wrote:
> On 2024-09-09 19:53, Conor Dooley wrote:
> 
>> On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
>>> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>> introduced it because of Docker, but Docker has removed this requirement
>>> since [1] (2023-04-19).
>>>
>>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>>> needs an RT budget assigned, otherwise the processes in it will not be able to
>>> get RT at all. The problem with RT group scheduling is that it requires the
>>> budget assigned but there's no way we could assign a default budget, since the
>>> values to assign are both upper and lower time limits, are absolute, and need to
>>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>>> with values that would work by default in the general case.[2]
>>>
>>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>>> can only be enabled when all RT processes are in the root cgroup. But it will
>>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>>
>>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>>> support it.[3]
>>>
>>> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
>>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
>>>
>>> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
>>
>> I don't think this fixes tag is suitable, the commit you cite in
>> moby/docker is a year younger than the one in the fixes tag, so it was
>> correct at the time it was written. I think the fixes tag should just be
>> removed, since that commit was not wrong. Or am I missing something?
> 
> The Docker commit I cited introduce the fix, not the bug. So it should be later
> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wrong
> config from upstream.
> 
> Timeline is:
> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>                in fixes tag.
> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>                commit I cited.
> 
> [1]: https://github.com/moby/moby/commit/fb85a99f5899df7475ba6b1ac4b2e1d32974eca2

I experience no problems running Docker without CONFIG_RT_GROUP_SCHED on 
Ubuntu 24.04.

The Docker patch is only for contrib/check-config.sh. Probably Docker at 
the time of my patch would have worked without CONFIG_RT_GROUP_SCHED, 
too. I have no issue with the Fixes: tag in this patch.

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> 
>>
>>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>>> ---
>>>   arch/riscv/configs/defconfig | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>> index 12dc8c73a8ac..de85c3ab261e 100644
>>> --- a/arch/riscv/configs/defconfig
>>> +++ b/arch/riscv/configs/defconfig
>>> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>>>   CONFIG_MEMCG=y
>>>   CONFIG_CGROUP_SCHED=y
>>>   CONFIG_CFS_BANDWIDTH=y
>>> -CONFIG_RT_GROUP_SCHED=y
>>>   CONFIG_CGROUP_PIDS=y
>>>   CONFIG_CGROUP_FREEZER=y
>>>   CONFIG_CGROUP_HUGETLB=y
>>>
>>> -- 
>>> 2.46.0
>>>
> 


