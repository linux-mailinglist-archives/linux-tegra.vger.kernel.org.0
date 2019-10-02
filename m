Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13983C45A6
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 03:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbfJBBmF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 21:42:05 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37285 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbfJBBmF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 21:42:05 -0400
Received: by mail-qt1-f194.google.com with SMTP id l3so24289278qtr.4
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 18:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/wAqReNHT4npRUh/HHTCRIhgNxDxaBuQ/+Ij9+QrHS8=;
        b=autmk5aJlUlb/SYUyrtpA10uhayB5HQB0Vj+rLOCC18mGr0Hj7FJ+JUBq9gHqOpIQB
         7ae0wjmPlZYRyIYeOF1Uj430SZeNZi2BCRBblPgIj0PtCWsn9br3sR+zO3n4GcS3XfYt
         eJb5tUGmFvE6kcUxwUz5WoZnqbUZY/2IqFYs32TWwgApaAIHxLC+xGGYOim9cLRmEqpG
         9HQ4RslrfKOhgqo9vE60NPDKnODGhIPz6ZVV7TfwW67JmUrtm3r8gB+ZXAxteIe6gd3n
         TJR5/v7Rjh+yKcqy0ZPEnRrMg0RjTloIhxdWpnLv4WRCIu8P55kj7XjGSsberUOrsmKo
         e0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/wAqReNHT4npRUh/HHTCRIhgNxDxaBuQ/+Ij9+QrHS8=;
        b=VdAe7XsfXGKi3xPm5JzUaewIIT3j2g4/DVNUfrCD9ABnj4XO9c0n3vlOOx6Z21tcf8
         LBV1Kn/sEVT5igQKuz2yfMyW3si7AB1WZGQn69WZCKT0OjRxqcOlf09P0Zxh0T+IDIzO
         QPOqgUDav6K8FAXvEavQdnMqAcdzg5/TuLqkaVRAxEcY/WXyOx3LFIm90yUCfB7cv1Mj
         XHVK9zJlIaHOuVrOXA+z/2waZUCyLyaX2MiVT/VMxPd3CoDS1DxGOeux97eGtdsjG9dn
         OaaJPxwh5hbqcZrlqaFfaywhix7YqBxDygRsF/KN0FJKxX47hfGHdLNL2d/h8ZNMm6qN
         EpyQ==
X-Gm-Message-State: APjAAAXA2qqt+C8dCCqCJ5Tirq2xhnToz1YRMp9yxA5+GOVMwqLCns1o
        D+M+6tw1f4pczeGDA3JEVWY=
X-Google-Smtp-Source: APXvYqzEPV1tBf7vntsGNDGi5yhr4gnc5YtFYEZ6dRAatb+2A2YmAPIK2x2WmZ8pXkrggQmCk/QcIg==
X-Received: by 2002:a05:6214:801:: with SMTP id df1mr963591qvb.54.1569980524225;
        Tue, 01 Oct 2019 18:42:04 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd3f:2362:443a:b8eb])
        by smtp.gmail.com with ESMTPSA id o52sm12212033qtf.56.2019.10.01.18.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 18:42:03 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH 1/5] usb: chipidea: tegra: add tegra specific flags for host mode
Date:   Tue,  1 Oct 2019 21:41:49 -0400
Message-Id: <20191002014153.29831-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra controllers require special handlers for aligned dma, as generic
helpers do not exist yet. Add a flag to set for Tegra devices to permit
these handlers.
Also, some Tegra controllers require a double reset, set from the device
tree. Add a flag for this as well.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 include/linux/usb/chipidea.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index edd89b7c8f18..88cc13fe582f 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -62,6 +62,8 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
 #define CI_HDRC_IMX_IS_HSIC		BIT(14)
 #define CI_HDRC_PMQOS			BIT(15)
+#define CI_HDRC_TEGRA_HOST		BIT(16)
+#define CI_HDRC_TEGRA_DOUBLE_RESET	BIT(17)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
-- 
2.17.1

