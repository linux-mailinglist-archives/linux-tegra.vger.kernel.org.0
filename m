Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8672D7C26
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Dec 2020 18:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393878AbgLKREO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 11 Dec 2020 12:04:14 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2296 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389602AbgLKRDb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Dec 2020 12:03:31 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a63b0000>; Fri, 11 Dec 2020 09:02:51 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:50 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:50 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/13] media: tegra-video: Add DV timing support
Date:   Fri, 11 Dec 2020 09:02:34 -0800
Message-ID: <1607706162-1548-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706171; bh=OEJFE73+oYlfHwsZTpDTwunmzJNSeyNDOPkWhniYmz0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=kq+m/vGoVNR0A23zhIYo1U7OJgprGWIdG9UDA0+4G6eamshfIGkjA73nDAFxVBoM9
         rXTeOf3u8VsdmkoJ47a0HKKwtcheSB82O2Jesz9cyiE82kcTDWDe06WpvPY+HYYzdJ
         xLbkoy97CfXcrje9pWEgJFHRM0S4LIttbsUWiZvK8i06QlSc7/fLbiZ6W90wNEWP5Y
         20VupVYmrsiNI6NsUj1J3j+7GhFWN9gpR0UcYd7x6Beo2Ayb83P8N52nCjHBeLxW/F
         16Gkkp3sZLxweSRpfeWe7Omi0wvDVu7x0qiPHHpfX9xOoOk6ExsW1eJMJFpSV24FG2
         cqkTtoR2elFHQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds below v4l2 DV timing ioctls to support HDMI-to-CSI
bridges.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 525c087..d01e88d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <media/v4l2-dv-timings.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
 #include <media/v4l2-fwnode.h>
@@ -720,6 +721,97 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	return ret;
 }
 
+static int tegra_channel_g_dv_timings(struct file *file, void *fh,
+				      struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, g_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					  video, g_dv_timings, timings);
+}
+
+static int tegra_channel_s_dv_timings(struct file *file, void *fh,
+				      struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+	struct v4l2_bt_timings *bt = &timings->bt;
+	struct v4l2_dv_timings curr_timings;
+	int ret;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, s_dv_timings))
+		return -ENOTTY;
+
+	ret = tegra_channel_g_dv_timings(file, fh, &curr_timings);
+	if (ret)
+		return ret;
+
+	if (v4l2_match_dv_timings(timings, &curr_timings, 0, false))
+		return 0;
+
+	if (vb2_is_busy(&chan->queue))
+		return -EBUSY;
+
+	ret = v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					 video, s_dv_timings, timings);
+	if (ret)
+		return ret;
+
+	chan->format.width = bt->width;
+	chan->format.height = bt->height;
+	chan->format.bytesperline = bt->width * chan->fmtinfo->bpp;
+	chan->format.sizeimage = chan->format.bytesperline * bt->height;
+	tegra_channel_fmt_align(chan, &chan->format, chan->fmtinfo->bpp);
+
+	return 0;
+}
+
+static int tegra_channel_query_dv_timings(struct file *file, void *fh,
+					  struct v4l2_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, video, query_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_device_call_until_err(chan->video.v4l2_dev, 0,
+					  video, query_dv_timings, timings);
+}
+
+static int tegra_channel_enum_dv_timings(struct file *file, void *fh,
+					 struct v4l2_enum_dv_timings *timings)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, enum_dv_timings))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, enum_dv_timings, timings);
+}
+
+static int tegra_channel_dv_timings_cap(struct file *file, void *fh,
+					struct v4l2_dv_timings_cap *cap)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, dv_timings_cap))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, dv_timings_cap, cap);
+}
+
 static int tegra_channel_enum_input(struct file *file, void *fh,
 				    struct v4l2_input *inp)
 {
@@ -732,6 +824,8 @@ static int tegra_channel_enum_input(struct file *file, void *fh,
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	subdev = tegra_channel_get_remote_source_subdev(chan);
 	strscpy(inp->name, subdev->name, sizeof(inp->name));
+	if (v4l2_subdev_has_op(subdev, pad, dv_timings_cap))
+		inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
 
 	return 0;
 }
@@ -779,6 +873,11 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_g_selection		= tegra_channel_g_selection,
 	.vidioc_s_selection		= tegra_channel_s_selection,
+	.vidioc_g_dv_timings		= tegra_channel_g_dv_timings,
+	.vidioc_s_dv_timings		= tegra_channel_s_dv_timings,
+	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
+	.vidioc_enum_dv_timings		= tegra_channel_enum_dv_timings,
+	.vidioc_dv_timings_cap		= tegra_channel_dv_timings_cap,
 };
 
 /*
-- 
2.7.4

