Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B331F3C6C
	for <lists+linux-tegra@lfdr.de>; Tue,  9 Jun 2020 15:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbgFIN3N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 9 Jun 2020 09:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728601AbgFIN3M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Jun 2020 09:29:12 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EC8C05BD1E;
        Tue,  9 Jun 2020 06:29:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a9so21493930ljn.6;
        Tue, 09 Jun 2020 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PEfZn3c2yRr9PZgqQYrvPOR6TZg49oFLjkzjjmco2CU=;
        b=gMocHyoKbY8s3KY27r/gPM7ahRjfJrWrlIefv9GwfFiwBgAnkSrD/Y4ClxdrCE400x
         UHe1t2ukajZYmYdtutOirwXUqI0Rcy7wNeL52GtJ8aHMqKNgv7qyD9Aikh+c1uzdUWxQ
         MoFkYBej2u+ic66AKCXOMoI/7qKJTLMZROFA/BywCV3Yjpj36B+Y8xgbbMOqYWuRH7hd
         a7djhOaFRAX51tKSBx7O0fA8gEbxWuG9v+vhg3M72Haxe59+yc6db2Iqhv8FO9A86zyl
         YxF5j9m91kCnLqw5cfhY6TF/mHQoWpSCS2XxH5laV1g12EuD2cZOIfUADWXWRCMiQPse
         eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PEfZn3c2yRr9PZgqQYrvPOR6TZg49oFLjkzjjmco2CU=;
        b=IK6jmI+keQlrg5lCcR6cW2yIcHjqMbepAVk0werY4PDnF4x4OdHfTVK4Tw7rcEB+ng
         Xau4hUPURaSZFu96chJWaNxMljgIyq83JuaqYZbdYCY08mvWuSnLvOr0oOgU2yCKCGRH
         WjsA6t0w+JzBgGgZW+ctw0T7L9zrQ6Pk3zz24vb0gE5l4eZGxi7WPfLUFesIQ4UhSxHV
         glMv4L76RObnFUmlt4EDabkTZIXfz5VPFJS+7J5WdhzNm454Wz5vZ/TxQ0nBllXz2rBz
         s746010k1VFT68eN4PAQTzcmwNC+ewOOrPOVX8yogwPAagbcDWVUkUkITcUP+vkKh3qo
         f3Kw==
X-Gm-Message-State: AOAM5323bkDlz6PyHP+BQiUSr8CvDKF4Wwx3UdS2iazaoE6SVK03sq9k
        B15IsuMMG50ZXY7C88tmM7Ov9N7k
X-Google-Smtp-Source: ABdhPJw3wFI4gGl66N5VYIG7NFbTVA2131x8iYMK5UmoPdVFPxobMJSK4oDOHxkg2HOX0YKr7qBWOQ==
X-Received: by 2002:a2e:9996:: with SMTP id w22mr687084lji.253.1591709350714;
        Tue, 09 Jun 2020 06:29:10 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id s8sm5069821lfc.83.2020.06.09.06.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:29:10 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/6] Support DRM bridges on NVIDIA Tegra
Date:   Tue,  9 Jun 2020 16:28:49 +0300
Message-Id: <20200609132855.20975-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v6: - Added r-b and acks from Rob Herring and Sam Ravnborg.

    - Rebased on a recent linux-next, patches now apply without fuzz.

v5: - Added new patches that make drm_of_find_panel_or_bridge() more usable
      if graph isn't defined in a device-tree:

        of_graph: add of_graph_get_local_port()
        drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

    - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bridge()
      directly and added WARN_ON(output->panel || output->bridge) sanity-check.

    - Added new "Wrap directly-connected panel into DRM bridge" patch, as
      was suggested by Laurent Pinchart.

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (6):
  of_graph: add of_graph_get_local_port()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

 drivers/gpu/drm/drm_of.c       | 13 +++++-
 drivers/gpu/drm/tegra/drm.h    |  2 +
 drivers/gpu/drm/tegra/output.c | 21 +++++++--
 drivers/gpu/drm/tegra/rgb.c    | 85 +++++++++++++++++++++-------------
 drivers/of/property.c          | 32 +++++++++----
 include/linux/of_graph.h       |  7 +++
 6 files changed, 114 insertions(+), 46 deletions(-)

-- 
2.26.0

