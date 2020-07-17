Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3C22405A
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGQQNG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGQQNF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:05 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A171EC0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:05 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id br7so11435169ejb.5
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRun0zJnW3enEzbagVrBVwGAXPlB4kcfikfNUNNNDAQ=;
        b=Z0Ly8m9ELBi2tmX5DEpN+QuO/1N7ea5paWLIRdxkSaCxgUG0h/jMfzl+pJZNP3WTgI
         3v0jt4YxY9AaudPOWusk8bqMu5o1gaiVuyHNvbnb5jGsj3uTSxB3nC8GRZuaxLWwjFzV
         rtDqPNSvu0sad+x3K3u+H4cJ8p0xwLE+fp9rZ/zVq3ADApdshh36/jabqq1e9AYrwZRq
         6ja9oebHtw0oC4m+1yZkGYxUh11dqZkJOEgSECX5gYi/4Pf9BMMJYeVMffypG+8b9hBV
         8YJT9sR3adanb+gwGXdek8jVGek/uSvuquAn1KTkjTA4kVhDXQVdMgaW/aZDc76mwx7B
         VD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRun0zJnW3enEzbagVrBVwGAXPlB4kcfikfNUNNNDAQ=;
        b=MGvO8xPWwfU+r9CgxCikSRLyg4kG8lcrnBcXa7kPt+rLnHF//CdVNYbHD68M8+Ezz2
         A+71kpsqkmznCw1/xsgdr5/jdqEX4b4SkqAUi8wYmjGClrJzMZkZ5iNeM42XL9S2VxSo
         S+rI6SunLdjehY3gcRJglH8EPjIuxWJolHc855x5KIbeGpLbrd/Kt6woUU5M29Pdn/kD
         L3utMv338GLypkyt+kLemH2jTcRI0ePI1E0m9UwojmXPTsXQEi57UPm4HZeDChPyYnx+
         QCf+n6oDC2qafr3g9F/jLX6l7c/o09hcHMc+QzxP+OroiiLxpcDv/WMM1rfJTDmOFRBI
         z5gA==
X-Gm-Message-State: AOAM531hAWFf8R9ElgZfnb6DChtYhS02AR/mQIb610D6WwlWCFQ8Oz3H
        jjlsA9z7pv7sKcBo35hnTd3czp6S
X-Google-Smtp-Source: ABdhPJzORx5zjxCvcZOb13Q5Fp9ESAYqkg144nxeu1CB12Wk87oTplKWxkBRAu86BfKWZl7qGJaHyg==
X-Received: by 2002:a17:906:5657:: with SMTP id v23mr9547977ejr.196.1595002383389;
        Fri, 17 Jul 2020 09:13:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x4sm8187889eju.2.2020.07.17.09.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] dt-bindings: Changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:12:54 +0200
Message-Id: <20200717161300.1661002-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-dt-bindings

for you to fetch changes up to 9580a3532eee67d9d19de19f62c245655eabaca3:

  dt-bindings: fuse: tegra: Add missing compatible strings (2020-07-17 16:14:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.9-rc1

This adds compatible strings for some new devices as well as updates and
fixes existing bindings.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt-bindings: Add vendor prefix for Acer Inc.
      dt-bindings: ARM: tegra: Add Acer Iconia Tab A500
      dt-bindings: ARM: tegra: Add ASUS Google Nexus 7

Sowjanya Komatineni (1):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and power-domains

Thierry Reding (3):
      dt-bindings: tegra: Document Jetson Xavier NX (and devkit)
      dt-bindings: Add documentation for GV11B GPU
      dt-bindings: fuse: tegra: Add missing compatible strings

 Documentation/devicetree/bindings/arm/tegra.yaml   | 18 ++++++++++++++++
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |  5 +++--
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 25 ++++++++++++++++++++++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 19 ++++++++++------
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 5 files changed, 61 insertions(+), 8 deletions(-)
