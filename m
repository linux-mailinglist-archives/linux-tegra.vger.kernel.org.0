Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C12EE38BF
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407633AbfJXQqw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39757 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405516AbfJXQqv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so10778626wra.6
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oFcPP2oqutBVyEiEACLaC7jQyoj9cZb8X5+nPOqCh7o=;
        b=TZjKFmQbkbNHnXanxjcWtAgpeaF8KGP7cYtEIFz+T1fl6RXPpBGDum4oB9w0sCVmAd
         4ml40spo8rbDQA04LDO7W2onpmI/Ng2S2DgO+f318AVyFfwpOMsENcL0rN1NgeqOfglB
         8C5dBKm24qwSsxrNCUhcYzycUGR8D0CpJaICkexJTkTFNaDYgyJRgq7xSZki7ghncePh
         Ngh6Jr64kkJOrRdAbhTJqsYJ/RCWWFD/sAPpSvBQjcdF+isQ716wcoifti2j8mbNFyME
         FrBgw30ns3N/3/ylqoIhYZzhj/V/zPgTv9if8RhJQZTaYFjPU6+i4eq5ie+MABjHQxqq
         Zebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFcPP2oqutBVyEiEACLaC7jQyoj9cZb8X5+nPOqCh7o=;
        b=Z+y8HmHBgUXHGGr3RzKozz3oE9b+iCba1GENX7jGirF/ElfzArlAW+eGdxL/xyo/Zk
         w2RajkyUinvDJbRjp6tj3Ou9CYsd0/vjWk2ovEMmTPiL2d0se09bMM6xXGE3MLyOhV+c
         yOJ8PjCYCS425uF+lYxJ/S61j/t3+35fiypfDi2IafzFF1c4lxb3JMHCW9adKOw6T1vE
         G5nwDlxEOiXOoRdwvZbOZanc/XZ6tLHpoP1tcIprMFQjw+Z2UQPUdFpZeRKPXYL/oRme
         I4KsWC7/EltICYIRLLn/Fs87rR+PByqyNOKp+szBqzWsnuJyCODR5JOEN5jQ0wZUiH1n
         RhcQ==
X-Gm-Message-State: APjAAAWx8mLpvIkapfTVTnhZP34qzbK1W/hx0wjaY0nNgLl4OCn/l88c
        Bc/qMa+E2U7P+kYG2Vi/Qx8=
X-Google-Smtp-Source: APXvYqw1/hZX5WMs4ab63v5HQMWmYw5vlnLln0CGWngX/3ACyBOT0yDMD2mOwJBPkaMVnEh2VWRDBQ==
X-Received: by 2002:a5d:6246:: with SMTP id m6mr4947510wrv.262.1571935609360;
        Thu, 24 Oct 2019 09:46:49 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 1sm8265435wrr.16.2019.10.24.09.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 32/32] drm/tegra: sor: Introduce audio enable/disable callbacks
Date:   Thu, 24 Oct 2019 18:45:34 +0200
Message-Id: <20191024164534.132764-33-thierry.reding@gmail.com>
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

In order to support different modes (DP in addition to HDMI), split out
the audio setup/teardown into callbacks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 478c001f4453..615cb319fa8b 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -398,6 +398,8 @@ struct tegra_sor_ops {
 	const char *name;
 	int (*probe)(struct tegra_sor *sor);
 	int (*remove)(struct tegra_sor *sor);
+	void (*audio_enable)(struct tegra_sor *sor);
+	void (*audio_disable)(struct tegra_sor *sor);
 };
 
 struct tegra_sor {
@@ -3008,6 +3010,8 @@ static const struct tegra_sor_ops tegra_sor_hdmi_ops = {
 	.name = "HDMI",
 	.probe = tegra_sor_hdmi_probe,
 	.remove = tegra_sor_hdmi_remove,
+	.audio_enable = tegra_sor_hdmi_audio_enable,
+	.audio_disable = tegra_sor_hdmi_audio_disable,
 };
 
 static int tegra_sor_dp_probe(struct tegra_sor *sor)
@@ -3616,9 +3620,11 @@ static irqreturn_t tegra_sor_irq(int irq, void *data)
 
 			tegra_hda_parse_format(format, &sor->format);
 
-			tegra_sor_hdmi_audio_enable(sor);
+			if (sor->ops->audio_enable)
+				sor->ops->audio_enable(sor);
 		} else {
-			tegra_sor_hdmi_audio_disable(sor);
+			if (sor->ops->audio_disable)
+				sor->ops->audio_disable(sor);
 		}
 	}
 
-- 
2.23.0

