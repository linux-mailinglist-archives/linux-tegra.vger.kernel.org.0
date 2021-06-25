Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809283B3EB2
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Jun 2021 10:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhFYIZL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Jun 2021 04:25:11 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35422 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhFYIZK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 04:25:10 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 976F11FE51;
        Fri, 25 Jun 2021 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5YG9pSeazw2V8PInyaqALDObYkhkZqmd0bn3CypZOY=;
        b=vYRyjCghBdIH1eFGDPjSik02T1m1t4UZGaX31vNbNHPkrgBtqitc94f210uyLZR+8bI4aN
        GnSybbR3JuCR6nQEHKSdojbO+NrHEDqVEt3uJbZCzqP3wkNyJtWDRyJv3768X5btEOftlU
        g4b/SSVb1/v+yXuvHlUMs7dcQAMfV+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609369;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5YG9pSeazw2V8PInyaqALDObYkhkZqmd0bn3CypZOY=;
        b=6/9G6mU7nbG+kzsM4AO0VNJBC62CFUiK2IvgHNPVZmFrN3C1Xf+T4hP7h4RR1DB3FGLR3f
        tTnAVI+/xGtH0FAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 68E3D11C9B;
        Fri, 25 Jun 2021 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5YG9pSeazw2V8PInyaqALDObYkhkZqmd0bn3CypZOY=;
        b=vYRyjCghBdIH1eFGDPjSik02T1m1t4UZGaX31vNbNHPkrgBtqitc94f210uyLZR+8bI4aN
        GnSybbR3JuCR6nQEHKSdojbO+NrHEDqVEt3uJbZCzqP3wkNyJtWDRyJv3768X5btEOftlU
        g4b/SSVb1/v+yXuvHlUMs7dcQAMfV+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609369;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S5YG9pSeazw2V8PInyaqALDObYkhkZqmd0bn3CypZOY=;
        b=6/9G6mU7nbG+kzsM4AO0VNJBC62CFUiK2IvgHNPVZmFrN3C1Xf+T4hP7h4RR1DB3FGLR3f
        tTnAVI+/xGtH0FAA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id KPvDGFiS1WAISwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:48 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, liviu.dudau@arm.com,
        mihail.atanassov@arm.com, brian.starkey@arm.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, yannick.fertre@foss.st.com,
        philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, wens@csie.org,
        jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, jani.nikula@linux.intel.com,
        rodrigo.vivi@intel.com, linux@armlinux.org.uk,
        kieran.bingham+renesas@ideasonboard.com,
        rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
        hamohammed.sa@gmail.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <treding@nvidia.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 21/27] drm/tegra: Don't set struct drm_device.irq_enabled
Date:   Fri, 25 Jun 2021 10:22:16 +0200
Message-Id: <20210625082222.3845-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in tegra.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/tegra/drm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index f96c237b2242..8d27c21ddf48 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1188,13 +1188,6 @@ static int host1x_drm_probe(struct host1x_device *dev)
 			goto device;
 	}
 
-	/*
-	 * We don't use the drm_irq_install() helpers provided by the DRM
-	 * core, so we need to set this manually in order to allow the
-	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
-	 */
-	drm->irq_enabled = true;
-
 	/* syncpoints are used for full 32-bit hardware VBLANK counters */
 	drm->max_vblank_count = 0xffffffff;
 
-- 
2.32.0

