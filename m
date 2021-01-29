Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE71D308C83
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Jan 2021 19:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhA2S3v (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Jan 2021 13:29:51 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17122 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbhA2S2y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 13:28:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B601453bd0000>; Fri, 29 Jan 2021 10:28:13 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:13 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:09 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <broonie@kernel.org>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>
CC:     <kuninori.morimoto.gx@renesas.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <sharadg@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Bard Liao <bardliao@realtek.com>
Subject: [PATCH v2 5/9] arm64: defconfig: Enable RT5659
Date:   Fri, 29 Jan 2021 23:57:42 +0530
Message-ID: <1611944866-29373-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611944893; bh=rIqGC+2LJccA5Gf4qPtR3LQ7pbE2iJ1JvFV+aTtOY5I=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=X8C9y7QKmoQudGZPl+LtkpoI4df6JLK/pK03S4mxoAAd0gyDUw3QdksjbKiCL2jGQ
         k9/WORbQG1yaYDeAIgi/tgRhQFtc2wtu+9z49YVL8S3HkL5pUimGKJ+R2OVewgaa29
         zgw58QKjW89xk2RjQcjkUgrGAC1RY1+CqHSqT3GiCgHyOGlvUGitKJgAZHf9b5jcac
         d28CUecUxhLkn5Ovf24q+TNMs5sZB4gywXF3QKCJJh9V9DESk9LjmglfGL/0NlhD2g
         wKEa39YltTmwxAUzCYTId7C/LzvBW+c3OFlZLsdVxtG0iM67MFKm5LO0Jy3exKvvhF
         lFDIIKvnnjMUA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the RT5659 audio codec driver.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ec377f7..ea279e8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -754,6 +754,7 @@ CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
 CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_RT5659=m
 CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
 CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SOC_WCD934X=m
-- 
2.7.4

