Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B613658D72
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Dec 2022 14:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbiL2NeX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Dec 2022 08:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbiL2Ndq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Dec 2022 08:33:46 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82ED12AAA;
        Thu, 29 Dec 2022 05:33:11 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id E578FFF809;
        Thu, 29 Dec 2022 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1672320790;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nucF095QFaw4f6wI9a0wlRWMl7Kh8AU37AG/342AAzo=;
        b=oV48ogxdluxufePlF3Cus7O3h5eFFF0DTCW1M+02aTQXnGlckQ5FH3c1VMvlKlzMkqjJV1
        fXalL93aZ0YcXb7CrV65XotlqXmC0I9k+mwB6pm/nI1mXXxDq8hCacnOII2kQylsdHsv0X
        ec8XShP1w4KbYvk1kblNUvQPFWA6+zq0E+lQmxJC5+fPao6+fmzmISHehzbQDqud55cZTk
        r1HpZ1eL0glcCZybUm8mVkAT4yFVRLjsU8s9f0PqB6sQgtyO7q/1/ho4l6KPPacFiCBZRK
        5UR3V4dtH4XASH/TUrzP9SyJnXsEgbi3vvTcch39TceJt/GzWjRvx7HI6Qx/Qw==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v3 21/21] staging: media: tegra-video: add support for Tegra20 parallel input
Date:   Thu, 29 Dec 2022 14:32:05 +0100
Message-Id: <20221229133205.981397-22-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The VI peripheral of Tegra supports capturing from MIPI CSI-2 or parallel
video (called VIP in the docs).

The staging tegra-video driver currently implements MIPI CSI-2 video
capture for Tegra210. Add support for parallel video capture (VIP) on
Tegra20. With the generalizations added to the VI driver in previous
commits, this is only a matter of adding the vip.c and tegra20.c
implementations and registering them.

Unfortunately there was no documentation available for the VI or VIP
peripherals of Tegra20 (or any other Tegra chips). This implementation has
been based entirely on the code from a vendor kernel based on Linux 3.1 and
massively adapted to fit into the tegra-video driver. Parts of this code is
definitely non-optimal to say the least (especially tegra20_vi_enable() and
the single-frame capture logic), but it was impossible to improve it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v3 (suggested by Dmitry Osipenko):
 - merged the VIP patch and the Tegra20 patch to avoid chicken-egg problem
   due to the two modules depending on each other at build time
 - move tegra20_vip_soc to vip.c
 - remove channel@0 node from device tree parsing
 - remove unused variable

Changed in v2:
 - fix tegra20_vi_enable() to clear bit when on==false
 - clamp width/height from set/try_fmt to avoid returning sizeimage=0
   (fixes v4l2-compliance)
---
 drivers/staging/media/tegra-video/Makefile  |   2 +
 drivers/staging/media/tegra-video/tegra20.c | 661 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c      |   3 +
 drivers/staging/media/tegra-video/vi.h      |   3 +
 drivers/staging/media/tegra-video/video.c   |   5 +
 drivers/staging/media/tegra-video/video.h   |   1 +
 drivers/staging/media/tegra-video/vip.c     | 290 +++++++++
 drivers/staging/media/tegra-video/vip.h     |  68 ++
 8 files changed, 1033 insertions(+)
 create mode 100644 drivers/staging/media/tegra-video/tegra20.c
 create mode 100644 drivers/staging/media/tegra-video/vip.c
 create mode 100644 drivers/staging/media/tegra-video/vip.h

diff --git a/drivers/staging/media/tegra-video/Makefile b/drivers/staging/media/tegra-video/Makefile
index dfa2ef8f99ef..6c7552e05109 100644
--- a/drivers/staging/media/tegra-video/Makefile
+++ b/drivers/staging/media/tegra-video/Makefile
@@ -2,7 +2,9 @@
 tegra-video-objs := \
 		video.o \
 		vi.o \
+		vip.o \
 		csi.o
 
+tegra-video-$(CONFIG_ARCH_TEGRA_2x_SOC)  += tegra20.o
 tegra-video-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 obj-$(CONFIG_VIDEO_TEGRA) += tegra-video.o
diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
new file mode 100644
index 000000000000..ac048bbd58f0
--- /dev/null
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -0,0 +1,661 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tegra20-specific VI implementation
+ *
+ * Copyright (C) 2022 SKIDATA GmbH
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+/*
+ * This source file contains Tegra20 supported video formats,
+ * VI and VIP SoC specific data, operations and registers accessors.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/host1x.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/v4l2-mediabus.h>
+
+#include "vip.h"
+#include "vi.h"
+
+#define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
+
+/* This are just good-sense numbers. The actual min/max is not documented. */
+#define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MIN_HEIGHT	32U
+#define TEGRA20_MAX_WIDTH	2048U
+#define TEGRA20_MAX_HEIGHT	2048U
+
+/* --------------------------------------------------------------------------
+ * Registers
+ */
+
+#define TEGRA_VI_CONT_SYNCPT_OUT_1			0x0060
+#define       VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT	BIT(8)
+#define       VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT	0
+
+#define TEGRA_VI_VI_INPUT_CONTROL			0x0088
+#define       VI_INPUT_FIELD_DETECT			BIT(27)
+#define       VI_INPUT_BT656				BIT(25)
+#define       VI_INPUT_YUV_INPUT_FORMAT_SFT		8  /* bits [9:8] */
+#define       VI_INPUT_YUV_INPUT_FORMAT_UYVY		(0 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		(1 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_YUYV		(2 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
+#define       VI_INPUT_INPUT_FORMAT_YUV422		(0 << VI_INPUT_INPUT_FORMAT_SFT)
+#define       VI_INPUT_VIP_INPUT_ENABLE			BIT(1)
+
+#define TEGRA_VI_VI_CORE_CONTROL			0x008c
+#define       VI_VI_CORE_CONTROL_PLANAR_CONV_IN_SEL_EXT	BIT(31)
+#define       VI_VI_CORE_CONTROL_CSC_INPUT_SEL_EXT	BIT(30)
+#define       VI_VI_CORE_CONTROL_INPUT_TO_ALT_MUX_SFT	27
+#define       VI_VI_CORE_CONTROL_INPUT_TO_CORE_EXT_SFT	24
+#define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_EXT_SFT	21
+#define       VI_VI_CORE_CONTROL_ISP_HOST_STALL_OFF	BIT(20)
+#define       VI_VI_CORE_CONTROL_V_DOWNSCALING		BIT(19)
+#define       VI_VI_CORE_CONTROL_V_AVERAGING		BIT(18)
+#define       VI_VI_CORE_CONTROL_H_DOWNSCALING		BIT(17)
+#define       VI_VI_CORE_CONTROL_H_AVERAGING		BIT(16)
+#define       VI_VI_CORE_CONTROL_CSC_INPUT_SEL		BIT(11)
+#define       VI_VI_CORE_CONTROL_PLANAR_CONV_INPUT_SEL	BIT(10)
+#define       VI_VI_CORE_CONTROL_INPUT_TO_CORE_SFT	8
+#define       VI_VI_CORE_CONTROL_ISP_DOWNSAMPLE_SFT	5
+#define       VI_VI_CORE_CONTROL_OUTPUT_TO_EPP_SFT	2
+#define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_SFT	0
+
+#define TEGRA_VI_VI_FIRST_OUTPUT_CONTROL		0x0090
+#define       VI_OUTPUT_FORMAT_EXT			BIT(22)
+#define       VI_OUTPUT_V_DIRECTION			BIT(20)
+#define       VI_OUTPUT_H_DIRECTION			BIT(19)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT		17
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_UYVY		(0 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY		(1 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YUYV		(2 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YVYU		(3 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_OUTPUT_BYTE_SWAP		BIT(16)
+#define       VI_OUTPUT_LAST_PIXEL_DUPLICATION		BIT(8)
+#define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
+#define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPUT_FORMAT_SFT)
+
+#define TEGRA_VI_VIP_H_ACTIVE				0x00a4
+#define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/line, must be even */
+#define       VI_VIP_H_ACTIVE_START_SFT			0
+
+#define TEGRA_VI_VIP_V_ACTIVE				0x00a8
+#define       VI_VIP_V_ACTIVE_PERIOD_SFT		16 /* active lines */
+#define       VI_VIP_V_ACTIVE_START_SFT			0
+
+#define TEGRA_VI_VB0_START_ADDRESS_FIRST		0x00c4
+#define TEGRA_VI_VB0_BASE_ADDRESS_FIRST			0x00c8
+#define TEGRA_VI_VB0_START_ADDRESS_U			0x00cc
+#define TEGRA_VI_VB0_BASE_ADDRESS_U			0x00d0
+#define TEGRA_VI_VB0_START_ADDRESS_V			0x00d4
+#define TEGRA_VI_VB0_BASE_ADDRESS_V			0x00d8
+
+#define TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE		0x00e0
+#define       VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT		16
+#define       VI_FIRST_OUTPUT_FRAME_WIDTH_SFT		0
+
+#define TEGRA_VI_VB0_COUNT_FIRST			0x00e4
+
+#define TEGRA_VI_VB0_SIZE_FIRST				0x00e8
+#define       VI_VB0_SIZE_FIRST_V_SFT			16
+#define       VI_VB0_SIZE_FIRST_H_SFT			0
+
+#define TEGRA_VI_VB0_BUFFER_STRIDE_FIRST		0x00ec
+#define       VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT	30
+#define       VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT	0
+
+#define TEGRA_VI_H_LPF_CONTROL				0x0108
+#define       VI_H_LPF_CONTROL_CHROMA_SFT		16
+#define       VI_H_LPF_CONTROL_LUMA_SFT			0
+
+#define TEGRA_VI_H_DOWNSCALE_CONTROL			0x010c
+#define TEGRA_VI_V_DOWNSCALE_CONTROL			0x0110
+
+#define TEGRA_VI_VIP_INPUT_STATUS			0x0144
+
+#define TEGRA_VI_VI_DATA_INPUT_CONTROL			0x0168
+#define       VI_DATA_INPUT_SFT				0 /* [11:0] = mask pin inputs to VI core */
+
+#define TEGRA_VI_PIN_INPUT_ENABLE			0x016c
+#define       VI_PIN_INPUT_VSYNC			BIT(14)
+#define       VI_PIN_INPUT_HSYNC			BIT(13)
+#define       VI_PIN_INPUT_VD_SFT			0 /* [11:0] = data bin N input enable */
+
+#define TEGRA_VI_PIN_INVERSION				0x0174
+#define       VI_PIN_INVERSION_VSYNC_ACTIVE_HIGH	BIT(1)
+#define       VI_PIN_INVERSION_HSYNC_ACTIVE_HIGH	BIT(0)
+
+#define TEGRA_VI_CAMERA_CONTROL				0x01a0
+#define       VI_CAMERA_CONTROL_STOP_CAPTURE		BIT(2)
+#define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
+#define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
+
+#define TEGRA_VI_VI_ENABLE				0x01a4
+#define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
+#define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
+
+#define TEGRA_VI_VI_RAISE				0x01ac
+#define       VI_VI_RAISE_ON_EDGE			BIT(0)
+
+/* --------------------------------------------------------------------------
+ * VI
+ */
+
+static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int addr, u32 val)
+{
+	writel(val, chan->vi->iomem + addr);
+}
+
+/*
+ * Get the main input format (YUV/RGB...) and the YUV variant as values to
+ * be written into registers for the current VI input mbus code.
+ */
+static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
+					 unsigned int *main_input_format,
+					 unsigned int *yuv_input_format)
+{
+	unsigned int input_mbus_code = chan->fmtinfo->code;
+
+	(*main_input_format) = VI_INPUT_INPUT_FORMAT_YUV422;
+
+	switch (input_mbus_code) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_UYVY;
+		break;
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_VYUY;
+		break;
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YUYV;
+		break;
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
+		break;
+	}
+}
+
+/*
+ * Get the main output format (YUV/RGB...) and the YUV variant as values to
+ * be written into registers for the current VI output pixel format.
+ */
+static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
+					  unsigned int *main_output_format,
+					  unsigned int *yuv_output_format)
+{
+	u32 output_fourcc = chan->format.pixelformat;
+
+	/* Default to YUV422 non-planar (U8Y8V8Y8) after downscaling */
+	(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV422POST;
+	(*yuv_output_format) = VI_OUTPUT_YUV_OUTPUT_FORMAT_UYVY;
+
+	switch (output_fourcc) {
+	case V4L2_PIX_FMT_UYVY:
+		(*yuv_output_format) = VI_OUTPUT_YUV_OUTPUT_FORMAT_UYVY;
+		break;
+	case V4L2_PIX_FMT_VYUY:
+		(*yuv_output_format) = VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+		(*yuv_output_format) = VI_OUTPUT_YUV_OUTPUT_FORMAT_YUYV;
+		break;
+	case V4L2_PIX_FMT_YVYU:
+		(*yuv_output_format) = VI_OUTPUT_YUV_OUTPUT_FORMAT_YVYU;
+		break;
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
+		break;
+	}
+}
+
+/*
+ * Make the VI to be accessible (needed on Tegra20).
+ *
+ * This function writes an unknown bit into an unknown register. The code
+ * comes from a downstream 3.1 kernel that has a working VIP driver for
+ * Tegra20, and removing it makes the VI completely unaccessible. It should
+ * be rewritten and possibly moved elsewhere, but the appropriate location
+ * and implementation is unknown due to a total lack of documentation.
+ */
+static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
+{
+	/* from arch/arm/mach-tegra/iomap.h */
+	const phys_addr_t TEGRA_APB_MISC_BASE = 0x70000000;
+	const unsigned long reg_offset = 0x42c;
+	void __iomem *apb_misc;
+	u32 val;
+
+	apb_misc = ioremap(TEGRA_APB_MISC_BASE, PAGE_SIZE);
+	if (!apb_misc)
+		apb_misc = ERR_PTR(-ENOENT);
+	if (IS_ERR(apb_misc))
+		return dev_err_probe(vi->dev, PTR_ERR(apb_misc), "cannot access APB_MISC");
+
+	val = readl(apb_misc + reg_offset);
+	val &= ~BIT(0);
+	val |= on ? BIT(0) : 0;
+	writel(val, apb_misc + reg_offset);
+	iounmap(apb_misc);
+
+	return 0;
+}
+
+static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
+{
+	struct tegra_vi *vi = chan->vi;
+	struct host1x_syncpt *out_sp;
+
+	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
+	if (!out_sp)
+		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
+
+	chan->mw_ack_sp[0] = out_sp;
+
+	return 0;
+}
+
+static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *chan)
+{
+	host1x_syncpt_put(chan->mw_ack_sp[0]);
+}
+
+static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
+{
+	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
+	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
+
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+		pix->bytesperline = roundup(pix->width, 2) * 2;
+		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
+		break;
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+		pix->bytesperline = roundup(pix->width, 8);
+		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		break;
+	}
+}
+
+/*
+ * Compute buffer offsets once per stream so that
+ * tegra20_channel_vi_buffer_setup() only has to do very simple maths for
+ * each buffer.
+ */
+static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
+{
+	unsigned int stride = chan->format.bytesperline;
+	unsigned int height = chan->format.height;
+
+	chan->start_offset = 0;
+
+	switch (chan->format.pixelformat) {
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+		if (chan->vflip)
+			chan->start_offset += stride * (height - 1);
+		if (chan->hflip)
+			chan->start_offset += stride - 1;
+		break;
+
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+		chan->addr_offset_u = stride * height;
+		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
+
+		/* For YVU420, we swap the locations of the U and V planes. */
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
+			unsigned long temp;
+
+			temp = chan->addr_offset_u;
+			chan->addr_offset_u = chan->addr_offset_v;
+			chan->addr_offset_v = temp;
+		}
+
+		chan->start_offset_u = chan->addr_offset_u;
+		chan->start_offset_v = chan->addr_offset_v;
+
+		if (chan->vflip) {
+			chan->start_offset   += stride * (height - 1);
+			chan->start_offset_u += (stride / 2) * ((height / 2) - 1);
+			chan->start_offset_v += (stride / 2) * ((height / 2) - 1);
+		}
+		if (chan->hflip) {
+			chan->start_offset   += stride - 1;
+			chan->start_offset_u += (stride / 2) - 1;
+			chan->start_offset_v += (stride / 2) - 1;
+		}
+		break;
+	}
+}
+
+static void release_buffer(struct tegra_vi_channel *chan,
+			   struct tegra_channel_buffer *buf,
+			   enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vb = &buf->buf;
+
+	vb->sequence = chan->sequence++;
+	vb->field = V4L2_FIELD_NONE;
+	vb->vb2_buf.timestamp = ktime_get_ns();
+	vb2_buffer_done(&vb->vb2_buf, state);
+}
+
+static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
+					    struct tegra_channel_buffer *buf)
+{
+	dma_addr_t base = buf->addr;
+
+	switch (chan->fmtinfo->fourcc) {
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_U,  base + chan->addr_offset_u);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_U, base + chan->start_offset_u);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_V,  base + chan->addr_offset_v);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_V, base + chan->start_offset_v);
+		fallthrough;
+
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST,  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST, base + chan->start_offset);
+		break;
+	}
+}
+
+static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
+					 struct tegra_channel_buffer *buf)
+{
+	int err;
+
+	chan->next_out_sp_idx++;
+
+	tegra20_channel_vi_buffer_setup(chan, buf);
+
+	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_ENABLE);
+
+	/* Wait for syncpt counter to reach frame start event threshold */
+	err = host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
+				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
+	if (err) {
+		host1x_syncpt_incr(chan->mw_ack_sp[0]);
+		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\n", err);
+		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
+		return err;
+	}
+
+	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
+			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
+
+	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
+
+	return 0;
+}
+
+static int tegra20_chan_capture_kthread_start(void *data)
+{
+	struct tegra_vi_channel *chan = data;
+	struct tegra_channel_buffer *buf;
+	unsigned int retries = 0;
+	int err = 0;
+
+	while (1) {
+		/*
+		 * Source is not streaming if error is non-zero.
+		 * So, do not dequeue buffers on error and let the thread sleep
+		 * till kthread stop signal is received.
+		 */
+		wait_event_interruptible(chan->start_wait,
+					 kthread_should_stop() ||
+					 (!list_empty(&chan->capture) && !err));
+
+		if (kthread_should_stop())
+			break;
+
+		/* dequeue the buffer and start capture */
+		spin_lock(&chan->start_lock);
+		if (list_empty(&chan->capture)) {
+			spin_unlock(&chan->start_lock);
+			continue;
+		}
+
+		buf = list_first_entry(&chan->capture, struct tegra_channel_buffer, queue);
+		list_del_init(&buf->queue);
+		spin_unlock(&chan->start_lock);
+
+		err = tegra20_channel_capture_frame(chan, buf);
+		if (!err) {
+			retries = 0;
+			continue;
+		}
+
+		if (retries++ > chan->syncpt_timeout_retry)
+			vb2_queue_error(&chan->queue);
+		else
+			err = 0;
+	}
+
+	return 0;
+}
+
+static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
+{
+	u32 output_fourcc = chan->format.pixelformat;
+	int width  = chan->format.width;
+	int height = chan->format.height;
+	int stride_l = chan->format.bytesperline;
+	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
+			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
+	int main_output_format;
+	int yuv_output_format;
+
+	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_format);
+
+	/*
+	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
+	 * for luminance, which is the default and means not to touch
+	 * anything.
+	 */
+	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
+			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
+			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
+
+	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
+	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
+
+	tegra20_vi_write(chan, TEGRA_VI_VI_FIRST_OUTPUT_CONTROL,
+			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
+			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
+			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
+			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
+
+	/* Set up frame size */
+	tegra20_vi_write(chan, TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE,
+			 height << VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT |
+			 width  << VI_FIRST_OUTPUT_FRAME_WIDTH_SFT);
+
+	/* First output memory enabled */
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+
+	/* Set the number of frames in the buffer */
+	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT_FIRST, 1);
+
+	/* Set up buffer frame size */
+	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE_FIRST,
+			 height << VI_VB0_SIZE_FIRST_V_SFT |
+			 width  << VI_VB0_SIZE_FIRST_H_SFT);
+
+	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE_FIRST,
+			 stride_l << VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT |
+			 stride_c << VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT);
+
+	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
+}
+
+static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+	struct media_pipeline *pipe = &chan->video.pipe;
+	int err;
+
+	chan->next_out_sp_idx = host1x_syncpt_read(chan->mw_ack_sp[0]);
+
+	err = video_device_pipeline_start(&chan->video, pipe);
+	if (err)
+		goto error_pipeline_start;
+
+	tegra20_camera_capture_setup(chan);
+
+	err = tegra_channel_set_stream(chan, true);
+	if (err)
+		goto error_set_stream;
+
+	chan->sequence = 0;
+
+	chan->kthread_start_capture = kthread_run(tegra20_chan_capture_kthread_start,
+						  chan, "%s:0", chan->video.name);
+	if (IS_ERR(chan->kthread_start_capture)) {
+		err = PTR_ERR(chan->kthread_start_capture);
+		chan->kthread_start_capture = NULL;
+		dev_err_probe(&chan->video.dev, err, "failed to run capture kthread\n");
+		goto error_kthread_start;
+	}
+
+	return 0;
+
+error_kthread_start:
+	tegra_channel_set_stream(chan, false);
+error_set_stream:
+	video_device_pipeline_stop(&chan->video);
+error_pipeline_start:
+	tegra_channel_release_buffers(chan, VB2_BUF_STATE_QUEUED);
+
+	return err;
+}
+
+static void tegra20_vi_stop_streaming(struct vb2_queue *vq)
+{
+	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
+
+	if (chan->kthread_start_capture) {
+		kthread_stop(chan->kthread_start_capture);
+		chan->kthread_start_capture = NULL;
+	}
+
+	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
+	tegra_channel_set_stream(chan, false);
+	video_device_pipeline_stop(&chan->video);
+}
+
+static const struct tegra_vi_ops tegra20_vi_ops = {
+	.vi_enable = tegra20_vi_enable,
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
+#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
+{							\
+	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
+	.bpp     = BPP,					\
+	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+}
+
+static const struct tegra_video_format tegra20_video_formats[] = {
+	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
+	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+};
+
+const struct tegra_vi_soc tegra20_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra20_vi_ops,
+	.vi_max_channels = 1, /* parallel input (VIP) */
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+/* --------------------------------------------------------------------------
+ * VIP
+ */
+
+/*
+ * VIP-specific configuration for stream start.
+ *
+ * Whatever is common among VIP and CSI is done by the VI component (see
+ * tegra20_vi_start_streaming()). Here we do what is VIP-specific.
+ */
+static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
+{
+	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	int width  = vi_chan->format.width;
+	int height = vi_chan->format.height;
+
+	unsigned int main_input_format;
+	unsigned int yuv_input_format;
+
+	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_format);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_INPUT_CONTROL,
+			 VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, 0);
+	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, 0);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_V_ACTIVE, height << VI_VIP_V_ACTIVE_PERIOD_SFT);
+	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_H_ACTIVE,
+			 roundup(width, 2) << VI_VIP_H_ACTIVE_PERIOD_SFT);
+
+	/*
+	 * For VIP, D9..D2 is mapped to the video decoder's P7..P0.
+	 * Disable/mask out the other Dn wires. When not in BT656
+	 * mode we also need the V/H sync.
+	 */
+	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INPUT_ENABLE,
+			 GENMASK(9, 2) << VI_PIN_INPUT_VD_SFT |
+			 VI_PIN_INPUT_HSYNC | VI_PIN_INPUT_VSYNC);
+	tegra20_vi_write(vi_chan, TEGRA_VI_VI_DATA_INPUT_CONTROL,
+			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
+	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
+			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
+			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
+			 << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
+
+	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_STOP_CAPTURE);
+
+	return 0;
+}
+
+static const struct tegra_vip_ops tegra20_vip_ops = {
+	.vip_start_streaming = tegra20_vip_start_streaming,
+};
+
+const struct tegra_vip_soc tegra20_vip_soc = {
+	.ops = &tegra20_vip_ops,
+};
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1c6877163c2..eae7b1b30b07 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1862,6 +1862,9 @@ static int tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/media/tegra-video/vi.h
index 8fa817757059..c864d4ef81a5 100644
--- a/drivers/staging/media/tegra-video/vi.h
+++ b/drivers/staging/media/tegra-video/vi.h
@@ -292,6 +292,9 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vi_soc tegra20_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index d966b319553f..074ad0dc56ca 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -123,6 +123,10 @@ static int host1x_video_remove(struct host1x_device *dev)
 }
 
 static const struct of_device_id host1x_video_subdevs[] = {
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-vip", },
+	{ .compatible = "nvidia,tegra20-vi", },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
 	{ .compatible = "nvidia,tegra210-vi", },
@@ -141,6 +145,7 @@ static struct host1x_driver host1x_video_driver = {
 
 static struct platform_driver * const drivers[] = {
 	&tegra_csi_driver,
+	&tegra_vip_driver,
 	&tegra_vi_driver,
 };
 
diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/staging/media/tegra-video/video.h
index 1e9be1474a9c..7275affa6558 100644
--- a/drivers/staging/media/tegra-video/video.h
+++ b/drivers/staging/media/tegra-video/video.h
@@ -24,5 +24,6 @@ int tegra_v4l2_nodes_setup_tpg(struct tegra_video_device *vid);
 void tegra_v4l2_nodes_cleanup_tpg(struct tegra_video_device *vid);
 
 extern struct platform_driver tegra_vi_driver;
+extern struct platform_driver tegra_vip_driver;
 extern struct platform_driver tegra_csi_driver;
 #endif
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
new file mode 100644
index 000000000000..a282e4b1a48e
--- /dev/null
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Parallel video capture module (VIP) for the Tegra VI.
+ *
+ * This file implements the VIP-specific infrastructure.
+ *
+ * Copyright (C) 2022 SKIDATA GmbH
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#include <linux/device.h>
+#include <linux/host1x.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-fwnode.h>
+
+#include "vip.h"
+
+static inline struct tegra_vip *host1x_client_to_vip(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_vip, client);
+}
+
+static inline struct tegra_vip_channel *subdev_to_vip_channel(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_vip_channel, subdev);
+}
+
+static inline struct tegra_vip *vip_channel_to_vip(struct tegra_vip_channel *chan)
+{
+	return container_of(chan, struct tegra_vip, chan);
+}
+
+/* Find the previous subdev in the pipeline (i.e. the one connected to our sink pad) */
+static struct v4l2_subdev *tegra_vip_channel_get_prev_subdev(struct tegra_vip_channel *chan)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_pad_remote_pad_first(&chan->pads[TEGRA_VIP_PAD_SINK]);
+	if (!remote_pad)
+		return NULL;
+
+	return media_entity_to_v4l2_subdev(remote_pad->entity);
+}
+
+static int tegra_vip_enable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
+	struct tegra_vip *vip = vip_channel_to_vip(vip_chan);
+	struct v4l2_subdev *prev_subdev = tegra_vip_channel_get_prev_subdev(vip_chan);
+	int err;
+
+	err = pm_runtime_resume_and_get(vip->dev);
+	if (err)
+		return dev_err_probe(vip->dev, err, "failed to get runtime PM\n");
+
+	err = vip->soc->ops->vip_start_streaming(vip_chan);
+	if (err < 0)
+		goto err_start_streaming;
+
+	err = v4l2_subdev_call(prev_subdev, video, s_stream, true);
+	if (err < 0 && err != -ENOIOCTLCMD)
+		goto err_prev_subdev_start_stream;
+
+	return 0;
+
+err_prev_subdev_start_stream:
+err_start_streaming:
+	pm_runtime_put(vip->dev);
+	return err;
+}
+
+static int tegra_vip_disable_stream(struct v4l2_subdev *subdev)
+{
+	struct tegra_vip_channel *vip_chan = subdev_to_vip_channel(subdev);
+	struct tegra_vip *vip = vip_channel_to_vip(vip_chan);
+	struct v4l2_subdev *prev_subdev = tegra_vip_channel_get_prev_subdev(vip_chan);
+
+	v4l2_subdev_call(prev_subdev, video, s_stream, false);
+
+	pm_runtime_put(vip->dev);
+
+	return 0;
+}
+
+static int tegra_vip_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	int err;
+
+	if (enable)
+		err = tegra_vip_enable_stream(subdev);
+	else
+		err = tegra_vip_disable_stream(subdev);
+
+	return err;
+}
+
+static const struct v4l2_subdev_video_ops tegra_vip_video_ops = {
+	.s_stream = tegra_vip_s_stream,
+};
+
+static const struct v4l2_subdev_ops tegra_vip_ops = {
+	.video  = &tegra_vip_video_ops,
+};
+
+static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
+{
+	struct device *dev = vip->dev;
+	struct device_node *np = dev->of_node;
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_PARALLEL
+	};
+	struct fwnode_handle *fwh;
+	struct device_node *ep;
+	unsigned int num_pads;
+	int err;
+
+	dev_dbg(dev, "Parsing %pOF", np);
+
+	ep = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (!ep) {
+		err = -EINVAL;
+		dev_err_probe(dev, err, "%pOF: error getting endpoint node\n", np);
+		goto err_node_put;
+	}
+
+	fwh = of_fwnode_handle(ep);
+	err = v4l2_fwnode_endpoint_parse(fwh, &v4l2_ep);
+	of_node_put(ep);
+	if (err) {
+		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", np);
+		goto err_node_put;
+	}
+
+	num_pads = of_graph_get_endpoint_count(np);
+	if (num_pads != TEGRA_VIP_PADS_NUM) {
+		err = -EINVAL;
+		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", np, num_pads);
+		goto err_node_put;
+	}
+
+	vip->chan.of_node = of_node_get(np);
+	vip->chan.pads[TEGRA_VIP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	vip->chan.pads[TEGRA_VIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	return 0;
+
+err_node_put:
+	of_node_put(np);
+	return err;
+}
+
+static int tegra_vip_channel_init(struct tegra_vip *vip)
+{
+	struct v4l2_subdev *subdev;
+	int err;
+
+	subdev = &vip->chan.subdev;
+	v4l2_subdev_init(subdev, &tegra_vip_ops);
+	subdev->dev = vip->dev;
+	snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s",
+		 kbasename(vip->chan.of_node->full_name));
+
+	v4l2_set_subdevdata(subdev, &vip->chan);
+	subdev->fwnode = of_fwnode_handle(vip->chan.of_node);
+	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	err = media_entity_pads_init(&subdev->entity, TEGRA_VIP_PADS_NUM, vip->chan.pads);
+	if (err)
+		return dev_err_probe(vip->dev, err, "failed to initialize media entity\n");
+
+	err = v4l2_async_register_subdev(subdev);
+	if (err) {
+		dev_err_probe(vip->dev, err, "failed to register subdev\n");
+		goto err_register_subdev;
+	}
+
+	return 0;
+
+err_register_subdev:
+	media_entity_cleanup(&subdev->entity);
+	return err;
+}
+
+static int tegra_vip_init(struct host1x_client *client)
+{
+	struct tegra_vip *vip = host1x_client_to_vip(client);
+	int err;
+
+	err = tegra_vip_channel_of_parse(vip);
+	if (err)
+		return err;
+
+	err = tegra_vip_channel_init(vip);
+	if (err)
+		goto err_init;
+
+	return 0;
+
+err_init:
+	of_node_put(vip->chan.of_node);
+	return err;
+}
+
+static int tegra_vip_exit(struct host1x_client *client)
+{
+	struct tegra_vip *vip = host1x_client_to_vip(client);
+	struct v4l2_subdev *subdev = &vip->chan.subdev;
+
+	v4l2_async_unregister_subdev(subdev);
+	media_entity_cleanup(&subdev->entity);
+	of_node_put(vip->chan.of_node);
+
+	return 0;
+}
+
+static const struct host1x_client_ops vip_client_ops = {
+	.init = tegra_vip_init,
+	.exit = tegra_vip_exit,
+};
+
+static int tegra_vip_probe(struct platform_device *pdev)
+{
+	struct tegra_vip *vip;
+	int err;
+
+	dev_dbg(&pdev->dev, "Probing VIP \"%s\" from %pOF\n", pdev->name, pdev->dev.of_node);
+
+	vip = devm_kzalloc(&pdev->dev, sizeof(*vip), GFP_KERNEL);
+	if (!vip)
+		return -ENOMEM;
+
+	vip->soc = of_device_get_match_data(&pdev->dev);
+
+	vip->dev = &pdev->dev;
+	platform_set_drvdata(pdev, vip);
+
+	/* initialize host1x interface */
+	INIT_LIST_HEAD(&vip->client.list);
+	vip->client.ops = &vip_client_ops;
+	vip->client.dev = &pdev->dev;
+
+	err = host1x_client_register(&vip->client);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to register host1x client\n");
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_vip_remove(struct platform_device *pdev)
+{
+	struct tegra_vip *vip = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&vip->client);
+	if (err)
+		return dev_err_probe(&pdev->dev, err, "failed to unregister host1x client\n");
+
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
+static const struct of_device_id tegra_vip_of_id_table[] = {
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
+#endif
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tegra_vip_of_id_table);
+
+struct platform_driver tegra_vip_driver = {
+	.driver = {
+		.name		= "tegra-vip",
+		.of_match_table	= tegra_vip_of_id_table,
+	},
+	.probe			= tegra_vip_probe,
+	.remove			= tegra_vip_remove,
+};
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
new file mode 100644
index 000000000000..e192ede83f1f
--- /dev/null
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 SKIDATA GmbH
+ * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
+ */
+
+#ifndef __TEGRA_VIP_H__
+#define __TEGRA_VIP_H__
+
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-subdev.h>
+
+enum {
+	TEGRA_VIP_PAD_SINK,
+	TEGRA_VIP_PAD_SOURCE,
+	TEGRA_VIP_PADS_NUM,
+};
+
+struct tegra_vip;
+
+/**
+ * struct tegra_vip_channel - Tegra VIP (parallel video capture) channel
+ *
+ * @subdev: V4L2 subdevice associated with this channel
+ * @pads: media pads for the subdevice entity
+ * @of_node: vip device tree node
+ */
+struct tegra_vip_channel {
+	struct v4l2_subdev subdev;
+	struct media_pad pads[TEGRA_VIP_PADS_NUM];
+	struct device_node *of_node;
+};
+
+/**
+ * struct tegra_vip_ops - Tegra VIP operations
+ *
+ * @vip_start_streaming: programs vip hardware to enable streaming.
+ */
+struct tegra_vip_ops {
+	int (*vip_start_streaming)(struct tegra_vip_channel *vip_chan);
+};
+
+/**
+ * struct tegra_vip_soc - NVIDIA Tegra VIP SoC structure
+ *
+ * @ops: vip hardware operations
+ */
+struct tegra_vip_soc {
+	const struct tegra_vip_ops *ops;
+};
+
+/**
+ * struct tegra_vip - NVIDIA Tegra VIP device structure
+ *
+ * @dev: device struct
+ * @client: host1x_client struct
+ * @soc: pointer to SoC data structure
+ * @chan: the VIP channel
+ */
+struct tegra_vip {
+	struct device *dev;
+	struct host1x_client client;
+	const struct tegra_vip_soc *soc;
+	struct tegra_vip_channel chan;
+};
+
+#endif
-- 
2.34.1

