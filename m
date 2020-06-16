Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BFA1FB2BC
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNyf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNye (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D08CC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q11so20892989wrp.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DsMEBu9NP9UUnrvFSozUxYI5IG1Tzs7z2nhgLx138Kw=;
        b=TYuAs+ichorplRDnKFjy5+wdST2QdxG2MQEjOGuG6N3D9tsnOS8hd30/seCLwr3BRf
         rMxswnZF3pLQ/MOdF7pje08j/pVVRLQvYZ2n6jXzrc9jVYIKmQB7x/4bqoMc20TGe0Gs
         pvrd4hDDRvO/TkoIXgDP0vlbCItqRasuWjsjM6YQYu+FM2delgXP/E+8GFHBMkxELA3/
         qqn5pZe5dh0xWrKcTnxB6w72gAorxmEfMNO/nvNmLEQynJyOeyGyGXzkyjnBpZSGvBfa
         mufKqccFblqKKEzZjof++zISk52EE6XsdOYqM7pxJ/JUZ+qpxTojY0u/WQmE+oqI0u1x
         ASqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DsMEBu9NP9UUnrvFSozUxYI5IG1Tzs7z2nhgLx138Kw=;
        b=ajY1ksk/C2SDWp54ivXf1HFhQ3z7wT+whc6NcOjCk6TeOBKrzCHJ0QInIgTrpPukLX
         n3vGYDEzcLXa/FCD4IoIh3IWmxq2GYRMuPoQMANfyRgJrs1Fq9iAY0X0+ozooh4h76Si
         TwgEWCdYN3yNi5Q56wh3u21FOQ2bP5yo7xFxSxSpEt7LRoEfvd5bcKlVbKc34Yk5n20A
         WAAMvJnVY35KiU+HfN5di8a8ckfTXlCzuqNVAs59fzxWhvBa6addYBiM3xvb4FEq2R2N
         IPkhGE3i/CCwplEJ23anJrnXB2fAUCeaQRKYtNJe7hFTLMLZDhAv0eYsKXXmZtPT5Bo+
         kPwQ==
X-Gm-Message-State: AOAM5330ozrt0q7cjUrigatX2rtM6FMtPPnp5f2TaM8rh+TFc5COu+X/
        vyi38NX9WEf1teQK4XTxPoA=
X-Google-Smtp-Source: ABdhPJznnUL6IMuByTTUPBiG8/VVwZkC1xDekBIRj48caOYej4Bxigd09Z+B3ADwTKz4kl/FQwlSqA==
X-Received: by 2002:adf:f205:: with SMTP id p5mr3442281wro.302.1592315673042;
        Tue, 16 Jun 2020 06:54:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w17sm30543978wra.71.2020.06.16.06.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 43/73] arm64: tegra: Add interrupt for Tegra194 memory controller
Date:   Tue, 16 Jun 2020 15:52:08 +0200
Message-Id: <20200616135238.3001888-44-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This interrupt can be used for the operating system to be interrupted
when certain events occur.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a50504a317d7..73aba724bf67 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -179,6 +179,7 @@ mc: memory-controller@2c00000 {
 			reg = <0x02c00000 0x100000>,
 			      <0x02b80000 0x040000>,
 			      <0x01700000 0x100000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 			#interconnect-cells = <1>;
 			status = "disabled";
 
-- 
2.24.1

