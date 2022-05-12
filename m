Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921F152553C
	for <lists+linux-tegra@lfdr.de>; Thu, 12 May 2022 21:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357826AbiELTBH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 May 2022 15:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357844AbiELTBF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 May 2022 15:01:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215E42CC89;
        Thu, 12 May 2022 12:01:03 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu29so10812806lfb.0;
        Thu, 12 May 2022 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zObGKOaJqI+lQlWn/A2V2vyoJI6RyKFT4z4IHmuyIik=;
        b=feex53gwAWPfxdOhgRR95JhgIvWQTMfp6AMZf8ZC6V1/1zgbKvx7ZkfTb3JUtn2/1m
         zvNvIyypfMSuOyQChmxyWeKn1DLIfWBVxOH5N1AKTujmIaajZk4WSlSl3dsu36T/spl7
         QS4AunHAdGvq2kw987GUMoOjaoIfQ2ocFZnbnhMa1EEXwHovABQPJQp1v7I+ziKyI23f
         bvTHJVqTpOANZLMsCwMuCiOtAZHjv5fl/3L89dNAVzzfcg+uQjEAMecKAeRpbHGTpdvy
         h4rnchINjMIjTD6XBX1FYl3LchHo6dEqYcs4uNXLWxtWwbijJE49lvidgTWqqjZbOdPd
         bQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zObGKOaJqI+lQlWn/A2V2vyoJI6RyKFT4z4IHmuyIik=;
        b=lYldVRopICc9eBrYmjtWYukWQAieg0kfu8gKKqpfTIYLWy68x0nDcQE5gM6jAZkbOz
         V3VXj5mtBddABTVrXKoF96wB+4hUa+MTrVy+fmlX+G6N9KiXvlftVfyBe9EC+yANfFzH
         4xXBYh2fFB/L5RZbQy0kmpMn831VqP9gwXypALXrtnze4R4J/xtxAm/jkt8jkWTtbt7r
         Wj/hI7RcpiGnc/U4RiJljzNl5bfJkfKCf9Pdx3/rFJbZqJ/eCj59NTMxjjKjJd267IgK
         ApHb6KqmPEVTgINjWaR9A5ZDU5ne7Tjs01JjOo6e5RKzvdOWB9TQECgluRHORD7JizYA
         Ai+g==
X-Gm-Message-State: AOAM533bVuoQ0F8N5nHgkblzYPqlvhVGMa++p6ZVJbpcpHVNfXZCNwnM
        2pvMCgPuwn2aK5jbl5ZdBg0=
X-Google-Smtp-Source: ABdhPJyTmd5nsLTmRqk/CLqOwQdO0d9t4A6MVZuzTPU6DSpoKmI0wKtbuxTMdPvFwRHBLXtKLktysQ==
X-Received: by 2002:ac2:4e86:0:b0:474:879:97e9 with SMTP id o6-20020ac24e86000000b00474087997e9mr833553lfr.558.1652382061258;
        Thu, 12 May 2022 12:01:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n27-20020a05651203fb00b0047255d2115bsm55030lfq.138.2022.05.12.12.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:01:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 1/5] dt-bindings: reserved-memory: Document iommu-addresses
Date:   Thu, 12 May 2022 21:00:48 +0200
Message-Id: <20220512190052.1152377-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512190052.1152377-1-thierry.reding@gmail.com>
References: <20220512190052.1152377-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This adds the "iommu-addresses" property to reserved-memory nodes, which
allow describing the interaction of memory regions with IOMMUs. Two use-
cases are supported:

  1. Static mappings can be described by pairing the "iommu-addresses"
     property with a "reg" property. This is mostly useful for adopting
     firmware-allocated buffers via identity mappings. One common use-
     case where this is required is if early firmware or bootloaders
     have set up a bootsplash framebuffer that a display controller is
     actively scanning out from during the operating system boot
     process.

  2. If an "iommu-addresses" property exists without a "reg" property,
     the reserved-memory node describes an IOVA reservation. Such memory
     regions are excluded from the IOVA space available to operating
     system drivers and can be used for regions that must not be used to
     map arbitrary buffers.

Each mapping or reservation is tied to a specific device via a phandle
to the device's device tree node. This allows a reserved-memory region
to be reused across multiple devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../reserved-memory/reserved-memory.txt       |  1 -
 .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
 include/dt-bindings/reserved-memory.h         |  8 +++
 3 files changed, 70 insertions(+), 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
 create mode 100644 include/dt-bindings/reserved-memory.h

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
deleted file mode 100644
index 1810701a8509..000000000000
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has been moved to reserved-memory.yaml.
diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 7a0744052ff6..3a769aa66e1c 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -52,6 +52,30 @@ properties:
       Address and Length pairs. Specifies regions of memory that are
       acceptable to allocate from.
 
+  iommu-addresses:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: >
+      A list of phandle and specifier pairs that describe static IO virtual
+      address space mappings and carveouts associated with a given reserved
+      memory region. The phandle in the first cell refers to the device for
+      which the mapping or carveout is to be created.
+
+      The specifier consists of an address/size pair and denotes the IO
+      virtual address range of the region for the given device. The exact
+      format depends on the values of the "#address-cells" and "#size-cells"
+      properties of the device referenced via the phandle.
+
+      When used in combination with a "reg" property, an IOVA mapping is to
+      be established for this memory region. One example where this can be
+      useful is to create an identity mapping for physical memory that the
+      firmware has configured some hardware to access (such as a bootsplash
+      framebuffer).
+
+      If no "reg" property is specified, the "iommu-addresses" property
+      defines carveout regions in the IOVA space for the given device. This
+      can be useful if a certain memory region should not be mapped through
+      the IOMMU.
+
   no-map:
     type: boolean
     description: >
@@ -97,4 +121,42 @@ oneOf:
 
 additionalProperties: true
 
+examples:
+  - |
+    reserved-memory {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      ranges;
+
+      adsp: reservation-adsp {
+        /*
+         * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
+         * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
+         * the ADSP for I/O memory and private memory allocations.
+         */
+        iommu-addresses = <0x0 0x00000000 0x00 0x40000000>,
+                          <0x0 0x60000000 0xff 0xa0000000>;
+      };
+
+      fb: framebuffer@90000000 {
+        reg = <0x0 0x90000000 0x0 0x00800000>;
+        iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
+      };
+    };
+
+    bus@0 {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      adsp@2990000 {
+        reg = <0x0 0x2990000 0x0 0x2000>;
+        memory-region = <&adsp>;
+      };
+
+      display@15200000 {
+        reg = <0x0 0x15200000 0x0 0x10000>;
+        memory-region = <&fb>;
+      };
+    };
+
 ...
diff --git a/include/dt-bindings/reserved-memory.h b/include/dt-bindings/reserved-memory.h
new file mode 100644
index 000000000000..174ca3448342
--- /dev/null
+++ b/include/dt-bindings/reserved-memory.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+
+#ifndef _DT_BINDINGS_RESERVED_MEMORY_H
+#define _DT_BINDINGS_RESERVED_MEMORY_H
+
+#define MEMORY_REGION_IDENTITY_MAPPING 0x1
+
+#endif
-- 
2.36.1

