Return-Path: <linux-tegra+bounces-2017-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4278B6A3C
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2024 08:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA311F23818
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Apr 2024 06:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AE517BBF;
	Tue, 30 Apr 2024 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSvyBCYF"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2B6FB1
	for <linux-tegra@vger.kernel.org>; Tue, 30 Apr 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457636; cv=none; b=XVCs5aIc9A3viBp0V7t7IEXAiZALnHAQLPrUbnYhIsIzYWqgIk23GTkF46dFoSO8p9M9qn8ODaWj8MiBB7GPWMJSf2Jo1ubVhIdTDsCsd77AwSBGPXNZDR2Ajfad+Ix3iHNu/ktvXOIT+pdaThjZ1+U2L+JCcAVPtS2Zr1zXBIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457636; c=relaxed/simple;
	bh=CGUrm1vDZYlEmiR1ifXVGyQ3SZsQMUvdsEPtlsZS1l8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qyIEC9F92Nh1ttR5OrKHHzaakZvookxbqlLUYkU8MsAq4OFejZ6gfG259ZlIagJtPGrKhXNRvr3QGdarv6mngduCcUOxkajw9I/1OPQUXZblAKeJ4moIVDKLjIYlWQLX+YsQKBGsvR6WrNozNTpwfbp3Z9a+EhzbhTSqOTR0k2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSvyBCYF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e3e84a302eso39717915ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457634; x=1715062434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9c0gOO/h5yOIgS2nJawt/26LeQyQw+uGFdthgcrbcG0=;
        b=VSvyBCYFXqiiYMR9xROKxB92WRjr39X71j4pkM4gn6kyuvOHOa/8+rPqBN1jl6uzzg
         8q6kVw1vd+QfTbsqIiPahQ/M0rhhL+YggOeZwKg7U752/a8WzfjCQC1CYgCsliRVClVa
         dwUlVR17akHPEvGrDP1bqi5x+x0lc9PCn8TCkAAMldCyOTBg+oeP+GR9bp4yJJjN5YDX
         tvpCu/3MPM/YTviVt+9zDPGDSQ4t/7C2426C2tib6r1Z037oyqR0myH7usW32n7vwCBp
         3wPok+q+sTu/LnDqWSdjk+2k0ymF3GVkmaRBEjvY6f+K1TgJN0GhTvmgGSuqWJHZtRc7
         2R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457634; x=1715062434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9c0gOO/h5yOIgS2nJawt/26LeQyQw+uGFdthgcrbcG0=;
        b=X3kpZGCFbmgfai8agac2/hHpjdg5PmZXD+Hv8FG6fEnzeLTQTk4THZnFZGGQb5htZT
         vKU5VE1syNJs4gJ+Kgk9rwdIqfx79Nb6kG/AYgDoAj/E7WzVUAd5VB+bIOpAOw6HCWsK
         y/X5gHXPbIKE9+MKtM7eeiks3JX1FQxq9uJ9ryVRXiRRfDrNZqpglr+bIFcFcHOejnpj
         pCa9YwydIJyKwURljY8xb24hVnpRxK3We7N5+3+KtkJvsZ99SeWo0s/vI/r9/qOPVRGw
         UUSkdL0p8JNlz0TtPoF1hjRmaO8weOoPU5cIuv9WilSYoGn9vey4V4FgJtmW6L1pXsiV
         8I0w==
X-Forwarded-Encrypted: i=1; AJvYcCV+Mdyxye5skvjXaRNdQmkwqQd3AbKupi9lnjphLZzlK/lHEa/UJbUC2vtWj+xviNtPG5zJaIO8Z89iIUYX4jGolOgl4g72naJ1720=
X-Gm-Message-State: AOJu0YxMa+Z1UbCZc+2cvFH/AN+4X/0as1s6qpc8i3u3KUZMUdGAXLXj
	vAnWX0mumL9VNZYIe8I0DuMQ8/jTVzLqCtM9bc29XmirIuCqrP0GHWoESB4whw==
X-Google-Smtp-Source: AGHT+IGsARJlgHvDgvWmcjNwPLv+5uq/YQgAXjNfbVxLivFGGrUWgxqVUbJhiAqfSDLDKk6CEVMb3Q==
X-Received: by 2002:a17:902:7204:b0:1e0:11a4:30e0 with SMTP id ba4-20020a170902720400b001e011a430e0mr13693003plb.19.1714457633953;
        Mon, 29 Apr 2024 23:13:53 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:13:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 00/10] PCI: endpoint: Make host reboot handling more
 robust
Date: Tue, 30 Apr 2024 11:43:41 +0530
Message-Id: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABWMMGYC/3XMQQrCMBCF4auUrI1k0pgSV95DXLTNtB2UpkwkK
 qV3N+1GRFy+B98/i4hMGMWxmAVjokhhzMPsCtEO9dijJJ+30EobVYKRU0sSp04yPgJfZW3RHhp
 QZV05kdHE2NFzC54veQ8U74FfWz/B+v5NJZBKWigN2ha8cXC60Vhz2AfuxdpK+uONgh+vs3eV8
 g061Tjnv/yyLG/9c8ER7QAAAA==
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
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CGUrm1vDZYlEmiR1ifXVGyQ3SZsQMUvdsEPtlsZS1l8=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkgz6JFSqy7Q1Lt6/6XMf74m34r5t54fYXkVojbbqGWpq
 qesdaRrJ6MxCwMjF4OsmCJL+lJnrUaP0zeWRKhPhxnEygQyhYGLUwAmwm7C/k/P68wCDj4/s39f
 FkgmblgmV87KcPKI7wJf4ZaTWnHbck8rn2s0KvWTf/fGW2PeLt5dCVIhKgUMPQYLa7wkKviWhL9
 inlL9d3ah5RfBnICKVcu+xysYq9qs/7Nx3k/zI7/F1X9YG07xj2a+4vIqa7n7r/9S58WC3GLuxU
 d2Tvy1s8FE6a11jYdn84GCNc/Kj+1ceonTcY9/1bVL2pETPU4/3b9A71JyiMuzgjZPD5G5/rtV2
 W9M8ryXetKpM/ThMUadc175yqdY8h7a865c0Sro2P31XO96d13hGyfmMW4ufsTmGWHnUilimzZp
 8XHeC3c3BTf+WuKxuDSIM+ZTUYq2j5eNgK+2y+XZk2oMAQ==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This is the follow up series of [1], to improve the handling of host reboot in
the endpoint subsystem. This involves refining the PERST# and Link Down event
handling in both the controller and function drivers.

Testing
=======

This series is tested on Qcom SM8450 based development board with both MHI_EPF
and EPF_TEST function drivers. And also by Niklas on Rockchip platform.

Dependency
==========

This series depends on [1] and [2] which are currently in pci/next.

- Mani

[1] https://lore.kernel.org/linux-pci/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org/
[2] https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v4:
- Reworded the pci_epc_bme_notify() Kdoc (Bjorn)
- Added a patch to drop 'Link is enabled' for BME event (Bjorn)
- Collected tags from Niklas
- Rebased on top of pci/next

Changes in v3:
- Dropped the patch that split epc_events into two
- Added a patch to rename BME to Bus Master Enable
- Added back the comment for REBAR
- Switched to cancel_delayed_work_sync() for Link Down event
- Rebased on top of pci/next
- Dropped the tested-by tag from Niklas as I'd like to get this series tested
  one more time due to changes
- Link to v2: https://lore.kernel.org/r/20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org

Changes in v2:
- Dropped the {start/stop}_link rework patches
- Incorporated comments from Niklas
- Collected review tags
- Rebased on top of v6.9-rc1 and https://lore.kernel.org/linux-pci/20240320113157.322695-1-cassel@kernel.org/
- Link to v1: https://lore.kernel.org/r/20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org

---
Manivannan Sadhasivam (10):
      PCI: qcom-ep: Disable resources unconditionally during PERST# assert
      PCI: endpoint: Rename core_init() callback in 'struct pci_epc_event_ops' to epc_init()
      PCI: endpoint: Rename BME to Bus Master Enable
      PCI: qcom-ep: Drop 'Link is enabled' from the debug message for BME event
      PCI: endpoint: pci-epf-test: Refactor pci_epf_test_unbind() function
      PCI: endpoint: pci-epf-{mhi/test}: Move DMA initialization to EPC init callback
      PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
      PCI: endpoint: pci-epf-test: Handle Link Down event

 drivers/pci/controller/dwc/pcie-designware-ep.c | 104 ++++++++++++++++--------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  13 +--
 drivers/pci/controller/dwc/pcie-tegra194.c      |   1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c    |  47 +++++++----
 drivers/pci/endpoint/functions/pci-epf-test.c   |  95 ++++++++++++++++------
 drivers/pci/endpoint/pci-epc-core.c             |  60 ++++++++++----
 include/linux/pci-epc.h                         |   3 +-
 include/linux/pci-epf.h                         |  10 ++-
 9 files changed, 231 insertions(+), 107 deletions(-)
---
base-commit: b4d6d92902f50a577021f2cc08ac680b10658aca
change-id: 20240314-pci-epf-rework-a6e65b103a79

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


