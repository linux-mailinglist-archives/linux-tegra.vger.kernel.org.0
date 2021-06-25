Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FA43B3E82
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Jun 2021 10:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhFYIY4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Jun 2021 04:24:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34638 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhFYIYx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Jun 2021 04:24:53 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D4AEE1FE58;
        Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIoR8k25GF7VaR2tG0nmFFOmiPd5XeM0gzGOMsyvAdg=;
        b=pVZgnimgLTw7mtDt31EUk+XCVm1PdYbNxvlSPeIH+7jDmxUpy/Q7x5sxLRBYNjSfSCSMqu
        xJVuVfVVpu4nvEo4uLzFm50XX9+sPkoJV6jpVzEIAUmEfF71+80YbPyINuRTsUdNYJHZzf
        eug5F0ypDVwxdPB5CwtuEHiKkIGiS7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609352;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIoR8k25GF7VaR2tG0nmFFOmiPd5XeM0gzGOMsyvAdg=;
        b=B+MuK9NwrevQHmneOwv6kMVSGGoQmX+t2FWjYcbF8LQbnjxWqt2ebyRnsuq1jbmkeIfcHI
        i1pQzgLoode9U1CQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id B181F11C9B;
        Fri, 25 Jun 2021 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624609352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIoR8k25GF7VaR2tG0nmFFOmiPd5XeM0gzGOMsyvAdg=;
        b=pVZgnimgLTw7mtDt31EUk+XCVm1PdYbNxvlSPeIH+7jDmxUpy/Q7x5sxLRBYNjSfSCSMqu
        xJVuVfVVpu4nvEo4uLzFm50XX9+sPkoJV6jpVzEIAUmEfF71+80YbPyINuRTsUdNYJHZzf
        eug5F0ypDVwxdPB5CwtuEHiKkIGiS7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624609352;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIoR8k25GF7VaR2tG0nmFFOmiPd5XeM0gzGOMsyvAdg=;
        b=B+MuK9NwrevQHmneOwv6kMVSGGoQmX+t2FWjYcbF8LQbnjxWqt2ebyRnsuq1jbmkeIfcHI
        i1pQzgLoode9U1CQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id sEs5KkeS1WAISwAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:31 +0000
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
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v4 07/27] drm/komeda: Don't set struct drm_device.irq_enabled
Date:   Fri, 25 Jun 2021 10:22:02 +0200
Message-Id: <20210625082222.3845-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The field drm_device.irq_enabled is only used by legacy drivers
with userspace modesetting. Don't set it in komeda.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index ff45f23f3d56..52a6db5707a3 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -301,8 +301,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 	if (err)
 		goto free_component_binding;
 
-	drm->irq_enabled = true;
-
 	drm_kms_helper_poll_init(drm);
 
 	err = drm_dev_register(drm, 0);
@@ -313,7 +311,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 
 free_interrupts:
 	drm_kms_helper_poll_fini(drm);
-	drm->irq_enabled = false;
 free_component_binding:
 	component_unbind_all(mdev->dev, drm);
 cleanup_mode_config:
@@ -331,7 +328,6 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-	drm->irq_enabled = false;
 	component_unbind_all(mdev->dev, drm);
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
-- 
2.32.0

