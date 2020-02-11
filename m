Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 927FE159B84
	for <lists+linux-tegra@lfdr.de>; Tue, 11 Feb 2020 22:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgBKVpQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 11 Feb 2020 16:45:16 -0500
Received: from gateway32.websitewelcome.com ([192.185.145.114]:33044 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727414AbgBKVpQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 Feb 2020 16:45:16 -0500
X-Greylist: delayed 2736 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:45:16 EST
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id BE6034432C
        for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2020 14:59:39 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1cd9jhVtyAGTX1cd9jtuIl; Tue, 11 Feb 2020 14:59:39 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IPGuh4dJHUV6jC0H2DD+K0aSPx7nJ/9fjrtidfPd1Bo=; b=ptfWdyKQkcSnaRqzN+e9PKQsaX
        PPFAU0pL1ijbOVJOaG+VQ9CmQM5Nn7elVWMpJG85ynyd5YUrrl5k2BsE7P5hs7bu8CwDooXCc89cS
        6EUPU/QWQzTRz9KDlDVbRsQ0dmfSfrR78U3FzVB+R+d0VFN9ujMMFuDbfUV8BsB5aWk4PPJaLM7XH
        FQPfJcURpt7gBQPW19Qbjl67vF/qLD93y/mZzzgylkiuCmvEspEIcjd3pBijTA3zDKVip4eMIYRZ/
        tq7m7gTMz2kjNVpvot9lsPl0kQYgxw8iCK5Wb0wQaUgru3rm3mgclfD7PoEaRmbkrnKLv5pPuXkoN
        /LD6H8yQ==;
Received: from [200.68.140.36] (port=14955 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1cd8-0022a3-9c; Tue, 11 Feb 2020 14:59:38 -0600
Date:   Tue, 11 Feb 2020 15:02:13 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] amba: tegra-ahb: Replace zero-length array with
 flexible-array member
Message-ID: <20200211210213.GA28043@embeddedor>
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
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1cd8-0022a3-9c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:14955
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 53
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/amba/tegra-ahb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index b0b688c481e8..e9e5c7bb580c 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -129,7 +129,7 @@ static const u32 tegra_ahb_gizmo[] = {
 struct tegra_ahb {
 	void __iomem	*regs;
 	struct device	*dev;
-	u32		ctx[0];
+	u32		ctx[];
 };
 
 static inline u32 gizmo_readl(struct tegra_ahb *ahb, u32 offset)
-- 
2.25.0

