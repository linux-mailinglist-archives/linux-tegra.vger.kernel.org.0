Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E72EA446AA
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392997AbfFMQxm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:53:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38010 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730181AbfFMQxk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:53:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so10872187wmj.3;
        Thu, 13 Jun 2019 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4FVqXBYoVQEIlsaX3zo8xQpS0bIMFHHRYcbxji5ppI=;
        b=me63D8Re60mBfgiq6Kee2NUjBCG98fgeGSRsfH3vxcwb8vIT6ICqH9hfDHG3uCN2RV
         yqg6QpJ0+77dyda0uRpdwiy+07DqAE2FmtNwtB3h+BLNEpfdiY1zJCXns/gOiRyU+SU9
         OE5T81jLnDrTha8UcAIF3z9RYJpqh0Wm+a2I7r9r2sXRYyE159/ebq9hTaD5Wf4JYPZK
         a/IwJJQNoOfpp+DJIM9MdEbsLaPdG0zE7jEQZN9YEmF0k2l47NjRGQnWMOAW4s3nLp7p
         32rYX4nGkZNZX8m8fmGPbbRaYiVjrNNgFiV+jwphYCBh7rItDKv3c6YZInVz7L+rAt9e
         Sfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4FVqXBYoVQEIlsaX3zo8xQpS0bIMFHHRYcbxji5ppI=;
        b=mb1fZDQWBHdp8Rrspfo3xKsIkoIQsEHXEHogBg6HGcZkRM3gy5NLRL2q2J72MTu9AH
         WpDxUPv39hxphTlYYCxeGe8Zs+0Vjm2p/fhb/u2f8gpjBAm9RM6ZLMNY3aXnvVUI/BFg
         l5yVrjPzqEiql3wiWDfQeSGw11jSU/xI2AQAM+gffYIqlFZJITms3Y/NX8dgMhShher2
         61z3De72DbM5B98QdInmKNtZN1ft3TEGJ1AR/xERuAsjOzHYGMzrwxqHha58nexw6eOV
         JnXpc19mC3iRC/nfxUaUqk7FeW6aqS5HH43z/ZLCot5qh1dm0AuZRq5ubblsfsOmQRD0
         w+oQ==
X-Gm-Message-State: APjAAAVCGJRbMJC7zhyHFSJeVagUcQn+rBITSEPbPQCbwqx941rWVrvy
        0L1CHt8WREYW4rCHSR7hyIU=
X-Google-Smtp-Source: APXvYqwlIwdg4httjAD2WhScp/mZNYmeTVDW8BWPi42Xi+V0Pbu745HNjkaIzfO+P4ZOX+1h2omj9g==
X-Received: by 2002:a1c:808b:: with SMTP id b133mr4285413wmd.160.1560444818376;
        Thu, 13 Jun 2019 09:53:38 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id c16sm103779wrr.53.2019.06.13.09.53.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:53:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: tegra: Add ID EEPROM for Jetson TX1 Developer Kit
Date:   Thu, 13 Jun 2019 18:53:31 +0200
Message-Id: <20190613165331.8689-4-thierry.reding@gmail.com>
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

There is an ID EEPROM on the Jetson TX1 carrier board, part of the
Jetson TX1 Developer Kit, that exposes information that can be used to
identify the carrier board. Add the device tree node so that operating
systems can access this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 5a57396b5948..a3cafe39ba4c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -79,6 +79,19 @@
 		};
 	};
 
+	i2c@7000c500 {
+		/* carrier board ID EEPROM */
+		eeprom@57 {
+			compatible = "atmel,24c02";
+			reg = <0x57>;
+
+			address-bits = <8>;
+			page-size = <8>;
+			size = <256>;
+			read-only;
+		};
+	};
+
 	clock@70110000 {
 		status = "okay";
 
-- 
2.21.0

