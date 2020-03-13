Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5A5184D4A
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgCMRKq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 13:10:46 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45903 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgCMRKq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 13:10:46 -0400
Received: by mail-wr1-f46.google.com with SMTP id t2so3004585wrx.12
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tdb2mFLTWBsI5o+oIoQjLHbItACHhPQ4U5Gl27b7t0I=;
        b=b5LtUyvYcaPt/25D/uGbyW9tRGXLz+JpY7ph7XJRep6cngkbEueabaU0ji2XUDe2/G
         0mKzNlsmQqRjQIvVMSRyJsMBvTHSl8u9zyFT+DOn0wevpEHeMFYRxPaUary9tofClv3N
         JeOs3WJJ4QtyQauHqPUBCq8dn24hUjyiB80emGPKNDeOxZkUfFwgZOupI+Fuad7mNaSu
         VKuJxGcy0efp5/3uUFwoVayPuXRMelq1wCXlsYeydp4OpY/xthBxd8tPn3Fgp1+5u0fg
         vxQsBCgQlTu3SdD1HX1lxe0vorI0WdVIqV3DcdnaqZKSagAYV7Sx7N97w9IfoBed8QVI
         5V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tdb2mFLTWBsI5o+oIoQjLHbItACHhPQ4U5Gl27b7t0I=;
        b=or8k9M/ZqqSfZxWE7rgVNOXXtd46k/UjeowcSirXnW5U5d6xafLTAeWA2y+XcA1UEu
         g8W16vsE38CPip3XRBA9AOzOY5eLzPYOq2Y5xPFbU6YOogSepN9xsWZVs7H6CIwfxfLE
         AtSWOu4urqQQ7pz7xRkrIePuN5RGL0ekU2Q3nCoG0ycpTiv3kmrMZFshjZFNjDdUPCgs
         aORp3g1QU1g7A948JoHBhXpiDCMBOLL/3v4kBsb6XeN1O5L3xkmUQa4Nf2IUJxYsR8eH
         c8g389IUxXMuGvoYlZPwLc7bYEW7VPD+got84hOOgioYURsFvuYJiBlMzZDBTJLmg4vB
         1vhg==
X-Gm-Message-State: ANhLgQ2wnWl95CcsWWqON4w2T3tQttSfgYMZw4EktgMH9DSbonR8r/PM
        n3NXiCfWHufv7O0h9QfeiUw=
X-Google-Smtp-Source: ADFU+vtZiUmrNqKbLc2BlE0O/gbSVFFhhgSKhyOz5oFO5bE/9gj9Yc5QFwFpou47EO+a+BdAW3xZzw==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr18471467wrn.319.1584119444211;
        Fri, 13 Mar 2020 10:10:44 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id a73sm1621805wme.47.2020.03.13.10.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 10:10:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 18:10:42 +0100
Message-Id: <20200313171042.2924890-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-rc1

for you to fetch changes up to e32c8c2a5fbe1514e4ae9063a49e76ecf486ffb8:

  drm/tegra: hdmi: Silence deferred-probe error (2020-03-13 18:03:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.7-rc1

This contains some minor cleanups, nothing too exciting.

----------------------------------------------------------------
Dmitry Osipenko (4):
      drm/tegra: dc: Use devm_platform_ioremap_resource
      drm/tegra: dc: Release PM and RGB output when client's registration fails
      drm/tegra: dc: Silence RGB output deferred-probe error
      drm/tegra: hdmi: Silence deferred-probe error

 drivers/gpu/drm/tegra/dc.c   | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 14 deletions(-)
