Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3AFA8D124
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Aug 2019 12:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfHNKqM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Aug 2019 06:46:12 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:34045 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbfHNKqM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Aug 2019 06:46:12 -0400
Received: by mail-vk1-f201.google.com with SMTP id g68so43619149vkb.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Aug 2019 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
        b=qHDnRpQM4FQsTdQ5gtW17elm8fjJAy+ftuSFwl3seP2A/RZCy3vUgZqi1oZvyDumPB
         0Ywwj7FkrvBNiaRh79/tLI+OvZ1GEIZxWGGGS11bToRsPclnktx5ydUOPcoV/ceGedU5
         j1ZohdoTULS7l4DG4E0oJIA8PGiv25MlfXgEXGINrCSWlIDU/utNRX87TiyQNzVxcfB0
         QITWLROiiBxsMYizA0WIK++f+g8MnJYRvv3JfrZGDFxRKujJdFUCdsBLjO+lvxPnlrbw
         oO2mtZwBbqa7HcAUnZBC8eE/ortohmS+Ysn//uZpJx0oFLxoJTSC4l28xIFknZMupCVu
         2tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
        b=ETeYGkwDYWHN2eTMy49cpYOQnJtiVvftxMn8TYHlvg1x55Q5gdt0rTiQcO0IuYW2QO
         5bVP5C6Cs+ZvGKh00vPQRJvsDLuGjXcdK3RdNzvoOw6+qbGIPm4OwhLuwjfwXBgORctv
         PsUha/ujhI7UvXdNzQuiI7ra5DaZLeJ36tpTddWiuufQwAn6kA5dyBhD+YKQhQIoX8FN
         3xeZE3t/S+NTpO6eA63lJK5G18IWbhvuJimr+Zyry6BGUppxYwQ9M7inKgzDqXL5OiTs
         28KTomT/HAlhJHRTjZdHDVLV4YoM4FuhHdTKkgChg0mNnqhiIdQ289YlmCFhC3Pa+Pfn
         YpoQ==
X-Gm-Message-State: APjAAAW4MN/h/+/IMAxK8WCavT9iXFYsMBoip5UeXSdZuViSX/yFhD3F
        qs/Eq6FNoL1ZSJtcyzrOxtf2/yeOK6w=
X-Google-Smtp-Source: APXvYqyoT5pUd+WeFrXBYZxNE0G3jZZLgp89mH7NfYSTWCCaTY8Y54tIFMMw/d4PPiauoCVTHqxHY+kI17c=
X-Received: by 2002:ac5:cdad:: with SMTP id l13mr9148123vka.30.1565779570656;
 Wed, 14 Aug 2019 03:46:10 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:05 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-8-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Changes since v4:
	- only create a CEC notifier for HDMI connectors

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index bdcaa4c7168cf..34373734ff689 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
 
 void tegra_output_connector_destroy(struct drm_connector *connector)
 {
+	struct tegra_output *output = connector_to_output(connector);
+
+	if (output->cec)
+		cec_notifier_conn_unregister(output->cec);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
 		disable_irq(output->hpd_irq);
 	}
 
-	output->cec = cec_notifier_get(output->dev);
-	if (!output->cec)
-		return -ENOMEM;
-
 	return 0;
 }
 
 void tegra_output_remove(struct tegra_output *output)
 {
-	if (output->cec)
-		cec_notifier_put(output->cec);
-
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 
@@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 {
+	int connector_type;
 	int err;
 
 	if (output->panel) {
@@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	if (output->hpd_gpio)
 		enable_irq(output->hpd_irq);
 
+	connector_type = output->connector.connector_type;
+	/*
+	 * Create a CEC notifier for HDMI connector.
+	 */
+	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		struct cec_connector_info conn_info;
+
+		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
+		output->cec = cec_notifier_conn_register(output->dev, NULL,
+							 &conn_info);
+		if (!output->cec)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

