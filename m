Return-Path: <linux-tegra+bounces-5226-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB89A3D6F5
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Feb 2025 11:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23AAC7A463B
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Feb 2025 10:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B551F0E31;
	Thu, 20 Feb 2025 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8McK5/m"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757471F12E7
	for <linux-tegra@vger.kernel.org>; Thu, 20 Feb 2025 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048062; cv=none; b=GnN9QM063l6vfzYwrDVseEx4BTVPjJPqBFzbgpYcq+rCgZO0jOwJk0aSjuI8cWxxXKq9VPRtlgYpY2KDnFiys4tI6bEo+pkd4/5zrvwNtKhYBABoQVXnwU6zeM8HI0q2G2JB+CUdOCzg7nGz3viKG71ry9RA3XP8M8FfY+fAwfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048062; c=relaxed/simple;
	bh=554yhaBP/3qxfNbZcQBh8gMdf5Fu/67iXhId/NAW/Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVnp+5l69j2qyyDvu9nLHK0PYXjMR+CMCjsReRO26yq0Kx33we25QBgJ1P804jnfBOWelETYaqgHjbOCcpZ7Qn5k2RNxtkcmX+CizDxD9WHHcqilQYiXLObQGolZNBjYj7dajF/lAo7yIEvJ4CRgKyochI908t2DxmbNDi8pdtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8McK5/m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740048059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kt3GhjiWRt65nJ5tPSuoAxO5Kw5ysLUhxQqBlrMrjnk=;
	b=B8McK5/mSYTShljHAuhgpKWq5swmL5tyI9U3almO02LSkTigYS1SNRKHTajiL13zFDx0ON
	+s4dHPW/KeQ49KrtNw9a6aJ4SpjOObI9N1HfwjdYRq9c2u5OK7sVJE6Y2yEyUF9dn7B13j
	t0gfLWnRBni4EbVRRY7rpK+zE51fQPw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-IuNozeX0P_yFt2EHfmtOsA-1; Thu, 20 Feb 2025 05:40:57 -0500
X-MC-Unique: IuNozeX0P_yFt2EHfmtOsA-1
X-Mimecast-MFC-AGG-ID: IuNozeX0P_yFt2EHfmtOsA_1740048056
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43998ec3733so3701775e9.2
        for <linux-tegra@vger.kernel.org>; Thu, 20 Feb 2025 02:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048051; x=1740652851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt3GhjiWRt65nJ5tPSuoAxO5Kw5ysLUhxQqBlrMrjnk=;
        b=bOGgIRSFGFpOvAtUfiJld/rQ9qXSmxo7tcenY+BWEX2OIFianH1CJ/UY8FqPalhUpd
         tp+BZ4diK/HTu+YxF3dsSxfw0xHPq8FAvGM18k7SbDvkLxx31JV/vXxe4VQ8RFnaD80N
         dUQoTMHmPBmAKZtyGYXPp1Js93y6epzgee0zGf6FfYXkRA9v1HMvpfZZ6Jr2XS6wvwL/
         svClEPxHQmodWYPS7XaL8OR7Q0H5LXtKdvj74HfKia8p4Bpi3Ne1qQ4RKaejJdTV7GlI
         r+gHT8X8mEcx0xNlvYbI0oHZqxANCMPD2jzaPFYsS5YeFrD75yOfzfFwjlvj9RzTAl/Z
         pXUg==
X-Forwarded-Encrypted: i=1; AJvYcCVCTbbjQPtodGf22HUG3xiQedUIjruIK4p9/V0avAoMYQ1d4eYt0eJeNK+3NxvjZbuWzOQD9raWDuVwzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG9lrZlzkxltKLaBbi/1yKJYtMsF5fovTL+NDW3rDcAVvJL+YU
	wHSUVwA1j2TMBSJadP6Dg+cs1VwQzrS9xL1ARLwbCgcB17z5qlTd6oKsYb3lYEyRBZwUKhGzfmk
	Hn9czlvrGFBCasjgcskl0MPPw8MXFK/2/E2BCk4JXNNmnwzQPaiAfPM5oWgu5
X-Gm-Gg: ASbGncuDWMc6wUESQqUQSSDS31ugk4sWVWEKe4TRQID3mvjzHlefgiJejSR5mzVO+kT
	xgheWIY77JIGevEmN/zdyMxVV45Gfzb2UCnpJjiDxAITuOg2v89aIlRqqWWEeB0bVWDAyGxAEIT
	Y5kaW3pIiSMJNx9rUHzVt9+x9zpqVecJKSbqljZVoxB2Ibf9CcXqkdWy6czZnNrOR4u/JfSlmNT
	xPl3oqgfq/CiGIGvAv8qmSYZy1IaRFcGr0/+FLa7NjBMwm05d6iShdntZQTmJuGhG2aAay1pfXm
	ypRHSHETo2gjD7K6hmPw5tE01wdIW6CN7Q==
X-Received: by 2002:a05:600c:314d:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-4399898f441mr68419455e9.26.1740048050991;
        Thu, 20 Feb 2025 02:40:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX6B5S875r6pRDNl9Zm1M4sz26ytNSLf3feicsocEfDCIzKzuKvG3EWcYOJnRmZ81qqPm9kQ==
X-Received: by 2002:a05:600c:314d:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-4399898f441mr68419005e9.26.1740048050482;
        Thu, 20 Feb 2025 02:40:50 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43994f0c10csm71395725e9.26.2025.02.20.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:40:49 -0800 (PST)
Date: Thu, 20 Feb 2025 11:40:46 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <treding@nvidia.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <Z7cGrlXp97y_OOfY@jlelli-thinkpadt14gen4.remote.csb>
References: <30a8cda5-0fd0-4e47-bafe-5deefc561f0c@nvidia.com>
 <151884eb-ad6d-458e-a325-92cbe5b8b33f@nvidia.com>
 <Z7Ne49MSXS2I06jW@jlelli-thinkpadt14gen4.remote.csb>
 <Z7RZ4141H-FnoQPW@jlelli-thinkpadt14gen4.remote.csb>
 <d7cc3a3c-155e-4872-a426-cbd239d79cac@arm.com>
 <Z7SWvr86RXlBbJlw@jlelli-thinkpadt14gen4.remote.csb>
 <a0f03e3e-bced-4be7-8589-1e65042b39aa@arm.com>
 <Z7WsRvsVCWu_By1c@jlelli-thinkpadt14gen4.remote.csb>
 <4c045707-6f5a-44fd-b2d1-3ad13c2b11ba@arm.com>
 <537f2207-b46b-4a5e-884c-d6b42f56cb02@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <537f2207-b46b-4a5e-884c-d6b42f56cb02@arm.com>

On 19/02/25 19:14, Dietmar Eggemann wrote:
> On 19/02/2025 14:09, Dietmar Eggemann wrote:
> > On 19/02/2025 11:02, Juri Lelli wrote:
> >> On 19/02/25 10:29, Dietmar Eggemann wrote:
> 
> [...]
> 
> >> If you already had the patch ignoring sugovs bandwidth in your set, could
> >> you please share the full dmesg?
> > 
> > Will do later today ... busy with other stuff right now ;-(
> 
> l B B l l l
>       ^^^
>       isolcpus=[3,4]
> 
> w/o sugov tasks:
> 
> The issue seems to be that we call partition_sched_domains() for CPU4
> during suspend. Which does not issue a:
> 
>   build_sched_domains() -> cpu_attach_domain() -> rq_attach_root() ->   
>   __dl_server_[de|at]tach_root()

And unfortunately this is the path that I am not able to reproduce at my
end. Looks like the boxes I have access to don't use this method when
suspending (no hotplug).

> [  171.006436] dl_bw_deactivate() called cpu=4
> ...
> [  171.006639] __dl_overflow() dl_b->bw=996147 cap=446 cap_scale(dl_b->bw, cap)=433868 dl_b->total_bw=104856 old_bw=52428 new_bw=0 type=DEF rd->span=3-5
>                                                                                        ^^^^^^^^^^^^^^^^^^^^^(*)
> [  171.006652] dl_bw_manage() cpu=4 cap=446 overflow=0 req=0 return=0 type=DEF
> ...
> [  171.007971] dl_bw_deactivate() called cpu=3
> ...
> [  171.007999] dl_bw_manage: cpu=3 cap=0 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=1 type=DEF span=3-5
>                                                               ^^^^^^^^^^^^^^^ (*) 
> [  171.008010] dl_bw_cpus() cpu=3 rd->span=3-5 cpu_active_mask=0-3 cpus=1 type=DEF
> [  171.008019] dl_bw_manage() cpu=3 cap=0 overflow=1 req=0 return=-16 type=DEF
> [  171.008069] Error taking CPU3 down: -16
> 
> You can see how 'dl_b->total_bw' stays 104856 (2 x util = 51) even
> though CPU4 is off (*).

Right (well, not right :).

> If total_bw would be 52428 for CPU3 going down we would still fail with
> the current code (taking the else path):
> 
> 3604  if (dl_bw_cpus(cpu) - 1)
> 3605    overflow = __dl_overflow(dl_b, cap, fair_server_bw, 0);
> 3606  else
> 3607    overflow = 1;
> 
> but if we would take the if path even when 'dl_bw_cpus(cpu) = 1'
> _dl_overflow() would return false:
> 
> 280  return dl_b->bw != -1 &&
> 281    cap_scale(dl_b->bw, cap) < dl_b->total_bw - old_bw + new_bw;
> 
>        '0 < 52428 - 52428 + 0' is false

OK. The idea of the current logic is that we shouldn't even enter that
branch, as, if total_bw accounting was correct, total_bw for DEF would
be equal to fair_server_bw. So, no additional DEADLINE bandwidth present
and we proceed with offlining.

Let's have a look below.

> ---
> 
> [  170.847396] PM: suspend entry (deep)
> [  170.852093] Filesystems sync: 0.000 seconds
> [  170.859274] Freezing user space processes
> [  170.864616] Freezing user space processes completed (elapsed 0.001 seconds)
> [  170.871614] OOM killer disabled.
> [  170.874861] Freezing remaining freezable tasks
> [  170.880499] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  170.887936] printk: Suspending console(s) (use no_console_suspend to debug)
> [  171.000031] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x114/0x494)
> [  171.001421] Disabling non-boot CPUs ...

CPU5 going offline.

> [  171.001501] dl_bw_deactivate() called cpu=5
> [  171.001518] __dl_bw_capacity() mask=0-2,5 cap=2940
> [  171.001530] dl_bw_cpus() cpu=5 rd->span=0-2,5 cpu_active_mask=0-5 cpumask_weight(rd->span)=4 type=DYN
> [  171.001541] dl_bw_manage: cpu=5 cap=2494 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4 type=DYN span=0-2,5
> [  171.001553] dl_bw_cpus() cpu=5 rd->span=0-2,5 cpu_active_mask=0-5 cpumask_weight(rd->span)=4 type=DYN
> [  171.001567] CPU: 5 UID: 0 PID: 41 Comm: cpuhp/5 Not tainted 6.13.0-09343-g9ce523149e08-dirty #172
> [  171.001578] Hardware name: ARM Juno development board (r0) (DT)
> [  171.001583] Call trace:
> [  171.001587]  show_stack+0x18/0x24 (C)
> [  171.001605]  dump_stack_lvl+0x74/0x8c
> [  171.001621]  dump_stack+0x18/0x24
> [  171.001634]  dl_bw_manage+0x3a0/0x500
> [  171.001650]  dl_bw_deactivate+0x40/0x50
> [  171.001661]  sched_cpu_deactivate+0x34/0x24c
> [  171.001676]  cpuhp_invoke_callback+0x138/0x694
> [  171.001689]  cpuhp_thread_fun+0xb0/0x198
> [  171.001702]  smpboot_thread_fn+0x200/0x224
> [  171.001715]  kthread+0x12c/0x204
> [  171.001727]  ret_from_fork+0x10/0x20
> [  171.001741] __dl_overflow() dl_b->bw=996147 cap=2494 cap_scale(dl_b->bw, cap)=2426162 dl_b->total_bw=209712 old_bw=52428 new_bw=0 type=DYN rd->span=0-2,5
> [  171.001754] dl_bw_manage() cpu=5 cap=2494 overflow=0 req=0 return=0 type=DYN
> [  171.001814] partition_sched_domains() called
> [  171.001821] CPU: 5 UID: 0 PID: 41 Comm: cpuhp/5 Not tainted 6.13.0-09343-g9ce523149e08-dirty #172
> [  171.001831] Hardware name: ARM Juno development board (r0) (DT)
> [  171.001835] Call trace:
> [  171.001838]  show_stack+0x18/0x24 (C)
> [  171.001849]  dump_stack_lvl+0x74/0x8c
> [  171.001862]  dump_stack+0x18/0x24
> [  171.001875]  partition_sched_domains+0x48/0x7c
> [  171.001886]  sched_cpu_deactivate+0x1a8/0x24c
> [  171.001900]  cpuhp_invoke_callback+0x138/0x694
> [  171.001913]  cpuhp_thread_fun+0xb0/0x198
> [  171.001925]  smpboot_thread_fn+0x200/0x224
> [  171.001937]  kthread+0x12c/0x204
> [  171.001948]  ret_from_fork+0x10/0x20
> [  171.001961] partition_sched_domains_locked() ndoms_new=1
> [  171.002012] cpu_attach_domain() called cpu=0 type=DEF
> [  171.002018] CPU0 attaching NULL sched-domain.
> [  171.002022] span=3-4
> [  171.002029] rq_attach_root() called cpu=0 type=DEF
> [  171.002043] dl_bw_cpus() cpu=0 rd->span=0-2,5 cpu_active_mask=0-4 cpus=3 type=DYN
> [  171.002053] __dl_server_detach_root() called cpu=0
> [  171.002059] dl_bw_cpus() cpu=0 rd->span=0-2,5 cpu_active_mask=0-4 cpus=3 type=DYN
> [  171.002068] __dl_sub() tsk_bw=52428 dl_b->total_bw=157284 type=DYN rd->span=0-2,5
> [  171.002077] __dl_update() (3) cpu=0 rq->dl.extra_bw=603812
> [  171.002083] __dl_update() (3) cpu=1 rq->dl.extra_bw=869446
> [  171.002089] __dl_update() (3) cpu=2 rq->dl.extra_bw=1013623
> [  171.002098] dl_bw_cpus() cpu=0 rd->span=0,3-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=3 type=DEF
> [  171.002109] __dl_server_attach_root() called cpu=0
> [  171.002114] dl_bw_cpus() cpu=0 rd->span=0,3-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=3 type=DEF
> [  171.002124] __dl_add() tsk_bw=52428 dl_b->total_bw=157284 type=DEF rd->span=0,3-4
> [  171.002133] __dl_update() (3) cpu=0 rq->dl.extra_bw=586336
> [  171.002139] __dl_update() (3) cpu=3 rq->dl.extra_bw=1004885
> [  171.002145] __dl_update() (3) cpu=4 rq->dl.extra_bw=1017992
> [  171.002153] cpu_attach_domain() called cpu=1 type=DEF
> [  171.002159] CPU1 attaching NULL sched-domain.
> [  171.002163] span=0,3-4
> [  171.002169] rq_attach_root() called cpu=1 type=DEF
> [  171.002181] dl_bw_cpus() cpu=1 rd->span=1-2,5 cpu_active_mask=0-4 cpus=2 type=DYN
> [  171.002191] __dl_server_detach_root() called cpu=1
> [  171.002196] dl_bw_cpus() cpu=1 rd->span=1-2,5 cpu_active_mask=0-4 cpus=2 type=DYN
> [  171.002206] __dl_sub() tsk_bw=52428 dl_b->total_bw=104856 type=DYN rd->span=1-2,5
> [  171.002215] __dl_update() (3) cpu=1 rq->dl.extra_bw=895660
> [  171.002221] __dl_update() (3) cpu=2 rq->dl.extra_bw=1039837
> [  171.002228] dl_bw_cpus() cpu=1 rd->span=0-1,3-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=4 type=DEF
> [  171.002238] __dl_server_attach_root() called cpu=1
> [  171.002243] dl_bw_cpus() cpu=1 rd->span=0-1,3-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=4 type=DEF
> [  171.002253] __dl_add() tsk_bw=52428 dl_b->total_bw=209712 type=DEF rd->span=0-1,3-4
> [  171.002262] __dl_update() (3) cpu=0 rq->dl.extra_bw=573229
> [  171.002267] __dl_update() (3) cpu=1 rq->dl.extra_bw=882553
> [  171.002273] __dl_update() (3) cpu=3 rq->dl.extra_bw=991778
> [  171.002279] __dl_update() (3) cpu=4 rq->dl.extra_bw=1004885
> [  171.002286] cpu_attach_domain() called cpu=2 type=DEF
> [  171.002291] CPU2 attaching NULL sched-domain.
> [  171.002296] span=0-1,3-4
> [  171.002301] rq_attach_root() called cpu=2 type=DEF
> [  171.002314] dl_bw_cpus() cpu=2 rd->span=2,5 cpu_active_mask=0-4 cpus=1 type=DYN
> [  171.002323] __dl_server_detach_root() called cpu=2
> [  171.002329] dl_bw_cpus() cpu=2 rd->span=2,5 cpu_active_mask=0-4 cpus=1 type=DYN
> [  171.002338] __dl_sub() tsk_bw=52428 dl_b->total_bw=52428 type=DYN rd->span=2,5
> [  171.002346] __dl_update() (3) cpu=2 rq->dl.extra_bw=1092265
> [  171.002353] dl_bw_cpus() cpu=2 rd->span=0-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=5 type=DEF
> [  171.002363] __dl_server_attach_root() called cpu=2
> [  171.002368] dl_bw_cpus() cpu=2 rd->span=0-4 cpu_active_mask=0-4 cpumask_weight(rd->span)=5 type=DEF
> [  171.002377] __dl_add() tsk_bw=52428 dl_b->total_bw=262140 type=DEF rd->span=0-4
                                                         ^^^^
OK. 5 still online CPUs dl servers temporarily added to DEF root domain.

> [  171.002385] __dl_update() (3) cpu=0 rq->dl.extra_bw=562744
> [  171.002391] __dl_update() (3) cpu=1 rq->dl.extra_bw=872068
> [  171.002397] __dl_update() (3) cpu=2 rq->dl.extra_bw=1081780
> [  171.002403] __dl_update() (3) cpu=3 rq->dl.extra_bw=981293
> [  171.002409] __dl_update() (3) cpu=4 rq->dl.extra_bw=994400
> [  171.002416] cpu_attach_domain() called cpu=5 type=DEF
> [  171.002421] CPU5 attaching NULL sched-domain.
> [  171.002425] span=0-4
> [  171.002431] rq_attach_root() called cpu=5 type=DEF
> [  171.002438] build_sched_domains() called cpu_map=0-2
> [  171.002556] cpu_attach_domain() called cpu=0 type=DYN

Adding CPU5 (going offline) to DEF doesn't add its dl server
contribution (OK).

> [  171.002565] CPU0 attaching sched-domain(s):
> [  171.002571]  domain-0: span=0-2 level=PKG
> [  171.002583]   groups: 0:{ span=0 cap=445 }, 1:{ span=1-2 cap=2045 }
> [  171.002619] rq_attach_root() called cpu=0 type=DYN
> [  171.002630] dl_bw_cpus() cpu=0 rd->span=0-5 cpu_active_mask=0-4 cpus=5 type=DEF
> [  171.002639] __dl_server_detach_root() called cpu=0
> [  171.002644] dl_bw_cpus() cpu=0 rd->span=0-5 cpu_active_mask=0-4 cpus=5 type=DEF
> [  171.002653] __dl_sub() tsk_bw=52428 dl_b->total_bw=209712 type=DEF rd->span=0-5
> [  171.002662] __dl_update() (3) cpu=0 rq->dl.extra_bw=573229
> [  171.002668] __dl_update() (3) cpu=1 rq->dl.extra_bw=882553
> [  171.002674] __dl_update() (3) cpu=2 rq->dl.extra_bw=1092265
> [  171.002680] __dl_update() (3) cpu=3 rq->dl.extra_bw=991778
> [  171.002686] __dl_update() (3) cpu=4 rq->dl.extra_bw=1004885
> [  171.002693] dl_bw_cpus() cpu=0 rd->span=0 cpu_active_mask=0-4 cpumask_weight(rd->span)=1 type=DYN
> [  171.002702] __dl_server_attach_root() called cpu=0
> [  171.002707] dl_bw_cpus() cpu=0 rd->span=0 cpu_active_mask=0-4 cpumask_weight(rd->span)=1 type=DYN
> [  171.002716] __dl_add() tsk_bw=52428 dl_b->total_bw=52428 type=DYN rd->span=0
> [  171.002724] __dl_update() (3) cpu=0 rq->dl.extra_bw=520801
> [  171.002731] cpu_attach_domain() called cpu=1 type=DYN
> [  171.002738] CPU1 attaching sched-domain(s):
> [  171.002743]  domain-0: span=1-2 level=MC
> [  171.002753]   groups: 1:{ span=1 cap=1022 }, 2:{ span=2 cap=1023 }
> [  171.002787]   domain-1: span=0-2 level=PKG
> [  171.002798]    groups: 1:{ span=1-2 cap=2045 }, 0:{ span=0 cap=445 }
> [  171.002831] rq_attach_root() called cpu=1 type=DYN
> [  171.002841] dl_bw_cpus() cpu=1 rd->span=1-5 cpu_active_mask=0-4 cpus=4 type=DEF
> [  171.002851] __dl_server_detach_root() called cpu=1
> [  171.002856] dl_bw_cpus() cpu=1 rd->span=1-5 cpu_active_mask=0-4 cpus=4 type=DEF
> [  171.002865] __dl_sub() tsk_bw=52428 dl_b->total_bw=157284 type=DEF rd->span=1-5
> [  171.002873] __dl_update() (3) cpu=1 rq->dl.extra_bw=895660
> [  171.002879] __dl_update() (3) cpu=2 rq->dl.extra_bw=1105372
> [  171.002885] __dl_update() (3) cpu=3 rq->dl.extra_bw=1004885
> [  171.002891] __dl_update() (3) cpu=4 rq->dl.extra_bw=1017992
> [  171.002898] dl_bw_cpus() cpu=1 rd->span=0-1 cpu_active_mask=0-4 cpumask_weight(rd->span)=2 type=DYN
> [  171.002907] __dl_server_attach_root() called cpu=1
> [  171.002912] dl_bw_cpus() cpu=1 rd->span=0-1 cpu_active_mask=0-4 cpumask_weight(rd->span)=2 type=DYN
> [  171.002922] __dl_add() tsk_bw=52428 dl_b->total_bw=104856 type=DYN rd->span=0-1
> [  171.002930] __dl_update() (3) cpu=0 rq->dl.extra_bw=494587
> [  171.002936] __dl_update() (3) cpu=1 rq->dl.extra_bw=869446
> [  171.002943] cpu_attach_domain() called cpu=2 type=DYN
> [  171.002950] CPU2 attaching sched-domain(s):
> [  171.002954]  domain-0: span=1-2 level=MC
> [  171.002965]   groups: 2:{ span=2 cap=1023 }, 1:{ span=1 cap=1022 }
> [  171.002998]   domain-1: span=0-2 level=PKG
> [  171.003009]    groups: 1:{ span=1-2 cap=2045 }, 0:{ span=0 cap=445 }
> [  171.003043] rq_attach_root() called cpu=2 type=DYN
> [  171.003053] dl_bw_cpus() cpu=2 rd->span=2-5 cpu_active_mask=0-4 cpus=3 type=DEF
> [  171.003062] __dl_server_detach_root() called cpu=2
> [  171.003067] dl_bw_cpus() cpu=2 rd->span=2-5 cpu_active_mask=0-4 cpus=3 type=DEF
> [  171.003076] __dl_sub() tsk_bw=52428 dl_b->total_bw=104856 type=DEF rd->span=2-5
                                                         ^^^^
OK. CPU3 + CPU4 (CPU5 offline).

> [  171.003085] __dl_update() (3) cpu=2 rq->dl.extra_bw=1122848
> [  171.003091] __dl_update() (3) cpu=3 rq->dl.extra_bw=1022361
> [  171.003096] __dl_update() (3) cpu=4 rq->dl.extra_bw=1035468
> [  171.003103] dl_bw_cpus() cpu=2 rd->span=0-2 cpu_active_mask=0-4 cpumask_weight(rd->span)=3 type=DYN
> [  171.003113] __dl_server_attach_root() called cpu=2
> [  171.003118] dl_bw_cpus() cpu=2 rd->span=0-2 cpu_active_mask=0-4 cpumask_weight(rd->span)=3 type=DYN
> [  171.003127] __dl_add() tsk_bw=52428 dl_b->total_bw=157284 type=DYN rd->span=0-2
> [  171.003136] __dl_update() (3) cpu=0 rq->dl.extra_bw=477111
> [  171.003141] __dl_update() (3) cpu=1 rq->dl.extra_bw=851970
> [  171.003147] __dl_update() (3) cpu=2 rq->dl.extra_bw=1105372
> [  171.003188] root domain span: 0-2
> [  171.003194] default domain span: 3-5
> [  171.003220] rd 0-2: Checking EAS, schedutil is mandatory
> [  171.005840] psci: CPU5 killed (polled 0 ms)

OK. DYN has (CPU0,1,2) 157284 and DEF (CPU3,4) 104856.

CPU4 going offline (it's isolated on DEF).

> [  171.006436] dl_bw_deactivate() called cpu=4
> [  171.006446] __dl_bw_capacity() mask=3-5 cap=892
> [  171.006454] dl_bw_cpus() cpu=4 rd->span=3-5 cpu_active_mask=0-4 cpus=2 type=DEF
> [  171.006464] dl_bw_manage: cpu=4 cap=446 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2 type=DEF span=3-5
> [  171.006475] dl_bw_cpus() cpu=4 rd->span=3-5 cpu_active_mask=0-4 cpus=2 type=DEF
> [  171.006485] CPU: 4 UID: 0 PID: 36 Comm: cpuhp/4 Not tainted 6.13.0-09343-g9ce523149e08-dirty #172
> [  171.006495] Hardware name: ARM Juno development board (r0) (DT)
> [  171.006499] Call trace:
> [  171.006502]  show_stack+0x18/0x24 (C)
> [  171.006514]  dump_stack_lvl+0x74/0x8c
> [  171.006528]  dump_stack+0x18/0x24
> [  171.006541]  dl_bw_manage+0x3a0/0x500
> [  171.006554]  dl_bw_deactivate+0x40/0x50
> [  171.006564]  sched_cpu_deactivate+0x34/0x24c
> [  171.006579]  cpuhp_invoke_callback+0x138/0x694
> [  171.006591]  cpuhp_thread_fun+0xb0/0x198
> [  171.006604]  smpboot_thread_fn+0x200/0x224
> [  171.006616]  kthread+0x12c/0x204
> [  171.006627]  ret_from_fork+0x10/0x20
> [  171.006639] __dl_overflow() dl_b->bw=996147 cap=446 cap_scale(dl_b->bw, cap)=433868 dl_b->total_bw=104856 old_bw=52428 new_bw=0 type=DEF rd->span=3-5
> [  171.006652] dl_bw_manage() cpu=4 cap=446 overflow=0 req=0 return=0 type=DEF
> [  171.006706] partition_sched_domains() called
> [  171.006713] CPU: 4 UID: 0 PID: 36 Comm: cpuhp/4 Not tainted 6.13.0-09343-g9ce523149e08-dirty #172
> [  171.006722] Hardware name: ARM Juno development board (r0) (DT)
> [  171.006727] Call trace:
> [  171.006730]  show_stack+0x18/0x24 (C)
> [  171.006740]  dump_stack_lvl+0x74/0x8c
> [  171.006754]  dump_stack+0x18/0x24
> [  171.006767]  partition_sched_domains+0x48/0x7c
> [  171.006778]  sched_cpu_deactivate+0x1a8/0x24c
> [  171.006792]  cpuhp_invoke_callback+0x138/0x694
> [  171.006805]  cpuhp_thread_fun+0xb0/0x198
> [  171.006817]  smpboot_thread_fn+0x200/0x224
> [  171.006829]  kthread+0x12c/0x204
> [  171.006840]  ret_from_fork+0x10/0x20
> [  171.006852] partition_sched_domains_locked() ndoms_new=1
> [  171.006861] partition_sched_domains_locked() goto match2
> [  171.006867] rd 0-2: Checking EAS, schedutil is mandatory
> [  171.007774] psci: CPU4 killed (polled 4 ms)

As I guess you were saying above, CPU4 contribution is not removed from
DEF.

> [  171.007971] dl_bw_deactivate() called cpu=3
> [  171.007981] __dl_bw_capacity() mask=3-5 cap=446
> [  171.007989] dl_bw_cpus() cpu=3 rd->span=3-5 cpu_active_mask=0-3 cpus=1 type=DEF
> [  171.007999] dl_bw_manage: cpu=3 cap=0 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=1 type=DEF span=3-5
                                                                          ^^^^
And this is now wrong. :/

> [  171.008010] dl_bw_cpus() cpu=3 rd->span=3-5 cpu_active_mask=0-3 cpus=1 type=DEF
> [  171.008019] dl_bw_manage() cpu=3 cap=0 overflow=1 req=0 return=-16 type=DEF
> [  171.008069] Error taking CPU3 down: -16
> [  171.008076] Non-boot CPUs are not disabled
> [  171.008080] Enabling non-boot CPUs ...

Hummm.


