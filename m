Return-Path: <linux-tegra+bounces-12559-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DI7MEJwqWnH7AAAu9opvQ
	(envelope-from <linux-tegra+bounces-12559-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 13:00:02 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C33192110DF
	for <lists+linux-tegra@lfdr.de>; Thu, 05 Mar 2026 13:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA1303048931
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Mar 2026 11:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052553976B3;
	Thu,  5 Mar 2026 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqOI+bfK"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D02396D26;
	Thu,  5 Mar 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772711822; cv=none; b=cEFlbrmtocx/AKlvqOckD5bFk/QjEKn2RRcs8/Cqa03IMqoOifDYRb6VuBysaypZDQt0r/mWOEYYgvQ+5oikjLLPG+hQYHQ34AOs7FeC1aXBMsnxJUfnrl3lEOoIoa1aQH4dAAyLhuWCiguDKxLmCAuNrxZNrDQI7pGR7AGHR9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772711822; c=relaxed/simple;
	bh=GH8E8tUrY1ElgQcnWAE3uem+PtnhGiQAA13wtKf7IUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wu0ToyDyMI0YbgQgqEvgsG2MQrdpk0WYOQqon+OhAiE7xskD9a0sJqwTQaQTBNE3lyP2uCuasRYNS4Cg0lHr3v7d4rEugDxr7/EStP4iP8fhZ1zm9kDoQdnZjjQCxoB/8YMPeyh+Np5DV8iXwtvSATl/H/ROhUvZB2if8XiwiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqOI+bfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC7CC116C6;
	Thu,  5 Mar 2026 11:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772711822;
	bh=GH8E8tUrY1ElgQcnWAE3uem+PtnhGiQAA13wtKf7IUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqOI+bfKbBfTTlg1MilqQNXbdO/wkTm6rNMPxknztYPvvslbfcE+vTK7CHh54BA+c
	 BIayzYKys6OGz6GVUGA61fU+g4kPu08AKLpOEZpbH8960zu0hr1fr8Gozp0YE31YGL
	 zQqrQzbR0KmSrrAXwgJ4kiOLV4aTZ0RW2aEkzNdSTplRRlZypWH4Mf/XqbuX5qjI4w
	 N372rxWFJSaWdiMp1NsBmbaWIC/uZDb1KsNQl4ni8FFzRh0bc+0W9n9lzcAN96g8O3
	 7R5cwG56LA+tHV1AHW5ZRGVTk1Hh4P4+SgYkM0ZQmh1zzOsGqpFfiVhTE5ShJ3YIhq
	 D9yXkwkayiLgA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] memory: Few code cleanups
Message-Id: <177271182112.206485.1314848006355438382.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 12:57:01 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: C33192110DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12559-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Thu, 26 Feb 2026 21:35:23 +0100, Krzysztof Kozlowski wrote:
> Few cleanups for Renesas and Tegra.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/4] memory: renesas-rpc-if: Simplify printing PTR_ERR with dev_err_probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8a39b1d4b358f8ccae29166e239f4dd2594b2e7c
[2/4] memory: tegra-mc: Drop tegra_mc_setup_latency_allowance() return value
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2ac5ba4c50be535497dc01089e4113185e4ccad1
[3/4] memory: tegra-mc: Simplify printing PTR_ERR with dev_err_probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f7bd985ad907ed85999f4bac4870abe35dcd2745
[4/4] memory: tegra-mc: Use %pe format
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2413283fac5b2975f5ead6a1dcac7d5c6f7366d8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


