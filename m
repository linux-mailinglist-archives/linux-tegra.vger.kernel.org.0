Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440B345AF0
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 12:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfFNKwl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 06:52:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37232 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfFNKwl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 06:52:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so2034577wrr.4
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2019 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fJ8iYype7B/h1q9hN5d2vgk8jCoK9UoBXfSeUd7HvH4=;
        b=htJsh+XQPUWhn2798/V8NI0P2Z5GYPX+ZdbEUBgn5KQ4AZKAzkK3Y9QCDHcy726xP5
         M1tKrmil0d1S3NQdknQRd/6x1xiLmW5kHtfVxY+sxNiA7W84uJcK2olFKq6NjWWRMd5d
         zo7JzHEm2nHaxhQuOSAsTWk7am4N3uhGC2vEr4XiMQurb3eqhOLzc7V58aymWFwAlJ9Q
         cUCMahqPJEZnKoWjOwNMQ8KQv8IboSplFESqy/leewTJ8mXatmv6qjLTfF/hudpHxAGS
         ToG8822BsLyFED+5HCczqtPxDyKmayKFsVOlu6n0kB2glmQx1CAC7NB3bN6zH07tQwmu
         UuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fJ8iYype7B/h1q9hN5d2vgk8jCoK9UoBXfSeUd7HvH4=;
        b=gykTR0o0UoXTZWqREpqXd0BAJPHWQSO5RPlB3jBlaX50Y9eBuC11349C9WiAGOnLLO
         /MMgt3ikAUwW2bilqyJNJU4OAH3/ZXoDzxOPYMmMdRCSuGia8n5mxS7Cq+DxZrkVpU09
         gDIeDLk4aNidKDpcZgZsYvtdQz+Wdo7UP+wdPnCTbQKwvs398f6Jdq/9yuBwtHIPVRh8
         HZKeERXCTs8VXp+yXWVVUGY5ELAttKqh2k08Ora7YqhBqgfHP3bR0LG2fKHg2yV+qU6F
         Ad5jLjzbP3xRvdf1CgEn2tPHw1a2T7keJ248hRhI9/saTHBOhiqIbWQ/tXioSAl8yewi
         nn3Q==
X-Gm-Message-State: APjAAAUQOgxbhY9MCo9iro8Nbv5+y0315ZT4iZh/7+DXDNhJN+kG08W6
        kh6aFjHuIhQfgxibtNIacE4=
X-Google-Smtp-Source: APXvYqyleBtAc5KygrTAXepBW8zkWRwcS+c+jAyLPUkadCZocABObWs4tfqWMtRFP++0UFtFEpKHfQ==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr49377921wrv.126.1560509559173;
        Fri, 14 Jun 2019 03:52:39 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f21sm2299606wmb.2.2019.06.14.03.52.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 03:52:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64: tegra: Mark architected timer as always on
Date:   Fri, 14 Jun 2019 12:52:36 +0200
Message-Id: <20190614105237.20076-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The architected timer on Tegra186 and Tegra194 is in an always on power
partition and its reference clock will always run, so mark the timer as
always on.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 0f4eacaf5b77..3c811943e700 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1360,5 +1360,6 @@
 			     <GIC_PPI 10
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
+		always-on;
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index c77ca211fa8f..a2528312db5f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1053,5 +1053,6 @@
 			     <GIC_PPI 10
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
+		always-on;
 	};
 };
-- 
2.21.0

