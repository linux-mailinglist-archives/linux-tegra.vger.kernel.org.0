Return-Path: <linux-tegra+bounces-14809-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLSLNmbQG2rQGQkAu9opvQ
	(envelope-from <linux-tegra+bounces-14809-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 31 May 2026 08:08:38 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CF614A9F
	for <lists+linux-tegra@lfdr.de>; Sun, 31 May 2026 08:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC4A830179FB
	for <lists+linux-tegra@lfdr.de>; Sun, 31 May 2026 06:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331B125F7A9;
	Sun, 31 May 2026 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNlgE9mH"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2432B136
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780207713; cv=none; b=SRmgzgMvxcqaJch3mlxZ81laBcAXiirgJcQO1DZortSe3S1htMKGSOEyGT5aHD2O8lnMb/fVKuzSGr6uTuC17ObTYGD2SHTl/PY15SFxbNtMbhCzFqKmDpGYFn4+AFStdnLLxoBvwsoQL+o469pIGfj1lOrvxPrWQ6UI1mHU+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780207713; c=relaxed/simple;
	bh=UTFMmGQcp/+vAS3kvwu4fa3SALovcSxREeX1mYfp3Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cnISB+0Dv5uR3jUHZbhmtfiwgFcA4DcrW9/Dp1uoMQp5S7HWUaQhHgmCqn1+sBjgGkC9Z8Ee9ft6SnXccLqMtZovY/9y5UVlxwe87+Xjl3QXkvBWD65YhrBoLwGHXBDEWkUHCFI59eUXUJ2vGkZFGY970Wi0YUvbIWyhI90IN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNlgE9mH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D5E1F00893;
	Sun, 31 May 2026 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207711;
	bh=/RIAWcsdggrAj1q9UPmgQwLauoGYdsxwfmuNbjPmGSs=;
	h=From:To:Cc:Subject:Date;
	b=cNlgE9mHHW1NTP7r76+8D4Yp3igyIZ0Z8C3JjPzS9nrAAuHkJPNrJVyYVmN2HWnDM
	 F5CvXExKXGzLdq2qA3bo01L9XJrg7AFVvjHxR/IWbathKi3NhWFesfbExNxW2TFfNV
	 zu7+Xxb6d6J7JUP3KZ0kOY5taDcRaCHvevWyJ6G2QjOfwlhKlQ1iNh8USxUYfDl4za
	 8n0coX67+7NQ0Gqreifochtrg1L1ekFZk0UccpV3X2V9+H5ypXMDh1vztqBuTLh+sd
	 YFTDnB/PLzBYnUL+W8xEN+HB/juP6PS97WysgH4bsfal7utKISwaz/Gyv7+aCEppmf
	 XrjEDsaJv0ECg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:18 +0200
Message-ID: <20260531060825.1855391-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14809-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 371CF614A9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-dt-bindings

for you to fetch changes up to 1f1471284e9b5c2317b4dd8710270aa33c2fd2fe:

  dt-bindings: tegra: pmc: Add Tegra238 compatible (2026-05-28 23:11:15 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v7.2-rc1

This adds a compatible string for an upcoming new chip as well as
changes some maintainership information.

----------------------------------------------------------------
Prathamesh Shete (1):
      dt-bindings: tegra: pmc: Add Tegra238 compatible

Thierry Reding (1):
      dt-bindings: reserved-memory: Change maintainer for BPMP SHMEM

 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml   | 2 ++
 .../bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml           | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

