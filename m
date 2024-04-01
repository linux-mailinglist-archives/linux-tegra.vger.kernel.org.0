Return-Path: <linux-tegra+bounces-1418-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6E893D55
	for <lists+linux-tegra@lfdr.de>; Mon,  1 Apr 2024 17:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F7D1F22517
	for <lists+linux-tegra@lfdr.de>; Mon,  1 Apr 2024 15:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42856524B8;
	Mon,  1 Apr 2024 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wy82DoZu"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FCA50A8F
	for <linux-tegra@vger.kernel.org>; Mon,  1 Apr 2024 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986674; cv=none; b=hJAX7kZJQ4Wjrn/MA2N8jooDeg5jMiOVc93nKFdHX06Str24wd1/7f0/l8JvXUOM7CUvKUdzwwkRVfJBlYNxmDC/0u2nH7UYaB8Vrojvrx1x3XwSOh7FFLM4IMJfJ8R26HQF/s6mYsu/hK9wGSEbQGA7G3f3QY8j5nDB2NqrTTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986674; c=relaxed/simple;
	bh=zRqM7O4QJ9QR9QAQtoYpWdK8RL4rvRClmGOwhFTCtKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qt6U9lo5Rq/BpKMTmOxoxGpfpuLkOyG9T++F4ElCj4/I7bymXnrzJPAnu8kGdbAFVj2MHyNRQpwSzCBuNngjf0zaXxhgIyAna3Lfs2hDDKkx+udzNRn9tJ0wH2w7ON/3KdTaiDnaTt9LIBZA+lDZl6Qc38NWyJLbcE473rd2HuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wy82DoZu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1def3340682so36292125ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 01 Apr 2024 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986671; x=1712591471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wf5qp3kEMFhsDeZa+NERTddlDqgA0B9PoJGogDWVdDU=;
        b=wy82DoZu1rhH4ilu2uYsNkxp0uOOFpJ4Hk1zJ1cq2r/8qHxygfwdXJK1D3LDUcxuzs
         OtWI+14VSlwBqC9dTfxa0EAu/m7+Rc+UQCqLyHh2QpoODBXtbEwZB2jRwG9xGu5a3V/r
         2+5jjHK+JoU8ISgvkMl9cIgSjuYWJZVgppDQgqMOKSuZ7lM09bsXrQJ2MTwdMwxZnl+A
         ADhqCj13h3i0nUPgHrnYOpO8JNjsvDH4BpZNwyNrzH87ZkrfbkKwS8es329jArIxpvYi
         gHeYVrzRMk3hPYcXqiDTQu49HL4p6upYeCnJ8cbdWDGOd9vtKlplymLtznoMcqCtZwgb
         WB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986671; x=1712591471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wf5qp3kEMFhsDeZa+NERTddlDqgA0B9PoJGogDWVdDU=;
        b=TkI6hJJxUnzKYaWAdfiOTLpjl9HOnBl4eNC1bpynr2XaVYDtPyTdY6A+xECJeicCbG
         ozTxR17HaGxPBlNMjrB5Jl5MUKlVdTsb5RcdxNQYVWdCQWJptJ/Ll81WYHuFqVO7pA5t
         CH9Z8MojQ5cY549mWXzXqGmXhmpZDTmCx1ryAoDCnYDbEtSQ74RqTbVtQqKlwlgKcfSa
         OYY5Tvx39pqh3PFpQBZhi/yRJEvQZBO1XiRUM+8bsZ8IJKz0Nl/OyC5XCayu9hc/TNS0
         zhSvirgtnXadzyoX04HiWPPms+Lijk/BcFi79C6QwvZHW3ABHATz2MKa6hjGO5Oz9DNq
         /+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVdENRH2Sc0X3EmyweMW0Ad3vy+PjGJ8kFVWMceLqgMDxaQuM3OYUlgfT6jQI7mlZb2w3o0kryM2OIumLBQsJlarJrKbGxF03z0mls=
X-Gm-Message-State: AOJu0YyaoXsmNUjhbIIbYQUwsinqeHHUHmS8vrVwynYAs1WkPLm5swyw
	ii0oqdqCAhObG2r+qcTjWlxniDx6Xl+RliGwPtv4pba/Fjh2KdgHMTbg937mKA==
X-Google-Smtp-Source: AGHT+IGap+sYza98GvPHjuTeNYMlCEl+c2qLgEfw/BuVD1pRzSe138R04jmnV0lOziikjgGrlQcWYQ==
X-Received: by 2002:a17:903:41d1:b0:1e0:b73c:e879 with SMTP id u17-20020a17090341d100b001e0b73ce879mr12930947ple.68.1711986671258;
        Mon, 01 Apr 2024 08:51:11 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:31 +0530
Subject: [PATCH v2 05/10] PCI: epf-{mhi/test}: Move DMA initialization to
 EPC init callback
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-5-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=zRqM7O4QJ9QR9QAQtoYpWdK8RL4rvRClmGOwhFTCtKY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfUGdMnXrY09ZBOL8F9lt+fV4bkGmqX4yzHv
 JEDRzakX82JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX1AAKCRBVnxHm/pHO
 9e16CACpQKDNhpv2wVnXQuSo7FipwYiAPFw7B7IkFye9w0aKDK/a24rCFtQHwiS3d7bWb725nId
 5ZSgMIVacTO/tja/ih53qDSvseRRb65btJyC/QEeYKG004HySoO/LbdnndI7EYB5dMSR4JT4sG6
 O7nPXkKN5CQwv6H8dK5UZpn5A+/QXasxJmDJGVV4UgifGVSZLNiMnScp8Cif5wsRcyTUvJv+Q5K
 TJyKhT6SarbQza3iZ4ShaNbctSOrEfMxQprdKAjI5021kfz2jcU14qb2siHXfSZfFkM90mlW0iE
 WJl6Pztv0Dt8R4sD2Q7Fcg/HiMsAonnbkPeOAuzaoLaVGj7V
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

To maintain uniformity across EPF drivers, let's move the DMA
initialization to EPC init callback. This will also allow us to deinit DMA
during PERST# assert in the further commits.

For EPC drivers without PERST#, DMA deinit will only happen during driver
unbind.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 16 ++++++++--------
 drivers/pci/endpoint/functions/pci-epf-test.c | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index b3c26ffd29a5..4d5c638744a1 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -753,6 +753,14 @@ static int pci_epf_mhi_epc_init(struct pci_epf *epf)
 	if (!epf_mhi->epc_features)
 		return -ENODATA;
 
+	if (info->flags & MHI_EPF_USE_DMA) {
+		ret = pci_epf_mhi_dma_init(epf_mhi);
+		if (ret) {
+			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -765,14 +773,6 @@ static int pci_epf_mhi_link_up(struct pci_epf *epf)
 	struct device *dev = &epf->dev;
 	int ret;
 
-	if (info->flags & MHI_EPF_USE_DMA) {
-		ret = pci_epf_mhi_dma_init(epf_mhi);
-		if (ret) {
-			dev_err(dev, "Failed to initialize DMA: %d\n", ret);
-			return ret;
-		}
-	}
-
 	mhi_cntrl->mmio = epf_mhi->mmio;
 	mhi_cntrl->irq = epf_mhi->irq;
 	mhi_cntrl->mru = info->mru;
diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 1a4a35e7bf94..8756ffc5977b 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -739,6 +739,12 @@ static int pci_epf_test_epc_init(struct pci_epf *epf)
 	bool msi_capable = true;
 	int ret;
 
+	epf_test->dma_supported = true;
+
+	ret = pci_epf_test_init_dma_chan(epf_test);
+	if (ret)
+		epf_test->dma_supported = false;
+
 	epc_features = pci_epc_get_features(epc, epf->func_no, epf->vfunc_no);
 	if (epc_features) {
 		msix_capable = epc_features->msix_capable;
@@ -898,12 +904,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	if (ret)
 		return ret;
 
-	epf_test->dma_supported = true;
-
-	ret = pci_epf_test_init_dma_chan(epf_test);
-	if (ret)
-		epf_test->dma_supported = false;
-
 	return 0;
 }
 

-- 
2.25.1


