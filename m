Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5134EB77
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfFUPCQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:02:16 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55971 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfFUPCQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:02:16 -0400
Received: by mail-wm1-f67.google.com with SMTP id a15so6612084wmj.5
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3UeGamx7c3i5DciUxpfKXFQToGYb6ITzbTJ2tjH9HM=;
        b=rQoopX6LnMVcryE1dU5rVYgemXNJgmzk3+sClBd7FcWOeIScFvWP6EM20KquW2iLc3
         e+fXk+Yvp5SwnT8iihBznhZ6bMHZ3DZCX7rJsKdgX6HhwoZp9M4JFPIoRXryiYyuw1tQ
         OsZp7xyNRcn5xFpW7aHglr2h2Zw+WfR7ZIwPqog6ITNOGJl/I6/nGuRBi79RvgU6w9sV
         l7vA55ycc33DEAB836icliZj3LJf6lhyqVOdv+9ils1vRHqhgvC5qZgLM3CgHEbs3F/w
         TrFAZpUnkNe3snB01fKHUPU7R6jA6fJ9kixHw/Cku8LAvJg8jPnHjstfF4Hl/7Z0uv69
         CW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3UeGamx7c3i5DciUxpfKXFQToGYb6ITzbTJ2tjH9HM=;
        b=f1fST/rcU6S5AEhmBmcsA4pQVGj6ugMA5j6cSnYfo3+CZrBzFnfX1Z8ShMF5606SNH
         cthApmy9AYtAfxxKDfgH/zgKwuLh9LItEGwdwav8nOKy7sMB0zuym76fXQHWVu31m9u/
         x84rYDwF4+31G1hniLuA2j0g32tZfAWeDbdO2Gt+/05o5KzW8bABG7NUUhrblyJInMVr
         o6PRhjFz75/8xVWgjxRESr9dfN5ghIae6nkr7wEi+VkQEVWCjzMLYmtHauJ5pLiZ4hu2
         428mrc4AieKhvI3JWw3IHksTR5u4TDu1WZ/f46SK1C1ypQvVIh9vxnPFqUUsN5yoUjLa
         uU1Q==
X-Gm-Message-State: APjAAAUW4iBxwQDU8bzwQZDskw5ldwXQBU1VuPkNqPl1RIdW25MHjGZ0
        aZPqJYByEZvYc6CT6tnfpe8=
X-Google-Smtp-Source: APXvYqx3VCD+nt0wDF4LLAqtpSJToQRhAceziOok3sr5oX+Y1epf+0oK6xiMhICzMDnXNvoJXiGrBw==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr4270395wmg.177.1561129334499;
        Fri, 21 Jun 2019 08:02:14 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r5sm5717363wrg.10.2019.06.21.08.02.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:02:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Default configuration changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:02:06 +0200
Message-Id: <20190621150206.19037-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-arm64-defconfig

for you to fetch changes up to 01d6fb565b4a7858af1699727f25da2279d75deb:

  arm64: defconfig: Add Tegra194 PCIe driver (2019-06-20 13:02:27 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v5.3-rc1

This enables the INA3221 power monitoring driver that is used on many of
the Jetson boards as well as Tegra194 PCIe support.

----------------------------------------------------------------
Nicolin Chen (1):
      arm64: defconfig: Add HWMON INA3221 support

Vidya Sagar (1):
      arm64: defconfig: Add Tegra194 PCIe driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
