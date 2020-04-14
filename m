Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B261A8E78
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Apr 2020 00:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387646AbgDNWUm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 18:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387609AbgDNWUY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 18:20:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF741C061A0C
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m8so1582048lji.1
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IanTGT4JLaUYeExjen0ircYk6KbuC8FRlHbdSRhOCtM=;
        b=bl100jKADWQVlbJ36fXor3/uCvG6QAoIn6KCILYVOcyY9XsPnwpPlp1C6n32vQ8bU9
         2NrfHrRP5/or7tN+YesuiGzFouJX/S7AhalbsIKuEiWM/YfAiT7P9Uv8Q1URoz22p10q
         7Hy204dq0gYQRqO9S9llwnk5bC/D4bKaxXwixXHnhOihnRdg7lnzn7kQwTjAThJlJ0aM
         huON2WP3ZhR/CJ7xDWAvCcQtzKpilcbdYox29IAD6qxUyyGxK0hLGPLG3CYx55HUFbD+
         2GX08lMVRBy7xyjwVyhRQZqOy7k+oMmwgtbp7g/zjYMtOWfyZzDQnnazm6rWOBi0ya3i
         /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IanTGT4JLaUYeExjen0ircYk6KbuC8FRlHbdSRhOCtM=;
        b=A+nv5Hll51JVRpOxYkb2e195jYxj5gl+N735g+ceRlsN4AgXexu/8HKGf1BC0zM1G1
         q6AIgF3Q/WPfMjiMHeqb3ydhL780UTX6GVW99Eo4ZkmQaOQSuWIcSBA05p6LTq0zs3xB
         GzXB9IMAOSIcTX/LxRYBxDKtqQAE8GuB/DSEwRdMc/VF28LAUXLcZe3D56cb2PbHb9+q
         lu1ru4zeRrZ1zLDrjl2qUt1IvZdxHSP1B3UZEXMB1OJfYvnLb/8tOZR/n86lodb3viuM
         sfAUJgagHL+hLtrdPaJaaPFhDXp0VLzEBSfIbYAkrGT99PDDD2fjAyFTLOVcmVkTZxy8
         QbOQ==
X-Gm-Message-State: AGi0PuYXn8Dt/7sBQNjPFFc86HSL4L7AruSYI9lodJUHJRv+EChyIKIE
        B8+hNLHeWfrJnH9zz6ptWho=
X-Google-Smtp-Source: APiQypLSmKGG5TvglpjNBeivgLej9mXati8qD/R5WH8zFHo8ltg4UY2cJsms4/ZLmye6r+D2NyzNvA==
X-Received: by 2002:a2e:b446:: with SMTP id o6mr1396694ljm.80.1586902819268;
        Tue, 14 Apr 2020 15:20:19 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:20:18 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
Date:   Wed, 15 Apr 2020 01:20:05 +0300
Message-Id: <20200414222007.31306-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Please note that the first "Support DRM bridges" patch was previously sent
out as a standalone v1 change.

Changelog:

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (2):
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Don't register connector if bridge is used

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/rgb.c    | 21 ++++++++++++++++-----
 3 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.26.0

