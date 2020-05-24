Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D101E0147
	for <lists+linux-tegra@lfdr.de>; Sun, 24 May 2020 19:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387656AbgEXRwr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 May 2020 13:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387766AbgEXRwr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 May 2020 13:52:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E41C05BD43
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w10so18457719ljo.0
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7aR3YE6Bd8ZKirlEsF7qmRCiqSqK5gXeUv4sa0t1B5c=;
        b=tMPJkT7nYXzIltgSxd8IMB1ZfmKN7RQ0Vo6jw6DbXG/aftDjIm52h3KjdYosFIX2sT
         RzGuS+TYtE6hiLTN0iQbigzokbZAKHcxf9wx7XKLCbaQwIdYTpOGaaeT4grZeaKRTk8R
         r+Kd8SsNnkBm1BTxWA4B713AxaeYjTfjYwgvl+CDmulG9VXTFkHhQmVaTfrIKKTp0mVk
         Bhyf5rQbxEPM/uxJ4AE1+NiBHpoeNutdt7uIQSQ451dTP+EgKIcJNGZ3NhKYjiqhewaG
         uMoo4vY6ZHHmtcqJa733wowG86MYgEOB7pfA42MrwsiSfEsXKtGaKKzIj4R71TIQSYOh
         nkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7aR3YE6Bd8ZKirlEsF7qmRCiqSqK5gXeUv4sa0t1B5c=;
        b=qQ84nCxObYjcs8USf6TNDmtu7eeAN+7Ab7eez3Y5z9+kvPoHzV48XfSHwmThYkh+PS
         IYZWKa0STS8c2qaf5s6/rj+VFZSJ2z8DDlbb52bHxvufjjti97hlIhtUh5Gn0VW/tBww
         XBgOKYdlW/Gro+CIXUHuT/tkkNkO+o3X5JPhNxM/oMh/4mApH44YWFGZe38hznPAR0Vz
         qPtgdGDgVGVXRqMfdnErslOyjr708YTn0vjzGmCyEDQEX5HBEy2tgsqml4+sjnJJKR9k
         t4UIWJU9Q8w0xYPnJAMq0a90nmEzVr8h2kDxMLZfn7p5klegEvtK56EzAAyNVUMygLmk
         pRow==
X-Gm-Message-State: AOAM533m5ZmRKtMTihADzFyGWxlZ3LxKV5MB5hxeopqVnmAwPc8sJuJ4
        uzdj1nrxKyvzhGbktoAWFHg=
X-Google-Smtp-Source: ABdhPJx/D1WOpoi7YhAWGUmlWW8wdWMarJABuwSnWKv1uUXtK7oI2xLYIypZ0T3+PlXs0jNbKLMkxg==
X-Received: by 2002:a2e:3517:: with SMTP id z23mr11915394ljz.147.1590342764482;
        Sun, 24 May 2020 10:52:44 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 10:52:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/4] Minor improvements for Host1x driver
Date:   Sun, 24 May 2020 20:50:56 +0300
Message-Id: <20200524175100.9334-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This series contains some minor improvements for the Host1x driver which
I picked up from an older local git branch. I selected the less invasive
and most relevant patches and added one new patch that dumps the push
buffer state, a day ago it helped me to debug SMMU driver issue that is
easily triggered using the vanilla upstream Host1x driver.

Dmitry Osipenko (4):
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 3 files changed, 30 insertions(+), 7 deletions(-)

-- 
2.26.0

