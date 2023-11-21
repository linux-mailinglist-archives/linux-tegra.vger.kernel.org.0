Return-Path: <linux-tegra+bounces-1-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C3B7F22E9
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Nov 2023 02:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92BE12813C8
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Nov 2023 01:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3287633FF;
	Tue, 21 Nov 2023 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pK9834Qs"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAE525A
	for <linux-tegra@vger.kernel.org>; Tue, 21 Nov 2023 01:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55308C433C7;
	Tue, 21 Nov 2023 01:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700529075;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=pK9834QskxlRe2p3VT9N7Lf6kgXIcz9N0d26iDdRulghXAqX++JKKldjXkjHYXrYg
	 2DIHH9h+wmWaMjFHVdfiaNP+xGPIfD7GaGaDkXAWYPhls7x+nTbB2d13bdHpzX++eU
	 1LC1zT9+kaPh4AqsRHURSPflKL6IS0RgEC3+tYpU=
Date: Mon, 20 Nov 2023 20:11:14 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-tegra@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-military-bullmastiff-of-action-db3b71@nitro>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

