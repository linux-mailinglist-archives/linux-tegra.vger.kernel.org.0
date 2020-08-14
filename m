Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE7C24423E
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Aug 2020 02:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgHNAI4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Aug 2020 20:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgHNAH2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Aug 2020 20:07:28 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469B9C061757;
        Thu, 13 Aug 2020 17:07:28 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h8so3941097lfp.9;
        Thu, 13 Aug 2020 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4lLacyvLIrYeiWmHP096187UyAJzTy3dGk3a3KhpUo=;
        b=hGDR6vm2K7Ni7PB/wQvgEm+hWlCQ7V1VblChEk2FsRHY33HSgz0GOr/37DuqkjHQ3m
         QcGsuw3aDAYr125LkoPZOVo7SGgujRYjGh6qdOzXFlq9I79pXKSq5rzWhKRnZRYwB/z/
         LyFyEhQCYfxJ0EqblpXmabXs8wQMN/aP6dBlTG/qDRNCxK+yOaJSHfJ5kpZUM4lT272w
         eAbvq7R+52o6PTQmUXUVZWGU0q0RlBpIxTerejceGr6Xeq4FJOstfaMFI1iVn6I91ECA
         ABgwMfsdC0GIKhT/CJbB0sbACQ5EqQ8aEjwKbTnBMwEcGQys6f0UZkyjeanaKHUqHIYg
         cQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4lLacyvLIrYeiWmHP096187UyAJzTy3dGk3a3KhpUo=;
        b=dLs/CzWJx4+Xgi/c9nmafiG2+UmTezdkPMhAbjkUYiOKRbV/0oB5uNL3wdCnW7fJ8u
         sSnIgJg67c9cNUTVxoQWOPO59eU3MGrfU7T07oHY4353xhM53WehBD03iDVUprUe//OH
         g019nzRiXr0FatptVCKcaCfgW2WRZYMSWVOjibsC0ckHeXoUn13+iR0VocgixkMTRmgR
         kWyQg6ibknTVtrkSb1Awq5EebJ2unV6nSamCKyymeFEd9/vOgd/KopaIKYos4D8A9i0Q
         qtqvUFmRzh7pH0q7eGXIVxJotGb3gEcHy3MdVKVPsidJ2EIMVF9yfQ0cesGwKgpX1dtD
         cmQw==
X-Gm-Message-State: AOAM532G3Lmqvo8fpa1HR3GZ5179Y6rwQMAM9WVIQEJbf6m2Brzvm6E8
        rbjU/bxzQgWR5viYpQ5Gi0c=
X-Google-Smtp-Source: ABdhPJwQ/H+7kNWVYOJxS2dTtm7hib9wkxtGTrvmCQhuP+jenbz3a5BR38399JHmIfCotGH0VsEhog==
X-Received: by 2002:a05:6512:1182:: with SMTP id g2mr3355986lfr.126.1597363646810;
        Thu, 13 Aug 2020 17:07:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 17:07:26 -0700 (PDT)
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
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 23/36] dt-bindings: memory: tegra20: Add memory client IDs
Date:   Fri, 14 Aug 2020 03:06:08 +0300
Message-Id: <20200814000621.8415-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Each memory client have a unique hardware ID, this patch adds these IDs.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/memory/tegra20-mc.h | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/dt-bindings/memory/tegra20-mc.h b/include/dt-bindings/memory/tegra20-mc.h
index 35e131eee198..6f8829508ad0 100644
--- a/include/dt-bindings/memory/tegra20-mc.h
+++ b/include/dt-bindings/memory/tegra20-mc.h
@@ -18,4 +18,57 @@
 #define TEGRA20_MC_RESET_VDE		13
 #define TEGRA20_MC_RESET_VI		14
 
+#define TEGRA20_MC_DISPLAY0A		0
+#define TEGRA20_MC_DISPLAY0AB		1
+#define TEGRA20_MC_DISPLAY0B		2
+#define TEGRA20_MC_DISPLAY0BB		3
+#define TEGRA20_MC_DISPLAY0C		4
+#define TEGRA20_MC_DISPLAY0CB		5
+#define TEGRA20_MC_DISPLAY1B		6
+#define TEGRA20_MC_DISPLAY1BB		7
+#define TEGRA20_MC_EPPUP		8
+#define TEGRA20_MC_G2PR			9
+#define TEGRA20_MC_G2SR			10
+#define TEGRA20_MC_MPEUNIFBR		11
+#define TEGRA20_MC_VIRUV		12
+#define TEGRA20_MC_AVPCARM7R		13
+#define TEGRA20_MC_DISPLAYHC		14
+#define TEGRA20_MC_DISPLAYHCB		15
+#define TEGRA20_MC_FDCDRD		16
+#define TEGRA20_MC_G2DR			17
+#define TEGRA20_MC_HOST1XDMAR		18
+#define TEGRA20_MC_HOST1XR		19
+#define TEGRA20_MC_IDXSRD		20
+#define TEGRA20_MC_MPCORER		21
+#define TEGRA20_MC_MPE_IPRED		22
+#define TEGRA20_MC_MPEAMEMRD		23
+#define TEGRA20_MC_MPECSRD		24
+#define TEGRA20_MC_PPCSAHBDMAR		25
+#define TEGRA20_MC_PPCSAHBSLVR		26
+#define TEGRA20_MC_TEXSRD		27
+#define TEGRA20_MC_VDEBSEVR		28
+#define TEGRA20_MC_VDEMBER		29
+#define TEGRA20_MC_VDEMCER		30
+#define TEGRA20_MC_VDETPER		31
+#define TEGRA20_MC_EPPU			32
+#define TEGRA20_MC_EPPV			33
+#define TEGRA20_MC_EPPY			34
+#define TEGRA20_MC_MPEUNIFBW		35
+#define TEGRA20_MC_VIWSB		36
+#define TEGRA20_MC_VIWU			37
+#define TEGRA20_MC_VIWV			38
+#define TEGRA20_MC_VIWY			39
+#define TEGRA20_MC_G2DW			40
+#define TEGRA20_MC_AVPCARM7W		41
+#define TEGRA20_MC_FDCDWR		42
+#define TEGRA20_MC_HOST1XW		43
+#define TEGRA20_MC_ISPW			44
+#define TEGRA20_MC_MPCOREW		45
+#define TEGRA20_MC_MPECSWR		46
+#define TEGRA20_MC_PPCSAHBDMAW		47
+#define TEGRA20_MC_PPCSAHBSLVW		48
+#define TEGRA20_MC_VDEBSEVW		49
+#define TEGRA20_MC_VDEMBEW		50
+#define TEGRA20_MC_VDETPMW		51
+
 #endif
-- 
2.27.0

