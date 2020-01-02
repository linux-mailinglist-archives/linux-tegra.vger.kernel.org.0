Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D8A12E69F
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Jan 2020 14:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgABNXM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 Jan 2020 08:23:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59912 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728298AbgABNXM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Jan 2020 08:23:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 202DE28A04E
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eric Anholt <eric@anholt.net>, Shawn Guo <shawnguo@kernel.org>,
        kernel@collabora.com
Subject: [PATCH 0/4] Complete ddc symlink addition
Date:   Thu,  2 Jan 2020 14:22:56 +0100
Message-Id: <20200102132300.24309-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The series completes the process of adding ddc symlink in connector's
sysfs directory: of the initial submission only the below patches are
still pending, hence this resend. Rebased onto drm-misc-next as of
2020-01-02.

Andrzej Pietrasiewicz (4):
  drm/tegra: Provide ddc symlink in output connector sysfs directory
  drm/vc4: Provide ddc symlink in connector sysfs directory
  drm: zte: Provide ddc symlink in hdmi connector sysfs directory
  drm: zte: Provide ddc symlink in vga connector sysfs directory

 drivers/gpu/drm/tegra/hdmi.c   |  7 ++++---
 drivers/gpu/drm/tegra/sor.c    |  7 ++++---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++----
 drivers/gpu/drm/zte/zx_hdmi.c  |  6 ++++--
 drivers/gpu/drm/zte/zx_vga.c   |  6 ++++--
 5 files changed, 24 insertions(+), 14 deletions(-)

-- 
2.17.1

