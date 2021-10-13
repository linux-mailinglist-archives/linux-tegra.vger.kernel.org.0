Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E36D42CB91
	for <lists+linux-tegra@lfdr.de>; Wed, 13 Oct 2021 22:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhJMUvZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 13 Oct 2021 16:51:25 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:42047 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230054AbhJMUvS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Oct 2021 16:51:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0EF67581176;
        Wed, 13 Oct 2021 16:49:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 13 Oct 2021 16:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=AY7Rab3gEcTjh
        Ev01MQj9r/3cj4oj/2qbKLAhJHhaA8=; b=LGdn4qkrLxxrUgJe7x1nyrfBOpd8u
        sO2pc3ISrYGWoq5kkR7VQrg2BSIbFUfPz6vhHvQpuJj5iJU/4mISNDDrcnEvCIqx
        sYWrAXdbCKUI1HRlmVfJODowd5sgl4o5l8FJXZ1CQ8VsW1dlkYHqtz9F0IYcjRjR
        D1swZcO9V1dUSmmGZyhxwo1pEbxUKBzLlBTTBZzfFqSh2wWnDcPhTEJFBBxp4sLN
        xrDoe+nC3u6C1/bwlOyqddzlleIQPJPtKGoPq8wec8ifvrIYWJUJnEIPLRGQ+qsq
        pyisnCgISZ/VlnsZS4H7G/cArh6BO5MAGqN9bNl7AhQGWEQL+F3ocR2jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=AY7Rab3gEcTjhEv01MQj9r/3cj4oj/2qbKLAhJHhaA8=; b=nowGajSW
        4Mf3XQTJ325xdroRulIP/q1Q13Xz739VfQxGCkvlHRd0+fNifkS27dGYC2qcklLu
        ohHeMjwfUXARgloosymQ0vvk62Q7IJGOpd4BGvETtq2XHNIAfoqizh0VBbuHRdWc
        jlRwNYxkqMJcoCxintd2LoON8G57es2XxVLH3BCw0uOEHy3RulNdfz9AxItpcXDN
        lKwFXYV5tBrr7r8kk+QiHDRbevV+X9g5mDYHaL7HKK7FKdtO5+lR8JoswzKVOxkf
        6q6HggtAWXEU8fuBPoYyiKAvsfxXuuJHaYiQIeFWSG5V+t/M5MlsptVsS7mdVez9
        RMSj/ji4uO2XQA==
X-ME-Sender: <xms:SUZnYciywXgTwblkqdl2IjRrumleTCfYrxhd7wZgoGNihytf2FAoPg>
    <xme:SUZnYVDrbvm82iqcuoffzb0OWYLaocHjJ2QrXCj1oYMATimsPb9akpuf2ke4SSA6J
    D281lazz-Cosk_F7Q>
X-ME-Received: <xmr:SUZnYUFpxCBkLMRRq1-LErkiVWLobITucdrgD970d-q5UDdhDW9n8N8CDSmLWkO6ctMT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedvnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:SUZnYdSiABWPYuHca74MwB6Z-244OPfn7SAW9LCHrl2OPpLf9r3p4w>
    <xmx:SUZnYZyQQ7NCpIoUyrvP2X6qCbf50aX3rs5iXD0NvFADJ-MKbl0UXw>
    <xmx:SUZnYb5WZyDzpwJykrdhnEPyKaqcfId9RNZvYuyDNDnKmh9EJoeKEQ>
    <xmx:SkZnYZcglLuICPHjX0gh3Xx5RPsjYOMrdSpGanUt0RCvF1lqW8BMAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:11 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 07/20] drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Wed, 13 Oct 2021 22:48:33 +0200
Message-Id: <20211013204846.90026-8-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
Reviewed-by: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 80078a9fd7f6..1877feff2e6b 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -156,10 +156,12 @@ static int shmob_drm_pm_suspend(struct device *dev)
 static int shmob_drm_pm_resume(struct device *dev)
 {
 	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
+	struct drm_modeset_acquire_ctx ctx;
+	int ret;
 
-	drm_modeset_lock_all(sdev->ddev);
+	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
 	shmob_drm_crtc_resume(&sdev->crtc);
-	drm_modeset_unlock_all(sdev->ddev);
+	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
 
 	drm_kms_helper_poll_enable(sdev->ddev);
 	return 0;
-- 
2.33.0

