Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5FC21AF28A
	for <lists+linux-tegra@lfdr.de>; Sat, 18 Apr 2020 19:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgDRRHW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 18 Apr 2020 13:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgDRRHV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 18 Apr 2020 13:07:21 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FB5C061A0C;
        Sat, 18 Apr 2020 10:07:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e25so5341363ljg.5;
        Sat, 18 Apr 2020 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GmbaXDj6/A2yy3AR+sXi1M1Zh+o7hArk00ZH5b0F9ZU=;
        b=IQ9EFc/970LojBwLiW62BzGPBnOzmy32A9jVWoWDsei2DhVR8dy4ffZK8x9F8N/PT9
         wz+97rXX+dPMgbFLEKEgQdx3eKpfxvKbKVItMhwDIZZM4azyCyXkzGwkA1cOCVO16rZW
         ijs5x3KGwycbHCNqt377mxeBk5RpP4qSU/hhCb8VoluNtNwpdZk0fRsstUZ/wF6uSkIP
         cH2DfNt7s4OhUz9VQoicOILzpbPXRXEOJ9miVMZ9abM3msVEBkoUeDljv5312QK5ipCx
         mV4h5MQAtt6gTz0k6nhyJvwz5ONJBG8xfvHxyizNXWX3ekQx+Z2N98hMEt1qNfcYdgBC
         FlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GmbaXDj6/A2yy3AR+sXi1M1Zh+o7hArk00ZH5b0F9ZU=;
        b=rOEmrC/y2lacksHnwEtk9Si1Ul3z8Xj4C7dhw5HMnyKTwe4VLkr7l50rXwZcDyjtHp
         x2L47VlebHA33pXMlBGti9cyzuY52Zoy8fhHJwPjUnYhcIBw73as12BtxcGU9OeqJW9r
         /rkk+WY/wM3TkLwig2FMBSzJyld5adGYbb77/yXQefDwv9ephw4ysQkO4mQRJzW8V7ji
         R+Nsg25kFYwM2oSFFDfg9Qd2uGeVNijLru1cxQrqZPV9mELwAAQ187F0vjZkFIjhS2uZ
         mHKUr5CNPhY9xwyRCttvZ3GEEEF9PkBNhwq6IQLrNxvkE0wheBYVrAekM8c8b4q8b5wN
         64PQ==
X-Gm-Message-State: AGi0Pub8xZoG8SqdjJoZmumrEaovOmMc62TxOJmS1rGRxB7Ul/1RoqWE
        V3gNNCS717zAmBJTpXLK+GYaSUbo
X-Google-Smtp-Source: APiQypJZeGBXci/SYfTR0hCgDyYACwvrJkNlkiEL97tY/h/8Q5HyrC0kRIAH1vune5hFb+wviydGyw==
X-Received: by 2002:a2e:9a4c:: with SMTP id k12mr5235920ljj.189.1587229639769;
        Sat, 18 Apr 2020 10:07:19 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 10:07:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
Date:   Sat, 18 Apr 2020 20:06:59 +0300
Message-Id: <20200418170703.1583-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When graph isn't defined in a device-tree, the of_graph_get_remote_node()
prints a noisy error message, telling that port node is not found. This is
undesirable behaviour in our case because absence of a panel/bridge graph
is a valid case. Let's check presence of the local port in a device-tree
before proceeding with parsing the graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index b50b44e76279..e0652c38f357 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -239,13 +239,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge)
 {
 	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
+	struct device_node *local, *remote;
 
 	if (!panel && !bridge)
 		return -EINVAL;
 	if (panel)
 		*panel = NULL;
 
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check presence of the local port.
+	 */
+	local = of_graph_get_local_port(np);
+	if (!local)
+		return -ENODEV;
+
+	of_node_put(local);
+
 	remote = of_graph_get_remote_node(np, port, endpoint);
 	if (!remote)
 		return -ENODEV;
-- 
2.26.0

