Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C644C446AC
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbfFMQxt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:53:49 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51080 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732141AbfFMQxi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:53:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id c66so10954835wmf.0;
        Thu, 13 Jun 2019 09:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iioJJmJRjMyZj4D5En9AIxg+XTowaC+ivgjvh04pEHg=;
        b=MqZwLJFjZnG25JVAnS2bjzMXJNhJuKhK+2UuagRhnOxDibB5/EW5RWFsh5IVY9YIjh
         oMmURAOBtEiM4EKkaB4S9kSeDhLllHMVDNjE0lfzlcNMksrjpwWxUWSNpJ+epXLuiJsG
         r1wcGRqz4eOhJjiNTBoS8Kw9OeIa8Z4A6MqbKpIBBD0DlHEepbptqNK1cQqMRvzKYNfb
         4fnVQp9Vf82EuWUQa2xONX/MM3Dd4cNmN8YkROciRhK9P3jA8igXsz//mi+qhia3CUpf
         OW5l0E2skoTorNID7WaBIhwLrG0PFN8yXNyjdPACwwWFK54+DeNLtFIU+vQAb0Wc/E+n
         CxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iioJJmJRjMyZj4D5En9AIxg+XTowaC+ivgjvh04pEHg=;
        b=R7j4GCRHNz89SPVFoE0t+Y4cbUD4Q0iGSkJxmaqtxOmJvxQ2DKpsfkMv5MqYQe45PV
         0eyE/KzNCxDtG+nf0f2uv3tx2kAEYgYJpxc5PK66juMqtDhAI3qqEcHw3NcO9DixC37C
         GnYCIHgGGjLdSiaJzIge5zqYjv0MQTxkv0WaeCNQnRHIubNRLx/7cTLnEJkOaw8bqWey
         uS4SFoeNE/IsLEEvFboXzXYa+AAahK6JxgkhvJgG9Oo4N+Vte+mh9/p0O07OLQYy6q8J
         qVwcISeUyeKGqRyy/3pJQBZQet69A1744fQcHbmuEMYZuFyYcgoCHEHNrhhXiP+JQevd
         4ynA==
X-Gm-Message-State: APjAAAU+ILPm3Aj6vybRtkS/BNQulhP7N4vPK19J+2duMGYS48S1qvFt
        HjehQobhxisb5wqvix+mYLQ=
X-Google-Smtp-Source: APXvYqzBdFnQ6Ei+FQteusMvQ8m4ysklmBEPHIwMZl5+HkqlQUxhrS9KaQgaJ1wxDhqW7I7KqoIAEg==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr4433863wme.125.1560444816426;
        Thu, 13 Jun 2019 09:53:36 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y18sm475388wmd.29.2019.06.13.09.53.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:53:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: tegra: Add ID EEPROM for Jetson TX1 module
Date:   Thu, 13 Jun 2019 18:53:30 +0200
Message-Id: <20190613165331.8689-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613165331.8689-1-thierry.reding@gmail.com>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is an ID EEPROM in the Jetson TX1 module that stores various bits
of information to indentify the module. Add the device tree node so that
operating systems can access this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 4dcd0d36189a..e8654061ce03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -264,6 +264,19 @@
 		};
 	};
 
+	i2c@7000c500 {
+		/* module ID EEPROM */
+		eeprom@50 {
+			compatible = "atmel,24c02";
+			reg = <0x50>;
+
+			address-bits = <8>;
+			page-size = <8>;
+			size = <256>;
+			read-only;
+		};
+	};
+
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
 	};
-- 
2.21.0

