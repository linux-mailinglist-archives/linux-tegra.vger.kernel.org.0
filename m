Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FF61C4BF3
	for <lists+linux-tegra@lfdr.de>; Tue,  5 May 2020 04:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgEEC0s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 4 May 2020 22:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727892AbgEEC0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 4 May 2020 22:26:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9B1C061A0F;
        Mon,  4 May 2020 19:26:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g10so47385lfj.13;
        Mon, 04 May 2020 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LSop2fRHEeN0n5T5a31s3xV0wqW+LOYJC5cXPalZm5Q=;
        b=ofiVcIPz+Uik2ILURgqe0twV1Goq05mT9MzhpzrtZjuu/cD86H7PujTF6KYSjxZecV
         4u9oEINEy/CqVHpErcptTwm31EfylaVCFCIU3G4JvzDO6TaOtPJyfIXg/XcEkxWnXhBW
         3jvUbXR/eu4OpZsS9d3MQ0DhdBsUQvUEnYijIQ3jjjU5vzxeCV7akog0nGOLp6sXiyS8
         IxuNDUJ4c8jAOI/4ab/f8Gk6ZmbgXmVuRWXwxb5U2tfmtJzpi7k+jftEjFbryTmF90ln
         4uoq0ND0rhXAlKHOaNVlK2xXh3RjgNzDhC5/mE59BPKK4ecvAWusDUUB/N08PQdk9fb2
         GT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LSop2fRHEeN0n5T5a31s3xV0wqW+LOYJC5cXPalZm5Q=;
        b=kIJGfbMUabguEAhnvVG4oIdkwa5jCgEuietfSS6K+h3b22ZrciVMI70crNr/vNj0KK
         7oHHWUjBXbqvaNkP8oqLrnL7aMbj3ZjKeWX9KLEqGBVe1wAUuSactZH0yuFEAQ1V2bva
         o47gXQYUTPSVBS+uO6jtoWtcTmIHzJ5UiFl2myE/yB4uGOpR7MoYFE0pTn8Vxc9v0D1O
         ioTAN2DA5H88fY6p2VwxWsYEQBMDnorcTOUfmv36FkCoujpzzpXo/w4ObVYVFk4Oqwg4
         kS6y1Muu8mDY3DOR+kGY5XRMH4Zr+TnNGQMFiqe14CWIGZOasjadGybWm2wCmhV6kCge
         TcOQ==
X-Gm-Message-State: AGi0Puaq1BKOIozJV9gGlInhlaB38+guNwOcRCJu3UFkaVj/x343v9Lr
        CBOF3T5OYmvbvyzXU/YhqaE=
X-Google-Smtp-Source: APiQypISljSrRAPy9Ky1Jn9Gj8bDbQ+6f2+k6Tlqckt2oMzupE+5fbsYRt6IIJdft2FXxm73Cnjkbg==
X-Received: by 2002:a05:6512:1044:: with SMTP id c4mr75217lfb.7.1588645605295;
        Mon, 04 May 2020 19:26:45 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id l25sm449251lfh.71.2020.05.04.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 19:26:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        =?UTF-8?q?Pedro=20=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
Date:   Tue,  5 May 2020 05:25:16 +0300
Message-Id: <20200505022517.30523-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200505022517.30523-1-digetx@gmail.com>
References: <20200505022517.30523-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a binding for the Tegra30-based ASUS Google Nexus 7 tablet device.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 7fd0b66c69b2..fb3bbf7a5fb4 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -62,6 +62,13 @@ properties:
               - toradex,colibri_t30-eval-v3
           - const: toradex,colibri_t30
           - const: nvidia,tegra30
+      - items:
+          - const: asus,grouper
+          - const: nvidia,tegra30
+      - items:
+          - const: asus,tilapia
+          - const: asus,grouper
+          - const: nvidia,tegra30
       - items:
           - enum:
               - nvidia,dalmore
-- 
2.26.0

