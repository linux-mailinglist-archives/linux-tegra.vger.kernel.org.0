Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616C76E5B87
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Apr 2023 10:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjDRIEA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Apr 2023 04:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbjDRIDc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Apr 2023 04:03:32 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FA47EEB;
        Tue, 18 Apr 2023 01:02:47 -0700 (PDT)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 120AB24001A;
        Tue, 18 Apr 2023 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681804912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WiE3J/ZOXI1J5wUqjC9+bkIXh5jNrN6O4z7mUkMhHyw=;
        b=i5d1jmjfVRl7A7wPSmJJsjHqYz6LwegI32FzADO4J45upyQzkYZj6YmWP0o2TOuZYDg2cm
        SjxNvdadRt1WocfK0qxLxvjFTTotO6boulfSPfQR689oX5uHrPeOfvSbt9SUh2g442i7rf
        ISsL0+hjuDb1tl15AeZMvmscZzTfTrlD+p3BGe7krJNfDZtumzaor7kdzPwYP8DG7WNZop
        oJldGlV87YpdxAbNjJAP7kR3P4wUvYQCPNix6qvdPF67EiIvqPHqvKBA6Jp82f4D6S+pgO
        j+pWCC2wfvlrSnoRIVcsr3MqLDCMO6mnB6wTvn9zK4FQxi1Yrm37NkqwnRQu7w==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     linux-tegra@vger.kernel.org
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 13/20] staging: media: tegra-video: move default format to soc-specific data
Date:   Tue, 18 Apr 2023 10:00:47 +0200
Message-Id: <20230418080054.452955-14-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
References: <20230418080054.452955-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra_default_format in vi.c is specific to Tegra210 CSI.

In preparation for adding Tegra20 VIP support, move the default format to a
new field in the soc-specific `struct tegra_vi_soc`. Instead of an entire
format struct, only store a pointer to an item in the existing format
array.

No functional changes. The format pointed to is the same that used to be in
vi.c.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

No changes in v6

Changed in v5:
 - Minor update after removal of "staging: media: tegra-video: fix
   .vidioc_enum_fmt_vid_cap to return all formats" patch

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/tegra210.c |  2 ++
 drivers/staging/media/tegra-video/vi.c       | 13 ++-----------
 drivers/staging/media/tegra-video/vi.h       |  2 ++
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index d19ff6b49ae8..b4fcd4e93b8c 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -766,8 +766,10 @@ const struct tegra_vi_soc tegra210_vi_soc = {
 	.hw_revision = 3,
 	.vi_max_channels = 6,
 #if IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG)
+	.default_video_format = &tegra210_video_formats[0],
 	.vi_max_clk_hz = 499200000,
 #else
+	.default_video_format = &tegra210_video_formats[4],
 	.vi_max_clk_hz = 998400000,
 #endif
 };
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 35d7cda1373f..b88532d8d2c9 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -45,15 +45,6 @@ struct tegra_vi_graph_entity {
 	struct v4l2_subdev *subdev;
 };
 
-static const struct tegra_video_format tegra_default_format = {
-	.img_dt = TEGRA_IMAGE_DT_RAW10,
-	.bit_width = 10,
-	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-	.bpp = 2,
-	.img_fmt = TEGRA_IMAGE_FORMAT_DEF,
-	.fourcc = V4L2_PIX_FMT_SRGGB10,
-};
-
 static inline struct tegra_vi *
 host1x_client_to_vi(struct host1x_client *client)
 {
@@ -1103,7 +1094,7 @@ static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	 * there are no matched formats.
 	 */
 	if (!match_code) {
-		match_code = tegra_default_format.code;
+		match_code = chan->vi->soc->default_video_format->code;
 		index = tegra_get_format_idx_by_code(chan->vi, match_code, 0);
 		if (WARN_ON(index < 0))
 			return -EINVAL;
@@ -1200,7 +1191,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 	init_waitqueue_head(&chan->done_wait);
 
 	/* initialize the video format */
-	chan->fmtinfo = &tegra_default_format;
+	chan->fmtinfo = chan->vi->soc->default_video_format;
 	chan->format.pixelformat = chan->fmtinfo->fourcc;
 	chan->format.colorspace = V4L2_COLORSPACE_SRGB;
 	chan->format.field = V4L2_FIELD_NONE;
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 213955c7545d..b424c967c6f2 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -58,6 +58,7 @@ struct tegra_vi_ops {
  *
  * @video_formats: supported video formats
  * @nformats: total video formats
+ * @default_video_format: default video format (pointer to a @video_formats item)
  * @ops: vi operations
  * @hw_revision: VI hw_revision
  * @vi_max_channels: supported max streaming channels
@@ -66,6 +67,7 @@ struct tegra_vi_ops {
 struct tegra_vi_soc {
 	const struct tegra_video_format *video_formats;
 	const unsigned int nformats;
+	const struct tegra_video_format *default_video_format;
 	const struct tegra_vi_ops *ops;
 	u32 hw_revision;
 	unsigned int vi_max_channels;
-- 
2.34.1

