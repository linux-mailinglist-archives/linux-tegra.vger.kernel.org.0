Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4044BDFB8
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Feb 2022 18:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354893AbiBUKiS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Feb 2022 05:38:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354368AbiBUKh4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Feb 2022 05:37:56 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E942542EEE
        for <linux-tegra@vger.kernel.org>; Mon, 21 Feb 2022 01:59:43 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0196F58025B;
        Mon, 21 Feb 2022 04:59:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 21 Feb 2022 04:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=e6fsAJHMFdp2g1HWcSV/TmUkgSAzo/
        AUvrgSfJ4rv1s=; b=NO8qhAad/yFGngJeBnbhhlobysqMgdJc/mXevNn82T+oyN
        Y8G8Bx6aQuZd461qr4zXL97R5tw0LRHIhC6PKamsahP4w4wTFegknyILwBRqELN9
        czGxU1YW0AMDdnK9FPK0apA2BnPq4fQ934DfusuUUmr64SRFyWGbwwE4TPrEU+dv
        rWxnU4h9cCA5MoWzg9/Iceys0nzhBEnb6uQqQyuzOzoClLRWmjspWRnzSlh4Kyn4
        b2C3za6hUTi4ZPwQSyhjl/Sv7t9NR8vyBUQoGygnRO1Yzt/zXKTGxtM04QOy1/iP
        luwG0avsrabzQ/5q5LCxwl56NNaheTC+4DtcKyog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e6fsAJ
        HMFdp2g1HWcSV/TmUkgSAzo/AUvrgSfJ4rv1s=; b=oZrXE7TBpmix+rJ0QpZUeH
        mS/QooOdEd2+V4DNGBbx2T5Se38We19zthFx7S1WGAqdtaQaTrmUI/XFDe9nnkT2
        dhQnXvopgTFSTfSVnQIIQkZUPFdv/zbQZDnO5xrICXjgDDYLu9IN/1nzRB5/rZh1
        E2nnjdCMKqvkHa6D1CM8EmKz9vHV+k1DmpWceXqaW0tKewwn3qaYK/ec2viclLGu
        2AkxoFtr+cfar16Ud/f1/COswkX3jvci0Xx70dDxzyy15sCOH4KG5PcaYdQbuTH1
        XvK/FlxZvH78TZlaOY/N7ZFArGXUFfyscrUSlZZuHgAxW3svnkUTrkoftzoHOYuw
        ==
X-ME-Sender: <xms:gWITYo_msLTsKcstqoSoMa-ItS5NnxIBUDXOAMBjpkBTRjMly0K-bA>
    <xme:gWITYgvBQLTZ0ljpYCURYo0Lh-1oHIkX5tYJQGZ68iWGH9R2UkXxh_d7TPCKxZRc-
    F7DiY5VazkpaY8w_fI>
X-ME-Received: <xmr:gWITYuBrhmTAV3wg8mu6HsHcmRopuLrUqovWKvTW3Jy7aprX4p4QcLbp9rAn7ReESj9Yr8KTMHqGUK2Veih-VA41L9GiVUNaCHJIYfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gWITYoeaionaQ9olD2f3Tdl5vrPvoI6KisMRQa4ia6jSVm--ttS-WQ>
    <xmx:gWITYtPZkNkedKj9W7CafDVSROp6P331QiIC7VK47ZU4cwj_hoWYdQ>
    <xmx:gWITYintyg95yJSHV1-h2uyvLaLqHSUPY0drx-JObjZxUI4Ujs9G2w>
    <xmx:gWITYimciq0bYWapIiVEoHwcCWA_LWRGfcz7ZPgxlB1A0i8bNgQRWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:29 -0500 (EST)
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
Subject: [PATCH v2 03/22] drm/tegra: hub: Fix zpos initial value mismatch
Date:   Mon, 21 Feb 2022 10:58:59 +0100
Message-Id: <20220221095918.18763-4-maxime@cerno.tech>
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

While the tegra_shared_plane_create() function calls
drm_plane_create_zpos_property() with an initial value of 0,
tegra_plane_reset() will force it to the plane index.

Fix the discrepancy by setting the initial zpos value to the plane index
in the function call.

Cc: linux-tegra@vger.kernel.org
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b910155f80c4..7f68a142d922 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -788,7 +788,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 	}
 
 	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
-	drm_plane_create_zpos_property(p, 0, 0, 255);
+	drm_plane_create_zpos_property(p, index, 0, 255);
 
 	return p;
 }
-- 
2.35.1

