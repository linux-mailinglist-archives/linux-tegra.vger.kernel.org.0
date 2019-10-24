Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F97E38AD
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439916AbfJXQqb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39715 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439929AbfJXQqa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so10777556wra.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D2UeHNMAu5Kp/NPx+tAQiEXLV+mubgyLK0Vp0oNiIw4=;
        b=X9rcVWrs/1mfietCC2Er6ap+BVS2bZF8wpnpbAb+UxfvqyrEPrvT0pmGgLzuLi7iTE
         xL//lYlvsOAnDFOPFrBHZWhNYLo3PF+Wke7ApVj5xqvkVSbAs7DsP6aJ6bOfxWVGa39i
         hOCgIF3R3LiLBZfrJJxnWB1NRTN+akgb5dQZ6EtiyXu6HVOLrk5zFryt46fpcyFjPyk6
         iBjXn6Y0dca9oW+5vgb4g73Jnaf85320gIZ96QScP2k3+CaHdXZTF1xvOHcDPLb7+OZG
         MxloX42KS60/VyYHyCBn3qJ0/P6q9ljEv91y4PRJBqSAlgVC64u97AFyh2ZFsuSI7+aC
         4FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2UeHNMAu5Kp/NPx+tAQiEXLV+mubgyLK0Vp0oNiIw4=;
        b=MmFwAA2PtnATrWHy5HH3859m/I2wa0L/4BuRlVzhSNfN08xQRP+rQd4uUOMtwph0hr
         N2EaesZqmINPHmb0YfzMoGzHRXuGvUspHJZorwZ81WJfdMKeJ1Az8Uifr2DwJIPbafKT
         GDCRqpzRrBQeu9jXn6Cw6I0Q6AAz5SHpaGuNz6FPUxlMhwhfNWgEpKFyt1B5KjrCJ7pv
         y39426lY73i045V4gV4E5ghnR250famHiyCOYAfDmY6GyGjnB1uop8UsnEp944SvxxLd
         V5dXil/KFOfFuDivLcqJhb9/1FvxGmePwl1HiXciuop/K286um+JJZcjP0NWUwb+FWCP
         +/Dg==
X-Gm-Message-State: APjAAAUD5hb8GUQBUdZ7lXg1RK3QOTHJKt0x9rpktHZ2NHwgvbMxw09/
        vBmaMbkAY1Fa/WKkNFkALtUAEALB
X-Google-Smtp-Source: APXvYqzGma/6UYiNaI9+S5cw8bjU4PeFSo4H3FYFriV7jsX8/NdZXwin70oGzSbXfI/jbdfyI0l1nQ==
X-Received: by 2002:adf:b219:: with SMTP id u25mr4502900wra.327.1571935589180;
        Thu, 24 Oct 2019 09:46:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id p1sm3659739wmg.11.2019.10.24.09.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 23/32] drm/tegra: sor: Use correct SOR index on Tegra210
Date:   Thu, 24 Oct 2019 18:45:25 +0200
Message-Id: <20191024164534.132764-24-thierry.reding@gmail.com>
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

The device tree bindings for the Tegra210 SOR don't require the
controller instance to be defined, since the instance can be derived
from the compatible string. The index is never used on Tegra210, so we
got away with it not getting set. However, subsequent patches will
change that, so make sure the proper index is used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4e46524f22e3..c7faf088cabc 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3759,6 +3759,11 @@ static int tegra_sor_parse_dt(struct tegra_sor *sor)
 		 * earlier
 		 */
 		sor->pad = TEGRA_IO_PAD_HDMI_DP0 + sor->index;
+	} else {
+		if (sor->soc->supports_edp)
+			sor->index = 0;
+		else
+			sor->index = 1;
 	}
 
 	err = of_property_read_u32_array(np, "nvidia,xbar-cfg", xbar_cfg, 5);
-- 
2.23.0

