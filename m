Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B075F44190
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391391AbfFMQPX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:15:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46008 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731173AbfFMQPW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:15:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so21387232wre.12
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sbUAPpkNIGRS6FknLEXu825+CGuTz8cAa1CdUyT4O9E=;
        b=pc6wMOSJ51FKeXFmM1dZylzVnyfZQRg2DW4Jjbtc7jcUw/oA03es/24rMzpTjHOzhC
         P5h0P8KbA1lAllynH/ZzfmBcBt6cKuQUW7Xpwfhj8/RrjeM2O/UfU8dbo9gX8+G6Q261
         Vtq5jqC/712U30SZroyDtcw/HQCZq+r3heAYZ2utm6nrCH5wkJRcnB0cypt6lhJLIYfm
         1lYSi0XAF6O+E/YxKEmz/C5wgOJ7hO9KJrQyg3BBzADZp8E13i5HXVGhafBUOC3iH3N1
         KEu+hXHf/Y1LZfB5kIRxb9y4Eyq2ze0HnDulJG4B8w8TdXnDSybQisqhC63gMU6tnngK
         YNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sbUAPpkNIGRS6FknLEXu825+CGuTz8cAa1CdUyT4O9E=;
        b=GnSsMX3PcwIu+vQP5FylRuKzMGtSFmv7oZzo5o/D0kqfwgreV2W20wk6AY3LYvQczG
         XFSV/na85RDkVqJYe94PAj/GfPbIZJsNuNyPd8gaHYTcjrF8ooypoFiZ3zc9QdU7c19j
         qtBLEy3Bz/jJ2CBXeqpBt6Ouai1M8ia4SMeV6fgsufa2ageT0ysPuk2o046/UYVraFtq
         wyH7qgu4yuzCku5kfMwWojDiHrlVx7/bk0TpMoeg0XIocBSND4mpihPQg35hQFAoaHF6
         bZmZXJyCA8nk6SA49lIoZCIRzZzR41q3gCzGzGKSNwLLRZwCpFWcrRJeD7wyNc+diJwG
         tK6A==
X-Gm-Message-State: APjAAAXx6PylYaIdHkAkIBdkxLSs2xYkJD8lOI1OBAk6l1cu51KQ53Id
        tJrGv2194rYIfBe5+ePtaUA=
X-Google-Smtp-Source: APXvYqy4v8yfQVf4KPRoZ00PhO49PxQA7MIPBemBN7MVBXNAe/RB/lnrPTIVQB0ilL/iD/3YwcK1eg==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr12182824wrq.315.1560442520775;
        Thu, 13 Jun 2019 09:15:20 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y16sm158673wru.28.2019.06.13.09.15.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:15:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] arm64: tegra: Add ethernet alias on Jetson TX2
Date:   Thu, 13 Jun 2019 18:15:16 +0200
Message-Id: <20190613161517.2837-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613161517.2837-1-thierry.reding@gmail.com>
References: <20190613161517.2837-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Adding this alias for the Ethernet interface on Jetson TX2 allows the
bootloader to pass the MAC address to the Linux kernel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 38ad1053f21a..410738d4c7de 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -8,6 +8,7 @@
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
+		ethernet = "/ethernet@2490000";
 		sdhci0 = "/sdhci@3460000";
 		sdhci1 = "/sdhci@3400000";
 		serial0 = &uarta;
-- 
2.21.0

