Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2918C1A2809
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2020 19:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgDHRiK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Apr 2020 13:38:10 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35385 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgDHRiK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Apr 2020 13:38:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id g3so8881869wrx.2
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2020 10:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPVNiBrLdpQMmdH8MPTLAEOg9N9bPZJ7wNOFFKh1d6c=;
        b=YX8asMP1oDJsqRPHJWn1S+YLcQdSK6UntH5QypA1DXRge1zpk+QsvrSpnDhVzq7BhQ
         YKUNhOTgPEeM9LsuoJmugXf/NRyVUOJgB9xtxX+f+i3SKpqkEdAOt7Q0jYcCY0QeFec9
         4zm+BJe199H7U+Iqc0v6WWJVQ7yDuRKFhva1Qe9fah8U/9FxoH2oxssLDKstegpyowx5
         +7rtmJ4evH5u2CKtR4Bn8E2uCQytq7xFJrrxUzd0+cK+tGOW2asa7Xs3sydaqPtEw6hr
         ftjWrrqHjB/NXLfvJYZMS5GoVKlMUvsGcEef+D25i6MJ5XoSjxtNijs9gS3FBMe+V5vF
         qxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aPVNiBrLdpQMmdH8MPTLAEOg9N9bPZJ7wNOFFKh1d6c=;
        b=ffLajG9U+o8iXlMbUyBa7m0+yOqnZagC5iSr92acBbqeZmyv3YsTjQ0cDvxyip/Y9j
         YYAPRQaINf3MMlZRFDFzrlFPHUBTO57psH16n2j6wb+IIQhzWJxr8BoN8lLp7acAOgE/
         QUyy4LzMVoBFKKteytFRa4X8EE46jljCQmEVgXza+PX2fFqqkmJc5GU+WDEPvtjvcPX9
         zidq9MDPSnscKnUBlH0CU6TdSv0V2RgWrR4Lh5wPPVWVWFVNiAI0xZXiHVVbYlPO0ixO
         zWTiV3WjukdhdjvDd5kSJ3OOzFoW7yg6w/siSm5O5UUoLVz8311+6OCnb5cfBsKvHl26
         DlIw==
X-Gm-Message-State: AGi0PuZ66Cg4v87QwgzGlxmVpX1jC6IbsN0ibvYf+/mMIIjBlUxhCc86
        3I3L91wGC2+sAOKyasDfuyPFWPLv
X-Google-Smtp-Source: APiQypLjxw1Sa++cAHGJZ0DQMG/4nBA7V17Byp+Qr+sVDRxKW6AIXT/hyr+XAW1MK+9t1QIQVflEOQ==
X-Received: by 2002:a5d:5187:: with SMTP id k7mr1398760wrv.217.1586367488114;
        Wed, 08 Apr 2020 10:38:08 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id s9sm609036wmc.2.2020.04.08.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 10:38:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH] gpu: host1x: Detach driver on unregister
Date:   Wed,  8 Apr 2020 19:38:02 +0200
Message-Id: <20200408173802.3077833-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Currently when a host1x device driver is unregistered, it is not
detached from the host1x controller, which means that the device
will stay around and when the driver is registered again, it may
bind to the old, stale device rather than the new one that was
created from scratch upon driver registration. This in turn can
cause various weird crashes within the driver core because it is
confronted with a device that was already deleted.

Fix this by detaching the driver from the host1x controller when
it is unregistered. This ensures that the deleted device also is
no longer present in the device list that drivers will bind to.

Reported-by: Sowjanya Komatineni <skomatineni@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/bus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 6a995db51d6d..e201f62d62c0 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -686,8 +686,17 @@ EXPORT_SYMBOL(host1x_driver_register_full);
  */
 void host1x_driver_unregister(struct host1x_driver *driver)
 {
+	struct host1x *host1x;
+
 	driver_unregister(&driver->driver);
 
+	mutex_lock(&devices_lock);
+
+	list_for_each_entry(host1x, &devices, list)
+		host1x_detach_driver(host1x, driver);
+
+	mutex_unlock(&devices_lock);
+
 	mutex_lock(&drivers_lock);
 	list_del_init(&driver->list);
 	mutex_unlock(&drivers_lock);
-- 
2.24.1

