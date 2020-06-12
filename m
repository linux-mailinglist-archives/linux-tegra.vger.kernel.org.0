Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE831F7987
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgFLOTt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgFLOTs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:19:48 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963B5C03E96F;
        Fri, 12 Jun 2020 07:19:47 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u13so8335347wml.1;
        Fri, 12 Jun 2020 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RfkhIhl97XcddvziC2LtoDgXs4ptzaL7JWavUzqdrCQ=;
        b=HpF0H667qvb92yyE1Avd8IDMTix9Vdys9xfrdHp4ARrIBjn9RaXBh1gqeNAKscs1HX
         yB9oXcQ4Smk4g0g8+sjX4/1tKsgQ5GMq1aLhaQZuweBraVwmtlohNpKy9vbSDUOyHBKR
         OMTqIMtIRAS6IZdYOyBFx9QTauwpzfUWmz3+FJfQW+rKgu6C5/fuCkfL8mYYxIsqQyyF
         tsw6lfYOtyIAVI/NaZTD+Adm6H8DFZugVUMw2KibLH9rK6VQa9HlJLJ4zzzmgFBJKbHQ
         NnhzZY5go4cC0VuE/i9r6n5RjNmja5LOTsBL0REpWBTH8HMSGbMLW25ZDXWJm1gQHZ/W
         AcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RfkhIhl97XcddvziC2LtoDgXs4ptzaL7JWavUzqdrCQ=;
        b=YVEJsHnPDFdIJqcj1gGVIFiqEDk1hfkplKEHfPZRH3cRaFQc2Xpc5rFMl1e7icXJTW
         ziDMGVb0/EL47U4KaYSUJcr1OBsPTT3ck8qtflEIayJ0sHYLeC2jJc5R0WyoEEUWcaWt
         zqWlIqm79lBgCPQv2LI1fzsASt4QUTVEgC+jNNF5jh59VJBRtMTAArWnqmJYJEQNFIG3
         38ZScmbQlcVjLxL0phadjYDV5xFfSO/a8cJ60seoN0s9H3T47sjAP49lcna1Nej9tkHK
         woByhdlJdX6CezjDVpKl8H5tKdZfZsjhqVba6qzy6oyByED4eOXsj7jXEF958inDaqUA
         ORVQ==
X-Gm-Message-State: AOAM530VKPtgCV02D2PXTD1x18MDRH2g2dIyidD0LjsfPrHiS+UGo6QI
        nqjbFJUhwbkC/17K+knD6DA=
X-Google-Smtp-Source: ABdhPJzDfhJckTXpC1JG1MlgchzEm+VYwiNpjakwVdyrCAmBdhhe1rlCR/6xi5TS7EbRnuL2X4TZqg==
X-Received: by 2002:a1c:ab07:: with SMTP id u7mr13663217wme.130.1591971585447;
        Fri, 12 Jun 2020 07:19:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f11sm9794625wrm.13.2020.06.12.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:44 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 18/38] dt-bindings: usb: tegra-xusb: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:43 +0200
Message-Id: <20200612141903.2391044-19-thierry.reding@gmail.com>
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

Add optional interconnects and interconnect-names properties to allow
describing the interconnect paths to and from the XUSB controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
index 4d9e4cfc459a..cb1d9a6f5acc 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
@@ -82,6 +82,17 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: Description of the interconnect paths for the XHCI
+      controller; see ../interconnect/interconnect.txt for details.
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
+      - const: write
+
   phys:
     description: Must contain an entry for each entry in phy-names. See
       ../phy/phy-bindings.txt for details.
-- 
2.24.1

