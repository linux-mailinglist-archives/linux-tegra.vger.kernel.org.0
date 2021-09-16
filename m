Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F6D40DD51
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Sep 2021 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhIPO4w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Sep 2021 10:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238912AbhIPO4u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 10:56:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DE1C061574;
        Thu, 16 Sep 2021 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=99oyZIoK1MF8/+Oy05mVia9zXGHhbSdgwWu9JbcLFDg=; b=CYjuDsKRwX8SLxdLNaXwChXGRv
        s0tvaspE7A3T+D++wVX7okqks+lknrcV0VzxqJ6DBYsAbnQY+Ai0c1oexXMDBaslMQq0aofyAKjtv
        23xzWgpPxBlBT90/i3RaIqKJhK6MeHWpi41OMOtEquyo+vFSphXj20lZJ4cfodte6ANp6ucZwyFAs
        u/kXg2VUEBFpb/DhfTZI+SNKmYe6hehj1LV+R906oPNyZ9dIWMKdBkREdVfXhAWfNPSdIdwZDT7f5
        WESTz3+nVqJNYJXalvts33qCPE7n0OBwrhpPLMcI68RvWoNg+kvrWS7+Nnkrhyq7Xt0HezNjoV5E7
        Tf3Rxg5g==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mQsnM-0002zq-4m; Thu, 16 Sep 2021 17:55:24 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 0/3] NVIDIA Tegra NVDEC support
Date:   Thu, 16 Sep 2021 17:55:14 +0300
Message-Id: <20210916145517.2047351-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Here's the v6 of the NVDEC support series, containing the
following changes:

* Minor changes to device tree bindings. See patch for details.

NVDEC hardware documentation can be found at
https://github.com/NVIDIA/open-gpu-doc/tree/master/classes/video

and example userspace can be found at
https://github.com/cyndis/vaapi-tegra-driver

Thanks,
Mikko

Mikko Perttunen (3):
  dt-bindings: Add YAML bindings for NVDEC
  arm64: tegra: Add NVDEC to Tegra186/194 device trees
  drm/tegra: Add NVDEC driver

 .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  38 ++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   4 +
 drivers/gpu/drm/tegra/drm.h                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 464 ++++++++++++++++++
 drivers/gpu/host1x/dev.c                      |  18 +
 include/linux/host1x.h                        |   2 +
 10 files changed, 654 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

-- 
2.32.0

