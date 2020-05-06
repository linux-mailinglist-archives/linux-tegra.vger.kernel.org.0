Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D2E1C706D
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 14:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgEFMhm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 08:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727067AbgEFMhm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 08:37:42 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 May 2020 05:37:42 PDT
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543B1C061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 05:37:42 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by xavier.telenet-ops.be with bizsmtp
        id bQYe2200Z3ZRV0X01QYeNw; Wed, 06 May 2020 14:32:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWJE6-0000iB-Fw; Wed, 06 May 2020 14:32:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWJE6-0001x8-DZ; Wed, 06 May 2020 14:32:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] memory: tegra: EMC scaling is not a clock provider
Date:   Wed,  6 May 2020 14:32:34 +0200
Message-Id: <20200506123236.7463-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

	Hi all,

The Tegra EMC scaling support code is not a clock provider, but merely a
clock consumer, and thus does not need to include
<linux/clk-provider.h>.

However, drivers/memory/tegra/tegra210-emc-table.c relies on
tegra210-emc.h to include <linux/of.h> through <linux/clk-provider.h>.
Hence the first patch makes <linux/of_reserved_mem.h> self-contained
first.

Thanks for your comments!

Geert Uytterhoeven (2):
  of: Make <linux/of_reserved_mem.h> self-contained
  memory: tegra: Drop <linux/clk-provider.h>

 drivers/memory/tegra/tegra210-emc-core.c | 1 -
 drivers/memory/tegra/tegra210-emc.h      | 1 -
 include/linux/of_reserved_mem.h          | 1 +
 3 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
