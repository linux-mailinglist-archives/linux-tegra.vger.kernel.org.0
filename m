Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 682E625ED7
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 09:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfEVHyV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 03:54:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40747 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbfEVHyV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 03:54:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id 15so1080746wmg.5
        for <linux-tegra@vger.kernel.org>; Wed, 22 May 2019 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4WPY1pCq/gZsAJfDydzMzbo4NxqfWF9Bl9qyWsRIlQY=;
        b=B3DzFfL58lWC94rQpb85C/LIGv9//shmcxy6SQ88sjqgl3QuBNVaIzBiFtwoNjjFkj
         pMIRqA3d4znMvLuPgbJjdCRf9yHWhxH7vyyaO3AVxEbjvIVrXcC5KNmx/RLPD1aAihjT
         gNNsBkoFMnbCQT71ZkUghYl93yec/yePNEIrT64QS6MKOqTSEUKhKW2jZCQvGi+AzDhZ
         WkUMIZXqvZs5d+E5kpdBHSKQjr0zLsM8CU680pIw7HcBmvCl8rrclcsg886dTwU6pSZY
         5fjdNuY6oEyfFGRcsKPsNEeFGxjXUH8f7VccXAFOc8HahWCAeT6C2kS5hYuFDhTQfvtt
         86fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4WPY1pCq/gZsAJfDydzMzbo4NxqfWF9Bl9qyWsRIlQY=;
        b=TNdPklEhNRN6bELISSorjRk5nSLuR/JFxtRCQeH2lnHQqZLk8023zOO7CeHKEYLcS7
         VUU+UxQyBNp2vrF8JUoPu2rH693+dC7Kq11Kv5tmF/5WvQM/LKGSmsCZoZKuTZM9JElF
         1FUuByGkOfDcArhCo2bPSNPxQrzJ7WEBaJ9DJa1npbPR8oAN5YgvJGAEiIpjr99wqcJe
         Bq/K5hswk76NwbAFzpN9AljWSDgmIUS/jTNiLree3uM1iis0UGSdq+5xlvbPIA0uxozm
         DY7jSrTLsIUG+fd+7zp9DlDat0Ey4AyWX4VlIvu4sXAP2z6t+LE9UVgjn9LekTQrr/Jg
         h7EQ==
X-Gm-Message-State: APjAAAUvG7+gMmWTMUTVz0oi/rvgpcTG+3zcmo6BEABRqo0Qo8Ii3QpH
        3mzaFb7cAnMEp1pUduRt7Zw=
X-Google-Smtp-Source: APXvYqz4OXS48gXMNidaY0H33v5uAMzUWxPI6ByY4h5808ZyAxqt2BDh8JcVZ7iS33i3mu9j9U4/hw==
X-Received: by 2002:a7b:cb57:: with SMTP id v23mr5632339wmj.60.1558511658803;
        Wed, 22 May 2019 00:54:18 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id c12sm4489525wmb.1.2019.05.22.00.54.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 00:54:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Anuj Gangwar <anujg@nvidia.com>,
        Bibek Basu <bbasu@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Make DT model property consistent
Date:   Wed, 22 May 2019 09:54:12 +0200
Message-Id: <20190522075412.30839-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522075412.30839-1-thierry.reding@gmail.com>
References: <20190522075412.30839-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Jetson Nano, Jetson TX1 and Jetson TX2 all are named "Developer Kit" and
Jetson AGX Xavier is the odd one out. It's officially also called the
"Developer Kit", not "Development Kit", so make it consistent with the
rest.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 73801b48d1d8..6e6df650a4b0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -7,7 +7,7 @@
 #include "tegra194-p2888.dtsi"
 
 / {
-	model = "NVIDIA Jetson AGX Xavier Development Kit";
+	model = "NVIDIA Jetson AGX Xavier Developer Kit";
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
 	cbb {
-- 
2.21.0

