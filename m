Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FE1222523
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgGPOTG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24775C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:05 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dg28so4885475edb.3
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6UNkTg1A1hA67A2+DY1UrrDswklbDeFpsW/LlXjD8Go=;
        b=AXo05mJQi0tcV1qgbTdQ85hiYwvE1fkzoEPdnvTZspgjUFnSmQJQuR2SQxde87kVZx
         lSz8nu0E1XDY88maWRKA1qrLg95eAL72uhnf1bYXJk/yGBvMboklv0VNNAtu3dJKIgEg
         oMxv3DrI3bn9gTXL9jeeuJkavC3BNvyvYni66nRmacQAq6DgpS/XgItAIHmA68W9f3U7
         LkpZshub84yqhxV80MCDhj7s8Iu6LPKs3Iyq3wpuTDheQDGYA6PG1YGAF1evs3oEI0in
         5YzXevUKBgiqYVmfAkWUQxT/khokoJZCVdr/dFGSq5SelEf+j6rPk6aC0fe9712XlpiZ
         P0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6UNkTg1A1hA67A2+DY1UrrDswklbDeFpsW/LlXjD8Go=;
        b=hB0dSmWP3/sXuS9GGK9FLWkGeic6qTavp9UQnSlJibZfgkh/RWUMuVGqPrgEHH7GPm
         YlMGHmuYXjUzeKs9VD4uvwn4E8UjeK+4HYKOxWuQXnLO9dLGMJ3AcoQxAM9Qz+yRAc6i
         R5pgqy7zvH9bKArWXzMkrC8vqMaF3GTwE2gdTQPjNH9trU9CFv9LdP0co5GfdidOjsja
         aINF34QHSYeJKqa74ZL7LaIaQH4JqDwVeb6juC4gy4K94fIFtBquGaGjlTAnS6nlr0A/
         gz1sa7kgIr2ZYAhVpuHQqnv2JxLRRRAMDZo7fFMiCn64Nd0PADSn37RCDSAcqcW83aYz
         HLCA==
X-Gm-Message-State: AOAM531KzEt6LveM7C4fbK9LXzlv7676bNDHMosq2lurOjLrbbwOdGiV
        7qxcP2dcqNNdLtzGdUN4LKdROZxh
X-Google-Smtp-Source: ABdhPJyOPpPoDEBJTHEmv5RXExgTtOMOc0/0dRSMDVrSU1Z5eG1kIHvPfWpqMQdUG463Y5eqXWqInw==
X-Received: by 2002:aa7:db4b:: with SMTP id n11mr4813675edt.137.1594909143883;
        Thu, 16 Jul 2020 07:19:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bw7sm5300925ejb.5.2020.07.16.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/9] dt-bindings: tegra: Add Tegra234 VDK compatible
Date:   Thu, 16 Jul 2020 16:18:48 +0200
Message-Id: <20200716141856.544718-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716141856.544718-1-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra234 VDK is a simulation platform for the Orin SoC. It
supports a subset of the peripherals that will be available in the final
chip and serves as a bootstrapping platform.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 53845db64df1..5c781e6d8878 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -109,3 +109,7 @@ properties:
         items:
           - const: nvidia,p3509-0000+p3668-0000
           - const: nvidia,tegra194
+      - items:
+          - enum:
+              - nvidia,tegra234-vdk
+          - const: nvidia,tegra234
-- 
2.27.0

