Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207BE4BE658
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Feb 2022 19:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343809AbiBUKii (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Feb 2022 05:38:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355245AbiBUKiX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Feb 2022 05:38:23 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F338545538
        for <linux-tegra@vger.kernel.org>; Mon, 21 Feb 2022 02:00:06 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 388E158025E;
        Mon, 21 Feb 2022 04:59:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 21 Feb 2022 04:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=77RGyVA/YjrqNFdg/LAOBetIJ60fLt
        bQq6xYKSdv5R4=; b=nDqBfvUmbD70CmOwRlMHpnPcZIA/GmNXJ1d/K4MyLhZ2s/
        e6nkPkYV/gzHy/Tsdmh2h2vk5gcx241jV85N1K2qiSxAfBOsR3eQraUD/lNq3GMR
        t9Fi16cN3PFt9bym5f6/L6XVbKfcQ7XVVpelo3JpAi+4Z+ZJSCK43da7NMsCAZyp
        i/LtlwmM7UJfGDulKvJPG7PYOD67pBpKyN25d7FNnqcbI008i7dUM8Rhrir9gvNi
        vQx7YZFDcEKRK4Ld2CcGMQ6dR2B99UvvLqj0E/4fvre2rjoZmYXxLloCdY+BYhRU
        N4pXdosoR3nkIw+hulKGe0eZOHv/rwCrqCuFfkag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=77RGyV
        A/YjrqNFdg/LAOBetIJ60fLtbQq6xYKSdv5R4=; b=fpIzDchz6f2eXpnnx7WKzV
        MY2FtkW3TZPHwxnF0Ooas0btfRGAIlH60rYYtO+FNZF575y1CQpkWSo5cwsHVAHp
        8LVE+F6cvEdf0WaFlxy9ZgEIv+gKhm6ikhs1CxlR7Z70Wvbfqa6an2GBwQZQP/IH
        kGCt/0XBHLng0r8z5+r2uWahIzwOd2v10nzz9tD3klvOeVnT7qecaHITq7yjGAAS
        OfyDCXO1u1hx2O4JT7UksZABCyutr6C8+Hkoc84EEOhoiRFVHpBXoD41btyjyRwI
        dtYEUcQOyx/4MtHty9ZxmxS6d8pMMDxsuYPTXDfv67IehZdXrx/M9Co0T2FH37xw
        ==
X-ME-Sender: <xms:jGITYnGWaqhLU1NSUxUJOVJI6Uc_y30jfNN_Z2Ubd_tWayDYtm22cw>
    <xme:jGITYkWwrW6XJNhs0gJTsjs2CyJ1ZwFd5DfBaIX5wgVjmr19RVi8WjWKU1hnB1xnZ
    lISUjQ9sL_KShGVAjQ>
X-ME-Received: <xmr:jGITYpJjTnk0mUKEtpg-9wXIBSRAyIjy1uHDGvgiCkQaId6DoVCXgzvhqvlBwm5ZyHLGcyKIUuV0Ifs4u9sHYLUDJMpq6SBetN-xSl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jGITYlH9UL-u8T7ULExwvV0FdDpH2PrN4P0NmPIcTg6BghrQA5OP3g>
    <xmx:jGITYtVlAjrM5pj8dNEceCtBdwAHlLgH4OCXLPAqF7Ymes4aULSDZw>
    <xmx:jGITYgNWxfFKcimvHoJMsqo4_yU5b4lnJlk8cQ2WH2ruNydHQNZbEw>
    <xmx:jGITYoPvuEVBlzikJWLpZeUdth2-mlm7VUleIIl6RcoZ4wgvCOJ-Mg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:39 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 08/22] drm/tegra: plane: Remove redundant zpos initialisation
Date:   Mon, 21 Feb 2022 10:59:04 +0100
Message-Id: <20220221095918.18763-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The tegra KMS driver will call drm_plane_create_zpos_property() with an
init value of the plane index.

Since the initial value wasn't carried over in the state, the driver had
to set it again in tegra_plane_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/plane.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index ec0822c86926..a00913d064d3 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -25,7 +25,6 @@ static void tegra_plane_destroy(struct drm_plane *plane)
 
 static void tegra_plane_reset(struct drm_plane *plane)
 {
-	struct tegra_plane *p = to_tegra_plane(plane);
 	struct tegra_plane_state *state;
 	unsigned int i;
 
@@ -38,8 +37,6 @@ static void tegra_plane_reset(struct drm_plane *plane)
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state) {
 		__drm_atomic_helper_plane_reset(plane, &state->base);
-		plane->state->zpos = p->index;
-		plane->state->normalized_zpos = p->index;
 
 		for (i = 0; i < 3; i++)
 			state->iova[i] = DMA_MAPPING_ERROR;
-- 
2.35.1

