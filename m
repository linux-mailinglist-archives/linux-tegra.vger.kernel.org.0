Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B6514C2A3
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgA1WN0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 17:13:26 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18057 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgA1WN0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 17:13:26 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e30b1f10000>; Tue, 28 Jan 2020 14:13:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 14:13:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 14:13:19 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 22:13:18 +0000
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     Helen Koike <helen.koike@collabora.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
Date:   Tue, 28 Jan 2020 14:13:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580249585; bh=hOVYsWwu1eEyxo4nNcjCuOg78PWPrkSGagqYiqpbPo8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=Xr3KEwIuXOHYuRIIRK3QWYztLvk/n8LC3y6qWFNx96bCXOILGk6qUGwb0gEOdPRoY
         gLdIUKtBBUF2c/PgjgYZoUGev2sTURD7unabEWjz+l5ZmJloFqknn1yHz2iwq/bSMy
         HlcCV+CTo9EeRZqVtxLpGTGWiCvFUrQYsw8itbneCGwXpwTOWu8SJRPiz8Cqmej7J5
         qsxzRhhIpGVKTGDGlFV/PLDytur6nJEpxn9uXaeVx5lAkYTKBQaiR1ecUfUoP6WXUm
         eFsGToO55PoEGbWkspMo/SfhW+deLxL7W2MEztNYgccqk2m508aHdVcOwek8ijSY/+
         LM6+sr8sjt1Gg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 1/28/20 1:45 PM, Helen Koike wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> I just took a really quick look, I didn't check the driver in deep, so ju=
st some small comments below.
>
> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Could you send us the output of media-ctl --print-dot ? So we can view th=
e media topology easily?
root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
digraph board {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rankdir=3DTB
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001 [label=3D"54080000.vi=
-output-0\n/dev/video0",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000005 [label=3D"54080000.vi=
-output-1\n/dev/video1",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009 [label=3D"54080000.vi=
-output-2\n/dev/video2",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000000d [label=3D"54080000.vi=
-output-3\n/dev/video3",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011 [label=3D"54080000.vi=
-output-4\n/dev/video4",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000015 [label=3D"54080000.vi=
-output-5\n/dev/video5",=20
shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019 [label=3D"{{} | tpg-0=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019:port0 -> n00000001
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d [label=3D"{{} | tpg-1=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d:port0 -> n00000005
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021 [label=3D"{{} | tpg-2=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021:port0 -> n00000009
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025 [label=3D"{{} | tpg-3=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025:port0 -> n0000000d
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029 [label=3D"{{} | tpg-4=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029:port0 -> n00000011
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d [label=3D"{{} | tpg-5=
 | {<port0> 0}}", shape=3DMrecord,=20
style=3Dfilled, fillcolor=3Dgreen]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d:port0 -> n00000015
}

>
>> ---
>>   drivers/staging/media/Kconfig               |   2 +
>>   drivers/staging/media/Makefile              |   1 +
>>   drivers/staging/media/tegra/Kconfig         |  12 +
>>   drivers/staging/media/tegra/Makefile        |  11 +
>>   drivers/staging/media/tegra/TODO            |  10 +
>>   drivers/staging/media/tegra/csi.h           | 111 +++++
>>   drivers/staging/media/tegra/csi2_fops.c     | 335 +++++++++++++++
>>   drivers/staging/media/tegra/csi2_fops.h     |  15 +
>>   drivers/staging/media/tegra/host1x-video.c  | 120 ++++++
>>   drivers/staging/media/tegra/host1x-video.h  |  33 ++
>>   drivers/staging/media/tegra/mc_common.h     | 131 ++++++
>>   drivers/staging/media/tegra/tegra-channel.c | 628 ++++++++++++++++++++=
++++++++
>>   drivers/staging/media/tegra/tegra-core.c    | 111 +++++
>>   drivers/staging/media/tegra/tegra-core.h    | 125 ++++++
>>   drivers/staging/media/tegra/tegra-csi.c     | 380 +++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.c      | 351 ++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.h      | 101 +++++
>>   drivers/staging/media/tegra/vi2_fops.c      | 364 ++++++++++++++++
>>   drivers/staging/media/tegra/vi2_fops.h      |  15 +
>>   drivers/staging/media/tegra/vi2_formats.h   | 119 ++++++
>>   drivers/staging/media/tegra/vi2_registers.h | 194 +++++++++
>>   21 files changed, 3169 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/csi.h
>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.c
>>   create mode 100644 drivers/staging/media/tegra/csi2_fops.h
>>   create mode 100644 drivers/staging/media/tegra/host1x-video.c
>>   create mode 100644 drivers/staging/media/tegra/host1x-video.h
>>   create mode 100644 drivers/staging/media/tegra/mc_common.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-channel.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-core.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-core.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.c
>>   create mode 100644 drivers/staging/media/tegra/vi2_fops.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_formats.h
>>   create mode 100644 drivers/staging/media/tegra/vi2_registers.h
>>
>> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconf=
ig
>> index c394abffea86..e367030d4407 100644
>> --- a/drivers/staging/media/Kconfig
>> +++ b/drivers/staging/media/Kconfig
>> @@ -34,6 +34,8 @@ source "drivers/staging/media/sunxi/Kconfig"
>>
>>   source "drivers/staging/media/tegra-vde/Kconfig"
>>
>> +source "drivers/staging/media/tegra/Kconfig"
>> +
>>   source "drivers/staging/media/ipu3/Kconfig"
>>
>>   source "drivers/staging/media/soc_camera/Kconfig"
>> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Make=
file
>> index ea9fce8014bb..67a22ac709e8 100644
>> --- a/drivers/staging/media/Makefile
>> +++ b/drivers/staging/media/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_VIDEO_IPU3_IMGU)       +=3D ipu3/
>>   obj-$(CONFIG_SOC_CAMERA)     +=3D soc_camera/
>>   obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)  +=3D phy-rockchip-dphy-rx0/
>>   obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)    +=3D rkisp1/
>> +obj-$(CONFIG_VIDEO_TEGRA)    +=3D tegra/
>> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media=
/tegra/Kconfig
>> new file mode 100644
>> index 000000000000..443b99f2e2c9
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Kconfig
>> @@ -0,0 +1,12 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config VIDEO_TEGRA
>> +     tristate "NVIDIA Tegra VI driver"
>> +     depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>> +     depends on COMMON_CLK
>> +     depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
>> +     depends on MEDIA_CONTROLLER
>> +     select TEGRA_HOST1X
>> +     select VIDEOBUF2_DMA_CONTIG
>> +     select V4L2_FWNODE
>> +     help
>> +       Say yes here to enable support for Tegra video input hardware
>> diff --git a/drivers/staging/media/tegra/Makefile b/drivers/staging/medi=
a/tegra/Makefile
>> new file mode 100644
>> index 000000000000..003d23444d49
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/Makefile
>> @@ -0,0 +1,11 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +tegra-video-y :=3D \
>> +             host1x-video.o \
>> +             tegra-channel.o \
>> +             tegra-core.o \
>> +             csi2_fops.o \
>> +             vi2_fops.o \
>> +             tegra-vi.o \
>> +             tegra-csi.o
>> +
>> +obj-$(CONFIG_VIDEO_TEGRA) +=3D tegra-video.o
>> diff --git a/drivers/staging/media/tegra/TODO b/drivers/staging/media/te=
gra/TODO
>> new file mode 100644
>> index 000000000000..d7d64b13535e
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/TODO
>> @@ -0,0 +1,10 @@
>> +TODO list
>> +* Currently driver supports Tegra build-in TPG Only with direct media l=
inks from CSI to VI.
>> +  Update the driver to do TPG Vs Sensor media links based on the kernel=
 config CONFIG_VIDEO_TEGRA_TPG.
>> +* Add real camera sensor capture support
>> +* Add RAW10 packed video format support to Tegra210 video formats
>> +* Add Tegra CSI MIPI pads calibration
>> +* Add MIPI clock Settle time computation based on the data rate
>> +* Add support for Ganged mode
>> +* Make sure v4l2-compliance tests pass with all of the above implementa=
tions.
>> +* Add SMMU support for VI to avoid cma_alloc failures with higher resol=
utions of some video formats.
>> diff --git a/drivers/staging/media/tegra/csi.h b/drivers/staging/media/t=
egra/csi.h
>> new file mode 100644
>> index 000000000000..81cdda4b6bdd
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi.h
>> @@ -0,0 +1,111 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __CSI_H_
>> +#define __CSI_H_
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +/*
>> + * Each CSI brick supports max of 4 lanes that can be used as either
>> + * one x4 port using both CILA and CILB partitions of a CSI brick or ca=
n
>> + * be used as two x2 ports with one x2 from CILA and the other x2 from
>> + * CILB.
>> + */
>> +#define CSI_LANES_PER_BRICK  4
>> +#define CSI_PORTS_PER_BRICK  2
>> +
>> +/* each CSI channel can have one sink and one source pads */
>> +#define TEGRA_CSI_PADS_NUM   2
>> +
>> +enum tegra_csi_cil_port {
>> +     PORT_A =3D 0,
>> +     PORT_B,
>> +};
>> +
>> +enum tegra_csi_block {
>> +     CSI_CIL_AB =3D 0,
>> +     CSI_CIL_CD,
>> +     CSI_CIL_EF,
>> +};
>> +
>> +struct tegra_csi_device;
>> +
>> +struct tegra_csi_port {
>> +     void __iomem *pixel_parser;
>> +     void __iomem *cila;
>> +     void __iomem *cilb;
>> +     void __iomem *tpg;
>> +
>> +     /* one pair of sink/source pad has one format */
>> +     struct v4l2_mbus_framefmt format;
>> +     unsigned int lanes;
>> +};
>> +
>> +struct tegra_csi_channel {
>> +     struct list_head list;
>> +     struct v4l2_subdev subdev;
>> +     struct media_pad pads[TEGRA_CSI_PADS_NUM];
>> +     struct device_node *of_node;
>> +     struct tegra_csi_device *csi;
>> +     struct tegra_csi_port *ports;
>> +     unsigned int numlanes;
>> +     unsigned int numpads;
>> +     u8 csi_port_num;
>> +
>> +     /* protects csi channel ports format fields */
>> +     struct mutex format_lock;
>> +};
>> +
>> +struct tegra_csi_soc_data {
>> +     const struct tegra_csi_fops *csi_fops;
>> +     unsigned int cil_max_clk_hz;
>> +     unsigned int num_tpg_channels;
>> +};
>> +
>> +/**
>> + * struct tegra_csi_device - NVIDIA Tegra CSI device structure
>> + * @dev: device struct
>> + * @client: host1x_client struct
>> + *
>> + * @iomem: register base
>> + * @csi_clk: clock for CSI
>> + * @cilab_clk: clock for CIL AB
>> + * @cilcd_clk: clock for CIL CD
>> + * @cilef_clk: clock for CIL EF
>> + * @tpg_clk: clock for internal CSI TPG logic
>> + *
>> + * @soc_data: pointer to SoC data structure
>> + * @fops: csi operations
>> + *
>> + * @channels: list of CSI channels
>> + */
>> +struct tegra_csi_device {
>> +     struct device *dev;
>> +     struct host1x_client client;
>> +
>> +     void __iomem *iomem;
>> +     struct clk *csi_clk;
>> +     struct clk *cilab_clk;
>> +     struct clk *cilcd_clk;
>> +     struct clk *cilef_clk;
>> +     struct clk *tpg_clk;
>> +     atomic_t clk_refcnt;
>> +
>> +     const struct tegra_csi_soc_data *soc_data;
>> +     const struct tegra_csi_fops *fops;
>> +
>> +     struct list_head csi_chans;
>> +};
>> +
>> +void tegra_csi_error_status(struct v4l2_subdev *subdev);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/csi2_fops.c b/drivers/staging/m=
edia/tegra/csi2_fops.c
>> new file mode 100644
>> index 000000000000..5f2f7bd3ae50
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/delay.h>
>> +
>> +#include "vi2_registers.h"
>> +#include "mc_common.h"
>> +#include "csi2_fops.h"
>> +#include "csi.h"
>> +
>> +/* CSI block registers offset */
>> +#define TEGRA210_CSI_PORT_OFFSET             0x34
>> +/* CSI CIL parition registers offset */
>> +#define TEGRA210_CSI_CIL_OFFSET                      0x0f4
>> +/* CSI TPG registers offset */
>> +#define TEGRA210_CSI_TPG_OFFSET                      0x18c
>> +
>> +#define CSI_PP_OFFSET(block) ((block) * 0x800)
>> +
>> +static void csi_write(struct tegra_csi_channel *chan, u8 block,
>> +                   unsigned int addr, u32 val)
>> +{
>> +     void __iomem *csi_pp_base;
>> +
>> +     csi_pp_base =3D chan->csi->iomem + CSI_PP_OFFSET(block);
>> +     writel(val, csi_pp_base + addr);
>> +}
>> +
>> +/* Pixel parser registers accessors */
>> +static void pp_write(struct tegra_csi_port *port, u32 addr, u32 val)
>> +{
>> +     writel(val, port->pixel_parser + addr);
>> +}
>> +
>> +static u32 pp_read(struct tegra_csi_port *port, u32 addr)
>> +{
>> +     return readl(port->pixel_parser + addr);
>> +}
>> +
>> +/* CSI CIL A/B port registers accessors */
>> +static void cil_write(struct tegra_csi_port *port, u8 port_id,
>> +                   u32 addr, u32 val)
>> +{
>> +     if (port_id & PORT_B)
>> +             writel(val, port->cilb + addr);
>> +     else
>> +             writel(val, port->cila + addr);
>> +}
>> +
>> +static u32 cil_read(struct tegra_csi_port *port, u8 port_id,
>> +                 u32 addr)
>> +{
>> +     if (port_id & PORT_B)
>> +             return readl(port->cilb + addr);
>> +     else
>> +             return readl(port->cila + addr);
>> +}
>> +
>> +/* Test pattern generator registers accessor */
>> +static void tpg_write(struct tegra_csi_port *port, unsigned int addr, u=
32 val)
>> +{
>> +     writel(val, port->tpg + addr);
>> +}
>> +
>> +static void csi2_error_status(struct tegra_csi_channel *csi_chan)
>> +{
>> +     struct tegra_csi_device *csi =3D csi_chan->csi;
>> +     unsigned int port_num =3D csi_chan->csi_port_num;
>> +     struct tegra_csi_port *port =3D csi_chan->ports;
>> +     u32 val;
>> +
>> +     val =3D pp_read(port, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n", val);
>> +
>> +     val =3D cil_read(port, port_num, TEGRA_CSI_CIL_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +     val =3D cil_read(port, port_num, TEGRA_CSI_CILX_STATUS);
>> +     dev_err(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +}
>> +
>> +static int csi2_start_streaming(struct tegra_csi_channel *csi_chan,
>> +                             u8 pg_mode, int enable)
>> +{
>> +     struct tegra_csi_device *csi =3D csi_chan->csi;
>> +     unsigned int port_num =3D csi_chan->csi_port_num;
>> +     unsigned int block =3D port_num >> 1;
>> +     struct tegra_csi_port *port =3D csi_chan->ports;
>> +     unsigned int cil_max_freq =3D csi->soc_data->cil_max_clk_hz;
>> +     struct clk *cil_clk;
>> +     int ret;
>> +
>> +     if (block =3D=3D CSI_CIL_AB)
>> +             cil_clk =3D csi->cilab_clk;
>> +     else if (block =3D=3D CSI_CIL_CD)
>> +             cil_clk =3D csi->cilcd_clk;
>> +     else
>> +             cil_clk =3D csi->cilef_clk;
>> +
>> +     if (enable) {
>> +             ret =3D clk_set_rate(cil_clk, cil_max_freq);
>> +             if (ret)
>> +                     dev_err(csi->dev,
>> +                             "failed to set cil clk rate, err: %d\n", r=
et);
>> +
>> +             /* enable CIL clock on first open */
>> +             if (atomic_add_return(1, &csi->clk_refcnt) =3D=3D 1) {
>> +                     ret =3D clk_prepare_enable(cil_clk);
>> +                     if (ret) {
>> +                             dev_err(csi->dev,
>> +                                     "failed to enable cil clk, err: %d=
\n",
>> +                                     ret);
>> +                             return ret;
>> +                     }
>> +             }
>> +
>> +             /*
>> +              * On Tegra210, TPG internal logic uses PLLD out along wit=
h
>> +              * the CIL clock.
>> +              * So, enable TPG clock during TPG mode streaming.
>> +              */
>> +             if (pg_mode) {
>> +                     ret =3D clk_set_rate(csi->tpg_clk, TEGRA210_TPG_CL=
OCK);
>> +                     if (ret)
>> +                             dev_err(csi->dev,
>> +                                     "failed to set tpg clk rate\n");
>> +
>> +                     ret =3D clk_prepare_enable(csi->tpg_clk);
>> +                     if (ret) {
>> +                             dev_err(csi->dev,
>> +                                     "failed to enable tpg clk, err: %d=
\n",
>> +                                     ret);
>> +                             return ret;
>> +                     }
>> +             }
>> +
>> +             csi_write(csi_chan, block, TEGRA_CSI_CLKEN_OVERRIDE, 0);
>> +
>> +             /* clean up status */
>> +             pp_write(port, TEGRA_CSI_PIXEL_PARSER_STATUS, 0xFFFFFFFF);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_STATUS, 0xFFFFFFFF=
);
>> +             cil_write(port, port_num, TEGRA_CSI_CILX_STATUS, 0xFFFFFFF=
F);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_INTERRUPT_MASK, 0x=
0);
>> +
>> +             /* CIL PHY registers setup */
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +             cil_write(port, port_num, TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +             /*
>> +              * The CSI unit provides for connection of up to six camer=
as in
>> +              * the system and is organized as three identical instance=
s of
>> +              * two MIPI support blocks, each with a separate 4-lane
>> +              * interface that can be configured as a single camera wit=
h 4
>> +              * lanes or as a dual camera with 2 lanes available for ea=
ch
>> +              * camera.
>> +              */
>> +             if (port->lanes =3D=3D 4) {
>> +                     cil_write(port, port_num, TEGRA_CSI_CIL_PAD_CONFIG=
0,
>> +                               BRICK_CLOCK_A_4X);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_PAD_CONFIG0, 0x0);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_INTERRUPT_MASK, 0x0);
>> +
>> +                     cil_write(port, (port_num + 1),
>> +                               TEGRA_CSI_CIL_PHY_CONTROL, 0xA);
>> +
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMA=
ND,
>> +                               CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_ENA=
BLE);
>> +             } else {
>> +                     u32 val =3D ((port_num & 1) =3D=3D PORT_A) ?
>> +                               CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_NOP=
 :
>> +                               CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_NOP=
;
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMA=
ND,
>> +                               val);
>> +             }
>> +
>> +             /* CSI pixel parser registers setup */
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_RST);
>> +             pp_write(port, TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK, 0x0)=
;
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL0,
>> +                      CSI_PP_PACKET_HEADER_SENT |
>> +                      CSI_PP_DATA_IDENTIFIER_ENABLE |
>> +                      CSI_PP_WORD_COUNT_SELECT_HEADER |
>> +                      CSI_PP_CRC_CHECK_ENABLE |  CSI_PP_WC_CHECK |
>> +                      CSI_PP_OUTPUT_FORMAT_STORE |
>> +                      CSI_PP_HEADER_EC_DISABLE | CSI_PPA_PAD_FRAME_NOPA=
D |
>> +                      (port_num & 1));
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_CONTROL1,
>> +                      (0x1 << CSI_PP_TOP_FIELD_FRAME_OFFSET) |
>> +                      (0x1 << CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET));
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_GAP,
>> +                      0x14 << PP_FRAME_MIN_GAP_OFFSET);
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME, 0x0)=
;
>> +             pp_write(port, TEGRA_CSI_INPUT_STREAM_CONTROL,
>> +                      (0x3f << CSI_SKIP_PACKET_THRESHOLD_OFFSET) |
>> +                      (port->lanes - 1));
>> +
>> +             /* TPG setup */
>> +             if (pg_mode) {
>> +                     tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +                               ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +                               PG_ENABLE);
>> +                     tpg_write(port, TEGRA_CSI_PG_PHASE, 0x0);
>> +                     tpg_write(port, TEGRA_CSI_PG_RED_FREQ,
>> +                               (0x10 << PG_RED_VERT_INIT_FREQ_OFFSET) |
>> +                               (0x10 << PG_RED_HOR_INIT_FREQ_OFFSET));
>> +                     tpg_write(port, TEGRA_CSI_PG_RED_FREQ_RATE, 0x0);
>> +                     tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ,
>> +                               (0x10 << PG_GREEN_VERT_INIT_FREQ_OFFSET)=
 |
>> +                               (0x10 << PG_GREEN_HOR_INIT_FREQ_OFFSET))=
;
>> +                     tpg_write(port, TEGRA_CSI_PG_GREEN_FREQ_RATE, 0x0)=
;
>> +                     tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ,
>> +                               (0x10 << PG_BLUE_VERT_INIT_FREQ_OFFSET) =
|
>> +                               (0x10 << PG_BLUE_HOR_INIT_FREQ_OFFSET));
>> +                     tpg_write(port, TEGRA_CSI_PG_BLUE_FREQ_RATE, 0x0);
>> +             }
>> +
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_SINGLE_SHOT_ENABLE | CSI_PP_ENABLE);
>> +     } else {
>> +             u32 val =3D pp_read(port, TEGRA_CSI_PIXEL_PARSER_STATUS);
>> +
>> +             dev_dbg(csi->dev, "TEGRA_CSI_PIXEL_PARSER_STATUS 0x%08x\n"=
,
>> +                     val);
>> +
>> +             val =3D cil_read(port, port_num, TEGRA_CSI_CIL_STATUS);
>> +             dev_dbg(csi->dev, "TEGRA_CSI_CIL_STATUS 0x%08x\n", val);
>> +
>> +             val =3D cil_read(port, port_num, TEGRA_CSI_CILX_STATUS);
>> +             dev_dbg(csi->dev, "TEGRA_CSI_CILX_STATUS 0x%08x\n", val);
>> +
>> +             pp_write(port, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND,
>> +                      (0xF << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
>> +                      CSI_PP_DISABLE);
>> +
>> +             if (pg_mode) {
>> +                     tpg_write(port, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
>> +                               ((pg_mode - 1) << PG_MODE_OFFSET) |
>> +                               PG_DISABLE);
>> +                     clk_disable_unprepare(csi->tpg_clk);
>> +             }
>> +
>> +             if (port->lanes =3D=3D 4) {
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMA=
ND,
>> +                               CSI_A_PHY_CIL_DISABLE |
>> +                               CSI_B_PHY_CIL_DISABLE);
>> +
>> +             } else {
>> +                     u32 val =3D ((port_num & 1) =3D=3D PORT_A) ?
>> +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_NO=
P :
>> +                               CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NO=
P;
>> +                     csi_write(csi_chan, block, TEGRA_CSI_PHY_CIL_COMMA=
ND,
>> +                               val);
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int csi2_hw_init(struct tegra_csi_device *csi)
>> +{
>> +     struct tegra_csi_channel *csi_chan;
>> +     struct tegra_csi_port *port;
>> +     u8 portno;
>> +     int ret;
>> +
>> +     csi->cilab_clk =3D devm_clk_get(csi->dev, "cilab");
>> +     if (IS_ERR(csi->cilab_clk)) {
>> +             dev_err(csi->dev, "Failed to get cilab clock\n");
>> +             return PTR_ERR(csi->cilab_clk);
>> +     }
>> +
>> +     csi->cilcd_clk =3D devm_clk_get(csi->dev, "cilcd");
>> +     if (IS_ERR(csi->cilcd_clk)) {
>> +             dev_err(csi->dev, "Failed to get cilcd clock\n");
>> +             return PTR_ERR(csi->cilcd_clk);
>> +     }
>> +
>> +     csi->cilef_clk =3D devm_clk_get(csi->dev, "cile");
>> +     if (IS_ERR(csi->cilef_clk)) {
>> +             dev_err(csi->dev, "Failed to get cile clock\n");
>> +             return PTR_ERR(csi->cilef_clk);
>> +     }
>> +
>> +     csi->tpg_clk =3D devm_clk_get(csi->dev, "csi_tpg");
>> +     if (IS_ERR(csi->tpg_clk)) {
>> +             dev_err(csi->dev, "Failed to get csi_tpg clock\n");
>> +             return PTR_ERR(csi->tpg_clk);
>> +     }
>> +
>> +     csi->csi_clk =3D devm_clk_get(csi->dev, "csi");
>> +     if (IS_ERR(csi->csi_clk)) {
>> +             dev_err(csi->dev, "Failed to get csi clock\n");
>> +             return PTR_ERR(csi->csi_clk);
>> +     }
>> +
>> +     ret =3D clk_prepare_enable(csi->csi_clk);
>> +     if (ret) {
>> +             dev_err(csi->dev, "Failed to enable csi clk, err: %d\n", r=
et);
>> +             return ret;
>> +     }
>> +
>> +     list_for_each_entry(csi_chan, &csi->csi_chans, list) {
>> +             void __iomem *csi_pp_base;
>> +
>> +             port =3D csi_chan->ports;
>> +             portno =3D csi_chan->csi_port_num;
>> +             csi_pp_base =3D csi->iomem + CSI_PP_OFFSET(portno >> 1);
>> +             port->pixel_parser =3D csi_pp_base +
>> +                                  (portno % CSI_PORTS_PER_BRICK) *
>> +                                  TEGRA210_CSI_PORT_OFFSET;
>> +             port->cila =3D csi_pp_base + TEGRA210_CSI_CIL_OFFSET;
>> +             port->cilb =3D port->cila + TEGRA210_CSI_PORT_OFFSET;
>> +             port->tpg =3D port->pixel_parser + TEGRA210_CSI_TPG_OFFSET=
;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +const struct tegra_csi_fops csi2_fops =3D {
>> +     .hw_init =3D csi2_hw_init,
>> +     .csi_start_streaming =3D csi2_start_streaming,
>> +     .csi_err_status =3D csi2_error_status,
>> +};
> If I saw correctly, you don't have other instances of struct tegra_csi_fo=
ps with different functions.
> So why not exposing the functions directly instead of creating a global v=
ariable?
Currently driver supports Tegra210 only. Later we will add for Tegra186=20
and Tegra184 support too where we will have separate csi fops.
>> +EXPORT_SYMBOL(csi2_fops);
>> diff --git a/drivers/staging/media/tegra/csi2_fops.h b/drivers/staging/m=
edia/tegra/csi2_fops.h
>> new file mode 100644
>> index 000000000000..cf22a28ceb1f
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/csi2_fops.h
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __CSI2_H__
>> +#define __CSI2_H__
>> +
>> +#define      TEGRA210_TPG_CLOCK              594000000
>> +#define      TEGRA210_CSI_CIL_CLK_MAX        102000000
>> +#define TEGRA210_CSI_BRICKS_MAX              3
>> +
>> +extern const struct tegra_csi_fops csi2_fops;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/host1x-video.c b/drivers/stagin=
g/media/tegra/host1x-video.c
>> new file mode 100644
>> index 000000000000..740806121e6b
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "host1x-video.h"
>> +
>> +static int host1x_video_probe(struct host1x_device *dev)
>> +{
>> +     struct tegra_camera *cam;
>> +     int ret;
>> +
>> +     cam =3D devm_kzalloc(&dev->dev, sizeof(*cam), GFP_KERNEL);
>> +     if (!cam)
>> +             return -ENOMEM;
>> +
>> +     cam->dev =3D get_device(&dev->dev);
>> +     cam->media_dev.dev =3D cam->dev;
>> +     strscpy(cam->media_dev.model, "NVIDIA Tegra Video Input Device",
>> +             sizeof(cam->media_dev.model));
>> +     cam->media_dev.hw_revision =3D 3;
>> +
>> +     media_device_init(&cam->media_dev);
>> +     ret =3D media_device_register(&cam->media_dev);
>> +     if (ret < 0) {
>> +             dev_err(cam->dev, "failed to register media device: %d\n",=
 ret);
>> +             return ret;
>> +     }
>> +
>> +     cam->v4l2_dev.mdev =3D &cam->media_dev;
>> +     ret =3D v4l2_device_register(cam->dev, &cam->v4l2_dev);
>> +     if (ret < 0) {
>> +             dev_err(cam->dev, "V4L2 device registration failed: %d\n",=
 ret);
>> +             goto register_error;
>> +     }
>> +
>> +     dev_set_drvdata(&dev->dev, cam);
>> +
>> +     ret =3D host1x_device_init(dev);
>> +     if (ret < 0)
>> +             goto dev_exit;
>> +
>> +     return 0;
>> +
>> +dev_exit:
>> +     host1x_device_exit(dev);
>> +     v4l2_device_unregister(&cam->v4l2_dev);
>> +register_error:
>> +     media_device_unregister(&cam->media_dev);
>> +     media_device_cleanup(&cam->media_dev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int host1x_video_remove(struct host1x_device *dev)
>> +{
>> +     struct tegra_camera *cam =3D dev_get_drvdata(&dev->dev);
>> +
>> +     host1x_device_exit(dev);
>> +     v4l2_device_unregister(&cam->v4l2_dev);
>> +     media_device_unregister(&cam->media_dev);
>> +     media_device_cleanup(&cam->media_dev);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id host1x_video_subdevs[] =3D {
>> +     { .compatible =3D "nvidia,tegra210-csi", },
>> +     { .compatible =3D "nvidia,tegra210-vi", },
>> +     { }
>> +};
>> +
>> +static struct host1x_driver host1x_video_driver =3D {
>> +     .driver =3D {
>> +             .name =3D "host1x_video",
>> +     },
>> +     .probe =3D host1x_video_probe,
>> +     .remove =3D host1x_video_remove,
>> +     .subdevs =3D host1x_video_subdevs,
>> +};
>> +
>> +static struct platform_driver * const drivers[] =3D {
>> +     &tegra_csi_driver,
>> +     &tegra_vi_driver,
>> +};
>> +
>> +static int __init host1x_video_init(void)
>> +{
>> +     int err;
>> +
>> +     err =3D host1x_driver_register(&host1x_video_driver);
>> +     if (err < 0)
>> +             return err;
>> +
>> +     err =3D platform_register_drivers(drivers, ARRAY_SIZE(drivers));
>> +     if (err < 0)
>> +             goto unregister_host1x;
>> +
>> +     return 0;
>> +
>> +unregister_host1x:
>> +     host1x_driver_unregister(&host1x_video_driver);
>> +     return err;
>> +}
>> +module_init(host1x_video_init);
>> +
>> +static void __exit host1x_video_exit(void)
>> +{
>> +     platform_unregister_drivers(drivers, ARRAY_SIZE(drivers));
>> +     host1x_driver_unregister(&host1x_video_driver);
>> +}
>> +module_exit(host1x_video_exit);
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Host1x Video driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/host1x-video.h b/drivers/stagin=
g/media/tegra/host1x-video.h
>> new file mode 100644
>> index 000000000000..84d28e6f4362
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/host1x-video.h
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef HOST1X_VIDEO_H
>> +#define HOST1X_VIDEO_H 1
>> +
>> +#include <linux/host1x.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-vi.h"
>> +#include "csi.h"
>> +
>> +struct tegra_camera {
>> +     struct v4l2_device v4l2_dev;
>> +     struct media_device media_dev;
>> +     struct device *dev;
> You can use cam->media_dev.dev instead of having this pointer.
>
>> +     struct tegra_vi *vi;
>> +     struct tegra_csi_device *csi;
>> +};
>> +
>> +extern struct platform_driver tegra_vi_driver;
>> +extern struct platform_driver tegra_csi_driver;
>> +
>> +#endif /* HOST1X_VIDEO_H */
>> diff --git a/drivers/staging/media/tegra/mc_common.h b/drivers/staging/m=
edia/tegra/mc_common.h
>> new file mode 100644
>> index 000000000000..9e88f3295ef4
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/mc_common.h
>> @@ -0,0 +1,131 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __MC_COMMON_H_
>> +#define __MC_COMMON_H_
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "tegra-core.h"
>> +#include "tegra-vi.h"
>> +#include "csi.h"
>> +
>> +#define MAX_FORMAT_NUM       64
>> +
>> +struct tegra_csi_fops {
>> +     int (*hw_init)(struct tegra_csi_device *csi);
>> +     int (*csi_start_streaming)(struct tegra_csi_channel *csi_chan,
>> +                                u8 pg_mode, int enable);
>> +     void (*csi_err_status)(struct tegra_csi_channel *csi_chan);
>> +};
>> +
>> +/**
>> + * struct tegra_channel - Tegra video channel
>> + * @list: list entry in a composite device dmas list
>> + * @video: V4L2 video device associated with the video channel
>> + * @video_lock: protects the @format and @queue fields
>> + * @pad: media pad for the video device entity
>> + *
>> + * @vi: composite device DT node port number for the channel
>> + *
>> + * @sp: host1x syncpoint pointer
>> + *
>> + * @kthread_capture_start: capture start kthread of this video channel
>> + * @start_wait: wait queue used by capture start kthread
>> + * @kthread_capture_done: capture done kthread of this video channel
>> + * @done_wait: wait queue used by capture done kthread
>> + *
>> + * @format: active V4L2 pixel format
>> + * @fmtinfo: format information corresponding to the active @format
>> + * @video_formats: supported video formats
>> + * @nformats: supported number of video formats
>> + *
>> + * @queue: vb2 buffers queue
>> + * @sequence: V4L2 buffers sequence number
>> + *
>> + * @capture: list of queued buffers for capture
>> + * @start_lock: protects the capture queued list
>> + * @done: list of capture done queued buffers
>> + * @done_lock: protects the capture done queue list
>> + *
>> + * @stride_align: channel buffer stride alignment
>> + * @width_align: channel buffer width alignment
>> + * @height_align: channel buffer height alignment
>> + * @size_align: channel buffer size alignment
>> +
>> + * @port: CSI port of this video channel
>> + *
>> + * @ctrl_handler: V4L2 control handler of this video channel
>> + * @tpg_fmts_bitmap: a bitmap for supported TPG formats
>> + */
>> +struct tegra_channel {
>> +     struct list_head list;
>> +     struct video_device video;
>> +     /* protects the @format and @queue fields */
>> +     struct mutex video_lock;
>> +     struct media_pad pad;
>> +
>> +     struct tegra_vi *vi;
>> +     struct host1x_syncpt *sp;
>> +
>> +     struct task_struct *kthread_capture_start;
>> +     wait_queue_head_t start_wait;
>> +     struct task_struct *kthread_capture_done;
>> +     wait_queue_head_t done_wait;
>> +
>> +     struct v4l2_pix_format format;
>> +     const struct tegra_video_format *fmtinfo;
>> +     const struct tegra_video_format *video_formats;
>> +     unsigned int nformats;
>> +     struct vb2_queue queue;
>> +     u32 sequence;
>> +
>> +     struct list_head capture;
>> +     /* protects the capture queued list */
>> +     spinlock_t start_lock;
>> +     struct list_head done;
>> +     /* protects the capture done queue list */
>> +     spinlock_t done_lock;
>> +
>> +     unsigned int stride_align;
>> +     unsigned int width_align;
>> +     unsigned int height_align;
>> +     unsigned int size_align;
>> +     unsigned char port;
>> +
>> +     struct v4l2_ctrl_handler ctrl_handler;
>> +     DECLARE_BITMAP(tpg_fmts_bitmap, MAX_FORMAT_NUM);
>> +};
>> +
>> +#define to_tegra_channel(vdev) \
>> +     container_of(vdev, struct tegra_channel, video)
> Why not inline instead of define. Inlines has the advantage of checking t=
ypes.
>
>> +
>> +const struct tegra_video_format *tegra_core_get_default_format(void);
>> +u32 tegra_core_get_fourcc_by_idx(struct tegra_channel *chan,
>> +                              unsigned int index);
>> +int tegra_core_get_idx_by_code(struct tegra_channel *chan, unsigned int=
 code,
>> +                            unsigned int offset);
>> +const struct tegra_video_format *
>> +tegra_core_get_format_by_fourcc(struct tegra_channel *chan, u32 fourcc)=
;
>> +
>> +int tegra_channel_init(struct tegra_channel *chan);
>> +int tegra_channel_setup_ctrl_handler(struct tegra_channel *chan);
>> +int tegra_channel_cleanup(struct tegra_channel *chan);
>> +int tegra_channel_set_stream(struct tegra_channel *chan, bool on);
>> +void tegra_channel_queued_buf_done(struct tegra_channel *chan,
>> +                                enum vb2_buffer_state state);
>> +int tegra_channel_csi_error_status(struct tegra_channel *chan);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/tegra-channel.c b/drivers/stagi=
ng/media/tegra/tegra-channel.c
>> new file mode 100644
>> index 000000000000..7561f6fb8748
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-channel.c
>> @@ -0,0 +1,628 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/atomic.h>
>> +#include <linux/bitmap.h>
>> +#include <linux/clk.h>
>> +#include <linux/host1x.h>
>> +#include <linux/kthread.h>
>> +#include <linux/lcm.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fh.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include <soc/tegra/pmc.h>
>> +
>> +#include "mc_common.h"
>> +#include "tegra-vi.h"
>> +#include "host1x-video.h"
>> +
>> +#define MAX_CID_CONTROLS             1
>> +
>> +static const char *const vi_pattern_strings[] =3D {
>> +     "Black/White Direct Mode",
>> +     "Color Patch Mode",
>> +};
>> +
>> +static int vi_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +     struct tegra_channel *chan =3D container_of(ctrl->handler,
>> +                                               struct tegra_channel,
>> +                                               ctrl_handler);
>> +
>> +     switch (ctrl->id) {
>> +     case V4L2_CID_TEST_PATTERN:
>> +             chan->vi->pg_mode =3D ctrl->val + 1;
>> +             dev_info(chan->vi->dev, "TPG mode is set to %s\n",
>> +                      vi_pattern_strings[ctrl->val]);
>> +             break;
>> +
>> +     default:
>> +             dev_err(chan->vi->dev, "Invalid Tegra video control\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops vi_ctrl_ops =3D {
>> +     .s_ctrl =3D vi_s_ctrl,
>> +};
>> +
>> +/*
>> + * videobuf2 queue operations
>> + */
>> +static int tegra_channel_queue_setup(struct vb2_queue *vq,
>> +                                  unsigned int *nbuffers,
>> +                                  unsigned int *nplanes,
>> +                                  unsigned int sizes[],
>> +                                  struct device *alloc_devs[])
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vq);
>> +     unsigned int count =3D *nbuffers;
>> +
>> +     if (*nplanes)
>> +             return sizes[0] < chan->format.sizeimage ? -EINVAL : 0;
>> +
>> +     *nplanes =3D 1;
>> +     sizes[0] =3D chan->format.sizeimage;
>> +     alloc_devs[0] =3D chan->vi->dev;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_buffer_prepare(struct vb2_buffer *vb)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vb->vb2_queue);
>> +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>> +     struct tegra_channel_buffer *buf =3D to_tegra_channel_buffer(vbuf)=
;
>> +     unsigned long size =3D chan->format.sizeimage;
>> +
>> +     if (vb2_plane_size(vb, 0) < size) {
>> +             v4l2_err(chan->video.v4l2_dev, "buffer too small (%lu < %l=
u)\n",
>> +                      vb2_plane_size(vb, 0), size);
>> +             return -EINVAL;
>> +     }
>> +
>> +     vb2_set_plane_payload(vb, 0, size);
>> +     buf->chan =3D chan;
>> +     buf->addr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_channel_buffer_queue(struct vb2_buffer *vb)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vb->vb2_queue);
>> +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
>> +     struct tegra_channel_buffer *buf =3D to_tegra_channel_buffer(vbuf)=
;
>> +
>> +     /* put buffer into the capture queue */
>> +     spin_lock(&chan->start_lock);
>> +     list_add_tail(&buf->queue, &chan->capture);
>> +     spin_unlock(&chan->start_lock);
>> +
>> +     /* wait up kthread for capture */
>> +     wake_up_interruptible(&chan->start_wait);
>> +}
>> +
>> +int tegra_channel_csi_error_status(struct tegra_channel *chan)
>> +{
>> +     struct media_entity *entity;
>> +     struct media_pad *pad;
>> +     struct v4l2_subdev *subdev;
>> +
>> +     pad =3D media_entity_remote_pad(&chan->pad);
>> +     if (!pad)
>> +             return -ENODEV;
>> +
>> +     entity =3D pad->entity;
>> +     subdev =3D media_entity_to_v4l2_subdev(entity);
>> +
>> +     tegra_csi_error_status(subdev);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct v4l2_subdev *
>> +tegra_channel_get_remote_subdev(struct tegra_channel *chan)
>> +{
>> +     struct media_pad *pad;
>> +     struct v4l2_subdev *subdev;
>> +     struct media_entity *entity;
>> +
>> +     pad =3D media_entity_remote_pad(&chan->pad);
>> +     entity =3D pad->entity;
>> +     subdev =3D media_entity_to_v4l2_subdev(entity);
>> +
>> +     return subdev;
>> +}
>> +
>> +int tegra_channel_set_stream(struct tegra_channel *chan, bool on)
>> +{
>> +     struct v4l2_subdev *subdev;
>> +     int ret;
>> +
>> +     /* stream CSI */
>> +     subdev =3D tegra_channel_get_remote_subdev(chan);
>> +     v4l2_set_subdev_hostdata(subdev, chan);
>> +     ret =3D v4l2_subdev_call(subdev, video, s_stream, on);
>> +     if (on && ret < 0 && ret !=3D -ENOIOCTLCMD)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +void tegra_channel_queued_buf_done(struct tegra_channel *chan,
>> +                                enum vb2_buffer_state state)
>> +{
>> +     struct tegra_channel_buffer *buf, *nbuf;
>> +
>> +     spin_lock(&chan->start_lock);
>> +     list_for_each_entry_safe(buf, nbuf, &chan->capture, queue) {
>> +             vb2_buffer_done(&buf->buf.vb2_buf, state);
>> +             list_del(&buf->queue);
>> +     }
>> +
>> +     spin_unlock(&chan->start_lock);
>> +}
>> +
>> +static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 coun=
t)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vq);
>> +
>> +     if (chan->vi->fops->vi_start_streaming)
>> +             return chan->vi->fops->vi_start_streaming(vq, count);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_channel_stop_streaming(struct vb2_queue *vq)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vq);
>> +
>> +     if (chan->vi->fops->vi_start_streaming)
>> +             chan->vi->fops->vi_stop_streaming(vq);
>> +}
>> +
>> +static const struct vb2_ops tegra_channel_queue_qops =3D {
>> +     .queue_setup =3D tegra_channel_queue_setup,
>> +     .buf_prepare =3D tegra_channel_buffer_prepare,
>> +     .buf_queue =3D tegra_channel_buffer_queue,
>> +     .wait_prepare =3D vb2_ops_wait_prepare,
>> +     .wait_finish =3D vb2_ops_wait_finish,
>> +     .start_streaming =3D tegra_channel_start_streaming,
>> +     .stop_streaming =3D tegra_channel_stop_streaming,
>> +};
>> +
>> +/*
>> + * V4L2 ioctls
>> + */
>> +static int tegra_channel_querycap(struct file *file, void *fh,
>> +                               struct v4l2_capability *cap)
>> +{
>> +     struct v4l2_fh *vfh =3D file->private_data;
>> +     struct tegra_channel *chan =3D to_tegra_channel(vfh->vdev);
>> +
>> +     cap->device_caps =3D chan->video.device_caps;
>> +     cap->capabilities =3D cap->device_caps | V4L2_CAP_DEVICE_CAPS;
>> +     strscpy(cap->driver, "tegra-video", sizeof(cap->driver));
>> +     strscpy(cap->card, chan->video.name, sizeof(cap->card));
>> +     snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s:%u",
>> +              dev_name(chan->vi->dev), chan->port);
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_enum_format(struct file *file, void *fh,
>> +                                  struct v4l2_fmtdesc *f)
>> +{
>> +     struct v4l2_fh *vfh =3D file->private_data;
>> +     struct tegra_channel *chan =3D to_tegra_channel(vfh->vdev);
>> +     unsigned int index =3D 0, i;
>> +     unsigned long *fmts_bitmap =3D chan->tpg_fmts_bitmap;
>> +
>> +     if (f->index >=3D bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
>> +             return -EINVAL;
>> +
>> +     for (i =3D 0; i < f->index + 1; i++, index++)
>> +             index =3D find_next_bit(fmts_bitmap, MAX_FORMAT_NUM, index=
);
>> +
>> +     f->pixelformat =3D tegra_core_get_fourcc_by_idx(chan, index - 1);
>> +
>> +     return 0;
>> +}
>> +
>> +static void
>> +tegra_channel_fmt_align(struct tegra_channel *chan,
>> +                     const struct tegra_frac *bpp,
>> +                     u32 *width, u32 *height, u32 *bytesperline)
>> +{
>> +     unsigned int min_width, max_width;
>> +     unsigned int min_bpl, max_bpl, bpl;
>> +     unsigned int align, fmt_align;
>> +     unsigned int temp_width, temp_bpl;
>> +     unsigned int numerator, denominator;
>> +
>> +     denominator =3D (!bpp->denominator) ? 1 : bpp->denominator;
>> +     numerator =3D (!bpp->numerator) ? 1 : bpp->numerator;
>> +     fmt_align =3D (denominator =3D=3D 1) ? numerator : 1;
>> +     align =3D lcm(chan->width_align, fmt_align);
>> +     bpl =3D (*width * numerator) / denominator;
>> +
>> +     if (chan->vi->fops->vi_stride_align)
>> +             chan->vi->fops->vi_stride_align(&bpl);
>> +
>> +     if (!*bytesperline)
>> +             *bytesperline =3D bpl;
>> +
>> +     /*
>> +      * The transfer alignment requirements are expressed in bytes. Com=
pute
>> +      * the minimum and maximum values, clamp the requested width and c=
onvert
>> +      * it back to pixels.
>> +      * use bytesperline to adjust width for applicaton related requrie=
ments.
>> +      */
>> +     min_width =3D roundup(TEGRA_MIN_WIDTH, align);
>> +     max_width =3D rounddown(TEGRA_MAX_WIDTH, align);
>> +     temp_width =3D roundup(bpl, align);
>> +     *width =3D (clamp(temp_width, min_width, max_width) * denominator)=
 /
>> +                     numerator;
>> +     *height =3D clamp(*height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
>> +
>> +     /*
>> +      * Clamp the requested bytes per line value. If the maximum bytes =
per
>> +      * line value is zero, the module doesn't support user configurabl=
e line
>> +      * sizes. Override the requested value with the minimum in that ca=
se.
>> +      */
>> +     min_bpl =3D bpl;
>> +     max_bpl =3D rounddown(TEGRA_MAX_WIDTH, chan->stride_align);
>> +     temp_bpl =3D roundup(*bytesperline, chan->stride_align);
>> +     *bytesperline =3D clamp(temp_bpl, min_bpl, max_bpl);
>> +}
>> +
>> +static void tegra_channel_update_format(struct tegra_channel *chan, u32=
 width,
>> +                                     u32 height, u32 fourcc,
>> +                                     const struct tegra_frac *bpp,
>> +                                     u32 preferred_stride)
>> +{
>> +     u32 denominator =3D (!bpp->denominator) ? 1 : bpp->denominator;
>> +     u32 numerator =3D (!bpp->numerator) ? 1 : bpp->numerator;
>> +     u32 bytesperline =3D (width * numerator / denominator);
>> +     u32 sizeimage, height_aligned;
>> +
>> +     chan->format.width =3D width;
>> +     chan->format.height =3D height;
>> +     chan->format.pixelformat =3D fourcc;
>> +     chan->format.bytesperline =3D preferred_stride ?: bytesperline;
>> +
>> +     tegra_channel_fmt_align(chan, bpp,
>> +                             &chan->format.width,
>> +                             &chan->format.height,
>> +                             &chan->format.bytesperline);
>> +
>> +     /* calculate the sizeimage per plane */
>> +     height_aligned =3D roundup(chan->format.height, chan->height_align=
);
>> +     sizeimage =3D chan->format.bytesperline * height_aligned;
>> +     chan->format.sizeimage =3D roundup(sizeimage, chan->size_align);
>> +}
>> +
>> +static int tegra_channel_get_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh =3D file->private_data;
>> +     struct tegra_channel *chan =3D to_tegra_channel(vfh->vdev);
>> +
>> +     format->fmt.pix =3D chan->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>> +                                   struct v4l2_pix_format *pix,
>> +                                   const struct tegra_video_format **vf=
mt)
>> +{
>> +     const struct tegra_video_format *fmt_info;
>> +     struct v4l2_subdev *subdev;
>> +     struct v4l2_subdev_format fmt;
>> +     struct v4l2_subdev_pad_config *pad_cfg;
>> +
>> +     subdev =3D tegra_channel_get_remote_subdev(chan);
>> +     pad_cfg =3D v4l2_subdev_alloc_pad_config(subdev);
>> +     if (!pad_cfg)
>> +             return -ENOMEM;
>> +
>> +     /*
>> +      * Retrieve format information and select the default format if th=
e
>> +      * requested format isn't supported.
>> +      */
>> +     fmt_info =3D tegra_core_get_format_by_fourcc(chan, pix->pixelforma=
t);
>> +     if (!fmt_info) {
>> +             pix->pixelformat =3D chan->format.pixelformat;
>> +             pix->colorspace =3D chan->format.colorspace;
>> +             fmt_info =3D tegra_core_get_format_by_fourcc(chan,
>> +                                                        pix->pixelforma=
t);
>> +     }
>> +
>> +     /* Change this when start adding interlace format support */
>> +     pix->field =3D V4L2_FIELD_NONE;
>> +     fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
>> +     fmt.pad =3D 0;
>> +     v4l2_fill_mbus_format(&fmt.format, pix, fmt_info->code);
>> +     v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
> As fas as I understand, entities formats should be independent, it is up =
to link_validate
> to check formats between entities.
> The capture shouldn't change the format of the subdevice.
>
>
>> +
>> +     v4l2_fill_pix_format(pix, &fmt.format);
>> +     tegra_channel_fmt_align(chan, &fmt_info->bpp, &pix->width, &pix->h=
eight,
>> +                             &pix->bytesperline);
>> +     pix->sizeimage =3D pix->bytesperline * pix->height;
>> +
>> +     if (vfmt)
>> +             *vfmt =3D fmt_info;
>> +
>> +     v4l2_subdev_free_pad_config(pad_cfg);
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_try_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh =3D file->private_data;
>> +     struct tegra_channel *chan =3D to_tegra_channel(vfh->vdev);
>> +
>> +     return __tegra_channel_try_format(chan, &format->fmt.pix, NULL);
>> +}
>> +
>> +static int tegra_channel_set_format(struct file *file, void *fh,
>> +                                 struct v4l2_format *format)
>> +{
>> +     struct v4l2_fh *vfh =3D file->private_data;
>> +     struct tegra_channel *chan =3D to_tegra_channel(vfh->vdev);
>> +     const struct tegra_video_format *info;
>> +     int ret;
>> +     struct v4l2_subdev_format fmt;
>> +     struct v4l2_subdev *subdev;
>> +     struct v4l2_pix_format *pix =3D &format->fmt.pix;
>> +
>> +     if (vb2_is_busy(&chan->queue))
>> +             return -EBUSY;
>> +
>> +     /* get supported format by try_fmt */
>> +     ret =3D __tegra_channel_try_format(chan, pix, &info);
>> +     if (ret)
>> +             return ret;
>> +
>> +     subdev =3D tegra_channel_get_remote_subdev(chan);
>> +
>> +     fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
>> +     fmt.pad =3D 0;
>> +     v4l2_fill_mbus_format(&fmt.format, pix, info->code);
>> +     v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
> same here.
>
>> +
>> +     v4l2_fill_pix_format(pix, &fmt.format);
>> +     chan->format =3D *pix;
>> +     chan->fmtinfo =3D info;
>> +     tegra_channel_update_format(chan, pix->width,
>> +                                 pix->height, info->fourcc,
>> +                                 &info->bpp,
>> +                                 pix->bytesperline);
>> +     *pix =3D chan->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>> +                                 struct v4l2_input *inp)
>> +{
>> +     /* Currently driver supports internal TPG only */
>> +     if (inp->index !=3D 0)
> just
> if (inp->index)
>
>> +             return -EINVAL;
>> +
>> +     inp->type =3D V4L2_INPUT_TYPE_CAMERA;
>> +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_g_input(struct file *file, void *priv,
>> +                              unsigned int *i)
>> +{
>> +     *i =3D 0;
>> +     return 0;
>> +}
>> +
>> +static int tegra_channel_s_input(struct file *file, void *priv,
>> +                              unsigned int input)
>> +{
>> +     if (input > 0)
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops =3D {
>> +     .vidioc_querycap                =3D tegra_channel_querycap,
>> +     .vidioc_enum_fmt_vid_cap        =3D tegra_channel_enum_format,
>> +     .vidioc_g_fmt_vid_cap           =3D tegra_channel_get_format,
>> +     .vidioc_s_fmt_vid_cap           =3D tegra_channel_set_format,
>> +     .vidioc_try_fmt_vid_cap         =3D tegra_channel_try_format,
>> +     .vidioc_enum_input              =3D tegra_channel_enum_input,
>> +     .vidioc_g_input                 =3D tegra_channel_g_input,
>> +     .vidioc_s_input                 =3D tegra_channel_s_input,
>> +     .vidioc_reqbufs                 =3D vb2_ioctl_reqbufs,
>> +     .vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
>> +     .vidioc_querybuf                =3D vb2_ioctl_querybuf,
>> +     .vidioc_qbuf                    =3D vb2_ioctl_qbuf,
>> +     .vidioc_dqbuf                   =3D vb2_ioctl_dqbuf,
>> +     .vidioc_create_bufs             =3D vb2_ioctl_create_bufs,
>> +     .vidioc_expbuf                  =3D vb2_ioctl_expbuf,
>> +     .vidioc_streamon                =3D vb2_ioctl_streamon,
>> +     .vidioc_streamoff               =3D vb2_ioctl_streamoff,
>> +     .vidioc_subscribe_event         =3D v4l2_ctrl_subscribe_event,
>> +     .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
>> +};
>> +
>> +/*
>> + * V4L2 file operations
>> + */
>> +static const struct v4l2_file_operations tegra_channel_fops =3D {
>> +     .owner          =3D THIS_MODULE,
>> +     .unlocked_ioctl =3D video_ioctl2,
>> +     .open           =3D v4l2_fh_open,
>> +     .release        =3D vb2_fop_release,
>> +     .read           =3D vb2_fop_read,
>> +     .poll           =3D vb2_fop_poll,
>> +     .mmap           =3D vb2_fop_mmap,
>> +};
>> +
>> +int tegra_channel_setup_ctrl_handler(struct tegra_channel *chan)
>> +{
>> +     int ret;
>> +
>> +     /* Add test pattern control handler to v4l2 device */
>> +     v4l2_ctrl_new_std_menu_items(&chan->ctrl_handler, &vi_ctrl_ops,
>> +                                  V4L2_CID_TEST_PATTERN,
>> +                                  ARRAY_SIZE(vi_pattern_strings) - 1,
>> +                                  0, 0, vi_pattern_strings);
>> +     if (chan->ctrl_handler.error) {
>> +             dev_err(chan->vi->dev, "failed to add TPG ctrl handler\n")=
;
>> +             v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +             return chan->ctrl_handler.error;
>> +     }
>> +
>> +     /* setup the controls */
>> +     ret =3D v4l2_ctrl_handler_setup(&chan->ctrl_handler);
>> +     if (ret < 0) {
>> +             dev_err(chan->vi->dev, "failed to setup v4l2 ctrl handler\=
n");
>> +             goto free_hdl;
>> +     }
>> +
>> +     return 0;
>> +
>> +free_hdl:
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +     return ret;
>> +}
>> +
>> +int tegra_channel_init(struct tegra_channel *chan)
>> +{
>> +     struct tegra_vi *vi =3D chan->vi;
>> +     struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>> +     int ret;
>> +
>> +     mutex_init(&chan->video_lock);
>> +     INIT_LIST_HEAD(&chan->capture);
>> +     INIT_LIST_HEAD(&chan->done);
>> +     spin_lock_init(&chan->start_lock);
>> +     spin_lock_init(&chan->done_lock);
>> +     init_waitqueue_head(&chan->start_wait);
>> +     init_waitqueue_head(&chan->done_wait);
>> +
>> +     /* Default alignments */
>> +     chan->width_align =3D TEGRA_WIDTH_ALIGNMENT;
>> +     chan->stride_align =3D TEGRA_STRIDE_ALIGNMENT;
>> +     chan->height_align =3D TEGRA_HEIGHT_ALIGNMENT;
>> +     chan->size_align =3D TEGRA_SIZE_ALIGNMENT;
>> +
>> +     /* initialize the video format */
>> +     chan->fmtinfo =3D tegra_core_get_default_format();
>> +     chan->format.colorspace =3D V4L2_COLORSPACE_SRGB;
>> +     chan->format.field =3D V4L2_FIELD_NONE;
>> +     tegra_channel_update_format(chan, TEGRA_DEF_WIDTH, TEGRA_DEF_HEIGH=
T,
>> +                                 chan->fmtinfo->fourcc,
>> +                                 &chan->fmtinfo->bpp, 0);
>> +
>> +     /* initialize the media entity */
>> +     chan->pad.flags =3D MEDIA_PAD_FL_SINK;
>> +     ret =3D media_entity_pads_init(&chan->video.entity, 1, &chan->pad)=
;
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret =3D v4l2_ctrl_handler_init(&chan->ctrl_handler, MAX_CID_CONTRO=
LS);
>> +     if (chan->ctrl_handler.error) {
>> +             dev_err(vi->dev,
>> +                     "V4L2 controls handler init failed: %d\n", ret);
>> +             goto ctrl_init_error;
>> +     }
>> +
>> +     /* initialize the video_device */
>> +     chan->video.fops =3D &tegra_channel_fops;
>> +     chan->video.v4l2_dev =3D &cam->v4l2_dev;
>> +     chan->video.queue =3D &chan->queue;
>> +     snprintf(chan->video.name, sizeof(chan->video.name), "%s-%s-%u",
>> +              dev_name(vi->dev), "output", chan->port);
>> +     chan->video.vfl_type =3D VFL_TYPE_GRABBER;
>> +     chan->video.vfl_dir =3D VFL_DIR_RX;
>> +     chan->video.release =3D video_device_release_empty;
>> +     chan->video.ioctl_ops =3D &tegra_channel_ioctl_ops;
>> +     chan->video.ctrl_handler =3D &chan->ctrl_handler;
>> +     chan->video.lock =3D &chan->video_lock;
>> +     chan->video.device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STRE=
AMING |
>> +                               V4L2_CAP_READWRITE;
>> +
>> +     video_set_drvdata(&chan->video, chan);
>> +     chan->sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_HAS_=
BASE);
>> +     if (!chan->sp) {
>> +             dev_err(vi->dev, "failed to request syncpoint\n");
>> +             ret =3D -ENOMEM;
>> +             goto host1x_sp_error;
>> +     }
>> +
>> +     chan->queue.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +     chan->queue.io_modes =3D VB2_MMAP | VB2_DMABUF | VB2_READ;
>> +     chan->queue.lock =3D &chan->video_lock;
>> +     chan->queue.drv_priv =3D chan;
>> +     chan->queue.buf_struct_size =3D sizeof(struct tegra_channel_buffer=
);
>> +     chan->queue.ops =3D &tegra_channel_queue_qops;
>> +     chan->queue.mem_ops =3D &vb2_dma_contig_memops;
>> +     chan->queue.timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC
>> +                                | V4L2_BUF_FLAG_TSTAMP_SRC_EOF;
>> +     chan->queue.dev =3D vi->dev;
>> +     ret =3D vb2_queue_init(&chan->queue);
>> +     if (ret < 0) {
>> +             dev_err(vi->dev,
>> +                     "failed to initialize VB2 queue, err: %d\n", ret);
>> +             goto vb2_init_error;
>> +     }
>> +
>> +     ret =3D video_register_device(&chan->video, VFL_TYPE_GRABBER, -1);
>> +     if (ret < 0) {
>> +             dev_err(&chan->video.dev,
>> +                     "failed to register video device, err: %d\n", ret)=
;
>> +             goto video_register_error;
>> +     }
>> +
>> +     return 0;
>> +
>> +video_register_error:
>> +     vb2_queue_release(&chan->queue);
>> +vb2_init_error:
>> +     host1x_syncpt_free(chan->sp);
>> +host1x_sp_error:
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +ctrl_init_error:
>> +     media_entity_cleanup(&chan->video.entity);
>> +     return ret;
>> +}
>> +
>> +int tegra_channel_cleanup(struct tegra_channel *chan)
>> +{
>> +     if (video_is_registered(&chan->video)) {
>> +             video_unregister_device(&chan->video);
>> +             vb2_queue_release(&chan->queue);
>> +             media_entity_cleanup(&chan->video.entity);
>> +     }
>> +
>> +     host1x_syncpt_free(chan->sp);
>> +     v4l2_ctrl_handler_free(&chan->ctrl_handler);
>> +
>> +     return 0;
>> +}
>> diff --git a/drivers/staging/media/tegra/tegra-core.c b/drivers/staging/=
media/tegra/tegra-core.c
>> new file mode 100644
>> index 000000000000..80ede3ad7266
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-core.c
>> @@ -0,0 +1,111 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/export.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "mc_common.h"
>> +#include "tegra-core.h"
>> +
>> +static const struct tegra_video_format tegra_default_format =3D {
>> +     /* RAW 10 */
>> +     TEGRA_VF_RAW10,
>> +     10,
>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>> +     {2, 1},
>> +     TEGRA_IMAGE_FORMAT_DEF,
>> +     TEGRA_IMAGE_DT_RAW10,
>> +     V4L2_PIX_FMT_SRGGB10,
>> +     "RGRG.. GBGB..",
> It would be more readable to do:
>
> .code =3D TEGRA_VF_RAW10,
> .width =3D 10,
> .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>
> and so on
>
>> +};
>> +
>> +/*
>> + * Helper functions
>> + */
>> +
>> +/**
>> + * tegra_core_get_default_format - Get default format
>> + *
>> + * Return: pointer to the format where the default format needs
>> + * to be filled in.
>> + */
>> +const struct tegra_video_format *tegra_core_get_default_format(void)
>> +{
>> +     return &tegra_default_format;
>> +}
> This is only used in tegra-channel.c, why not to declare it there as stat=
ic?
>
>> +
>> +/**
>> + * tegra_core_get_fourcc_by_idx - get fourcc of a tegra_video format
>> + * @index: array index of the tegra_video_formats
>> + *
>> + * Return: fourcc code
>> + */
>> +u32 tegra_core_get_fourcc_by_idx(struct tegra_channel *chan,
>> +                              unsigned int index)
> same here
>
>> +{
>> +     if (index >=3D chan->nformats)
>> +             return -EINVAL;
>> +
>> +     return chan->video_formats[index].fourcc;
>> +}
>> +
>> +/**
>> + * tegra_core_get_word_count - Calculate word count
>> + * @frame_width: number of pixels per line
>> + * @fmt: Tegra Video format struct which has BPP information
>> + *
>> + * Return: word count number
>> + */
>> +u32 tegra_core_get_word_count(unsigned int frame_width,
>> +                           const struct tegra_video_format *fmt)
> This is only used in vi2_fops.c, can be declared there as static.
>
>> +{
>> +     return frame_width * fmt->width / 8;
>> +}
>> +
>> +/**
>> + * tegra_core_get_idx_by_code - Retrieve index for a media bus code
>> + * @chan: tegra_channel
>> + * @code: the format media bus code
>> + * @offset: offset in video formats from where to start the search
>> + *
>> + * Return: a index to the format information structure corresponding to=
 the
>> + * given V4L2 media bus format @code, or -1 if no corresponding format =
can
>> + * be found.
>> + */
>> +int tegra_core_get_idx_by_code(struct tegra_channel *chan, unsigned int=
 code,
>> +                            unsigned int offset)
> same here, this is only used by tegra-vi.c
>
> Please, check the other functions too, if a function is
> used only in one place, no need to export it in a header.
>
>> +{
>> +     unsigned int i;
>> +
>> +     for (i =3D offset; i < chan->nformats; ++i) {
>> +             if (chan->video_formats[i].code =3D=3D code)
>> +                     return i;
>> +     }
>> +
>> +     return -1;
>> +}
>> +
>> +/**
>> + * tegra_core_get_format_by_fourcc - Retrieve format information for a =
4CC
>> + * @fourcc: the format 4CC
>> + *
>> + * Return: a pointer to the format information structure corresponding =
to the
>> + * given V4L2 format @fourcc, or NULL if no corresponding format can be
>> + * found.
>> + */
>> +const struct tegra_video_format *
>> +tegra_core_get_format_by_fourcc(struct tegra_channel *chan, u32 fourcc)
>> +{
> same here, only used by tegra-channel.c
>
>> +     unsigned int i;
>> +
>> +     for (i =3D 0; i < chan->nformats; ++i) {
>> +             if (chan->video_formats[i].fourcc =3D=3D fourcc)
>> +                     return &chan->video_formats[i];
>> +     }
>> +
>> +     return NULL;
>> +}
>> diff --git a/drivers/staging/media/tegra/tegra-core.h b/drivers/staging/=
media/tegra/tegra-core.h
>> new file mode 100644
>> index 000000000000..193065d20a95
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-core.h
>> @@ -0,0 +1,125 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA_CORE_H__
>> +#define __TEGRA_CORE_H__
>> +
>> +#include <media/v4l2-subdev.h>
>> +
>> +/* Minimum and maximum width and height common to Tegra video input dev=
ice. */
>> +#define TEGRA_MIN_WIDTH              32U
>> +#define TEGRA_MAX_WIDTH              32768U
>> +#define TEGRA_MIN_HEIGHT     32U
>> +#define TEGRA_MAX_HEIGHT     32768U
>> +
>> +/* Width alignment */
>> +#define TEGRA_WIDTH_ALIGNMENT        1
>> +/* Stride alignment */
>> +#define TEGRA_STRIDE_ALIGNMENT       1
>> +/* Height alignment */
>> +#define TEGRA_HEIGHT_ALIGNMENT       1
>> +/* Size alignment */
>> +#define TEGRA_SIZE_ALIGNMENT 1
>> +
>> +/* 1080p resolution as default resolution for test pattern generator */
>> +#define TEGRA_DEF_WIDTH              1920
>> +#define TEGRA_DEF_HEIGHT     1080
>> +
>> +#define TEGRA_VF_DEF         MEDIA_BUS_FMT_SRGGB10_1X10
>> +#define TEGRA_IMAGE_FORMAT_DEF       32
>> +
>> +/*
>> + * These go into the TEGRA_VI_CSI_n_CSI_IMAGE_DT registers bits 7:0
>> + * Input data type of VI channel.
>> + */
>> +enum tegra_image_dt {
>> +     TEGRA_IMAGE_DT_YUV420_8 =3D 24,
>> +     TEGRA_IMAGE_DT_YUV420_10,
>> +
>> +     TEGRA_IMAGE_DT_YUV420CSPS_8 =3D 28,
>> +     TEGRA_IMAGE_DT_YUV420CSPS_10,
>> +     TEGRA_IMAGE_DT_YUV422_8,
>> +     TEGRA_IMAGE_DT_YUV422_10,
>> +     TEGRA_IMAGE_DT_RGB444,
>> +     TEGRA_IMAGE_DT_RGB555,
>> +     TEGRA_IMAGE_DT_RGB565,
>> +     TEGRA_IMAGE_DT_RGB666,
>> +     TEGRA_IMAGE_DT_RGB888,
>> +
>> +     TEGRA_IMAGE_DT_RAW6 =3D 40,
>> +     TEGRA_IMAGE_DT_RAW7,
>> +     TEGRA_IMAGE_DT_RAW8,
>> +     TEGRA_IMAGE_DT_RAW10,
>> +     TEGRA_IMAGE_DT_RAW12,
>> +     TEGRA_IMAGE_DT_RAW14,
>> +};
>> +
>> +/* Supported CSI to VI Data Formats */
>> +enum tegra_vf_code {
>> +     TEGRA_VF_RAW6 =3D 0,
>> +     TEGRA_VF_RAW7,
>> +     TEGRA_VF_RAW8,
>> +     TEGRA_VF_RAW10,
>> +     TEGRA_VF_RAW12,
>> +     TEGRA_VF_RAW14,
>> +     TEGRA_VF_EMBEDDED8,
>> +     TEGRA_VF_RGB565,
>> +     TEGRA_VF_RGB555,
>> +     TEGRA_VF_RGB888,
>> +     TEGRA_VF_RGB444,
>> +     TEGRA_VF_RGB666,
>> +     TEGRA_VF_YUV422,
>> +     TEGRA_VF_YUV420,
>> +     TEGRA_VF_YUV420_CSPS,
>> +};
>> +
>> +/**
>> + * struct tegra_frac
>> + * @numerator: numerator of the fraction
>> + * @denominator: denominator of the fraction
>> + */
>> +struct tegra_frac {
>> +     unsigned int numerator;
>> +     unsigned int denominator;
>> +};
>> +
>> +/**
>> + * struct tegra_video_format - Tegra video format description
>> + * @vf_code: video format code
>> + * @width: format width in bits per component
>> + * @code: media bus format code
>> + * @bpp: bytes per pixel (when stored in memory)
>> + * @img_fmt: image format
>> + * @img_dt: image data type
>> + * @fourcc: V4L2 pixel format FCC identifier
>> + * @description: format description, suitable for userspace
>> + */
>> +struct tegra_video_format {
>> +     enum tegra_vf_code vf_code;
>> +     unsigned int width;
>> +     unsigned int code;
>> +     struct tegra_frac bpp;
>> +     u32 img_fmt;
>> +     enum tegra_image_dt img_dt;
>> +     u32 fourcc;
>> +     __u8 description[32];
>> +};
>> +
>> +#define      TEGRA_VIDEO_FORMAT(VF_CODE, BPP, MBUS_CODE, FRAC_BPP_NUM, =
      \
>> +     FRAC_BPP_DEN, FORMAT, DATA_TYPE, FOURCC, DESCRIPTION)           \
>> +{                                                                    \
>> +     TEGRA_VF_##VF_CODE,                                             \
>> +     BPP,                                                            \
>> +     MEDIA_BUS_FMT_##MBUS_CODE,                                      \
>> +     {FRAC_BPP_NUM, FRAC_BPP_DEN},                                   \
>> +     TEGRA_IMAGE_FORMAT_##FORMAT,                                    \
>> +     TEGRA_IMAGE_DT_##DATA_TYPE,                                     \
>> +     V4L2_PIX_FMT_##FOURCC,                                          \
>> +     DESCRIPTION,                                                    \
>> +}
>> +
>> +u32 tegra_core_get_word_count(unsigned int frame_width,
>> +                           const struct tegra_video_format *fmt);
>> +#endif
>> diff --git a/drivers/staging/media/tegra/tegra-csi.c b/drivers/staging/m=
edia/tegra/tegra-csi.c
>> new file mode 100644
>> index 000000000000..f6153acd60cb
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-csi.c
>> @@ -0,0 +1,380 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk/tegra.h>
>> +#include <linux/device.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/host1x.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_graph.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/of_platform.h>
>> +
>> +#include "csi.h"
>> +#include "mc_common.h"
>> +#include "csi2_fops.h"
>> +#include "host1x-video.h"
>> +#include "vi2_registers.h"
>> +
>> +static inline struct tegra_csi_device *
>> +host1x_client_to_csi(struct host1x_client *client)
>> +{
>> +     return container_of(client, struct tegra_csi_device, client);
>> +}
>> +
>> +static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev =
*subdev)
>> +{
>> +     return container_of(subdev, struct tegra_csi_channel, subdev);
>> +}
>> +
>> +/*
>> + * V4L2 Subdevice Video Operations
>> + */
>> +static int tegra_csi_s_stream(struct v4l2_subdev *subdev, int enable)
>> +{
>> +     struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi =3D csi_chan->csi;
>> +     struct tegra_channel *chan =3D subdev->host_priv;
>> +     u8 pg_mode =3D chan->vi->pg_mode;
>> +
>> +     return csi->fops->csi_start_streaming(csi_chan, pg_mode, enable);
>> +}
>> +
>> +/*
>> + * Only use this subdevice media bus ops for test pattern generator,
>> + * because CSI device is an separated subdevice which has 6 source
>> + * pads to generate test pattern.
>> + */
>> +static struct v4l2_mbus_framefmt tegra_csi_tpg_fmts[] =3D {
>> +     {
>> +             TEGRA_DEF_WIDTH,
>> +             TEGRA_DEF_HEIGHT,
>> +             MEDIA_BUS_FMT_SRGGB10_1X10,
>> +             V4L2_FIELD_NONE,
>> +             V4L2_COLORSPACE_SRGB
>> +     },
>> +     {
>> +             TEGRA_DEF_WIDTH,
>> +             TEGRA_DEF_HEIGHT,
>> +             MEDIA_BUS_FMT_RGB888_1X32_PADHI,
>> +             V4L2_FIELD_NONE,
>> +             V4L2_COLORSPACE_SRGB
>> +     }
>> +
>> +};
>> +
>> +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] =3D {
>> +     {1280, 720},
>> +     {1920, 1080},
>> +     {3840, 2160},
>> +};
>> +
>> +/*
>> + * V4L2 Subdevice Pad Operations
>> + */
>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>> +                             struct v4l2_subdev_pad_config *cfg,
>> +                             struct v4l2_subdev_format *fmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>> +
>> +     mutex_lock(&csi_chan->format_lock);
> Do you need this lock? I think there is already a serialization in the io=
ctls in place (to be confirmed).
>
>> +     memcpy(fmt, &csi_chan->ports->format,
>> +            sizeof(struct v4l2_mbus_framefmt));
> I would prefer just:
> *fmt =3D *csi_chan->ports->format;
>
> I think it is easier to read IMHO.
> same in tegra_csi_set_format().
>
>> +     mutex_unlock(&csi_chan->format_lock);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>> +                                struct v4l2_mbus_framefmt *mfmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi =3D csi_chan->csi;
>> +     const struct v4l2_frmsize_discrete *sizes;
>> +     int i, j;
> unsigned
>
>> +
>> +     for (i =3D 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++) {
>> +             struct v4l2_mbus_framefmt *mbus_fmt =3D &tegra_csi_tpg_fmt=
s[i];
>> +
>> +             if (mfmt->code =3D=3D mbus_fmt->code) {
>> +                     for (j =3D 0; j < ARRAY_SIZE(tegra_csi_tpg_sizes);=
 j++) {
>> +                             sizes =3D &tegra_csi_tpg_sizes[j];
>> +                             if (mfmt->width =3D=3D sizes->width &&
>> +                                 mfmt->height =3D=3D sizes->height) {
>> +                                     return;
>> +                             }
>> +                     }
>> +             }
>> +
>> +             dev_info(csi->dev, "using Tegra default RAW10 video format=
\n");
>> +     }
>> +
>> +     dev_info(csi->dev, "using Tegra default WIDTH X HEIGHT (1920x1080)=
\n");
>> +     memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(struct v4l2_mbus_framefmt)=
);
>> +}
>> +
>> +static int tegra_csi_set_format(struct v4l2_subdev *subdev,
>> +                             struct v4l2_subdev_pad_config *cfg,
>> +                             struct v4l2_subdev_format *fmt)
>> +{
>> +     struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>> +     struct v4l2_mbus_framefmt *format =3D &fmt->format;
>> +
>> +     tegra_csi_try_mbus_fmt(subdev, format);
>> +
>> +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>> +             return 0;
>> +
>> +     mutex_lock(&csi_chan->format_lock);
>> +     memcpy(&csi_chan->ports->format, format,
>> +            sizeof(struct v4l2_mbus_framefmt));
>> +     mutex_unlock(&csi_chan->format_lock);
>> +
>> +     return 0;
>> +}
>> +
>> +/*
>> + * V4L2 Subdevice Operations
>> + */
>> +static struct v4l2_subdev_video_ops tegra_csi_video_ops =3D {
>> +     .s_stream =3D tegra_csi_s_stream,
>> +};
>> +
>> +static struct v4l2_subdev_pad_ops tegra_csi_pad_ops =3D {
>> +     .get_fmt                =3D tegra_csi_get_format,
>> +     .set_fmt                =3D tegra_csi_set_format,
>> +};
>> +
>> +static struct v4l2_subdev_ops tegra_csi_ops =3D {
>> +     .video  =3D &tegra_csi_video_ops,
>> +     .pad    =3D &tegra_csi_pad_ops,
>> +};
>> +
>> +/*
>> + * Media Operations
>> + */
>> +static const struct media_entity_operations tegra_csi_media_ops =3D {
>> +     .link_validate =3D v4l2_subdev_link_validate,
>> +};
>> +
>> +static int tegra_csi_tpg_channels_alloc(struct tegra_csi_device *csi)
>> +{
>> +     struct device_node *node =3D csi->dev->of_node;
>> +     unsigned int port_num;
>> +     int ret;
>> +     struct tegra_csi_channel *item;
>> +     unsigned int tpg_channels =3D csi->soc_data->num_tpg_channels;
>> +
>> +     /* allocate CSI channel for each CSI x2 ports */
>> +     for (port_num =3D 0; port_num < tpg_channels; port_num++) {
>> +             item =3D devm_kzalloc(csi->dev, sizeof(*item), GFP_KERNEL)=
;
>> +             if (!item) {
>> +                     ret =3D -ENOMEM;
>> +                     goto error;
>> +             }
>> +
>> +             list_add_tail(&item->list, &csi->csi_chans);
>> +             item->csi =3D csi;
>> +             item->csi_port_num =3D port_num;
>> +             item->numlanes =3D 2;
>> +             item->of_node =3D node;
>> +             item->numpads =3D 1;
>> +             item->pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
>> +     }
>> +
>> +     return 0;
>> +
>> +error:
>> +     list_for_each_entry(item, &csi->csi_chans, list)
>> +             list_del(&item->list);
>> +
>> +     return ret;
>> +}
>> +
>> +static int tegra_csi_channel_init(struct tegra_csi_channel *chan)
>> +{
>> +     struct tegra_csi_device *csi =3D chan->csi;
>> +     struct v4l2_subdev *subdev;
>> +     int ret;
>> +
>> +     chan->ports =3D devm_kzalloc(csi->dev, sizeof(struct tegra_csi_por=
t),
>> +                                GFP_KERNEL);
>> +     if (!chan->ports)
>> +             return -ENOMEM;
>> +
>> +     mutex_init(&chan->format_lock);
>> +
>> +     /* initialize the default format */
>> +     chan->ports->format.code =3D TEGRA_VF_DEF;
>> +     chan->ports->format.field =3D V4L2_FIELD_NONE;
>> +     chan->ports->format.colorspace =3D V4L2_COLORSPACE_SRGB;
>> +     chan->ports->format.width =3D TEGRA_DEF_WIDTH;
>> +     chan->ports->format.height =3D TEGRA_DEF_HEIGHT;
>> +     chan->ports->lanes =3D chan->numlanes;
>> +
>> +     /* initialize V4L2 subdevice and media entity */
>> +     subdev =3D &chan->subdev;
>> +     v4l2_subdev_init(subdev, &tegra_csi_ops);
>> +     subdev->dev =3D csi->dev;
>> +     snprintf(subdev->name, V4L2_SUBDEV_NAME_SIZE, "%s-%d", "tpg",
>> +              chan->csi_port_num);
>> +
>> +     v4l2_set_subdevdata(subdev, chan);
>> +     subdev->fwnode =3D of_fwnode_handle(chan->of_node);
>> +     subdev->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     subdev->entity.ops =3D &tegra_csi_media_ops;
>> +
>> +     /* initialize media entity pads */
>> +     ret =3D media_entity_pads_init(&subdev->entity, chan->numpads,
>> +                                  chan->pads);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret =3D v4l2_async_register_subdev(subdev);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "failed to register subdev\n");
>> +             media_entity_cleanup(&subdev->entity);
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>> +void tegra_csi_error_status(struct v4l2_subdev *subdev)
>> +{
>> +     struct tegra_csi_channel *csi_chan =3D to_csi_chan(subdev);
>> +     struct tegra_csi_device *csi =3D csi_chan->csi;
>> +
>> +     csi->fops->csi_err_status(csi_chan);
>> +}
>> +EXPORT_SYMBOL(tegra_csi_error_status);
>> +
>> +static int tegra_csi_init(struct host1x_client *client)
>> +{
>> +     struct tegra_csi_device *csi =3D host1x_client_to_csi(client);
>> +     struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>> +     struct tegra_csi_channel *item;
>> +     int ret;
>> +
>> +     cam->csi =3D csi;
>> +
>> +     INIT_LIST_HEAD(&csi->csi_chans);
>> +
>> +     ret =3D tegra_csi_tpg_channels_alloc(csi);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     list_for_each_entry(item, &csi->csi_chans, list) {
>> +             ret =3D tegra_csi_channel_init(item);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     ret =3D csi->fops->hw_init(csi);
>> +     if (ret)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_csi_exit(struct host1x_client *client)
>> +{
>> +     struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>> +     struct v4l2_subdev *subdev;
>> +     struct tegra_csi_channel *chan;
>> +
>> +     if (!cam->csi)
>> +             return 0;
>> +
>> +     list_for_each_entry(chan, &cam->csi->csi_chans, list) {
>> +             mutex_destroy(&chan->format_lock);
>> +             subdev =3D &chan->subdev;
>> +             media_entity_cleanup(&subdev->entity);
>> +             v4l2_async_unregister_subdev(subdev);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct host1x_client_ops csi_client_ops =3D {
>> +     .init =3D tegra_csi_init,
>> +     .exit =3D tegra_csi_exit,
>> +};
>> +
>> +static int tegra_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi_device *csi;
>> +     struct resource *res;
>> +     int ret;
>> +
>> +     csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     csi->iomem =3D devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(csi->iomem))
>> +             return PTR_ERR(csi->iomem);
>> +
>> +     csi->soc_data =3D of_device_get_match_data(&pdev->dev);
>> +     if (!csi->soc_data) {
>> +             dev_info(&pdev->dev, "No platform data\n\n");
>> +             return -ENODATA;
>> +     }
>> +
>> +     csi->dev =3D &pdev->dev;
>> +     csi->fops =3D csi->soc_data->csi_fops;
>> +     platform_set_drvdata(pdev, csi);
>> +
>> +     /* initialize host1x interface */
>> +     INIT_LIST_HEAD(&csi->client.list);
>> +     csi->client.ops =3D &csi_client_ops;
>> +     csi->client.dev =3D &pdev->dev;
>> +
>> +     ret =3D host1x_client_register(&csi->client);
>> +     if (ret < 0) {
>> +             dev_err(csi->dev, "failed to register host1x client: %d\n"=
,
>> +                     ret);
>> +             return -ENODEV;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct tegra_csi_device *csi =3D platform_get_drvdata(pdev);
>> +
>> +     host1x_client_unregister(&csi->client);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct tegra_csi_soc_data tegra210_csi_data =3D {
>> +     .csi_fops =3D &csi2_fops,
>> +     .cil_max_clk_hz =3D TEGRA210_CSI_CIL_CLK_MAX,
>> +     .num_tpg_channels =3D TEGRA210_MAX_CHANNELS,
>> +};
>> +
>> +static const struct of_device_id tegra_csi_of_id_table[] =3D {
>> +     { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_d=
ata },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_csi_of_id_table);
>> +
>> +struct platform_driver tegra_csi_driver =3D {
>> +     .driver =3D {
>> +             .name           =3D "tegra-csi",
>> +             .of_match_table =3D tegra_csi_of_id_table,
>> +     },
>> +     .probe                  =3D tegra_csi_probe,
>> +     .remove                 =3D tegra_csi_remove,
>> +};
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra CSI Device Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/tegra-vi.c b/drivers/staging/me=
dia/tegra/tegra-vi.c
>> new file mode 100644
>> index 000000000000..6f5950b7988e
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-vi.c
>> @@ -0,0 +1,351 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/host1x.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_graph.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-fwnode.h>
>> +
>> +#include <soc/tegra/pmc.h>
>> +
>> +#include "host1x-video.h"
>> +#include "mc_common.h"
>> +#include "vi2_formats.h"
>> +#include "vi2_registers.h"
>> +#include "vi2_fops.h"
>> +#include "tegra-vi.h"
>> +
>> +static inline struct tegra_vi *
>> +host1x_client_to_vi(struct host1x_client *client)
>> +{
>> +     return container_of(client, struct tegra_vi, client);
>> +}
>> +
>> +/* VI only support 2 formats in TPG mode */
>> +static void vi_tpg_fmts_bitmap_init(struct tegra_channel *chan)
>> +{
>> +     int index;
>> +
>> +     bitmap_zero(chan->tpg_fmts_bitmap, MAX_FORMAT_NUM);
>> +
>> +     index =3D tegra_core_get_idx_by_code(chan,
>> +                                        MEDIA_BUS_FMT_SRGGB10_1X10, 0);
>> +     bitmap_set(chan->tpg_fmts_bitmap, index, 1);
>> +
>> +     index =3D tegra_core_get_idx_by_code(chan,
>> +                                        MEDIA_BUS_FMT_RGB888_1X32_PADHI=
, 0);
>> +     bitmap_set(chan->tpg_fmts_bitmap, index, 1);
>> +}
>> +
>> +int tegra_vi_power_on(struct tegra_vi *vi)
>> +{
>> +     int ret;
>> +
>> +     ret =3D regulator_enable(vi->vi_reg);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret =3D tegra_powergate_sequence_power_up(TEGRA_POWERGATE_VENC,
>> +                                             vi->vi_clk, vi->vi_rst);
>> +     if (ret) {
>> +             dev_err(vi->dev, "failed to power up!\n");
>> +             goto error_power_up;
>> +     }
>> +
>> +     ret =3D clk_set_rate(vi->vi_clk, vi->soc_data->vi_max_clk_hz);
>> +     if (ret) {
>> +             dev_err(vi->dev, "failed to set vi clk rate, err: %d\n", r=
et);
>> +             goto error_clk_set_rate;
>> +     }
>> +
>> +     ret =3D clk_prepare_enable(vi->vi_clk);
>> +     if (ret) {
>> +             dev_err(vi->dev, "failed to enable vi clk, err: %d\n", ret=
);
>> +             goto error_clk_set_rate;
>> +     }
>> +
>> +     return 0;
>> +
>> +error_clk_set_rate:
>> +     tegra_powergate_power_off(TEGRA_POWERGATE_VENC);
>> +
>> +error_power_up:
>> +     regulator_disable(vi->vi_reg);
>> +
>> +     return ret;
>> +}
>> +
>> +void tegra_vi_power_off(struct tegra_vi *vi)
>> +{
>> +     reset_control_assert(vi->vi_rst);
>> +     clk_disable_unprepare(vi->vi_clk);
>> +     tegra_powergate_power_off(TEGRA_POWERGATE_VENC);
>> +     regulator_disable(vi->vi_reg);
>> +}
>> +
>> +static int tegra_vi_tpg_channels_alloc(struct tegra_vi *vi)
>> +{
>> +     struct tegra_channel *chan;
>> +     unsigned int port_num;
>> +     const struct tegra_video_format *video_formats;
>> +     unsigned int nformats =3D vi->soc_data->nformats;
>> +     unsigned int nchannels =3D vi->soc_data->vi_max_channels;
>> +
>> +     video_formats =3D devm_kcalloc(vi->dev, nformats, sizeof(*video_fo=
rmats),
>> +                                  GFP_KERNEL);
>> +     if (!video_formats)
>> +             return -ENOMEM;
>> +
>> +     video_formats =3D vi->soc_data->video_formats;
>> +
>> +     for (port_num =3D 0; port_num < nchannels; port_num++) {
>> +             chan =3D devm_kzalloc(vi->dev, sizeof(*chan), GFP_KERNEL);
>> +             if (!chan)
>> +                     return -ENOMEM;
>> +
>> +             list_add_tail(&chan->list, &vi->vi_chans);
>> +             chan->vi =3D vi;
>> +             chan->port =3D port_num;
>> +             chan->nformats =3D nformats;
>> +             chan->video_formats =3D video_formats;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_vi_channels_init(struct tegra_vi *vi)
>> +{
>> +     struct tegra_channel *chan;
>> +     int ret;
>> +
>> +     list_for_each_entry(chan, &vi->vi_chans, list) {
>> +             ret =3D tegra_channel_init(chan);
>> +             if (ret < 0) {
>> +                     dev_err(vi->dev, "channel %d init failed\n",
>> +                             chan->port);
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_vi_channels_cleanup(struct tegra_vi *vi)
>> +{
>> +     struct tegra_channel *chan;
>> +
>> +     list_for_each_entry(chan, &vi->vi_chans, list)
>> +             tegra_channel_cleanup(chan);
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_vi_tpg_graph_init(struct tegra_vi *vi)
>> +{
>> +     struct tegra_camera *cam =3D dev_get_drvdata(vi->client.host);
>> +     struct tegra_csi_device *csi =3D cam->csi;
>> +     struct tegra_channel *vi_chan;
>> +     struct tegra_csi_channel *csi_chan;
>> +     u32 link_flags =3D MEDIA_LNK_FL_ENABLED;
>> +     int ret =3D 0;
>> +
>> +     csi_chan =3D list_first_entry(&csi->csi_chans, struct tegra_csi_ch=
annel,
>> +                                 list);
>> +
>> +     list_for_each_entry(vi_chan, &vi->vi_chans, list) {
>> +             struct media_entity *source =3D &csi_chan->subdev.entity;
>> +             struct media_entity *sink =3D &vi_chan->video.entity;
>> +             struct media_pad *source_pad =3D csi_chan->pads;
>> +             struct media_pad *sink_pad =3D &vi_chan->pad;
>> +
>> +             ret =3D v4l2_device_register_subdev(&cam->v4l2_dev,
>> +                                               &csi_chan->subdev);
>> +             if (ret) {
>> +                     dev_err(vi->dev, "failed to register subdev: %d\n"=
,
>> +                             ret);
>> +                     goto register_fail;
>> +             }
>> +
>> +             dev_dbg(vi->dev, "creating %s:%u -> %s:%u link\n",
>> +                     source->name, source_pad->index,
>> +                     sink->name, sink_pad->index);
>> +
>> +             ret =3D media_create_pad_link(source, source_pad->index,
>> +                                         sink, sink_pad->index,
>> +                                         link_flags);
>> +             if (ret < 0) {
>> +                     dev_err(vi->dev,
>> +                             "failed to create %s:%u -> %s:%u link\n",
>> +                             source->name, source_pad->index,
>> +                             sink->name, sink_pad->index);
>> +                     goto register_fail;
>> +             }
>> +
>> +             vi_tpg_fmts_bitmap_init(vi_chan);
>> +             tegra_channel_setup_ctrl_handler(vi_chan);
>> +
>> +             csi_chan =3D list_next_entry(csi_chan, list);
>> +     }
>> +
>> +     return 0;
>> +
>> +register_fail:
>> +     list_for_each_entry(csi_chan, &csi->csi_chans, list)
>> +             v4l2_device_unregister_subdev(&csi_chan->subdev);
>> +
>> +     return ret;
>> +}
>> +
>> +static int tegra_vi_init(struct host1x_client *client)
>> +{
>> +     struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>> +     struct tegra_vi *vi =3D host1x_client_to_vi(client);
>> +     int ret;
>> +
>> +     cam->vi =3D vi;
>> +
>> +     if (!cam->csi) {
>> +             dev_err(vi->dev, "csi host1x client is not initialized\n")=
;
>> +             return -ENODEV;
>> +     }
>> +
>> +     INIT_LIST_HEAD(&vi->vi_chans);
>> +
>> +     /* Create all TPG channels */
>> +     ret =3D tegra_vi_tpg_channels_alloc(vi);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* initialize Tegra VI channels */
>> +     ret =3D tegra_vi_channels_init(vi);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     /* Setup media links between Tegra VI and CSI for TPG */
>> +     ret =3D tegra_vi_tpg_graph_init(vi);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_vi_exit(struct host1x_client *client)
>> +{
>> +     struct tegra_camera *cam =3D dev_get_drvdata(client->host);
>> +
>> +     if (cam->vi)
>> +             tegra_vi_channels_cleanup(cam->vi);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct host1x_client_ops vi_client_ops =3D {
>> +     .init =3D tegra_vi_init,
>> +     .exit =3D tegra_vi_exit,
>> +};
>> +
>> +static int tegra_vi_probe(struct platform_device *pdev)
>> +{
>> +     struct resource *res;
>> +     struct tegra_vi *vi;
>> +     int ret;
>> +
>> +     vi =3D devm_kzalloc(&pdev->dev, sizeof(*vi), GFP_KERNEL);
>> +     if (!vi)
>> +             return -ENOMEM;
>> +
>> +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     vi->iomem =3D devm_ioremap_resource(&pdev->dev, res);
>> +     if (IS_ERR(vi->iomem))
>> +             return PTR_ERR(vi->iomem);
>> +
>> +     vi->soc_data =3D of_device_get_match_data(&pdev->dev);
>> +     if (!vi->soc_data) {
>> +             dev_info(&pdev->dev, "No platform data\n\n");
>> +             return -ENODATA;
>> +     }
>> +
>> +     vi->vi_rst =3D devm_reset_control_get(&pdev->dev, "vi");
>> +     if (IS_ERR(vi->vi_rst)) {
>> +             dev_err(&pdev->dev, "Failed to get vi reset\n");
>> +             return PTR_ERR(vi->vi_rst);
>> +     }
>> +
>> +     vi->vi_clk =3D devm_clk_get(&pdev->dev, "vi");
>> +     if (IS_ERR(vi->vi_clk)) {
>> +             dev_err(&pdev->dev, "Failed to get vi clock\n");
>> +             return PTR_ERR(vi->vi_clk);
>> +     }
>> +
>> +     vi->vi_reg =3D devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>> +     if (IS_ERR(vi->vi_reg)) {
>> +             dev_err(&pdev->dev, "Failed to get avdd-dsi-csi regulators=
\n");
>> +             return -EPROBE_DEFER;
>> +     }
>> +
>> +     vi->dev =3D &pdev->dev;
>> +     vi->fops =3D vi->soc_data->vi_fops;
>> +     platform_set_drvdata(pdev, vi);
>> +
>> +     /* initialize host1x interface */
>> +     INIT_LIST_HEAD(&vi->client.list);
>> +     vi->client.ops =3D &vi_client_ops;
>> +     vi->client.dev =3D &pdev->dev;
>> +
>> +     ret =3D host1x_client_register(&vi->client);
>> +     if (ret < 0) {
>> +             dev_err(vi->dev, "failed to register host1x client: %d\n",
>> +                     ret);
>> +             return -ENODEV;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int tegra_vi_remove(struct platform_device *pdev)
>> +{
>> +     struct tegra_vi *vi =3D platform_get_drvdata(pdev);
>> +
>> +     host1x_client_unregister(&vi->client);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct vi_tegra_soc_data tegra210_vi_data =3D {
>> +     .video_formats =3D vi2_video_formats,
>> +     .nformats =3D ARRAY_SIZE(vi2_video_formats),
>> +     .vi_fops =3D &vi2_fops,
>> +     .vi_max_clk_hz =3D TEGRA210_CLOCK_VI_MAX,
>> +     .vi_max_channels =3D TEGRA210_MAX_CHANNELS,
>> +};
>> +
>> +static const struct of_device_id tegra_vi_of_id_table[] =3D {
>> +     { .compatible =3D "nvidia,tegra210-vi", .data =3D &tegra210_vi_dat=
a },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(of, tegra_vi_of_id_table);
>> +
>> +struct platform_driver tegra_vi_driver =3D {
>> +     .driver =3D {
>> +             .name =3D "tegra-vi",
>> +             .of_match_table =3D tegra_vi_of_id_table,
>> +     },
>> +     .probe =3D tegra_vi_probe,
>> +     .remove =3D tegra_vi_remove,
>> +};
>> +
>> +MODULE_AUTHOR("Sowjanya Komatineni <skomatineni@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra Video Input Device Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/staging/media/tegra/tegra-vi.h b/drivers/staging/me=
dia/tegra/tegra-vi.h
>> new file mode 100644
>> index 000000000000..62973cb62624
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/tegra-vi.h
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __TEGRA_VI_H__
>> +#define __TEGRA_VI_H__
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/videodev2.h>
>> +
>> +#include <media/media-device.h>
>> +#include <media/media-entity.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-dev.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#include "mc_common.h"
>> +
>> +enum tegra_vi_pg_mode {
>> +     TEGRA_VI_PG_DISABLED =3D 0,
>> +     TEGRA_VI_PG_DIRECT,
>> +     TEGRA_VI_PG_PATCH,
>> +};
>> +
>> +/**
>> + * struct tegra_channel_buffer - video channel buffer
>> + * @buf: vb2 buffer base object
>> + * @queue: buffer list entry in the channel queued buffers list
>> + * @chan: channel that uses the buffer
>> + * @addr: Tegra IOVA buffer address for VI output
>> + */
>> +struct tegra_channel_buffer {
>> +     struct tegra_channel *chan;
>> +     struct vb2_v4l2_buffer buf;
>> +     struct list_head queue;
>> +     dma_addr_t addr;
>> +};
>> +
>> +#define to_tegra_channel_buffer(vb) \
>> +     container_of(vb, struct tegra_channel_buffer, buf)
>> +
>> +struct tegra_vi_fops {
>> +     void (*vi_stride_align)(unsigned int *bpl);
>> +     int (*vi_start_streaming)(struct vb2_queue *vq, u32 count);
>> +     void (*vi_stop_streaming)(struct vb2_queue *vq);
>> +};
>> +
>> +struct vi_tegra_soc_data {
>> +     const struct tegra_video_format *video_formats;
>> +     unsigned int nformats;
>> +     const struct tegra_vi_fops *vi_fops;
>> +     unsigned int vi_max_clk_hz;
>> +     unsigned int vi_max_channels;
>> +};
>> +
>> +/**
>> + * struct tegra_vi - NVIDIA Tegra Video Input device structure
>> + * @dev: device struct
>> + * @client: host1x_client struct
>> + *
>> + * @iomem: register base
>> + * @vi_clk: main clock for VI block
>> + * @vi_rst: reset controller
>> + * @vi_reg: regulator for VI hardware, normally it avdd_dsi_csi
>> + * @power_on_refcnt: reference count for power on/off operations
>> + *
>> + * @soc_data: pointer to SoC data structure
>> + * @fops: vi operations
>> + *
>> + * @channels: list of channels at the pipeline output and input
>> + *
>> + * @pg_mode: test pattern generator mode (disabled/direct/patch)
>> + */
>> +struct tegra_vi {
>> +     struct device *dev;
>> +     struct host1x_client client;
>> +
>> +     void __iomem *iomem;
>> +     struct clk *vi_clk;
>> +     struct reset_control *vi_rst;
>> +     struct regulator *vi_reg;
>> +     atomic_t power_on_refcnt;
>> +
>> +     const struct vi_tegra_soc_data *soc_data;
>> +     const struct tegra_vi_fops *fops;
>> +
>> +     struct list_head vi_chans;
>> +
>> +     enum tegra_vi_pg_mode pg_mode;
>> +};
>> +
>> +int tegra_vi_power_on(struct tegra_vi *vi);
>> +void tegra_vi_power_off(struct tegra_vi *vi);
>> +
>> +#endif /* __TEGRA_VI_H__ */
>> diff --git a/drivers/staging/media/tegra/vi2_fops.c b/drivers/staging/me=
dia/tegra/vi2_fops.c
>> new file mode 100644
>> index 000000000000..a12a662ceec6
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_fops.c
>> @@ -0,0 +1,364 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __VI2_H__
>> +#define __VI2_H__
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/freezer.h>
>> +
>> +#include "vi2_registers.h"
>> +#include "vi2_formats.h"
>> +#include "mc_common.h"
>> +#include "vi2_fops.h"
>> +#include "tegra-vi.h"
>> +
>> +static void tegra_channel_write(struct tegra_channel *chan,
>> +                             unsigned int addr, u32 val)
>> +{
>> +     writel(val, chan->vi->iomem + addr);
>> +}
>> +
>> +static u32 tegra_channel_read(struct tegra_channel *chan,
>> +                           unsigned int addr)
>> +{
>> +     return readl(chan->vi->iomem + addr);
>> +}
>> +
>> +/* VI CSI registers accessors */
>> +static void csi_write(struct tegra_channel *chan, unsigned int addr, u3=
2 val)
>> +{
>> +     void __iomem *vi_csi_base;
>> +
>> +     vi_csi_base =3D chan->vi->iomem + TEGRA_VI_CSI_BASE(chan->port);
>> +     writel(val, vi_csi_base + addr);
>> +}
>> +
>> +static u32 csi_read(struct tegra_channel *chan, unsigned int addr)
>> +{
>> +     void __iomem *vi_csi_base;
>> +
>> +     vi_csi_base =3D chan->vi->iomem + TEGRA_VI_CSI_BASE(chan->port);
>> +
>> +     return readl(vi_csi_base + addr);
>> +}
>> +
>> +/*
>> + * Tegra channel frame setup and capture operations
>> + */
>> +static int tegra_channel_capture_setup(struct tegra_channel *chan)
>> +{
>> +     u32 height =3D chan->format.height;
>> +     u32 width =3D chan->format.width;
>> +     u32 format =3D chan->fmtinfo->img_fmt;
>> +     u32 data_type =3D chan->fmtinfo->img_dt;
>> +     u32 word_count =3D tegra_core_get_word_count(width, chan->fmtinfo)=
;
>> +
>> +     csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
>> +     csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF,
>> +               ((chan->vi->pg_mode ? 0 : 1) << BYPASS_PXL_TRANSFORM_OFF=
SET) |
>> +               (format << IMAGE_DEF_FORMAT_OFFSET) |
>> +               IMAGE_DEF_DEST_MEM);
>> +     csi_write(chan, TEGRA_VI_CSI_IMAGE_DT, data_type);
>> +     csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE_WC, word_count);
>> +     csi_write(chan, TEGRA_VI_CSI_IMAGE_SIZE,
>> +               (height << IMAGE_SIZE_HEIGHT_OFFSET) | width);
>> +
>> +     return 0;
>> +}
>> +
>> +static void tegra_channel_capture_error_status(struct tegra_channel *ch=
an)
>> +{
>> +     u32 val;
>> +
>> +     val =3D csi_read(chan, TEGRA_VI_CSI_ERROR_STATUS);
>> +     dev_err(&chan->video.dev, "TEGRA_VI_CSI_ERROR_STATUS 0x%08x\n", va=
l);
>> +     csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, val);
>> +
>> +     val =3D tegra_channel_read(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR=
);
>> +     dev_err(&chan->video.dev, "TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR 0x%08=
x\n",
>> +             val);
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR, val);
>> +     tegra_channel_csi_error_status(chan);
>> +}
>> +
>> +static int tegra_channel_capture_frame(struct tegra_channel *chan,
>> +                                    struct tegra_channel_buffer *buf)
>> +{
>> +     int err =3D 0;
>> +     u32 thresh, value, frame_start;
>> +     int bytes_per_line =3D chan->format.bytesperline;
>> +
>> +     /* program buffer address by using surface 0 */
>> +     csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB, 0x0);
>> +     csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
>> +     csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
>> +
>> +     /* increase syncpoint max */
>> +     thresh =3D host1x_syncpt_incr_max(chan->sp, 1);
>> +
>> +     /* program syncpoint */
>> +     frame_start =3D VI_CSI_PP_FRAME_START(chan->port);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
>> +             host1x_syncpt_id(chan->sp);
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
>> +
>> +     /* move buffer to capture done queue */
>> +     spin_lock(&chan->done_lock);
>> +     list_add_tail(&buf->queue, &chan->done);
>> +     spin_unlock(&chan->done_lock);
>> +
>> +     /* wait up kthread for capture done */
>> +     wake_up_interruptible(&chan->done_wait);
>> +
>> +     /* use syncpoint to wake up */
>> +     err =3D host1x_syncpt_wait(chan->sp, thresh,
>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +     if (err) {
>> +             dev_err(&chan->video.dev,
>> +                     "frame start syncpt timeout, err: %d\n", err);
>> +             tegra_channel_capture_error_status(chan);
>> +     }
>> +
>> +     return err;
>> +}
>> +
>> +static int tegra_channel_capture_done(struct tegra_channel *chan,
>> +                                   struct tegra_channel_buffer *buf)
>> +{
>> +     struct vb2_v4l2_buffer *vb =3D &buf->buf;
>> +     u32 thresh, value, mw_ack_done;
>> +     int ret =3D 0;
>> +
>> +     /* increase syncpoint max */
>> +     thresh =3D host1x_syncpt_incr_max(chan->sp, 1);
>> +
>> +     /* program syncpoint */
>> +     mw_ack_done =3D VI_CSI_MW_ACK_DONE(chan->port);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
>> +             host1x_syncpt_id(chan->sp);
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     if (!csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT))
>> +             csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPT=
URE);
>> +
>> +     /* use syncpoint to wake up */
>> +     ret =3D host1x_syncpt_wait(chan->sp, thresh,
>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
>> +     if (ret)
>> +             dev_err(&chan->video.dev,
>> +                     "MW_ACK_DONE syncpoint timeout, err: %d\n", ret);
>> +
>> +     /* captured one frame */
>> +     vb->sequence =3D chan->sequence++;
>> +     vb->field =3D V4L2_FIELD_NONE;
>> +     vb->vb2_buf.timestamp =3D ktime_get_ns();
>> +     vb2_buffer_done(&vb->vb2_buf,
>> +                     ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE=
);
>> +
>> +     return ret;
>> +}
>> +
>> +static int chan_capture_kthread_start(void *data)
>> +{
>> +     struct tegra_channel *chan =3D data;
>> +     struct tegra_channel_buffer *buf;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->start_wait,
>> +                                      !list_empty(&chan->capture) ||
>> +                                      kthread_should_stop());
>> +             if (kthread_should_stop())
>> +                     break;
>> +
>> +             spin_lock(&chan->start_lock);
>> +             if (list_empty(&chan->capture)) {
>> +                     spin_unlock(&chan->start_lock);
>> +                     continue;
>> +             }
>> +
>> +             buf =3D list_entry(chan->capture.next,
>> +                              struct tegra_channel_buffer, queue);
>> +             list_del_init(&buf->queue);
>> +             spin_unlock(&chan->start_lock);
>> +             tegra_channel_capture_frame(chan, buf);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int chan_capture_kthread_done(void *data)
>> +{
>> +     struct tegra_channel *chan =3D data;
>> +     struct tegra_channel_buffer *buf;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->done_wait,
>> +                                      !list_empty(&chan->done) ||
>> +                                      kthread_should_stop());
>> +
>> +             if (kthread_should_stop())
>> +                     break;
>> +
>> +             spin_lock(&chan->done_lock);
>> +             if (list_empty(&chan->done)) {
>> +                     spin_unlock(&chan->done_lock);
>> +                     continue;
>> +             }
>> +
>> +             buf =3D list_entry(chan->done.next, struct tegra_channel_b=
uffer,
>> +                              queue);
>> +             list_del_init(&buf->queue);
>> +             spin_unlock(&chan->done_lock);
>> +             tegra_channel_capture_done(chan, buf);
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void vi2_stride_align(unsigned int *bpl)
>> +{
>> +     *bpl =3D ((*bpl + (TEGRA210_SURFACE_ALIGNMENT) - 1) &
>> +                     ~((TEGRA210_SURFACE_ALIGNMENT) - 1));
>> +}
>> +
>> +static int vi2_channel_start_streaming(struct vb2_queue *vq, u32 count)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vq);
>> +     struct media_pipeline *pipe =3D &chan->video.pipe;
>> +     int ret =3D 0;
>> +
>> +     /* turn on the power on first open */
>> +     if (atomic_add_return(1, &chan->vi->power_on_refcnt) =3D=3D 1) {
>> +             ret =3D tegra_vi_power_on(chan->vi);
>> +             if (ret < 0)
>> +                     goto error_vi_power_on;
>> +
>> +             usleep_range(5, 100);
>> +             tegra_channel_write(chan, TEGRA_VI_CFG_CG_CTRL,
>> +                                 VI_CG_2ND_LEVEL_EN);
>> +             usleep_range(10, 15);
>> +     }
>> +
>> +     /* clean up status */
>> +     csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
>> +
>> +     /*
>> +      * Sync point FIFO full stalls the host interface.
>> +      * Setting NO_STALL will drop INCR_SYNCPT methods when fifos are
>> +      * full and corresponding condition bits in INCR_SYNCPT_ERROR
>> +      * register will be set.
>> +      * This allows SW to process error recovery.
>> +      */
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL,
>> +                         TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL);
>> +
>> +     ret =3D media_pipeline_start(&chan->video.entity, pipe);
>> +     if (ret < 0)
>> +             goto error_pipeline_start;
>> +
>> +     /* start the pipeline */
>> +     ret =3D tegra_channel_set_stream(chan, true);
>> +     if (ret < 0)
>> +             goto error_set_stream;
>> +
>> +     /* program VI registers after TPG, sensors and CSI streaming */
>> +     ret =3D tegra_channel_capture_setup(chan);
>> +     if (ret < 0)
>> +             goto error_capture_setup;
>> +
>> +     chan->sequence =3D 0;
>> +
>> +     /* start kthread to capture data to buffer */
>> +     chan->kthread_capture_start =3D kthread_run(chan_capture_kthread_s=
tart,
>> +                                               chan, "%s:0",
>> +                                               chan->video.name);
>> +     if (IS_ERR(chan->kthread_capture_start)) {
>> +             dev_err(&chan->video.dev,
>> +                     "failed to run kthread for capture start!\n");
>> +             ret =3D PTR_ERR(chan->kthread_capture_start);
>> +             goto error_capture_setup;
>> +     }
>> +
>> +     chan->kthread_capture_done =3D kthread_run(chan_capture_kthread_do=
ne,
>> +                                              chan, "%s:1",
>> +                                              chan->video.name);
>> +     if (IS_ERR(chan->kthread_capture_done)) {
>> +             dev_err(&chan->video.dev,
>> +                     "failed to run kthread for capture done!\n");
>> +             ret =3D PTR_ERR(chan->kthread_capture_done);
>> +             goto error_capture_setup;
>> +     }
>> +
>> +     return 0;
>> +
>> +error_capture_setup:
>> +     tegra_channel_set_stream(chan, false);
>> +
>> +error_set_stream:
>> +     media_pipeline_stop(&chan->video.entity);
>> +
>> +error_pipeline_start:
>> +     tegra_channel_queued_buf_done(chan, VB2_BUF_STATE_QUEUED);
>> +
>> +error_vi_power_on:
>> +     if (atomic_dec_and_test(&chan->vi->power_on_refcnt))
>> +             tegra_vi_power_off(chan->vi);
>> +
>> +     return ret;
>> +}
>> +
>> +static void vi2_channel_stop_streaming(struct vb2_queue *vq)
>> +{
>> +     struct tegra_channel *chan =3D vb2_get_drv_priv(vq);
>> +
>> +     /* stop the kthread for capture */
>> +     kthread_stop(chan->kthread_capture_start);
>> +     chan->kthread_capture_start =3D NULL;
>> +     kthread_stop(chan->kthread_capture_done);
>> +     chan->kthread_capture_done =3D NULL;
>> +
>> +     /* disable clock gating to enable continuous clock */
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>> +
>> +     /* clear single shot if armed at close */
>> +     if (csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT)) {
>> +             csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xF);
>> +             csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
>> +     }
>> +
>> +     /* enable clock gating so VI can be clock gated if necessary */
>> +     tegra_channel_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN=
);
>> +
>> +     tegra_channel_set_stream(chan, false);
>> +
>> +     media_pipeline_stop(&chan->video.entity);
>> +
>> +     /* turn off power on the last release */
>> +     if (atomic_dec_and_test(&chan->vi->power_on_refcnt))
>> +             tegra_vi_power_off(chan->vi);
>> +
>> +     tegra_channel_queued_buf_done(chan, VB2_BUF_STATE_ERROR);
>> +}
>> +
>> +const struct tegra_vi_fops vi2_fops =3D {
>> +     .vi_stride_align =3D vi2_stride_align,
>> +     .vi_start_streaming =3D vi2_channel_start_streaming,
>> +     .vi_stop_streaming =3D vi2_channel_stop_streaming,
>> +};
>> +EXPORT_SYMBOL(vi2_fops);
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/vi2_fops.h b/drivers/staging/me=
dia/tegra/vi2_fops.h
>> new file mode 100644
>> index 000000000000..dcbd3ad4b642
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_fops.h
>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __T210_VI_H__
>> +#define __T210_VI_H__
>> +
>> +#define      TEGRA210_CLOCK_VI_MAX                   460000000
>> +
>> +#define      TEGRA_VI_CSI_BASE(x)                    (0x100 + (x) * 0x1=
00)
>> +
>> +extern const struct tegra_vi_fops vi2_fops;
>> +
>> +#endif
>> diff --git a/drivers/staging/media/tegra/vi2_formats.h b/drivers/staging=
/media/tegra/vi2_formats.h
>> new file mode 100644
>> index 000000000000..416960b1c1f2
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_formats.h
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __VI2_FORMATS_H_
>> +#define __VI2_FORMATS_H_
>> +
>> +#include "tegra-core.h"
>> +
>> +/*
>> + * These go into the TEGRA_VI_CSI_n_IMAGE_DEF registers bits 23:16
>> + * Output pixel memory format for the VI channel.
>> + */
>> +enum tegra_image_format {
>> +     TEGRA_IMAGE_FORMAT_T_L8 =3D 16,
>> +
>> +     TEGRA_IMAGE_FORMAT_T_R16_I =3D 32,
>> +     TEGRA_IMAGE_FORMAT_T_B5G6R5,
>> +     TEGRA_IMAGE_FORMAT_T_R5G6B5,
>> +     TEGRA_IMAGE_FORMAT_T_A1B5G5R5,
>> +     TEGRA_IMAGE_FORMAT_T_A1R5G5B5,
>> +     TEGRA_IMAGE_FORMAT_T_B5G5R5A1,
>> +     TEGRA_IMAGE_FORMAT_T_R5G5B5A1,
>> +     TEGRA_IMAGE_FORMAT_T_A4B4G4R4,
>> +     TEGRA_IMAGE_FORMAT_T_A4R4G4B4,
>> +     TEGRA_IMAGE_FORMAT_T_B4G4R4A4,
>> +     TEGRA_IMAGE_FORMAT_T_R4G4B4A4,
>> +
>> +     TEGRA_IMAGE_FORMAT_T_A8B8G8R8 =3D 64,
>> +     TEGRA_IMAGE_FORMAT_T_A8R8G8B8,
>> +     TEGRA_IMAGE_FORMAT_T_B8G8R8A8,
>> +     TEGRA_IMAGE_FORMAT_T_R8G8B8A8,
>> +     TEGRA_IMAGE_FORMAT_T_A2B10G10R10,
>> +     TEGRA_IMAGE_FORMAT_T_A2R10G10B10,
>> +     TEGRA_IMAGE_FORMAT_T_B10G10R10A2,
>> +     TEGRA_IMAGE_FORMAT_T_R10G10B10A2,
>> +
>> +     TEGRA_IMAGE_FORMAT_T_A8Y8U8V8 =3D 193,
>> +     TEGRA_IMAGE_FORMAT_T_V8U8Y8A8,
>> +
>> +     TEGRA_IMAGE_FORMAT_T_A2Y10U10V10 =3D 197,
>> +     TEGRA_IMAGE_FORMAT_T_V10U10Y10A2,
>> +     TEGRA_IMAGE_FORMAT_T_Y8_U8__Y8_V8,
>> +     TEGRA_IMAGE_FORMAT_T_Y8_V8__Y8_U8,
>> +     TEGRA_IMAGE_FORMAT_T_U8_Y8__V8_Y8,
>> +     TEGRA_IMAGE_FORMAT_T_V8_Y8__U8_Y8,
>> +
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N444 =3D 224,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N444,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N444,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N422,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N422,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N422,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8__V8_N420,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__U8V8_N420,
>> +     TEGRA_IMAGE_FORMAT_T_Y8__V8U8_N420,
>> +     TEGRA_IMAGE_FORMAT_T_X2LC10LB10LA10,
>> +     TEGRA_IMAGE_FORMAT_T_A2R6R6R6R6R6,
>> +};
>> +
>> +static const struct tegra_video_format vi2_video_formats[] =3D {
>> +     /* RAW 8 */
>> +     TEGRA_VIDEO_FORMAT(RAW8, 8, SRGGB8_1X8, 1, 1, T_L8,
>> +                        RAW8, SRGGB8, "RGRG.. GBGB.."),
>> +     TEGRA_VIDEO_FORMAT(RAW8, 8, SGRBG8_1X8, 1, 1, T_L8,
>> +                        RAW8, SGRBG8, "GRGR.. BGBG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW8, 8, SGBRG8_1X8, 1, 1, T_L8,
>> +                        RAW8, SGBRG8, "GBGB.. RGRG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW8, 8, SBGGR8_1X8, 1, 1, T_L8,
>> +                        RAW8, SBGGR8, "BGBG.. GRGR.."),
>> +
>> +     /* RAW 10 */
>> +     TEGRA_VIDEO_FORMAT(RAW10, 10, SRGGB10_1X10, 2, 1, T_R16_I,
>> +                        RAW10, SRGGB10, "RGRG.. GBGB.."),
>> +     TEGRA_VIDEO_FORMAT(RAW10, 10, SGRBG10_1X10, 2, 1, T_R16_I,
>> +                        RAW10, SGRBG10, "GRGR.. BGBG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW10, 10, SGBRG10_1X10, 2, 1, T_R16_I,
>> +                        RAW10, SGBRG10, "GBGB.. RGRG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW10, 10, SBGGR10_1X10, 2, 1, T_R16_I,
>> +                        RAW10, SBGGR10, "BGBG.. GRGR.."),
>> +
>> +     /* RAW 12 */
>> +     TEGRA_VIDEO_FORMAT(RAW12, 12, SRGGB12_1X12, 2, 1, T_R16_I,
>> +                        RAW12, SRGGB12, "RGRG.. GBGB.."),
>> +     TEGRA_VIDEO_FORMAT(RAW12, 12, SGRBG12_1X12, 2, 1, T_R16_I,
>> +                        RAW12, SGRBG12, "GRGR.. BGBG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW12, 12, SGBRG12_1X12, 2, 1, T_R16_I,
>> +                        RAW12, SGBRG12, "GBGB.. RGRG.."),
>> +     TEGRA_VIDEO_FORMAT(RAW12, 12, SBGGR12_1X12, 2, 1, T_R16_I,
>> +                        RAW12, SBGGR12, "BGBG.. GRGR.."),
>> +
>> +     /* RGB888 */
>> +     TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X24, 4, 1, T_A8R8G8B8,
>> +                        RGB888, ABGR32, "BGRA-8-8-8-8"),
>> +     TEGRA_VIDEO_FORMAT(RGB888, 24, RGB888_1X32_PADHI, 4, 1, T_A8B8G8R8=
,
>> +                        RGB888, RGB32, "RGB-8-8-8-8"),
>> +
>> +     /* YUV422 */
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_1X16, 2, 1, T_U8_Y8__V8_Y8,
>> +                        YUV422_8, UYVY, "YUV 4:2:2"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, VYUY8_1X16, 2, 1, T_V8_Y8__U8_Y8,
>> +                        YUV422_8, VYUY, "YUV 4:2:2"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, YUYV8_1X16, 2, 1, T_Y8_U8__Y8_V8,
>> +                        YUV422_8, YUYV, "YUV 4:2:2"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, YVYU8_1X16, 2, 1, T_Y8_V8__Y8_U8,
>> +                        YUV422_8, YVYU, "YUV 4:2:2"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_1X16, 1, 1, T_Y8__V8U8_N422,
>> +                        YUV422_8, NV16, "NV16"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, UYVY8_2X8, 2, 1, T_U8_Y8__V8_Y8,
>> +                        YUV422_8, UYVY, "YUV 4:2:2 UYVY"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, VYUY8_2X8, 2, 1, T_V8_Y8__U8_Y8,
>> +                        YUV422_8, VYUY, "YUV 4:2:2 VYUY"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, YUYV8_2X8, 2, 1, T_Y8_U8__Y8_V8,
>> +                        YUV422_8, YUYV, "YUV 4:2:2 YUYV"),
>> +     TEGRA_VIDEO_FORMAT(YUV422, 16, YVYU8_2X8, 2, 1, T_Y8_V8__Y8_U8,
>> +                        YUV422_8, YVYU, "YUV 4:2:2 YVYU"),
>> +};
>> +#endif
>> diff --git a/drivers/staging/media/tegra/vi2_registers.h b/drivers/stagi=
ng/media/tegra/vi2_registers.h
>> new file mode 100644
>> index 000000000000..c54a6a3aa1c4
>> --- /dev/null
>> +++ b/drivers/staging/media/tegra/vi2_registers.h
>> @@ -0,0 +1,194 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#ifndef __REGISTERS_H__
>> +#define __REGISTERS_H__
>> +
>> +#define      TEGRA_CLOCK_VI_MAX                              793600000
>> +#define      TEGRA210_SURFACE_ALIGNMENT                      64
>> +#define TEGRA210_MAX_CHANNELS                                6
>> +
>> +/* Tegra210 VI registers */
>> +#define      TEGRA_VI_SYNCPT_WAIT_TIMEOUT                    200
>> +#define      TEGRA_VI_CFG_VI_INCR_SYNCPT                     0x000
>> +#define   VI_CFG_VI_INCR_SYNCPT_COND(x)                      (((x) & 0x=
ff) << 8)
>> +#define        VI_CSI_PP_LINE_START(port)                    (4 + (port=
) * 4)
>> +#define        VI_CSI_PP_FRAME_START(port)                   (5 + (port=
) * 4)
>> +#define        VI_CSI_MW_REQ_DONE(port)                      (6 + (port=
) * 4)
>> +#define        VI_CSI_MW_ACK_DONE(port)                      (7 + (port=
) * 4)
>> +
>> +#define      TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL               0x004
>> +#define        TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL          BIT(8)
>> +#define      TEGRA_VI_CFG_VI_INCR_SYNCPT_ERROR               0x008
>> +#define      TEGRA_VI_CFG_CTXSW                              0x020
>> +#define      TEGRA_VI_CFG_INTSTATUS                          0x024
>> +#define      TEGRA_VI_CFG_PWM_CONTROL                        0x038
>> +#define      TEGRA_VI_CFG_PWM_HIGH_PULSE                     0x03c
>> +#define      TEGRA_VI_CFG_PWM_LOW_PULSE                      0x040
>> +#define      TEGRA_VI_CFG_PWM_SELECT_PULSE_A                 0x044
>> +#define      TEGRA_VI_CFG_PWM_SELECT_PULSE_B                 0x048
>> +#define      TEGRA_VI_CFG_PWM_SELECT_PULSE_C                 0x04c
>> +#define      TEGRA_VI_CFG_PWM_SELECT_PULSE_D                 0x050
>> +#define      TEGRA_VI_CFG_VGP1                               0x064
>> +#define      TEGRA_VI_CFG_VGP2                               0x068
>> +#define      TEGRA_VI_CFG_VGP3                               0x06c
>> +#define      TEGRA_VI_CFG_VGP4                               0x070
>> +#define      TEGRA_VI_CFG_VGP5                               0x074
>> +#define      TEGRA_VI_CFG_VGP6                               0x078
>> +#define      TEGRA_VI_CFG_INTERRUPT_MASK                     0x08c
>> +#define      TEGRA_VI_CFG_INTERRUPT_TYPE_SELECT              0x090
>> +#define      TEGRA_VI_CFG_INTERRUPT_POLARITY_SELECT          0x094
>> +#define      TEGRA_VI_CFG_INTERRUPT_STATUS                   0x098
>> +#define      TEGRA_VI_CFG_VGP_SYNCPT_CONFIG                  0x0ac
>> +#define      TEGRA_VI_CFG_VI_SW_RESET                        0x0b4
>> +#define      TEGRA_VI_CFG_CG_CTRL                            0x0b8
>> +#define   VI_CG_2ND_LEVEL_EN                         0x1
>> +#define      TEGRA_VI_CFG_VI_MCCIF_FIFOCTRL                  0x0e4
>> +#define      TEGRA_VI_CFG_TIMEOUT_WCOAL_VI                   0x0e8
>> +#define      TEGRA_VI_CFG_DVFS                               0x0f0
>> +#define      TEGRA_VI_CFG_RESERVE                            0x0f4
>> +#define      TEGRA_VI_CFG_RESERVE_1                          0x0f8
>> +
>> +/* Tegra210 CSI registers */
>> +#define TEGRA_VI_CSI_SW_RESET                                0x000
>> +#define TEGRA_VI_CSI_SINGLE_SHOT                     0x004
>> +#define   SINGLE_SHOT_CAPTURE                                0x1
>> +#define TEGRA_VI_CSI_SINGLE_SHOT_STATE_UPDATE                0x008
>> +#define TEGRA_VI_CSI_IMAGE_DEF                               0x00c
>> +#define   BYPASS_PXL_TRANSFORM_OFFSET                        24
>> +#define   IMAGE_DEF_FORMAT_OFFSET                    16
>> +#define   IMAGE_DEF_DEST_MEM                         0x1
>> +#define TEGRA_VI_CSI_RGB2Y_CTRL                              0x010
>> +#define TEGRA_VI_CSI_MEM_TILING                              0x014
>> +#define TEGRA_VI_CSI_IMAGE_SIZE                              0x018
>> +#define   IMAGE_SIZE_HEIGHT_OFFSET                   16
>> +#define TEGRA_VI_CSI_IMAGE_SIZE_WC                   0x01c
>> +#define TEGRA_VI_CSI_IMAGE_DT                                0x020
>> +#define TEGRA_VI_CSI_SURFACE0_OFFSET_MSB             0x024
>> +#define TEGRA_VI_CSI_SURFACE0_OFFSET_LSB             0x028
>> +#define TEGRA_VI_CSI_SURFACE1_OFFSET_MSB             0x02c
>> +#define TEGRA_VI_CSI_SURFACE1_OFFSET_LSB             0x030
>> +#define TEGRA_VI_CSI_SURFACE2_OFFSET_MSB             0x034
>> +#define TEGRA_VI_CSI_SURFACE2_OFFSET_LSB             0x038
>> +#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_MSB          0x03c
>> +#define TEGRA_VI_CSI_SURFACE0_BF_OFFSET_LSB          0x040
>> +#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_MSB          0x044
>> +#define TEGRA_VI_CSI_SURFACE1_BF_OFFSET_LSB          0x048
>> +#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_MSB          0x04c
>> +#define TEGRA_VI_CSI_SURFACE2_BF_OFFSET_LSB          0x050
>> +#define TEGRA_VI_CSI_SURFACE0_STRIDE                 0x054
>> +#define TEGRA_VI_CSI_SURFACE1_STRIDE                 0x058
>> +#define TEGRA_VI_CSI_SURFACE2_STRIDE                 0x05c
>> +#define TEGRA_VI_CSI_SURFACE_HEIGHT0                 0x060
>> +#define TEGRA_VI_CSI_ISPINTF_CONFIG                  0x064
>> +#define TEGRA_VI_CSI_ERROR_STATUS                    0x084
>> +#define TEGRA_VI_CSI_ERROR_INT_MASK                  0x088
>> +#define TEGRA_VI_CSI_WD_CTRL                         0x08c
>> +#define TEGRA_VI_CSI_WD_PERIOD                               0x090
>> +
>> +/* Tegra210 CSI Pixel Parser registers: Starts from 0x838, offset 0x0 *=
/
>> +#define TEGRA_CSI_INPUT_STREAM_CONTROL                  0x000
>> +#define   CSI_SKIP_PACKET_THRESHOLD_OFFSET           16
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0                      0x004
>> +#define   CSI_PP_PACKET_HEADER_SENT                  (0x1 << 4)
> Maybe use the BIT() macro ?
>
> Regards,
> Helen
>
>> +#define   CSI_PP_DATA_IDENTIFIER_ENABLE                      (0x1 << 5)
>> +#define   CSI_PP_WORD_COUNT_SELECT_HEADER            (0x1 << 6)
>> +#define   CSI_PP_CRC_CHECK_ENABLE                    (0x1 << 7)
>> +#define   CSI_PP_WC_CHECK                            (0x1 << 8)
>> +#define   CSI_PP_OUTPUT_FORMAT_STORE                 (0x3 << 16)
>> +#define   CSI_PP_HEADER_EC_DISABLE                   (0x1 << 27)
>> +#define   CSI_PPA_PAD_FRAME_NOPAD                    (0x2 << 28)
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1                 0x008
>> +#define   CSI_PP_TOP_FIELD_FRAME_OFFSET                      0
>> +#define   CSI_PP_TOP_FIELD_FRAME_MASK_OFFSET         4
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_GAP                      0x00c
>> +#define   PP_FRAME_MIN_GAP_OFFSET                    16
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND               0x010
>> +#define   CSI_PP_ENABLE                                      0x1
>> +#define   CSI_PP_DISABLE                             0x2
>> +#define   CSI_PP_RST                                 0x3
>> +#define   CSI_PP_SINGLE_SHOT_ENABLE                  (0x1 << 2)
>> +#define   CSI_PP_START_MARKER_FRAME_MAX_OFFSET               12
>> +
>> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME           0x014
>> +#define TEGRA_CSI_PIXEL_PARSER_INTERRUPT_MASK           0x018
>> +#define TEGRA_CSI_PIXEL_PARSER_STATUS                   0x01c
>> +#define TEGRA_CSI_CSI_SW_SENSOR_RESET                   0x020
>> +
>> +/* Tegra210 CSI PHY registers */
>> +/* CSI_PHY_CIL_COMMAND_0 offset 0x0d0 from TEGRA_CSI_PIXEL_PARSER_0_BAS=
E */
>> +#define TEGRA_CSI_PHY_CIL_COMMAND                       0x0d0
>> +#define   CSI_A_PHY_CIL_NOP                          0x0
>> +#define   CSI_A_PHY_CIL_ENABLE                               0x1
>> +#define   CSI_A_PHY_CIL_DISABLE                              0x2
>> +#define   CSI_A_PHY_CIL_ENABLE_MASK                  0x3
>> +#define   CSI_B_PHY_CIL_NOP                          (0x0 << 8)
>> +#define   CSI_B_PHY_CIL_ENABLE                               (0x1 << 8)
>> +#define   CSI_B_PHY_CIL_DISABLE                              (0x2 << 8)
>> +#define   CSI_B_PHY_CIL_ENABLE_MASK                  (0x3 << 8)
>> +
>> +#define TEGRA_CSI_CIL_PAD_CONFIG0                       0x000
>> +#define   BRICK_CLOCK_A_4X                           (0x1 << 16)
>> +#define   BRICK_CLOCK_B_4X                           (0x2 << 16)
>> +#define TEGRA_CSI_CIL_PAD_CONFIG1                       0x004
>> +#define TEGRA_CSI_CIL_PHY_CONTROL                       0x008
>> +#define TEGRA_CSI_CIL_INTERRUPT_MASK                    0x00c
>> +#define TEGRA_CSI_CIL_STATUS                            0x010
>> +#define TEGRA_CSI_CILX_STATUS                           0x014
>> +#define TEGRA_CSI_CIL_ESCAPE_MODE_COMMAND               0x018
>> +#define TEGRA_CSI_CIL_ESCAPE_MODE_DATA                  0x01c
>> +#define TEGRA_CSI_CIL_SW_SENSOR_RESET                   0x020
>> +
>> +#define TEGRA_CSI_PATTERN_GENERATOR_CTRL             0x000
>> +#define   PG_MODE_OFFSET                             2
>> +#define   PG_ENABLE                                  0x1
>> +#define   PG_DISABLE                                 0x0
>> +
>> +#define PG_VBLANK_OFFSET                             16
>> +#define TEGRA_CSI_PG_BLANK                           0x004
>> +#define TEGRA_CSI_PG_PHASE                           0x008
>> +#define TEGRA_CSI_PG_RED_FREQ                                0x00c
>> +#define   PG_RED_VERT_INIT_FREQ_OFFSET                       16
>> +#define   PG_RED_HOR_INIT_FREQ_OFFSET                        0
>> +
>> +#define TEGRA_CSI_PG_RED_FREQ_RATE                   0x010
>> +#define TEGRA_CSI_PG_GREEN_FREQ                              0x014
>> +#define   PG_GREEN_VERT_INIT_FREQ_OFFSET             16
>> +#define   PG_GREEN_HOR_INIT_FREQ_OFFSET                      0
>> +
>> +#define TEGRA_CSI_PG_GREEN_FREQ_RATE                 0x018
>> +#define TEGRA_CSI_PG_BLUE_FREQ                               0x01c
>> +#define   PG_BLUE_VERT_INIT_FREQ_OFFSET                      16
>> +#define   PG_BLUE_HOR_INIT_FREQ_OFFSET                       0
>> +
>> +#define TEGRA_CSI_PG_BLUE_FREQ_RATE                  0x020
>> +#define TEGRA_CSI_PG_AOHDR                           0x024
>> +
>> +#define TEGRA_CSI_DPCM_CTRL_A                                0xa2c
>> +#define TEGRA_CSI_DPCM_CTRL_B                                0xa30
>> +
>> +/* Other CSI registers: Starts from 0xa44, offset 0x20c */
>> +#define TEGRA_CSI_STALL_COUNTER                              0x20c
>> +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x210
>> +#define TEGRA_CSI_CSI_SW_STATUS_RESET                        0x214
>> +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x218
>> +#define TEGRA_CSI_DEBUG_CONTROL                              0x21c
>> +#define TEGRA_CSI_DEBUG_COUNTER_0                    0x220
>> +#define TEGRA_CSI_DEBUG_COUNTER_1                    0x224
>> +#define TEGRA_CSI_DEBUG_COUNTER_2                    0x228
>> +
>> +/* Tegra210 CSI Pixel Parser registers */
>> +#define TEGRA_CSI_PIXEL_PARSER_0_BASE                        0x0838
>> +#define TEGRA_CSI_PIXEL_PARSER_1_BASE                        0x086c
>> +#define TEGRA_CSI_PIXEL_PARSER_2_BASE                        0x1038
>> +#define TEGRA_CSI_PIXEL_PARSER_3_BASE                        0x106c
>> +#define TEGRA_CSI_PIXEL_PARSER_4_BASE                        0x1838
>> +#define TEGRA_CSI_PIXEL_PARSER_5_BASE                        0x186c
>> +
>> +#endif
>>
