Return-Path: <linux-tegra+bounces-8994-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D84BB42A2E
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Sep 2025 21:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2E24485264
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Sep 2025 19:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC04369962;
	Wed,  3 Sep 2025 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPnRNgD+"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BD2D375D;
	Wed,  3 Sep 2025 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929082; cv=none; b=pBv5M3HolIRjNpE96zRLqH1J7lQU4HsmaO7nXK8McIQqUfv3hUs/5g/khJYN+z6fZS97HJmNCU90P5KPVPlZEzC7JQQ0SxGgOHqg1QB3b5eyQQkb5JJsV1SUFuIUYcb64K2tKwbim5Ug4UGrOjq3H+H9ly6gfajIseXekMSYMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929082; c=relaxed/simple;
	bh=QE+tJk1zGwmAgzpewZ2cpQB2QWRaftfJfeA1AtKdsDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RV2te2KhwWMt54atO7wY2Cn1FY4Vj6m639h0ySIKfU/8QZHcTge21ubPWPPuFmryTzZzZRhddvJlNC1nmIlokcXLLrVfhqMeKSBhlIl4z8SxHKQzfrEiBDvDlHPFL0KBiimtbLuXzwY6w4BaqnDD0x6FPKZSS3AbFiGD+dbdUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPnRNgD+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20FE1C4CEFC;
	Wed,  3 Sep 2025 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756929082;
	bh=QE+tJk1zGwmAgzpewZ2cpQB2QWRaftfJfeA1AtKdsDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IPnRNgD+mvBxBEkMFpp7qLquP6Ez8p4BNSvrDkdeASXUn8fXhcUteeg9XXPDPLpLU
	 RN5wnU5f50o+xyQgQhJ23tu9+vjh6U/KKPX6coPNMe3O9fNsqqV2Bt/68IKTelcfic
	 gwG01/ldB2EFNdJcPqT/mewDxDt1G2L8X23tYQsivd1yY+joSs3x7Sd5pe5V4z3xL3
	 9h5fsrGBUHBXC4x85Uda79hjT6S58X/dfRL/8vDZo9bbGpcBbrdAmp3RmYQ9bnMZwG
	 sOxo3ZiCH0zysjQop8smBun3DezPOY9PYpwlaLSdJQZkIi7+Z7BlzPM0YwvEpDt1nB
	 x+CRpwCTsnyhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1339FCA1014;
	Wed,  3 Sep 2025 19:51:22 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 03 Sep 2025 14:50:10 -0500
Subject: [PATCH v2 4/8] soc: tegra: fuse: speedo-tegra210: Add soc speedo 2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-t210-actmon-v2-4-e0d534d4f8ea@gmail.com>
References: <20250903-t210-actmon-v2-0-e0d534d4f8ea@gmail.com>
In-Reply-To: <20250903-t210-actmon-v2-0-e0d534d4f8ea@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756929080; l=904;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=IRRKZEiLQdonkqHTuobp6JolP/SAC2dsrByPD6yqKl4=;
 b=UgUDh8BGqyCC4bvag8hU2oislyDKSzclNPKEAvoLqqi8Y4SMtP8slXqeNp3TpYwtt5msVhOqC
 jZ44x5QcxmKBKqpW692D8qfVo58xKa9tlaMvOPyUh3598ga1tCUqhJ5
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The Jetson Nano series of modules only have 2 emc table entries,
different from other soc sku's. As the emc driver uses the soc speedo to
populate the emc opp tables, add a new speedo id to uniquely identify
this.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/soc/tegra/fuse/speedo-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra/fuse/speedo-tegra210.c
index 60356159e00d2059e55eaacba27b5ca63bf96c90..c310bdabcfd06ea8f23facb4eaaf209f183dc4eb 100644
--- a/drivers/soc/tegra/fuse/speedo-tegra210.c
+++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
@@ -97,6 +97,7 @@ static void __init rev_sku_to_speedo_ids(struct tegra_sku_info *sku_info,
 			break;
 
 		case 0x8F:
+			sku_info->soc_speedo_id = 2;
 			sku_info->cpu_speedo_id = 9;
 			sku_info->gpu_speedo_id = 2;
 			break;

-- 
2.50.1



