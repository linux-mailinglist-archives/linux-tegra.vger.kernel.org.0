Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DE646681C
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Dec 2021 17:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359613AbhLBQaa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Dec 2021 11:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359763AbhLBQaJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Dec 2021 11:30:09 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E23C061799;
        Thu,  2 Dec 2021 08:25:32 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 207so690083ljf.10;
        Thu, 02 Dec 2021 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
        b=dOu9BzuYlTpC2xjUx5FiaMQmzvC0Wse24LfnaZaGLEnZl/FIac+px7wWke8QbzNAHA
         AUSCNbsbkHs8U62J8652zcWyqb5SdMFhuU6x6HH3IzkjJyGdJoOYLvCo5TpceADEvsmo
         pVQ8cgX5xW2XmYL4X4xMa4Sy8Xvg10aqJ4SwvMMBCwz67mY4Zfk92fyYIqAzwerVH2vb
         igSfwldVzZTlCAmUTo50E9viuaP2xWAJNuoZ/ZtlbWWjVrG6ZzOxzKR73a8dMnwEXVb9
         SmMKd2QHwszU77E0A0Mm/FsZsLeNP0piWAdNaOoLcsF7oBBnU5wmAT+E9b1/b+thLU5E
         Wezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EtOyhR+C1wJvZU8wiedXGMGVSqNvvqifEMJLMiQgAVc=;
        b=xuY14/z9LWXjsdv6+GodYVikykZTWMY6aK4W31xFngj5kfwVSsJB6udghoNmbAwq9A
         SalCyfLDBbOQuUFPPVdhU3/l0AYcNPBQseuxuNO/eKQy/7dyDlD/JrCUo7kwHbuKYp32
         b1s4yEYp5bWLA+qltgUFXCgbAZBc4vzHyrHiQ+lGP7ZJTKJoV1QajJvA5cVdTs7Xjc6d
         EPqmxwatO+rUoAL743IS7ZPbPYfSSjGNK+4dlofvN1lHW7EvtZeX4ruKUXziTasByVYJ
         H0xvL5oVlShEcb95pgyZzyqzmPLIvqhNrFUlMiKbrAhuF3JgGqdT52sBKjPOmuBEA4wH
         ClFA==
X-Gm-Message-State: AOAM531vXqqcLRAB52Hj2dj8ZUGmPRgHBwYpq60uZlvuURMLfiFBD0SP
        pWF+WN6mQW9uSq1bBAesV2I=
X-Google-Smtp-Source: ABdhPJwFLCUx6fgXehIugB4BT94Un9o4EbO9rkra0kPr/6ZY+CbsP9zrdLCdoVfQd7+OsnpW3h/Glw==
X-Received: by 2002:a2e:bf24:: with SMTP id c36mr13354979ljr.150.1638462330933;
        Thu, 02 Dec 2021 08:25:30 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 08:25:30 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 16/20] ARM: tegra_defconfig: Enable S/PDIF driver
Date:   Thu,  2 Dec 2021 19:23:37 +0300
Message-Id: <20211202162341.1791-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable Tegra20 S/PDIF driver. It's a part of HDMI audio subsystem on
Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 736a0d25900b..f8b40cfdfb3e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -239,6 +239,7 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
 CONFIG_SND_SOC_TEGRA20_I2S=y
+CONFIG_SND_SOC_TEGRA20_SPDIF=y
 CONFIG_SND_SOC_TEGRA30_I2S=y
 CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
-- 
2.33.1

