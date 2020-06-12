Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3B71F7983
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgFLOTn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgFLOTn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:19:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB98C03E96F;
        Fri, 12 Jun 2020 07:19:42 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l26so8320784wme.3;
        Fri, 12 Jun 2020 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5vwnMRYWCaa4Q8Et9dtd1iT2oj0ULaiPRA+qg7zDk8=;
        b=klbD5SW9D+f2plDIewLV5ulzbseq0URQXpTHh1/uxakHVyN5do0GM6r4hnIT4kSO3R
         gP8GS65+02TJ5bNChb4nK/rcN/iVD/1LIQ+KO+3SC4IslO9CYwtmLvU4TlREbdIBJqja
         bHSyIELXZ81q3fhsUMEfcUnO9g1eodA0WKbH8birOlE3FNO3nYyhk5xy0cfcYq9AyqXb
         DRIg1S6gpf2kKpN3oxvDrNItwZTMjftmb0FXMtnpGMHq608B8O451MIV+ZbV6rRurFCx
         0flsA3K3xmkNv1KxK6lWw/okhHgqGg2cHoWIfQWBmvKk+bJX7zadup72xLqTCQk1pWnZ
         3iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5vwnMRYWCaa4Q8Et9dtd1iT2oj0ULaiPRA+qg7zDk8=;
        b=jbC+FpJwJeKWR5W1JPCp4znKpd1Ks6vEVP2q8jP87V6+PkRNLOu630WNsFvRRZioHT
         u+WCNjEuadKeCEgyNqiFf4fFw3Kac6elK55mHel4xmawsgy9E82wSOAY6OSTIxDwS63X
         vJ+bwluEHJ5MN6Fl1vLLAXwuU1Zi4zKk4NLNsaMWIeXE5n94OVwwg2mgDs5DwX1jJlNB
         FBc2FhfFABs22du6O4Xl+wbsZUq7J1NhPwI1tlYN5selQ/lz9d50LG5RE63IzGyUGpKB
         26q9XrgYrttv/vN68oDqzjLfaYjeLieihAVLZJxisglXPtXpPgASnet9mO/5WVmhHGwt
         M3pg==
X-Gm-Message-State: AOAM5325zz2Cd2gufPYpOCZtAE6QffbEEBGy2M596XUlcFMqy+TR7zwx
        l/IaENUKWkBF7kQ8EWVpcUM=
X-Google-Smtp-Source: ABdhPJyTGUc+6zTu2jBUQuYlrEREyhZcvxuo/H8LDHx9gEfBVXFudMrwW7Es09EXGo8mkEUJpZNBcQ==
X-Received: by 2002:a05:600c:2944:: with SMTP id n4mr14302180wmd.135.1591971581636;
        Fri, 12 Jun 2020 07:19:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m129sm10042512wmf.2.2020.06.12.07.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 16/38] dt-bindings: sound: tegra: hda: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:41 +0200
Message-Id: <20200612141903.2391044-17-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index ea8e39934945..15043c896c54 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -90,6 +90,19 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: Description of the interconnect paths for the HDA controller;
+      see ../interconnect/interconnect.txt for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: dma-mem # read
+      - const: write
+
   nvidia,model:
     description: The user-visible name of this sound complex. Since the
       property is optional, legacy boards can use default name provided in HDA
-- 
2.24.1

