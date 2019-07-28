Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1050F7826D
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2019 01:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfG1XkL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jul 2019 19:40:11 -0400
Received: from gateway31.websitewelcome.com ([192.185.143.39]:23513 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726183AbfG1XkL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jul 2019 19:40:11 -0400
X-Greylist: delayed 1481 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jul 2019 19:40:11 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id 8CB7042A1
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jul 2019 18:15:29 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id rsO1hQmiO2PzOrsO1hWu2f; Sun, 28 Jul 2019 18:15:29 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8eM1ZD0P81hvxEH0zPMrHc1dSmyP7SXOYbdNw95fElQ=; b=v7fk5m+NtnGmmK+v9Cc8LiDioR
        Oj7xM8zlr1Ph9+Ns7nNtgf7udDx8FmlZgTIhbHIHThOHq81zqh60YOFA4JfVVYwTiF88h5Wj3RnAZ
        76uP6jA613mMpMSG8+1PZmd0Q93IphVbzHrQgOvZpWvq34IWqiWHpMT8LnnJcKXDqyVHhDyMjSBq9
        XmxqEFeuNnWHDJ07nRnVFXgNxzNFW6WtGPyBc6sSvRZmR9KH92IweC0WldC3/HzDXgEcH2PjypvIZ
        8pYU5CQXFMxxsLbbX1pwLonxSqjM4e1fzObGf8GXzhmK+1JYwoFhE2rTYV4nrPLJwQsL0MpGJbzEw
        GMGYJMCg==;
Received: from [187.192.11.120] (port=39040 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hrsO0-003VsI-Bx; Sun, 28 Jul 2019 18:15:28 -0500
Date:   Sun, 28 Jul 2019 18:15:26 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] ARM: tegra: Mark expected switch fall-through
Message-ID: <20190728231526.GA22066@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hrsO0-003VsI-Bx
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:39040
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning:

arch/arm/mach-tegra/reset.c: In function 'tegra_cpu_reset_handler_enable':
arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   tegra_cpu_reset_handler_set(reset_address);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-tegra/reset.c:74:2: note: here
  case 0:
  ^~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index 5a67a71f80cc..76a65df42d10 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -70,7 +70,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	switch (err) {
 	case -ENOSYS:
 		tegra_cpu_reset_handler_set(reset_address);
-		/* pass-through */
+		/* fall through */
 	case 0:
 		is_enabled = true;
 		break;
-- 
2.22.0

