Return-Path: <linux-tegra+bounces-2027-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8DC8B6A65
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2024 08:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A191C20BA5
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2024 06:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF94177990;
	Tue, 30 Apr 2024 06:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWfF+HS8"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD884DF6
	for <linux-tegra@vger.kernel.org>; Tue, 30 Apr 2024 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457680; cv=none; b=C1ENztWodgEu/7mi+NgwvsBGLm7FDJB/u0vj/deO/UiwFzqwIibHNoesQm7spgWA9Uhf5n88/a2jIbZhlXKfdijT8WE2guFqY3+gyeHwt24859I+6aokQOGVEGlVpoWc4s0AEzYgowylc+UB8E4JaEpwuV/B2o5g6wJ4taQc1do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457680; c=relaxed/simple;
	bh=gwJkiWxyW/wamW6kH7+GRx7VSH7hXsYT3WZXX3driJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+27HInfHPAVseQ/wMxmSkDxVDA2i7qdrJMK3BqwhGnKGgOxGla0OF0MXOG+tHn8CfeT2rk71OuK5WNJBOHhpfKfh9lQTt6AKNhJsweT9CCpWkN24Ys6M9gnK2iCI0Q7mT9VsrFZtuChssRkuEyqCbb0IFgaAjowlTVKUnKrOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWfF+HS8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e5c7d087e1so45712945ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 23:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457678; x=1715062478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfACtQQSDUwMHO1/0RK0ntsz+YmSOQ8ynC0u7vL0q8w=;
        b=WWfF+HS8623sWjdYlAr6UUNKZJVc2+6d8C/ash6g0yNTqoeN0Rl9EB95SE6MfDfRY0
         jC7ZkrpedNAic7BZ0yP9AI28zwK8J5RxVG/w7g88RFmdd+lvRz/pD98VNWYouq8k69BZ
         YUENRNNN+1F7mJKOzQiK5FiTjVqFgUt0FRl0EnBIJZpfpDMyTfc13HXsDZ06/4XCoZ80
         P3TJYeNVqeO/aTq8Teu0n2lkeZWwwayu20gtgqPKRK6fP6u9lgMBobWC6AqK/TloVpwP
         qXgnbiCKNQuvR4xUt6afnHTheuMcP1/n/86vCdhqmrOrycZtUMRIa0cZXbzs6UoGvsb2
         YMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457678; x=1715062478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfACtQQSDUwMHO1/0RK0ntsz+YmSOQ8ynC0u7vL0q8w=;
        b=uZXyhYuYhIWQplBy0WJ7UWR5MSG6sn2Z0NyOK3jAy80G7cVqEME6va8Ebz6CM/t1aq
         F8/O0zDCu/hXjDWbFu7ubGA8RYrBV6Ucsd/EqcxShpKGH09l9pcsXiQ8T2ptZ9tLEeMX
         8tJR2WSL4u7rbVN1EmxT2wC50qe3RYoZQazP82ZBvesTW7vqZeZ27GXQ8H/K4eDquY0n
         UXR2O6iYtgfmFYVeDGbmYLviqiyvxKcAZPBjcfptAADaYEOgzi8I1ZkeVkblVcbCKbUq
         KjpG64UxB9PoI2fckcbOxei4WJkNVv5vIBhVLKsnpCjTl5T50aM/6Z2uIyiKmgud7xzz
         ExLw==
X-Forwarded-Encrypted: i=1; AJvYcCUpjUedBKcs34d6/e7NlY2gsnADsIoT4+eCF0qtFLw0WIbp8kX61jY3xIQI9jZEm+77P9bNm9td/RC39w9F1p1t4jOSp3Kfgdwc+iQ=
X-Gm-Message-State: AOJu0Yx+HKVZl5rHPjSb5bvq7Unnj7Is5r8OkyLJJTK16oQmaSmfXSQa
	QtQ+RS3UncscXXgAZSWNe3ZIDh5JvyIGtbirwtwsv7K2skxnbiaQsH0oQTjNsA==
X-Google-Smtp-Source: AGHT+IGWSiYL4QGZLQ9kxcs8EksybyJBj3Q5TS+tl4f5cOjnz0JQqoAPxUgOn1Wokxhf05hTLpZtWw==
X-Received: by 2002:a17:902:7087:b0:1e6:68d0:d6c1 with SMTP id z7-20020a170902708700b001e668d0d6c1mr12539439plk.40.1714457678284;
        Mon, 29 Apr 2024 23:14:38 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:51 +0530
Subject: [PATCH v4 10/10] PCI: endpoint: pci-epf-test: Handle Link Down
 event
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-10-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=gwJkiWxyW/wamW6kH7+GRx7VSH7hXsYT3WZXX3driJ8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwd973TI9incgBAwvQzAk1axQR3EQfp2S+v7
 0yLEScJY42JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHQAKCRBVnxHm/pHO
 9W9wB/9fKbNDwL0ouS8vXUIF1ITwHRCULxFhwVZnrKt6wJZZ10YPd6A9VuBZdad+tngXVjkuP8w
 y2VLFDcc4KgVEadpMF08dctlEfIju4UbBdEFJSEWUynyOkW//VQHFnjFFqRDUzgxJGS0/HVtCOx
 DIKJ2WR27vm+b9WdcJqbVuQvS2DJ0p3qbJatfzAVrFxcVxLDH+9DGD9CeExys4NrUyu9TKYZdB0
 ZiL8A0W9pOjEvFALzu9UAY1mhQpoZxwMX4Ldz8ABwFNHKktBYLKK4nD+YcsB2OrFE3EzmJo2Ol/
 GH7xP7PBMproKqyLDV/eCbdhGxKOw/9TTP1FAzdVXKFtqbz1
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

When the event happens, the EPC driver capable of detecting it may pass the
notification to the EPF driver through link_down() callback in 'struct
pci_epc_event_ops'.

While the PCIe spec has not defined the actual behavior of the endpoint
when the Link Down event happens, we may assume that at least the ongoing
transactions need to be stopped as the link won't be active. So let's
cancel the command handler work in the callback implementation
pci_epf_test_link_down(). The work will be started again in
pci_epf_test_link_up() once the link comes back again.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index c8d0c51ae329..afb28df174c3 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -809,10 +809,20 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 	return 0;
 }
 
+static int pci_epf_test_link_down(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work_sync(&epf_test->cmd_handler);
+
+	return 0;
+}
+
 static const struct pci_epc_event_ops pci_epf_test_event_ops = {
 	.epc_init = pci_epf_test_epc_init,
 	.epc_deinit = pci_epf_test_epc_deinit,
 	.link_up = pci_epf_test_link_up,
+	.link_down = pci_epf_test_link_down,
 };
 
 static int pci_epf_test_alloc_space(struct pci_epf *epf)

-- 
2.25.1


