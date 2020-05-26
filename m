Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90FC1B33B8
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 02:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDVAB3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Apr 2020 20:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgDVAB2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 20:01:28 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CB9C0610D6;
        Tue, 21 Apr 2020 17:01:27 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r17so174175lff.2;
        Tue, 21 Apr 2020 17:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0t5gNUP0QlLeSdhhI5lUZyouRndnOuc6Cm868DVn5x4=;
        b=C9dCHKDMYjlyqKMXfoTEXm4cBF1QTwEq2aW6GFPYZKbiwVEI7FYoyHrR7nBw616ozS
         SXvQAsZs/tNVuUAJC1veEfPepyguzU49gEwWuIr2DstaPj0MgGqfJTWViq9zSK+ujMk/
         KdGNH7mvrkdisYFmDAdUyTnBCQUz9b6q4/NP3haayykoYJ8WAKge+5i/GDngFmU9Uphe
         YpbOjfEnnjZeBpSvLlOuu84AIQmIcK2ovnqApaBntdsmJVzJlgoyn9lCfWfTo2hlSV7p
         K9lMEgmpMK5IXV2jxosx2S4CtmtnwDuuIzGRf2qYPhiW7WYWIinAk8jkKJS0lopRDg8c
         9+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0t5gNUP0QlLeSdhhI5lUZyouRndnOuc6Cm868DVn5x4=;
        b=iOuhaWzNDb03GXjj0FtaAwWS0DQJXgBZc2CAszHblNfH5Mo4z1D7HAM5R4QCvO7qWn
         LOslrsAbjdu+b2aIULqAKh42e+kKqoWF4Q9kFC0OHjPBdpA9wTJsHLuXvvezYDf7KODf
         nQZs4WAlVtw+6DlnMd3a83Tib11nQZ/sr8KKG3IdDnC+wTGu5VV6XNxEHIg3hJxPEaPV
         LANEY/iQrVCxxQEMzWyT50V58LGtVlVyjCwmNCF7LQlnWZIrxYJng2oWZ32oNkofD3Rh
         tzAoYRAAoLM6wEeu2Gr1YW3TEvs9+BalN9QroM8Rww9qarfq9owDBDO8u76QZzZMaPNK
         ReOQ==
X-Gm-Message-State: AGi0PuZPdDOi49ifgj/RMTvo5gQkr1y1Oz/BJAIahAFTODkrampMF70m
        Ghfw0Mj2E8KMhd/3xWylPlo=
X-Google-Smtp-Source: APiQypIXAMTqwXp8UI3TZbqv4nKLZPVkagzwqhaanAkKwhpx+Rr9GFPZEOYy2p0kOAkiCnYVdjaWqg==
X-Received: by 2002:a19:c64b:: with SMTP id w72mr15024972lff.82.1587513686233;
        Tue, 21 Apr 2020 17:01:26 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id y9sm2933425ljm.11.2020.04.21.17.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:01:25 -0700 (PDT)
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
        Matt Merhar <mattmerhar@protonmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] dt-bindings: Add vendor prefix for Acer Inc.
Date:   Wed, 22 Apr 2020 02:59:40 +0300
Message-Id: <20200421235943.13627-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200421235943.13627-1-digetx@gmail.com>
References: <20200421235943.13627-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Acer is a hardware and electronics corporation, specializing in advanced
electronics technology. Acer's products include desktop PCs, laptop PCs,
tablets, servers, displays, storage devices, virtual reality devices,
smartphones and peripherals. Their web site is http://www.acer.com/.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e9a6dd6b03a2..315cf1de4b34 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -27,6 +27,8 @@ patternProperties:
     description: Abilis Systems
   "^abracon,.*":
     description: Abracon Corporation
+  "^acer,.*":
+    description: Acer Inc.
   "^acme,.*":
     description: Acme Systems srl
   "^actions,.*":
-- 
2.26.0

