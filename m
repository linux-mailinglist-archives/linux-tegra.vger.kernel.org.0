Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EACB1D5294
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEOOxh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:36 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D5EC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l17so3903982wrr.4
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hFErko6oApY1WR8Z0RQQ5LiGOdx/Qs4fdvpGN2oBVzw=;
        b=QIaa2m61eOA6xnHbRyTBYzdPm5ZlvyRxokIYG7BW+jKehRaevn/wzmjbE6BEwnOBNd
         Gcq9R+iSLYX/7cuszr0R0Xlxe1cdro1T6llf+ZFJnjS7fdhw8Wg4lssPFDGKYKzgPxbC
         oDAVOsCs816dklIwmsX91J27IKvYn+t7WF5TylhJHYYG9ZUSyN/zd5v9X76tv/7wC+cb
         5xvpBB+yrL17nFgaa2cId0fudZKGEsULfGKx9Y8fTZY8lhirn3tVNBm0dff0lKYpnSET
         crU3rMEqBO5D5KNmWiNQbqgABUgLkHerjLjaBlhmgt2y4UFxsXp1HvkvHqYYbNHmQ/NZ
         iHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hFErko6oApY1WR8Z0RQQ5LiGOdx/Qs4fdvpGN2oBVzw=;
        b=XQde6cwIqNQGmE4o3989EC9bHmN2btqhIyYtYNmsn+AFZs51+4XWahP9yuPj+813yq
         UB0NDdxo2j3497dWiQC0uhytRMAhRUCPdijDKS/6MPCoPmdPmHc4MnggbohkKEsX+84v
         x0f0HQZvtp3/KlLM1XhsV0AQAlve9ByG35whVKc6f0bhov/BCWdVyOMgkFL/RIX16MxF
         gqIdmNT1bx1Px6ABDdOjRyKyQgO4/4KaGdgu0x7h8ceSTcp4gRpZfCfwEf9WLxIz6lC+
         ZASBOwrfkWyxa3Ww6RB7lDYJqIj7cejqqWvK1RVcy8vZTxHIXztFTsb0sJyFSA062yEK
         Edbg==
X-Gm-Message-State: AOAM530avZm4i1KAvqVE9DyxqvuH9bMvDXs+Df3qBVUHWzw2bY7aTkWe
        BDK8RtlB7kZkVHrkUJkewns=
X-Google-Smtp-Source: ABdhPJxmgPS+JsABywd/aVmVSDGV8AuyQdMt9JGh6zCwSrs13XcQcuXcJRNs3tn8jSXAwTDatsqw7w==
X-Received: by 2002:adf:f48b:: with SMTP id l11mr4587640wro.312.1589554414734;
        Fri, 15 May 2020 07:53:34 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id x24sm4269257wrd.51.2020.05.15.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 10/11] ARM: tegra: Device tree changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:10 +0200
Message-Id: <20200515145311.1580134-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm-dt

for you to fetch changes up to 94ea9681a9f5c7a72ae63c015e44a02530927b61:

  ARM: dts: tegra30: beaver: Add CPU Operating Performance Points (2020-05-06 19:02:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.8-rc1

This contains a bit of cleanup and CPU frequency scaling support for the
Tegra30 Beaver board.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: dts: tegra30: beaver: Set up voltage regulators for DVFS
      ARM: dts: tegra30: beaver: Add CPU Operating Performance Points

Rob Herring (1):
      ARM: tegra: Kill off "simple-panel" compatibles

 arch/arm/boot/dts/tegra114-dalmore.dts         |  3 +-
 arch/arm/boot/dts/tegra124-venice2.dts         |  2 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts  |  2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts     |  2 +-
 arch/arm/boot/dts/tegra20-harmony.dts          |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts      |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts            |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts         |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts          |  2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts      |  2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts |  2 +-
 arch/arm/boot/dts/tegra30-beaver.dts           | 40 ++++++++++++++++++++++++--
 arch/arm/boot/dts/tegra30-cardhu.dtsi          |  2 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts  |  2 +-
 14 files changed, 50 insertions(+), 17 deletions(-)
