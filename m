Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFC110CBD5
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1Php (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:45 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32934 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Php (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so2024171wrq.0
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1SdMph8FVvbQeSK/Cyne8SZbjvXawAhr1q5uC5aFnkU=;
        b=lLcMSCfmsbUiEboWC1hF5Zbsyq0iB/mvezOUgSA1NvK8XDDnC4KTqbjXowBkxabYl0
         3UNksXsZOfwuRi1lR3amCD5EYqiZ/9Rd0XZTRHM3qDTyuiFDQ2zjNDgG2dmSIhikwuFb
         GdT3/tgbNcxvpFZPcKZKIzuXfQ2I4XtBFcbxfgPbLITWsxkcAG4okxZkIxPCG4GTFQgU
         8nVAqr+3GH6amhx1bP/f3ALtpHbvHNUYEVS9Kg60UvSxE6FGS9veO+r7+xyKSxNEHjaT
         Nw+YVHECkHRRyz0KjwrqO1pJ9kE7LPP4QsJjf8xriP2mytCWH4RtVLiS6KaFqNnWCDdM
         9y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1SdMph8FVvbQeSK/Cyne8SZbjvXawAhr1q5uC5aFnkU=;
        b=dHnfnjSnF8/9kV0TrJWdtLl2bD0yAyyduLI8hL9DViD8s4UDp6MJvUPI+uIERkCIhy
         XNm7nEGg01jKs282hd2wwEDmhuDxD1tTW9GW/d7OzMU7eXmsn8k57f7Coxry178mvPEp
         S3hA2gn6W117EZYL/j2Q4bOy53vLwr7i+qHV4WeoUZ33IWOEme7fQK7sfkGTAptYGpXr
         2WLSW4h/2IJyMgp/ynu2Jf+dZsrm4HK/piwQosMMDP4ZVVmScis5VUv2mYOYIz/yGS1P
         qk1IlbU4shVIB3BTLDUosq27k0Uw+kbNh8rwReq01dS+Xd3tKIeAxYeqMyLansqlARDp
         sU6A==
X-Gm-Message-State: APjAAAWIjj46ye1w6oBgrgHcc9c1vHH/DddhKGxdgSHCwV3d2YTo04ky
        6AAYwPB2WJy8tM65DlEJZa4=
X-Google-Smtp-Source: APXvYqwBpUgV77jj7cTZMOg99X05q5TVJTLTT6smw7h/84zysD2GvlUi3ndErE/umY0Fysxu4xVilQ==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr48793086wra.303.1574955463513;
        Thu, 28 Nov 2019 07:37:43 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id u22sm4670323wru.30.2019.11.28.07.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:42 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 0/9] drm/tegra: Miscellaneous fixes
Date:   Thu, 28 Nov 2019 16:37:32 +0100
Message-Id: <20191128153741.2380419-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Here's a random assortment of fixes for issues that I ran into as I've
been testing suspend/resume and other things recently.

Thierry

Thierry Reding (9):
  drm/tegra: hub: Remove bogus connection mutex check
  drm/tegra: gem: Properly pin imported buffers
  drm/tegra: gem: Remove premature import restrictions
  drm/tegra: Use proper IOVA address for cursor image
  drm/tegra: sor: Implement system suspend/resume
  drm/tegra: vic: Export module device table
  drm/tegra: Silence expected errors on IOMMU attach
  drm/tegra: dpaux: Add missing runtime PM references
  drm/tegra: sor: Make the +5V HDMI supply optional

 drivers/gpu/drm/tegra/dc.c    | 18 ++++++-------
 drivers/gpu/drm/tegra/dpaux.c | 16 +++++++++--
 drivers/gpu/drm/tegra/drm.c   |  4 +--
 drivers/gpu/drm/tegra/gem.c   | 50 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/hub.c   |  3 ---
 drivers/gpu/drm/tegra/sor.c   | 38 ++++++++++++++++++++++----
 drivers/gpu/drm/tegra/vic.c   |  7 ++---
 7 files changed, 104 insertions(+), 32 deletions(-)

-- 
2.23.0

