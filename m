Return-Path: <linux-tegra+bounces-6001-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC49DA946AD
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Apr 2025 06:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB10D1893E67
	for <lists+linux-tegra@lfdr.de>; Sun, 20 Apr 2025 04:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10819258E;
	Sun, 20 Apr 2025 04:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0++PaRm"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC3188006
	for <linux-tegra@vger.kernel.org>; Sun, 20 Apr 2025 04:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745122509; cv=none; b=s6SAHNDlOECevSMWSxKbPZm3YadzT18yjRbMt4xbIl8EIOjj7FEDRnzmGl08qmP077qe4CGiESLzTP3GAmiTRo0hvn4/xuv0zSha+x3Y9k+lLYiMfuC+XqEKVmm7ZKW9XgPaOBdvJUoTjnpVPkEmzIHPKl5EBM9eoRK3U3On1vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745122509; c=relaxed/simple;
	bh=l/JQQddlhPynwDPY0hqUzEhGKbXSBZE37ftjqTkM7uw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tMS0fSTMuEA+Qh6px/C4PC0BmSf5LOqiGPrRDHhPFmo/WI+s8I+Sbne+fRETxNUfSiJ+m996w4q4G3SjboTd7q3S9NNCrjUWPhZyCyU4ZG7l1XsYiFCHj2G1pisUh4fhhLm+mPByed99kJbW7p2ZCNP5bLAFLTlFpUp9bcYncis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0++PaRm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224341bbc1dso28688045ad.3
        for <linux-tegra@vger.kernel.org>; Sat, 19 Apr 2025 21:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745122507; x=1745727307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWq/yk6egdF/dXjQzH1qk63eH8P6QSiGPtgR+xWOm0g=;
        b=x0++PaRmLDoHAJ78CbRoeeO9R+zELfcHVkmVZ8WBOWNAcaFAhEWISbLWimo6WRA9bO
         HlMIs7fF/8kuwMRdXKFs8xWVMV+eHzqCwIm3m9PNX6IaJL3MKY0ac32kiC33DhJSGHjC
         uQ7GuwIxisQbaeId0vOxL/TyrX1LeF+vcAsAwc1h4Gj0OY5h4dwBd/SD9fs73qqpU3W9
         rnTeEaFbhW/hWTL1bk+M56LcOD6OppbnzG3/vwmL6zo/MqYkUj5vedlPLfXldCZjWlFf
         bENaQk7iIgvKOM0MbX/5wRNJHHinmrz7HJlinhfWb5m/CL8HPJMwivT8urp/Y82KzPyh
         SGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745122507; x=1745727307;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWq/yk6egdF/dXjQzH1qk63eH8P6QSiGPtgR+xWOm0g=;
        b=XaW3IbdV7gaUxE1oA7LycClU2JgWUpb7jzVNgKDPp7cGhGEt/sNcTy/ONDfLuzFetq
         fccEKwY+BBYDGrVEvzdWy8tK1cNRm4JYTNrzdTL+iRZsbLj2phjACsF7D7lcrBjQHp8D
         VBX/CrGVv6fCd+Ol6vpQ20oXxy65M0Na7VG1hy2vtPa5wd2hDhxYMPyC9kFTjtF9bAvl
         TpWah7pYAtvAJkW5L6kScgbaOUTbWwaXek1qE2LBU8jiPPVcJRTDhxyzztyZH4qZDF/n
         46EYmgNs142D7emSbiIQ6bxER0r/KS9FgmHqHVgQqChR+wJbWkuR83M/V7XZUrM9pAsx
         xJiw==
X-Forwarded-Encrypted: i=1; AJvYcCVwRsDP9rjOtPIEjqmTEP0NvBPj3zVfNBiIMjzYHGsie1pHYCR/VVnYrI52QVGwsYFNjPrKOWb7VvMO/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweDIl+Ou/UGkxjK9Wh+S/MiIXwzyY0mn2CfG/DWGvjvER9kCO6
	pHAMASfJ3bzBGMwSF+RSvO7jlfBHFVrH+EWumoawDFCnvVrrIQwwMRzcC6I7Ag==
X-Gm-Gg: ASbGncuUSTj9JlQeHGajN+iUSXpBXrULcN0Vix6+fRjXLvE5TpbjN+6YilCz1fWGGkg
	mmQOyOfw8zTbjbruHnGCM4Q4mvwZPrgn6mOfy/ZRhlc98Q1JaXzluxIGgqo+HpCEEUlZDdcq7Ig
	sl9IwiSBDNSikYDtkpUL9R6P69C+OL8TmLlFOPj8MLBwuxP+MAVMD2k/SPXrtX9cooaHOlUl51r
	qrYgFgvrskq0dQbOY5Ludvej/64UVaHHl9PyuqXgoTWmYs+uK3FJcaZ4wI1dQLTR5PP8JBn+98Z
	6YVTBWzUe3Hpbyw/yEbm5W3FpkiAxzOngRvWoXRtvmC2uBxsZDfgEw==
X-Google-Smtp-Source: AGHT+IEwT70MqJZh1REZd2GwFUgsulJR3hGmpXtb4k2hyt7Uf4STg11Rb+IyyGIokskY4EblKXX3ZQ==
X-Received: by 2002:a17:903:1a24:b0:223:47d9:1964 with SMTP id d9443c01a7336-22c53607709mr128586875ad.34.1745122506897;
        Sat, 19 Apr 2025 21:15:06 -0700 (PDT)
Received: from [127.0.1.1] ([36.255.17.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde851sm41412575ad.239.2025.04.19.21.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 21:15:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250404221559.552201-1-robh@kernel.org>
References: <20250404221559.552201-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Remove obsolete .txt docs
Message-Id: <174512250279.7011.5486812509432679947.b4-ty@linaro.org>
Date: Sun, 20 Apr 2025 09:45:02 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 04 Apr 2025 17:15:57 -0500, Rob Herring (Arm) wrote:
> The content in these files has been moved to the schemas in dtschema.
> pci.txt is covered by pci-bus-common.yaml and pci-host-bridge.yaml.
> pci-iommu.txt is covered by pci-iommu.yaml. pci-msi.txt is covered in
> msi-map property in pci-host-bridge.yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: PCI: Remove obsolete .txt docs
      commit: 7ab8db9042cb37222bebf77beeb1ff4df0789a84

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


