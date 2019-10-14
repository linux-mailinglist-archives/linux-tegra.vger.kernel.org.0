Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09D0D62FC
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731422AbfJNMvD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33169 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731415AbfJNMvD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so14435062wme.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXohOh2PNnJ9mf9YhRZwip9mBy/jBn3bFjciUpmeUw4=;
        b=KPpOwIQJCJ/ifOquBzI/rkkIhBfyPSn3Xrf5co8hRO4y6AhugJc5FSEci2erN/IVsX
         YmtK/lOh1oJdzNY4r8SJyTs+Z68b/uXeX6RA3958EWxYqb8jr0d6a/a6wUsgfTJWxb+H
         nCjvRoQxT2YzHt195lsXp+/sI+LQySt1kBX420UXTGz8fowz7BX3++U4GnhJl/lJjCj7
         TpPrsWMR349iXic1FEwtrTK1h7w0opSi1PVdFoZtRR2bqbb2WY33xk9mGK7cYP3Jvt1s
         CtKLE1rhPzv+PbGqVbENyqhz4AXLP5bl3jYF9+6X0qQVkAUcnVbKLpTspwG/zetvCs6L
         WzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXohOh2PNnJ9mf9YhRZwip9mBy/jBn3bFjciUpmeUw4=;
        b=NCor9mQ2TS1KT5yPrZX765OwqRgKW2a6gHXMlg4tHl0vAUbQ/qHwhZET2kOYT7DNYi
         vbN/5VXQisWbcqnTpHyeDDClO3mXkN7p9+J/yOwXw7so4jfB73NF9ThSw9GbZ0FjdCgU
         1V+fuqWpQiSp8x65MlpeKMTW9OUi7KR/rGrWnXJga54+7jrfEb47jM8KZ0BaedTdJW7B
         cLufp/Sh9sXZ2jFfHyP6iJ9HjGKUNtUFW/GeFQNZKLTaBYOoncAg/JFHVGhsEaWpRQR/
         VsK8v8Lyws3PsKfkcQ+NOrX8u/o1YnFQwLrkInYHNQGj+A0bpB30CI7gvN2wvyfQ8B9G
         q5cw==
X-Gm-Message-State: APjAAAVCYdjrXkW8TDODKyTu9jpbadaw3mDPwXbnsPKcabWvXDXzyoIp
        QpED8yedKDZ346pNIxjeW+E5J6x0
X-Google-Smtp-Source: APXvYqzTwE5O9n8rJ9WGhkeHV5xRAZeMlsQ8CheFaxYiNfkPbL/58F5cNEHWnAoT0s/oSzkIM0NdxQ==
X-Received: by 2002:a1c:444:: with SMTP id 65mr15464247wme.84.1571057460214;
        Mon, 14 Oct 2019 05:51:00 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z142sm28384710wmc.24.2019.10.14.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:50:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 04/14] gpu: host1x: Request channels for clients, not devices
Date:   Mon, 14 Oct 2019 14:50:39 +0200
Message-Id: <20191014125049.425101-5-thierry.reding@gmail.com>
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

A struct device doesn't carry much information that a channel might be
interested in, but the client very much does. Request channels for the
clients rather than their parent devices and store a pointer to them
in order to have that information available when needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gr2d.c |  2 +-
 drivers/gpu/drm/tegra/gr3d.c |  2 +-
 drivers/gpu/drm/tegra/vic.c  |  2 +-
 drivers/gpu/host1x/channel.c | 13 +++++++------
 drivers/gpu/host1x/channel.h |  1 +
 include/linux/host1x.h       |  2 +-
 6 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 641299cc85b8..3cbb4a029c41 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -40,7 +40,7 @@ static int gr2d_init(struct host1x_client *client)
 	struct gr2d *gr2d = to_gr2d(drm);
 	int err;
 
-	gr2d->channel = host1x_channel_request(client->dev);
+	gr2d->channel = host1x_channel_request(client);
 	if (!gr2d->channel)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 8b9a35b1cbb3..87a386134cc4 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -49,7 +49,7 @@ static int gr3d_init(struct host1x_client *client)
 	struct gr3d *gr3d = to_gr3d(drm);
 	int err;
 
-	gr3d->channel = host1x_channel_request(client->dev);
+	gr3d->channel = host1x_channel_request(client);
 	if (!gr3d->channel)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index cd0399fd8c63..c97a61c877af 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -198,7 +198,7 @@ static int vic_init(struct host1x_client *client)
 		vic->domain = tegra->domain;
 	}
 
-	vic->channel = host1x_channel_request(client->dev);
+	vic->channel = host1x_channel_request(client);
 	if (!vic->channel) {
 		err = -ENOMEM;
 		goto detach;
diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 1436295aa450..4cd212bb570d 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -115,14 +115,14 @@ static struct host1x_channel *acquire_unused_channel(struct host1x *host)
 
 /**
  * host1x_channel_request() - Allocate a channel
- * @device: Host1x unit this channel will be used to send commands to
+ * @client: Host1x client this channel will be used to send commands to
  *
- * Allocates a new host1x channel for @device. May return NULL if CDMA
+ * Allocates a new host1x channel for @client. May return NULL if CDMA
  * initialization fails.
  */
-struct host1x_channel *host1x_channel_request(struct device *dev)
+struct host1x_channel *host1x_channel_request(struct host1x_client *client)
 {
-	struct host1x *host = dev_get_drvdata(dev->parent);
+	struct host1x *host = dev_get_drvdata(client->dev->parent);
 	struct host1x_channel_list *chlist = &host->channel_list;
 	struct host1x_channel *channel;
 	int err;
@@ -133,7 +133,8 @@ struct host1x_channel *host1x_channel_request(struct device *dev)
 
 	kref_init(&channel->refcount);
 	mutex_init(&channel->submitlock);
-	channel->dev = dev;
+	channel->client = client;
+	channel->dev = client->dev;
 
 	err = host1x_hw_channel_init(host, channel, channel->id);
 	if (err < 0)
@@ -148,7 +149,7 @@ struct host1x_channel *host1x_channel_request(struct device *dev)
 fail:
 	clear_bit(channel->id, chlist->allocated_channels);
 
-	dev_err(dev, "failed to initialize channel\n");
+	dev_err(client->dev, "failed to initialize channel\n");
 
 	return NULL;
 }
diff --git a/drivers/gpu/host1x/channel.h b/drivers/gpu/host1x/channel.h
index 4fd694834f74..39044ff6c3aa 100644
--- a/drivers/gpu/host1x/channel.h
+++ b/drivers/gpu/host1x/channel.h
@@ -26,6 +26,7 @@ struct host1x_channel {
 	unsigned int id;
 	struct mutex submitlock;
 	void __iomem *regs;
+	struct host1x_client *client;
 	struct device *dev;
 	struct host1x_cdma cdma;
 };
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e6eea45e1154..4396cd566a33 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -158,7 +158,7 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 struct host1x_channel;
 struct host1x_job;
 
-struct host1x_channel *host1x_channel_request(struct device *dev);
+struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
-- 
2.23.0

