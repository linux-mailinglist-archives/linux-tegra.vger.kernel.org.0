Return-Path: <linux-tegra+bounces-7390-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564EADA2A0
	for <lists+linux-tegra@lfdr.de>; Sun, 15 Jun 2025 18:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45EFA188EEC8
	for <lists+linux-tegra@lfdr.de>; Sun, 15 Jun 2025 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B796527C145;
	Sun, 15 Jun 2025 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YP5jYylc"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F8381C4;
	Sun, 15 Jun 2025 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006330; cv=none; b=GWGlh1lU9lIKP7s7COrmaEQ6uw2pWWeWnVEM3Hr1vJQbSXFRqsA/nZtbtUd+wntKNh302mc9HnfqeM1NV8DSgxqJ9YFdvfN2jNPk/fmEKMp76hRNQT++AnQpLzGSbdDBh6XJ9SBBJZv2A1r8pmu+8Pzp8IKNcB5q2jG7iUVFsgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006330; c=relaxed/simple;
	bh=l/fGt3Zz/3ZUxPCveJXSuMJcWc2tzptxBmmNZmFRBqk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oqK0GQAwKAWxHEwwq/veqMUr7Uwk6YXOynvwBb/N9NOUngjVxRjddfPKvkYaL8Y/wBgZeYqcfia1jjeYPH83IOIX7lMK8EtcEb/P7kmFtdh0RpP8N1z8kxd0GjlfqnB8V3ZXHgPFZsvfcwlTzrAxv7raAMWSUY3lq4jiTrxggns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YP5jYylc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD49C4CEEF;
	Sun, 15 Jun 2025 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006329;
	bh=l/fGt3Zz/3ZUxPCveJXSuMJcWc2tzptxBmmNZmFRBqk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YP5jYylcUkG7aEJrMeOvZkqIxxQElInVpAhhRQbwPmlIjZK40iv6coxEFYMM4lJoM
	 zX4iH1OzbgLpKp3LdR0vp1ppFKmd23IGLbvNYRDKUMJImYviyE04t6lvETQoxnk4fS
	 5Fd+kARy2kvbrEkehDI8Zc6HKu8cO82fNLHlsVbVYCPsI9x+/z7qrigBEJohE907NY
	 FqPKRlde3tr3Swxr0vU/H6WNiVf+9whfA5ZhUs9CthKxlIYXEzzDUjbnEM9MzImI23
	 B369fdHtqwOpPWmEcf3mFk72XDHisdgVsmHsVko9FPR/SbvLPu+n+DOAEB/lbxV1gm
	 5HDR3m2I9DrmA==
From: Vinod Koul <vkoul@kernel.org>
To: jckuo@nvidia.com, kishon@kernel.org, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, Wayne Chang <waynec@nvidia.com>
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250502092606.2275682-1-waynec@nvidia.com>
References: <20250502092606.2275682-1-waynec@nvidia.com>
Subject: Re: [PATCH 1/1] phy: tegra: xusb: Fix unbalanced regulator disable
 in UTMI PHY mode
Message-Id: <175000632608.1180789.15034099318224353632.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:06 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 02 May 2025 17:26:06 +0800, Wayne Chang wrote:
> When transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE, the code
> assumed that the regulator should be disabled. However, if the regulator
> is marked as always-on, regulator_is_enabled() continues to return true,
> leading to an incorrect attempt to disable a regulator which is not
> enabled.
> 
> This can result in warnings such as:
> 
> [...]

Applied, thanks!

[1/1] phy: tegra: xusb: Fix unbalanced regulator disable in UTMI PHY mode
      commit: cefc1caee9dd06c69e2d807edc5949b329f52b22

Best regards,
-- 
~Vinod



