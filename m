Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B6C7634F
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jul 2019 12:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGZKQY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jul 2019 06:16:24 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38906 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfGZKQY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jul 2019 06:16:24 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so18012822edo.5
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jul 2019 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9U7aLUhu7q2hmNB7NVIfHk7D5uXAalLJc3qmTryceV8=;
        b=gIs5aCEnJ4GoDCIMhtaTUnCC/xnMvZ8k74UMMMJkBkrLwAbXOcuWzYU1kl98ylot6T
         GA+f3QsvW4tYgmIjYj1JmB2tKewFZVa4JPsW7WxU8m847kKQWB1Fwbi6hyK8GleKRrjA
         t1kdW0Rmg4owuKUZ8K3OqiwnnBp3RHcQy7tBkJyCQgxFscnwuuiEjHdtZXMKOB5YU3Qd
         u3qTvNrVyy/ukLv4UdGA7DT1Ymf+ke4/AlrZMdnXj2FY2r7rpYDwgrDxY2I8g4ntmEmO
         wNB29KkvsT0lGw5368G3SyLyb1no920bNe8Jfn9QIv7PyBxCcc4HKajs7m5jJheHLHgU
         cyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9U7aLUhu7q2hmNB7NVIfHk7D5uXAalLJc3qmTryceV8=;
        b=AjnqmQSBTOhv7iyDtUiWyQ+GN18PtlGv5/e9SkUWTPM2kDPrnXHk8oTeHLdtD+xDLd
         g8vbnFiEznxyqZHCBYPw0sjPs1noBwgW6H26+MDlVy7vcbFdMkYhpppqt6sMMS6zV4T5
         Jabyg2uatvZN3nEljoLO+n5m//64VPz8ugG8TBHjm247sJHArvbLGrg4TvwhLql2MRbs
         If9Pmzwtu7J9yobWzump/aqVWXc6cN+O8i8fB/jrSb2Fcw0VPBInKHv0yk2cDoDw+wpn
         DY3Qeka6UkTcstn6fAd8zwgWowSsUSt0V7r/D6rVuhI8R8ELFrX3m9eY73FPe0Yly0tf
         5Z7w==
X-Gm-Message-State: APjAAAXon7tHA4hskrv9K/3MpADk0S9cAZnMni5ioVPcYY/tOGqzZy/J
        /knzw+kBDUiuuL6EjSsNeWQ=
X-Google-Smtp-Source: APXvYqwhfafbmXg6ETfXwcYL7EgWTTS6t2R6//XcGuILgEg3WeDOP3AQeYyYn8RDYH1okzbrETgg2A==
X-Received: by 2002:a50:a48a:: with SMTP id w10mr83076541edb.1.1564136182662;
        Fri, 26 Jul 2019 03:16:22 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id s47sm14138905edd.40.2019.07.26.03.16.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:16:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: tegra: Fix base address for SOR1 on Tegra194
Date:   Fri, 26 Jul 2019 12:16:18 +0200
Message-Id: <20190726101618.26896-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726101618.26896-1-thierry.reding@gmail.com>
References: <20190726101618.26896-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SOR1 hardware block's registers start at physical address 0x15b40000
as correctly specified by the unit-address, but the reg property lists a
wrong value, likely because it was copy-and-pasted from SOR0 but not
correctly updated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 923415fd72a4..ca5ffbc79e2f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1045,7 +1045,7 @@
 
 			sor1: sor@15b40000 {
 				compatible = "nvidia,tegra194-sor";
-				reg = <0x155c0000 0x40000>;
+				reg = <0x15b40000 0x40000>;
 				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA194_CLK_SOR1_REF>,
 					 <&bpmp TEGRA194_CLK_SOR1_OUT>,
-- 
2.22.0

