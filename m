Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC80B63ADAD
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Nov 2022 17:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232637AbiK1Q3h (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Nov 2022 11:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbiK1Q3g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 11:29:36 -0500
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12DD2098F;
        Mon, 28 Nov 2022 08:29:34 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id A5D9C600C80C;
        Mon, 28 Nov 2022 16:29:32 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id J2fqvRtdZJwH; Mon, 28 Nov 2022 16:29:29 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5415D6008839;
        Mon, 28 Nov 2022 16:29:28 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1669652968;
        bh=db/Y5kLR1fnMZqSfN2ssqMxjqhgoeKL+QD8qUjHVlMI=;
        h=From:To:Cc:Subject:Date;
        b=bUOa+oKYD6vrPO/k34r7G0FCk6Sp4erYL/mG/FnpJbL/i5d4cPIWq4Q0+06zjuwms
         1d4Witoinm+0Yakxzcpv/chUKo3msZqkkh3a+f3KXyLfMIdW8xprTLOyaZc/JY6ZA2
         STP73WQEaFs4SKbOZNFZzSlQlDZg02/oSlkolj4k=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 56DFB360073;
        Mon, 28 Nov 2022 16:29:26 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 RESEND 0/4] Add JDI LPM102A188A display panel support 
Date:   Mon, 28 Nov 2022 16:28:48 +0000
Message-Id: <20221128162851.110611-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

These patches add support for the JDI LPM102A188A display panel,
found in the Google Pixel C.

Patch 1 adds the DT bindings for the panel (omitted in RESEND).

Patch 2 adds a register clear to the Tegra DSI driver, needed for the
panel initialization commands to be properly sent.

Patch 3 adds the panel driver, which is based on the downstream
kernel driver published by Google and developed by Sean Paul.

Patch 4 adds the DT node for the Google Pixel C. 

The first version of this patch series can be found at:
https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt/

The first submission of v2 can be found at:
https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt/

Changes in v2:
 - Patch 1: remove touchscreen reset gpio property
 - Patch 2: clear register based on its value rather than a DT property
 - Patch 3: tune backlight delay values
 - Patch 4: add generic node names, remove underscores

Thank you.

Diogo Ivo (4):

  dt-bindings: display: Add bindings for JDI LPM102A188A
  drm/tegra: dsi: Clear enable register if powered by bootloader
  drm/panel: Add driver for JDI LPM102A188A
  arm64: dts: smaug: Add display panel node

 .../display/panel/jdi,lpm102a188a.yaml        |  94 ++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  70 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 509 ++++++++++++++++++
 drivers/gpu/drm/tegra/dsi.c                   |   9 +
 6 files changed, 694 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c

-- 
2.38.1

