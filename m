Return-Path: <linux-tegra+bounces-2259-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 812EB8C448C
	for <lists+linux-tegra@lfdr.de>; Mon, 13 May 2024 17:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3540C1F21C07
	for <lists+linux-tegra@lfdr.de>; Mon, 13 May 2024 15:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F0E15442D;
	Mon, 13 May 2024 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2CpCi4z"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1831B15442B
	for <linux-tegra@vger.kernel.org>; Mon, 13 May 2024 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615352; cv=none; b=l4zCdoET0xL4iK5Z3xMZUZhusK4QIfoBsWBDcyVmZOYVT7jEv5hzQb73tjIFDS/sRppXewaw6EW+WbpU2WVBW2lM5hCHhd1v9ima/BMqD9GmzdXuJDEapHHPzw4CMtxzCIoU/WMnK+NotjEz7kPPgIFYiueVo8PF/XrxB+CkdBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615352; c=relaxed/simple;
	bh=NIN1KoznpuO/QWyceeY5hhLz6j97HZ/lyYNmNLozLJg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=svp7l80v6Jh/gb5lQp5u9faSXZ7cxhhkV/YDWWKPqOZPZAmZI6nDKQC+bNuMqnuF7WXYgwnbIwogtv/Eu44GVpYIIspKkElW4xCR3+dZrtxGkC4pk1fNKR5dA8NTOc64CwuH3xX1ZtRgQmgI0MBPcKRHGTOsGHu8JFx8WmivDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2CpCi4z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4201986d60aso5551545e9.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 May 2024 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715615349; x=1716220149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6WCHEmdC5HDoJfqqfWkmm0fxg3UNJhsL4sisIOTexc=;
        b=I2CpCi4zCt2QFRz5i3oAiVgrfv2EBbhUTruOjfOGiWCRn4k6QKwSZH7nrGiTICU+fr
         mPPrE+QT7iidcCPx65YJc7GtA31PNxrl2e1FB+N7/ZigXizOQyw5aWDb5RNgVDbiqjqp
         CC47TuZRlnLQu07p8qbvM3ndLcGBuqJJfXDN2MTEZ54T+5V1YAQc7LNQZr3WdDB5qE2K
         V05xA5V1Eqf2TpcNQK3cjfrCzEUTGZsUhHs/qSHNiuc9SMobFsX61kr7nr+vNW+/3FGz
         0u6NWb23sWHodain4+ZUCNosxr3zsuMWrmSjdf98orCDnRACTtQf+vFOuY5y4R+9PdKO
         INhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715615349; x=1716220149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6WCHEmdC5HDoJfqqfWkmm0fxg3UNJhsL4sisIOTexc=;
        b=mkTmhMrpZu26aJXPZxOrFUSbDK1Y1gLOxiXcjUt62kdn/Nyng1x8tPOO2/s+7oDrTw
         HGS8zreyBRGmns7pkGZHIEH7UKQnBPjsMuI/MXr02T/nlk3GpFngOwyxJvWfcK4inf7m
         q0QY9ZHOZBqSJnPTvvmNmSY+YMbKG8TuyQecAG8w+NVLD/GDvETaYfFs7Tu6b0NXFl8S
         kZ3K+H4CPn2zhR9B7BZW2CdY3RSTF877K9Hxa4OZcCtBLZy7j8yq3iiRPx3pjiZHXCP6
         FkRDqFSp8ozxP9R6PHHgfvfjk2UdIz3O1I2GniXEnelR7xFPuYhu8wSw9XEonRhL9Rvu
         ItJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuhLBTcxUc76bZw8NrgkbBxecHYWWevaYIj0Rr6tuBuQTpJOaUmMBkaY9HMzj68HJyO/vYQQSIt74pq2eelLELkRxzsG3Fgv5KlKg=
X-Gm-Message-State: AOJu0Yxge+0XRU/cqKkg7Tg1nIBVp7OTbQTJDzHDuGHOy5N/aiOtISIm
	Xj1z8aU1/zDUi/fNg5XWeoPuUPhdSXWDgi4vUzbl+0uXA3jQVSCczBMLj4fZWA==
X-Google-Smtp-Source: AGHT+IGzFcU86ZXbFHnFdO/6QzUc+dgd+s0ZJLfz2MBsc0jnrPY/2M3aQNnsKSWVS72kZvNcFaC8hA==
X-Received: by 2002:a05:600c:1d0a:b0:41a:ff7d:2473 with SMTP id 5b1f17b1804b1-41feaa2f414mr86453735e9.4.1715615349104;
        Mon, 13 May 2024 08:49:09 -0700 (PDT)
Received: from localhost.localdomain ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bcf9sm11503628f8f.6.2024.05.13.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 08:49:08 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com
Cc: robh@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	vidyas@nvidia.com,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] PCI: tegra194: Add check for host and endpoint modes
Date: Mon, 13 May 2024 17:49:00 +0200
Message-Id: <20240513154900.127612-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra194 driver supports both the host and endpoint mode, but there are no
checks to validate whether the corresponding mode is enabled in kernel
config or not. So if the driver tries to function without enabling the
required mode (CONFIG_PCIE_TEGRA194_HOST/CONFIG_PCIE_TEGRA194_EP), then it
will result in driver malfunction.

So let's add the checks in probe() before doing the mode specific config
and fail probe() if the corresponding mode is not enabled.

But this also requires adding one redundant check in
pex_ep_event_pex_rst_assert() for pci_epc_deinit_notify(). Because the
function is called outside of probe() and the compiler fails to spot the
dependency in probe() and still complains about the undefined reference to
pci_epc_deinit_notify().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405130815.BwBrIepL-lkp@intel.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index d2223821e122..e02a9bca70ef 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,7 +1715,16 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
-	pci_epc_deinit_notify(pcie->pci.ep.epc);
+	/*
+	 * We do not really need the below guard as the driver won't probe
+	 * successfully if it tries to probe in EP mode and
+	 * CONFIG_PCIE_TEGRA194_EP is not enabled. But since this function is
+	 * being called outside of probe(), compiler fails to spot the
+	 * dependency in probe() and hence this redundant check.
+	 */
+	if (IS_ENABLED(CONFIG_PCIE_TEGRA194_EP))
+		pci_epc_deinit_notify(pcie->pci.ep.epc);
+
 	dw_pcie_ep_cleanup(&pcie->pci.ep);
 
 	reset_control_assert(pcie->core_rst);
@@ -2245,6 +2254,11 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 
 	switch (pcie->of_data->mode) {
 	case DW_PCIE_RC_TYPE:
+		if (!IS_ENABLED(CONFIG_PCIE_TEGRA194_HOST)) {
+			ret = -ENODEV;
+			goto fail;
+		}
+
 		ret = devm_request_irq(dev, pp->irq, tegra_pcie_rp_irq_handler,
 				       IRQF_SHARED, "tegra-pcie-intr", pcie);
 		if (ret) {
@@ -2261,6 +2275,11 @@ static int tegra_pcie_dw_probe(struct platform_device *pdev)
 		break;
 
 	case DW_PCIE_EP_TYPE:
+		if (!IS_ENABLED(CONFIG_PCIE_TEGRA194_EP)) {
+			ret = -ENODEV;
+			goto fail;
+		}
+
 		ret = devm_request_threaded_irq(dev, pp->irq,
 						tegra_pcie_ep_hard_irq,
 						tegra_pcie_ep_irq_thread,
-- 
2.25.1


