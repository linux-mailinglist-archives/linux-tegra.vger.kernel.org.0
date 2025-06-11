Return-Path: <linux-tegra+bounces-7296-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F194AD5E9B
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Jun 2025 20:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86685174646
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Jun 2025 18:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674932949F1;
	Wed, 11 Jun 2025 18:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RS/PH5do"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B542280CC8;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668026; cv=none; b=EytjBeuEnsv9SvqHH2UBhua+HyY+X38aPa+RWpaNn0KVWerk9Bnu3lK3ua/WSbW6SgQWJg7OWHT6U3cVNdxR76TjxXgg6A6qhhTvSUFcO9f7hBr7siFGfJcvHIAoR+kLjeUejSvfSgTsE9QCs2i+4sQIYIGwB0Wz7+5DnouOllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668026; c=relaxed/simple;
	bh=P+1ESEkXYegBu8N1MnlcKmO5OEfHwJk5Zgtvhhg31BM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mf0hStbxLZiBY6lllwpuVc0cWKhHEN6tJbsOry4ACdkWRQTWg44JO654eyNHWmnIujzrBeeV5sqYM1uD/xNe+K3xPQLVaP2IS5Cu62480plq7KNlTa4ccPHjvr4SnIKqXGmZYehQVghaCZ2I8pfVQJ7HvDNWthf9dYpG5FB+NOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RS/PH5do; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A2BC4CEEA;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749668025;
	bh=P+1ESEkXYegBu8N1MnlcKmO5OEfHwJk5Zgtvhhg31BM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RS/PH5doDrwbnyZqPxsZcVCPciWeJwpdFNx19lnMVxJc8+CMx3O/3mH93lYPg+GPf
	 k9V7bdxJ/h8w34iEOEI68zJ658FJotLCXmS2ZTFbp+ycRKAAt3REgxl7LrcTkJFDI2
	 s/c9dUp46L/brffM8loNI1xIkbm20yyBW0hznNnC52rlzD9w7tWuCjGOfH8fVmR1nb
	 vwE6IyYTyx2TqAhCS5juSoUHkI4uDdDadOrrMcZfJOtwtX3Li9b2C32H+jlNX3Qbaw
	 klGAAzT2//QuDzY3UXoqAowZpy1MbmXuO6/mkdTs1xCXYZOiDYU/WaFoeu/jXbB9ra
	 iojL9mDkQrbvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A9C7113E;
	Wed, 11 Jun 2025 18:53:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer
 Kit support
Date: Wed, 11 Jun 2025 13:53:36 -0500
Message-Id: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDQSWgC/y3MSwrCMBSF4a2UOzZy87JNR+5DOghpbC/YpiQSl
 JK9G6vD/3D4dkg+kk/QNztEnylRWGuIUwNutuvkGY21QaDQqLlkm1RaMNSmxc5ZY4yE+t2iv9P
 rcG5D7ZnSM8T3wWb+XX/CBbu/kDlDppxwfGy9khyv02LpcXZhgaGU8gGJpFkUmgAAAA==
X-Change-ID: 20250513-p3452-059708ca9993
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749668025; l=858;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=P+1ESEkXYegBu8N1MnlcKmO5OEfHwJk5Zgtvhhg31BM=;
 b=oT7g3x+h36TNbm8SOmmg4YmQkQRmE2LXcKu5p/zJBftIRo76QJh2flBI4+/SU21VLwNExTevo
 iAK2PkA18Z4AWj4Lnl0LVpHQASK6B2s5WG42xys2bLNc3dsPMnwPQzp
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Fix usb power supply to align with downstream power tree
- Control vdd_hdmi with gpio pa6 and delete unused vdd_hub_3v3 to avoid
  conflicts
- Link to v1: https://lore.kernel.org/r/20250608-p3452-v1-0-4c2c1d7e4310@gmail.com

---
Aaron Kling (2):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support

 Documentation/devicetree/bindings/arm/tegra.yaml   |  5 ++
 arch/arm64/boot/dts/nvidia/Makefile                |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 59 ++++++++++++++++++++++
 3 files changed, 66 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250513-p3452-059708ca9993

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



