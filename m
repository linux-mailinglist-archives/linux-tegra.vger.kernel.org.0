Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44651DE8F1
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 16:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgEVO24 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 10:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgEVO2z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 10:28:55 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCB5C061A0E
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d24so9367752eds.11
        for <linux-tegra@vger.kernel.org>; Fri, 22 May 2020 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WI4+/uH938EIDn69nDQS6vmjp90OmdUCi8WdIQDbQo0=;
        b=vdqSIsZIFtJtuZIAM4bIPwpqWIqdva/j/NLNJ87Kk6jfrjJKLGfmmJFbO6aUs5zxUM
         iPatkRMHPgcKePxrjW4pgYiNO2Lc+4ZkMmuczfSeWosrV8g3Tf97FwOEX8OaUsvYnaeq
         0YgkgXltn+KVFP+AMhRcCQoYDZbnIAgRfDo0rVqY0ZAVg63ja0tqXL6+IQyJLHPLpizY
         DuNwDVge7Ha59fuMTZOuRYq6AVlmJP53lXuddoQSaKo+3SYpGblv32nrwKuTH72Ke1Rv
         EhyU3tquIEs4PecoTM+GoAm57mWOJ9bCqJ+D7BKNXmROoIeD8fmGwtegtpL+k73BpIcv
         KPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WI4+/uH938EIDn69nDQS6vmjp90OmdUCi8WdIQDbQo0=;
        b=mkzX/ez41x6lI5N9q2EgPSUHNEq1x8DFDtwDH0+MBfOqaE5GbtcN5zm39EPsHaWP/q
         GW8V6Yu3TL6vjahJVA8OwkyBneolQHVQ+wkiawx41ozSKJqf4A3PbiXgEtNQveSPCBLH
         LImvtD+7CO/AcM52cpmfkqZWtpXsehnBzwzxMG53bWppLZyIJLE0dZFi78LXlvYGBYIl
         jrft+OzA+KEMR827bkfSXEemUhDMGOe5g9Q3EmOZVW/bTTqcVfmikRMBxkeZTGu5EK4q
         tBok+752MfuM8Gt/xKz98pO19GdYObjMRbXfGqYniZ5SF7+gfMF0UhsIsJ0GVaLnHH7G
         C4sA==
X-Gm-Message-State: AOAM530kU2ZqwNJpdVL6RT49Z+w8lASJxl0C9uuzYs7BzZrgDjrlV0xm
        d4wpIbpq5VejX0HlWXwOUuQG930n
X-Google-Smtp-Source: ABdhPJx/BfuIcHzgOQ4mWrsqkbb6uvS3caDGtihgw2Om1uuNNfC3hPSGjG+mAUQWd8EGgBR+Ohzk5w==
X-Received: by 2002:a50:f40d:: with SMTP id r13mr3015576edm.93.1590157733924;
        Fri, 22 May 2020 07:28:53 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id mb1sm8492656ejb.109.2020.05.22.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:28:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 08/11] soc/tegra: Changes for v5.8-rc1
Date:   Fri, 22 May 2020 16:28:45 +0200
Message-Id: <20200522142846.2376224-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-9-thierry.reding@gmail.com>
References: <20200515145311.1580134-9-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-soc-v2

for you to fetch changes up to df701a76a6419e66b566457a5b3fcdd314e48fd9:

  soc/tegra: pmc: Enable PMIC wake event on Tegra210 (2020-05-22 14:55:54 +0200)

On top of the previous pull request this contains a missing patch to
enable resume from suspend by the PMIC, like we already do an Tegra186
and Tegra194.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.8-rc1

Enables Tegra210, Tegra186 and Tegra194 to be woken from suspend by the
PMIC and exports a bit more information about SoCs via sysfs.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: tegra: Fix tegra_pmc_get_suspend_mode definition

Corentin Labbe (1):
      soc/tegra: pmc: Select GENERIC_PINCONF

Jon Hunter (5):
      soc/tegra: fuse: Add custom SoC attributes
      soc/tegra: fuse: Trivial clean-up of tegra_init_revision()
      soc/tegra: fuse: Update the SoC revision attribute to display a name
      soc/tegra: pmc: Enable PMIC wake event on Tegra194
      soc/tegra: pmc: Enable PMIC wake event on Tegra210

Thierry Reding (1):
      soc/tegra: pmc: Enable PMIC wake event on Tegra186

 drivers/soc/tegra/Kconfig              |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c    | 57 +++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 ++++
 drivers/soc/tegra/fuse/fuse.h          |  8 +++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 32 +++++++++++--------
 drivers/soc/tegra/pmc.c                |  3 ++
 include/soc/tegra/pmc.h                | 15 +++++----
 8 files changed, 103 insertions(+), 20 deletions(-)
