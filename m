Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA301FB2D6
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgFPNzM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729007AbgFPNzI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCFBC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so20910831wrt.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e92nXRna6f6oAJuVgO2pIVWwwjLBTK0H6SidJH7THA4=;
        b=Ufp+uCItGeMBFHM0yFc0yz9wVLzyxUSYssv8/bqJ8uQ1pg8opkofPigX6Ho+4sHbwW
         uyCkwKZOnUdPLzRqoqNan4BQwPACLZtsT1BxbtPdx09YcCxGWuno374EJko+FzItmzzM
         3Unz5dNEY02EdMJd8dtW8Hduxn8w/uNifbwEl/KJrSmTP5h7etNxWzGRCzvAiZr5qZGW
         hf/NPpETrKY1NwzFORWTyOrxAbNDrimX3RqmLXZus7d4Qh2xy6qpeSFnpZ/XP6n/VpT4
         mV2hoyV3uyK1zE+szEc2MVZUhhcW3LXnNgWUOPNgwdHQdsCfwvyB7FQu1zMX9Mfresj3
         E49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e92nXRna6f6oAJuVgO2pIVWwwjLBTK0H6SidJH7THA4=;
        b=rLIFJ6fO+VVBL4sA+y6CG+9G4WhfwpBfOxFK3dDPnzW9upXDVor99Ku9PZf4LcEqsH
         jJ36LXnaGZPHLhWUc63xMYPACsgJvyiccMnn4W+59kJXwLrUxaF3JMDZ7Dv+DhP6It+j
         /g3Y6F6tJtBOWQOIYMz23iA56XjnRF/5GBKB5nGmbcLYF5yG88FZ9gc4KEveap4cZ5tF
         zAn1CG0MB5hSVK82k7vLismXcWL4Q2Dmq0IAmLR6qSYsqyuHTUEi5EMlSaDqUH5tgRv3
         kYACSgY/eTGr6jMiTGRDNPrF0h49vN2o73dfq0jQd10Hr0sQPzMkEg6oZwBq8pNYLao7
         UQOw==
X-Gm-Message-State: AOAM532waPwGvNINbP0etsAVaqNaX8JPOh5JdT1i5ol75jK/7Cu3F1K1
        lrLGNTrTTj41dNLEIws87Vo=
X-Google-Smtp-Source: ABdhPJxU9dhTz7gsboG0QB69wlJs4Cyv0/uF0p4ZfoeNELT+fOfwzZzmOcZw3dyK+4QXoQO5ij9xlQ==
X-Received: by 2002:a5d:4282:: with SMTP id k2mr3153179wrq.196.1592315706907;
        Tue, 16 Jun 2020 06:55:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c6sm4339122wma.15.2020.06.16.06.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 58/73] arm64: tegra: Tegra132 EMC is not compatible with Tegra124
Date:   Tue, 16 Jun 2020 15:52:23 +0200
Message-Id: <20200616135238.3001888-59-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The external memory controller found on Tegra132 is not fully compatible
with the instantiation on Tegra124, so remove the corresponding string
from the list of compatible strings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 6d9bd9cae388..0425e584791b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -605,7 +605,7 @@ mc: memory-controller@70019000 {
 	};
 
 	emc: external-memory-controller@7001b000 {
-		compatible = "nvidia,tegra132-emc", "nvidia,tegra124-emc";
+		compatible = "nvidia,tegra132-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_EMC>;
 		clock-names = "emc";
-- 
2.24.1

