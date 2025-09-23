Return-Path: <linux-tegra+bounces-9439-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AEB96E9D
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Sep 2025 19:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06C4C7AF4A7
	for <lists+linux-tegra@lfdr.de>; Tue, 23 Sep 2025 17:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA87274FEB;
	Tue, 23 Sep 2025 17:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1y7xdpn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3E2264CB;
	Tue, 23 Sep 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758647135; cv=none; b=poEgIhKDSp5k/O3n8olvmx5gvyjwcYweGJajDvPKpDlkhkkmYNeEgeMjLqQb4+CcZWNOIn8ojitnnExCBS7MswObNHc80sQBzZRsabouFkXdk+mqm5Lo8uK7kXj6SzshoPn2A2m5rNs8+dd0MBg9mO3CFks3plxBX1C9ocbpKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758647135; c=relaxed/simple;
	bh=+wZGlloUcs9HcGjLptSEwJLHW7PWanvbNwUeqFcgXns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxUmjCyAYbJmpByFN/qpn6XkytScv5RXr2GOnGEIyM5EBqVcOKgSwkNApzGIVO1QuWhG7GG/XutBSwS81ukpM0cQp+bSjaN3hVHxyMb7ZnrKy47iVUZYFnC6/YLpT7jiKAe7IpHQacH+rlp4cFxfRnjGopwZX48a/3gD5saQSwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1y7xdpn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF858C16AAE;
	Tue, 23 Sep 2025 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758647134;
	bh=+wZGlloUcs9HcGjLptSEwJLHW7PWanvbNwUeqFcgXns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H1y7xdpneRXBjMNpf1bF6GJCYi1hM/ZTOHpFzhcdk0HvwHVPY3iqbwKIaWKrewNEY
	 vuD8p6GKFxQPxof5haTL0Ao/qhzYvaM4QjAU868OgKDFEGGSkrS1ypOtszPZRgbH9R
	 eC3Zwb83KGwIg7OkLBYwjicybZp908ZukmePpxj4Omd+JVTlMcW63JN+ypRAQVXoyD
	 goIogA/zntmUJLLYw8VcmHOTh60kKFM2UYwPbZSeYnE9sLtY3WvXib5+Ut3C+5TBj8
	 HZRVTA/OMSc6O1y9xMtHlgcli2RHWVd1hr5/3qN5haSwxjNUB021WKu4Kj0DoF0+Jp
	 6IwIPcoTJrA6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB93CAC5AC;
	Tue, 23 Sep 2025 17:05:34 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 23 Sep 2025 12:05:29 -0500
Subject: [PATCH v4 3/9] dt-bindings: memory: tegra210: Add memory client
 IDs
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-t210-actmon-v4-3-442d1eb6377c@gmail.com>
References: <20250923-t210-actmon-v4-0-442d1eb6377c@gmail.com>
In-Reply-To: <20250923-t210-actmon-v4-0-442d1eb6377c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758647133; l=3162;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=JZbgw1yuf/pUxCjfyBMmj/ZFn3o6t78B6Wied9zF8UE=;
 b=F8A6Y59muvjsfQHjUb3tG92y82BBw7pIFe5lothLT0zJFsF6sS0P1/fo9pdriW38GQKWd3u9V
 ps0ay8dFuNXD4JU51VaTJ2sZMLF4uoG7/ThxHDHEJ5rdO2QYeiZ7W5O
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Each memory client has unique hardware ID, add these IDs.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 include/dt-bindings/memory/tegra210-mc.h | 74 ++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
index 5e082547f1794cba1f72872782e04d8747863b6d..881bf78aa8b2636bb71954968b0251145d72fecd 100644
--- a/include/dt-bindings/memory/tegra210-mc.h
+++ b/include/dt-bindings/memory/tegra210-mc.h
@@ -75,4 +75,78 @@
 #define TEGRA210_MC_RESET_ETR		28
 #define TEGRA210_MC_RESET_TSECB		29
 
+#define TEGRA210_MC_PTCR		0
+#define TEGRA210_MC_DISPLAY0A		1
+#define TEGRA210_MC_DISPLAY0AB		2
+#define TEGRA210_MC_DISPLAY0B		3
+#define TEGRA210_MC_DISPLAY0BB		4
+#define TEGRA210_MC_DISPLAY0C		5
+#define TEGRA210_MC_DISPLAY0CB		6
+#define TEGRA210_MC_AFIR		14
+#define TEGRA210_MC_AVPCARM7R		15
+#define TEGRA210_MC_DISPLAYHC		16
+#define TEGRA210_MC_DISPLAYHCB		17
+#define TEGRA210_MC_HDAR		21
+#define TEGRA210_MC_HOST1XDMAR		22
+#define TEGRA210_MC_HOST1XR		23
+#define TEGRA210_MC_NVENCSRD		28
+#define TEGRA210_MC_PPCSAHBDMAR		29
+#define TEGRA210_MC_PPCSAHBSLVR		30
+#define TEGRA210_MC_SATAR		31
+#define TEGRA210_MC_MPCORER		39
+#define TEGRA210_MC_NVENCSWR		43
+#define TEGRA210_MC_AFIW		49
+#define TEGRA210_MC_AVPCARM7W		50
+#define TEGRA210_MC_HDAW		53
+#define TEGRA210_MC_HOST1XW		54
+#define TEGRA210_MC_MPCOREW		57
+#define TEGRA210_MC_PPCSAHBDMAW		59
+#define TEGRA210_MC_PPCSAHBSLVW		60
+#define TEGRA210_MC_SATAW		61
+#define TEGRA210_MC_ISPRA		68
+#define TEGRA210_MC_ISPWA		70
+#define TEGRA210_MC_ISPWB		71
+#define TEGRA210_MC_XUSB_HOSTR		74
+#define TEGRA210_MC_XUSB_HOSTW		75
+#define TEGRA210_MC_XUSB_DEVR		76
+#define TEGRA210_MC_XUSB_DEVW		77
+#define TEGRA210_MC_ISPRAB		78
+#define TEGRA210_MC_ISPWAB		80
+#define TEGRA210_MC_ISPWBB		81
+#define TEGRA210_MC_TSECSRD		84
+#define TEGRA210_MC_TSECSWR		85
+#define TEGRA210_MC_A9AVPSCR		86
+#define TEGRA210_MC_A9AVPSCW		87
+#define TEGRA210_MC_GPUSRD		88
+#define TEGRA210_MC_GPUSWR		89
+#define TEGRA210_MC_DISPLAYT		90
+#define TEGRA210_MC_SDMMCRA		96
+#define TEGRA210_MC_SDMMCRAA		97
+#define TEGRA210_MC_SDMMCR		98
+#define TEGRA210_MC_SDMMCRAB		99
+#define TEGRA210_MC_SDMMCWA		100
+#define TEGRA210_MC_SDMMCWAA		101
+#define TEGRA210_MC_SDMMCW		102
+#define TEGRA210_MC_SDMMCWAB		103
+#define TEGRA210_MC_VICSRD		108
+#define TEGRA210_MC_VICSWR		109
+#define TEGRA210_MC_VIW			114
+#define TEGRA210_MC_DISPLAYD		115
+#define TEGRA210_MC_NVDECSRD		120
+#define TEGRA210_MC_NVDECSWR		121
+#define TEGRA210_MC_APER		122
+#define TEGRA210_MC_APEW		123
+#define TEGRA210_MC_NVJPGRD		126
+#define TEGRA210_MC_NVJPGWR		127
+#define TEGRA210_MC_SESRD		128
+#define TEGRA210_MC_SESWR		129
+#define TEGRA210_MC_AXIAPR		130
+#define TEGRA210_MC_AXIAPW		131
+#define TEGRA210_MC_ETRR		132
+#define TEGRA210_MC_ETRW		133
+#define TEGRA210_MC_TSECSRDB		134
+#define TEGRA210_MC_TSECSWRB		135
+#define TEGRA210_MC_GPUSRD2		136
+#define TEGRA210_MC_GPUSWR2		137
+
 #endif

-- 
2.51.0



