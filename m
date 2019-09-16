Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4528CB3D38
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388906AbfIPPEm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:42 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33068 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730616AbfIPPEm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:42 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so410120edl.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZY3aYY86vswV3DsXRQ0PWQCaaBbu+iIfN0NPOCttQA=;
        b=QwPkkJxO9Sp92CZsWFb0EAmAZ/YLG8AwPlHC5Ehaz0vUvvSN7lJbwqtX/k8dzz5CX1
         aXi8LAqwc9y8rB46A2LpLq7zOPtJ1X6c0EeUx7FZBH6NZKaClmWx2ruM/f1FDnPqKZuC
         q4167pfy2r4f087ysHpkEg+dej3wbNTm8/E9vNDieNVtP2NhiND8d8DKn7ZomcgQ6lz4
         9Cq8q//b2/HKVkG+TrNbv0sZ8oYOxSrWbrz38TLvi90fn6U4dV/LWn0OQX9nudoA8A4s
         9Itx4M46PCAhb5YZ5tRz/j6+QFr2oGWMBMK2RIe+UgbB0VkQNMagDIJYKkwaQBHWgRXH
         AEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZY3aYY86vswV3DsXRQ0PWQCaaBbu+iIfN0NPOCttQA=;
        b=DEkmha4dmDlZkKjOnley4+EhPYyHUwNsEf+hzgPmmt7xC7Vkc34xiujDDB11jW4ueQ
         3JcIEy9HJJCEeoIEOfm8aZXNR/TvTYh5yDVEwuM/tIeYBBtUdkoS6stgVjoL3f5VYiXo
         h3taXbXcuSa4V4vEiozBcnjNm1ReC5Jjj6U1+pWACbgKMSEJG4rJIbkB8jNClIjchU57
         txBUd6gs8QR9TaFE6J9dgmPhPgUzoUqVX8OypQzRotFqIr2QTeoPI/Ysn9yI1SNj2riZ
         lejnWPNGKiH8KuT/aVAiDiA1LdT4YfYDG5VIAKdlbcETDhk3HszYqtIf4V/7arenm7JY
         Dhug==
X-Gm-Message-State: APjAAAWqv6OHP25u4hUpjMbZow2mZWQP9GzmhvgvQWjWDJDCYbOiMo2F
        GJ7BiojsK9kpGxZ3k3KuM+w=
X-Google-Smtp-Source: APXvYqzOvpQMxA7hW6uhYAlHtab0KqcMkjyMUpQkYMJ3upTMDg7cRBZjk2h4QS4jlfppgNLZ2NJP6w==
X-Received: by 2002:a17:907:20eb:: with SMTP id rh11mr434580ejb.25.1568646280458;
        Mon, 16 Sep 2019 08:04:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 60sm7199923edg.10.2019.09.16.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 11/11] arm64: tegra: Enable SMMU for GPU on Tegra186
Date:   Mon, 16 Sep 2019 17:04:12 +0200
Message-Id: <20190916150412.10025-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPU has a connection to the ARM SMMU found on Tegra186, which can be
used to support large pages. Make sure the GPU is attached to the SMMU
to take advantage of its capabilities.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 47cd831fcf44..171fd4dfa58d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1172,6 +1172,7 @@
 		status = "disabled";
 
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA186_SID_GPU>;
 	};
 
 	sysram@30000000 {
-- 
2.23.0

