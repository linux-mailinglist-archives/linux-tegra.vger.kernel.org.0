Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1B4D62FB
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731418AbfJNMvC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36576 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMvC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:02 -0400
Received: by mail-wr1-f68.google.com with SMTP id y19so19619238wrd.3
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rq1ZF1nsTPYlmvvsNxuE1omhCQpXv2Uc5EavmJCLVho=;
        b=roXeX3ZabUr/G5JLWSmiWtysvCekVmBgZnQSLwfNQbFZqAEaNWu58tWzTqYhBbXEpT
         xRsReujN/yxxI+N0AeMSh8rZ6OuN4RnNjyQgiWFP7ngOh8o1XJUH2Ma70CqFtA39oYyw
         bxrzDuSvZUdHCUbV/WBzyaaQck4UNiOCs5qqVPPJlptHX1DQCDbXrbgSqPrdw56vMh6B
         KvPOfm4c4RUk5FT7RL45hRBsUEoAnnKachEDbkk7HN+9pdiYg5Pk/8VcpevlSKfJNy1o
         acyPEUAAY6nGWoZwoQdq9GExxQC9XfYd6rqTY/WtOs9EsAJBrkZmiMMIucCx0BPR2vgJ
         VHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rq1ZF1nsTPYlmvvsNxuE1omhCQpXv2Uc5EavmJCLVho=;
        b=dWBJrt992k9rPMMEwYuI1BOgMRAYHJLda9RscZXkoDMrIkt/QGydu7NZWd7oQxLvd5
         nB3D8DqeLnz6syCzqClBaN0Y9n8Bu5Cz/xGHiiIEO9at6IHbTqL7r766wFqK3R+vOP4u
         fnqhUjORXy6OGo/8Ezu6kn0F6LUhmfrwWnvxgccLso1UGCUOP9D++0UeSG7utrOpJEiS
         N7kv0U/2SOqATTqFFRrG5Vs93R51IaNeRrB2lycyDQZSxEWmds1Nk0vbsqxG4gU/bjy9
         Bg91Spv6XPx5TrZ/4hh4spZI4EZ0pEWkjeqWbrGIqhC4lBjVHa4aDRz4YgTGVEI6VZOy
         NBFQ==
X-Gm-Message-State: APjAAAXUzjZPVibfE3osnryaoX+Z5aWxT6wT7WqBIQ7eiyDBRkeF4T6s
        rsWJTVSQYwwN/t2qxFBcA4ec4Uc+
X-Google-Smtp-Source: APXvYqyu8+tLAbFH3kbSjwHQedeUmmjLCm8Od7hF49MjagwlGdOGH44d2h92tCDjtljnP8K7vWmZDA==
X-Received: by 2002:adf:8296:: with SMTP id 22mr24599649wrc.255.1571057457725;
        Mon, 14 Oct 2019 05:50:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id y19sm16741436wmi.13.2019.10.14.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:50:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/14] gpu: host1x: Explicitly initialize host1x_info structures
Date:   Mon, 14 Oct 2019 14:50:38 +0200
Message-Id: <20191014125049.425101-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

It's technically not required to explicitly initialize the fields that
will be zero by default, but it's easier to read these structures if
they are all initialized uniformly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 5a3f797240d4..e8ab4d0c5091 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -77,6 +77,9 @@ static const struct host1x_info host1x01_info = {
 	.init = host1x01_init,
 	.sync_offset = 0x3000,
 	.dma_mask = DMA_BIT_MASK(32),
+	.has_hypervisor = false,
+	.num_sid_entries = 0,
+	.sid_table = NULL,
 };
 
 static const struct host1x_info host1x02_info = {
@@ -87,6 +90,9 @@ static const struct host1x_info host1x02_info = {
 	.init = host1x02_init,
 	.sync_offset = 0x3000,
 	.dma_mask = DMA_BIT_MASK(32),
+	.has_hypervisor = false,
+	.num_sid_entries = 0,
+	.sid_table = NULL,
 };
 
 static const struct host1x_info host1x04_info = {
@@ -97,6 +103,9 @@ static const struct host1x_info host1x04_info = {
 	.init = host1x04_init,
 	.sync_offset = 0x2100,
 	.dma_mask = DMA_BIT_MASK(34),
+	.has_hypervisor = false,
+	.num_sid_entries = 0,
+	.sid_table = NULL,
 };
 
 static const struct host1x_info host1x05_info = {
@@ -107,6 +116,9 @@ static const struct host1x_info host1x05_info = {
 	.init = host1x05_init,
 	.sync_offset = 0x2100,
 	.dma_mask = DMA_BIT_MASK(34),
+	.has_hypervisor = false,
+	.num_sid_entries = 0,
+	.sid_table = NULL,
 };
 
 static const struct host1x_sid_entry tegra186_sid_table[] = {
-- 
2.23.0

