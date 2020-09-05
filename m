Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A234D25E706
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Sep 2020 12:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgIEKgR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 5 Sep 2020 06:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgIEKgG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 06:36:06 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B207C061258
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=N/bRBmyQkJLgSyUzsVQ6uNyTLjcI6xyjAhEB1wYIDE4=; b=L8+NEkp53MNU0AfyY1A7hdM56I
        XjvXk9kzkMNCN6jWkN0GppOMFZvstj2YtyyawRbyRNEX2MRzvlX6iDNt+mlPJaYTG17Kixu2/iaq+
        B4A6fARpZeILsQlfu/IMj5LSfO5HRCa6iV0heBDRgMKVWj2adJU7o0uYVcEbwC5s36onrqLpNvX60
        9HPSKGN86MoZuX1lsiUnei7F6BY2Wodge2UeP6l11fSFJQ4hSG/tdevepyJtkpP9UcgrTrhmWYBMl
        HmP7aiWXBta7F0aa62FM87EoJCzegwTvPVMZc63aty7fklRrDkI99RwCRAa1yn1+LcRBl1AbkfS6S
        m6e1RAhA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kEVXy-0003SS-F2; Sat, 05 Sep 2020 13:35:50 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a syncpoint
Date:   Sat,  5 Sep 2020 13:34:16 +0300
Message-Id: <20200905103420.3021852-14-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

With job recovery becoming optional, syncpoints may have a mismatch
between their value and max value when freed. As such, when freeing,
set the max value to the current value of the syncpoint so that it
is in a sane state for the next user.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 2fad8b2a55cc..82ecb4ac387e 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,7 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	atomic_set(&sp->max_val, host1x_syncpt_read_min(sp));
 	sp->locked = false;
 
 	mutex_lock(&sp->host->syncpt_mutex);
-- 
2.28.0

