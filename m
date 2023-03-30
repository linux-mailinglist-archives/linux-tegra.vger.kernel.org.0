Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF766CFE6E
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Mar 2023 10:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjC3IgQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Mar 2023 04:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbjC3IgL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 04:36:11 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF51B6EB4
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 01:36:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AC85F219FE;
        Thu, 30 Mar 2023 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680165368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=prc8SEhYyhNSt3X1QSGKo4Ub8nWmTh1lDEZAJiIba/0=;
        b=QgNsjpM8BLb9BdHCw4LFvX6aBdBwPBh5sHRDQmxHUnZVCdgoEgu7CINgR8mVvBwitYIRfy
        VfA8ewwEliLWAbSRtMZA+N8kmKiOuQcTgeiefy20FR81fwZUWDFAgOmZVXOMZCMvRzaRgF
        HJpxkqDeuc7fKyhNGEVbx/Uh5tOMY14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680165368;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=prc8SEhYyhNSt3X1QSGKo4Ub8nWmTh1lDEZAJiIba/0=;
        b=cZunbX0Ux6PY4cO9SCwLIP1JGVolY1+QZpLhPdjEgMJbJbUeMajZv6YpxDIeLHfgqm87YC
        z+rmjqgbo6nG8tBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D44A138FF;
        Thu, 30 Mar 2023 08:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id d4NYHfhJJWQHHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:08 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] drm/tegra: Convert fbdev to DRM client
Date:   Thu, 30 Mar 2023 10:36:00 +0200
Message-Id: <20230330083607.12834-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert tegra's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in tegra is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (7):
  drm/tegra: Include <linux/of.h>
  drm/tegra: Include <linux/i2c.h>
  drm/tegra: Removed fb from struct tegra_fbdev
  drm/tegra: Remove struct tegra_fbdev
  drm/tegra: Hide fbdev support behind config option
  drm/tegra: Initialize fbdev DRM client
  drm/tegra: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/tegra/Makefile |   2 +
 drivers/gpu/drm/tegra/drm.c    |  23 +---
 drivers/gpu/drm/tegra/drm.h    |  27 ++--
 drivers/gpu/drm/tegra/fb.c     | 242 +--------------------------------
 drivers/gpu/drm/tegra/fbdev.c  | 240 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/output.c |   3 +
 drivers/gpu/drm/tegra/rgb.c    |   1 +
 7 files changed, 265 insertions(+), 273 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/fbdev.c

-- 
2.40.0

