Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7BB7A2994
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfH2WTW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:22 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41938 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbfH2WTW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:22 -0400
Received: by mail-ed1-f67.google.com with SMTP id z9so492145edq.8
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWWE4IVBHvnoWLCLZVIdhXONrKHwnBndvWwW8Ly/oag=;
        b=CDeCvURHjL/QvJ+JzQh7tQWSKSlqeaR+U1GRH5VNsZypiAr9UJG8f2CRiww4T9qnIN
         8kova/7Nf052viUJOC/QQ6QRWdgMcXd/pYDHAQJMfXrFKIbYS/fJWQdoVuaKFDjcnTD2
         Ab7mwQzRZx6NBZFahqZccVil49TEcdIhcIFrjwp9T/k5q8VXsHrokxuZla167EZ2bBKB
         034EJaQ9J3b2vDvNi8b0q43pkdXGXK7Wef0cknVm/uunrUhmXm5VnVAg8dJnUNezaIax
         b454k/aXfrG8X+JXCkdDIkHVVF0E+cPyNLv9xMB8hwkHKsjKKn3HoP6IXetbbKilfr17
         YG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWWE4IVBHvnoWLCLZVIdhXONrKHwnBndvWwW8Ly/oag=;
        b=p16BUdasjcSY+54TtFADo8UPjBUgb66xyD8pK8AzAwFTpo6AMADRBLG8LckYWdEhtr
         w5sl9qc+VPRV+SO5/BZMYoHB6oVL4uAWZ/Td+QudB+8n3dRIhedp4QZfwm6hhnhWcNZm
         LqqFHtQRDdv/UE2XJsZSW8f+s6E1XzEGSM1DwS8zvKCvi5T/FiJtOm5ptLcaRXj6sr7m
         UCz8h2yhkJHPJBa4qlyIyfjI47ZBgq3z5noWThkg6wqeqOEzpAO+dRtvGxzPc9dlWpnZ
         ZzBCOmiRgXAaaW4A8blM1rCWwdy4HRv1+RWR506XnXXHifjWlo02C8LtqOj54xLo7F7a
         RKbA==
X-Gm-Message-State: APjAAAV3ZWO0iCuJ1eX5Zh5NfGF2jMPDGG1/0T+XhQp46j4G9ZofXe+T
        8qoFZZoK1ufd3N9IjoYrNl1yQNVv
X-Google-Smtp-Source: APXvYqwMwzPHARuYWpo0KwSH4bLFC3MhIdvUeMONlOnt5JZW69A/p+LuCw6K+N1EW6+xLGLdyRXIbg==
X-Received: by 2002:a05:6402:1446:: with SMTP id d6mr12728144edx.102.1567117160874;
        Thu, 29 Aug 2019 15:19:20 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id d21sm670705edv.57.2019.08.29.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] soc/tegra: fuse: Add cell information
Date:   Fri, 30 Aug 2019 00:19:07 +0200
Message-Id: <20190829221911.24876-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829221911.24876-1-thierry.reding@gmail.com>
References: <20190829221911.24876-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Create nvmem cells for all the fuses currently used by consumers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 3ce2138b278b..c6c6a7746046 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -86,6 +86,94 @@ static int tegra_fuse_read(void *priv, unsigned int offset, void *value,
 	return 0;
 }
 
+static const struct nvmem_cell_info tegra_fuse_cells[] = {
+	{
+		.name = "tsensor-cpu1",
+		.offset = 0x084,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-cpu2",
+		.offset = 0x088,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-cpu0",
+		.offset = 0x098,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "xusb-pad-calibration",
+		.offset = 0x0f0,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-cpu3",
+		.offset = 0x12c,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "sata-calibration",
+		.offset = 0x124,
+		.bytes = 1,
+		.bit_offset = 0,
+		.nbits = 2,
+	}, {
+		.name = "tsensor-gpu",
+		.offset = 0x154,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-mem0",
+		.offset = 0x158,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-mem1",
+		.offset = 0x15c,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-pllx",
+		.offset = 0x160,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-common",
+		.offset = 0x180,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "tsensor-realignment",
+		.offset = 0x1fc,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "gpu-calibration",
+		.offset = 0x204,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	}, {
+		.name = "xusb-pad-calibration-ext",
+		.offset = 0x250,
+		.bytes = 4,
+		.bit_offset = 0,
+		.nbits = 32,
+	},
+};
+
 static int tegra_fuse_probe(struct platform_device *pdev)
 {
 	void __iomem *base = fuse->base;
@@ -127,6 +215,8 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 	nvmem.name = "fuse";
 	nvmem.id = -1;
 	nvmem.owner = THIS_MODULE;
+	nvmem.cells = tegra_fuse_cells;
+	nvmem.ncells = ARRAY_SIZE(tegra_fuse_cells);
 	nvmem.type = NVMEM_TYPE_OTP;
 	nvmem.read_only = true;
 	nvmem.root_only = true;
-- 
2.22.0

