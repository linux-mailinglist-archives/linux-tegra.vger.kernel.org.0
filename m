Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4390E218FB9
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jul 2020 20:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgGHSb1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jul 2020 14:31:27 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:34886 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgGHSb1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 8 Jul 2020 14:31:27 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 06A2ABC0CB;
        Wed,  8 Jul 2020 18:31:23 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     marvin24@gmx.de, gregkh@linuxfoundation.org,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] Staging: nvec: Replace HTTP links with HTTPS ones
Date:   Wed,  8 Jul 2020 20:31:17 +0200
Message-Id: <20200708183117.16563-1-grandmaster@al2klimov.de>
In-Reply-To: <20200708101858.GL2549@kadam>
References: <20200708101858.GL2549@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/staging/nvec/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/README b/drivers/staging/nvec/README
index 0e2d5c4c875f..510e6933f402 100644
--- a/drivers/staging/nvec/README
+++ b/drivers/staging/nvec/README
@@ -10,5 +10,5 @@ but the source code[1] of the published nvec reference drivers can be a guide.
 This driver is currently only used by the AC100 project[2], but it is likely,
 that other Tegra boards (not yet mainlined, if ever) also use it.
 
-[1] e.g. http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=tree;f=arch/arm/mach-tegra/nvec;hb=android-tegra-2.6.32
+[1] e.g. https://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=tree;f=arch/arm/mach-tegra/nvec;hb=android-tegra-2.6.32
 [2] http://gitorious.org/ac100, http://launchpad.net/ac100
-- 
2.27.0

