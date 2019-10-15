Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198ABD7B79
	for <lists+linux-tegra@lfdr.de>; Tue, 15 Oct 2019 18:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387955AbfJOQ3u (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Oct 2019 12:29:50 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46445 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388047AbfJOQ3u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Oct 2019 12:29:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id o18so24599785wrv.13
        for <linux-tegra@vger.kernel.org>; Tue, 15 Oct 2019 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAzFGzcLL6WAf/z3cyyzneFzX1+V+N4hjXrOwquZa2M=;
        b=o3jhicXQtmz/DSOHvCOjnMHpFbXGymx2Ki6YJHEo/oMfzY26egQxgfjGfk9kZPDrZE
         5yAcYuRtfXxm4M1BktchOWRwOo8l/X8yr8H+rqG34ntMVZVINVqy/QIInxfUBQbfjdal
         U+m5NwKC2SgEopbD+0MjwJcmG/MAloEeuNyT2Eoom2y+Pc0Dhb411nx1OO9m+NOTqL5X
         sXOdDN9BFEE6n5dfWw/+CUSiqMkXZDqQfFVE7ai0ZE2g72S+Q864RwMXBGwQK0HyvKPJ
         IYbCZpkDW15WuGLU+9eGWXOyAmKk/DELFjG6unChFzgzbAzogAezXw0zPeJzDGUbd72S
         lYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAzFGzcLL6WAf/z3cyyzneFzX1+V+N4hjXrOwquZa2M=;
        b=mR8e4mmAwyMnme0v/WGLB+NGSE/BeiQnNTELJNfMbgC/th1KkIX218XSeXl75fGXjY
         HW8yIcyH96Qy4RY00ER5Qfih8R1W4j/1suv2PYixgzhZi/HfPtVyV3Qk2QNtpHc2GWk9
         brcpiVQAmBOQ4XboMr+dcSIH8WbMD+um9BirWepqgmg+5qUwZLf8snAVnCiyeapOiRbX
         j72BCyLt0RIRPrFJ9/cdJCe0Bsd4F1/J/vxAPPTaQEDJEpW+CURupWWcb+aVTthXa40L
         7j4IH4AhBF3kq+U2KXwHZFWQ7HKfcy/QT9DtzBcGjjNiAFf6KlhB53d4mdOgnSSMxgU0
         T+/Q==
X-Gm-Message-State: APjAAAVF9cKrBzfFzACbG0VSmi/m8Wg5tpYzV1V0FW1/7If19xM/D5TU
        CYg8Q+r7CRkwBKLVNvNfyzE=
X-Google-Smtp-Source: APXvYqxY8m6ws0Ps/xNd97nA9lPYvlg6lXyRj0BOkqvzazf9zbQrmyXVV6Scivg7OpPzYnTBcU98ew==
X-Received: by 2002:adf:c98b:: with SMTP id f11mr33393097wrh.274.1571156988431;
        Tue, 15 Oct 2019 09:29:48 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q19sm45324010wra.89.2019.10.15.09.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 09:29:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [RFC 0/3] Introduce memory controller mini-framework
Date:   Tue, 15 Oct 2019 18:29:42 +0200
Message-Id: <20191015162945.1203736-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series proposes the introduction of a mini-framework for memory
controllers. The primary use-case for this right now is to allow for
drivers that depend on the memory controller to defer probe until the
memory controller has been successfully registered.

One example where this is needed is on Tegra186 and later SoCs where
the memory controller needs to program some registers to associate a
stream ID with memory clients. This requires that the IOMMU driver
defers probe until the memory controller has been registered.

This is achieved by providing a trivial memory controller registry that
can be queried.

I haven't written up a full device tree binding for this, but if people
think this is a reasonable proposal, I can flesh things out. Currently I
use something along these lines on Tegra186:

	mc: memory-controller@2c00000 {
		...
		#memory-controller-cells = <0>;
		...
	};

	iommu@12000000 {
		...
		memory-controllers = <&mc>;
		...
	};

Thierry

Thierry Reding (3):
  memory: Introduce memory controller mini-framework
  memory: tegra186: Register as memory controller
  iommu: arm-smmu: Get reference to memory controller

 drivers/iommu/arm-smmu.c          | 12 ++++
 drivers/iommu/arm-smmu.h          |  2 +
 drivers/memory/Makefile           |  1 +
 drivers/memory/core.c             | 99 +++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra186.c   |  8 ++-
 include/linux/memory-controller.h | 25 ++++++++
 6 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/core.c
 create mode 100644 include/linux/memory-controller.h

-- 
2.23.0

