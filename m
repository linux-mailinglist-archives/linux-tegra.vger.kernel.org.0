Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8ED32983EF
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419280AbgJYWSO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419274AbgJYWSM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:12 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F72C061755;
        Sun, 25 Oct 2020 15:18:11 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id l2so9443951lfk.0;
        Sun, 25 Oct 2020 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6QJDI1YKx5QSO79cqeQ+l8imAvRTGc6dD75cCnK2GBU=;
        b=dyNZGIaN3X+RyJfWixvkhtBQPlv1jsOfRbqwYLHlTjd5eg4Vj+EApXjrzs8gRJsB5m
         s+ISVEVe2EdkGRqlA9XskBxkLihXIbgW/Y4zpK93ncBJL1TWvar/zN0uo73J4FmuiFrP
         VUO8sI/sovGKkHbLD28E03ZcNS0dRJyf5SPsXRhL8Sc2gqmOSVpQf9jS3O6Jf6k1lKZt
         jk/rIjGDd/EpmgR8TrYT06v+oTCDwBSKqUp1yP1agkVakdVZLrfN99EcKnb7o6W+ucb5
         WaBU1xBYEUbH4mhZvZ2iDWZikF3xrt6L0iifrUnxvqmO6ibbNROzjFbfRJahfD9EfPY/
         HQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6QJDI1YKx5QSO79cqeQ+l8imAvRTGc6dD75cCnK2GBU=;
        b=BmDQG8OH4U2IgPxbAqtvRnhXalitzvthAuBvIUMvadmf+UPs3719uih9eMMaFdKJJW
         ZYjYuTM7sYL1y3UStFQXtvBa9cMQrFeRnTmbOiDHQ/7XeIOdJ3l6bP5yCYQ72n9D6hRt
         n+7mVreW8m18dLOYb7egz2VTv9qNKzF8IllHNcH7Dj06+2Xr/3Z9lRZicNgU/ZRPfFrv
         dVYdAnRy44+Lgc5132V/C8KaGR2s8u3zkawe4WOnHRHUh3QBoa7Mu43P0V4F4hBYBpoR
         vReuYPpcwyrbyonA+JuwFmSOIHq4PmNDOrJKfVIpvD+SFYwbrr5hJ6q8LyPFZI6eRgVD
         P4AA==
X-Gm-Message-State: AOAM533j45vF2q9wTmc4rtJwSLf6KgrwdClbZYpZpNJFR9Mbuw0r9Wd8
        7u0JzHKzrbBpdHoAodCCrro=
X-Google-Smtp-Source: ABdhPJwj94f1hVwQbK03q7sPSybJ+AvCpZfXogTl2CGTVrgS2G/eeUdR980oPkgS75puKPBsDYn65w==
X-Received: by 2002:ac2:558b:: with SMTP id v11mr3792425lfg.416.1603664290263;
        Sun, 25 Oct 2020 15:18:10 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 19/52] dt-bindings: memory: tegra124: Add memory client IDs
Date:   Mon, 26 Oct 2020 01:17:02 +0300
Message-Id: <20201025221735.3062-20-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Each memory client have a unique hardware ID, this patch adds these IDs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/memory/tegra124-mc.h | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/dt-bindings/memory/tegra124-mc.h b/include/dt-bindings/memory/tegra124-mc.h
index 186e6b7e9b35..7e73bb400eca 100644
--- a/include/dt-bindings/memory/tegra124-mc.h
+++ b/include/dt-bindings/memory/tegra124-mc.h
@@ -54,4 +54,72 @@
 #define TEGRA124_MC_RESET_ISP2B		22
 #define TEGRA124_MC_RESET_GPU		23
 
+#define TEGRA124_MC_PTCR		0
+#define TEGRA124_MC_DISPLAY0A		1
+#define TEGRA124_MC_DISPLAY0AB		2
+#define TEGRA124_MC_DISPLAY0B		3
+#define TEGRA124_MC_DISPLAY0BB		4
+#define TEGRA124_MC_DISPLAY0C		5
+#define TEGRA124_MC_DISPLAY0CB		6
+#define TEGRA124_MC_AFIR		14
+#define TEGRA124_MC_AVPCARM7R		15
+#define TEGRA124_MC_DISPLAYHC		16
+#define TEGRA124_MC_DISPLAYHCB		17
+#define TEGRA124_MC_HDAR		21
+#define TEGRA124_MC_HOST1XDMAR		22
+#define TEGRA124_MC_HOST1XR		23
+#define TEGRA124_MC_MSENCSRD		28
+#define TEGRA124_MC_PPCSAHBDMAR		29
+#define TEGRA124_MC_PPCSAHBSLVR		30
+#define TEGRA124_MC_SATAR		31
+#define TEGRA124_MC_VDEBSEVR		34
+#define TEGRA124_MC_VDEMBER		35
+#define TEGRA124_MC_VDEMCER		36
+#define TEGRA124_MC_VDETPER		37
+#define TEGRA124_MC_MPCORELPR		38
+#define TEGRA124_MC_MPCORER		39
+#define TEGRA124_MC_MSENCSWR		43
+#define TEGRA124_MC_AFIW		49
+#define TEGRA124_MC_AVPCARM7W		50
+#define TEGRA124_MC_HDAW		53
+#define TEGRA124_MC_HOST1XW		54
+#define TEGRA124_MC_MPCORELPW		56
+#define TEGRA124_MC_MPCOREW		57
+#define TEGRA124_MC_PPCSAHBDMAW		59
+#define TEGRA124_MC_PPCSAHBSLVW		60
+#define TEGRA124_MC_SATAW		61
+#define TEGRA124_MC_VDEBSEVW		62
+#define TEGRA124_MC_VDEDBGW		63
+#define TEGRA124_MC_VDEMBEW		64
+#define TEGRA124_MC_VDETPMW		65
+#define TEGRA124_MC_ISPRA		68
+#define TEGRA124_MC_ISPWA		70
+#define TEGRA124_MC_ISPWB		71
+#define TEGRA124_MC_XUSB_HOSTR		74
+#define TEGRA124_MC_XUSB_HOSTW		75
+#define TEGRA124_MC_XUSB_DEVR		76
+#define TEGRA124_MC_XUSB_DEVW		77
+#define TEGRA124_MC_ISPRAB		78
+#define TEGRA124_MC_ISPWAB		80
+#define TEGRA124_MC_ISPWBB		81
+#define TEGRA124_MC_TSECSRD		84
+#define TEGRA124_MC_TSECSWR		85
+#define TEGRA124_MC_A9AVPSCR		86
+#define TEGRA124_MC_A9AVPSCW		87
+#define TEGRA124_MC_GPUSRD		88
+#define TEGRA124_MC_GPUSWR		89
+#define TEGRA124_MC_DISPLAYT		90
+#define TEGRA124_MC_SDMMCRA		96
+#define TEGRA124_MC_SDMMCRAA		97
+#define TEGRA124_MC_SDMMCR		98
+#define TEGRA124_MC_SDMMCRAB		99
+#define TEGRA124_MC_SDMMCWA		100
+#define TEGRA124_MC_SDMMCWAA		101
+#define TEGRA124_MC_SDMMCW		102
+#define TEGRA124_MC_SDMMCWAB		103
+#define TEGRA124_MC_VICSRD		108
+#define TEGRA124_MC_VICSWR		109
+#define TEGRA124_MC_VIW			114
+#define TEGRA124_MC_DISPLAYD		115
+
 #endif
-- 
2.27.0

