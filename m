Return-Path: <linux-tegra+bounces-1538-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6189E10D
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Apr 2024 19:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 390B81F2400F
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Apr 2024 17:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772DA155382;
	Tue,  9 Apr 2024 17:03:39 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3C15538F
	for <linux-tegra@vger.kernel.org>; Tue,  9 Apr 2024 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682219; cv=none; b=tD1qA24iXYdGdp9/M7zYNjSt4593Nseh5zqpAm3sbNc/ELJaSx3JPHlFOJtWIm9hL6bLRFFH3NDp8kK+bmXK5DVV9Oab28wv3Yk6MLWyQHZ4YumnBcPeP8nELeN6OJKthZBI1Jky2yt3sXpeghbTrzzE3CHfwdkHsfCQ2dqhBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682219; c=relaxed/simple;
	bh=SInnTnTlpk4lC0a1OFt5dfcAXu152vN+6fS/Qz+hcZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a4Rz7bGC/f4wtKO17vLkX0ZNpZUvp9dTJhq5sf/6EmSY53nUCovrq3bYjUXs89ml2aCcMRnIL71Pcjy5du+RI+CUgKtT3xbb2rIUY7wfJ/O3tmqVlNey1Ebj0Tvg+oZ5WdJSxX7zkAyYAt+ZdRwpGcsd+mhO+IJwTZyDv4KlRLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsE-0003vU-EZ; Tue, 09 Apr 2024 19:03:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsC-00BKy7-Eu; Tue, 09 Apr 2024 19:03:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruEsC-00H4tQ-19;
	Tue, 09 Apr 2024 19:03:04 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 0/4] gpu: Convert to platform remove callback returning void
Date: Tue,  9 Apr 2024 19:02:47 +0200
Message-ID: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=SInnTnTlpk4lC0a1OFt5dfcAXu152vN+6fS/Qz+hcZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmFXS3eAV7HI2w8HMoMiE4vmmyNOiQhnxVpMoga STlONQCJeyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZhV0twAKCRCPgPtYfRL+ Tm+HB/92rq+dGfXMi0jrB/Ig/F+qBugwFODSuTOyjy9rrlH4AbZ4W23SnRx9za6p66ippE8ctgz 9TSLyCzQFTSC1kUwwpfXiF//p46buUY7wyYNB+1r9bavrmtsfuUkxRiJBk3P/tFZ28590ooBHUf 3yanYVUV6taxIgLBgoTtP0VPRWVc7pF/NM9ROjGokRfxYButJMxp2QFvxylGFwzU5kZnrKx2+z7 85Gu6iiva8+Vvl9PYX0+fizhotAEJuzFoGSIVDJcXGWiZLs34HriSVUiRa5zOOwEIS9Ipfm6RJO 0fV6zSjsXrEXUIyQ4e3uTNm5H9eGFEBBhs3DLnhZuy8EwSdC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org

Hello,

with some patches sent earlier[1], this series converts all platform
drivers below drivers/gpu to not use struct platform_device::remove()
any more.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

All conversations are trivial, because the driver's .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches. This is merge
window material.

Best regards
Uwe

Uwe Kleine-König (4):
  drm/imagination: Convert to platform remove callback returning void
  drm/mediatek: Convert to platform remove callback returning void
  gpu: host1x: Convert to platform remove callback returning void
  gpu: ipu-v3: Convert to platform remove callback returning void

 drivers/gpu/drm/imagination/pvr_drv.c  | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_padding.c | 5 ++---
 drivers/gpu/host1x/dev.c               | 6 ++----
 drivers/gpu/ipu-v3/ipu-common.c        | 6 ++----
 drivers/gpu/ipu-v3/ipu-pre.c           | 5 ++---
 drivers/gpu/ipu-v3/ipu-prg.c           | 6 ++----
 6 files changed, 12 insertions(+), 23 deletions(-)

base-commit: a053fd3ca5d1b927a8655f239c84b0d790218fda
-- 
2.43.0


