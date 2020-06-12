Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF3441F79A4
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgFLOUR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgFLOUR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:20:17 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1800C08C5C1;
        Fri, 12 Jun 2020 07:20:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j10so9921225wrw.8;
        Fri, 12 Jun 2020 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HM1y80EgjS+gJBxEiW/Sfk7N7yAgRRBKzhBGITdG4pU=;
        b=t0FP/87f+QJ/cbcAAONCcM5HZq5BcEXciyHN0eEKXWYLEDr1ihzxxy6AZWzlJ7MQIt
         yZBISz6FY6MYH6t+naxa8Ikwud3YHq6vStCWrn7U619QR4u1JCNnPuSwe0kSgyiKDhV6
         BX3gd7XSdRCBUYOARaoBYz73wbuD6HxTxDHY+lq6CsxwywPdfjhDNWRGVDIkq9d8EG4v
         KGnINH1PSLnfYUxDKMVE4wxblJZ0NoZCHy9AfMTilmCr8QdxdMymFzWVHtplus+ow1Jj
         V/kzUzr7pZsk5M0CETpQCZ0XihhdKLTMbT/stC205RvKq55jgK/mk+9KhRaJUduLfSRK
         kLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HM1y80EgjS+gJBxEiW/Sfk7N7yAgRRBKzhBGITdG4pU=;
        b=oUdOFX1UtjlMwS/L9O2E5m6gVn8dJCWaDXWGvdXefzjJSF9LUbbXuFuTuIOGaVV4eM
         BZYNUkeszZSp3u+5syMZUVEX7bWNnTUJDOp1EXKecFrjI7wdkCpNxlHPtR3SNmgiXQM/
         NkeQWUDPDVtG3EEUNyOsNGtl2ADN797/sIN2sleRmiTOushItjLQC71C6Hq/VLYHCel2
         X7Nbsf+yzL0o9ZPTsVop9NOv97FSSXK5q3SGXBrsEslP5d8S/MdXaVVjvGfhCB/gcafj
         3AhwFJ2jX1IjLhSj0NIiz/UbUPVy9VMhVPpLxuAeMAdSgaMe+xhR4Su/OeXgCa//lTX9
         Ghjg==
X-Gm-Message-State: AOAM533UzMwLO0U05zugjGOWE0Vfp1xEFOa6k0mZ7U6UZ6YSxRfonjlH
        LWc9nvSIxShMnM4Vdly9+O0=
X-Google-Smtp-Source: ABdhPJzXZrCDoH+RL+Wf5648wCXT2MlWBXk8juOp/TwqFvTVcYtVV3dRYy94bUXcEdgd02XN7tUYfQ==
X-Received: by 2002:a5d:5744:: with SMTP id q4mr14791770wrw.137.1591971615533;
        Fri, 12 Jun 2020 07:20:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p16sm11060136wru.27.2020.06.12.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 33/38] dt-bindings: memory-controller: Document Tegra132 EMC
Date:   Fri, 12 Jun 2020 16:18:58 +0200
Message-Id: <20200612141903.2391044-34-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the compatible string for the Tegra132 variant of the external
memory controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 278549f9e051..122134f0a08b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-emc
+    enum:
+      - nvidia,tegra124-emc
+      - nvidia,tegra132-emc
 
   reg:
     maxItems: 1
-- 
2.24.1

