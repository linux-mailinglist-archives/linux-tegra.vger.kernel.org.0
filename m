Return-Path: <linux-tegra+bounces-5052-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C2A3406B
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Feb 2025 14:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15DE87A1C3E
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Feb 2025 13:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF3C23A98C;
	Thu, 13 Feb 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZLuvCPJ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC5E221554
	for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453607; cv=none; b=Txpkpy9hw6xFujy2juhP5oY4IRUru/EftY9ywtzXCpzbqMQHnFgjT/EByWLrMxaex59JP+440HTwuVQ4PTacQzqDhH6bXkT4/+76oy7EwsMqDNCU3nRCeZJtE2RgFYZ9e/qWQ2SPf2RwmkclwHSvMmnOxDnRNhJr6f/HBHlnqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453607; c=relaxed/simple;
	bh=nJSNN6N7hXFIyR3N87Ol1SOQiDheBw1MjwCj9roRY2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0gK7MhsbXpK6c9YsqHRNi/QhBCgF8YRJRj6uiLzRyqSCjJmBthxoT7szsDBRYNolV4kRU2XMqu8qHfmS1ZphYiWIluJrWklT9VXmoaQoTx/bqolIH9EpB2WldgMBt1U2/e9Q+c2izXyHX3K4PshwxN3Fu2JHMACstUDMIu5Nkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZLuvCPJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739453604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZygvgN/S5+5cVst+J1p4HFlB8Rids65GqUffC9Shyg=;
	b=GZLuvCPJnmypCn06jAE7RhvLJE2g5yLn81JyS7LSqBLwUsr9KYLDJ7sRm4VQVaq0h18d1m
	jE4A/m27QkaEcrE1QguovtZHxmOL1x7llmrKZIsCY/mmAoSIFS42NaaukAyZSPL15v/Cx1
	JNN/h5+PWRWHFc2fL5TG4HiTSez1kzY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-SxmXj0KUPDKdr85SJDEhoQ-1; Thu, 13 Feb 2025 08:33:21 -0500
X-MC-Unique: SxmXj0KUPDKdr85SJDEhoQ-1
X-Mimecast-MFC-AGG-ID: SxmXj0KUPDKdr85SJDEhoQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-439385b08d1so6576435e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 13 Feb 2025 05:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453600; x=1740058400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZygvgN/S5+5cVst+J1p4HFlB8Rids65GqUffC9Shyg=;
        b=SvhsULVx570gouLo9Qf7q3iTuMOA+lZGPsfn6onw0jG3k5H0X/q6/YMFxey5hgbebk
         QM/0HuLgZK2Lr9g6DEOJhb1UJZuY8ttmsxMn2epAWf5iRoqFqKvSOTtwGBDI4SZKsk3D
         rUtyl2FGwiB3fEM3NIx71XKtzu3AEmuo24wbGvRQUpcoyo73R8v931k7nL9rvdT/Epuf
         iUl/Zxg50z95YxS12PMEHG+qGzuV+kJIKij1GoYlpmr8w2PmvsNTVSYdDTfT0HbomEA8
         vCVUVMrwju05O+17NWOXgCiLHgTYEbOwhoqX8CdgGDlKalucTnUIwpW0796iZBhtTRI6
         WqdA==
X-Forwarded-Encrypted: i=1; AJvYcCUSrIo8pGzD72plAicI0Ao/xuOkQV+BhkM/KS/QZPzEGVAEb5u9sQkV11gOZdrVrJtytzP1jNAg4y7jnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVq+Vr2UqTB3Jd5qX+bv2FGyM4lm6WC6Fa9vHaNFBy99VQw1T
	8SM0GDi7i/S5WmLspNBl5TBR3c2UntdklltNXiu3mlmd1IkrLOSKriCS+HsqxOhnyFOWMJVPyPS
	ewLOzRW9VZEinfRANDuUPQ7UvCrmbrs7Iu7roWf0UpC66Tyqunn52th7+6z05
X-Gm-Gg: ASbGncsVw+16B7WrZliGuHkOl0dAX2pRe+rZhnkQCRDAJdnTgiFZWmGbLmlIOGeK2oV
	LLSmPypvCUgKo5MxsQHKviVSiPv+Alvyv9X8dDml4Rtdj2Jx6LSWKHm725E6A9kw+fqBgJNdSPk
	J0GDrek18hOMio1Ssp4nfRIlsspPAb89sHYJjJ9bOdsypSVUJKALHRYAJkTtjuuKdkEh27mkz2F
	a5ZccEB9AtI48Q3LBRqHJlFg+li+NYSXOdfUJRrdqFW9ql+EBqtLL2hfWHcM0Sq3G0sNReqzThz
	2Q0DxSxxqwvJ1OeY70k6bGr8r8J9eomm6Q==
X-Received: by 2002:a05:600c:4f0c:b0:439:33c5:386c with SMTP id 5b1f17b1804b1-43958157f77mr83212005e9.5.1739453599998;
        Thu, 13 Feb 2025 05:33:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2MJ61/t+gptH5JllikXxa/xlRnj0nayEvWq7iwSFksSny2k2oIj3/PETDLaZiU1GBGHmn/w==
X-Received: by 2002:a05:600c:4f0c:b0:439:33c5:386c with SMTP id 5b1f17b1804b1-43958157f77mr83211485e9.5.1739453599593;
        Thu, 13 Feb 2025 05:33:19 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b41b5sm1951535f8f.14.2025.02.13.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:33:18 -0800 (PST)
Date: Thu, 13 Feb 2025 14:33:16 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Jon Hunter <jonathanh@nvidia.com>,
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
Message-ID: <Z630nGN1IHhyYIYl@jlelli-thinkpadt14gen4.remote.csb>
References: <a305f53d-44d4-4d7a-8909-6a63ec18a04b@nvidia.com>
 <5a36a2e8-bd78-4875-9b9e-814468ca6692@arm.com>
 <db800694-84f7-443c-979f-3097caaa1982@nvidia.com>
 <8ff19556-a656-4f11-a10c-6f9b92ec9cea@arm.com>
 <Z6oysfyRKM_eUHlj@jlelli-thinkpadt14gen4.remote.csb>
 <dbd2af63-e9ac-44c8-8bbf-84358e30bf0b@arm.com>
 <Z6spnwykg6YSXBX_@jlelli-thinkpadt14gen4.remote.csb>
 <285a43db-c36d-400e-8041-0566f089a482@arm.com>
 <Z62PPUOY5DClYo1A@jlelli-thinkpadt14gen4.remote.csb>
 <c8f626ba-1be4-4c25-b283-d1e11a061aac@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8f626ba-1be4-4c25-b283-d1e11a061aac@arm.com>

On 13/02/25 12:27, Christian Loehle wrote:
> On 2/13/25 06:20, Juri Lelli wrote:
> > On 12/02/25 19:22, Dietmar Eggemann wrote:
> >> On 11/02/2025 11:42, Juri Lelli wrote:
> > 
> > ...
> > 
> >>> What about we actually ignore them consistently? We already do that for
> >>> admission control, so maybe we can do that when rebuilding domains as
> >>> well (until we find maybe a better way to deal with them).
> >>>
> >>> Does the following make any difference?
> >>
> >> It at least seems to solve the issue. And like you mentioned on irc, we
> >> don't know the bw req of sugov anyway.
> >>
> >> So with this change we start with 'dl_bw->total_bw = 0' even w/ sugov tasks.
> >>
> >> dl_rq[0]:
> >>   .dl_nr_running                 : 0
> >>   .dl_bw->bw                     : 996147
> >>   .dl_bw->total_bw               : 0       <-- !
> >>
> >> IMHO, people who want to run serious DL can always check whether there
> >> are already these infrastructural DL tasks or even avoid schedutil.
> > 
> > It definitely not ideal and admittedly gross, but not worse than what we
> > are doing already considering we ignore sugovs at AC and the current
> > bandwidth allocation its there only to help with PI. So, duck tape. :/
> > 
> > A more proper way to work with this would entail coming up with sensible
> > bandwidth allocation for sugovs, but that's most probably hardware
> > specific, so I am not sure how we can make that general enough.
> > 
> > Anyway, looks like Jon was still seeing the issue. I asked him to verify
> > he is using all the proposed changes. Let's see what he reports.
> 
> FWIW it also fixes my reproducer.
> 
> I agree that dummy numbers for sugov bw is futile, but real bw numbers
> also don't make a lot of sense (what if we exceed them? The system
> won't be able to change frequency, i.e. might not be able to provide
> bw for other DL tasks then either?).
> I'm slightly worried about now allowing the last legal CPU for a sugov
> cluster to offline, which would lead to a cluster still being active
> but sugov DL unable to run anywhere. I can't reproduce this currently
> though. Is this an issue in theory? Or am I missing something?

Not sure I get what your worry is, sorry. In my understanding when the
last cpu of a policy/cluster gets offlined the corresponding sugov
kthread gets stopped as well (sugov_exit)?


