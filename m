Return-Path: <linux-tegra+bounces-14155-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEUeBe/b+GnG2QIAu9opvQ
	(envelope-from <linux-tegra+bounces-14155-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 19:48:31 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 806044C222A
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 19:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AAB530315CC
	for <lists+linux-tegra@lfdr.de>; Mon,  4 May 2026 17:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10A53E51E1;
	Mon,  4 May 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKX8MOQK"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5713E51D9;
	Mon,  4 May 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916888; cv=none; b=Zind/5ThTowQsY9xH6zHQ6ZWhwPgx4dD2OTAgCUWeTEFKA+7RRnNTeQP9pX3wpdSn6e8p9vgm2MeTCJKOdw2EpgdXIyv3BY7olBXa38BrJj8N5YFiZcMYAVYpjhqMSjG6Pp+W9iK3xPQY9RVvIzBobi//Issm+B3cu+ss5cXa3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916888; c=relaxed/simple;
	bh=hnhXDhfI9DIXuKSKpl8xbQqsHpRmF7aoNO7xAcsksgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNFJLd2XH7jvLfCv5BDpY54ZZ0ruOusHuzCXowTYnHWZE9GhvNR2DKVNewfhPNoS5w55dJ74wYuBioofg1hNnPf070vdfQiKF/qNt26xiD+J1Xnht8ePurwmtoUe63lGv/I1X97jR+vAB8fpUg1xuUfwmO8R6z0Um0sLI2Jt+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKX8MOQK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E84DC2BCC4;
	Mon,  4 May 2026 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916888;
	bh=hnhXDhfI9DIXuKSKpl8xbQqsHpRmF7aoNO7xAcsksgU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dKX8MOQKd/RICEZzV52FdTNlh1IzD78A/kVeX90d5bXnaNIjsZrXIEspvnPV36ZRE
	 HaS/3m3XcWXIz/mNMMNhdXQ3jOCv/htOhsfU2qCqDBwaF6MZbzvoWZ6e3UCQroUKmQ
	 IU0dYkCSfbgtsLWDJF99kJc5GPP0QH3tHrymMAqKwdFlxnnEs2sqtJMqeVUKqtBVDL
	 /sxlDAsTG4en0Yh85vMqEQg9JEc8/1q4FaL85UYWrE3dd6ooXvJ3Xadxj+bYqHTbIF
	 r9paneNxEwHLORCQuZ5OLnavs33c1Pq5Sl7qrKRMt+/lz7DNB19qVZQqvLr8k6iNkO
	 Rc3RhC2Hm4OYA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260501-memory-refactor-v3-1-69fb1ae1a7ca@nvidia.com>
References: <20260501-memory-refactor-v3-1-69fb1ae1a7ca@nvidia.com>
Subject: Re: [PATCH v3] memory: tegra: Deduplicate rate request management
 code
Message-Id: <177791688690.723206.2850289224860595092.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 806044C222A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14155-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]


On Fri, 01 May 2026 16:00:52 +0900, Mikko Perttunen wrote:
> As is, the EMC drivers for each 32-bit platform contain almost
> identical duplicated code for aggregating rate requests. Move this
> code out to a shared tegra-emc-common file to reduce duplication,
> and add kerneldoc comments.
> 
> Based on code from the tegra20-emc driver.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Deduplicate rate request management code
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8879cff7f86f82e8922208668fb0f7227e4836db

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


