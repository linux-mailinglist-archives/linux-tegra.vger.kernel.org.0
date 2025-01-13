Return-Path: <linux-tegra+bounces-4537-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5DA0B335
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jan 2025 10:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6300C16818E
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Jan 2025 09:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C08823A587;
	Mon, 13 Jan 2025 09:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cy3mxBY5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5661F22C321
	for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2025 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760749; cv=none; b=upu0//ANVtg4jzT0SXbg0U7Xr5MVxnw+9oP8bqYZ0hnzifa/qRDeJvNw39N7AbPouex9bo+DxY59BkHqVjYE3v7yXw3cr10pivHTOq4unzw7eLQBd38bXaMO7eueVbA0j8l5K0W022EfcSAzg2web3UUk805vd77z6L+0dAWAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760749; c=relaxed/simple;
	bh=31hLsytzJKpvZoOPTzwC/Esrx+8DvHDdHkwkvmkRTak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfDHs2tUl7RVB7WZZBY2i9UYtcOF2bBc290BZOHas3u+0C8BOcvs/7ew6YCtEwNoh4MYH0M9O8Kax5HoNzvwlFyhjaMHJCk4TRKZRMkANUkJ75YXfYoGsqMJkhPC4ByB5Ps08eZjWy28cuuGtBuRDLtxUoy7UAdxbUPD6BGQeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cy3mxBY5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736760747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cjqo1VApqjL/yItsfmoIoADm/NcbIFI9nHGNJVw656c=;
	b=cy3mxBY5Tfa6Uhz68bLK3T5kdx6VwgdiwOtQi6wKZ5366CVI9bZGIvUMyb8smvnkYevYf3
	VT3KGrlxIlUQgHMgzyHqbRaPUqnlGyZfGDLebTY38KlNq+5TTQJKVDV1Gmfmd+ADnOtcmQ
	gpUxexOHav9cKnJjUYzRImlkgc62OpU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-vECyYoSONO-YAgTlqkN6cA-1; Mon, 13 Jan 2025 04:32:26 -0500
X-MC-Unique: vECyYoSONO-YAgTlqkN6cA-1
X-Mimecast-MFC-AGG-ID: vECyYoSONO-YAgTlqkN6cA
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e1b037d5so657885985a.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jan 2025 01:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760745; x=1737365545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjqo1VApqjL/yItsfmoIoADm/NcbIFI9nHGNJVw656c=;
        b=ZZCCriVPF8lD5uS72cj+vErmZ1jVJBK7ZrUfxQ6iYPtnDsrbm9qj3MeO5JVvGDTu6w
         CnkFz5hCbiJk4ZJ6TVmBX6Z3G+3eoa7LihV8wRNQyoPdYwOcPFPT/seHgec64Waa6h5Q
         x27h0ehaOWN7Bd5Kd7QVLEamWgNpwhmNm2Ln+rXT1RcxxSIYvlRSbIGXMXvnB5lyiy7s
         fxI/TQ8ojniBn/1iDd6V4SYlXEVkTqSPnlPtdKR7Z8N6QDAizLnmXOnjYkslH4HwK9cF
         SDWsygIYwPkq/bGtpQa/k8O0CkQg7ohmcrHtt8gGDiCPqzwtNOuEsINkg5rYED2OSLWE
         NraA==
X-Forwarded-Encrypted: i=1; AJvYcCWzQ54Z//1iR/qsSUEZip3xc/WqevfjnL9XQ/kzrCFGBkOT/O5swYi+AgohTZ6P1jOnsSkPqu2XfPFLQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTddj06RuvUKJgpbQDm+ss3lrPtA+lA5yeneVJg6nKg9SAlJAZ
	YaaUB5GOwh81CWE/qX5sNBEnuH+g/H14fXrIWLbPPH9rH1LJfuuR7HcyoaWhHPasXs1VX5DKdJQ
	FPiGuQwkCjeJSa8Rhy2zjNNLp/w75uWxHPbCnXXnqEvGEu26qSjgquamvMMiT
X-Gm-Gg: ASbGncsh8lSz+yO13mGFAGH2hJuJE/TpAq+rKhBoK6v/4ncG/Zi1omiG2xAN4B0EjzO
	6DhIzAXWgAilqOLShgeQHibdej+hwQlEOXLwfpBa54oZT8soSXYzBkZyK5XPnXddY655tJEGQe9
	ozNRrNIPXGwOBrmY161pnezAHb6dn2jyG8M2K8tbnhRDBv/bRQuycVNoN7/ENAVuUluoSfH38Ci
	Uw/NXgFXmdhWiVcWwFCfJnRXaQCQWUyAqzKcpol3dS/VpNw0jczFl9oo4mMzvnZz2U/j1Ogy6se
	7z8i7QOMyg==
X-Received: by 2002:a05:620a:4252:b0:7b6:785e:ce1a with SMTP id af79cd13be357-7bcd96fa05dmr3084193085a.4.1736760745417;
        Mon, 13 Jan 2025 01:32:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFusOnC6/+c2FKWev6IjOhBZ6YLrjBdOdPyFdiH6zdtW9g05I6pCK1ZZdqZfFobXd6xBn6sLw==
X-Received: by 2002:a05:620a:4252:b0:7b6:785e:ce1a with SMTP id af79cd13be357-7bcd96fa05dmr3084190685a.4.1736760745103;
        Mon, 13 Jan 2025 01:32:25 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.92.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3516193sm468126185a.117.2025.01.13.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:32:24 -0800 (PST)
Date: Mon, 13 Jan 2025 10:32:17 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
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
Message-ID: <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
References: <20241114142810.794657-1-juri.lelli@redhat.com>
 <ZzYhyOQh3OAsrPo9@jlelli-thinkpadt14gen4.remote.csb>
 <Zzc1DfPhbvqDDIJR@jlelli-thinkpadt14gen4.remote.csb>
 <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
 <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
 <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>

On 10/01/25 18:40, Jon Hunter wrote:

...

> With the above I see the following ...
> 
> [   53.919672] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
> [   53.930608] dl_bw_manage: cpu=4 cap=2048 fair_server_bw=52428 total_bw=157284 dl_bw_cpus=3
> [   53.941601] dl_bw_manage: cpu=3 cap=1024 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2

So far so good.

> [   53.952186] dl_bw_manage: cpu=2 cap=1024 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=2

But, this above doesn't sound right.

> [   53.962938] dl_bw_manage: cpu=1 cap=0 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=1
> [   53.971068] Error taking CPU1 down: -16
> [   53.974912] Non-boot CPUs are not disabled

What is the topology of your board?

Are you using any cpuset configuration for partitioning CPUs?

Also, could you please add sched_debug to the kernel cmdline and enable
CONFIG_SCHED_DEBUG (if not enabled already)? That should print
additional information about scheduling domains in case they get
reconfigured for some reason.

Thanks!
Juri


