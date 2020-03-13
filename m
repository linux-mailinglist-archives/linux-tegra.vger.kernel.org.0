Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BF4184D1D
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgCMQ7O (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41257 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id s14so13021938wrt.8
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GkSp53UqxGMezb98No71xXKz4FloCnxhdFK1fZRjBd8=;
        b=bq7JoO/XL/9E3wNqSP/iDNW7nPnI/h2Snjc+Q5S6MUMrKp2PKhjoQlXdYBtkFw8hJI
         BIe7F1U3egDJQxnSisgIVqxh5SK/awvgeeS9/Byk6bm2+dhaMml1bQbs+gCXWOfh7vbi
         LGik2/w2JmqwwpDCmjFlbuJHCpv4/p+XImoQYhaH09/WCxlpDqgk3YZog8jferWAazFt
         pzu+LDaFbjZn2yC9KRJj/q0NmNprEPVJWExR0YdPolcm20++kv1+67Kc6W9KnnLbiPvf
         XSf7aPE0LSSQ7dUbkgFHsNeqjVaTDE5JqdbfTA3GfI753mKzha2qfOwPOcDZqHptCZIt
         aFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GkSp53UqxGMezb98No71xXKz4FloCnxhdFK1fZRjBd8=;
        b=rgT2VMxmk8nlYyjugFSekzhO3vPh9/5VpOqj7N8b/9WEpOsCkAoTUmVh1tXjulIzy8
         9gKthyS7EM5Y1ZBf/qLqu1eN7hXGq5Zj8Pti94wEudwRs7Wh8oaEdoHo6qQRH3+ZxRo7
         vqdxQuRKUhLfZKlQXiTfmSdmnktRfihnIR8tBvNyVLrl4xCE4c+ZhvlOtBVX7KKux1x8
         hcmSlQlBjNTd5JHwFOwbPV1TaNhrU8CmRF2ExOFUHShBKvDbRHlzv1MDOI5PSHBgwsgi
         yXuzGLGWODey8Nsj7/M7FTrmho5IExVdcHWa1UCv+rnyMf+tktmHmoGbH1YcHya1S412
         DJew==
X-Gm-Message-State: ANhLgQ2xD1pMAeYfFv9kX2vlwaEdAWVnZW/uP1Dt5HWch0RdDQOUZY8k
        Z2lXALGhKR7obKb73G3/2nA=
X-Google-Smtp-Source: ADFU+vvD3V+yfjmMIN67TowA6OWpsOR4dkiJKy19dn7YAj+wM7wURdDPFxgQlMh3kK9rVMHUP1VpJg==
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr3210545wrr.80.1584118752608;
        Fri, 13 Mar 2020 09:59:12 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id e1sm69648524wrx.90.2020.03.13.09.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:48 +0100
Message-Id: <20200313165848.2915133-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-phy

for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:

  phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +0100)

This is a dependency for the USB changes that are also part of this
series of pull requests, so it was deemed easier to take this all
through the ARM SoC tree. The patches have all been acked by Kishon.

Thanks,
Thierry

----------------------------------------------------------------
phy: tegra: Changes for v5.7-rc1

This set of patches adds role switching support for the XUSB pad
controller, which will be used by USB host and device drivers to
switch between peripheral and host modes.

----------------------------------------------------------------
JC Kuo (2):
      phy: tegra: xusb: Protect Tegra186 soc with config
      phy: tegra: xusb: Add Tegra194 support

Jon Hunter (1):
      phy: tegra: xusb: Don't warn on probe defer

Nagarjuna Kristam (5):
      phy: tegra: xusb: Add usb-role-switch support
      phy: tegra: xusb: Add usb-phy support
      phy: tegra: xusb: Add support to get companion USB 3 port
      phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
      phy: tegra: xusb: Add set_mode support for UTMI phy on Tegra186

 drivers/phy/tegra/Kconfig         |   1 +
 drivers/phy/tegra/Makefile        |   1 +
 drivers/phy/tegra/xusb-tegra186.c | 261 +++++++++++++++++++++++++++++---------
 drivers/phy/tegra/xusb-tegra210.c | 131 +++++++++++++++----
 drivers/phy/tegra/xusb.c          | 189 +++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  10 ++
 include/linux/phy/tegra/xusb.h    |   2 +
 7 files changed, 511 insertions(+), 84 deletions(-)
