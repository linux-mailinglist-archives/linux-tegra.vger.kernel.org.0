Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4418029848F
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419737AbgJYWVi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419262AbgJYWSK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:10 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F3CCC061755;
        Sun, 25 Oct 2020 15:18:08 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id p15so7711627ljj.8;
        Sun, 25 Oct 2020 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZKM/S0x2MY1ZFM4qOBuLZyS793buaElpMzohr8I+AQY=;
        b=dNfD6Rxk6Nwi0goChSg0/DTUVXTfVWlXbaeZyDrHorzqr7zqc8dWSHoCrAW4KSVpj9
         hTY1P+RzN/OF8mOeIOnM2hJhVmr0d8TKG1l7QIQYaPR7yZl16IBkdcNtKEiDtHngrKoC
         wE5Xz9cjl1S7wxoDB2umixYVZ7aG2k+5dvTMx2Z25MYwNVgtd1wf749pEAMy/YXyJAsy
         07lHfysY+1wDyoEth+/4mgj3MqLATkxXEuOj9V5EaXfgCydlzcRTPlsMY5iAFkmIBflm
         wgV4sglLRmE0the/2NCnTNpKByLBk/Bw8YGJ29+cgrlyCkrJdpqayo8Zckl/Iql/NlSj
         RT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZKM/S0x2MY1ZFM4qOBuLZyS793buaElpMzohr8I+AQY=;
        b=I4+Y+G9xF2Z6PVHj+k6iwE19igKmu8D3eaQTcQF8p1k3Nhi3y7680SAIAMwNeDS2Qq
         ffoexd/bwfeYiKM3lS6Y55d123GZiOtOgqR4J9lUcL9v+wytFDEGWz2ZsUAoHIURgI2x
         VsZFn5BdPj3Cxs/rB9SaoZkSxXEkHZ/lB2nmYJo3Upx8+xWG9Ii3rVqHuNcC28n537Ik
         XrLYVKPnizGRW0cD/AAyfy2BatuisXoPezUsCoOGzfvOfMKHFZB5QdSYpYACkHhweqby
         /nzoGE+DUmarGdXWpuldyqV3sIowRwi5yXw8BJKEwSM5wraKzzBR1afw0YJi4CQQtx+A
         u5QQ==
X-Gm-Message-State: AOAM532HWfpFGqh8I+t3QUhvK3HUWZgdqLHoDSthpSaCCRKbm9Al2KXW
        g+8nS8tz8FiRgt4bTRrZJj8=
X-Google-Smtp-Source: ABdhPJxPZdOJGbwhtqc/Pfb4xtb0ku6XT/bslQ4Wiy82wuCEkMIXYCpnQyraHM6ONaIoom26sNzZtQ==
X-Received: by 2002:a05:651c:2043:: with SMTP id t3mr4220711ljo.116.1603664286896;
        Sun, 25 Oct 2020 15:18:06 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 16/52] dt-bindings: host1x: Document new interconnect properties
Date:   Mon, 26 Oct 2020 01:16:59 +0300
Message-Id: <20201025221735.3062-17-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Most of Host1x devices have at least one memory client. These clients
are directly connected to the memory controller. The new interconnect
properties represent the memory client's connection to the memory
controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index ac63ae4a3861..814246e51954 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -20,6 +20,10 @@ Required properties:
 - reset-names: Must include the following entries:
   - host1x
 
+Each host1x client module having to perform DMA through the Memory Controller
+should have the interconnect endpoints set to the Memory Client and External
+Memory respectively.
+
 The host1x top-level node defines a number of children, each representing one
 of the following host1x client modules:
 
@@ -36,6 +40,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - mpe
 
+  Optional properties:
+  - interconnects: Must contain entry for the MPE memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - vi: video input
 
   Required properties:
@@ -113,6 +123,12 @@ of the following host1x client modules:
 	  Required properties:
 	  - remote-endpoint: phandle to vi port 'endpoint' node.
 
+  Optional properties:
+  - interconnects: Must contain entry for the VI memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -126,6 +142,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - epp
 
+  Optional properties:
+  - interconnects: Must contain entry for the EPP memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - isp: image signal processor
 
   Required properties:
@@ -139,6 +161,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - isp
 
+  Optional properties:
+  - interconnects: Must contain entry for the ISP memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - gr2d: 2D graphics engine
 
   Required properties:
@@ -152,6 +180,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - 2d
 
+  Optional properties:
+  - interconnects: Must contain entry for the GR2D memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - gr3d: 3D graphics engine
 
   Required properties:
@@ -170,6 +204,12 @@ of the following host1x client modules:
     - 3d
     - 3d2 (Only required on SoCs with two 3D clocks)
 
+  Optional properties:
+  - interconnects: Must contain entry for the GR3D memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 - dc: display controller
 
   Required properties:
@@ -197,6 +237,10 @@ of the following host1x client modules:
   - nvidia,hpd-gpio: specifies a GPIO used for hotplug detection
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
+  - interconnects: Must contain entry for the DC memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
 
 - hdmi: High Definition Multimedia Interface
 
@@ -345,6 +389,12 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vic
 
+  Optional properties:
+  - interconnects: Must contain entry for the VIC memory clients.
+  - interconnect-names: Must include name of the interconnect path for each
+    interconnect entry. Consult TRM documentation for information about
+    available memory clients, see MEMORY CONTROLLER section.
+
 Example:
 
 / {
@@ -498,6 +548,15 @@ Example:
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0A &emc>,
+					<&mc TEGRA20_MC_DISPLAY0B &emc>,
+					<&mc TEGRA20_MC_DISPLAY0C &emc>,
+					<&mc TEGRA20_MC_DISPLAY1B &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
@@ -513,6 +572,15 @@ Example:
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
+			interconnects = <&mc TEGRA20_MC_DISPLAY0AB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0BB &emc>,
+					<&mc TEGRA20_MC_DISPLAY0CB &emc>,
+					<&mc TEGRA20_MC_DISPLAY1BB &emc>;
+			interconnect-names = "wina",
+					     "winb",
+					     "winc",
+					     "cursor";
+
 			rgb {
 				status = "disabled";
 			};
-- 
2.27.0

