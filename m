Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68282E3892
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439895AbfJXQqI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51959 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436846AbfJXQqH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:07 -0400
Received: by mail-wm1-f66.google.com with SMTP id q70so3613339wme.1
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6VLoJyLaTalvPJTjL4ZURLjR521ZUnRyrnLxHevvRaM=;
        b=ehcQLQC5E+gvhhTIBrAdm6Wp2/fRl3wMgXLryA6knIosKQs1Na6Bt/uu5kXL7Z6iiW
         mVWQqcBO99ZsOdf9dgdA77VZli/eOXxbVcSEogQlhRkgXuUpfAEMWBQZqSj9gvOdxTLC
         qyvrexZMfLD8VSwaEFzMwNuRnhvCV8eFaaVi0/9SIBNXzEvXSjmh0gn+uLDIfGSoRQDD
         lP0CAyiXbUkAVsoDdzN92q1JYA71izNNQuOgtGtJyG+vZVB9Wj3GyQBToXHkM5m6PJm3
         WhasXUy+NPrhNnivV1XTd695MMrSTusHzVwrsmvABp6DIxiUSa4TYYXfbbVA4sCGzcqi
         pVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6VLoJyLaTalvPJTjL4ZURLjR521ZUnRyrnLxHevvRaM=;
        b=MBTUsE4lRPOMNF+YX1dhzUy3Hx1Vsl4z00ccpButF5d3hBHcy7+IbeL2gcf5PADNT2
         j+WqAsV4VEjXjF850auyfbJev+k9oLV3XtsBkho/YZrZRADvOwxddxgg/iOIUiyvzdWs
         hBMwDgKmPHgdqijRNgAHYvRKjuAeQkQGdb/hiWRr7Er49Vjef8jOZcf/LEPO2qak84hd
         /r9nYuXFzVj3/e1a2XqSoxazFZrrt2i7g/ojuhW2T3E9cU8RnYuFjJ1WvYTI4hEfagqX
         qEyqo5i5WJmrW3hTQck2kjwqvDwwniryMAuVuWfJotar9JGcA+VdAO8f2YEPyVFM6rnt
         NvbA==
X-Gm-Message-State: APjAAAV0MMGKjplRh9GDlYjdx9Xa7VCaWUEuT3LU60RUNixT17zOJ+rr
        VHzNvtRpti0ueaD6pclwmYVRMzMm
X-Google-Smtp-Source: APXvYqxCTYIc2lo6yAMdPgmEf2fXBJegbWiE+vuDuM6/LyEQ4pIB1jN8pr9bOLLxm3tv/4q5/MdPUQ==
X-Received: by 2002:a05:600c:294b:: with SMTP id n11mr5546291wmd.70.1571935563958;
        Thu, 24 Oct 2019 09:46:03 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id h205sm3542137wmf.35.2019.10.24.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 12/32] drm/tegra: dp: Set channel coding on link configuration
Date:   Thu, 24 Oct 2019 18:45:14 +0200
Message-Id: <20191024164534.132764-13-thierry.reding@gmail.com>
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

Make use of ANSI 8B/10B channel coding if the DisplayPort sink supports
it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 757a0256592f..ca287b50fad8 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -203,7 +203,7 @@ int drm_dp_link_power_down(struct drm_dp_aux *aux, struct drm_dp_link *link)
  */
 int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 {
-	u8 values[2];
+	u8 values[2], value;
 	int err;
 
 	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
@@ -216,5 +216,14 @@ int drm_dp_link_configure(struct drm_dp_aux *aux, struct drm_dp_link *link)
 	if (err < 0)
 		return err;
 
+	if (link->caps.channel_coding)
+		value = DP_SET_ANSI_8B10B;
+	else
+		value = 0;
+
+	err = drm_dp_dpcd_writeb(aux, DP_MAIN_LINK_CHANNEL_CODING_SET, value);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
-- 
2.23.0

