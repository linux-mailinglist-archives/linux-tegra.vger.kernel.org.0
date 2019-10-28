Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84882E7177
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfJ1Mhc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39907 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfJ1Mhc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id r141so8945691wme.4
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VncOp+mUljsufXJnBUWLSxNXn7g2AiBvDFJ0LnGPK3g=;
        b=uaeXfiXJ/j7C+zwGb61d7ibJLhREbj2cEPm/XJHipaZXsV38VifKgSdQmrtLCtUsDG
         Z+FaKqQqB3ahI45jyAIiUfl/rSZRpw7x06n0VxMt4Z0HA1r3RYze9eAR7a7YZe5Arjn8
         +4x/SMpisS6zTV7iNKWjnVR8YqD8YJ+Xa7FbLwsOowpjNxnykaV3fyEPdoAJwynFx/yZ
         hR6AGbX+teXfwO31TmcBnoA0WPuWH7qaofu3ns9V9v1j1a/V9+a7JsacfBUtjLY/rnS2
         HdoYqiOU6GXyorELDHXFyeiTdcYML4vRUcSWMGQF+LwvTGTmLdo3AO18zqtCL2z2OJ4T
         Fn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VncOp+mUljsufXJnBUWLSxNXn7g2AiBvDFJ0LnGPK3g=;
        b=WwZdykcTvLJq53dWYcCEwtVitcBhgbiZ6W2CJ5JWVEDKkKn6KaZdpIA+fMqR6foZqA
         mddowcD+ibL+xYamdvE4iscYipRIgq3C5FG6Q2hyfZ4NFyWRP3AGpsN69fLbdh9iq/j7
         mQJoaSsla8QJUwYr/ZvEpaPQL0oO6imdaf/32Wd4hPiZoR7AKsWYSDSVifBxRK8bKuoC
         MnOBo+YaEMTWnDWhnxsjTOXD4xt3qwNyM0kkkhoxf4IxW7c8Pzwa/yQDR/yNxWcEsMiG
         gF9yW1iu5gyfO25vPQlgCAMgRqfSECU9j/odIsk2vBxnzK5MDMehV7N62Ns3kWU1X8AB
         oA9w==
X-Gm-Message-State: APjAAAWP++7EVV5+xrc+We8HNwhuprf7uxV7k7YSI9ud/yk1UHNZCBC4
        A8wzK3tWqJ+v1r0Y2EuUukE=
X-Google-Smtp-Source: APXvYqxOVy+bTCgBsSYJR12Xu8F14DGtiViRIFkjBwX5BaBhbTDniBwKyD+QOm+sSjn1NoeYuaxx/g==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr15687949wmb.102.1572266249852;
        Mon, 28 Oct 2019 05:37:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id u1sm15316861wru.90.2019.10.28.05.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 04/12] gpu: host1x: Clean up debugfs on removal
Date:   Mon, 28 Oct 2019 13:37:10 +0100
Message-Id: <20191028123718.3890217-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028123718.3890217-1-thierry.reding@gmail.com>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The debugfs files created for host1x are never removed, causing these
files to be left dangling in debugfs. This results in a crash when any
of these files are accessed after the host1x driver has been removed,
as well as a failure to create the debugfs entries when they are added
again on driver probe.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 452ee5d64021..f30b8447a319 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -402,6 +402,7 @@ static int host1x_remove(struct platform_device *pdev)
 	struct host1x *host = platform_get_drvdata(pdev);
 
 	host1x_unregister(host);
+	host1x_debug_deinit(host);
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
-- 
2.23.0

