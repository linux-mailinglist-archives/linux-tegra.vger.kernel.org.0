Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A805F9561
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2019 17:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbfKLQRL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Nov 2019 11:17:11 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16974 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfKLQRL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Nov 2019 11:17:11 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dcadb080000>; Tue, 12 Nov 2019 08:17:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 12 Nov 2019 08:17:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 08:17:10 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 16:17:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Nov 2019 16:17:09 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.80]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dcadb050000>; Tue, 12 Nov 2019 08:17:09 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <pgaikwad@nvidia.com>
CC:     <digetx@gmail.com>, <pdeschrijver@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe 
Date:   Tue, 12 Nov 2019 08:17:05 -0800
Message-ID: <1573575426-31314-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573575433; bh=eQ0GLwkkDpsa9FC5OvaMqHKzWX4hyyNgh67/TUqpPO0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=RqioFf+kefjyDbKyZC221cLxqtWk8h7V4XVgnCZN1mGF6b/KOBTHQblcgxWpFBOiC
         oPhgggjzYld4SbrDLizHX+MuQep8oMpS+WhD08ZumpXNsx//5d0yOKvpHrvII4Ty1E
         FLuBmCf7ZhBULmC9p6i3fF9uKkAVphaEB5RK+nbUfW3NP+bMRrOJ2/xnySlCQo6a7N
         RYMBFN9fmtI4i5uWjtfHj9Mh+0GPFToK3VcHSIeHw2Jugf5JHMN5J4iP+wPeWqEWXo
         2cyPZrN6WejJwcS6nryP4PYXhoNNCiD6q/0jcShuE+tMc18bfG7EE85IwUiHPOUXKS
         GmBwBZOMyUtiQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch includes fix to remove pm_runtime_irq_safe which was added
mistakenly during dfll suspend and resume implementation as a part of
Tegra210 SC7 suspend and resume patch series.

This patch removes pm_runtime_irq_safe and also has minor description
update for argument of dfll_suspend in comments.

Some of the patch series are applied so sending this fix as incremental
fix to latest linux-next.

Sowjanya Komatineni (1):
  clk: tegra: clk-dfll: Fix to remove pm_runtime_irq_safe

 drivers/clk/tegra/clk-dfll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.7.4

