Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3E44C3CD1
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Feb 2022 04:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiBYD4q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Feb 2022 22:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiBYD4q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 22:56:46 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11194E3395
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 19:56:15 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id p17so3704944plo.9
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 19:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EL9VRrPBu3az25e2ybIauwEmEdCvI/qWzhGi/e6E5Y=;
        b=jcSFxySYSYdj4BZD63nO0EbhxamC376oNbineqS36uKRwh9Buzq62WyKxAtoxOeaav
         9v1jABoix2QKwwyzDytesOlugbsEVZLu8HuKgUwGjeMAQqUZPOSZV8sv5iCDzLUFHa2f
         nbj7QUigSrMOqlhNT0263Oq4BoU39MfL89xLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9EL9VRrPBu3az25e2ybIauwEmEdCvI/qWzhGi/e6E5Y=;
        b=7leMPFvKU5/9hYGJyX0bIyW4Z5ZyfY6lk4/eOMiMSkwYnp2ZBW2dLJ+MTUxiI1zmD4
         3xV1a7lS/Jv/KVoA764PicWs4ET+n+LlhxoXjr9kJx9DDxbV7d2YvSNMC+VcyTDHboEu
         05lZgwcXWkYvDWUdgoQ4xWVi4jyV/5Ob59FuzwjK3OUjtqDF8Jhlr2YBQfZ4Cq1uGbib
         htIShBC17baUmXh7fbdQtlrhRumCwB0NIHUJmm1lclzHEz5QK/qh5EJsETATkosoWoHR
         BRzoJhzRi6hskg7pPSEZgOu3+OwCiecwr/6Tm8g++yYk0jI84xcUZ1YS+yqnnHkDzMPC
         xqFw==
X-Gm-Message-State: AOAM5335KhVm6tA3caRaQlUGpvptPYzKMPHmno38UXneiD2v/+oXe2vr
        X7igJyZgyZl0Gr6JKuDxmx8EhA==
X-Google-Smtp-Source: ABdhPJz4XEl+dLLGOfRROoPWM4zEB50843UCWkcV9Myxwze9zuT7lnhfAPYHX+lJLKs/8Kyb0lahLw==
X-Received: by 2002:a17:90a:19d5:b0:1bc:a5db:b655 with SMTP id 21-20020a17090a19d500b001bca5dbb655mr1327748pjj.46.1645761374562;
        Thu, 24 Feb 2022 19:56:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t190-20020a632dc7000000b003759f87f38csm897373pgt.17.2022.02.24.19.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:56:14 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Kees Cook <keescook@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lyude Paul <lyude@redhat.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Dave Airlie <airlied@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Uma Shankar <uma.shankar@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v3 0/2] drm/dp: Fix out-of-bounds reads
Date:   Thu, 24 Feb 2022 19:56:08 -0800
Message-Id: <20220225035610.2552144-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; h=from:subject; bh=bU37iCBLJ7Q70x0XEhd7PjOmH28YCUaT+vra8oA4uZo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiGFNZdsEw9YGr2OGD24Hf0kq+QV8dh1Tl0BsSDlLS Qa8/sVWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYhhTWQAKCRCJcvTf3G3AJonKD/ 9dwPGSsOpHqQ5De1f9MxlBVJY6fcHLK5tsekzkp7Nkho9GLFcV/wCa4odTI+ek/3p+TAAuY06YNpPY e2GtXNN2k1N/ScNeCVQ9tRgmqRwEVg8hkmhgTkI6cMdDVSnyWOMZpiXgGJfWshuo9yT4kAnnrL9T35 NuonIO45jrGXry/WROkxa4UTu0HNUqyfI36hke71TFsWNhMBWFBdsaUHcFw3CdNwLofm6yWegvdL6k upXRIp4OJlWrdNvpTRIn9LGq4+p6RlHibE17dzqMBAhkZqvqr9JSMAD/HXba24aIYnDtHGGdMR3rBW QrB6UmqP7HO93A2BGUkx/WnzxHJuF1ClR6XNUKghGz8ZBPdbBGehd/JzCQuJQghhS2IyrpJ2N4CiLk ckG5Mlse+9Nlon9Zr0UD4nmFHVBDLz+5CO0auzsrO93TvM3Brbj5ZsP9/6mv3xCj18QYFIXV2f/z8R m22ovOL5xu0SG2uLEPoXZRD3kLDzB6rb5RRQt6PozL4fRFufF4Pchl24Fh4yTRYaFhnTNVLCvSY+e4 CnqhcHhjE+X+n43xaOAuGZtnTxWrh20mUwWndVPSD7Cx/B4rXTCqesrZJF+s8m06eA0tuisE7j+nxb /Zggztye4Wb/Vo79hwmtVA42S20mTnykG1zZA30JuAQAyR4jKY8a/B/QOR6g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

I'm sending these again, as they still need fixing. They have been
rebased due to the drm_dp_helper code being moved into a subdirectory.

Can someone please apply these? :)

Thanks!

-Kees

v1: https://patchwork.freedesktop.org/patch/465200/
    https://patchwork.freedesktop.org/patch/465201/
v2: https://patchwork.freedesktop.org/patch/468350/
    https://patchwork.freedesktop.org/patch/468351/
v3:
 - add review tags
 - rebase to drm/drm-next

Kees Cook (2):
  drm/dp: Fix off-by-one in register cache size
  drm/dp: Fix OOB read when handling Post Cursor2 register

 drivers/gpu/drm/dp/drm_dp.c    | 10 ----------
 drivers/gpu/drm/tegra/dp.c     | 11 ++++++++++-
 include/drm/dp/drm_dp_helper.h |  4 +---
 3 files changed, 11 insertions(+), 14 deletions(-)

-- 
2.30.2

