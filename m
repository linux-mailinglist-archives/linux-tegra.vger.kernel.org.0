Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776DE1C7050
	for <lists+linux-tegra@lfdr.de>; Wed,  6 May 2020 14:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgEFMcl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 May 2020 08:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbgEFMck (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 6 May 2020 08:32:40 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6048FC061A0F
        for <linux-tegra@vger.kernel.org>; Wed,  6 May 2020 05:32:40 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by andre.telenet-ops.be with bizsmtp
        id bQYe2200V3ZRV0X01QYeof; Wed, 06 May 2020 14:32:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWJE6-0000iC-Fw; Wed, 06 May 2020 14:32:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWJE6-0001xA-ES; Wed, 06 May 2020 14:32:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Joseph Lo <josephl@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] of: Make <linux/of_reserved_mem.h> self-contained
Date:   Wed,  6 May 2020 14:32:35 +0200
Message-Id: <20200506123236.7463-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506123236.7463-1-geert+renesas@glider.be>
References: <20200506123236.7463-1-geert+renesas@glider.be>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

<linux/of_reserved_mem.h> is not self-contained, as it uses
_OF_DECLARE() to define RESERVEDMEM_OF_DECLARE(), but does not include
<linux/of.h>.

Fix this by adding the missing include.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/of_reserved_mem.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index a1b427ac291bf73d..8216a415626372ca 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -3,6 +3,7 @@
 #define __OF_RESERVED_MEM_H
 
 #include <linux/device.h>
+#include <linux/of.h>
 
 struct of_phandle_args;
 struct reserved_mem_ops;
-- 
2.17.1

