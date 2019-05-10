Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA43019CCA
	for <lists+linux-tegra@lfdr.de>; Fri, 10 May 2019 13:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfEJLfx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 May 2019 07:35:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43708 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfEJLfx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 May 2019 07:35:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id r4so7449940wro.10
        for <linux-tegra@vger.kernel.org>; Fri, 10 May 2019 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=frMaHLtTVcuAjNsj7WkDlL1XY2jsGu/I2uG5ctoh5gA=;
        b=Px0U9D9pEbVq/5gvJ9oo3XEOJrt8sFkwHxHVlbqUNhxJbeQBY/3yP40mhojVl+gpgi
         vBfjHjCLADRiMWyfDl4oUlX1OFU/4faYbxbCmgH2cyFVnsaRAjmz/1SOqj7LsueE7GXp
         NllniShPrftrRES5rrxIbtrvPns76H5YEu6Iu5ce0LnUqZvOYcEgaCIBNbhk8nXCoF2j
         fQJqubBpBpFa10BRHBqyDWELIQam4x9TCUhEgsBHmVcafyn+hbT2mR9ZM2oGl8VKqG6w
         IWjcs28CFrOYq7nUqsOFwj74UKHqLOOTy37V43VKR1wrHaeb7fXyb15y4LlgQb2ZlKgU
         Nysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=frMaHLtTVcuAjNsj7WkDlL1XY2jsGu/I2uG5ctoh5gA=;
        b=dX8SNz16VMJdGfHf6yOFFQ8mFjMyVRghWhXGAU7GrtytSaLYI6pB08jCdZ3QX3A7Q8
         By3oIqw92jmjLoPv2rvYMO2C97DwS72xIeMuDSh5i5yqukrsDMkn/WC2qj+a1fLKYFHf
         VmmPqPjiG/9h+SR5XDi0+59vegmjOtHuZwI6ON7022J4l87YdVOvaca7yQlhlpMCXqYB
         DDtHbIN6VOqpusD5kaDVTSo7iVSrho7LQBC+744i7OfsRBtJ/kjVGbZY/u1oDPpJRaLe
         clA/F9hr9fxY/LT7xsS0zreHhWbwXMlW+i1aNQz68cGUGDpAB9PnMODTJqZMsp9Wirt9
         5yrQ==
X-Gm-Message-State: APjAAAUN8ip/ARDsgti4gtKlOSUuH8Khkn7NHND6tTyt4Ymp+G0UJsKc
        wsmbyOAxd/r778kAd68ADfI=
X-Google-Smtp-Source: APXvYqymwHDZ4aqfYbTTNgpiU1guU4StpI08Kfg1JNbrZAJrlOIjlG9XYDjkLh1+Dx6Sb+OoP1OGfA==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr7766060wrr.122.1557488151914;
        Fri, 10 May 2019 04:35:51 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v189sm8080721wma.3.2019.05.10.04.35.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:35:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v5.2-rc1
Date:   Fri, 10 May 2019 13:35:46 +0200
Message-Id: <20190510113546.15698-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190510113546.15698-1-thierry.reding@gmail.com>
References: <20190510113546.15698-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 2f03e39b5bfe41f3a0d9a8b01231e7e5045cb9c4:

  arm64: tegra: Remove regulator hacks on Jetson TX2 (2019-04-17 16:48:44 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-dt-fixes

for you to fetch changes up to 7278358407be770130b6b72567c1b5831c6eef28:

  arm64: tegra: Disable XUSB support on Jetson TX2 (2019-05-08 14:42:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.2-rc1

This contains one patch to disable the recently added XUSB support on
Jetson TX2 which is reported to cause boot and CPU hotplug failures in
some cases and doesn't allow the core power rail to be switched off.

Furthermore there are some changes to enable IOMMU support on more
devices. This is needed in order to prevent these devices from breaking
with the policy change in the ARM SMMU driver to break insecure devices
that is currently headed for v5.2.

----------------------------------------------------------------
Jonathan Hunter (1):
      arm64: tegra: Fix insecure SMMU users for Tegra186

Thierry Reding (2):
      arm64: tegra: Enable SMMU translation for PCI on Tegra186
      arm64: tegra: Disable XUSB support on Jetson TX2

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)
