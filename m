Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3941F79A5
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Jun 2020 16:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgFLOUR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Jun 2020 10:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgFLOUQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Jun 2020 10:20:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7587BC03E96F;
        Fri, 12 Jun 2020 07:20:15 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id q25so8497363wmj.0;
        Fri, 12 Jun 2020 07:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=teVzXRx2LezWUw578ijoFJihirxJEfTILBStxZHat5A=;
        b=GPNM5e0yPXm9ylniLyfosX3cGqOmEsTp1U2dVGsOVpfOZG4cKi7Pzq5BfURU9DNOmA
         UW/cnLSAOAV0g3KTmPuYfUNfdsbiUmwGQGG0AcR7tTm0nYbk2p9ulJIKuG0EkYgD6aHC
         ARTtZh3syp32RUWGkcH0FAuWrWZ9ONAlpcYgohn8mzWYAx8RDJJY1teXuZ92ASwDA7hK
         0x5q85sxVZpgPfi3KNQ/pArcVZPRfUYMrR5bcB323C+BzOyRrxNLBsyujVzIJP9EhBEw
         3DpZrMqqaYR+ui+KYagn2tiDP/jJbB6ceIiBclDvifT4U+SH8qMDA2afsr1ia4TRrAov
         VPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=teVzXRx2LezWUw578ijoFJihirxJEfTILBStxZHat5A=;
        b=FnhLxAqhSycKZfRceY5VCUGtXuqkgXNQsiXzd5j/bSzAbu/vQGc+EmSjdWbLkEztvj
         UGXqVNExX2vBVZ/8ZbQFQ0UUgLfBPzJ0xHI339aZVt+hecI8/FTBsfdf1Q+1DkZj9sLN
         Ldi9EDsoEc0AKilfL9tEZBewgST2VuLslhxw/j1Z0IGSypSaN4sjfOnCQan6AMe6UzWY
         sJMIQM9GlBg+JDOikOSxINN2e/ctDf/smkScNYn0FSjjtKq+JewZAc21BD0utobeyn+J
         YNHxo8eGuNeAVECtsFIFI5Bg21p5aTv2LwNs5mj75pbibcG3svPEdxlKIu/SWE4npsA4
         dXdA==
X-Gm-Message-State: AOAM530EI28iPFIpKysPlMD8cEsjc6E/bL0QEqZIh/g+XYXq7iUMYVxg
        FktYBT70jNrgUUEinNmJ5e8=
X-Google-Smtp-Source: ABdhPJzjHTXfWlw7h70xDaRdHn9fHAETntzzNow8HNFCuDxMxiwcmxDJ2AwIO9g90j+ItdLsr3ZWyQ==
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr13286297wmf.141.1591971613501;
        Fri, 12 Jun 2020 07:20:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d18sm10252182wrn.34.2020.06.12.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 32/38] dt-bindings: leds: Document rfkill* trigger
Date:   Fri, 12 Jun 2020 16:18:57 +0200
Message-Id: <20200612141903.2391044-33-thierry.reding@gmail.com>
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

LEDs can use rfkill events as a trigger source, so document these in the
device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index a2a541bca73c..6619d1ff1031 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -79,24 +79,25 @@ properties:
       the LED.
     $ref: /schemas/types.yaml#definitions/string
 
-    enum:
+    oneOf:
         # LED will act as a back-light, controlled by the framebuffer system
-      - backlight
+      - const: backlight
         # LED will turn on (but for leds-gpio see "default-state" property in
         # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
-      - default-on
+      - const: default-on
         # LED "double" flashes at a load average based rate
-      - heartbeat
+      - const: heartbeat
         # LED indicates disk activity
-      - disk-activity
+      - const: disk-activity
         # LED indicates IDE disk activity (deprecated), in new implementations
         # use "disk-activity"
-      - ide-disk
+      - const: ide-disk
         # LED flashes at a fixed, configurable rate
-      - timer
+      - const: timer
         # LED alters the brightness for the specified duration with one software
         # timer (requires "led-pattern" property)
-      - pattern
+      - const: pattern
+      - pattern: "^rfkill[0-9]+$"
 
   led-pattern:
     description: |
-- 
2.24.1

