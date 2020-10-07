Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3959286597
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Oct 2020 19:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgJGRRX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Oct 2020 13:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727732AbgJGRRW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:22 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE75C0613D5
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=S0t8ZPzt4VTfUn3m0ydcvIR2pO0GfgWwf7E1oEaoMpY=; b=VGkHHJ2Fp+76ZIYvYEQkVC1VeJ
        41bze8B9J+4EIEJRteOsKa2WR774s9XIOMMQbVt1i7Aui2viQ7R2S1tD3UKDxkrsClnt7UetPL8jP
        zR0xNuvNMfiPOkPFebqUA/jsFNM2Vo9ZhnDq6ank/U/Xe3I0t+R+hawxsWZxmlwSzXvfEUVJyvkjc
        vCmzfegtqD/OOxuME6ekyqP6Y93QhUR6p9qm+2PmLcvDaBSUiU5mYlgGaV0CCufZ+gmGa+uaB3ES/
        FdifFOGkePNsh/M5B9YWljZjhEC1Jitlw23KJ697ReklyOogIBvKv9ESp0Oji56Zy3nkvM+kRmHnJ
        l1YcJmWg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD3z-0006P9-Sg; Wed, 07 Oct 2020 20:17:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 05/20] gpu: host1x: Use HW-equivalent syncpoint expiration check
Date:   Wed,  7 Oct 2020 20:12:23 +0300
Message-Id: <20201007171238.1795964-6-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Make syncpoint expiration checks always use the same logic used by
the hardware. This ensures that there are no race conditions that
could occur because of the hardware triggering a syncpoint interrupt
and then the driver disagreeing.

One situation where this could occur is if a job incremented a
syncpoint too many times -- then the hardware would trigger an
interrupt, but the driver would assume that a syncpoint value
greater than the syncpoint's max value is in the future, and not
clean up the job.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 51 ++-----------------------------------
 1 file changed, 2 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 5982fdf64e1c..9ca0d852e32f 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -306,59 +306,12 @@ EXPORT_SYMBOL(host1x_syncpt_wait);
 bool host1x_syncpt_is_expired(struct host1x_syncpt *sp, u32 thresh)
 {
 	u32 current_val;
-	u32 future_val;
 
 	smp_rmb();
 
 	current_val = (u32)atomic_read(&sp->min_val);
-	future_val = (u32)atomic_read(&sp->max_val);
-
-	/* Note the use of unsigned arithmetic here (mod 1<<32).
-	 *
-	 * c = current_val = min_val	= the current value of the syncpoint.
-	 * t = thresh			= the value we are checking
-	 * f = future_val  = max_val	= the value c will reach when all
-	 *				  outstanding increments have completed.
-	 *
-	 * Note that c always chases f until it reaches f.
-	 *
-	 * Dtf = (f - t)
-	 * Dtc = (c - t)
-	 *
-	 *  Consider all cases:
-	 *
-	 *	A) .....c..t..f.....	Dtf < Dtc	need to wait
-	 *	B) .....c.....f..t..	Dtf > Dtc	expired
-	 *	C) ..t..c.....f.....	Dtf > Dtc	expired	   (Dct very large)
-	 *
-	 *  Any case where f==c: always expired (for any t).	Dtf == Dcf
-	 *  Any case where t==c: always expired (for any f).	Dtf >= Dtc (because Dtc==0)
-	 *  Any case where t==f!=c: always wait.		Dtf <  Dtc (because Dtf==0,
-	 *							Dtc!=0)
-	 *
-	 *  Other cases:
-	 *
-	 *	A) .....t..f..c.....	Dtf < Dtc	need to wait
-	 *	A) .....f..c..t.....	Dtf < Dtc	need to wait
-	 *	A) .....f..t..c.....	Dtf > Dtc	expired
-	 *
-	 *   So:
-	 *	   Dtf >= Dtc implies EXPIRED	(return true)
-	 *	   Dtf <  Dtc implies WAIT	(return false)
-	 *
-	 * Note: If t is expired then we *cannot* wait on it. We would wait
-	 * forever (hang the system).
-	 *
-	 * Note: do NOT get clever and remove the -thresh from both sides. It
-	 * is NOT the same.
-	 *
-	 * If future valueis zero, we have a client managed sync point. In that
-	 * case we do a direct comparison.
-	 */
-	if (!host1x_syncpt_client_managed(sp))
-		return future_val - thresh >= current_val - thresh;
-	else
-		return (s32)(current_val - thresh) >= 0;
+
+	return ((current_val - thresh) & 0x80000000U) == 0U;
 }
 
 int host1x_syncpt_init(struct host1x *host)
-- 
2.28.0

