Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5561FB2D2
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgFPNzI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728885AbgFPNzA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB89C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so1732086wrs.11
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=olP45qr5KeADEZvoqRMZU+ClqHkzoNyYBpHFX9f9pGQ=;
        b=Ho4Rse0Ywq4F/Z8vjHvU0Wz9cHaGwRM7ieRbLTn9/NVD74kGUdapuQlfvr/m8P5JC6
         PrmVLyv2eRens2GPlD2Uw9a8VrAoHIgjEAeqk3UxZzD5KHaB/xqQCTi4KdExhGZ4G3cu
         TIlqvDcw2+9KwOKDNn8ET3lGxlRmlzkTPU14vmyIFkQLXrxwziBuP2k1Yst+5kG7n97I
         jI3/5qPRpbWcMvy6+Fp7IGVgLvFVB5gCmg3t41LjDZQPJMO0dQqQltj+SEUdwNyqvgku
         nMEgmd7Uo4v0s/CgRhM35PoH+BZKpH16ZF9mZq5Ws7A2DtTICQz+BE0GLXJeF/m+AtXU
         4COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olP45qr5KeADEZvoqRMZU+ClqHkzoNyYBpHFX9f9pGQ=;
        b=CqiNNgzUsXzuYqGTLUYrdwpwUbHgGwF5AeOk7kCxaa6sAGtiCxM6DE369atmf3o1T+
         a3ayNwSxQbvnbx/Xolv2vRLj4dsjnU9Ux4Hq4b7iJIrLqkkrJcbSZLISuC9Hpfzh62rh
         YzUpRVLFEn6+v2xDIpZdxhrwa5WlAPXmVMD3wcJsqNjp/RMbmvhumMbZdl8Gm9VALVX+
         23Xxq8CRujwXYDwU0C+5G5V9x2K7f+w0ePjXsF218cUIvNXGWqu1XSb7OwApN+pGpPRW
         +Zo4VLctvfnv5L75vjHSGs00VAApdYLWx7PcqWLcsQujh5EHoIB8NHr6iItaKf0EnooM
         Lzhw==
X-Gm-Message-State: AOAM531xDXplkY9WZREHyrpsmtncnKSPhv/hm6Lh2xo3L8ij1YR0LB8j
        zGalNzLAD1j5+qgyrtY1xXugOFLp
X-Google-Smtp-Source: ABdhPJzmG5uaky8oUW6SqvA0o902acZMAesiYYX2cYJ5xDRoDHAG0C3M8tXTBm4V0H424vQYBVffiw==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr3283242wrc.345.1592315698691;
        Tue, 16 Jun 2020 06:54:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k14sm28335712wrq.97.2020.06.16.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 54/73] arm64: tegra: norrin: Add missing panel power supply
Date:   Tue, 16 Jun 2020 15:52:19 +0200
Message-Id: <20200616135238.3001888-55-thierry.reding@gmail.com>
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

This panel supply is always on, so this does happen to work by accident.
Make sure to properly hook up the power supply to model the dependency
correctly and so that the panel continues to operate properly even if
the supply is not always on.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 607d28a6772e..fb27812eace1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1051,6 +1051,7 @@ power {
 
 	panel: panel {
 		compatible = "innolux,n116bge";
+		power-supply = <&vdd_3v3_panel>;
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
 	};
-- 
2.24.1

