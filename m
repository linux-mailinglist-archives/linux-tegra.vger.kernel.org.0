Return-Path: <linux-tegra+bounces-12724-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILwuGAFZsGmMiQIAu9opvQ
	(envelope-from <linux-tegra+bounces-12724-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Mar 2026 18:46:41 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4203255D46
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Mar 2026 18:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD143074A09
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Mar 2026 17:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704633D47B1;
	Tue, 10 Mar 2026 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHW+21dV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC63D16EC;
	Tue, 10 Mar 2026 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773164521; cv=none; b=SL4erLFXSjXKQu8r45FAT7dQYRze3OHKs+weSbzifXs6tYUbNWvcO334S9siN3gjlpYwhaUypmTXFb3e3nDeTir+DuZKoNuH4VTIoywSnQPXpjNIOKYl/VKbRVsMsxQbTkPubHCRdtCbJYGi3fiUMP06NLQeXRhEDuTq/x49Odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773164521; c=relaxed/simple;
	bh=flcvGrxGSQcM/HvyJsep1dEanimE9giUMZLN+nEKLMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cHOuqlra+4MOlRhBZVU03fd4NTH6aeqb8FoTiAMTHHs4p2feJ60xMBIqY6wyyUzCRLAloB4P2xDjK9ItRk+pbdimsQaY1k/+MN3xWT1Mn7A4PTBuKluCiKbme6g759q/9HXFlBWvlcJ/PXWKKlluYOFnh+luglaXoOqgcaltwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHW+21dV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03BCC19423;
	Tue, 10 Mar 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773164520;
	bh=flcvGrxGSQcM/HvyJsep1dEanimE9giUMZLN+nEKLMo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FHW+21dVhKhjrp0LgyqZeYTm+4ULKNWpsg1tBvzNt2BlsEpW/xSKLTOpXjaK/A4pE
	 /m2YPqMvB3TPQ6bGS11UCkwhIUVCGWflwi+IhDRAanhfDTGOlnHrBsOMoB8aTj9I3/
	 oXxpjqGrsmVPRsc6WAviJvpTt/vOLF0iRNcw6+RNfR434T3BXQC8J43+sSvwVP27u3
	 uR0hXYu0TH3ta69tr46t96bmjQWQ++Qd25x6bBTyTKzUo6YuNnM5mjIAAcLX66kSAc
	 S1s/wfzKPtv+MQJbldeo+Qw1RCrFpwj4Dzy1vhnWxA/59Oqy2ojd7THrJXHldTt2kG
	 wXyTEx1AO4I0w==
From: Namhyung Kim <namhyung@kernel.org>
To: irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
 will@kernel.org, mike.leach@linaro.org, leo.yan@linux.dev, 
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
 adrian.hunter@intel.com, peterz@infradead.org, mingo@redhat.com, 
 acme@kernel.org, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
 ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
In-Reply-To: <20260212233407.1432673-1-bwicaksono@nvidia.com>
References: <20260212233407.1432673-1-bwicaksono@nvidia.com>
Subject: Re: [PATCH v2] perf vendor events arm64: Add Tegra410 Olympus PMU
 events
Message-Id: <177316451973.3633010.4596572843813142614.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 10:41:59 -0700
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-Rspamd-Queue-Id: B4203255D46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12724-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namhyung@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-tegra];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 23:34:07 +0000, Besar Wicaksono wrote:
> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> Also updated the common-and-microarch.json.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



