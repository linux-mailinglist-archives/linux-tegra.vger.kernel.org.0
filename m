Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2B80E38BC
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405923AbfJXQqr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55711 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405516AbfJXQqr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id g24so3594769wmh.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xnrmAgjd57yL7bQcusoIEkE1OASAQ02Qykb8fz3n31M=;
        b=MZvBicSw9zipfnsTLsDJjAQ+KeqkoZ0fMDPFBlaj+HgXTCOnugmEXur/eBCIIsyCw4
         /ts6A+LhkwqzykJWglYVjSj5RdrSg8WHX4ubiqyi7sxQPuMLxHVQSx/PiNAs/15Epflp
         nBJkwpsjNeDFSXmsCScMgWHRM4VwPTk096pjfwn5dr55yLDwPJUio3oNDXy3DQ8Vqe7n
         RyegAq2wyWdH40gOFovFJlVPjxC+cOjHsa0TkUf6m8yVMUb+u2bYGmP9rap5bC1awJOY
         hJXf63FZVrHHE3L1WZbo2cgOSdi+sECp5G6OLOLmcsUArsCuS6RoDgdMEJ+cKq2j0kg2
         wozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xnrmAgjd57yL7bQcusoIEkE1OASAQ02Qykb8fz3n31M=;
        b=MsrwqdJ1bMk5XKXg/ZUbYTu21YTNUkPmlQX4TLLpk/9Vf687byg0XZDJuze9w2wtRR
         wQFmoaT/5N0kLuA8Fjul4OROdGwIl/vts+OthSrJ5eQvbUOyBnQ87LnP9ENDskQlgmqh
         I0r9MD4EtOH4u+8bCkeiA8Ptj5rn27oUbPZOOcjm1ijTsSVaESSGTaRuar9a2SxHU0mc
         WMTB+V+Oxt/T0JAYGXxj86GVCepV2hXbKLZrlk4zOAkF0EJOyf3dJ3Fpe4nT6PbfDKMW
         KytNjcM/4aByYKgQX8yzqK+KyV1gqCvCoMFcWUC+qN84df8TCqZdw8XYHDvipFfLza/n
         8aSw==
X-Gm-Message-State: APjAAAX3bpsZxNhreMXoniWmSfrbkrSuNEBVpZze5Jtm5jfVkPXeAVl6
        WezIRfH9hxJNahUNSiTdNZaJJWJl
X-Google-Smtp-Source: APXvYqxZAXDPe/3JAnophhlvR/u4XCDRfpFhlc7VbOFvIhyKwORNTsCUZIjGYdNT3RJd3uUhy+9foQ==
X-Received: by 2002:a1c:9d07:: with SMTP id g7mr5813102wme.53.1571935604846;
        Thu, 24 Oct 2019 09:46:44 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id d202sm2793119wmd.47.2019.10.24.09.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 30/32] drm/tegra: sor: Avoid timeouts on unplug events
Date:   Thu, 24 Oct 2019 18:45:32 +0200
Message-Id: <20191024164534.132764-31-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When the SOR is disabled in DP mode as part of an unplug event, do not
attempt to power the DP link down. Powering down the link requires the
DPAUX to transmit AUX messages which only works if there's a connected
sink.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 63831c37ad35..b81e6d39aa32 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2663,9 +2663,16 @@ static void tegra_sor_dp_disable(struct drm_encoder *encoder)
 	if (output->panel)
 		drm_panel_disable(output->panel);
 
-	err = drm_dp_link_power_down(sor->aux, &sor->link);
-	if (err < 0)
-		dev_err(sor->dev, "failed to power down link: %d\n", err);
+	/*
+	 * Do not attempt to power down a DP link if we're not connected since
+	 * the AUX transactions would just be timing out.
+	 */
+	if (output->connector.status != connector_status_disconnected) {
+		err = drm_dp_link_power_down(sor->aux, &sor->link);
+		if (err < 0)
+			dev_err(sor->dev, "failed to power down link: %d\n",
+				err);
+	}
 
 	err = tegra_sor_detach(sor);
 	if (err < 0)
-- 
2.23.0

