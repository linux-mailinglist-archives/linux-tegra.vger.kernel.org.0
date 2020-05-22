Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BDC1DE8F0
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 16:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgEVO2y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 10:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgEVO2x (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 10:28:53 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FB3C061A0E
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:53 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s21so13304405ejd.2
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptzda0E87vqQRukvOx/HdBlcj7KEsS0MgYblNCM3BOI=;
        b=NHyW1sZLVrVZVByX4kmAj8FQ2Ogw7wF+jtwao+jTBubihmeSPWi9qTzgxvaBAGhwmv
         WfzCUFD66Q8jKhXwWzqEHyLFRwpyOYX6wOf1UCsv8JXgzwBnpxy8tfQRHfeRBoCKJt1/
         s07GLF4A307NYAPK5qKNFG9wcQMpydh9+y2TsOvgcbcJMuMoDhNjME29mMUi0B5N4F6E
         /GYaiYWCXY4loD4nqqHfrhgbxEfqjMlqPVSA8oB2caiPh/xqQvBVA3JItAFOvXxH8vV7
         94ltogcEZxCWIPxygbvkXo+B9opdyyZrbn10AIqiR3t4cLpzUiXOeeniTOzyNON7I8fp
         UIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptzda0E87vqQRukvOx/HdBlcj7KEsS0MgYblNCM3BOI=;
        b=XoWJyBQwPPnDR6QXD/5GlFB3vrpZEIcLQjayTx0Ku0CkN59xSb/4tYe1H/R6HKlXvV
         TjcvXe/uoyPNiDByNu6bu4u8SDOjQBjLD/a3tXqX/rE2LuheZTZ2tSB4HfrNsXCAgj+M
         7VsofGhdcZxu5ekGbOfbs2cVGJzca+tLnSd3MQB0061nB2W9Nacz+FSE5vwu6s8nIqF8
         RewoPWGql1BLXWh/SMpsNWm4lmIjCcANCyYI//7Z6ZRy0YI1SeLQqjs7t9X61+FnbSuQ
         991lxI611iwMnoCDN44qS2fAydWOxrjCSki9pOrFLuDr49Afj9UHocQCqPGi5Y7w9PgA
         hxyw==
X-Gm-Message-State: AOAM532DwuHzZKe+Ul6N4Sf0k4HyWW+6tjQajz887AvGgbR3YoQQ2OTF
        v4WPkOQ1XytNyEBSFfV1rJQ=
X-Google-Smtp-Source: ABdhPJwDzdf5ppOZcQl4uGIP2iE6sUMhriuFMFXFwXp1LTm+BWvx8UcLPq/Zdkf3faZMYkS0SrzcvQ==
X-Received: by 2002:a17:906:24cf:: with SMTP id f15mr8943252ejb.467.1590157731622;
        Fri, 22 May 2020 07:28:51 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id t23sm6898512edr.71.2020.05.22.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:28:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 05/11] firmware: tegra: Changes for v5.8-rc1
Date:   Fri, 22 May 2020 16:28:44 +0200
Message-Id: <20200522142846.2376224-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-6-thierry.reding@gmail.com>
References: <20200515145311.1580134-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-firmware-v2

for you to fetch changes up to 10b2006681333a14a907a06a0e213c568fa8e7f4:

  firmware: tegra: Defer BPMP probe if shared memory not available (2020-05-22 14:57:14 +0200)

On top of the previous pull request this contains an additional fix from
Jon for an issue that our test system discovered in a recent linux-next.

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.8-rc1

This contains a change that makes the BPMP driver a regular driver,
which fixes some weird suspend/resume ordering issues. Another fix is
also included to implement another way of enabling the L2 cache after
LP2 suspend.

----------------------------------------------------------------
Dmitry Osipenko (1):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend

Jon Hunter (1):
      firmware: tegra: Defer BPMP probe if shared memory not available

Thierry Reding (1):
      firmware: tegra: Make BPMP a regular driver

 drivers/firmware/tegra/bpmp-tegra186.c       |  4 ++--
 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 4 files changed, 25 insertions(+), 10 deletions(-)
