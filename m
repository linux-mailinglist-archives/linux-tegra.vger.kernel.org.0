Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E176C45A5
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbfJBBmF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36371 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbfJBBmF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id o12so24310767qtf.3
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xit24kqcKOsHmHtuflSHWZ7nJpkGllTJJ3cdJK9yAI0=;
        b=U++yVZAnOvkQ5/PJZnYthLb4oO/9xi3Ch/Gs8mOeuywU6Nr90e7ilIC2jH4quqdDyA
         wjr7GsoJvlUy3SS08E76WddRjn3Q5TfHS4wy6PGUpx4X5bsOtIRazlcJGJuMGNscIe+r
         qegorLgPGtWPCSE2TGZBV9s/jkDSDQHzRdu4hfm1tilfkRiQMRLQPX4gD+wWTAcs00jr
         0lX3psk7aRzQnkwZC/E1XJXOSCRlEMOGiDAjktLhJUdF5XLzCB7meQ+LuDkpAHdrX4Bj
         BH2g/JI7/VhlsKADVorVSRUwyhmDlgE2X3jbEppc38wxL45dvMz5zSjGQFulairwxMkk
         QhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xit24kqcKOsHmHtuflSHWZ7nJpkGllTJJ3cdJK9yAI0=;
        b=dQFMvETSbIRvdUsH5lJkul9Bc0SLWiu7c9mIi0jBZkFTalMxeSvSS1ZqL9otZ6y3nT
         ZjfpN/AvzMY8h7Xhj6calHvvmlvWRbwgZJ1u2POsW/xsUeTjyKUN9CtYvbnoSp+Rly7T
         N8WysysANNO0PLC9Zz0zHqATVtYCxmXiEw9QUn+GYlolZsNydbQ+I6FIH2436kbep+mr
         jNRsoARmzayQFwUV3pJtrQWUSj5zIinNA0c0yifWRdEDt/u2ZzHWThB2QZ6ydkc2+vAQ
         MnIVF5QPGpD8dPsh6ngC6vhNtBbl3NP3UF12HoHutWRkcIA9U6BThGEFHXZdEjYFYWkU
         Q1Ww==
X-Gm-Message-State: APjAAAWioczASLJZsq6aEmA9H+B5sbU37TEGuHbfqICxeMoE0uHMp1cI
        2J2Z4YRYn3XipcSmTs7XJLM=
X-Google-Smtp-Source: APXvYqxqnJbX56XlMuuvBfIf6Y887TKUk+S1MxoJlxASQ61DANWMm+ymY+N1EXtfuYesifp1Qk1Pdg==
X-Received: by 2002:a0c:9369:: with SMTP id e38mr927888qve.25.1569980523698;
        Tue, 01 Oct 2019 18:42:03 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:03 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [RFC] [PATCH 0/5] enable tegra-udc host mode
Date:   Tue,  1 Oct 2019 21:41:48 -0400
Message-Id: <20191002014153.29831-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch set enables the tegra-udc driver to take the place of
tegra-ehci as the usb host driver.
It fixes up some checks in the tegra-udc driver.
It pulls the tegra specific bits from the tegra-ehci driver.

It would be better to have generic helpers in the dma core that can
handle alignment, instead of using tegra specific helpers, but that is
well above my skillset.

I haven't checked OTG functionality, mostly because I don't have any
devices with working OTG yet.

Please review and submit feedback.

Peter Geis (5):
  usb: chipidea: tegra: add tegra specific flags for host mode
  usb: chipidea: tegra: clean up tegra_udc flag code
  usb: chipidea: tegra: add dr_mode checking to tegra-udc
  usb: chipidea: tegra: add the tegra specific bits
  usb: chipidea: tegra: enable tegra-udc host mode

 drivers/usb/chipidea/ci_hdrc_tegra.c |  53 ++++++---
 drivers/usb/chipidea/host.c          |  13 +++
 drivers/usb/chipidea/tegra.h         | 159 +++++++++++++++++++++++++++
 include/linux/usb/chipidea.h         |   2 +
 4 files changed, 209 insertions(+), 18 deletions(-)
 create mode 100644 drivers/usb/chipidea/tegra.h

-- 
2.17.1

