Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95436B3D31
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbfIPPEk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:40 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37314 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730616AbfIPPEk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:40 -0400
Received: by mail-ed1-f67.google.com with SMTP id r4so383810edy.4
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RfPuDIoqxO+EfcdiH09cBQD3cfw36Vn5aZ4Gj9bKPZ0=;
        b=e0E6VXzD2e/fPg3Y87nQDpYT5oK/vPxEeE74u2xzyIzPxkVXqyywLX+pyTBXsO3jF/
         fVceGThyKfx259zBhRYDHFnSodJidqwuR4rAivSIALDdwHo9vkrZ5mg31zQIw3S/hwdv
         HmeC6UhF+sMMrW0kLt9Zu2GNv0VVpYOjYTN2xsQs0jO+jgVwavdkxMRbANdRwsV0OrJO
         Fj7+/WRMzpIRI5isY3ntRFBysuu0w3doaJClz5feYyh/T9VmUvYUicluEvnFnIzU2nPQ
         qUPn/eIorX0s/HKEgla8LPxZC032W7xLYcg6h3dRXjZ5XuUhbJLhV/WyJ7RZonn8f4Wi
         x1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RfPuDIoqxO+EfcdiH09cBQD3cfw36Vn5aZ4Gj9bKPZ0=;
        b=iBFMKwNt0yYhdeFlNxVBp1PTMvXidkyVLbf13t9v2mi8OlicjCoosizg73TIPDWDXI
         zvXchXAamp+ZGjlH0z4ht9HedaCcsA39Q5oTkwzb2x1JGfdkqxFKHBTpj+8UUaV8Eqkk
         QEVyaoI0SK6LJLP1qTEEfyESojxJ8gyKrMoYgGxHkWhk6rrG+gjGqrlfSf3jICNEnPVp
         N4dTZaQJGmZEyISairdCkwVHanUeZlI/YTCQwqwrwGi1T0+yeUb47AiYPaotMWxSQvqJ
         VRWG3ysOySFHG1fbb28kMjXDgteKcMDai3PyuNTVov2tR5xaBlfIsR6yr5p4983B2ASu
         BZsg==
X-Gm-Message-State: APjAAAXKXmQ+GvlJvGWO7yFw0ja62KJmopQkaAHSYWBWIOHb91efUP4e
        BE3njvB8hFHyzSdSMSWUmM0=
X-Google-Smtp-Source: APXvYqwlEh/FpKENN0bXpEVTQdvK5Ztr+FswlhvtQ97kRq0zXB5kH9rjGzIek18E7lo9cP4Uc8MqCA==
X-Received: by 2002:a50:d903:: with SMTP id t3mr60797258edj.117.1568646278358;
        Mon, 16 Sep 2019 08:04:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id v10sm7145413eds.75.2019.09.16.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] arm64: tegra: Enable GPU on Jetson TX2
Date:   Mon, 16 Sep 2019 17:04:11 +0200
Message-Id: <20190916150412.10025-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Alexandre Courbot <acourbot@nvidia.com>

Enable the GPU node for the Jetson TX2 board.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index bdace01561ba..6f7c7c4c5c29 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -276,6 +276,10 @@
 		};
 	};
 
+	gpu@17000000 {
+		status = "okay";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.23.0

