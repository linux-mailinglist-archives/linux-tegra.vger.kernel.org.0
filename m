Return-Path: <linux-tegra+bounces-13388-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP2KDxRByWm1wgUAu9opvQ
	(envelope-from <linux-tegra+bounces-13388-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:16 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C755F352896
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A2133010520
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEAE37D121;
	Sun, 29 Mar 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3YmLtxd"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAA0379999
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797058; cv=none; b=XwVsS7dogCsCp6MelMm2xN5oaZlfFyXZmwbYRaeiYKsZBxg/Gm2/x1OpL/ixFKZv2lBzrd2vAI9DIoKGXW9UHPv75C5SCqMvYqV+Lc8hlnEuOOPVcWpMlSSfohs7uD4GkofPcbhQl8+0F7ap+jefhkRL1liwghw1aBr0bi8PouM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797058; c=relaxed/simple;
	bh=kFoVyTMkyFn4pbXMTMOvST6cf5WTQ/PPBbZDBHunAIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZGR3wAxH77utHfhqJMZCsVdtD+UzoUS9VRTzEmub8YKXnlJr14KE0L1LZEeA6Z+UrMdW3ENjDkpeePoPSSEjLeE4CTNi9iFbnLJsFNWTE6tylv+rij/SYWoprMf+XcQ9mgntmrqc6nHlMoN5QoGTefC1Qgd4Q7ingcEThtOq2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3YmLtxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78735C116C6;
	Sun, 29 Mar 2026 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797058;
	bh=kFoVyTMkyFn4pbXMTMOvST6cf5WTQ/PPBbZDBHunAIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3YmLtxdwDDgWlDbmWBKnqV4hnQyybEDJMveoOKUIqNFkYFC3nqXvRHGTuiR7nofh
	 VRQGWpFLEjdVgrVUfqXQfB1NV/a41GVmTmHB54w8+MCK4RE439Q37M1OKI4KT6GrFn
	 DgvEDEJGLy64D5mPOPczZ/aNdrFLFlW2EX+H2ztm+SQIYdjt0ulCXu6/mSx3ZRoM9A
	 0Fe7eoxknTOU8udloLkBUSQO6ZjH6OrQfXWIAYLYVIrbMGOeoq0FhzxiKkOJxjYRZG
	 JfmD2nMPoHNJ6qVR75MXR+fYNau3ERP/809Q1gmuOeUF/ow8GrDA4ffDKZTL2Ylx4O
	 zHb2ia9AX0B2g==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] firmware: tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:40 +0200
Message-ID: <20260329151045.1443133-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13388-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C755F352896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-firmware

for you to fetch changes up to e68d494b8946e9060e60427f365107194f90ba0d:

  soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP (2026-03-27 16:30:54 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v7.1-rc1

This introduces a new API for the BPMP to be pass along a specifier from
DT when getting a reference from a phandle. This is used to reference
specific instances of the PCI controller on Tegra264. The ABI header for
BPMP is updated to the latest version and BPMP APIs now use the more
intuitive ENODEV instead of the non SUSV4 ENOTSUPP error code for stub
implementations.

----------------------------------------------------------------
Thierry Reding (4):
      firmware: tegra: bpmp: Rename Tegra239 to Tegra238
      soc/tegra: Update BPMP ABI header
      firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
      soc/tegra: bpmp: Use ENODEV instead of ENOTSUPP

 drivers/firmware/tegra/bpmp.c |   34 +
 include/soc/tegra/bpmp-abi.h  | 4573 +++++++++++++++++++++++++++++++++--------
 include/soc/tegra/bpmp.h      |   20 +-
 3 files changed, 3725 insertions(+), 902 deletions(-)

