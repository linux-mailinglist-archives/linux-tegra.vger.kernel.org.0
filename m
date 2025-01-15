Return-Path: <linux-tegra+bounces-4569-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46461A1285C
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2025 17:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC90B168152
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2025 16:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6740E189B83;
	Wed, 15 Jan 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Opdj40xM"
X-Original-To: linux-tegra@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A06166F1B
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957450; cv=none; b=HqXbKikvgIyNZahMty51fcwZInm9ASQgt+1Rv1aunOBW/swITyOJrNqgvB2uVEk2q4mMrPKY6Vos5I+JmXtj0EYMORlXb1jeY4nuhWp8sRRaHvXX79OXRoNdbF+hNnMgTqdpxnhFgvHKaR7bBzYgRqc+k3UzARv2m0mtwDYSF8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957450; c=relaxed/simple;
	bh=Q5HX03L+LBu4DI5SOBN0rBpgAhzeAYfGkk/evFLPL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4h3F74Ms2hAjma+skqachIrKrxhO7EOwnfRIi0zA3JwZaHGwQUW9lrr84Jj1tS9hBY09BZLY1ygXcS7SDLqjmShvtEdWJonxPuwIHewVz+3fvTSVHV2j5Qd1bW46xHpUS9rKIT/D/Nct0745Xc4TDn7OujYXLsZzuVgBATPx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Opdj40xM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736957447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fwv1kwFJxSkcafLbx8O9hhNTT13fz1sU/gcf9TWnB8k=;
	b=Opdj40xMzAx94zRx5W0gk4QWpF0JRafHPj2mcbMAJdpinVjuoU7FWUAr4qMFFm3o1B6oib
	GirhExn5Pn686Wibcky0GskPQ74clDP1I4PQiiwgmKDxv3ndKaqWWnZHPQ6sEKHwPVrhVq
	GPuDiV5RsF/h9+ZiTwk0XdyZKhrI548=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-DsSOX8s8OBeriUtPXBmF9w-1; Wed, 15 Jan 2025 11:10:46 -0500
X-MC-Unique: DsSOX8s8OBeriUtPXBmF9w-1
X-Mimecast-MFC-AGG-ID: DsSOX8s8OBeriUtPXBmF9w
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385d80576abso4754601f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2025 08:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957444; x=1737562244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwv1kwFJxSkcafLbx8O9hhNTT13fz1sU/gcf9TWnB8k=;
        b=sxfYY/m+M8skBWIcotnsb53q2LeIYQqGiIr7K2uWqFpAO/4FXGrQtXfEAH7TJgh/DT
         a/jbyUmw9SInoaR97CwML6v/kr1ojTiWXOZV6USBSqLxHz9X8kmjNo+7S8ZvFW/R7e3t
         2/EYAHrUKmu7fA4DFPwB+n7aGU29nWm7zeKAZ+vuBSo26yulqh9rw2ZGpUKLFk50wTM3
         gWedvbkLEtG4aeAjPzmuNj5CwKrKu+1QGodt2snC/XGgNH14cNTbEzSVwYeJaP9LP5Jl
         5RrRk1iuuTvACZQII0QliPUMaH6Qs9mNfT+gonGyBgqMjQcU4WlDcoXgZiUNVFkpDoOZ
         Glog==
X-Forwarded-Encrypted: i=1; AJvYcCVTO6bt7q2JPMiL2UEphP70Zn8EE1BIRMLBJ+OJMYgjsxMWWUeLcgWxZShFP2nYPiWGTjp76SXVAkugcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYTO2lcELey2oYZnSItfHdUORRms5EmLP8Zzph39xR32LA5Fw
	00ByfTHW86tbXVB6HvTdBS8iYbUd7JdvFbGLn1toFlVHugpwWvFwAhzPuEoQgNfaTo8PdOM7BQ2
	jXil+Wc9Mtbg1WL2kDEBemNvupDCSwmlY8V9qJYb9QbODKARoPv15Vx242+BF
X-Gm-Gg: ASbGncvedkY2TTm5ohmKOG+PsF2cC0jJeHcQIJk95VDMFtv9ecb/Xpaj8m51X2UdHmN
	nPtCijaGu3Mfd7Shrv9SSykzN3yCJFUekQgqTheQumvz6zU44P/GfM+ZLyxsPTjURoGqIBtsZ1f
	LyQfnaCZ/VFqKgTXFTxtFmsU7orZ5E7lOAzkXroQLduSFf8DYdeKYFNg74Al0h1qhUt6W6GYWmt
	Ud3C/8IY/1P0E8tE4sKcjJwJ1BuAWBhuwOw1/3o1kSvw5LnHWGCarljRXJsEtZSwT4PMAEmOK2u
	Yp6/kEbjTg==
X-Received: by 2002:a05:6000:1863:b0:38a:9c1b:df69 with SMTP id ffacd0b85a97d-38a9c1be0ccmr18444546f8f.31.1736957444558;
        Wed, 15 Jan 2025 08:10:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGyzTXYidClX6cSgSBiBYXGVBuQZt4/vJlOO+4PKahxZuqVX3MddUFqiprcgJ3HFxYeJL1rw==
X-Received: by 2002:a05:6000:1863:b0:38a:9c1b:df69 with SMTP id ffacd0b85a97d-38a9c1be0ccmr18444343f8f.31.1736957442667;
        Wed, 15 Jan 2025 08:10:42 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.92.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38f0eesm18300231f8f.61.2025.01.15.08.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:10:41 -0800 (PST)
Date: Wed, 15 Jan 2025 17:10:39 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
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
Message-ID: <Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb>
References: <20241114142810.794657-1-juri.lelli@redhat.com>
 <ZzYhyOQh3OAsrPo9@jlelli-thinkpadt14gen4.remote.csb>
 <Zzc1DfPhbvqDDIJR@jlelli-thinkpadt14gen4.remote.csb>
 <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
 <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
 <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>
 <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
 <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>

On 14/01/25 15:02, Juri Lelli wrote:
> On 14/01/25 13:52, Jon Hunter wrote:
> > 
> > On 13/01/2025 09:32, Juri Lelli wrote:
> > > On 10/01/25 18:40, Jon Hunter wrote:
> > > 
> > > ...
> > > 
> > > > With the above I see the following ...
> > > > 
> > > > [   53.919672] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
> > > > [   53.930608] dl_bw_manage: cpu=4 cap=2048 fair_server_bw=52428 total_bw=157284 dl_bw_cpus=3
> > > > [   53.941601] dl_bw_manage: cpu=3 cap=1024 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2
> > > 
> > > So far so good.
> > > 
> > > > [   53.952186] dl_bw_manage: cpu=2 cap=1024 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=2
> > > 
> > > But, this above doesn't sound right.
> > > 
> > > > [   53.962938] dl_bw_manage: cpu=1 cap=0 fair_server_bw=52428 total_bw=576708 dl_bw_cpus=1
> > > > [   53.971068] Error taking CPU1 down: -16
> > > > [   53.974912] Non-boot CPUs are not disabled
> > > 
> > > What is the topology of your board?
> > > 
> > > Are you using any cpuset configuration for partitioning CPUs?
> > 
> > 
> > I just noticed that by default we do boot this board with 'isolcpus=1-2'. I
> > see that this is a deprecated cmdline argument now and I must admit I don't
> > know the history of this for this specific board. It is quite old now.
> > 
> > Thierry, I am curious if you have this set for Tegra186 or not? Looks like
> > our BSP (r35 based) sets this by default.
> > 
> > I did try removing this and that does appear to fix it.
> 
> OK, good.
> 
> > Juri, let me know your thoughts.
> 
> Thanks for the additional info. I guess I could now try to repro using
> isolcpus at boot on systems I have access to (to possibly understand
> what the underlying problem is).

I think the problem lies in the def_root_domain accounting of dl_servers
(which isolated cpus remains attached to).

Came up with the following, of which I'm not yet fully convinced, but
could you please try it out on top of the debug patch and see how it
does with the original failing setup using isolcpus?

Thanks!

---
 kernel/sched/deadline.c | 15 +++++++++++++++
 kernel/sched/sched.h    |  1 +
 kernel/sched/topology.c |  3 +++
 3 files changed, 19 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 77736bab1992..9a47decd099a 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1709,6 +1709,21 @@ void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq)
 	__dl_add(dl_b, new_bw, dl_bw_cpus(cpu));
 }
 
+void __dl_server_detach_root(struct sched_dl_entity *dl_se, struct rq *rq)
+{
+	u64 old_bw = dl_se->dl_bw;
+	int cpu = cpu_of(rq);
+	struct dl_bw *dl_b;
+
+	dl_b = dl_bw_of(cpu_of(rq));
+	guard(raw_spinlock)(&dl_b->lock);
+
+	if (!dl_bw_cpus(cpu))
+		return;
+
+	__dl_sub(dl_b, old_bw, dl_bw_cpus(cpu));
+}
+
 int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 period, bool init)
 {
 	u64 old_bw = init ? 0 : to_ratio(dl_se->dl_period, dl_se->dl_runtime);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 65fa64845d9f..ec0dfd82157e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -395,6 +395,7 @@ extern void dl_server_update_idle_time(struct rq *rq,
 		    struct task_struct *p);
 extern void fair_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
+extern void __dl_server_detach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index da33ec9e94ab..93b08e76a52a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -495,6 +495,9 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 	if (rq->rd) {
 		old_rd = rq->rd;
 
+		if (rq->fair_server.dl_server)
+			__dl_server_detach_root(&rq->fair_server, rq);
+
 		if (cpumask_test_cpu(rq->cpu, old_rd->online))
 			set_rq_offline(rq);
 
-- 


