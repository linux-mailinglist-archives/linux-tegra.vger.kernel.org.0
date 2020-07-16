Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FFF222524
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728830AbgGPOTI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgGPOTI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B049BC061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:07 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a21so6726323ejj.10
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IVb/tQt8T3kcHCfgUOKV9n1BifC/ykiJtFIf+ha0sfE=;
        b=r3qLR9zFckv9uFYt2O1hZEzV1If3drEbxTyQ5vLabBKNUfkTve/oRH+cPO5VY2fOZR
         G9spGZfX3US5wbUnHlhFzGB/g3Uud13gu5rgG0C3u+dpQeCiYIu+dKSr910yFBcweoWK
         r0CfPeT+Ot4Iz4iRb1rtaWsQZL6CAgIL01peI61sGH7/laPiwQi6AfN+ERgmThoJABIW
         HMc6mm67ml/Xr85Z9hsl649ET72xqW9vKRhLdcLw3azNv7nePPJyolEEiTS46t7hQBXi
         R/rr/lecLsoFq1wQGSsb8YCpY7Q0lkKA3bj+VjKK5y/8ISDGerUPVauVqITwKUwzaj9R
         tyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVb/tQt8T3kcHCfgUOKV9n1BifC/ykiJtFIf+ha0sfE=;
        b=JwYLxmLwtK9j6azNO9Af1PGL3tAd8we+/DMadKrHMEw9scvvsizfvl03SfiAAJ0bLl
         Ba0fZ35ht279CFc53ffQFwmE4v4ur/yXwlDx4rP5k1SJWeT4Fvk0ZkmA8Det3fY/zg6m
         fFay/W1MfsbVCLqrtS1WE0V18j2MzjC+ExEJ2+H7m0++824jIE94JE39gW1MCPzwfvs5
         THg05s1k5dq5ZDqvGtqRIk4SMXLZ01QnS4uW9mgtqmrJli/p5NO98Q8f5YG+sp9qF6GO
         aVlOucCnagArlB677251nMvBIUbE8541X5L5JtzBZld9nwc1rnXxarxPOPyuB/1bZjh3
         tCUg==
X-Gm-Message-State: AOAM532jnLtw6x5qGQXbHDqn/rUB945zKo0JcTeQaisiWxI0CCyZCvqy
        BNDYrTw6cQuf1+X8hAvqNyQ=
X-Google-Smtp-Source: ABdhPJxUyiAqkUenXLuonVkHeQ23uUbJmn66IFQQSynsiNoYp3H0I/yxF7kyjZK+3EmhqEgovwxLNw==
X-Received: by 2002:a17:907:42d0:: with SMTP id nz24mr4179878ejb.135.1594909146394;
        Thu, 16 Jul 2020 07:19:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id e8sm5153218eja.101.2020.07.16.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] dt-bindings: fuse: tegra: Add missing compatible strings
Date:   Thu, 16 Jul 2020 16:18:49 +0200
Message-Id: <20200716141856.544718-3-thierry.reding@gmail.com>
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

The Tegra FUSE device tree bindings haven't been updated in a while. Add
compatible strings for the SoC generations that were released since the
last update.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/fuse/nvidia,tegra20-fuse.txt         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 41372d441131..2aaf661c04ee 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -4,8 +4,9 @@ Required properties:
 - compatible : For Tegra20, must contain "nvidia,tegra20-efuse".  For Tegra30,
   must contain "nvidia,tegra30-efuse".  For Tegra114, must contain
   "nvidia,tegra114-efuse".  For Tegra124, must contain "nvidia,tegra124-efuse".
-  Otherwise, must contain "nvidia,<chip>-efuse", plus one of the above, where
-  <chip> is tegra132.
+  For Tegra132 must contain "nvidia,tegra132-efuse", "nvidia,tegra124-efuse".
+  For Tegra210 must contain "nvidia,tegra210-efuse". For Tegra186 must contain
+  "nvidia,tegra186-efuse". For Tegra194 must contain "nvidia,tegra194-efuse".
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
-- 
2.27.0

