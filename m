Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD5065015
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jul 2019 04:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfGKCOQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jul 2019 22:14:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41198 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfGKCOQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jul 2019 22:14:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id d17so4701767qtj.8;
        Wed, 10 Jul 2019 19:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NxUDKpndtdH37r02jtP/ZlIzOK2B9SJpZuT4uAg/0AU=;
        b=hFV3Tm8hMjw81TGWqaIE/iJ+vYJ+ZRUmqg0O5TaWBdgjuwlk6M9QhZcQST2Xy6yng5
         PFmQad7oIAcfhCR4hKFyu1acp5IHAIvShwlUaKTx/AJ9fyl3EIvyJPLZjevZAU60+IpA
         6uCZLiNrLDo7+SJgEcp0Tz+469D9PTW2+svWg+z9Pq4hKY7lkSl9ARYm6WL6YGuVeYIv
         S/kXxX3OlTnqNjf/H2hemRFvGHJa+6N6PCkF4kM6Etkjr+/2Gn7SiYt7BYSXh9mXLV8D
         eUoyR1Bbzfdd5Qt4gJfbEWL5KNrwdSbTYE9AWGsOrtqbk/G0k88vZStlyOB8PT4zlXC6
         19Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NxUDKpndtdH37r02jtP/ZlIzOK2B9SJpZuT4uAg/0AU=;
        b=Nb30tgQh75WPuncY6jhJwcTwxKuWCdhXSTPkIQ7MZVjFCRVmZjzd5FBuMJAwlVkv7i
         F6FsV3GAyILU03+ukGy7IttIPh+L7VolKj83nZTL8EOscTVXj52hUFpe6ibjZCmLvkH4
         LyHHw/9iLTdQsYqQNiPnuZp5yp1Dx1h5zpRzxP7YGHmtZ08nwJhtTjT5hkWrsYydsHLv
         nJtgDlDEL7DkZ8booyLVqSlm84V1xjVqJW3oNmpJWE+1N0MPpJBofEfUQaDSQZthfJpi
         LVPqk8J22geD2H+6Qm9pziWxITxohFNvebzq58wAL9UwCwRcLFkMVoLmmnqOGhM6R+HX
         /msA==
X-Gm-Message-State: APjAAAX/5VYr9RvCzYsdKQWlS69X6z7OxqsZgxcisqjBc8ifHgpLtgTI
        lNuA2Nsg9FY2vTIMxk4jPBM=
X-Google-Smtp-Source: APXvYqwcTL4Hz3BceOiBvx+YeI0TA01sIV9kq2hfQaUvYx0b2wfMacpnvDvFd4ZChJOeO+tfcRXTDA==
X-Received: by 2002:a0c:f78d:: with SMTP id s13mr842039qvn.156.1562811255491;
        Wed, 10 Jul 2019 19:14:15 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id f20sm1699187qkh.15.2019.07.10.19.14.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 19:14:14 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it wasn't specified
Date:   Thu, 11 Jul 2019 05:13:13 +0300
Message-Id: <20190711021313.29445-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The rotation mode from cmdline shouldn't be taken into account if it
wasn't specified in the cmdline. This fixes ignored default display
orientation when display mode is given using cmdline without the
rotation being specified.

Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the commandline")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 56d36779d213..c8922b7cac09 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -859,7 +859,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	 * simple XOR between the two handle the addition nicely.
 	 */
 	cmdline = &connector->cmdline_mode;
-	if (cmdline->specified) {
+	if (cmdline->specified && cmdline->rotation_reflection) {
 		unsigned int cmdline_rest, panel_rest;
 		unsigned int cmdline_rot, panel_rot;
 		unsigned int sum_rot, sum_rest;
-- 
2.22.0

