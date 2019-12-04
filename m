Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27726112C4A
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 14:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfLDNH6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 08:07:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40868 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfLDNH6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 08:07:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so8501223wrn.7
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2019 05:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ux9tITRTJ/K/Qnf2cowWRV/QtrytZWRzAJVLhfRd3HA=;
        b=H2vJTmLCRg2B0vAzcRnFW5l2kcMe9ZMiQmW5lSSXLYs7Gx4zo7g/CsiWsPVgaI1ilc
         wv6bo29fewcdSfV2DAK2WxXKCHV9l6ctdgVbwh4EYnhCJx+rFEnyaMv1oqLIC188qnCy
         d+mej9AsTPL5YF58v6Oc+2ZVG87ok5n+pieT4ovQe5nX34nYv953Rn6Rm0ksOpZYCnfX
         TLvGpWSpLbkGnqajZZBvdYY5UnEWCxsNv83U0S13lwvJAN3rzuXF+FS/HlQlJKZGviYa
         mXKM743d4bTzt2PskNL+QIY21IMCasjcSGJkFflrVQMX8ybMQYNwI7GPQt6nr853pmY/
         WUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ux9tITRTJ/K/Qnf2cowWRV/QtrytZWRzAJVLhfRd3HA=;
        b=Vux860JM2uDef52WBO2zRWtGpOTXw9t2VXuKabrueV2/UTSQv6NZ/Qp4UUKqnBkzZs
         ebxG91kuYreXXSHSmX/QDreSDGNTek4n152S3MvvrdKsbbGxDP3YrXpwuibPREs9LpHK
         cEj2UMCg1yejm1MUI5XeOjo81LVDlF8qtYryKH1JXm9tgB33Z2cHw6sp823Y9wbsmmfW
         acRCSR2azlVK4s3/2ej4Y8AouEe0zn6mESWh5D43BmrHCQD5mcs/REJBC69dOgZ/ejgf
         TetsgqV8Z3nFilvKW61kjy3zMlvNcVOENtOmX6X7t/ddVrD+7ZicaMHLziq0S84hrBrw
         MxYg==
X-Gm-Message-State: APjAAAWrXGwW3lVKDEjDj38Njmd39UrzmNTuxrtJVJNcn7Y6Q2NuDCi7
        +4Bhme2uk2bDkaeoLTHZuLM=
X-Google-Smtp-Source: APXvYqxK3JthT2l0Yj/2dZ39D1HZCIOxy5aGGbAOcYRAPyJaK6c8NE32tB2ZD42/xwsZEruZ3984xg==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr3812995wri.138.1575464876303;
        Wed, 04 Dec 2019 05:07:56 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id a14sm8520219wrx.81.2019.12.04.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 05:07:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     soc@kernel.org, arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] memory: tegra: Fixes for v5.5-rc1
Date:   Wed,  4 Dec 2019 14:07:51 +0100
Message-Id: <20191204130753.3614278-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 141bef44e123c101c0da0443ab6b3cfa750f251a:

  memory: tegra: Consolidate registers definition into common header (2019-11-11 14:55:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory-fixes

for you to fetch changes up to 030d2829f4c22e675e21904f32ab60f659174e72:

  memory: tegra30-emc: Fix panic on suspend (2019-11-18 13:54:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Fixes for v5.5-rc1

This contains a fix for a kernel panic that can occur on suspend if EMC
timings are not available in device tree.

----------------------------------------------------------------
Dmitry Osipenko (1):
      memory: tegra30-emc: Fix panic on suspend

 drivers/memory/tegra/tegra30-emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
