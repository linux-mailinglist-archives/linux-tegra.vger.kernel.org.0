Return-Path: <linux-tegra+bounces-236-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9980ABDA
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Dec 2023 19:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A7F2817CD
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Dec 2023 18:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9138481AA;
	Fri,  8 Dec 2023 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tDmY3q4L"
X-Original-To: linux-tegra@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615648E;
	Fri,  8 Dec 2023 10:16:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DC1F7552;
	Fri,  8 Dec 2023 19:16:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702059361;
	bh=SlVj5ZiiRVsujPuZg/4j6TY7J+V3k0fWLjSZOmjCH4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tDmY3q4L9WEEpj04yXMfvEDMOYfzp7NsB7ZYgG4GlJxzAtIL5wfJ1epMoBdOzGo6z
	 VVHuIb2hy82Hbaq9f00aDwSFxEcKPICV8OahulbZFpmXna0Nj6OdLiJuDRWKadwIvZ
	 Ijb8qRmw6dx5D6ADWvzhtsf+mgg4wwVk514OG87o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 2/8] media: v4l2-subdev: Turn .[gs]_frame_interval into pad operations
Date: Fri,  8 Dec 2023 20:16:42 +0200
Message-ID: <20231208181648.13568-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev .[gs]_frame_interval are video operations, but they operate
on pads (and even on streams). Not only is this confusing, it causes
practical issues for drivers as the operations don't receive a subdev
state pointer, requiring manual state handling.

To improve the situation, turn the operations into pad operations, and
extend them to receive a state pointer like other pad operations.

While at it, rename the operations to .[gs]et_frame_interval at the same
time to match the naming scheme of other pad operations. This isn't
strictly necessary, but given that all drivers using those operations
need to be modified, handling the rename separately would generate more
churn for very little gain (if at all).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
---
Changes since v3:

- Address thp7312 driver
---
 drivers/media/i2c/adv7180.c                   |  7 ++-
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +-
 drivers/media/i2c/imx214.c                    |  9 +--
 drivers/media/i2c/imx274.c                    | 48 +++++---------
 drivers/media/i2c/max9286.c                   | 14 +++--
 drivers/media/i2c/mt9m111.c                   | 14 +++--
 drivers/media/i2c/mt9m114.c                   | 14 +++--
 drivers/media/i2c/mt9v011.c                   | 18 +++---
 drivers/media/i2c/mt9v111.c                   | 16 ++---
 drivers/media/i2c/ov2680.c                    |  7 ++-
 drivers/media/i2c/ov5640.c                    | 16 ++---
 drivers/media/i2c/ov5648.c                    | 59 ++++++++---------
 drivers/media/i2c/ov5693.c                    |  7 ++-
 drivers/media/i2c/ov6650.c                    | 16 ++---
 drivers/media/i2c/ov7251.c                    |  6 +-
 drivers/media/i2c/ov7670.c                    | 18 +++---
 drivers/media/i2c/ov772x.c                    | 14 +++--
 drivers/media/i2c/ov7740.c                    | 40 +++++-------
 drivers/media/i2c/ov8865.c                    | 51 +++++++--------
 drivers/media/i2c/ov9650.c                    | 14 +++--
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 14 +++--
 drivers/media/i2c/s5k5baf.c                   | 20 +++---
 drivers/media/i2c/thp7312.c                   | 22 +++----
 drivers/media/i2c/tvp514x.c                   | 29 +++------
 drivers/media/usb/em28xx/em28xx-video.c       |  6 +-
 drivers/media/v4l2-core/v4l2-common.c         |  8 +--
 drivers/media/v4l2-core/v4l2-subdev.c         | 63 +++++++++++--------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  7 ++-
 .../media/atomisp/i2c/atomisp-gc2235.c        |  7 ++-
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  7 ++-
 .../media/atomisp/i2c/atomisp-ov2722.c        |  7 ++-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +-
 drivers/staging/media/imx/imx-ic-prp.c        | 14 +++--
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 14 +++--
 drivers/staging/media/imx/imx-media-capture.c |  6 +-
 drivers/staging/media/imx/imx-media-csi.c     | 14 +++--
 drivers/staging/media/imx/imx-media-vdic.c    | 14 +++--
 drivers/staging/media/tegra-video/csi.c       |  9 +--
 include/media/v4l2-common.h                   |  4 +-
 include/media/v4l2-subdev.h                   | 22 ++++---
 41 files changed, 348 insertions(+), 341 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index e10811cce801..7ed86030fb5c 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -463,8 +463,9 @@ static int adv7180_g_std(struct v4l2_subdev *sd, v4l2_std_id *norm)
 	return 0;
 }
 
-static int adv7180_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *fi)
+static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct adv7180_state *state = to_state(sd);
 
@@ -913,7 +914,6 @@ static int adv7180_subscribe_event(struct v4l2_subdev *sd,
 static const struct v4l2_subdev_video_ops adv7180_video_ops = {
 	.s_std = adv7180_s_std,
 	.g_std = adv7180_g_std,
-	.g_frame_interval = adv7180_g_frame_interval,
 	.querystd = adv7180_querystd,
 	.g_input_status = adv7180_g_input_status,
 	.s_routing = adv7180_s_routing,
@@ -932,6 +932,7 @@ static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {
 	.enum_mbus_code = adv7180_enum_mbus_code,
 	.set_fmt = adv7180_set_pad_format,
 	.get_fmt = adv7180_get_pad_format,
+	.get_frame_interval = adv7180_get_frame_interval,
 	.get_mbus_config = adv7180_get_mbus_config,
 };
 
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 63616dc5a02f..71fb5aebd3df 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1046,6 +1046,7 @@ static int et8ek8_set_pad_format(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_get_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
@@ -1057,6 +1058,7 @@ static int et8ek8_get_frame_interval(struct v4l2_subdev *subdev,
 }
 
 static int et8ek8_set_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
@@ -1342,8 +1344,6 @@ static int et8ek8_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 static const struct v4l2_subdev_video_ops et8ek8_video_ops = {
 	.s_stream = et8ek8_s_stream,
-	.g_frame_interval = et8ek8_get_frame_interval,
-	.s_frame_interval = et8ek8_set_frame_interval,
 };
 
 static const struct v4l2_subdev_core_ops et8ek8_core_ops = {
@@ -1356,6 +1356,8 @@ static const struct v4l2_subdev_pad_ops et8ek8_pad_ops = {
 	.enum_frame_interval = et8ek8_enum_frame_ival,
 	.get_fmt = et8ek8_get_pad_format,
 	.set_fmt = et8ek8_set_pad_format,
+	.get_frame_interval = et8ek8_get_frame_interval,
+	.set_frame_interval = et8ek8_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops et8ek8_ops = {
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 474c95572bf6..624efc8834f3 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -795,8 +795,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 	return ret;
 }
 
-static int imx214_g_frame_interval(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_frame_interval *fival)
+static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fival)
 {
 	fival->interval.numerator = 1;
 	fival->interval.denominator = IMX214_FPS;
@@ -828,8 +829,6 @@ static int imx214_enum_frame_interval(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_video_ops imx214_video_ops = {
 	.s_stream = imx214_s_stream,
-	.g_frame_interval = imx214_g_frame_interval,
-	.s_frame_interval = imx214_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
@@ -839,6 +838,8 @@ static const struct v4l2_subdev_pad_ops imx214_subdev_pad_ops = {
 	.get_fmt = imx214_get_format,
 	.set_fmt = imx214_set_format,
 	.get_selection = imx214_get_selection,
+	.get_frame_interval = imx214_get_frame_interval,
+	.set_frame_interval = imx214_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops imx214_subdev_ops = {
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 8dc11c9ec1ee..4040c642a36f 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -594,8 +594,8 @@ static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl *ctrl);
 static int imx274_set_exposure(struct stimx274 *priv, int val);
 static int imx274_set_vflip(struct stimx274 *priv, int val);
 static int imx274_set_test_pattern(struct stimx274 *priv, int val);
-static int imx274_set_frame_interval(struct stimx274 *priv,
-				     struct v4l2_fract frame_interval);
+static int __imx274_set_frame_interval(struct stimx274 *priv,
+				       struct v4l2_fract frame_interval);
 
 static inline void msleep_range(unsigned int delay_base)
 {
@@ -1327,17 +1327,9 @@ static int imx274_apply_trimming(struct stimx274 *imx274)
 	return err;
 }
 
-/**
- * imx274_g_frame_interval - Get the frame interval
- * @sd: Pointer to V4L2 Sub device structure
- * @fi: Pointer to V4l2 Sub device frame interval structure
- *
- * This function is used to get the frame interval.
- *
- * Return: 0 on success
- */
-static int imx274_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int imx274_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
 
@@ -1349,17 +1341,9 @@ static int imx274_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * imx274_s_frame_interval - Set the frame interval
- * @sd: Pointer to V4L2 Sub device structure
- * @fi: Pointer to V4l2 Sub device frame interval structure
- *
- * This function is used to set the frame intervavl.
- *
- * Return: 0 on success
- */
-static int imx274_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int imx274_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct stimx274 *imx274 = to_imx274(sd);
 	struct v4l2_ctrl *ctrl = imx274->ctrls.exposure;
@@ -1371,7 +1355,7 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
 		return ret;
 
 	mutex_lock(&imx274->lock);
-	ret = imx274_set_frame_interval(imx274, fi->interval);
+	ret = __imx274_set_frame_interval(imx274, fi->interval);
 
 	if (!ret) {
 		fi->interval = imx274->frame_interval;
@@ -1466,8 +1450,8 @@ static int imx274_s_stream(struct v4l2_subdev *sd, int on)
 		 * are changed.
 		 * gain is not affected.
 		 */
-		ret = imx274_set_frame_interval(imx274,
-						imx274->frame_interval);
+		ret = __imx274_set_frame_interval(imx274,
+						  imx274->frame_interval);
 		if (ret)
 			goto fail;
 
@@ -1830,7 +1814,7 @@ static int imx274_set_frame_length(struct stimx274 *priv, u32 val)
 }
 
 /*
- * imx274_set_frame_interval - Function called when setting frame interval
+ * __imx274_set_frame_interval - Function called when setting frame interval
  * @priv: Pointer to device structure
  * @frame_interval: Variable for frame interval
  *
@@ -1839,8 +1823,8 @@ static int imx274_set_frame_length(struct stimx274 *priv, u32 val)
  *
  * Return: 0 on success
  */
-static int imx274_set_frame_interval(struct stimx274 *priv,
-				     struct v4l2_fract frame_interval)
+static int __imx274_set_frame_interval(struct stimx274 *priv,
+				       struct v4l2_fract frame_interval)
 {
 	int err;
 	u32 frame_length, req_frame_rate;
@@ -1927,11 +1911,11 @@ static const struct v4l2_subdev_pad_ops imx274_pad_ops = {
 	.set_fmt = imx274_set_fmt,
 	.get_selection = imx274_get_selection,
 	.set_selection = imx274_set_selection,
+	.get_frame_interval = imx274_get_frame_interval,
+	.set_frame_interval = imx274_set_frame_interval,
 };
 
 static const struct v4l2_subdev_video_ops imx274_video_ops = {
-	.g_frame_interval = imx274_g_frame_interval,
-	.s_frame_interval = imx274_s_frame_interval,
 	.s_stream = imx274_s_stream,
 };
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ee11ae682d8d..7e8cb53d31c3 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -868,8 +868,9 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
-static int max9286_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *interval)
+static int max9286_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *interval)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
@@ -881,8 +882,9 @@ static int max9286_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int max9286_s_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *interval)
+static int max9286_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *interval)
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
@@ -983,14 +985,14 @@ static int max9286_get_fmt(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops max9286_video_ops = {
 	.s_stream	= max9286_s_stream,
-	.g_frame_interval = max9286_g_frame_interval,
-	.s_frame_interval = max9286_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
 	.enum_mbus_code = max9286_enum_mbus_code,
 	.get_fmt	= max9286_get_fmt,
 	.set_fmt	= max9286_set_fmt,
+	.get_frame_interval = max9286_get_frame_interval,
+	.set_frame_interval = max9286_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops max9286_subdev_ops = {
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 54a7a4c623ea..602954650f2e 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1045,8 +1045,9 @@ static const struct v4l2_subdev_core_ops mt9m111_subdev_core_ops = {
 #endif
 };
 
-static int mt9m111_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int mt9m111_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
 
@@ -1055,8 +1056,9 @@ static int mt9m111_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9m111_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int mt9m111_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
 	const struct mt9m111_mode_info *mode;
@@ -1151,8 +1153,6 @@ static int mt9m111_get_mbus_config(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops mt9m111_subdev_video_ops = {
 	.s_stream	= mt9m111_s_stream,
-	.g_frame_interval = mt9m111_g_frame_interval,
-	.s_frame_interval = mt9m111_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops mt9m111_subdev_pad_ops = {
@@ -1161,6 +1161,8 @@ static const struct v4l2_subdev_pad_ops mt9m111_subdev_pad_ops = {
 	.set_selection	= mt9m111_set_selection,
 	.get_fmt	= mt9m111_get_fmt,
 	.set_fmt	= mt9m111_set_fmt,
+	.get_frame_interval = mt9m111_get_frame_interval,
+	.set_frame_interval = mt9m111_set_frame_interval,
 	.get_mbus_config = mt9m111_get_mbus_config,
 };
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 0a22f328981d..dcd94299787c 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1585,8 +1585,9 @@ static int mt9m114_ifp_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int mt9m114_ifp_g_frame_interval(struct v4l2_subdev *sd,
-					struct v4l2_subdev_frame_interval *interval)
+static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_frame_interval *interval)
 {
 	struct v4l2_fract *ival = &interval->interval;
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
@@ -1601,8 +1602,9 @@ static int mt9m114_ifp_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9m114_ifp_s_frame_interval(struct v4l2_subdev *sd,
-					struct v4l2_subdev_frame_interval *interval)
+static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_frame_interval *interval)
 {
 	struct v4l2_fract *ival = &interval->interval;
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
@@ -1967,8 +1969,6 @@ static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
 
 static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops = {
 	.s_stream = mt9m114_ifp_s_stream,
-	.g_frame_interval = mt9m114_ifp_g_frame_interval,
-	.s_frame_interval = mt9m114_ifp_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
@@ -1979,6 +1979,8 @@ static const struct v4l2_subdev_pad_ops mt9m114_ifp_pad_ops = {
 	.set_fmt = mt9m114_ifp_set_fmt,
 	.get_selection = mt9m114_ifp_get_selection,
 	.set_selection = mt9m114_ifp_set_selection,
+	.get_frame_interval = mt9m114_ifp_get_frame_interval,
+	.set_frame_interval = mt9m114_ifp_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops mt9m114_ifp_ops = {
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index d0924b4ac6fb..3485761428ba 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -362,8 +362,9 @@ static int mt9v011_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9v011_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *ival)
+static int mt9v011_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *ival)
 {
 	calc_fps(sd,
 		 &ival->interval.numerator,
@@ -372,8 +373,9 @@ static int mt9v011_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9v011_s_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *ival)
+static int mt9v011_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *ival)
 {
 	struct v4l2_fract *tpf = &ival->interval;
 	u16 speed;
@@ -455,19 +457,15 @@ static const struct v4l2_subdev_core_ops mt9v011_core_ops = {
 #endif
 };
 
-static const struct v4l2_subdev_video_ops mt9v011_video_ops = {
-	.g_frame_interval = mt9v011_g_frame_interval,
-	.s_frame_interval = mt9v011_s_frame_interval,
-};
-
 static const struct v4l2_subdev_pad_ops mt9v011_pad_ops = {
 	.enum_mbus_code = mt9v011_enum_mbus_code,
 	.set_fmt = mt9v011_set_fmt,
+	.get_frame_interval = mt9v011_get_frame_interval,
+	.set_frame_interval = mt9v011_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops mt9v011_ops = {
 	.core  = &mt9v011_core_ops,
-	.video = &mt9v011_video_ops,
 	.pad   = &mt9v011_pad_ops,
 };
 
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index b186e9160d94..496be67c971b 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -35,7 +35,7 @@
  * The IFP can produce several output image formats from the sensor core
  * output. This driver currently supports only YUYV format permutations.
  *
- * The driver allows manual frame rate control through s_frame_interval subdev
+ * The driver allows manual frame rate control through set_frame_interval subdev
  * operation or V4L2_CID_V/HBLANK controls, but it is known that the
  * auto-exposure algorithm might modify the programmed frame rate. While the
  * driver initially programs the sensor with auto-exposure and
@@ -719,8 +719,9 @@ static int mt9v111_s_stream(struct v4l2_subdev *subdev, int enable)
 	return ret;
 }
 
-static int mt9v111_s_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *ival)
+static int mt9v111_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *ival)
 {
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(sd);
 	struct v4l2_fract *tpf = &ival->interval;
@@ -771,8 +772,9 @@ static int mt9v111_s_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int mt9v111_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *ival)
+static int mt9v111_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *ival)
 {
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(sd);
 	struct v4l2_fract *tpf = &ival->interval;
@@ -962,8 +964,6 @@ static const struct v4l2_subdev_core_ops mt9v111_core_ops = {
 
 static const struct v4l2_subdev_video_ops mt9v111_video_ops = {
 	.s_stream		= mt9v111_s_stream,
-	.s_frame_interval	= mt9v111_s_frame_interval,
-	.g_frame_interval	= mt9v111_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops mt9v111_pad_ops = {
@@ -972,6 +972,8 @@ static const struct v4l2_subdev_pad_ops mt9v111_pad_ops = {
 	.enum_frame_interval	= mt9v111_enum_frame_interval,
 	.get_fmt		= mt9v111_get_format,
 	.set_fmt		= mt9v111_set_format,
+	.get_frame_interval	= mt9v111_get_frame_interval,
+	.set_frame_interval	= mt9v111_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops mt9v111_ops = {
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index d34d1972dcd9..e3ff64a9e6ca 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -552,7 +552,8 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 	return ret;
 }
 
-static int ov2680_s_g_frame_interval(struct v4l2_subdev *sd,
+static int ov2680_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
@@ -870,8 +871,6 @@ static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov2680_video_ops = {
-	.g_frame_interval	= ov2680_s_g_frame_interval,
-	.s_frame_interval	= ov2680_s_g_frame_interval,
 	.s_stream		= ov2680_s_stream,
 };
 
@@ -883,6 +882,8 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.set_fmt		= ov2680_set_fmt,
 	.get_selection		= ov2680_get_selection,
 	.set_selection		= ov2680_set_selection,
+	.get_frame_interval	= ov2680_get_frame_interval,
+	.set_frame_interval	= ov2680_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov2680_subdev_ops = {
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 6fd98b8cb181..336bfd1ffd32 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -399,7 +399,7 @@ struct ov5640_mode_info {
 	const struct reg_value *reg_data;
 	u32 reg_data_size;
 
-	/* Used by s_frame_interval only. */
+	/* Used by set_frame_interval only. */
 	u32 max_fps;
 	u32 def_fps;
 };
@@ -3604,8 +3604,9 @@ static int ov5640_enum_frame_interval(
 	return 0;
 }
 
-static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int ov5640_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
@@ -3616,8 +3617,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int ov5640_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	const struct ov5640_mode_info *mode;
@@ -3770,8 +3772,6 @@ static const struct v4l2_subdev_core_ops ov5640_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov5640_video_ops = {
-	.g_frame_interval = ov5640_g_frame_interval,
-	.s_frame_interval = ov5640_s_frame_interval,
 	.s_stream = ov5640_s_stream,
 };
 
@@ -3780,6 +3780,8 @@ static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
 	.get_selection = ov5640_get_selection,
+	.get_frame_interval = ov5640_get_frame_interval,
+	.set_frame_interval = ov5640_set_frame_interval,
 	.enum_frame_size = ov5640_enum_frame_size,
 	.enum_frame_interval = ov5640_enum_frame_interval,
 };
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 13e6060d15d4..d0d7e9968f48 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2158,37 +2158,8 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev, int enable)
 	return 0;
 }
 
-static int ov5648_g_frame_interval(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_frame_interval *interval)
-{
-	struct ov5648_sensor *sensor = ov5648_subdev_sensor(subdev);
-	const struct ov5648_mode *mode;
-	int ret = 0;
-
-	mutex_lock(&sensor->mutex);
-
-	mode = sensor->state.mode;
-
-	switch (sensor->state.mbus_code) {
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		interval->interval = mode->frame_interval[0];
-		break;
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-		interval->interval = mode->frame_interval[1];
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	mutex_unlock(&sensor->mutex);
-
-	return ret;
-}
-
 static const struct v4l2_subdev_video_ops ov5648_subdev_video_ops = {
 	.s_stream		= ov5648_s_stream,
-	.g_frame_interval	= ov5648_g_frame_interval,
-	.s_frame_interval	= ov5648_g_frame_interval,
 };
 
 /* Subdev Pad Operations */
@@ -2297,6 +2268,34 @@ static int ov5648_set_fmt(struct v4l2_subdev *subdev,
 	return ret;
 }
 
+static int ov5648_get_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
+{
+	struct ov5648_sensor *sensor = ov5648_subdev_sensor(subdev);
+	const struct ov5648_mode *mode;
+	int ret = 0;
+
+	mutex_lock(&sensor->mutex);
+
+	mode = sensor->state.mode;
+
+	switch (sensor->state.mbus_code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		interval->interval = mode->frame_interval[0];
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		interval->interval = mode->frame_interval[1];
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&sensor->mutex);
+
+	return ret;
+}
+
 static int ov5648_enum_frame_size(struct v4l2_subdev *subdev,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *size_enum)
@@ -2363,6 +2362,8 @@ static const struct v4l2_subdev_pad_ops ov5648_subdev_pad_ops = {
 	.enum_mbus_code		= ov5648_enum_mbus_code,
 	.get_fmt		= ov5648_get_fmt,
 	.set_fmt		= ov5648_set_fmt,
+	.get_frame_interval	= ov5648_get_frame_interval,
+	.set_frame_interval	= ov5648_get_frame_interval,
 	.enum_frame_size	= ov5648_enum_frame_size,
 	.enum_frame_interval	= ov5648_enum_frame_interval,
 };
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 205193baa06e..a65645811fbc 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1004,8 +1004,9 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int ov5693_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *interval)
+static int ov5693_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
 {
 	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
 	unsigned int framesize = OV5693_FIXED_PPL * (ov5693->mode.format.height +
@@ -1054,7 +1055,6 @@ static int ov5693_enum_frame_size(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops ov5693_video_ops = {
 	.s_stream = ov5693_s_stream,
-	.g_frame_interval = ov5693_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops ov5693_pad_ops = {
@@ -1064,6 +1064,7 @@ static const struct v4l2_subdev_pad_ops ov5693_pad_ops = {
 	.set_fmt = ov5693_set_fmt,
 	.get_selection = ov5693_get_selection,
 	.set_selection = ov5693_set_selection,
+	.get_frame_interval = ov5693_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov5693_ops = {
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index bf1e7617ee08..a4dc45bdf3d7 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -197,7 +197,7 @@ struct ov6650 {
 	struct clk		*clk;
 	bool			half_scale;	/* scale down output by 2 */
 	struct v4l2_rect	rect;		/* sensor cropping window */
-	struct v4l2_fract	tpf;		/* as requested with s_frame_interval */
+	struct v4l2_fract	tpf;		/* as requested with set_frame_interval */
 	u32 code;
 };
 
@@ -799,8 +799,9 @@ static int ov6650_enum_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov6650_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov6650_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
@@ -813,8 +814,9 @@ static int ov6650_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov6650_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov6650_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
@@ -1006,8 +1008,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops ov6650_video_ops = {
 	.s_stream	= ov6650_s_stream,
-	.g_frame_interval = ov6650_g_frame_interval,
-	.s_frame_interval = ov6650_s_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
@@ -1017,6 +1017,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
 	.set_selection		= ov6650_set_selection,
 	.get_fmt		= ov6650_get_fmt,
 	.set_fmt		= ov6650_set_fmt,
+	.get_frame_interval	= ov6650_get_frame_interval,
+	.set_frame_interval	= ov6650_set_frame_interval,
 	.get_mbus_config	= ov6650_get_mbus_config,
 };
 
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 897a0763df4a..10d6b5deed83 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1386,6 +1386,7 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 }
 
 static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
@@ -1398,6 +1399,7 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 }
 
 static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
@@ -1436,8 +1438,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 	.s_stream = ov7251_s_stream,
-	.g_frame_interval = ov7251_get_frame_interval,
-	.s_frame_interval = ov7251_set_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
@@ -1447,6 +1447,8 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 	.get_fmt = ov7251_get_format,
 	.set_fmt = ov7251_set_format,
 	.get_selection = ov7251_get_selection,
+	.get_frame_interval = ov7251_get_frame_interval,
+	.set_frame_interval = ov7251_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov7251_subdev_ops = {
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 8164c0c433c5..463f20ece36e 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1154,8 +1154,9 @@ static int ov7670_get_fmt(struct v4l2_subdev *sd,
  * Implement G/S_PARM.  There is a "high quality" mode we could try
  * to do someday; for now, we just do the frame rate tweak.
  */
-static int ov7670_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov7670_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct ov7670_info *info = to_state(sd);
 
@@ -1165,8 +1166,9 @@ static int ov7670_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov7670_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov7670_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct v4l2_fract *tpf = &ival->interval;
 	struct ov7670_info *info = to_state(sd);
@@ -1728,22 +1730,18 @@ static const struct v4l2_subdev_core_ops ov7670_core_ops = {
 #endif
 };
 
-static const struct v4l2_subdev_video_ops ov7670_video_ops = {
-	.s_frame_interval = ov7670_s_frame_interval,
-	.g_frame_interval = ov7670_g_frame_interval,
-};
-
 static const struct v4l2_subdev_pad_ops ov7670_pad_ops = {
 	.enum_frame_interval = ov7670_enum_frame_interval,
 	.enum_frame_size = ov7670_enum_frame_size,
 	.enum_mbus_code = ov7670_enum_mbus_code,
 	.get_fmt = ov7670_get_fmt,
 	.set_fmt = ov7670_set_fmt,
+	.get_frame_interval = ov7670_get_frame_interval,
+	.set_frame_interval = ov7670_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov7670_ops = {
 	.core = &ov7670_core_ops,
-	.video = &ov7670_video_ops,
 	.pad = &ov7670_pad_ops,
 };
 
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index e397f7531e1d..a14a25946c5b 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -717,8 +717,9 @@ static int ov772x_set_frame_rate(struct ov772x_priv *priv,
 	return 0;
 }
 
-static int ov772x_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov772x_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct ov772x_priv *priv = to_ov772x(sd);
 	struct v4l2_fract *tpf = &ival->interval;
@@ -729,8 +730,9 @@ static int ov772x_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov772x_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
+static int ov772x_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
 {
 	struct ov772x_priv *priv = to_ov772x(sd);
 	struct v4l2_fract *tpf = &ival->interval;
@@ -1349,8 +1351,6 @@ static int ov772x_enum_mbus_code(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_video_ops ov772x_subdev_video_ops = {
 	.s_stream		= ov772x_s_stream,
-	.s_frame_interval	= ov772x_s_frame_interval,
-	.g_frame_interval	= ov772x_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops ov772x_subdev_pad_ops = {
@@ -1359,6 +1359,8 @@ static const struct v4l2_subdev_pad_ops ov772x_subdev_pad_ops = {
 	.get_selection		= ov772x_get_selection,
 	.get_fmt		= ov772x_get_fmt,
 	.set_fmt		= ov772x_set_fmt,
+	.get_frame_interval	= ov772x_get_frame_interval,
+	.set_frame_interval	= ov772x_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov772x_subdev_ops = {
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 9c13ff5fe9fa..47b1b14d8796 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -638,34 +638,8 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int ov7740_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
-{
-	struct v4l2_fract *tpf = &ival->interval;
-
-
-	tpf->numerator = 1;
-	tpf->denominator = 60;
-
-	return 0;
-}
-
-static int ov7740_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *ival)
-{
-	struct v4l2_fract *tpf = &ival->interval;
-
-
-	tpf->numerator = 1;
-	tpf->denominator = 60;
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops ov7740_subdev_video_ops = {
 	.s_stream = ov7740_set_stream,
-	.s_frame_interval = ov7740_s_frame_interval,
-	.g_frame_interval = ov7740_g_frame_interval,
 };
 
 static const struct reg_sequence ov7740_format_yuyv[] = {
@@ -852,12 +826,26 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov7740_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *ival)
+{
+	struct v4l2_fract *tpf = &ival->interval;
+
+	tpf->numerator = 1;
+	tpf->denominator = 60;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops ov7740_subdev_pad_ops = {
 	.enum_frame_interval = ov7740_enum_frame_interval,
 	.enum_frame_size = ov7740_enum_frame_size,
 	.enum_mbus_code = ov7740_enum_mbus_code,
 	.get_fmt = ov7740_get_fmt,
 	.set_fmt = ov7740_set_fmt,
+	.get_frame_interval = ov7740_get_frame_interval,
+	.set_frame_interval = ov7740_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov7740_subdev_ops = {
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fb19ab0c2a9d..02a595281c49 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2640,33 +2640,8 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
 	return 0;
 }
 
-static int ov8865_g_frame_interval(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_frame_interval *interval)
-{
-	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
-	const struct ov8865_mode *mode;
-	unsigned int framesize;
-	unsigned int fps;
-
-	mutex_lock(&sensor->mutex);
-
-	mode = sensor->state.mode;
-	framesize = mode->hts * (mode->output_size_y +
-				 sensor->ctrls.vblank->val);
-	fps = DIV_ROUND_CLOSEST(sensor->ctrls.pixel_rate->val, framesize);
-
-	interval->interval.numerator = 1;
-	interval->interval.denominator = fps;
-
-	mutex_unlock(&sensor->mutex);
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops ov8865_subdev_video_ops = {
 	.s_stream		= ov8865_s_stream,
-	.g_frame_interval	= ov8865_g_frame_interval,
-	.s_frame_interval	= ov8865_g_frame_interval,
 };
 
 /* Subdev Pad Operations */
@@ -2862,6 +2837,30 @@ static int ov8865_get_selection(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int ov8865_get_frame_interval(struct v4l2_subdev *subdev,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
+{
+	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
+	const struct ov8865_mode *mode;
+	unsigned int framesize;
+	unsigned int fps;
+
+	mutex_lock(&sensor->mutex);
+
+	mode = sensor->state.mode;
+	framesize = mode->hts * (mode->output_size_y +
+				 sensor->ctrls.vblank->val);
+	fps = DIV_ROUND_CLOSEST(sensor->ctrls.pixel_rate->val, framesize);
+
+	interval->interval.numerator = 1;
+	interval->interval.denominator = fps;
+
+	mutex_unlock(&sensor->mutex);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
 	.enum_mbus_code		= ov8865_enum_mbus_code,
 	.get_fmt		= ov8865_get_fmt,
@@ -2869,6 +2868,8 @@ static const struct v4l2_subdev_pad_ops ov8865_subdev_pad_ops = {
 	.enum_frame_size	= ov8865_enum_frame_size,
 	.get_selection		= ov8865_get_selection,
 	.set_selection		= ov8865_get_selection,
+	.get_frame_interval	= ov8865_get_frame_interval,
+	.set_frame_interval	= ov8865_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov8865_subdev_ops = {
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 753f6222102a..f528892c893f 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1101,8 +1101,9 @@ static int ov965x_enum_frame_sizes(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov965x_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int ov965x_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov965x *ov965x = to_ov965x(sd);
 
@@ -1148,8 +1149,9 @@ static int __ov965x_set_frame_interval(struct ov965x *ov965x,
 	return 0;
 }
 
-static int ov965x_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int ov965x_set_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *fi)
 {
 	struct ov965x *ov965x = to_ov965x(sd);
 	int ret;
@@ -1373,12 +1375,12 @@ static const struct v4l2_subdev_pad_ops ov965x_pad_ops = {
 	.enum_frame_size = ov965x_enum_frame_sizes,
 	.get_fmt = ov965x_get_fmt,
 	.set_fmt = ov965x_set_fmt,
+	.get_frame_interval = ov965x_get_frame_interval,
+	.set_frame_interval = ov965x_set_frame_interval,
 };
 
 static const struct v4l2_subdev_video_ops ov965x_video_ops = {
 	.s_stream = ov965x_s_stream,
-	.g_frame_interval = ov965x_g_frame_interval,
-	.s_frame_interval = ov965x_s_frame_interval,
 
 };
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 8f9b5713daf7..73ca50f49812 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -866,8 +866,9 @@ static void s5c73m3_try_format(struct s5c73m3 *state,
 	s5c73m3_fill_mbus_fmt(&fmt->format, *fs, code);
 }
 
-static int s5c73m3_oif_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int s5c73m3_oif_get_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_frame_interval *fi)
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 
@@ -915,8 +916,9 @@ static int __s5c73m3_set_frame_interval(struct s5c73m3 *state,
 	return 0;
 }
 
-static int s5c73m3_oif_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int s5c73m3_oif_set_frame_interval(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_frame_interval *fi)
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 	int ret;
@@ -1497,6 +1499,8 @@ static const struct v4l2_subdev_pad_ops s5c73m3_oif_pad_ops = {
 	.enum_frame_interval	= s5c73m3_oif_enum_frame_interval,
 	.get_fmt		= s5c73m3_oif_get_fmt,
 	.set_fmt		= s5c73m3_oif_set_fmt,
+	.get_frame_interval	= s5c73m3_oif_get_frame_interval,
+	.set_frame_interval	= s5c73m3_oif_set_frame_interval,
 	.get_frame_desc		= s5c73m3_oif_get_frame_desc,
 	.set_frame_desc		= s5c73m3_oif_set_frame_desc,
 };
@@ -1508,8 +1512,6 @@ static const struct v4l2_subdev_core_ops s5c73m3_oif_core_ops = {
 
 static const struct v4l2_subdev_video_ops s5c73m3_oif_video_ops = {
 	.s_stream		= s5c73m3_oif_s_stream,
-	.g_frame_interval	= s5c73m3_oif_g_frame_interval,
-	.s_frame_interval	= s5c73m3_oif_s_frame_interval,
 };
 
 static const struct v4l2_subdev_ops oif_subdev_ops = {
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 03ccfb0e1e11..2fd1ecfeb086 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1118,8 +1118,9 @@ static int s5k5baf_s_stream(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-static int s5k5baf_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int s5k5baf_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
@@ -1131,8 +1132,8 @@ static int s5k5baf_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static void s5k5baf_set_frame_interval(struct s5k5baf *state,
-				       struct v4l2_subdev_frame_interval *fi)
+static void __s5k5baf_set_frame_interval(struct s5k5baf *state,
+					 struct v4l2_subdev_frame_interval *fi)
 {
 	struct v4l2_fract *i = &fi->interval;
 
@@ -1155,13 +1156,14 @@ static void s5k5baf_set_frame_interval(struct s5k5baf *state,
 			  state->fiv);
 }
 
-static int s5k5baf_s_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *fi)
+static int s5k5baf_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
 	mutex_lock(&state->lock);
-	s5k5baf_set_frame_interval(state, fi);
+	__s5k5baf_set_frame_interval(state, fi);
 	mutex_unlock(&state->lock);
 	return 0;
 }
@@ -1526,11 +1528,11 @@ static const struct v4l2_subdev_pad_ops s5k5baf_pad_ops = {
 	.set_fmt		= s5k5baf_set_fmt,
 	.get_selection		= s5k5baf_get_selection,
 	.set_selection		= s5k5baf_set_selection,
+	.get_frame_interval	= s5k5baf_get_frame_interval,
+	.set_frame_interval	= s5k5baf_set_frame_interval,
 };
 
 static const struct v4l2_subdev_video_ops s5k5baf_video_ops = {
-	.g_frame_interval	= s5k5baf_g_frame_interval,
-	.s_frame_interval	= s5k5baf_s_frame_interval,
 	.s_stream		= s5k5baf_s_stream,
 };
 
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 3d46e428e0ac..d4975b180704 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -734,28 +734,26 @@ static int thp7312_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int thp7312_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *fi)
+static int thp7312_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
-	struct v4l2_subdev_state *sd_state;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 	fi->interval.numerator = 1;
 	fi->interval.denominator = thp7312->current_rate->fps;
-	v4l2_subdev_unlock_state(sd_state);
 
 	return 0;
 }
 
-static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *fi)
+static int thp7312_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 	const struct thp7312_mode_info *mode;
 	const struct thp7312_frame_rate *best_rate = NULL;
 	const struct thp7312_frame_rate *rate;
-	struct v4l2_subdev_state *sd_state;
 	unsigned int best_delta = UINT_MAX;
 	unsigned int fps;
 
@@ -764,8 +762,6 @@ static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
 	    ? DIV_ROUND_CLOSEST(fi->interval.denominator, fi->interval.numerator)
 	    : UINT_MAX;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-
 	mode = thp7312->current_mode;
 
 	for (rate = mode->rates; rate->fps && best_delta; ++rate) {
@@ -779,8 +775,6 @@ static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
 
 	thp7312_set_frame_rate(thp7312, best_rate);
 
-	v4l2_subdev_unlock_state(sd_state);
-
 	fi->interval.numerator = 1;
 	fi->interval.denominator = best_rate->fps;
 
@@ -868,8 +862,6 @@ static const struct v4l2_subdev_core_ops thp7312_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops thp7312_video_ops = {
-	.g_frame_interval = thp7312_g_frame_interval,
-	.s_frame_interval = thp7312_s_frame_interval,
 	.s_stream = thp7312_s_stream,
 };
 
@@ -877,6 +869,8 @@ static const struct v4l2_subdev_pad_ops thp7312_pad_ops = {
 	.enum_mbus_code = thp7312_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = thp7312_set_fmt,
+	.get_frame_interval = thp7312_get_frame_interval,
+	.set_frame_interval = thp7312_set_frame_interval,
 	.enum_frame_size = thp7312_enum_frame_size,
 	.enum_frame_interval = thp7312_enum_frame_interval,
 };
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index c37f605cb75f..dee0cf992379 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -738,16 +738,10 @@ static int tvp514x_s_ctrl(struct v4l2_ctrl *ctrl)
 	return err;
 }
 
-/**
- * tvp514x_g_frame_interval() - V4L2 decoder interface handler
- * @sd: pointer to standard V4L2 sub-device structure
- * @ival: pointer to a v4l2_subdev_frame_interval structure
- *
- * Returns the decoder's video CAPTURE parameters.
- */
 static int
-tvp514x_g_frame_interval(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_frame_interval *ival)
+tvp514x_get_frame_interval(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_frame_interval *ival)
 {
 	struct tvp514x_decoder *decoder = to_decoder(sd);
 	enum tvp514x_std current_std;
@@ -762,17 +756,10 @@ tvp514x_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-/**
- * tvp514x_s_frame_interval() - V4L2 decoder interface handler
- * @sd: pointer to standard V4L2 sub-device structure
- * @ival: pointer to a v4l2_subdev_frame_interval structure
- *
- * Configures the decoder to use the input parameters, if possible. If
- * not possible, returns the appropriate error code.
- */
 static int
-tvp514x_s_frame_interval(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_frame_interval *ival)
+tvp514x_set_frame_interval(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_frame_interval *ival)
 {
 	struct tvp514x_decoder *decoder = to_decoder(sd);
 	struct v4l2_fract *timeperframe;
@@ -940,8 +927,6 @@ static const struct v4l2_subdev_video_ops tvp514x_video_ops = {
 	.s_std = tvp514x_s_std,
 	.s_routing = tvp514x_s_routing,
 	.querystd = tvp514x_querystd,
-	.g_frame_interval = tvp514x_g_frame_interval,
-	.s_frame_interval = tvp514x_s_frame_interval,
 	.s_stream = tvp514x_s_stream,
 };
 
@@ -949,6 +934,8 @@ static const struct v4l2_subdev_pad_ops tvp514x_pad_ops = {
 	.enum_mbus_code = tvp514x_enum_mbus_code,
 	.get_fmt = tvp514x_get_pad_format,
 	.set_fmt = tvp514x_set_pad_format,
+	.get_frame_interval = tvp514x_get_frame_interval,
+	.set_frame_interval = tvp514x_set_frame_interval,
 };
 
 static const struct v4l2_subdev_ops tvp514x_ops = {
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 25e0620deff1..4aef584e21da 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1607,7 +1607,8 @@ static int vidioc_g_parm(struct file *file, void *priv,
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
 	if (dev->is_webcam) {
 		rc = v4l2_device_call_until_err(&v4l2->v4l2_dev, 0,
-						video, g_frame_interval, &ival);
+						pad, get_frame_interval, NULL,
+						&ival);
 		if (!rc)
 			p->parm.capture.timeperframe = ival.interval;
 	} else {
@@ -1639,7 +1640,8 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	p->parm.capture.readbuffers = EM28XX_MIN_BUF;
 	p->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
 	rc = v4l2_device_call_until_err(&dev->v4l2->v4l2_dev, 0,
-					video, s_frame_interval, &ival);
+					pad, set_frame_interval, NULL,
+					&ival);
 	if (!rc)
 		p->parm.capture.timeperframe = ival.interval;
 	return rc;
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e9e7e70fa24e..273d83de2a87 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -195,9 +195,9 @@ int v4l2_g_parm_cap(struct video_device *vdev,
 
 	if (vdev->device_caps & V4L2_CAP_READWRITE)
 		a->parm.capture.readbuffers = 2;
-	if (v4l2_subdev_has_op(sd, video, g_frame_interval))
+	if (v4l2_subdev_has_op(sd, pad, get_frame_interval))
 		a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	ret = v4l2_subdev_call(sd, video, g_frame_interval, &ival);
+	ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &ival);
 	if (!ret)
 		a->parm.capture.timeperframe = ival.interval;
 	return ret;
@@ -222,9 +222,9 @@ int v4l2_s_parm_cap(struct video_device *vdev,
 	else
 		a->parm.capture.readbuffers = 0;
 
-	if (v4l2_subdev_has_op(sd, video, g_frame_interval))
+	if (v4l2_subdev_has_op(sd, pad, get_frame_interval))
 		a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	ret = v4l2_subdev_call(sd, video, s_frame_interval, &ival);
+	ret = v4l2_subdev_call_state_active(sd, pad, set_frame_interval, &ival);
 	if (!ret)
 		a->parm.capture.timeperframe = ival.interval;
 	return ret;
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fbefe4cd714..08c908988f7d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -245,29 +245,6 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 	       sd->ops->pad->enum_frame_size(sd, state, fse);
 }
 
-static inline int check_frame_interval(struct v4l2_subdev *sd,
-				       struct v4l2_subdev_frame_interval *fi)
-{
-	if (!fi)
-		return -EINVAL;
-
-	return check_pad(sd, fi->pad);
-}
-
-static int call_g_frame_interval(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_frame_interval *fi)
-{
-	return check_frame_interval(sd, fi) ? :
-	       sd->ops->video->g_frame_interval(sd, fi);
-}
-
-static int call_s_frame_interval(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_frame_interval *fi)
-{
-	return check_frame_interval(sd, fi) ? :
-	       sd->ops->video->s_frame_interval(sd, fi);
-}
-
 static int call_enum_frame_interval(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_frame_interval_enum *fie)
@@ -307,6 +284,34 @@ static int call_set_selection(struct v4l2_subdev *sd,
 	       sd->ops->pad->set_selection(sd, state, sel);
 }
 
+static inline int check_frame_interval(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_frame_interval *fi)
+{
+	if (!fi)
+		return -EINVAL;
+
+	return check_pad(sd, fi->pad) ? :
+	       check_state(sd, state, V4L2_SUBDEV_FORMAT_ACTIVE, fi->pad,
+			   fi->stream);
+}
+
+static int call_get_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, state, fi) ? :
+	       sd->ops->pad->get_frame_interval(sd, state, fi);
+}
+
+static int call_set_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_interval *fi)
+{
+	return check_frame_interval(sd, state, fi) ? :
+	       sd->ops->pad->set_frame_interval(sd, state, fi);
+}
+
 static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 			       struct v4l2_mbus_frame_desc *fd)
 {
@@ -479,6 +484,8 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 	.enum_frame_interval	= call_enum_frame_interval_state,
 	.get_selection		= call_get_selection_state,
 	.set_selection		= call_set_selection_state,
+	.get_frame_interval	= call_get_frame_interval,
+	.set_frame_interval	= call_set_frame_interval,
 	.get_edid		= call_get_edid,
 	.set_edid		= call_set_edid,
 	.dv_timings_cap		= call_dv_timings_cap,
@@ -488,8 +495,6 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
 };
 
 static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
-	.g_frame_interval	= call_g_frame_interval,
-	.s_frame_interval	= call_s_frame_interval,
 	.s_stream		= call_s_stream,
 };
 
@@ -531,6 +536,10 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 	case VIDIOC_SUBDEV_S_SELECTION:
 		which = ((struct v4l2_subdev_selection *)arg)->which;
 		break;
+	case VIDIOC_SUBDEV_G_FRAME_INTERVAL:
+	case VIDIOC_SUBDEV_S_FRAME_INTERVAL:
+		which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		break;
 	case VIDIOC_SUBDEV_G_ROUTING:
 	case VIDIOC_SUBDEV_S_ROUTING:
 		which = ((struct v4l2_subdev_routing *)arg)->which;
@@ -781,7 +790,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			fi->stream = 0;
 
 		memset(fi->reserved, 0, sizeof(fi->reserved));
-		return v4l2_subdev_call(sd, video, g_frame_interval, arg);
+		return v4l2_subdev_call(sd, pad, get_frame_interval, state, fi);
 	}
 
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
@@ -794,7 +803,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			fi->stream = 0;
 
 		memset(fi->reserved, 0, sizeof(fi->reserved));
-		return v4l2_subdev_call(sd, video, s_frame_interval, arg);
+		return v4l2_subdev_call(sd, pad, set_frame_interval, state, fi);
 	}
 
 	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 5d89e4c1b0c2..006e8adac47b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -496,8 +496,9 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int gc0310_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *interval)
+static int gc0310_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
 {
 	interval->interval.numerator = 1;
 	interval->interval.denominator = GC0310_FPS;
@@ -545,7 +546,6 @@ static const struct v4l2_subdev_sensor_ops gc0310_sensor_ops = {
 
 static const struct v4l2_subdev_video_ops gc0310_video_ops = {
 	.s_stream = gc0310_s_stream,
-	.g_frame_interval = gc0310_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
@@ -553,6 +553,7 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.enum_frame_size = gc0310_enum_frame_size,
 	.get_fmt = gc0310_get_fmt,
 	.set_fmt = gc0310_set_fmt,
+	.get_frame_interval = gc0310_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops gc0310_ops = {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 9c20fe915238..aa257322a700 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -698,8 +698,9 @@ static int gc2235_s_config(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int gc2235_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *interval)
+static int gc2235_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
 {
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
@@ -754,7 +755,6 @@ static const struct v4l2_subdev_sensor_ops gc2235_sensor_ops = {
 
 static const struct v4l2_subdev_video_ops gc2235_video_ops = {
 	.s_stream = gc2235_s_stream,
-	.g_frame_interval = gc2235_g_frame_interval,
 };
 
 static const struct v4l2_subdev_core_ops gc2235_core_ops = {
@@ -767,6 +767,7 @@ static const struct v4l2_subdev_pad_ops gc2235_pad_ops = {
 	.enum_frame_size = gc2235_enum_frame_size,
 	.get_fmt = gc2235_get_fmt,
 	.set_fmt = gc2235_set_fmt,
+	.get_frame_interval = gc2235_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops gc2235_ops = {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 8105365fbb2a..459c5b8233ce 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1388,8 +1388,9 @@ static int mt9m114_t_vflip(struct v4l2_subdev *sd, int value)
 	return !!err;
 }
 
-static int mt9m114_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *interval)
+static int mt9m114_get_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *interval)
 {
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
 
@@ -1479,7 +1480,6 @@ static int mt9m114_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 
 static const struct v4l2_subdev_video_ops mt9m114_video_ops = {
 	.s_stream = mt9m114_s_stream,
-	.g_frame_interval = mt9m114_g_frame_interval,
 };
 
 static const struct v4l2_subdev_sensor_ops mt9m114_sensor_ops = {
@@ -1498,6 +1498,7 @@ static const struct v4l2_subdev_pad_ops mt9m114_pad_ops = {
 	.get_fmt = mt9m114_get_fmt,
 	.set_fmt = mt9m114_set_fmt,
 	.set_selection = mt9m114_s_exposure_selection,
+	.get_frame_interval = mt9m114_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops mt9m114_ops = {
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 1de63c82cce1..b3ef04d7ccca 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -845,8 +845,9 @@ static int ov2722_s_config(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int ov2722_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *interval)
+static int ov2722_get_frame_interval(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_frame_interval *interval)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
@@ -901,7 +902,6 @@ static const struct v4l2_subdev_sensor_ops ov2722_sensor_ops = {
 
 static const struct v4l2_subdev_video_ops ov2722_video_ops = {
 	.s_stream = ov2722_s_stream,
-	.g_frame_interval = ov2722_g_frame_interval,
 };
 
 static const struct v4l2_subdev_core_ops ov2722_core_ops = {
@@ -914,6 +914,7 @@ static const struct v4l2_subdev_pad_ops ov2722_pad_ops = {
 	.enum_frame_size = ov2722_enum_frame_size,
 	.get_fmt = ov2722_get_fmt,
 	.set_fmt = ov2722_set_fmt,
+	.get_frame_interval = ov2722_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops ov2722_ops = {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759233a7ba50..f44e6412f4e3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -105,8 +105,8 @@ static unsigned short atomisp_get_sensor_fps(struct atomisp_sub_device *asd)
 	unsigned short fps = 0;
 	int ret;
 
-	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-			       video, g_frame_interval, &fi);
+	ret = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].camera,
+					    pad, get_frame_interval, &fi);
 
 	if (!ret && fi.interval.numerator)
 		fps = fi.interval.denominator / fi.interval.numerator;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 09c0091b920f..01b7fa9b56a2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1739,8 +1739,8 @@ static int atomisp_s_parm(struct file *file, void *fh,
 
 		fi.interval = parm->parm.capture.timeperframe;
 
-		rval = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-					video, s_frame_interval, &fi);
+		rval = v4l2_subdev_call_state_active(isp->inputs[asd->input_curr].camera,
+						     pad, set_frame_interval, &fi);
 		if (!rval)
 			parm->parm.capture.timeperframe = fi.interval;
 
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 8bd9be49cc08..fb96f87e664e 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -393,8 +393,9 @@ static int prp_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int prp_g_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int prp_get_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
@@ -408,8 +409,9 @@ static int prp_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int prp_s_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int prp_set_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
@@ -451,12 +453,12 @@ static const struct v4l2_subdev_pad_ops prp_pad_ops = {
 	.enum_mbus_code = prp_enum_mbus_code,
 	.get_fmt = prp_get_fmt,
 	.set_fmt = prp_set_fmt,
+	.get_frame_interval = prp_get_frame_interval,
+	.set_frame_interval = prp_set_frame_interval,
 	.link_validate = prp_link_validate,
 };
 
 static const struct v4l2_subdev_video_ops prp_video_ops = {
-	.g_frame_interval = prp_g_frame_interval,
-	.s_frame_interval = prp_s_frame_interval,
 	.s_stream = prp_s_stream,
 };
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 04878f07eeba..7bfe433cd322 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1203,8 +1203,9 @@ static int prp_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int prp_g_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int prp_get_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
@@ -1218,8 +1219,9 @@ static int prp_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int prp_s_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int prp_set_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
@@ -1300,11 +1302,11 @@ static const struct v4l2_subdev_pad_ops prp_pad_ops = {
 	.enum_frame_size = prp_enum_frame_size,
 	.get_fmt = prp_get_fmt,
 	.set_fmt = prp_set_fmt,
+	.get_frame_interval = prp_get_frame_interval,
+	.set_frame_interval = prp_set_frame_interval,
 };
 
 static const struct v4l2_subdev_video_ops prp_video_ops = {
-	.g_frame_interval = prp_g_frame_interval,
-	.s_frame_interval = prp_s_frame_interval,
 	.s_stream = prp_s_stream,
 };
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index ce02199e7b1b..c944fb131b0a 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -511,7 +511,8 @@ static int capture_legacy_g_parm(struct file *file, void *fh,
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 
-	ret = v4l2_subdev_call(priv->src_sd, video, g_frame_interval, &fi);
+	ret = v4l2_subdev_call_state_active(priv->src_sd, pad,
+					    get_frame_interval, &fi);
 	if (ret < 0)
 		return ret;
 
@@ -534,7 +535,8 @@ static int capture_legacy_s_parm(struct file *file, void *fh,
 		return -EINVAL;
 
 	fi.interval = a->parm.capture.timeperframe;
-	ret = v4l2_subdev_call(priv->src_sd, video, s_frame_interval, &fi);
+	ret = v4l2_subdev_call_state_active(priv->src_sd, pad,
+					    set_frame_interval, &fi);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 2fc94011fe4d..4308fdc9b58e 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -902,8 +902,9 @@ static const struct csi_skip_desc *csi_find_best_skip(struct v4l2_fract *in,
  * V4L2 subdev operations.
  */
 
-static int csi_g_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int csi_get_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 
@@ -919,8 +920,9 @@ static int csi_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int csi_s_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int csi_set_frame_interval(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 	struct v4l2_fract *input_fi;
@@ -1860,8 +1862,6 @@ static const struct v4l2_subdev_core_ops csi_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops csi_video_ops = {
-	.g_frame_interval = csi_g_frame_interval,
-	.s_frame_interval = csi_s_frame_interval,
 	.s_stream = csi_s_stream,
 };
 
@@ -1873,6 +1873,8 @@ static const struct v4l2_subdev_pad_ops csi_pad_ops = {
 	.set_fmt = csi_set_fmt,
 	.get_selection = csi_get_selection,
 	.set_selection = csi_set_selection,
+	.get_frame_interval = csi_get_frame_interval,
+	.set_frame_interval = csi_set_frame_interval,
 	.link_validate = csi_link_validate,
 };
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 810b38ea3ab9..a51b37679239 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -780,8 +780,9 @@ static int vdic_link_validate(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int vdic_g_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int vdic_get_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_interval *fi)
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
 
@@ -797,8 +798,9 @@ static int vdic_g_frame_interval(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int vdic_s_frame_interval(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *fi)
+static int vdic_set_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_interval *fi)
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
 	struct v4l2_fract *input_fi, *output_fi;
@@ -885,12 +887,12 @@ static const struct v4l2_subdev_pad_ops vdic_pad_ops = {
 	.enum_mbus_code = vdic_enum_mbus_code,
 	.get_fmt = vdic_get_fmt,
 	.set_fmt = vdic_set_fmt,
+	.get_frame_interval = vdic_get_frame_interval,
+	.set_frame_interval = vdic_set_frame_interval,
 	.link_validate = vdic_link_validate,
 };
 
 static const struct v4l2_subdev_video_ops vdic_video_ops = {
-	.g_frame_interval = vdic_g_frame_interval,
-	.s_frame_interval = vdic_s_frame_interval,
 	.s_stream = vdic_s_stream,
 };
 
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 0d94115b9bbb..b1b666179be5 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -222,8 +222,9 @@ static int csi_set_format(struct v4l2_subdev *subdev,
 /*
  * V4L2 Subdevice Video Operations
  */
-static int tegra_csi_g_frame_interval(struct v4l2_subdev *subdev,
-				      struct v4l2_subdev_frame_interval *vfi)
+static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
+					struct v4l2_subdev_state *sd_state,
+					struct v4l2_subdev_frame_interval *vfi)
 {
 	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
 
@@ -430,8 +431,6 @@ static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
  */
 static const struct v4l2_subdev_video_ops tegra_csi_video_ops = {
 	.s_stream = tegra_csi_s_stream,
-	.g_frame_interval = tegra_csi_g_frame_interval,
-	.s_frame_interval = tegra_csi_g_frame_interval,
 };
 
 static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
@@ -440,6 +439,8 @@ static const struct v4l2_subdev_pad_ops tegra_csi_pad_ops = {
 	.enum_frame_interval	= csi_enum_frameintervals,
 	.get_fmt		= csi_get_format,
 	.set_fmt		= csi_set_format,
+	.get_frame_interval	= tegra_csi_get_frame_interval,
+	.set_frame_interval	= tegra_csi_get_frame_interval,
 };
 
 static const struct v4l2_subdev_ops tegra_csi_ops = {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index d278836fd9cb..acf5be24a5ca 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -425,7 +425,7 @@ __v4l2_find_nearest_size(const void *array, size_t array_size,
 
 /**
  * v4l2_g_parm_cap - helper routine for vidioc_g_parm to fill this in by
- *      calling the g_frame_interval op of the given subdev. It only works
+ *      calling the get_frame_interval op of the given subdev. It only works
  *      for V4L2_BUF_TYPE_VIDEO_CAPTURE(_MPLANE), hence the _cap in the
  *      function name.
  *
@@ -438,7 +438,7 @@ int v4l2_g_parm_cap(struct video_device *vdev,
 
 /**
  * v4l2_s_parm_cap - helper routine for vidioc_s_parm to fill this in by
- *      calling the s_frame_interval op of the given subdev. It only works
+ *      calling the set_frame_interval op of the given subdev. It only works
  *      for V4L2_BUF_TYPE_VIDEO_CAPTURE(_MPLANE), hence the _cap in the
  *      function name.
  *
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 61024a74ce38..0ab7dce098e6 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -452,12 +452,6 @@ enum v4l2_subdev_pre_streamon_flags {
  *
  * @g_pixelaspect: callback to return the pixelaspect ratio.
  *
- * @g_frame_interval: callback for VIDIOC_SUBDEV_G_FRAME_INTERVAL()
- *		      ioctl handler code.
- *
- * @s_frame_interval: callback for VIDIOC_SUBDEV_S_FRAME_INTERVAL()
- *		      ioctl handler code.
- *
  * @s_dv_timings: Set custom dv timings in the sub device. This is used
  *	when sub device is capable of setting detailed timing information
  *	in the hardware to generate/detect the video signal.
@@ -496,10 +490,6 @@ struct v4l2_subdev_video_ops {
 	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
 	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
-	int (*g_frame_interval)(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *interval);
-	int (*s_frame_interval)(struct v4l2_subdev *sd,
-				struct v4l2_subdev_frame_interval *interval);
 	int (*s_dv_timings)(struct v4l2_subdev *sd,
 			struct v4l2_dv_timings *timings);
 	int (*g_dv_timings)(struct v4l2_subdev *sd,
@@ -787,6 +777,12 @@ struct v4l2_subdev_state {
  *
  * @set_selection: callback for VIDIOC_SUBDEV_S_SELECTION() ioctl handler code.
  *
+ * @get_frame_interval: callback for VIDIOC_SUBDEV_G_FRAME_INTERVAL()
+ *			ioctl handler code.
+ *
+ * @set_frame_interval: callback for VIDIOC_SUBDEV_S_FRAME_INTERVAL()
+ *			ioctl handler code.
+ *
  * @get_edid: callback for VIDIOC_SUBDEV_G_EDID() ioctl handler code.
  *
  * @set_edid: callback for VIDIOC_SUBDEV_S_EDID() ioctl handler code.
@@ -856,6 +852,12 @@ struct v4l2_subdev_pad_ops {
 	int (*set_selection)(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_selection *sel);
+	int (*get_frame_interval)(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_interval *interval);
+	int (*set_frame_interval)(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_interval *interval);
 	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
 	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
 	int (*dv_timings_cap)(struct v4l2_subdev *sd,
-- 
Regards,

Laurent Pinchart


