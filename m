Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77899449AD
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 19:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfFMR2C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 13:28:02 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:38507 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFMR2C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 13:28:02 -0400
Received: by mail-pg1-f201.google.com with SMTP id 21so14301416pgl.5
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=YOPSQyByy+sdwJPTHXHLAwPARdzuYkR92/UcWiG15z0=;
        b=qq3Uulg+GNz9qGof5VZ8h8QdhcjR1EeS0zo/SjjfeovzkY3ZDAWYtLBxpGrSALoW9x
         YzPJuHqkfuX1ogcyu8AnpJT3bDQEmsxTojWbxsmDcE+HPCNWeSCyI1TkHMMMwv7ZM7B5
         xoOA8s2uBXemEdGeVyvWVr//eGffvPTa+1URylcVc5w9gIe3CDwV4cV4jX7UN2ZvvGTn
         kIynhzJdDc5gDcy2e28ddL0gz5sQnmlJYNUlz6m99/a3hJudaV8g0j8WuoAa9A5hWbUN
         FRrh9Bfj3Rw2zyzEoizIgUfOSz4BVBYFsc9Rzwd8pBcxZ0Hs0luZjMzXnRvBboZixHsR
         FUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=YOPSQyByy+sdwJPTHXHLAwPARdzuYkR92/UcWiG15z0=;
        b=WcBm+b+Moc2D4rtNuL0GMor32NsHrVNVYbptVF/BdZrzCaW/5dx0GE+XeXDcmGgmHD
         XpB6dV80orB92GcNUiJlA/4j6BcxV6IQFC6E9S/hDOXbCJx8NQEh8Msvbt6zsViEiRu5
         svxUeyBNSxu2zwgoyW7dW/3AIXYV82B+CgjKvoflldkCh12IsJ9NvTwosIufi5hvx8fp
         CPiGPfqQKxnqpjAU1aEN9KvIZs+xCM2OnbliQr9HtTzXUIBbUjXNk5YVXQwRErXQbKqs
         UtL8hsap93aDyg2o/ZB0Z12NoXW8+DjpkLk1HEdKVcWLsgxrVw3tBEgOzDMiFqVzhg32
         5iWA==
X-Gm-Message-State: APjAAAWtsToYPw1lJhSb06/xs3FUD54KCqu0J5sJieK2QjPdS74rd05K
        6z5vkGGyHklyVMTNKvW0BE7b0nMqsA==
X-Google-Smtp-Source: APXvYqyLxxhPCdTroCrtThxPEGqptQMNlEqmTe4QCMVFCYFfDvC2PYzPkg4R9I7fjg2Z61Mj8vLdfDU/3A==
X-Received: by 2002:a63:5c15:: with SMTP id q21mr17864740pgb.248.1560446881379;
 Thu, 13 Jun 2019 10:28:01 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:27:46 -0700
Message-Id: <20190613172746.216819-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH] memory: tegra: Fix -Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Clang produces the following warning

drivers/memory/tegra/tegra124.c:36:28: warning: unused variable
'tegra124_mc_emem_regs' [-Wunused-const-variable]
static const unsigned long tegra124_mc_emem_regs[] = {
                           ^

The only usage of this variable is from within an ifdef.
It seems logical to move the variable into the ifdef as well.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/526
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/memory/tegra/tegra124.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 8f8487bda642..8f2af5614595 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -33,6 +33,7 @@
 #define MC_EMEM_ARB_MISC1			0xdc
 #define MC_EMEM_ARB_RING1_THROTTLE		0xe0
 
+#ifdef CONFIG_ARCH_TEGRA_124_SOC
 static const unsigned long tegra124_mc_emem_regs[] = {
 	MC_EMEM_ARB_CFG,
 	MC_EMEM_ARB_OUTSTANDING_REQ,
@@ -54,6 +55,7 @@ static const unsigned long tegra124_mc_emem_regs[] = {
 	MC_EMEM_ARB_MISC1,
 	MC_EMEM_ARB_RING1_THROTTLE
 };
+#endif
 
 static const struct tegra_mc_client tegra124_mc_clients[] = {
 	{
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

