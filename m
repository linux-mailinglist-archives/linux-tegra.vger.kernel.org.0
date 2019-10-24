Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71900E38BE
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406203AbfJXQqt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:46:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35175 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405516AbfJXQqt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:46:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id v6so3289570wmj.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WKBeVLYREt15Gh3e8xz+0QmQJOGSqeYITYZf2RyLHbw=;
        b=jZ2DuCClUsbZPw3pnaQmSqX6quDGwK0rbHR2dyP+ivScy3u9menmlTQrg/XNJ61hpQ
         4kTYwAU4P7hYSd6GtYT7mzJwDNdPvRjY6An4A/OKgORv58TbJPuXID1vH0QqBJchVDSh
         HJ98PncdOlYPs2kvMXShX8AaQxA7jF5TEXlYranGf6Q/k4e7QPTlIc6P8pT+zTnGFSt/
         PG9lgH+oiSrjta0+Pki+OyHPeumM5JQs8mysW+V3So9QbVee3/PcRtwuIH0zr7+K/9iV
         yrfQoQ9FlGjdLGboB4bME4um5KSIiSDOUlYJSV4C7X5WBN4g7wXALMgKMmjPwv1hudzs
         63Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WKBeVLYREt15Gh3e8xz+0QmQJOGSqeYITYZf2RyLHbw=;
        b=eSbbSiE82+svAKKpQoEC3Jo+48U4/UhxoWSxAi8dsUiD0loj4RZwliQEudRRVmMauK
         OdOpY/Wb9SxDZtzwwIph4PTUf9s836HKFXs06Y71KfCZ8eRbwDZ94HmtsGhrtvtB6ukb
         cc/6N/GfASwIlOhZfFcOzfW+xjyfvsjri2loVEseT5+FeE3/0IrimRDMizI1VBOgfD7B
         1tyVRbD9vJocSpMz7kOLwrLXC3FzUKaJoD1IHQqxB+my7FH8sMdffQzGL6q7VXZ/33MK
         mH1X7IgG5PrDeXpHusymGbiHTA5hw7w5M8DwZVSDpvbgXvPu2J30s0dUFZW5CbUfaSAv
         mFuw==
X-Gm-Message-State: APjAAAURfkOSGUkPRCnLVBdPZPLxHZqn9eosgtLnmHfYehuYcEYLIn6M
        GLvO4Mg0ae62Vd+nlElwcA4=
X-Google-Smtp-Source: APXvYqwRIWbOX1eE2QfXOf7xYJVmFGbmcJHphMcAF60WHywqSwZivxQL4msANSJjxLCMUVoAPPhUlw==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr6132288wmh.113.1571935607081;
        Thu, 24 Oct 2019 09:46:47 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c8sm2522429wml.44.2019.10.24.09.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:46:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 31/32] drm/tegra: sor: Extract common audio enabling code
Date:   Thu, 24 Oct 2019 18:45:33 +0200
Message-Id: <20191024164534.132764-32-thierry.reding@gmail.com>
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

The code to enable audio support is split into two parts, one being
generic for the SOR and another part that is specific whether the SOR is
in HDMI mode or in DP mode. Split out the common part in preparation for
reusing the code in DP mode.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 43 +++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index b81e6d39aa32..478c001f4453 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2002,6 +2002,30 @@ static void tegra_sor_audio_unprepare(struct tegra_sor *sor)
 	tegra_sor_writel(sor, 0, SOR_INT_ENABLE);
 }
 
+static void tegra_sor_audio_enable(struct tegra_sor *sor)
+{
+	u32 value;
+
+	value = tegra_sor_readl(sor, SOR_AUDIO_CNTRL);
+
+	/* select HDA audio input */
+	value &= ~SOR_AUDIO_CNTRL_SOURCE_SELECT(SOURCE_SELECT_MASK);
+	value |= SOR_AUDIO_CNTRL_SOURCE_SELECT(SOURCE_SELECT_HDA);
+
+	/* inject null samples */
+	if (sor->format.channels != 2)
+		value &= ~SOR_AUDIO_CNTRL_INJECT_NULLSMPL;
+	else
+		value |= SOR_AUDIO_CNTRL_INJECT_NULLSMPL;
+
+	value |= SOR_AUDIO_CNTRL_AFIFO_FLUSH;
+
+	tegra_sor_writel(sor, value, SOR_AUDIO_CNTRL);
+
+	/* enable advertising HBR capability */
+	tegra_sor_writel(sor, SOR_AUDIO_SPARE_HBR_ENABLE, SOR_AUDIO_SPARE);
+}
+
 static int tegra_sor_hdmi_enable_audio_infoframe(struct tegra_sor *sor)
 {
 	u8 buffer[HDMI_INFOFRAME_SIZE(AUDIO)];
@@ -2037,24 +2061,7 @@ static void tegra_sor_hdmi_audio_enable(struct tegra_sor *sor)
 {
 	u32 value;
 
-	value = tegra_sor_readl(sor, SOR_AUDIO_CNTRL);
-
-	/* select HDA audio input */
-	value &= ~SOR_AUDIO_CNTRL_SOURCE_SELECT(SOURCE_SELECT_MASK);
-	value |= SOR_AUDIO_CNTRL_SOURCE_SELECT(SOURCE_SELECT_HDA);
-
-	/* inject null samples */
-	if (sor->format.channels != 2)
-		value &= ~SOR_AUDIO_CNTRL_INJECT_NULLSMPL;
-	else
-		value |= SOR_AUDIO_CNTRL_INJECT_NULLSMPL;
-
-	value |= SOR_AUDIO_CNTRL_AFIFO_FLUSH;
-
-	tegra_sor_writel(sor, value, SOR_AUDIO_CNTRL);
-
-	/* enable advertising HBR capability */
-	tegra_sor_writel(sor, SOR_AUDIO_SPARE_HBR_ENABLE, SOR_AUDIO_SPARE);
+	tegra_sor_audio_enable(sor);
 
 	tegra_sor_writel(sor, 0, SOR_HDMI_ACR_CTRL);
 
-- 
2.23.0

