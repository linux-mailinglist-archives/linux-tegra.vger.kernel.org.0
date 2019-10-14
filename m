Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770C2D62F8
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731035AbfJNMu6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:50:58 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42244 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbfJNMu6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:50:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id n14so19554980wrw.9
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yr6ddMFHeDLCntvNYa+hL2al/dJdqvTJul7jaQ0EH5g=;
        b=U9lvx1cbTYbWS657zE2Tc9rYiIa1XQ1MvK29kpBkr6JoqEsLqBqomo1yYxydjNwu7o
         6ZFzChng8BZsMFQZlg0FYo2GZMKXp/45qGER/86iJjzyeao7kxsVVIyRuH9CUQJRRWi8
         7H/VSXdvlfmp+uVSLHPEiA2qdufh04/Bri8Fuit1+Goi+qmOpRk+Hm1vsv/tKTV01bPl
         Un91kXK9s5IN0rodlhj3N/01UIh/yKqCX2pMoIT43SOxPB2N8YZRlrwoJO0kn2bXAwBD
         gsCV4id8CQlLe6Iw095eUS+JNpglhZvEPaXyR+M7t9xgmTsE4RaYH5muI31iES5Y/K/j
         fi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yr6ddMFHeDLCntvNYa+hL2al/dJdqvTJul7jaQ0EH5g=;
        b=I4B9yJ/qhAaSmTYiaKJURJOjUV0eoA5clX0E+PWz7GJaTPwhH32cRlAofLUZpdJiS+
         SUMcB6ofb+xWMbUT0RoZGoZ5ZsS7NjblYx8s+lAml5hK6TCghywPm8+dlNk/y55uJuqz
         yZsLXZ4TFacrwacgxIHk1zDDAEqW2+vFKLkWCXKvGA8OgBPJb9Gn+j9P5Y2hq9RNdx4O
         QCrsISEIeCh/R8uXJgeoppO5Cecwu/hTFh69qNvXEW50ngs+NF4aV7znNzJrPQHmRo1h
         rsvL3bdTY6jVsgmqqnjc9mCK8V889GIHgbC3K7+Rp7gTToDZdL+jr8UbadhxQueG9Amd
         jUvw==
X-Gm-Message-State: APjAAAUKrUDAcfzkcY1CmHmKNXgoQG4g7flY5ppO3Kc5OAtx5M4phJ3M
        4lj7FWEwlqU65pIzKB/xz6g=
X-Google-Smtp-Source: APXvYqyBSiiaVUDINZz+bSWf6iQAgcfMBJ6K0a+ZRqvzYxwc7kK/NvnWt5L+YEufAc/q3Wmf5asHnA==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr6981953wru.4.1571057455717;
        Mon, 14 Oct 2019 05:50:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c9sm17126565wrt.7.2019.10.14.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:50:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 02/14] gpu: host1x: Remove gratuitous blank line
Date:   Mon, 14 Oct 2019 14:50:37 +0200
Message-Id: <20191014125049.425101-3-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/intr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 26f3c741d085..9245add23b5d 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -105,7 +105,6 @@ static void action_submit_complete(struct host1x_waitlist *waiter)
 	/*  Add nr_completed to trace */
 	trace_host1x_channel_submit_complete(dev_name(channel->dev),
 					     waiter->count, waiter->thresh);
-
 }
 
 static void action_wakeup(struct host1x_waitlist *waiter)
-- 
2.23.0

