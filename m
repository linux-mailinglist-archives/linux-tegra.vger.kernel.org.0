Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5AAECF40
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKBOpe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:34 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54712 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id c12so7697038wml.4
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+c6JA866ZsshhQV7b+6UdNrWp/cQGsISTbLdkXsyrw=;
        b=kG1b8nSfc+7pfwklgIVovNo8OzY7JYqaaklfQ35aZ89l165ub7TaXe9ES4fh8qvTz1
         k9Qi7nz009XH35TFFn87khzjWonTHHS1vOM8/uRkqICMYoLWe/LAf6evX7c3z2/mH8gD
         a2Ox6KkoJYjPpra0EKeUzOqEpz1isGb7PmcR5NBHaSR5K4YuyGGArPWxqQkHWaQ03vZL
         Dwt3urKrwws0LpiP8DpKObcsSLNHq0qJOAK/SKcA3vSuL2EgQrB22L+a9EmiAoj0+2JB
         H8mCv68jh9rNiZS/U2cJOBqA1+jEHtoGwpjHBBvjd+JPbsjsuQruFbDOqM9nWeSTY8Jr
         C+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+c6JA866ZsshhQV7b+6UdNrWp/cQGsISTbLdkXsyrw=;
        b=YKtGRw7HNZvq04K+VGpRdE+ajB99RY3OXpmMnE3BAiK8IRf2zzzkL8INfS3HyP1OOY
         7qtnjDdQdjF+o9Sd8/9gZf47UqbgkjVOnYlGUzTWeXNYYrTsGYiQzJwx44O6u9u+hAXM
         u41ywxOM6oWiSIzzhmPUVPzuM2tyBlgTsNyJWKuNy1b1VhswjXIn45MAg8CvWcNov+g8
         g8dXPCunZEUb0fQxwqay9hPSDneqxYG5sKUjVBkS6qMSM/Y0ugrTqHtFux6/0hWlUroZ
         SLhbbtK4yYvtfiDGKM/BenBvizXZt4x2wUtMn4z8kxRJwOEq4to577TJSN5UuO8CK/g+
         LzGw==
X-Gm-Message-State: APjAAAXfTl1tCZYABYH6mxTwi0ckym7WiW88vVvXfBqBFCcBcviggIor
        pSOMv2vVKkIFFDhv0cM6SecVvN1q
X-Google-Smtp-Source: APXvYqyRFSezm7QaTZ6i0UVZvaed0y1Z8d84UQscxrJkRYb+LggIyyADKx8sZT72Fbf3ig+0kVihMw==
X-Received: by 2002:a05:600c:2054:: with SMTP id p20mr2529711wmg.177.1572705930388;
        Sat, 02 Nov 2019 07:45:30 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w15sm10926330wro.65.2019.11.02.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] soc/tegra: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:17 +0100
Message-Id: <20191102144521.3863321-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-soc

for you to fetch changes up to 69dfb3d4a89afccca1d8f282e49ad1362100cc43:

  soc/tegra: pmc: Remove unnecessary memory barrier (2019-10-29 14:36:24 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.5-rc1

Adds wake event support on Tegra210, implements the NVMEM API for the
Tegra FUSE block and adds coupled regulators support for Tegra20 and
Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (4):
      soc/tegra: regulators: Add regulators coupler for Tegra20
      soc/tegra: regulators: Add regulators coupler for Tegra30
      soc/tegra: pmc: Query PCLK clock rate at probe time
      soc/tegra: pmc: Remove unnecessary memory barrier

Nagarjuna Kristam (1):
      soc/tegra: fuse: Add FUSE clock check in tegra_fuse_readl()

Sowjanya Komatineni (4):
      soc/tegra: pmc: Support wake events on more Tegra SoCs
      soc/tegra: pmc: Add wake event support on Tegra210
      soc/tegra: pmc: Configure core power request polarity
      soc/tegra: pmc: Configure deep sleep control settings

Thierry Reding (5):
      soc/tegra: pmc: Fix crashes for hierarchical interrupts
      soc/tegra: fuse: Restore base on sysfs failure
      soc/tegra: fuse: Implement nvmem device
      soc/tegra: fuse: Add cell information
      soc/tegra: fuse: Register cell lookups for compatibility

 drivers/soc/tegra/Kconfig              |  10 +
 drivers/soc/tegra/Makefile             |   2 +
 drivers/soc/tegra/fuse/fuse-tegra.c    | 198 +++++++++++++-----
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 154 ++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          |   8 +
 drivers/soc/tegra/pmc.c                | 232 +++++++++++++++++++--
 drivers/soc/tegra/regulators-tegra20.c | 365 +++++++++++++++++++++++++++++++++
 drivers/soc/tegra/regulators-tegra30.c | 317 ++++++++++++++++++++++++++++
 8 files changed, 1212 insertions(+), 74 deletions(-)
 create mode 100644 drivers/soc/tegra/regulators-tegra20.c
 create mode 100644 drivers/soc/tegra/regulators-tegra30.c
