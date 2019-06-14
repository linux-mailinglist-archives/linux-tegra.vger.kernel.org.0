Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB71346318
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 17:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfFNPlI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 11:41:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38586 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfFNPlI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 11:41:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so3030459wrs.5
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2019 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yxdohThGBUtdpRD6h9COxHEz21xgFRqKFvgk7EA2t0=;
        b=uat5c6+w97Xy/qimiLXz/6X441lBNWBaoGWglx/DPj5EPwSG50rLcMGd+23r9WdkGG
         radRvWpKQhq4wSh7k2LIT3yikS5mUAz4v13oALIielDN7XdJNXuDFBngxyMnnQVHFe4c
         AFGuuIvWD1+oMQZWoB97V7G6C36FH4ibRnG49SpPPqApmD9hIIZsbecgDq3V7Z+3eFNR
         CF7qLZt1YKa0JhO1aotRyOP7Oq9JU7o+3DvtIxMk51RYuU+j8IoOhLQoDH5epZt2fVfm
         Qf1q6mo44YG7kProGkQXH1UXxw5D9GEcWQja4qatfJ4sgm/k4d1gV/UfRurCYfSH1Nbc
         6w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yxdohThGBUtdpRD6h9COxHEz21xgFRqKFvgk7EA2t0=;
        b=Ls29I1s9CJUTn76byFGHnksS0pWpGXN9N7JwLdBagYXxWVeD1egJpZLNYjykhODats
         dYCJtCIGB22gNQ+t3FZMDLwF/g8OMgmctfVTxvmMaPFUcdz4+CoVasZd83SGT6zDcpnT
         68PVB2nPhilRh5k/Rv8AK/RSN/lY3p6IFe0fVYlMvB8CrmvIqIeyWuuSZrgmPirfDyT7
         G/OvGq739H6x7Mv374tYvuPdLw31UXdfgyn89TjPbCxtvqQioQVn1X2umBjYuI68HnvF
         jTplTLCQBugno2Wb/pw4dEx7uXr1gE61erGW8EwAtaAxhnm4xyEJsl5Mx+NTVR8h6AZc
         KeVw==
X-Gm-Message-State: APjAAAW54mfRdbIm/y+cposFL2narYOaGbtyUsdEzXG1AAEMJtjOzxRA
        YBEw/ZEqRLyEOPQw1Y4OvEk=
X-Google-Smtp-Source: APXvYqwJQ6uFu2GoaMjaznCDz667ETqJZISKySLNLYleCRUpeVAv+L3dk312J4zYxKyguTVw7iTWEg==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr3642231wrn.281.1560526866191;
        Fri, 14 Jun 2019 08:41:06 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f204sm4784275wme.18.2019.06.14.08.41.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 08:41:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Enable CPU sleep on Jetson Nano
Date:   Fri, 14 Jun 2019 17:41:04 +0200
Message-Id: <20190614154104.26115-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Jetson Nano implements CPU sleep via PSCI, much like any of the other
Tegra X1 platforms. Enable the sleep states to allow the CPU to go into
lower power states when idle.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index b36e8758936b..3e471c736124 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -582,6 +582,12 @@
 		cpu@3 {
 			enable-method = "psci";
 		};
+
+		idle-states {
+			cpu-sleep {
+				status = "okay";
+			};
+		};
 	};
 
 	gpio-keys {
-- 
2.21.0

