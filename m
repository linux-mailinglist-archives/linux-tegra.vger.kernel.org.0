Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D0D1F7973
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgFLOT0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgFLOT0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:19:26 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468F6C08C5C1;
        Fri, 12 Jun 2020 07:19:26 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q11so9933379wrp.3;
        Fri, 12 Jun 2020 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XB/5UX8XkBfpRGJLb6ZH6aNELMnj1Z29c1J5WVrGjfE=;
        b=dlmIs6Rpi/XSIw57S7Zeb0sU2PtQ2OD5SEju15m1/TpS3WtoLO/f/px8562wDPlrhR
         YNOwV+F9kEwrp9mH88MJNXobFScknqq9YJCLN1736oGE03yrwIHAt6TvymUKjz3faISj
         keXoN0rF64WhADWamOLDWNjRA+vjRANHGHLPrs/lXaXGNMuogR3Dbztwawm3drd3gJ4S
         6zAA4uoZNjaItHsAkEX8aKma45cD3qc387ZqVBbLC7ul4UtasBC5c2AxS0DRZzzGEQEJ
         6v3eiVUrqgyiD/we7coyv099+zXDhTucnk0H8MHOVyKlhodAKe7PgrmsJKoSx6Bh2RtP
         NUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XB/5UX8XkBfpRGJLb6ZH6aNELMnj1Z29c1J5WVrGjfE=;
        b=qiB/jk8dD89cRSDLytxq1WRpcEPYdj4AuaP8fdOTZyxRPWQj+FSj1JWNFeAVAW54LG
         TA91Y5P1Cz6fPtZARI0H2jakDZjdJWVSgPbzRbe7iASDXI73MDfRv5LMOy7NTv7ttS+M
         V1YBCRIlrYgB5uyNT6qswHUbxgDwxR2DtKL+dVwZ249ieBcoW8r8hhF0P4Bx0emSFGoA
         wZc1nMW7GcY/2cb3gwdlBpnXiTdczsPcyw3o6TgPmRk8kwxrhHPl+n+B/kGSZ03pjSdu
         XtbaP1Jc+FzEYusSdFlMCtTo6SNhdsbw16u/0GV/POlWR+onEmwdRaahLquXSvWIm2WU
         Q9gw==
X-Gm-Message-State: AOAM532Zxl9KhXYlcERNfjcXM5lXnZMDmsaZtaTfUHr0P0audQkk5Wpk
        RBnbC6SnBLnuK1b3k+E0KC0=
X-Google-Smtp-Source: ABdhPJy2DPcbRoojvdC7okB4fw/arGON0CgBJZAF0kM8oEsVsevqmY8pBFKuCYYng3s5HZgy6cw57Q==
X-Received: by 2002:adf:e381:: with SMTP id e1mr14579263wrm.320.1591971565023;
        Fri, 12 Jun 2020 07:19:25 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 14sm7117809wmi.20.2020.06.12.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:33 +0200
Message-Id: <20200612141903.2391044-9-thierry.reding@gmail.com>
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
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3347e1b3c8f0..684fe25641f1 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -97,8 +97,17 @@ properties:
   iommus:
     $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
 
-  memory-controllers:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+  interconnects:
+    description: Description of the interconnect paths for the host1x
+      controller; see ../interconnect/interconnect.txt for details.
+    items:
+      - description: memory read client for host1x
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
 
 required:
   - compatible
@@ -489,6 +498,26 @@ allOf:
             iommus:
               $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+            #interconnects:
+            #  items:
+            #    - description: memory read client for window A
+            #    - description: memory read client for window B
+            #    - description: memory read client for window C
+            #    - description: memory read client for cursor
+            #    # disp only
+            #    - description: memory read client for window T
+            #    - description: memory read client for window D
+
+            #interconnect-names:
+            #  items:
+            #    - const: wina
+            #    - const: winb
+            #    - const: winc
+            #    - const: cursor
+            #    # disp only
+            #    - const: wint
+            #    - const: wind
+
             nvidia,head:
               description: The number of the display controller head. This is
                 used to setup the various types of output to receive video
@@ -634,8 +663,15 @@ allOf:
                     master interface of this display controller.
                   $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
-                memory-controllers:
-                  $ref: /schemas/types.yaml#/definitions/phandle-array
+                interconnects:
+                  description: Description of the interconnect paths for the
+                    display controller; see ../interconnect/interconnect.txt
+                    for details.
+
+                interconnect-names:
+                  items:
+                    - const: dma-mem # read-0
+                    - const: read-1
 
                 nvidia,outputs:
                   description: A list of phandles of outputs that this display
@@ -1027,8 +1063,12 @@ allOf:
             iommus:
               $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
-            memory-controllers:
-              $ref: /schemas/types.yaml#/definitions/phandle-array
+            interconnects: true
+
+            interconnect-names:
+              items:
+                - const: dma-mem # read
+                - const: write
 
           unevaluatedProperties: false
 
-- 
2.24.1

