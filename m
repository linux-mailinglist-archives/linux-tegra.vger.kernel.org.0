Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AD82A8C82
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Nov 2020 03:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgKFCQL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Nov 2020 21:16:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12511 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgKFCQK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 21:16:10 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa4b1eb0003>; Thu, 05 Nov 2020 18:16:11 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 02:16:09 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 02:16:08 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-ide@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/4] dt-binding: ata: tegra: Add dt-binding documentation for Tegra186
Date:   Thu, 5 Nov 2020 18:16:06 -0800
Message-ID: <1604628968-1501-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604628968-1501-1-git-send-email-skomatineni@nvidia.com>
References: <1604628968-1501-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604628971; bh=jTCl6Qui3XoTGmW5zT6XFx017c0RVcq1UfUg5rPZ/6Y=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=jJPyXga4yjtzIteUeGjBqAg1iSwn4oZudVkByinHNF+1+zxs5/vpz3L3hS/HggWtu
         dfu9C3Rw/47sklgttiud1hze/9mcrbpT9lraEcAffhp47OR6EFRfQDl/99N2OgnUtX
         nfyyFogd37xKKLsKizf9pKZ6Ax2Bh3pnzGPXXAuY4BUs6EOjzg5KyMtkrc3rwusPQw
         Fv4ugjkL8belQq8qWNbttljDH5oX2aIA4xCRv2Kjku3iatNwwFk28HZ3+67WMyckLk
         HFoXLN90VV215IDzQpQkD9tSeNC/joKzPYHEt0zO5K1E8Qo5Q8w1l5UqP4NxZt6GLj
         ihJQZa6IMzs+A==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds dt-bindings documentation for Tegra186 AHCI
controller.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../devicetree/bindings/ata/nvidia,tegra-ahci.yaml | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml b/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml
index ac20f6e..db382a0 100644
--- a/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml
+++ b/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.yaml
@@ -16,6 +16,7 @@ properties:
       - nvidia,tegra124-ahci
       - nvidia,tegra132-ahci
       - nvidia,tegra210-ahci
+      - nvidia,tegra186-ahci
 
   reg:
     minItems: 2
@@ -41,14 +42,37 @@ properties:
       See ../clocks/clock-bindings.txt for details.
 
   reset-names:
+    minItems: 2
     maxItems: 3
 
   resets:
+    minItems: 2
     maxItems: 3
     description:
       Must contain an entry for each entry in reset-names.
       See ../reset/reset.txt for details.
 
+  iommus:
+    maxItems: 1
+    description:
+      A reference to the IOMMU. See ../iommu/iommu.txt for details.
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+  interconnects:
+    maxItems: 2
+    description:
+      Pairs of phandles and interconnect provider specififer to denote
+      the edge source and destination ports of the interconnect path.
+      See ../interconnect/interconnect.txt for details.
+
+  power-domains:
+    items:
+      - description: SAX power-domain
+
   phy-names:
     items:
       - const: sata-0
@@ -129,6 +153,29 @@ allOf:
         resets:
           minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-ahci
+    then:
+      properties:
+        reg:
+          minItems: 3
+        reset-names:
+          maxItems: 2
+          items:
+            - const: sata
+            - const: sata-cold
+        resets:
+          maxItems: 2
+      required:
+        - iommus
+        - interconnect-names
+        - interconnects
+        - power-domains
+
 additionalProperties: true
 
 examples:
-- 
2.7.4

