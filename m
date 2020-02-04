Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D036151BB9
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 14:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgBDN7f (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 08:59:35 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41303 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbgBDN7f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 08:59:35 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so23178149wrw.8
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2020 05:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xo1vD3bli406eUVIXbkQ0Zqxke8qKNMVbFU2u7O6vqk=;
        b=g3wd6YoEdjx+1f/jDqUF+fmNAN+7pQJT9H3uOU7aAc1X/QaBA/HKHmhzHv6I7AlaVo
         TiCQLQGe/HN2oOoOucyfSJCveHCISRGj2WKK2UjvGgKCe4CzJy2WqAsYsP99E8a5lEry
         a84D0McZP0f6hEKFIv5niXFxgfJz26u8uJVaNHg26iydajMIqxvK+K04I7hRsLJ0qIcD
         38gk4HwAcEk09zdF6G7Gtf3DWllj4bAEEGz2SblRuxGb0xeaXP8DTVSzBi6mMdfKxBWk
         FFJm5hFVB5Amtx+xPwJPw95ySEceqJiBDB6I7VYdbfZ7S5q3wJDbFanJophfryMmoX2O
         fsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xo1vD3bli406eUVIXbkQ0Zqxke8qKNMVbFU2u7O6vqk=;
        b=eeTfiwnpwF+BEYQ+PGzH+/Ns9XPxtvTg4uL3hJ6AC/WqIBy/J8rkK15Gf0EzxEp7p/
         eln/4DMGwXKd7MQvB5aEMwaBr05X42Qlhm9GXnlYXu9eiVvDobs2jp4vpLfKQImWZskL
         LZS2a0R1tw917L07KKz+3ky8zCQD2bTaOOxlM6K1ty1d27KQMtoY5RpRZpAVNLHO2X4f
         iWuvtPBbbROJrcqRsxMy2K/xfCWcZhGoIGRfR25SI5udNb1qgOjng2lOuWWvPQVTf7F+
         W0AHcZSPvR0TtuAJ57p9mJmOi3RhLh8dAUVVGApnHt87OQIiYM9zf4ySjfeoWj8ehQlh
         fBDg==
X-Gm-Message-State: APjAAAW1/LjE6JnRxNf/RHnjol7RsBB/nOqhkQv3abyVYyfoIp91uRH9
        Fhz3SvK+4kWzAYm7+PCYkH4=
X-Google-Smtp-Source: APXvYqzjfJsFs9scrTrfr6ES22T61+rUZj6CciAgIfYGpGmGcd5Dv9OkXlKme4iqb7T69j36fu3tAQ==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr22306786wrc.14.1580824773351;
        Tue, 04 Feb 2020 05:59:33 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id q3sm3753081wmj.38.2020.02.04.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 05:59:32 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/tegra: A couple of fixes for v5.6-rc1
Date:   Tue,  4 Feb 2020 14:59:23 +0100
Message-Id: <20200204135926.1156340-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this contains a couple of fixes for a DMA API performance regression
that was introduced in v5.5 for older Tegra devices. Patches 1 and 2
will likely have to be backported to v5.5.

Thierry

Thierry Reding (3):
  drm/tegra: Relax IOMMU usage criteria on old Tegra
  drm/tegra: Reuse IOVA mapping where possible
  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 +++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++--------------
 drivers/gpu/host1x/job.c      | 34 +++++++++++++++++++++---
 4 files changed, 96 insertions(+), 41 deletions(-)

-- 
2.24.1

