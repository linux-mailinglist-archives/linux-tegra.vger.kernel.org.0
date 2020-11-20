Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BCC2BA920
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Nov 2020 12:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgKTL0t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Nov 2020 06:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgKTL0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 06:26:47 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0492EC061A4A
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0O2oLaPvIQ9KzWmiqrQPn/haDbaFhV5R4yd0BV2bH4w=; b=wurDZZIaixXu/Fg1E+MrOtu+HD
        bbQA8qjlYYV4KNtmquFVjdD6P6XWvpdyu2VThk9e2t/4I/BhfXasKDrqOWpwRn+7VjIGRr8yO+k/e
        HrjPFG2dJdc37DO2MgI6I3VrFMmZba+uqUQizkUNA/KDgsUFkPnslYOMKO5xQzIBrwLLn+l9x6dDz
        kTYv6/ok2DuO4rlhRiBgF5aTnfOJOKWUxC3TGo8dfne03w1V7megqks4/r7NeH24uxGkn612Qisoo
        qld0hj7LmWRcgjfz3CVZu6J7tqLt/UJtVyvA/4WaCI8Pd6/HkTqu+p/g64fPkWmmgIfT6No+OjqLo
        NsqxxFtg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kg4Yr-0003lG-CO; Fri, 20 Nov 2020 13:26:41 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 13/21] gpu: host1x: Reset max value when freeing a syncpoint
Date:   Fri, 20 Nov 2020 13:25:52 +0200
Message-Id: <20201120112600.935082-14-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

With job recovery becoming optional, syncpoints may have a mismatch
between their value and max value when freed. As such, when freeing,
set the max value to the current value of the syncpoint so that it
is in a sane state for the next user.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Use host1x_syncpt_read instead of read_min to ensure syncpoint
  value is current.
---
 drivers/gpu/host1x/syncpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 8d658e5f7db2..99d31932eb34 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read(sp));
 	sp->locked = false;
 
 	mutex_lock(&sp->host->syncpt_mutex);
-- 
2.29.2

