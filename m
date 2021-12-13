Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DFC4724C2
	for <lists+linux-tegra@lfdr.de>; Mon, 13 Dec 2021 10:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbhLMJi0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Dec 2021 04:38:26 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:37742 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhLMJgz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 04:36:55 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 22C4B210DB;
        Mon, 13 Dec 2021 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1639388214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=/zRZkx8PjhgmeuS4SLLQwqHLtqLPK1ATN5cfwzP7njM=;
        b=eNBIPLjSHtRtDSCiX6eQ6wrYSbf22O+r1BSjToSx/C+TZmLd7inQA7WAE0Im9NLV2ig4Gr
        foPoUjCEK6OS6QKzbsTDMQ4K1O6ZN6j4L4gCgQQYR9aAdvueImBbdBOnGtJmwbYhW2HKV6
        m4xT+3dH2czYlKFwqbt5hRZq/iOIW64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1639388214;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=/zRZkx8PjhgmeuS4SLLQwqHLtqLPK1ATN5cfwzP7njM=;
        b=ata7Up89xhbqS9ln84M8o269HDt/H1zncNbkRD4IE4k6iy8HkpMpxF6MYDz7oxzit6Q5O2
        mFr4NBkPeJyeigAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFD9F13CCB;
        Mon, 13 Dec 2021 09:36:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ToPSMTUUt2E+JwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 09:36:53 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     mripard@kernel.org, maarten.lankhorst@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm/dp: Move DisplayPort helpers into own module
Date:   Mon, 13 Dec 2021 10:36:47 +0100
Message-Id: <20211213093650.19598-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Split-off DisplayPort functions from KMS helper library and move them
into their own module. Reduces the size of drm_kms_helper.ko by ~50%.

This patchset is part of an on-going effort to reduce the minimum
binary size of the DRM core and helpers. It's helpful for systems with
early-boot DRM graphics, which requires DRM to be linked into the
kernel image.

Thomas Zimmermann (3):
  drm/dp_mst: Remove trailing whitespace.
  drm/dp: Move DP declarations into separate header file
  drm/dp: Move DisplayPort helpers into separate helper module

 drivers/gpu/drm/Kconfig                       |  8 ++++++
 drivers/gpu/drm/Makefile                      | 14 ++++++----
 drivers/gpu/drm/bridge/Kconfig                |  4 +++
 drivers/gpu/drm/bridge/analogix/Kconfig       |  2 ++
 drivers/gpu/drm/bridge/cadence/Kconfig        |  1 +
 drivers/gpu/drm/drm_crtc_helper_internal.h    | 27 ------------------
 drivers/gpu/drm/{drm_dp_helper.c => drm_dp.c} |  2 +-
 drivers/gpu/drm/drm_dp_aux_dev.c              |  2 +-
 drivers/gpu/drm/drm_dp_helper_internal.h      | 28 +++++++++++++++++++
 drivers/gpu/drm/drm_dp_helper_mod.c           | 22 +++++++++++++++
 drivers/gpu/drm/drm_dp_mst_topology.c         |  4 +--
 drivers/gpu/drm/drm_kms_helper_common.c       | 14 ----------
 drivers/gpu/drm/i915/Kconfig                  |  1 +
 drivers/gpu/drm/msm/Kconfig                   |  1 +
 drivers/gpu/drm/nouveau/Kconfig               |  1 +
 drivers/gpu/drm/rockchip/Kconfig              |  1 +
 drivers/gpu/drm/tegra/Kconfig                 |  1 +
 drivers/gpu/drm/xlnx/Kconfig                  |  1 +
 18 files changed, 83 insertions(+), 51 deletions(-)
 rename drivers/gpu/drm/{drm_dp_helper.c => drm_dp.c} (99%)
 create mode 100644 drivers/gpu/drm/drm_dp_helper_internal.h
 create mode 100644 drivers/gpu/drm/drm_dp_helper_mod.c


base-commit: 3f422828221d9ceefcddef0be33561b1646a1cbe
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.34.1

