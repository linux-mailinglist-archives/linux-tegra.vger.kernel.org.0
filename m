Return-Path: <linux-tegra+bounces-1795-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 278128AAD05
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 12:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A71801F215B3
	for <lists+linux-tegra@lfdr.de>; Fri, 19 Apr 2024 10:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B657F7C3;
	Fri, 19 Apr 2024 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="aIw02H4M"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E67F48C
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523539; cv=none; b=KNDbfP0DSb3GZhckLbG2xkFZNhX93IHbMQfH/osKeF/RQIUwBbZQKXhfWUnqhiqeQDJJ2J68JjDZtD+PLPyWLFg8MineuaYnTxLvK5pBhT4DOdAf1JH76fNBcywI/uG3ZB5n3JiPwbtGVL4srtWobH/nsWhR9HzOlIfVDUxweu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523539; c=relaxed/simple;
	bh=8NWOjYXGp6F23bnbuyT6TToyFdLWl5EDECnzDwdXpzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzcgQq306xa0iuTO55nbWSJtWJWYlOmGd+cOtJIi9Y/YX86I0uK6wW/LdTGAjMcKhEGoszBzgMgKqLQKxi/+8Ot66cnRheJ8klZAr5wClntcln9ILnQrmS1eLbQEV2ORUm1AJfYSDetqNSpiSm/SWzcVtkyvi+mu2R5v/Tna1fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=aIw02H4M; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 56D916005416;
	Fri, 19 Apr 2024 11:45:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id KevOm6fNeENH; Fri, 19 Apr 2024 11:45:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C6067600482F;
	Fri, 19 Apr 2024 11:45:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1713523525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXA9O7J9Jra2JDryhxVIZp4cb5+WzCWkGEEda/NoRLw=;
	b=aIw02H4MoVZLfsTFRT77NBSOBmpd4MDKPl5gIiXh86pt1YYk6hBxOCyUlSjsPV8QqjOhp9
	wlJtLYWvvsKihpk2LuT2/U8U1iT8Di1KrdcTsFbSpQdS6Fx236MCJaiHrpXfgXoe6iYyXu
	sQNvvnSAjOVrkgm+gp7LsVkAoygmgLo=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A69993600AC;
	Fri, 19 Apr 2024 11:45:25 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: krzysztof.kozlowski@linaro.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 3/7] memory: tegra: Reword and correct comments
Date: Fri, 19 Apr 2024 11:45:11 +0100
Message-ID: <20240419104516.308975-4-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect comment on periodic_compensation_handler() as the call
update_clock_tree_delay() with DVFS_UPDATE is responsible for dividing
the samples accumulated up to that point and comparing the computed
values with the currently programmed ones. While at it fix the
indentation of a nearby comment.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index 15048f542367..a80c3b575612 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -451,18 +451,12 @@ static u32 periodic_compensation_handler(struct tegra210_emc *emc, u32 type,
 			__MOVAVG(next, C1D1U1) = 0;
 
 			for (i = 0; i < samples; i++) {
-				/*
-				 * Generate next sample of data.
-				 */
+				/* Generate next sample of data. */
 				adel = update_clock_tree_delay(emc, DVFS_PT1);
 			}
 		}
 
-		/*
-		 * Seems like it should be part of the
-		 * 'if (last_timing->periodic_training)' conditional
-		 * since is already done for the else clause.
-		 */
+		/* Do the division part of the moving average */
 		adel = update_clock_tree_delay(emc, DVFS_UPDATE);
 	}
 
-- 
2.44.0


