Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547D545AF1
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 12:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfFNKwn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 06:52:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36420 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727157AbfFNKwm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 06:52:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id u8so1859740wmm.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2019 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3yLWk+SWwzIpfiJXYiunMromOUag1bpKENH5vrxKS7g=;
        b=OXdtDyfgdwZJMsPPl1GhiBcqQQUrwlqagIFdRiIME/bSWJO4GSl0qJYXvXOCBVRobH
         1RME9w+S9EuYnGf195egZ2b8HfREGvUx5kvlIlxOIoB8sIf+G79GzMHY6+0ng+fU8zYa
         Sbztl+ymVYalJ1IETOFuO0G4438SJhH379i1jMreSH2Sl8Fg6DDxIw7lyIdGkLOFkwdj
         h2VTV5q4cGNXI6IFr8Z25V4W/dVmdl9QaOOADoGZr1DFoazphKvQ7FYWvZm5atFWXEnW
         Q4SHX0+Eq1jGErTt+/z/pMaYH9JUDHOMY3MNAyVPQgxz1I+sOUwS53uVGiba0nif46Mx
         Hqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3yLWk+SWwzIpfiJXYiunMromOUag1bpKENH5vrxKS7g=;
        b=mvmKBJS3VDDgKe60UrDMl1lR++iNeJvaPLxD7g2auEIiVzN8R6oQL/WBUH0oc0MnKi
         vF32Xv5+lNUl4jwSxicfdVtoLTxMN9snw+CjsUzjZZMI5mRJ+bSokJhenF5KsCzXaAns
         HyHPDmTIWI4q36bp8cZESt43KN6GHRq7qphwjiTVFng079xLRBuKPNlWN1dsodxOxNKN
         Wx+CM5eTt1CHNnMTxBSc3ZFhrDsqF1YvWwyOFkFwcZ23bRjps6uCoJoc5gE4Bp7BeIX6
         wHPvKFIez1crgQOZsn921GhiWdsTlrRc8cuNucOmXzWpZEc9YcsVGS+b1JHZKvdRd/SO
         ogMg==
X-Gm-Message-State: APjAAAVZixFuoRu+TK1ZhxjE7BfRUfjldK6cpzo9aV3GICki8mVz1i4K
        c3U4QUBnqq20+USIY6S98tM=
X-Google-Smtp-Source: APXvYqwImryDW885o+hnZ9ShltdSCoylOQxZC8iwvAZMVPPCDBO3MGZpLvgjWe7CpHuhheLkBiwRGQ==
X-Received: by 2002:a7b:c001:: with SMTP id c1mr7568357wmb.49.1560509560691;
        Fri, 14 Jun 2019 03:52:40 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v13sm1674642wmj.46.2019.06.14.03.52.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 03:52:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: tegra: Don't use architected timer for suspend on Tegra210
Date:   Fri, 14 Jun 2019 12:52:37 +0200
Message-Id: <20190614105237.20076-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614105237.20076-1-thierry.reding@gmail.com>
References: <20190614105237.20076-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Due to an integration issue the architected timer on Tegra210 does not
remain on during system suspend (a.k.a. SC7). Mark it accordingly so
that it isn't considered as a means to track suspend time.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 58ca520d5230..96027572ac12 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1435,6 +1435,7 @@
 			     <GIC_PPI 10
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-parent = <&gic>;
+		arm,no-tick-in-suspend;
 	};
 
 	soctherm: thermal-sensor@700e2000 {
-- 
2.21.0

